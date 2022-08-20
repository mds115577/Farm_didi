import 'package:farmdidi/app/data/local_db_model.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

const TRANSACTION_DB_NAME = 'transaction-db';

class GetDataFromApi extends GetxController {
  RxList<LocalModel> newList = <LocalModel>[].obs;
  @override
  Future<void> addData(LocalModel obj) async {
    final db = await Hive.openBox<LocalModel>(TRANSACTION_DB_NAME);
    db.put(obj.id, obj);
  }

  @override
  Future<void> refresh() async {
    final alltransaction = await getData();
    newList.clear();
    newList.addAll(alltransaction);
  }

  @override
  Future<List<LocalModel>> getData() async {
    final db = await Hive.openBox<LocalModel>(TRANSACTION_DB_NAME);
    return db.values.toList();
  }

  @override
  Future<void> deleteTransactions(String id) async {
    final transactDB = await Hive.openBox<LocalModel>(TRANSACTION_DB_NAME);
    transactDB.delete(id);
    refresh();
  }
}
