import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pizza_mobile_app_ui/screens/home/categories/categoriesScreen.dart';
import 'package:pizza_mobile_app_ui/screens/home/searchField.dart';

import '../../constants.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: ListView(
        children: [
          const Text(
            "Good Morning Jane !!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Expanded(child: SearchField()),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: primaryPaleColor,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.tune_outlined,
                      size: 30,
                      color: primaryOrangeColor,
                    ),
                    onPressed: (){},
                  ),
                ),
              ),

            ],
          ),


          const CategoriesScreen(),
          

        ],

      ),
    );
  }
}
