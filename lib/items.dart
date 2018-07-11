import 'package:flutter/material.dart';
import 'package:embla/intro/intro.dart';
import 'package:embla/intro/select_equipment.dart';
import 'home.dart';
import 'package:embla/custom_project/custom_project.dart';
import 'custom_project/custom_project_equip2.dart';

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
    ),
    EmblaItem(
      title: 'Select tool',
      routeName: '/select_tool',
      buildWidget: (BuildContext context) => CustomProjectEquip2()
    )
  ];
}