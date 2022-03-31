import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:task2_app/data/models/simple_model.dart';

class TaskHive {
  final Box _box;

  const TaskHive(this._box);

  Future<void> saveRegion(SimpleModel value) async {
    await _box.put("Region", "$value");
  }

  Future<SimpleModel> getRegion() async {
    final string = await _box.get("Region", defaultValue: "{}");
    return SimpleModel.fromJson(jsonDecode(string));
  }

  Future<void> saveDistrict(SimpleModel value) async {
    await _box.put("District", "$value");
  }

  Future<SimpleModel> getDistrict() async {
    final string = await _box.get("District", defaultValue: "{}");
    return SimpleModel.fromJson(jsonDecode(string));
  }

  Future<void> saveOrganization(SimpleModel value) async {
    await _box.put("Organization", "$value");
  }

  Future<SimpleModel> getOrganization() async {
    final string = await _box.get("Organization", defaultValue: "{}");
    return SimpleModel.fromJson(jsonDecode(string));
  }

  Future<void> clear() async {
    await _box.clear();
  }
}
