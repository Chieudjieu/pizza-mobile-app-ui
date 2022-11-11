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
          backgroundColor: primaryWhiteColor,
          drawer: const Drawer(
            child: Center(child: Text('Drawer')),
          ),
          appBar: AppBar(
            backgroundColor: primaryWhiteColor,
            elevation: 0,
            titleSpacing: 0,
            automaticallyImplyLeading: false,


            // automaticallyImplyLeading: false,
            toolbarHeight:80,
            leadingWidth:80,
            leading: Builder(
              builder: (context) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: primaryPaleColor,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: IconButton(
                    icon: const Icon(
                      Icons.menu,
                      size: 30,
                      color: primaryOrangeColor,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  size: 30,
                  color: primaryOrangeColor,
                ),
                onPressed: (){},
              ),

              circularProfilePhoto(),

            ],
          ),
          
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

  Padding circularProfilePhoto() {
    return const Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: primaryGreyColor,
        child: CircleAvatar(
          // backgroundColor: const Color(0xff7c94b6),
          radius: 28.0,
          foregroundImage: NetworkImage(
            'https://static8.depositphotos.com/1192060/856/i/600/depositphotos_8569487-stock-photo-teenager-posing.jpg',
          ),
          backgroundImage: AssetImage(
            'assets/images/default_person.png',
          ),
        ),
      ),
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
                  Icons.verified,
                  color: primaryBlackColor,
                  size: 35,
                )
                    : const Icon(
                  Icons.verified_outlined,
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
