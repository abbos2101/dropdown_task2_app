import 'package:dio/dio.dart';
import 'package:task2_app/data/models/simple_model.dart';

class TaskApi {
  final Dio _dio;

  const TaskApi(this._dio);

  Future<List<SimpleModel>> getRegions() async {
    final response = await _dio.get('get-regions');
    return (response.data as List).map((e) => SimpleModel.fromJson(e)).toList();
  }

  Future<List<SimpleModel>> getDistricts(int regionId) async {
    final response = await _dio.get('get-districts?regionId=$regionId');
    return (response.data as List).map((e) => SimpleModel.fromJson(e)).toList();
  }

  Future<List<SimpleModel>> getOrganizations(int districtId) async {
    final response = await _dio.get('get-organizations?districtId=$districtId');
    return (response.data as List).map((e) => SimpleModel.fromJson(e)).toList();
  }
}
