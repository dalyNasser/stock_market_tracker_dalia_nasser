import 'package:dio/dio.dart';
import '../models/response_model.dart';

class ApiDioService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.marketstack.com/v1/tickers';
  final String _accessKey = 'fe999907b556243b584c87671db653b9';
  final String _limit = 'limit=7';


  Future<ResponseModel> fetchData() async {
    try {
      final response = await _dio.get('$_baseUrl?access_key=$_accessKey&$_limit');

      if (response.statusCode == 200) {
        return ResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load stock data');
      }
    } catch (e) {
      throw Exception('Error fetching stock data: $e');
    }
  }
}