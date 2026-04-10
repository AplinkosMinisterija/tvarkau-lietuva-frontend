# api_client.model.ReportCategoryAnalyticsDto

## Load the model package
```dart
import 'package:api_client/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**summary** | [**OverallSummaryDto**](OverallSummaryDto.md) |  | 
**statusDistribution** | [**BuiltList&lt;StatusDistributionItemDto&gt;**](StatusDistributionItemDto.md) |  | 
**categoryBreakdown** | [**BuiltList&lt;CategoryBreakdownItemDto&gt;**](CategoryBreakdownItemDto.md) |  | 
**geographicBreakdown** | [**BuiltList&lt;RegionBreakdownItemDto&gt;**](RegionBreakdownItemDto.md) |  | 
**monthlyTrends** | [**BuiltList&lt;MonthlyTrendItemDto&gt;**](MonthlyTrendItemDto.md) |  | 
**resolutionPerformance** | [**ResolutionPerformanceDto**](ResolutionPerformanceDto.md) |  | 
**generatedAt** | **String** | ISO timestamp of when analytics were computed | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


