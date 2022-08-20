import 'package:farmdidi/app/data/local_db_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesController extends GetxController {
  //TODO: Implement FavoritesController

  final count = 0.obs;

  @override
  void onClose() {}
  void increment() => count.value++;
}
