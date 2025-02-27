import 'package:stock_market_tracker_dalia_nasser/models/Pagination_model.dart';
import 'package:stock_market_tracker_dalia_nasser/models/data_model.dart';

class ResponseModel {
  final PaginationModel? pagination;
  final List<DataModel>? data;

  ResponseModel({
    required this.pagination,
    required this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    var dataFromJson = json['data'] as List;
    List<DataModel> DataList =
        dataFromJson.map((i) => DataModel.fromJson(i)).toList();

    return ResponseModel(
      pagination: PaginationModel.fromJson(json['pagination']),
      data: DataList,
    );
  }
}
