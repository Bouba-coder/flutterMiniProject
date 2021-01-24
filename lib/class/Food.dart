import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutterMiniProject/asset/burgerIcon.dart';
import 'package:flutterMiniProject/asset/vegetablesIcon.dart';
import 'package:flutterMiniProject/component/Component.dart';

class Food {

  //variables and tabs

  //bool
  bool verif;
  //tab to contain selected items
  var tab = [];
  //List of ingredients for checklist
  Map<String, bool> ingrediens = {
    'Pain': false,
    'Viande hachée': false,
    'Oignon': false,
    'Frômage': false,
    'Tomate': false,
    'Salade': false,
    'Moutarde': false,
    'Ketchup': false,
    'Gingimbre': false,
    'Steak': false,
    'Poulet': false,
    'Pomme de terre': false,
    'Oeufs': false,
  };

  //tab for comparing between choice ingredients array and burger ingredients array
  var tabCompar = [
    'Pain',
    'Oignon',
    'Frômage',
    'Tomate',
    'Salade',
    'Moutarde',
    'Ketchup',
    'Steak'
  ];

  //equality function(two arraylists)
  Function eq = const ListEquality().equals;

  //component for result print (after)
  Component component = new Component();

  //putting ingredients in array and compare to burger ingredients array(true//false)
  getItems(Object ShowDialogueContext) {
    tab.clear();
    ingrediens.forEach((key, value) {
      if (value == true) {
        tab.add(key);
        if (eq(tab, tabCompar)) {
          verif = true;
          print("Ca match : $verif");
        }
        else {
          verif = false;
          print("Ca ne match pas : $verif");
        }
      }
    });

    //result
    verif = (verif == true) ?
    showDialog(
      context: ShowDialogueContext,
      builder: (BuildContext ShowDialogueContext) {
        return AlertDialog(
          title: const Text('Burger Ingredients'),
          //content: Text('You typed "${_tab.map((key) => key)}".'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              component.burger(
                  "Pain", Colors.amberAccent, VegetablesIcon.bread, 18.0),
              component.burger("Salade", Colors.green, VegetablesIcon.cabbage, 18.0),
              component.burger(
                  "Tomate", Colors.red, VegetablesIcon.tomato, 18.0),
              component.burger(
                  "Frômage", Colors.yellow, VegetablesIcon.cheese, 18.0),
              component.burger(
                  "Steak", Colors.brown, VegetablesIcon.meat, 18.0),
              component.burger(
                  "Frômage", Colors.yellow, VegetablesIcon.cheese, 18.0),
              component.burger(
                  "Ketchup", Colors.redAccent, VegetablesIcon.ketchup, 18.0),
              component.burger(
                  "Moutarde", Colors.yellow, VegetablesIcon.mustard, 18.0),
              component.burger(
                  "Pain", Colors.amberAccent, VegetablesIcon.bread, 18.0),
            ],),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(ShowDialogueContext);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    )

    : component.show("You choose bad ingredients for a burger : ${tab.map((key) => key)}", ShowDialogueContext);
    //return verif;
  }


}