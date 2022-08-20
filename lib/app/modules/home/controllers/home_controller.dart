import 'package:farmdidi/app/data/database.dart';
import 'package:farmdidi/app/data/local_db_model.dart';
import 'package:farmdidi/app/data/model_class.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class HomeController extends GetxController {
  final TransactionDbFunctions _cont = Get.put(TransactionDbFunctions());
  //TODO: Implement HomeController
  int? newVal;
  final count = 0.obs;
  List<UniversityModel> universities = [];
  fetchData<UniversityModel>() async {
    final response = await http.get(
        Uri.parse('http://universities.hipolabs.com/search?country=India'));

    universities = universityModelFromJson(response.body);
  }

  openLink(String link) {
    launchUrl(Uri.parse("https://$link/"));
  }

  bool? changed;
  onClick(
      {required String name,
      required String website,
      required int index}) async {
    dynamic model;
    for (int i = 0; i <= TransactionDbFunctions().newList.length; i++) {
      if (TransactionDbFunctions().newList.isEmpty) {
        model = LocalModel(id: index.toString(), name: name, website: website);
      } else if (index.toString() == TransactionDbFunctions().newList[i].id) {
        Get.snackbar('title', 'Data is already present');
      }
    }
    await _cont.addData(model);
    _cont.refresh();
    update();
  }
}
