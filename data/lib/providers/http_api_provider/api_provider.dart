import 'dart:convert';
import 'package:data/data.dart';
import 'package:data/entities/entities.dart';
import 'package:domain/domain.dart' as domain;
import 'package:core/core.dart';
import 'package:domain/report/report_library.dart';
import 'package:http/http.dart' as http2;
import '../../queries/api_query.dart';
import 'package:openid_client/openid_client.dart';

class ApiProvider {
  final MapperFactory _mapper;
  final ApiProviderBase _apiProviderBase;

  ApiProvider({
    required MapperFactory mapper,
    required ApiProviderBase apiProviderBase,
  })  : _mapper = mapper,
        _apiProviderBase = apiProviderBase;

  Future<List<domain.ReportModel>?> getAllTrashReports() async {
    final String authKey = await SecureStorageProvider().getJwtToken();

    Map<String, String> headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'auth-token': authKey.toString()
    };
    try {
      http2.Response response = await http2
          .get(Uri.parse(HttpApiConstants.fullTrashUrl), headers: headers);
      List<ReportModel> convertedResponse = List<ReportModel>.from(
              jsonDecode(response.body).map((x) => ReportModel.fromJson(x)))
          .toList();
      return convertedResponse;
    } catch (error) {
      return null;
    }
  }

  Future<ReportModel> getOneTrashReport(String refId) async {
    Map<String, String> headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'refId': refId
    };
    http2.Response response = await http2.get(
      Uri.parse(HttpApiConstants.fullOneTrashReportUrl),
      headers: headers,
    );
    ReportModel convertedResponse =
        ReportModel.fromJson(jsonDecode(response.body));
    return convertedResponse;
  }

  Future<List<ReportModel>> getAllRemovedReports() async {
    final String authKey = await SecureStorageProvider().getJwtToken();

    Map<String, String> headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'auth-token': authKey.toString()
    };
    http2.Response response = await http2.get(
        Uri.parse(HttpApiConstants.fullRemovedReportsUrl),
        headers: headers);
    List<ReportModel> convertedResponse = List<ReportModel>.from(
        jsonDecode(response.body).map((x) => ReportModel.fromJson(x))).toList();

    return convertedResponse;
  }

  Future<List<domain.ReportModel>> getAllVisibleTrashReports() async {
    http2.Response response =
        await http2.get(Uri.parse(HttpApiConstants.fullVisibleTrashUrl));
    List<ReportModel> convertedResponse = List<ReportModel>.from(
        jsonDecode(response.body).map((x) => ReportModel.fromJson(x))).toList();
    return convertedResponse;
  }

  Future<List<domain.ReportModel>> getAllDumpReports() async {
    final String authKey = await SecureStorageProvider().getJwtToken();

    Map<String, String> headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
      'auth-token': authKey.toString()
    };
    final List<dynamic> response = await _apiProviderBase.get(
      null,
      ApiQuery(
        body: null,
        params: headers,
        endpointPostfix: HttpApiConstants.dumps,
      ),
    );

    final List<ReportEntity> convertedResponse = response
        .map((e) => ReportEntity.fromJson(e as Map<String, dynamic>))
        .toList();
    return _mapper.reportMapper.fromList(convertedResponse);
  }

  Future<List<domain.ReportModel>> getAllVisibleDumpReports() async {
    final List<dynamic> response = await _apiProviderBase.get(
      null,
      ApiQuery(
        body: null,
        params: null,
        endpointPostfix: HttpApiConstants.visibleDumps,
      ),
    );

    final List<ReportEntity> convertedResponse = response
        .map((e) => ReportEntity.fromJson(e as Map<String, dynamic>))
        .toList();
    return _mapper.reportMapper.fromList(convertedResponse);
  }

  Future<(UserInfo, String?)> getUserInfo(String accessToken) async {
    Map<String, String> body = {
      "token": accessToken,
    };
    Map<String, String> headers = {"content-type": "application/json"};
    final http2.Response response = await http2.post(
        Uri.parse(HttpApiConstants.fullAuthUrl),
        headers: headers,
        body: jsonEncode(body));
    var authToken = response.headers["auth-token"];
    final UserInfo convertedResponse =
        UserInfo.fromJson(json.decode(response.body));
    return (convertedResponse, authToken);
  }

  Future<http2.Response> sendNewTrashReport({
    required String emailValue,
    required String textValue,
    required double selectedLat,
    required double selectedLong,
    required List<http2.MultipartFile> imageFiles,
  }) async {
    var request = http2.MultipartRequest(
        'POST', Uri.parse(HttpApiConstants.fullTrashUrl));
    request.headers["Content-Type"] = "multipart/form-data";
    request.files.addAll(imageFiles);
    request.fields['name'] = textValue;
    request.fields['email'] = emailValue;
    request.fields['reportLat'] = selectedLat.toString();
    request.fields['reportLong'] = selectedLong.toString();
    request.fields['type'] = 'trash';
    request.fields['status'] = 'gautas';
    request.fields['comment'] = ' ';
    request.fields['isVisible'] = 'false';

    String responseBody = '';
    int responseStatus = 0;
    await request.send().then((response) {
      responseBody = response.reasonPhrase ?? 'null';
      responseStatus = response.statusCode;
    });

    final http2.Response rspns = http2.Response(responseBody, responseStatus);
    return rspns;
  }

  Future<http2.Response> updateTrashReport({
    required String id,
    required String name,
    required double reportLong,
    required double reportLat,
    required String status,
    required String comment,
    required String isVisible,
    required String isDeleted,
    required String editor,
    required List<http2.MultipartFile> officerImageFiles,
  }) async {
    final String authKey = await SecureStorageProvider().getJwtToken();

    var request = http2.MultipartRequest(
        'POST', Uri.parse(HttpApiConstants.fullTrashUpdateUrl));
    request.headers["Content-Type"] = "multipart/form-data";
    request.headers["auth-token"] = authKey.toString();
    request.files.addAll(officerImageFiles);
    request.fields['id'] = id;
    request.fields['name'] = name;
    request.fields['editor'] = editor;
    request.fields['reportLong'] = reportLong.toString();
    request.fields['reportLat'] = reportLat.toString();
    request.fields['status'] = status;
    request.fields['comment'] = comment;
    request.fields['isVisible'] = isVisible;
    request.fields['isDeleted'] = isDeleted;

    String responseBody = '';
    int responseStatus = 0;
    await request.send().then((response) {
      responseBody = response.reasonPhrase ?? 'null';
      responseStatus = response.statusCode;
    });

    final http2.Response rspns = http2.Response(responseBody, responseStatus);
    return rspns;
  }

  Future<http2.Response> updateDumpReport({
    required String id,
    required String name,
    required String moreInformation,
    required String workingHours,
    required String phone,
    required String isVisible,
  }) async {
    final String authKey = await SecureStorageProvider().getJwtToken();

    Map<String, String> body = {
      "id": id,
      "name": name,
      "moreInformation": moreInformation,
      "workingHours": workingHours,
      "phone": phone,
      "isVisible": isVisible,
    };
    Map<String, String> headers = {
      "content-type": "application/json",
      'auth-token': authKey.toString()
    };
    var response = await http2.post(
        Uri.parse(HttpApiConstants.fullDumpUpdateUrl),
        headers: headers,
        body: jsonEncode(body));

    final http2.Response rspns =
        http2.Response(response.body, response.statusCode);
    return rspns;
  }
}
