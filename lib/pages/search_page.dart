import 'package:bcommerce/config.dart';
import 'package:flutter/material.dart';

import '../widgets/product_row_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Search",
          style: TextStyle(color: textColor),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Items"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 52,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: bgColor,
                    filled: true,
                    hintText: "Search For Items",
                    suffixIcon: Icon(Icons.search)),
              ),
            ),
          ),
          ProductRow(isBool: false),
          ProductRow(isBool: false),
          ProductRow(isBool: false),
        ],
      ),
    );
  }
}
