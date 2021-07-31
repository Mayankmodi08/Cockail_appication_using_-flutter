import 'package:flutter/material.dart';

class DrinkDetail extends StatelessWidget {
  final drinks;

  const DrinkDetail({Key? key, @required this.drinks}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.pink])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(drinks["strDrink"]),
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: drinks["idDrink"],
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: NetworkImage(
                    drinks["strDrinkThumb"] ??
                        "http://nmdinteriors.com/images/no_image.png",
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "${drinks["idDrink"]}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "${drinks["strDrink"]}",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
