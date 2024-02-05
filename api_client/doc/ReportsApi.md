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
[**reportControllerGetReportById**](ReportsApi.md#reportcontrollergetreportbyid) | **GET** /reports/{refId} | 
[**reportControllerGetReportStatistics**](ReportsApi.md#reportcontrollergetreportstatistics) | **GET** /reports/statistics | 


# **reportControllerCreateNewReport**
> PublicReportDto reportControllerCreateNewReport(images, name, longitude, latitude, type, email)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getReportsApi();
final BuiltList<MultipartFile> images = /path/to/file.txt; // BuiltList<MultipartFile> | 
final String name = name_example; // String | 
final num longitude = 8.14; // num | 
final num latitude = 8.14; // num | 
final String type = type_example; // String | 
final String email = email_example; // String | 

try {
    final response = api.reportControllerCreateNewReport(images, name, longitude, latitude, type, email);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReportsApi->reportControllerCreateNewReport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **images** | [**BuiltList&lt;MultipartFile&gt;**](MultipartFile.md)|  | 
 **name** | **String**|  | 
 **longitude** | **num**|  | 
 **latitude** | **num**|  | 
 **type** | **String**|  | 
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
> BuiltList<PublicReportDto> reportControllerGetAllPublicReports(type)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getReportsApi();
final String type = type_example; // String | 

try {
    final response = api.reportControllerGetAllPublicReports(type);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReportsApi->reportControllerGetAllPublicReports: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**|  | 

### Return type

[**BuiltList&lt;PublicReportDto&gt;**](PublicReportDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
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
} catch on DioError (e) {
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
> ReportStatisticsDto reportControllerGetReportStatistics(type)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getReportsApi();
final String type = type_example; // String | 

try {
    final response = api.reportControllerGetReportStatistics(type);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReportsApi->reportControllerGetReportStatistics: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**|  | 

### Return type

[**ReportStatisticsDto**](ReportStatisticsDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

