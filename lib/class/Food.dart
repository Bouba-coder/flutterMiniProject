import 'package:collection/collection.dart';
import 'package:flutterMiniProject/component/Component.dart';

class Food{
  //bool
  bool verif;
  //tab to contain selected items
  var tab = [];
  //List of ingredients for checklist
  Map<String, bool> ingrediens = {
    'Pain' : false,
    'Viande hachée' : false,
    'Oignon' : false,
    'Frômage' : false,
    'Tomate' : false,
    'Salade' : false,
    'Moutarde' : false,
    'Ketchup' : false,
    'Gingimbre' : false,
    'Steak' : false,
    'Poulet' : false,
    'Pomme de terre' : false,
    'Oeufs' : false,
  };
  //tab for comparing between choice ingredients array and burger ingredients array
  var tabCompar = ['Pain','Oignon', 'Frômage', 'Tomate', 'Salade', 'Moutarde', 'Ketchup', 'Steak'];
  //equality function(two arraylists)
  Function eq = const ListEquality().equals;
  //component for result print (after)
  Component component = new Component();

  //putting ingredients in array and compare to burger ingredients array(true//false)
  getItems() {
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
    return verif;
  }
}