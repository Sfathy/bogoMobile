import 'package:flutter/material.dart';
import 'package:treva_shop_flutter/ListItem/BrandDataList.dart';
import 'package:treva_shop_flutter/ListItem/MenuItem.dart';
//import 'package:treva_shop_flutter/ListItem/CategoryItem.dart';
import 'package:treva_shop_flutter/UI/BrandUIComponent/Chat.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/Home.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/MenuDetail.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/PromotionDetail.dart';

class brandDetail extends StatefulWidget {
  @override
  /// Get data from BrandDataList.dart (List Item)
  /// Declare class
  final Brand2 brand;
  brandDetail(this.brand);
  _brandDetailState createState() => _brandDetailState(brand);
}

class _brandDetailState extends State<brandDetail> {
  /// set key for bottom sheet
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();



  /// Get data from BrandDataList.dart (List Item)
  /// Declare class
  final Brand2 brand;
  _brandDetailState(this.brand);
  String notif = "Notifications";

  /// https://firebasestorage.googleapis.com/v0/b/beauty-look.appspot.com/o/Artboard%203.png?alt=media&token=dc7f4bf5-8f80-4f38-bb63-87aed9d59b95

  /// Custom text header for bottomSheet
  final _fontCostumSheetBotomHeader = TextStyle(
      fontFamily: "Berlin",
      color: Colors.black54,
      fontWeight: FontWeight.w600,
      fontSize: 16.0);

  /// Custom text for bottomSheet
  final _fontCostumSheetBotom = TextStyle(
      fontFamily: "Sans",
      color: Colors.black45,
      fontWeight: FontWeight.w400,
      fontSize: 16.0);
///
  /// check the condition is right or wrong for image loaded or no
  ///
  bool loadImage = true;

  /// Custom text
  static var _customTextStyleBlack = TextStyle(
      fontFamily: "Gotik",
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 15.0);

  /// Custom Text Blue Color
  static var _customTextStyleBlue = TextStyle(
      fontFamily: "Gotik",
      color: Color(0xFF6991C7),
      fontWeight: FontWeight.w700,
      fontSize: 15.0);


