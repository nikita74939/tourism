import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  final currentIndex = 0.obs;
  final pageController = PageController();

  void changeTab(int index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }
}
