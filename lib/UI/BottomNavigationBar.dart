import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/UI/BrandUIComponent/BrandLayout.dart';
import 'package:treva_shop_flutter/UI/CartUIComponent/CartLayout.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/Home.dart';
import 'package:treva_shop_flutter/UI/AcountUIComponent/Profile.dart';
import 'package:scoped_model/scoped_model.dart';
import '../scoped_models/users.dart';

class bottomNavigationBar extends StatefulWidget {
  //final UsersModel user;
  bottomNavigationBar();
 @override
 _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  UsersModel user = new UsersModel();
 int currentIndex = 0;
 /// Set a type current number a layout class
 Widget callPage(int current) {
  switch (current) {
   case 0:
    return new brand(user);
   case 1:
    return new Menu();
   case 2:
    return new cart();
   case 3:
    return new profil();
    break;
   default:
    return Menu();
  }
 }

 /// Build BottomNavigationBar Widget
 @override
 Widget build(BuildContext context) {
  return Scaffold(
   body: callPage(currentIndex),
   bottomNavigationBar: Theme(
       data: Theme.of(context).copyWith(
           canvasColor: Colors.white,
           textTheme: Theme.of(context).textTheme.copyWith(
               caption: TextStyle(color: Colors.black26.withOpacity(0.15)))),
       child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        fixedColor: Color(0xFF6991C7),
        onTap: (value) {
         currentIndex = value;
         setState(() {});
        },
        items: [
         BottomNavigationBarItem(
             icon: Icon(
              Icons.home,
              size: 23.0,
             ),
             title: Text(
              "Home",
              style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
             )),
         BottomNavigationBarItem(
             icon: Icon(Icons.shop),
             title: Text(
              "Brand",
              style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
             )),
         BottomNavigationBarItem(
             icon: Icon(Icons.shopping_cart),
             title: Text(
              "Cart",
              style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
             )),
         BottomNavigationBarItem(
             icon: Icon(
              Icons.person,
              size: 24.0,
             ),
             title: Text(
              "Acount",
              style: TextStyle(fontFamily: "Berlin", letterSpacing: 0.5),
             )),
        ],
       )),
  );
 }
}
