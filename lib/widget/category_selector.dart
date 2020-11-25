import 'dart:ui';

import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;
  final List<String> categories = ["Messages", "Online", "Groups", "Requests"];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      height: 80,
      child:


      ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: index == selectedIndex ? Colors.white : Colors.white38,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
