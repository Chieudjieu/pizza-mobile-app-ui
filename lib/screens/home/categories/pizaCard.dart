import 'package:flutter/material.dart';

import '../../../constants.dart';

class PizzaCard extends StatelessWidget {
  const PizzaCard({
    Key? key,
    required this.name,
    required this.image,
    required this.price,
  }) : super(key: key);

  final String name;
  final String image;
  final String price;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

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
                child: Image(
                  image: AssetImage(
                    image,

                  ),
                )
            ),
            Text(name),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(price),
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