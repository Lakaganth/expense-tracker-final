import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SidebarItem {
  SidebarItem({this.title, this.background, this.icon});

  String title;
  LinearGradient background;
  Icon icon;
}

List<SidebarItem> sidebarItem = [
  SidebarItem(
    title: "Dashboard",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00AEFF),
        Color(0xFF0076FF),
      ],
    ),
    icon: Icon(
      Icons.clear,
      color: Colors.white,
    ),
  ),
  SidebarItem(
    title: "Create Trip",
    background: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFA7d75), Color(0xFFC23D61)]),
    icon: Icon(
      Platform.isAndroid ? Icons.library_books : CupertinoIcons.book_solid,
      color: Colors.white,
    ),
  ),
  SidebarItem(
    title: "Currency Converter",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFF4E62CC), Color(0xFF202A78)],
    ),
    icon: Icon(
      Platform.isAndroid ? Icons.settings : CupertinoIcons.settings_solid,
      color: Colors.white,
    ),
  ),
  SidebarItem(
    title: "Logout",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xFFEF3428), Color(0xFF6B2925)],
    ),
    icon: Icon(
      Platform.isAndroid ? Icons.close : CupertinoIcons.back,
      color: Colors.white,
    ),
  ),
];
