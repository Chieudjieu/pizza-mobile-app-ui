import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizza_mobile_app_ui/constants.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left:5, right: 5),
      margin: EdgeInsets.only(top: 20,bottom: 20),
      decoration: const BoxDecoration(
          color: primaryGreyColor,
          borderRadius: BorderRadius.all( Radius.circular(15))),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
              size: 30,
            ),
            onPressed: (){

            },
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: TextField(
                style: TextStyle(color: Colors.black, fontFamily: 'Regular',fontSize: 14),
                cursorColor: Colors.black,
                decoration: InputDecoration.collapsed(
                    hintText: 'Search "Pizza"',
                    hintStyle: TextStyle(fontSize: 14,fontFamily: "Regular", color: Colors.grey)
                ),
              ),
            ),
          ),

          IconButton(
            icon: const Icon(
              Icons.mic,
              color: Colors.grey,
              size: 30,
            ),
            onPressed: (){

            },
          ),

        ],
      ),
    );
  }
}