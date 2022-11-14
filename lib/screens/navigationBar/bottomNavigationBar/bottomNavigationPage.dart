import 'package:flutter/cupertino.dart';
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
    Container(child: Center(child: Text("Page 2"),),),
    Container(child: Center(child: Text("Page 3"),),)
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
                    icon: const ImageIcon(
                      AssetImage("assets/logo/menu.png"),
                      color: primaryOrangeColor,
                      size: 30,
                    ),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: const ImageIcon(
                  AssetImage("assets/logo/shopping-bag.png"),
                  color: primaryOrangeColor,
                  size: 40,
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
            child: ImageIcon(
              AssetImage("assets/logo/chat.png"),
              size: 25,

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
          foregroundImage: AssetImage(
            'assets/images/profile_photo.webp',
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
                  const ImageIcon(
                    AssetImage("assets/logo/homepageFull.png"),
                    size: 35,
                  )
                      : const ImageIcon(
                    AssetImage("assets/logo/homepage.png"),
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
                const ImageIcon(
                  AssetImage("assets/logo/loveFull.png"),
                  size: 35,
                )
                    : const ImageIcon(
                  AssetImage("assets/logo/love.png"),
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
                const ImageIcon(
                  AssetImage("assets/logo/remiseFull.png"),
                  size: 35,
                )
                    : const ImageIcon(
                  AssetImage("assets/logo/remise.png"),
                  size: 35,
                ),
              ),
              const SizedBox(),

            ],
          ),
        );
  }
}
