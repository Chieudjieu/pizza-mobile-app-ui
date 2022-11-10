import 'package:flutter/material.dart';
import 'package:pizza_mobile_app_ui/constants.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/backgroungOne.jpeg"),
              fit: BoxFit.cover
            )
          ),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Center(
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
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(240, 45),
                          textStyle: TextStyle(fontSize: 18),
                          backgroundColor: primaryOrangeColor,
                        ),
                        onPressed: (){
                        },
                        child: const Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                    ),
                    const SizedBox(height: 15,),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            minimumSize: Size(300, 45),
                            textStyle: TextStyle(fontSize: 18),
                            foregroundColor: Colors.black,
                            side: BorderSide(width: 1, color: primaryOrangeColor)
                        ),
                        onPressed: (){
                        },
                        child: const Text('Register')
                    ),
                  ],
                ),
              )

            ],
          ),
        )

      ],
    );
  }
}
