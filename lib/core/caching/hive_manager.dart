import 'package:hive_flutter/hive_flutter.dart';

import '../../features/pages/home/data/models/city_model.dart';
import '../../features/pages/home/data/models/doctor_model.dart';
import '../../features/pages/home/data/models/doctor_speciality_model.dart';
import '../../features/pages/home/data/models/governrate_model.dart';
import '../../features/pages/home/data/models/specialization_model.dart';
import '../config/Constants/app_constants.dart';

class HiveManager {
  HiveManager._();

  static HiveManager? _instance;

  static HiveManager getInstance() {
    _instance ??= HiveManager._();
    return _instance!;
  }

  Future<void> init() async {
    await Hive.initFlutter();
    _registerAdapters();
    await _openHiveBoxes();
  }

  void _registerAdapters() {
    Hive.registerAdapter(DoctorSpecialityModelAdapter());
    Hive.registerAdapter(DoctorModelAdapter());
    Hive.registerAdapter(SpecializationModelAdapter());
    Hive.registerAdapter(CityModelAdapter());
    Hive.registerAdapter(GovernrateModelAdapter());
  }

  Future<void> _openHiveBoxes() async {
    await Hive.openBox<DoctorSpecialityModel>(HiveBoxKeys.doctorSpeciality);
    await Hive.openBox<DoctorModel>(HiveBoxKeys.allDoctors);
  }

  void cacheData<T>(
      {required String boxKey, List<T>? dataList, T? dataItem}) async {
    var box = Hive.box<T>(boxKey);

    if (dataList != null) {
      box.addAll(dataList);
    } else if (dataItem != null) {
      box.add(dataItem);
    }
  }

  List<T> retrieveData<T>(String boxKey) {
    var box = Hive.box<T>(boxKey);

    return box.values.toList();
  }
}
