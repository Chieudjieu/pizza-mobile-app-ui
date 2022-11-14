import 'package:flutter/material.dart';
import 'package:pizza_mobile_app_ui/screens/home/searchField.dart';

import '../../constants.dart';
import '../categories/categoriesScreen.dart';


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
        physics: const NeverScrollableScrollPhysics(),

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
                    icon: const ImageIcon(
                      AssetImage("assets/logo/settings.png"),
                      color: primaryOrangeColor,
                      size: 30,
                    ),
                    onPressed: (){},
                  ),
                ),
              ),

            ],
          ),

          const CategoriesScreen()


        ],

      ),
    );
  }
}



