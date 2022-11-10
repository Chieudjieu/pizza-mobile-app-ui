import 'package:flutter/material.dart';
import 'package:pizza_mobile_app_ui/constants.dart';
import 'package:pizza_mobile_app_ui/screens/screens.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {

  final List _screens = [
    HomePage(),
    Container(),
    Container()
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if(_currentIndex == 0){
            return true;
          } else {
            setState(() {
              _currentIndex = 0;
            });
            return false;
          }
        },
        child: Scaffold(
          body: _screens[_currentIndex],

          floatingActionButton: FloatingActionButton(
            backgroundColor: primaryOrangeColor,
            foregroundColor: primaryWhiteColor,
            splashColor:  Colors.green,
            onPressed: (){

            },
            child: const Icon(
              Icons.message_outlined,
            ),
          ),

          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,

          bottomNavigationBar: buildBottomAppBar(),
        )
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
          color: primaryWhiteColor,
          shape: CircularNotchedRectangle(), //shape of notch
          notchMargin: 5, //notche margin between floating button and bottom appbar
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                enableFeedback: false,
                  onPressed: (){
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                  icon: _currentIndex == 0 ?
                  const Icon(
                    Icons.home_filled,
                    color: primaryBlackColor,
                    size: 35,
                  )
                      : const Icon(
                    Icons.home_outlined,
                    color: primaryBlackColor,
                    size: 35,
                  ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: (){
                  setState(() {
                    _currentIndex = 1;
                  });
                },
                icon: _currentIndex == 1 ?
                const Icon(
                  Icons.heart_broken,
                  color: primaryBlackColor,
                  size: 35,
                )
                    : const Icon(
                  Icons.heart_broken_outlined,
                  color: primaryBlackColor,
                  size: 35,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: (){
                  setState(() {
                    _currentIndex = 2;
                  });
                },
                icon: _currentIndex == 2 ?
                const Icon(
                  Icons.safety_divider,
                  color: primaryBlackColor,
                  size: 35,
                )
                    : const Icon(
                  Icons.safety_divider_outlined,
                  color: primaryBlackColor,
                  size: 35,
                ),
              ),
              const SizedBox(),

            ],
          ),
        );
  }
}
