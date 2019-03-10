import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treva_shop_flutter/UI/BottomNavigationBar.dart';
import 'package:treva_shop_flutter/UI/LoginOrSignup/ChoseLoginOrSignup.dart';
import 'package:treva_shop_flutter/UI/HomeUIComponent/Home.dart';
import 'package:treva_shop_flutter/UI/LoginOrSignup/Login.dart';
import 'package:treva_shop_flutter/UI/OnBoarding.dart';
import 'package:scoped_model/scoped_model.dart';
import './scoped_models/users.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'applocalizations.dart';
import './LocaleHelper.dart';

/// Run first apps open
void main() {
  runApp(MyApp());
}

typedef void LocaleChangeCallBack(Locale local);

//test pushing to git from vscode
/// Set orienttation
class MyApp extends StatefulWidget {
  @override
  _myAppState createState() => new _myAppState();
}

class _myAppState extends State<MyApp> {
  @override
  void initState() {
    _appLocalizationsDelegate = new AppLocalizationsDelegate(new Locale("en"));
    helper.onLocaleChanged = onLocaleChange;
    super.initState();
  }

  onLocaleChange(Locale locale) {
    setState(() {
      _appLocalizationsDelegate = new AppLocalizationsDelegate(locale);
    });
  }

//class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  AppLocalizationsDelegate _appLocalizationsDelegate;

  final UsersModel model = UsersModel();
  @override
  Widget build(BuildContext context) {
    /// To set orientation always portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    ///Set color status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, //or set color with: Color(0xFF0000FF)
    ));
    return ScopedModel<UsersModel>(
      model: model,
      child: MaterialApp(
        title: "Treva Shop",
        theme: ThemeData(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            primaryColorLight: Colors.white,
            primaryColorBrightness: Brightness.light,
            primaryColor: Colors.white),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          _appLocalizationsDelegate
        ],
        supportedLocales: [Locale("en"), Locale("ar")],
        locale: _appLocalizationsDelegate.overriddenLocale,
        home: SplashScreen(),

        /// Move splash screen to ChoseLogin Layout
        /// Routes
        routes: <String, WidgetBuilder>{
          "login": (BuildContext context) => new onBoarding(model)
        },
      ),
    );
  }
}

/// Component UI
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

/// Component UI
class _SplashScreenState extends State<SplashScreen> {
  @override

  /// Setting duration in splash screen
  startTime() async {
    return new Timer(Duration(milliseconds: 4500), NavigatorPage);
  }

  /// To navigate layout change
  void NavigatorPage() {
    Navigator.of(context).pushReplacementNamed("login");
  }

  /// Declare startTime to InitState
  @override
  void initState() {
    super.initState();
    startTime();
  }

  /// Code Create UI Splash Screen
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        /// Set Background image in splash screen layout (Click to open code)
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/img/man.png'), fit: BoxFit.cover)),
        child: Container(
          /// Set gradient black in image splash screen (Click to open code)
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                Color.fromRGBO(0, 0, 0, 0.3),
                Color.fromRGBO(0, 0, 0, 0.4)
              ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter)),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                    ),

                    /// Text header "Welcome To" (Click to open code)
                    Text(
                      "Welcome to",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w200,
                        fontFamily: "Sans",
                        fontSize: 19.0,
                      ),
                    ),

                    /// Animation text Treva Shop to choose Login with Hero Animation (Click to open code)
                    Hero(
                      tag: "Treva",
                      child: Text(
                        "Treva Shop",
                        style: TextStyle(
                          fontFamily: 'Sans',
                          fontWeight: FontWeight.w900,
                          fontSize: 35.0,
                          letterSpacing: 0.4,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
