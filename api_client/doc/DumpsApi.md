# api_client.api.DumpsApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**dumpControllerGetAllVisibleDumps**](DumpsApi.md#dumpcontrollergetallvisibledumps) | **GET** /dumps | 


# **dumpControllerGetAllVisibleDumps**
> BuiltList<DumpDto> dumpControllerGetAllVisibleDumps()



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getDumpsApi();

try {
    final response = api.dumpControllerGetAllVisibleDumps();
    print(response);
} catch on DioError (e) {
    print('Exception when calling DumpsApi->dumpControllerGetAllVisibleDumps: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**BuiltList&lt;DumpDto&gt;**](DumpDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

