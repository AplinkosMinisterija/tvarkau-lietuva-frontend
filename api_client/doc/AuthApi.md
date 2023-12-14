# api_client.api.AuthApi

## Load the API package
```dart
import 'package:api_client/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**authControllerLogin**](AuthApi.md#authcontrollerlogin) | **POST** /auth/login | 


# **authControllerLogin**
> LogInDto authControllerLogin(loginRequestDto)



### Example
```dart
import 'package:api_client/api.dart';

final api = ApiClient().getAuthApi();
final LoginRequestDto loginRequestDto = ; // LoginRequestDto | 

try {
    final response = api.authControllerLogin(loginRequestDto);
    print(response);
} catch on DioError (e) {
    print('Exception when calling AuthApi->authControllerLogin: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **loginRequestDto** | [**LoginRequestDto**](LoginRequestDto.md)|  | 

### Return type

[**LogInDto**](LogInDto.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

