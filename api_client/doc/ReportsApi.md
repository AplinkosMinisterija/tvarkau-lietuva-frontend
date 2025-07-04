# api_client.api.ReportsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**reportControllerCreateNewReport**](ReportsApi.md#reportcontrollercreatenewreport) | **POST** /reports | 
[**reportControllerGetAllPublicReports**](ReportsApi.md#reportcontrollergetallpublicreports) | **GET** /reports | 
[**reportControllerGetGeojson**](ReportsApi.md#reportcontrollergetgeojson) | **POST** /reports/geojson | 
[**reportControllerGetReportById**](ReportsApi.md#reportcontrollergetreportbyid) | **GET** /reports/{refId} | 
[**reportControllerGetReportStatistics**](ReportsApi.md#reportcontrollergetreportstatistics) | **GET** /reports/statistics | 
[**reportControllerSendFeedbackReport**](ReportsApi.md#reportcontrollersendfeedbackreport) | **POST** /reports/feedback-report | 


# **reportControllerCreateNewReport**
> PublicReportDto reportControllerCreateNewReport(automaticEmailsEnabled, images, name, longitude, latitude, category, email)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getReportsApi();
final bool automaticEmailsEnabled = true; // bool | 
final BuiltList<MultipartFile> images = /path/to/file.txt; // BuiltList<MultipartFile> | 
final String name = name_example; // String | 
final num longitude = 8.14; // num | 
final num latitude = 8.14; // num | 
final String category = category_example; // String | 
final String email = email_example; // String | 

try {
    final response = api.reportControllerCreateNewReport(automaticEmailsEnabled, images, name, longitude, latitude, category, email);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReportsApi->reportControllerCreateNewReport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **automaticEmailsEnabled** | **bool**|  | 
 **images** | [**BuiltList&lt;MultipartFile&gt;**](MultipartFile.md)|  | 
 **name** | **String**|  | 
 **longitude** | **num**|  | 
 **latitude** | **num**|  | 
 **category** | **String**|  | 
 **email** | **String**|  | 

### Return type

[**PublicReportDto**](PublicReportDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportControllerGetAllPublicReports**
> BuiltList<PublicReportDto> reportControllerGetAllPublicReports(category)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getReportsApi();
final String category = category_example; // String | 

try {
    final response = api.reportControllerGetAllPublicReports(category);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReportsApi->reportControllerGetAllPublicReports: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **category** | **String**|  | [optional] 

### Return type

[**BuiltList&lt;PublicReportDto&gt;**](PublicReportDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportControllerGetGeojson**
> String reportControllerGetGeojson(jsonCoordsDto)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getReportsApi();
final JsonCoordsDto jsonCoordsDto = ; // JsonCoordsDto | 

try {
    final response = api.reportControllerGetGeojson(jsonCoordsDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReportsApi->reportControllerGetGeojson: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **jsonCoordsDto** | [**JsonCoordsDto**](JsonCoordsDto.md)|  | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportControllerGetReportById**
> PublicReportDto reportControllerGetReportById(refId)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getReportsApi();
final num refId = 8.14; // num | 

try {
    final response = api.reportControllerGetReportById(refId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReportsApi->reportControllerGetReportById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refId** | **num**|  | 

### Return type

[**PublicReportDto**](PublicReportDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportControllerGetReportStatistics**
> ReportStatisticsDto reportControllerGetReportStatistics(category)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getReportsApi();
final String category = category_example; // String | 

try {
    final response = api.reportControllerGetReportStatistics(category);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReportsApi->reportControllerGetReportStatistics: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **category** | **String**|  | [optional] 

### Return type

[**ReportStatisticsDto**](ReportStatisticsDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportControllerSendFeedbackReport**
> String reportControllerSendFeedbackReport(createFeedbackReportDto)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getReportsApi();
final CreateFeedbackReportDto createFeedbackReportDto = ; // CreateFeedbackReportDto | 

try {
    final response = api.reportControllerSendFeedbackReport(createFeedbackReportDto);
    print(response);
} catch on DioException (e) {
    print('Exception when calling ReportsApi->reportControllerSendFeedbackReport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createFeedbackReportDto** | [**CreateFeedbackReportDto**](CreateFeedbackReportDto.md)|  | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

