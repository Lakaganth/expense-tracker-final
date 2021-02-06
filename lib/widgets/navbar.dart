import 'package:fleming_expense_tracker/widgets/navbar_button.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  Navbar(this.triggerAnimation);
  final Function triggerAnimation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SidebarButton(triggerAnimation: triggerAnimation),
        ],
      ),
    );
  }
}
