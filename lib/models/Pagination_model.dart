class PaginationModel {
  final int? limit;
  final int? offset;
  final int? count;
  final int? total;

  PaginationModel({
    required this.limit,
    required this.offset,
    required this.count,
    required this.total,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) {
    return PaginationModel(
      limit: json['limit'],
      offset: json['offset'],
      count: json['count'],
      total: json['total'],
    );
  }
}
