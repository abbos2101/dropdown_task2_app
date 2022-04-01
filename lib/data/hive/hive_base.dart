import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveBase {
  late Box _taskBox;

  Future<void> ensureInitialized() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init('${dir.path}/hive');
    _taskBox = await Hive.openBox('_taskBox');
  }

  Box get taskBox => _taskBox;
}
