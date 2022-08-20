import 'package:farmdidi/app/data/database.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favorites_controller.dart';

class FavoritesView extends GetView<FavoritesController> {
  final TransactionDbFunctions _cont = Get.put(TransactionDbFunctions());
  @override
  Widget build(BuildContext context) {
    _cont.refresh();
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color.fromARGB(255, 87, 46, 94), Colors.orange])),
      child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text('Favorites'),
            centerTitle: true,
          ),
          body: Obx(() {
            return ListView.builder(
                itemCount: _cont.newList.length,
                itemBuilder: (context, index) {
                  final value = _cont.newList[index];
                  return Card(
                    color: Color.fromARGB(95, 86, 41, 41),
                    child: ListTile(
                      subtitle: InkWell(
                        onTap: () {},
                        child: Text(value.website,
                            style: TextStyle(color: Colors.lightBlue)),
                      ),
                      trailing: TextButton(
                          onPressed: () {
                            _cont.deleteTransactions(value.id.toString());
                          },
                          child: Text(
                            'Remove from Favorite',
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 0, 0),
                                fontSize: 10),
                          )),
                      title: Text(
                        value.name.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                  );
                });
          })),
    );
  }
}
