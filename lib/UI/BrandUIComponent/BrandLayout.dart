import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/Library/carousel_pro/src/carousel_pro.dart';
import 'package:treva_shop_flutter/UI/BrandUIComponent/BrandDetail.dart';
import 'package:treva_shop_flutter/ListItem/BrandDataList.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/Search.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/AppbarGradient.dart';

import '../../applocalizations.dart';


class brand extends StatefulWidget {
  @override
  _brandState createState() => _brandState();
}

class _brandState extends State<brand> {
  @override
  Widget build(BuildContext context) {
    var imageSlider = Container(
      height: 182.0,
      child: new Carousel(
        boxFit: BoxFit.cover,
        dotColor: Color(0xFF6991C7).withOpacity(0.8),
        dotSize: 5.5,
        dotSpacing: 16.0,
        dotBgColor: Colors.transparent,
        showIndicator: true,
        overlayShadow: true,
        overlayShadowColors: Colors.white.withOpacity(0.9),
        overlayShadowSize: 0.9,
        images: [
          AssetImage("assets/img/baner1.png"),
          AssetImage("assets/img/baner12.png"),
          AssetImage("assets/img/baner2.png"),
          AssetImage("assets/img/baner3.png"),
          AssetImage("assets/img/baner4.png"),
        ],
      ),
    );
    /// Component appbar
    var _appbar = AppBar(
      backgroundColor: Color(0xFFFFFFFF),
      elevation: 0.0,
      title: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: ListView(
          children: <Widget>[
            Text(
              AppLocalizations.of(context).categotyBrand,
              style: TextStyle(
                  fontFamily: "Gotik",
                  fontSize: 20.0,
                  color: Colors.black54,
                  fontWeight: FontWeight.w700),
            ),
             //imageSlider,
          ],
        ),
      ),
      actions: <Widget>[
        InkWell(
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (_, __, ___) => new searchAppbar()));
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Icon(
              Icons.search,
              size: 27.0,
              color: Colors.black54,
            ),
          ),
        )
      ],
    );

    /// ImageSlider in header
    
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Scaffold(
        /// Calling variable appbar
        //appBar:  AppbarGradient(),//_appbar,
        body:
            //ListView(
            // children: <Widget>[
            Container(
          color: Colors.white,
          child: //imageSlider
              //ListView(
              // children: <Widget>[
              CustomScrollView(
                
            /// Create List Menu
            slivers: <Widget>[
              SliverPadding(
                padding: EdgeInsets.only(top: 0.0),
                sliver: SliverFixedExtentList(
                    itemExtent: 100.0,
                    delegate: SliverChildBuilderDelegate(

                        /// Calling itemCard Class for constructor card
                        (context, index) => AppbarGradient(),
                        childCount:1)),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 3.0),
                sliver: SliverFixedExtentList(
                    itemExtent: 145.0, 
                    delegate: SliverChildBuilderDelegate(

                        /// Calling itemCard Class for constructor card
                        (context, index) => imageSlider,
                        childCount:1)),
              ),
              //SingleChildScrollView(child: Text('data'),),
              //Text('add image slider here'),
              SliverPadding(
                padding: EdgeInsets.only(top: 0.0),
                sliver: SliverFixedExtentList(
                    itemExtent: 145.0,
                    delegate: SliverChildBuilderDelegate(

                        /// Calling itemCard Class for constructor card
                        (context, index) => itemCard(brandData[index]),
                        childCount: brandData.length)),
              ),
            ],
          ),
          //],
          //),
        ),
        //],
        //),
      ),
    );
  }
}

/// Constructor for itemCard for List Menu
class itemCard extends StatelessWidget {
  /// Declaration and Get data from BrandDataList.dart
  final Brand brand;
  itemCard(this.brand);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            PageRouteBuilder(
                pageBuilder: (_, __, ___) => new brandDetail(brand),
                transitionDuration: Duration(milliseconds: 600),
                transitionsBuilder:
                    (_, Animation<double> animation, __, Widget child) {
                  return Opacity(
                    opacity: animation.value,
                    child: child,
                  );
                }),
          );
        },
        child: Container(
          height: 130.0,
          width: 400.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
          child: Hero(
            tag: 'hero-tag-${brand.id}',
            child: Material(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  image: DecorationImage(
                      image: AssetImage(brand.img), fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFABABAB).withOpacity(0.3),
                      blurRadius: 1.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: Colors.black12.withOpacity(0.1),
                  ),
                  child: Center(
                    child: Text(
                      brand.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Berlin",
                        fontSize: 35.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
