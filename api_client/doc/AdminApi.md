# api_client.api.AdminApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**adminControllerCreateDump**](AdminApi.md#admincontrollercreatedump) | **PUT** /admin/dumps | 
[**adminControllerGetAllDumps**](AdminApi.md#admincontrollergetalldumps) | **GET** /admin/dumps | 
[**adminControllerGetAllReports**](AdminApi.md#admincontrollergetallreports) | **GET** /admin/reports | 
[**adminControllerUpdateDump**](AdminApi.md#admincontrollerupdatedump) | **POST** /admin/dumps | 
[**adminControllerUpdateReport**](AdminApi.md#admincontrollerupdatereport) | **POST** /admin/reports | 


# **adminControllerCreateDump**
> FullDumpDto adminControllerCreateDump(createDumpDto)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = ApiClient().getAdminApi();
final CreateDumpDto createDumpDto = ; // CreateDumpDto | 

try {
    final response = api.adminControllerCreateDump(createDumpDto);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AdminApi->adminControllerCreateDump: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createDumpDto** | [**CreateDumpDto**](CreateDumpDto.md)|  | 

### Return type

[**FullDumpDto**](FullDumpDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminControllerGetAllDumps**
> BuiltList<FullDumpDto> adminControllerGetAllDumps()



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = ApiClient().getAdminApi();

try {
    final response = api.adminControllerGetAllDumps();
    print(response);
} catch on DioError (e) {
    print('Exception when calling AdminApi->adminControllerGetAllDumps: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;FullDumpDto&gt;**](FullDumpDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminControllerGetAllReports**
> BuiltList<FullReportDto> adminControllerGetAllReports(isDeleted)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = ApiClient().getAdminApi();
final bool isDeleted = true; // bool | 

try {
    final response = api.adminControllerGetAllReports(isDeleted);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AdminApi->adminControllerGetAllReports: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **isDeleted** | **bool**|  | 

### Return type

[**BuiltList&lt;FullReportDto&gt;**](FullReportDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminControllerUpdateDump**
> FullDumpDto adminControllerUpdateDump(updateDumpDto)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = ApiClient().getAdminApi();
final UpdateDumpDto updateDumpDto = ; // UpdateDumpDto | 

try {
    final response = api.adminControllerUpdateDump(updateDumpDto);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AdminApi->adminControllerUpdateDump: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **updateDumpDto** | [**UpdateDumpDto**](UpdateDumpDto.md)|  | 

### Return type

[**FullDumpDto**](FullDumpDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **adminControllerUpdateReport**
> FullReportDto adminControllerUpdateReport(refId, name, longitude, latitude, isVisible, isDeleted, comment, status, officerImageUrls, imageUrls, images)



### Example
```dart
import 'package:api_client/api.dart';
// TODO Configure HTTP basic authorization: bearer
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').username = 'YOUR_USERNAME'
//defaultApiClient.getAuthentication<HttpBasicAuth>('bearer').password = 'YOUR_PASSWORD';

final api = ApiClient().getAdminApi();
final String refId = refId_example; // String | 
final String name = name_example; // String | 
final num longitude = 8.14; // num | 
final num latitude = 8.14; // num | 
final bool isVisible = true; // bool | 
final bool isDeleted = true; // bool | 
final String comment = comment_example; // String | 
final String status = status_example; // String | 
final BuiltList<String> officerImageUrls = ; // BuiltList<String> | 
final BuiltList<String> imageUrls = ; // BuiltList<String> | 
final BuiltList<MultipartFile> images = /path/to/file.txt; // BuiltList<MultipartFile> | 

try {
    final response = api.adminControllerUpdateReport(refId, name, longitude, latitude, isVisible, isDeleted, comment, status, officerImageUrls, imageUrls, images);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AdminApi->adminControllerUpdateReport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refId** | **String**|  | 
 **name** | **String**|  | 
 **longitude** | **num**|  | 
 **latitude** | **num**|  | 
 **isVisible** | **bool**|  | 
 **isDeleted** | **bool**|  | 
 **comment** | **String**|  | 
 **status** | **String**|  | 
 **officerImageUrls** | [**BuiltList&lt;String&gt;**](String.md)|  | 
 **imageUrls** | [**BuiltList&lt;String&gt;**](String.md)|  | 
 **images** | [**BuiltList&lt;MultipartFile&gt;**](MultipartFile.md)|  | 

### Return type

[**FullReportDto**](FullReportDto.md)

### Authorization

[bearer](../README.md#bearer)

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

