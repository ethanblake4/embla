import 'package:flutter/material.dart';
import 'package:embla/intro/intro.dart';
import 'package:embla/intro/select_equipment.dart';
import 'home.dart';
import 'custom_project.dart';

class EmblaItem {
  const EmblaItem({this.title, this.routeName, this.buildWidget});

  final String title;
  final String routeName;
  final WidgetBuilder buildWidget;
}

List<EmblaItem> buildItems() {
  return <EmblaItem> [
    EmblaItem(
        title: 'Intro',
        routeName: '/intro',
        buildWidget: (BuildContext context) => Intro()
    ),
    EmblaItem(
      title: 'Select Equipment',
      routeName: '/select_equipment',
      buildWidget: (BuildContext context) => SelectEquipment()
    ),
    EmblaItem(
        title: 'Home',
        routeName: '/home',
        buildWidget: (BuildContext context) => HomePage()
    ),
    EmblaItem(
      title: 'Start a custom project',
      routeName: '/newcustom',
      buildWidget: (BuildContext context) => CustomProject()
    )
  ];
}