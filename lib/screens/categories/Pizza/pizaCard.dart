import 'package:flutter/material.dart';
import 'package:pizza_mobile_app_ui/constants.dart';
import 'package:pizza_mobile_app_ui/models/pizzaDetailModel.dart';

import 'PizzaDetail/pizzaDetailPage.dart';


class PizzaCard extends StatelessWidget {
  const PizzaCard({
    Key? key, required this.pizzaDetails,

  }) : super(key: key);

  final PizzaDetailModel pizzaDetails;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => PizzaDetailPage(pizzaDetails: pizzaDetails)));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),

        margin: EdgeInsets.all(5),

        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 1,
              spreadRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade100,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height: 100,
                padding: EdgeInsets.all(10),
                child: Image.network(
                  pizzaDetails.image,

                )
            ),
            Text(
              pizzaDetails.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: primaryBlackColor,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pizzaDetails.price,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: primaryOrangeColor,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(Icons.add, color: Colors.white, size: 25,),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(8),
                      backgroundColor: primaryOrangeColor, // <-- Button color

                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}