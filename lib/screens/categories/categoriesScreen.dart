import 'package:flutter/material.dart';
import 'package:pizza_mobile_app_ui/models/pizzaDetailModel.dart';
import 'Pizza/pizaCard.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> with TickerProviderStateMixin{

  final List categoriesNames = [
    "All","Pizza","Burger",
    "Dessert","Burrito"
  ];

  final List categoriesImages = [
    "assets/images/all_food.png",
    "assets/images/pizza.png",
    "assets/images/burger.webp",
    "assets/images/cupcake.png",
    "assets/images/buritto.png"
  ];


  int selectedCategory = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
    _tabController.animation?.addListener(() {
      setState(() {
        selectedCategory = _tabController.index;
      });
      print("Selected Index: " + _tabController.index.toString());
    });

  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Text(
            "Categories",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),

        Container(
          height: 80,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: 20),
          //color: Colors.green,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoriesNames.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: (){
                  setState(() {
                    selectedCategory = index;
                    _tabController.animateTo(index);
                  });

                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 1),

                  margin: EdgeInsets.all(5),
                  width: selectedCategory == index ? 70 : 60,

                  decoration: selectedCategory == index ? BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 2,
                        spreadRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                    color: selectedCategory == index ? Colors.grey.shade200 : Colors.white,
                  ) : BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: selectedCategory == index ? Colors.grey.shade200 : Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          height: 50,
                          padding: selectedCategory == index ? EdgeInsets.all(2) : EdgeInsets.all(5),
                          child: Image(
                            image: AssetImage(
                              categoriesImages[index],

                            ),
                          )
                      ),
                      Text(categoriesNames[index])
                    ],
                  ),
                ),
              );
            },
          ),
        ),

        _tabSection(context),


      ],
    );
  }

  Widget _tabSection(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

          Container(
            //Add this to give height
            height: phoneSize.height * 0.5,
            child: TabBarView(
                controller: _tabController,
                children: [
              Container(
                child: Center(child: Text("AlL items")),
              ),
              Container(
                //height: phoneSize.height * 0.4,
                width: double.infinity,

                child: FutureBuilder(
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
                            final  pizzaDetailsList = pizzaDetailModelFromJson(response.data.toString());

                            return GridView.builder(
                              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:2,
                                  childAspectRatio: (140.0 / 150.0),
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20
                              ),
                              scrollDirection: Axis.vertical,
                              itemCount: pizzaDetailsList.length,
                              shrinkWrap: true,

                              itemBuilder: (context, index){
                                return PizzaCard(pizzaDetails: pizzaDetailsList[index],);
                              },
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
              ),
              Container(
                child: Center(child: Text("Burger Items")),
              ),
              Container(
                child: Center(child: Text("Dessert items")),
              ),
              Container(
                child: Center(child: Text("Burrito items")),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

