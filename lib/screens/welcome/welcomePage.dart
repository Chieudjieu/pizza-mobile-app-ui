import 'package:flutter/material.dart';
import 'package:pizza_mobile_app_ui/constants.dart';
import 'package:pizza_mobile_app_ui/screens/screens.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundImage(),

        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: const Center(
                  child: Text(
                    "Pizzeria",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 60,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),


              Container(
                padding: EdgeInsets.only(left: 20.0, top: 0.0, bottom: 30.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    loginButton(context: context),
                    const SizedBox(height: 15,),
                    registerButton(context: context),
                  ],
                ),
              )

            ],
          ),
        )

      ],
    );
  }

  Container backgroundImage() {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/backgroundWelcomePage.jpeg"),
            fit: BoxFit.cover
          )
        ),
      );
  }

  OutlinedButton registerButton({required BuildContext context}) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            minimumSize: Size(300, 45),
            textStyle: TextStyle(fontSize: 18),
            foregroundColor: Colors.black,
            backgroundColor: primaryWhiteColor.withOpacity(0.4),
            side: BorderSide(width: 1, color: primaryOrangeColor)
        ),
        onPressed: (){
          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const BottomNavigationPage()), (route) => false);

        },
        child: const Text(
          'Register',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        )
    );
  }

  ElevatedButton loginButton({required BuildContext context}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(240, 45),
          textStyle: TextStyle(fontSize: 18),
          backgroundColor: primaryOrangeColor,
        ),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const BottomNavigationPage()));

        },
        child: const Text(
          'Login',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        )
    );
  }
}
