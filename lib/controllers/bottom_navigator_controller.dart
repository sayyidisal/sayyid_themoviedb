import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sayyid_themoviedb/screens/home_screen.dart';
import 'package:sayyid_themoviedb/screens/profile.dart';
import 'package:sayyid_themoviedb/screens/search_screen.dart';
import 'package:sayyid_themoviedb/screens/watch_list_screen.dart';

class BottomNavigatorController extends GetxController {
  var screens = [
    HomeScreen(),
    const SearchScreen(),
    WatchList(),
    Profiles(),
  ];
  var index = 0.obs;
  void setIndex(indx) => index.value = indx;
}