import 'package:get/get.dart';

import 'package:farmdidi/app/modules/favorites/bindings/favorites_binding.dart';
import 'package:farmdidi/app/modules/favorites/views/favorites_view.dart';
import 'package:farmdidi/app/modules/home/bindings/home_binding.dart';
import 'package:farmdidi/app/modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITES,
      page: () => FavoritesView(),
      binding: FavoritesBinding(),
    ),
  ];
}
