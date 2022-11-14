import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sayyid_themoviedb/api/api_service.dart';
import 'package:sayyid_themoviedb/models/movie.dart';

class SearchController extends GetxController {
  TextEditingController searchController = TextEditingController();
  var searchText = ''.obs;
  var foundedMovies = <Movie>[].obs;
  var isLoading = false.obs;
  void setSearchText(text) => searchText.value = text;
  void search(String query) async {
    isLoading.value = true;
    foundedMovies.value = (await ApiService.getSearchedMovies(query)) ?? [];
    isLoading.value = false;
  }
}