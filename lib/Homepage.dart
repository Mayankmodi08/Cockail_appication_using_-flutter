import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Drink_Detail.dart';
import 'package:http/http.dart' as http;

var mytext = "India Wale";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=cocktail";
  var res, drink;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    res = await http.get(Uri.parse(api));

    drink = jsonDecode(res.body)["drinks"];
    print(drink.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.pink])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Center(
              child: Text(
            "Cocktail App",
          )),
          elevation: 0.0,
        ),
        body: Center(
          child: res != null
              ? ListView.builder(
                  itemCount: drink.length,
                  itemBuilder: (context, index) {
                    var drinks = drink[index];
                    return ListTile(
                      leading: Hero(
                        tag: drinks["idDrink"],
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            drinks["strDrinkThumb"] ??
                                "http://nmdinteriors.com/images/no_image.png",
                          ),
                        ),
                      ),
                      title: Text(
                        "${drinks["strDrink"]}",
                        style: TextStyle(fontSize: 22, color: Colors.white),
                      ),
                      subtitle: Text(
                        "${drinks["idDrink"]}",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DrinkDetail(drinks: drinks)));
                      },
                    );
                  })
              : CircularProgressIndicator(
                  color: Colors.white,
                ),
        ),
      ),
    );
  }
}
