import 'package:farmdidi/app/modules/favorites/views/favorites_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final HomeController _homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.orange])),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(FavoritesView());
                },
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ))
          ],
          backgroundColor: Colors.transparent,
          title: Text('Welcome'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: FutureBuilder(
                future: _homeController.fetchData(),
                builder: ((context, snapshot) {
                  return ListView.separated(
                      separatorBuilder: (context, indesx) {
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: _homeController.universities.length,
                      itemBuilder: ((context, index) {
                        return Card(
                          color: Color.fromARGB(95, 86, 41, 41),
                          child: ListTile(
                            subtitle: InkWell(
                              onTap: () {
                                _homeController.openLink(_homeController
                                    .universities[index].domains![0]
                                    .toString());
                              },
                              child: Text(
                                  _homeController
                                      .universities[index].webPages![0]
                                      .toString(),
                                  style: TextStyle(color: Colors.lightBlue)),
                            ),
                            trailing: TextButton(
                                onPressed: () {
                                  _homeController.onClick(
                                      name: _homeController
                                          .universities[index].name
                                          .toString(),
                                      website: _homeController
                                          .universities[index].webPages
                                          .toString(),
                                      index: index);
                                },
                                child: Text(
                                  'Add to Favorite',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 255, 0, 0),
                                      fontSize: 10),
                                )),
                            title: Text(
                              _homeController.universities[index].name
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          ),
                        );
                      }));
                }))),
      ),
    );
  }
}
