import 'package:flutter/material.dart';

import '../../../constants.dart';

class PizzaDetailPage extends StatefulWidget {
  const PizzaDetailPage({Key? key, required this.index,}) : super(key: key);

  final int index;
  @override
  State<PizzaDetailPage> createState() => _PizzaDetailPageState();
}

class _PizzaDetailPageState extends State<PizzaDetailPage> {
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

        ],
      ),

      body: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString("assets/json/pizzaDetail.json"),
          builder: (context, response){
            switch(response.connectionState) {
              case ConnectionState.none:
                return Container(
                  height: 200,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.waiting:
                return Container(
                  height: 200,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                );
              case ConnectionState.active:
              case ConnectionState.done:
                if (response.hasData) {
                 // final  welcomeModel = welcomeModelFromJson(response.data.toString());

                  return SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: phoneSize.height * 0.30,

                          child: Text("image"),
                        ),

                        SizedBox(
                          height: phoneSize.height * 0.35,

                          child: Text("Incrementer up to prize"),
                        ),

                        SizedBox(
                          height: phoneSize.height * 0.35,

                          child: Text("portion and button"),
                        ),
                        addToCartButton(context: context),


                      ],
                    ),
                  );
                }
            }
            return Container(
              height: 200,
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
      ),

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