  /// Create Modal BottomSheet (SortBy)
  void _modalBottomSheetSort() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: new Container(
              height: 320.0,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text("SORT BY", style: _fontCostumSheetBotomHeader),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    width: 500.0,
                    color: Colors.black26,
                    height: 0.5,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => new Menu()));
                      },
                      child: Text(
                        "Popularity",
                        style: _fontCostumSheetBotom,
                      )),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    "New",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    "Discount",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    "Price: High-Low",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    "Price: Log-High",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                ],
              ),
            ),
          );
        });
  }

  /// Create Modal BottomSheet (RefineBy)
  void _modalBottomSheetRefine() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return SingleChildScrollView(
            child: new Container(
              height: 320.0,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Text("REFINE BY", style: _fontCostumSheetBotomHeader),
                  Padding(padding: EdgeInsets.only(top: 20.0)),
                  Container(
                    width: 500.0,
                    color: Colors.black26,
                    height: 0.5,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => new Menu()));
                      },
                      child: Text(
                        "Popularity",
                        style: _fontCostumSheetBotom,
                      )),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    "New",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    "Discount",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    "Price: High-Low",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                  Text(
                    "Price: Log-High",
                    style: _fontCostumSheetBotom,
                  ),
                  Padding(padding: EdgeInsets.only(top: 25.0)),
                ],
              ),
            ),
          );
        });
  }


  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    /// Hero animation for image
    final hero = Hero(
      tag: 'hero-tag-${brand.id}',
      child: new DecoratedBox(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            fit: BoxFit.cover,
            image: new AssetImage(brand.img),
          ),
          shape: BoxShape.rectangle,
        ),
        child: Container(
          margin: EdgeInsets.only(top: 130.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[
                  new Color(0x00FFFFFF),
                  new Color(0xFFFFFFFF),
                ],
                stops: [
                  0.0,
                  1.0
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(0.0, 1.0)),
          ),
        ),
      ),
    );


    /// Item first above "Week Promotion" with image Promotion
    var _promoHorizontalList = Container(
      color: Colors.white,
      height: 215.0,
      padding: EdgeInsets.only(bottom: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10.0, bottom: 3.0),
              child: Text("Week Promotion", style: _customTextStyleBlack)),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10.0),
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                /// Call itemPopular Class
                Padding(padding: EdgeInsets.only(left: 20.0)),
                itemPopular(
                  image: "assets/imgCamera/CameraDigital.png",
                  title: "Camera \n Digital",
                ),
                Padding(padding: EdgeInsets.only(left: 10.0)),
                itemPopular(
                  image: "assets/imgCamera/CompactCamera.png",
                  title: "Compact \n Camera",
                ),
                Padding(padding: EdgeInsets.only(left: 10.0)),
                itemPopular(
                  image: "assets/imgCamera/ActionCamera.png",
                  title: "Action \n Camera",
                ),
                Padding(padding: EdgeInsets.only(left: 5.0)),
              ],
            ),
          ),
        ],
      ),
    );

   
    /// Item Discount
    var _itemDiscount = Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Discount",
                  style: _customTextStyleBlack,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (_, __, ___) => new promoDetail()));
                  },
                  child: Text("See More", style: _customTextStyleBlue),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(right: 10.0),
              height: 300.0,
              ///
              ///
              /// check the condition if image data from server firebase loaded or no
              /// if image true (image still downloading from server)
              /// Card to set card loading animation
              ///
              ///
              child: loadImage? loadingImageAnimation(context):
              ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index)=>menuItemCard(itemDiscount[index]),
                itemCount: itemDiscount.length,
              ),
            ),
          )
        ],
      ),
    );

    /// Item Popular
    var _itemPopular = Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Item Popular",
                    style: _customTextStyleBlack,
                  ),
                  InkWell(
                    onTap: null,
                    child: Text("See More", style: _customTextStyleBlue),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(right: 10.0),
                height: 300.0,
                child: loadImage? loadingImageAnimation(context):
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index)=>menuItemCard(itemPopularData[index]),
                  itemCount: itemDiscount.length,
                ),
              ),
            )
          ],
        ),
      ),
    );

    /// Item New
    var _itemNew = Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "New Items",
                    style: _customTextStyleBlack,
                  ),
                  InkWell(
                    onTap: null,
                    child: Text("See More", style: _customTextStyleBlue),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(right: 10.0, bottom: 15.0),
                height: 300.0,
                ///
                ///
                /// check the condition if image data from server firebase loaded or no
                /// if image true (image still downloading from server)
                /// Card to set card loading animation
                ///
                ///
                child: loadImage? loadingImageAnimation(context):
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index)=>menuItemCard(newItems[index]),
                  itemCount: itemDiscount.length,
                ),
              ),
            )
          ],
        ),
      ),
    );

    return Scaffold(
      key: _key,
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          /// Appbar Custom using a SliverAppBar
          SliverAppBar(
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            expandedHeight: 380.0,
            elevation: 0.1,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(
                  brand.name,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17.0,
                      fontFamily: "Popins",
                      fontWeight: FontWeight.w700),
                ),
                background: Material(
                  child: hero,
                )),
          ),

          /// Container for description to Sort and Refine
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                       _promoHorizontalList,
             // _subCategory,
              _itemDiscount,
             // _itemPopular,
             // _itemNew
                   /* Padding(
                      padding: EdgeInsets.only(
                          top: 0.0, left: 0.0, right: 0.0, bottom: 0.0),
                      child: Container(
                        height: 370.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: <Widget>[
                           
                           Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, left: 20.0, right: 20.0),
                              child: Text(
                                brand.desc,
                                style: TextStyle(
                                    fontFamily: "Popins",
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.0,
                                    color: Colors.black54),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 40.0)),
                            buttonCustom(
                              color: Colors.blue,
                              txt: "Message",
                              ontap: () {
                                Navigator.of(context).push(PageRouteBuilder(
                                    pageBuilder: (_, __, ___) =>
                                        new privatemessage(brand)));
                              },
                            ),
                            Padding(padding: EdgeInsets.only(top: 10.0)),
                            buttonCustom(
                              color: Colors.indigoAccent,
                              txt: notif,
                              ontap: () {
                                var snackBar = SnackBar(
                                  content: Text(brand.name + " Notificated"),
                                  action: SnackBarAction(
                                      label: "Undo",
                                      onPressed: () {
                                        setState(() {
                                          if (notif == "Notifications") {
                                            notif = "Notificated";
                                          } else {
                                            (notif = "Notifications");
                                          }});
                                      }),
                                );
                                setState(() {
                                  if (notif == "Notifications") {
                                    notif = "Notificated";
                                  } else {
                                    (notif = "Notifications");
                                  }});
                                _key.currentState.showSnackBar(snackBar);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 15.0)),
                    Container(
                      height: 50.9,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12.withOpacity(0.1),
                              blurRadius: 1.0,
                              spreadRadius: 1.0),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: _modalBottomSheetSort,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.arrow_drop_down),
                                Padding(padding: EdgeInsets.only(right: 10.0)),
                                Text(
                                  "Sort",
                                  style: _fontCostumSheetBotomHeader,
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 45.9,
                                width: 1.0,
                                decoration:
                                    BoxDecoration(color: Colors.black12),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: _modalBottomSheetRefine,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(Icons.arrow_drop_down),
                                Padding(padding: EdgeInsets.only(right: 0.0)),
                                Text(
                                  "Refine",
                                  style: _fontCostumSheetBotomHeader,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),*/
                  ],
                ),
              ),
            ),
          ),

          /// Create Grid Item
         /* SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFF656565).withOpacity(0.15),
                          blurRadius: 4.0,
                          spreadRadius: 1.0,
                        )
                      ]),
                  child: Wrap(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text('add slider here'),
                          Container(
                            height: mediaQueryData.size.height / 3.5,
                            width: 200.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(7.0),
                                    topRight: Radius.circular(7.0)),
                                image: DecorationImage(
                                    image: AssetImage(brand.item.itemImg),
                                    fit: BoxFit.cover)),
                          ),
                          Padding(padding: EdgeInsets.only(top: 7.0)),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Text(
                              brand.item.itemName,
                              style: TextStyle(
                                  letterSpacing: 0.5,
                                  color: Colors.black54,
                                  fontFamily: "Sans",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13.0),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 1.0)),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Text(
                              brand.item.itemPrice,
                              style: TextStyle(
                                  fontFamily: "Sans",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text(
                                      brand.item.itemRatting,
                                      style: TextStyle(
                                          fontFamily: "Sans",
                                          color: Colors.black26,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.0),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 14.0,
                                    )
                                  ],
                                ),
                                Text(
                                  brand.item.itemSale,
                                  style: TextStyle(
                                      fontFamily: "Sans",
                                      color: Colors.black26,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
              childCount: 20,
            ),
            /// Setting Size for Grid Item
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 250.0,
              mainAxisSpacing: 7.0,
              crossAxisSpacing: 7.0,
              childAspectRatio: 0.605,
            ),
          ),*/
        ],
      ),
    );
  }
}

/// Class For Botton Custom
class buttonCustom extends StatelessWidget {
  String txt;
  Color color;
  GestureTapCallback ontap;

  buttonCustom({this.txt, this.color, this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 45.0,
        width: 300.0,
        decoration: BoxDecoration(
          color: color,
        ),
        child: Center(
            child: Text(
          txt,
          style: TextStyle(color: Colors.white, fontFamily: "Sans"),
        )),
      ),
    );
  }
}
