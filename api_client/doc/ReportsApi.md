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


# **reportControllerCreateNewReport**
> PublicReportDto reportControllerCreateNewReport(name, longitude, latitude, email, images)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getReportsApi();
final String name = name_example; // String | 
final num longitude = 8.14; // num | 
final num latitude = 8.14; // num | 
final String email = email_example; // String | 
final BuiltList<MultipartFile> images = /path/to/file.txt; // BuiltList<MultipartFile> | 

try {
    final response = api.reportControllerCreateNewReport(name, longitude, latitude, email, images);
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReportsApi->reportControllerCreateNewReport: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **name** | **String**|  | 
 **longitude** | **num**|  | 
 **latitude** | **num**|  | 
 **email** | **String**|  | 
 **images** | [**BuiltList&lt;MultipartFile&gt;**](MultipartFile.md)|  | 

### Return type

[**PublicReportDto**](PublicReportDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: multipart/form-data
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **reportControllerGetAllPublicReports**
> BuiltList<PublicReportDto> reportControllerGetAllPublicReports()



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getReportsApi();

try {
    final response = api.reportControllerGetAllPublicReports();
    print(response);
} catch on DioError (e) {
    print('Exception when calling ReportsApi->reportControllerGetAllPublicReports: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

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

