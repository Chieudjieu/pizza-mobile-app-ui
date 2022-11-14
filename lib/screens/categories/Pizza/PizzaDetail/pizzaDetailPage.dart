import 'package:flutter/material.dart';
import 'package:pizza_mobile_app_ui/constants.dart';
import 'package:pizza_mobile_app_ui/models/pizzaDetailModel.dart';

class PizzaDetailPage extends StatefulWidget {
  const PizzaDetailPage({Key? key, required this.pizzaDetails,}) : super(key: key);

  final PizzaDetailModel pizzaDetails;

  @override
  State<PizzaDetailPage> createState() => _PizzaDetailPageState(pizzaDetails: pizzaDetails);
}

class _PizzaDetailPageState extends State<PizzaDetailPage> {
  _PizzaDetailPageState({required this.pizzaDetails,});

  final PizzaDetailModel pizzaDetails;
  int increment = 1;

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: primaryWhiteColor,
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
                  Icons.arrow_back_ios_new,
                  color: primaryOrangeColor,
                  size: 30,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const ImageIcon(
              AssetImage("assets/logo/shopping-bag.png"),
              color: primaryOrangeColor,
              size: 50,
            ),
            onPressed: (){},
          ),

        ],
      ),

      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: phoneSize.height * 0.30,
                child: Center(
                  child: Image.network(pizzaDetails.image, fit: BoxFit.fill,),

                ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(top: 30, bottom: 50),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: primaryOrangeColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                      onTap: () {
                        if(increment > 1)
                          setState(() {
                            increment = increment -1 ;
                          });
                      },
                      child: Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 16,
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 18),
                    padding:
                    EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                    child: Text(
                      increment.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        if(increment < 100)
                          setState(() {
                            increment = increment +1 ;
                          });
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      )),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
              pizzaDetails.name + ' Pizza',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 5, right: 30),
              child: Text(
                pizzaDetails.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                pizzaDetails.price,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: primaryOrangeColor,
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 15 ,top: 10, bottom: 10, right: 15),
              margin: EdgeInsets.only(left: 15,top: 30, bottom: 50, right: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: primaryPaleColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset("assets/images/pizzaPage2.png", scale: 8,),
                        ),
                        Text(
                          'Small',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    width: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 0,
                    color: Colors.grey,
                  ),
                  Divider(),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset("assets/images/pizzaPage2.png", scale: 6,),
                        ),
                        Text(
                          'Medium',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    width: 20,
                    thickness: 1,
                    indent: 20,
                    endIndent: 0,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset("assets/images/pizzaPage2.png", scale: 5,),
                        ),
                        Text(
                          'Large',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 30, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  addToCartButton(context: context),
                ],
              ),
            ),


          ],
        ),
      )

    );
  }


  ElevatedButton addToCartButton({required BuildContext context}) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(240, 45),
          textStyle: TextStyle(fontSize: 18),
          backgroundColor: primaryOrangeColor,

        ),
        onPressed: (){
        },
        child: const Text(
          'Add to cart',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),
        )
    );
  }

}
