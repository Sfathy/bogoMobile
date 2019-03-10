import 'package:scoped_model/scoped_model.dart';
import '../models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import '../models/categoty.dart';
import 'package:treva_shop_flutter/ListItem/BrandDataList.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class UsersModel extends Model {
//final String baseURL = 'http://bogocustomer.dragonssolution.com/api/';
final String baseURL = 'http://192.168.1.137:52994/api/';
  User _authenticatedUser;
  List<Category> _catlist = new List<Category>();
  List<Coupon> _couponList = new List<Coupon>();
  List<Platinum> _platinumList = new List<Platinum>();
  List<Category> get CatList {
    return _catlist;
  }
  bool get IsLoading{
    return _isLoading;
  }
  bool _isLoading = false;
  List<String> _cartItems;
  void getCartItems() async {
    http.Response response = await http
        .get(baseURL + 'Customer/getCart/' + _authenticatedUser.id.toString());
    List res;
    var data;
    if (response.statusCode == 200) {
      data = json.decode(response.body);
     // print(data);
      if (data != null) {
        String c;
        List<String> carts = new List<String>();
        for (var j = 0; j < data.length; j++) {
          //f = cs[j]['availableFeatures'];
          c = data[j];
          carts.add(c);
        }
        _cartItems = carts;
      }
    }
  }

  List<String> get CartItems {
    if (_cartItems == null || _cartItems.length == 0) {
      getCartItems();
      notifyListeners();
    }
    return _cartItems;
  }

  List<Coupon> get CouponList {
    if (_couponList == null || _couponList.length == 0) {
      //get coupon list from the server
      getCouponList();
      notifyListeners();
    }
    return _couponList;
  }

  List<Platinum> get PlatinumList {
    if (_platinumList == null || _platinumList.length == 0) {
      //get coupon list from the server
      getPlatinumList();
      notifyListeners();
    }
    return _platinumList;
  }
List<Brand2> _brandData;
List<Brand2> get brandData2
{
  if (_brandData == null || _brandData.length == 0) {
      //get coupon list from the server
      getMainCat();
      notifyListeners();
    }
    return _brandData;
}
void getMainCat() async {
  //http.get('http://10.41.9.107:52994/api/Category/getMaincat');
  http.Response response =
      await http.get(baseURL + 'Category/getMaincat');
  List res;
  var data;
  print(response.body);
  if (response.statusCode == 200) {
    data = json.decode(response.body);
    _brandData = new List<Brand2>();
    for (var i = 0; i < data.length; i++) {
      _brandData.add(new Brand2(
          desc: data[i]['desc'],
          name: data[i]['name'],
          id: data[i]['id'].toString(),
          img: data[i]['img'],
          item: items(
              itemImg: "assets/imgBrand/brandNike.jpg",
              itemId: "1",
              itemName: "Nike Sport Shoes Running Man Blue Black",
              itemPrice: "\$ 100",
              itemRatting: "4.5",
              itemSale: "200 Sale")));
    }
    }
  }
  void getPlatinumList() async {
    http.Response response = await http.get(
        baseURL + 'Customer/getPlatinum/' + _authenticatedUser.id.toString());
    List res;
    var data;
    if (response.statusCode == 200) {
      data = json.decode(response.body);
     // print(data);
      if (data != null) {
        Platinum c;
        List<Platinum> coupons = new List<Platinum>();
        for (var j = 0; j < data.length; j++) {
          //f = cs[j]['availableFeatures'];
          c = new Platinum(
            id: data[j]['id'],
            title: data[j]['title'],
            description: data[j]['description'],
            faceBookLink: data[j]['faceBookLink'],
            image: data[j]['image'],
            whatsNumber: data[j]['whatsNumber'],
          );
          coupons.add(c);
        }
        _platinumList = coupons;
      }
    }
  }

  void getCouponList() async {
    http.Response response = await http.get(
        baseURL + 'Customer/getCoupon/' + _authenticatedUser.id.toString());
    List res;
    var data;
    if (response.statusCode == 200) {
      data = json.decode(response.body);
     // print(data);
      if (data != null) {
        Coupon c;
        List<Coupon> coupons = new List<Coupon>();
        for (var j = 0; j < data.length; j++) {
          //f = cs[j]['availableFeatures'];
          c = new Coupon(
            id: data[j]['id'],
            validTillEN:
                data[j]['validTillEN'] != null ? data[j]['validTillEN'] : '',
            validTillAR:
                data[j]['validTillAR'] != null ? data[j]['validTillAR'] : '',
            image: data[j]['image'] != null ? data[j]['image'] : '',
            icon: data[j]['icon'] != null ? data[j]['icon'] : '',
            descriptionAR: data[j]['descriptionAR'] != null
                ? data[j]['descriptionAR']
                : '',
            descriptionEN: data[j]['descriptionEN'] != null
                ? data[j]['descriptionEN']
                : '',
          );
          coupons.add(c);
        }
        _couponList = coupons;
      }
    }
  }

  List<String> _history;
  void getHistory() async {
    http.Response response = await http.get(
        baseURL + 'Customer/getHistory/' + _authenticatedUser.id.toString());
    List res;
    var data;
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      //print(data);
      if (data != null) {
        String c;
        List<String> history = new List<String>();
        for (var j = 0; j < data.length; j++) {
          //f = cs[j]['availableFeatures'];
          c = data[j];
          history.add(c);
        }
        _history = history;
      }
    }
  }

  List<String> get History {
    if (_history == null || _history.length == 0) {
      getHistory();
      notifyListeners();
    }
    return _history;
  }

  List<PredefinedPackage> _prePackages;
  void getPrePackages() async {
    http.Response response = await http.get(baseURL + 'Packages/getPackages');
    List res;
    var data;
    if (response.statusCode == 200) {
      data = json.decode(response.body);
     // print(data);
      if (data != null) {
        PredefinedPackage c;
        List<PredefinedPackage> prePackages = new List<PredefinedPackage>();
        for (var j = 0; j < data.length; j++) {
          //f = cs[j]['availableFeatures'];
          c = new PredefinedPackage(
              id: data[j]['id'],
              name: data[j]['name'],
              price: data[j]['price']);
          prePackages.add(c);
        }
        _prePackages = prePackages;
      }
    }
  }

  List<dynamic> get PrePackages {
    if (_prePackages == null || _prePackages.length == 0) {
      getPrePackages();
      notifyListeners();
    }
    return _prePackages;
  }

  List<Brand> _offers;
  void getoffers() async {
    http.Response response = await http.get(baseURL + 'Packages/getOffers');
    List res;
    var data;
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      //print(data);
      if (data != null) {
        dynamic c;
        List<Brand> offers = new List<Brand>();
        for (var j = 0; j < data.length; j++) {
          //f = cs[j]['availableFeatures'];
          c = new Brand(
            id: data[j]['id'],
            brandName: data[j]['name'] != null ? data[j]['name'] : '',
            brandDescription: data[j]['brandDescription'] != null
                ? data[j]['brandDescription']
                : '',
            brandImage:
                data[j]['logoImage'] != null ? data[j]['logoImage'] : '',
            price: data[j]['price'] != null
                ? double.parse(data[j]['price'].toString())
                : 0.0,
          );
          offers.add(c);
        }
        _offers = offers;
      }
    }
  }

  List<dynamic> get Offers {
    if (_offers == null || _offers.length == 0) {
      getoffers();
      notifyListeners();
    }
    return _offers;
  }

  User get AuthenticatedUser {
    return _authenticatedUser;
  }

  String get ImagePath {
    return "http://bogo.dragonssolution.com/uploads/img/";
  }

  String get DefaultImage {
    return "assets/HomePage/Pizza-Hut.png";
  }

  Future<Map<String, dynamic>> buyPackage(String type,List<Brand> selectOffers,int selPredefined,double price) async{
   
     Map<String, dynamic> packageVM = {
       'PakageId': selPredefined.toString(),
       'Brands': selectOffers,
       'Price': price,
       'Platinums':[]
    };
       http.Response response = await http.post(baseURL + 'Packages/buyPackage/' +type.toUpperCase()+'/'+_authenticatedUser.id.toString() ,
        headers: {'content-type': 'application/json'},
        body: json.encode(packageVM));
        print(response.body);
    return {'success':true,'message':'congratulation you but a package'};
  } 

   Future<Map<String, dynamic>> generateCode(List<Coupon> selectedCoupons,List<Platinum>selectedPlatinum) async{
   List<int> selCoup = [];
   for (var i = 0; i < selectedCoupons.length; i++) {
     if(selectedCoupons[i].isSelected) selCoup.add(selectedCoupons[i].id);
   }  
   

List<int> selPlat = [];
   for (var i = 0; i < selectedPlatinum.length; i++) {
     if(selectedPlatinum[i].isSelected)selPlat.add(selectedPlatinum[i].id);
   }  
   
     Map<String, dynamic> packageVM = {
       'brands': selCoup,
       'platinum': selPlat
    };
   // Jso
    //json
       http.Response response = await http.post(baseURL + 'Packages/generateCode/'+_authenticatedUser.id.toString() ,
        //Uri.encodeFull(Ur),//(ConfigApi.SAVE),
        headers: {'content-type': 'application/json'},
        body: json.encode(packageVM));//json.encode({'param':selectedPlatinum}));
        print(response.body);
       // print(response.body);
    return {'success':true,'message':response.body};
  } 
  Future<Map<String, dynamic>> signUp(User user) async {
    /*
      {
        "FirstName": "Hossam",
        "LastName": "Fathy",
        "Mobile": "0101919324",
        "FacebookName": "soso",
        "Gender": 0,
        "BirthDate": "1987-09-30",
        "LocationId": null,
        "LatestIMEI": null,
        "ProfilePicture": null,
        "UserName": "semsem",
        "Email": "semsem9000@gmail.com",
        "Password":"123456"
    }
    {FirstName: Hossam, 
    LastName: Fathy, 
    Mobile: 01000924244, 
    FacebookName: soso, 
    Gender: 0, 
    BirthDate: 1987-09-30, 
    LocationId: 0, 
    LatestIMEI: 0, 
    ProfilePicture: test, 
    UserName: user@bogo.com, 
    Email: user@bogo.com, 
    Password: 123456}
    */
    Map<String, dynamic> userData = {
      'FirstName': user.firstName,
      'LastName': user.lastName,
      'Mobile': user.mobileNumber,
      'FacebookName': 'soso',
      'Gender': user.gender,
      'BirthDate': user.birthDate,
      'LocationId': null,
      'LatestIMEI': null,
      'ProfilePicture': 'test',
      'UserName': user.email,
      'Email': user.email,
      'Password': user.password
    };
    http.Response response = await http.post(baseURL + 'Auth/insertuser',
        headers: {'content-type': 'application/json'},
        body: json.encode(userData));
    
    if (response.statusCode == 200) {
      return login(user.email, user.password);
    }else{
       print('sign up response:' + response.body.toString());
       return {'success': false, 'message': 'error while register the user'};
    }
    //_authenticatedUser = User(userName:user.userName,token:'token',id: 0  );
    //notifyListeners();
    //print(_authenticatedUser.userName);
    // print(json.decode(response.body));
    //return true;
  }

  void getValues() async {
    http.Response response = await http.get(baseURL + 'values', headers: {
      "Content-Type": "application/json",
      "Authorization": "bearer " + _authenticatedUser.token
    });
   // print(json.decode(response.body));
  }

  //Future<List<Map<String, dynamic>> getCategoryList()async{
  Future<List> getCategoryList() async {
    //Future<Map<String, dynamic>> responseData= {'success': 'false', 'message': 'Error while communicating server'};
    http.Response response = await http.get(baseURL + 'Category/get');
    List res;
    // print('get cat response: ' + response.body.toString());
    if (response.statusCode == 200) {
      res = json.decode(response.body);
      var data = res; //json.decode(response.body);
      if (data != null) {
        var _catlst = new List<Category>();
        List<Brand> brands = new List<Brand>();
        Brand b;
        Category c;
        for (var i = 0; i < data.length; i++) {
          brands = new List<Brand>();
          List bs = data[i]['brandsVM'];
          if (bs != null) {
            for (var j = 0; j < bs.length; j++) {
              b = new Brand(
                id: bs[j]['id'],
                brandName: bs[j]['name'] != null ? bs[j]['name'] : '',
                brandDescription: bs[j]['brandDescription'] != null
                    ? bs[j]['brandDescription']
                    : '',
                brandImage:
                    bs[j]['logoImage'] != null ? bs[j]['logoImage'] : '',
              );
              brands.add(b);
            }
          }
          c = new Category(
              id: data[i]['id'],
              categoryName: (data[i]['name'] != null) ? data[i]['name'] : '',
              icon: data[i]['iconImage'] != null ? data[i]['iconImage'] : '',
              brands: brands);
          _catlst.add(c);
        }
        _catlist = _catlst;
      }
    }

    // print(res);
    //return res;
    return _catlist;
  }

  Future<BrandDetails> getBrandDetails(int brandID) async {
    //Future<Map<String, dynamic>> responseData= {'success': 'false', 'message': 'Error while communicating server'};
    http.Response response =
        await http.get(baseURL + 'Brands/get/' + brandID.toString());
   // print('brand details response: ' + response.body.toString());
    BrandDetails res;
    var data;
    List<Branch> branches;
    List<Coupon> coupons;
    List<Platinum> platinums;
    //   print('get cat response: ' + response.body.toString());
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      if (data != null) {
        Branch b;
        Coupon c;
        Platinum p;
        //res.id = int.parse( data['id'].toString());
        branches = new List<Branch>();
        List bs = data['branches'];
        List cs = data['coupons'];
        List ps = data['platinums'];
        List<dynamic> f;
        List<String> fs;
        if (bs != null) {
          for (var j = 0; j < bs.length; j++) {
            f = bs[j]['availableFeatures'];
            fs = new List<String>();
            if (f != null) {
              for (var i = 0; i < f.length; i++) {
                fs.add(f[i].toString());
              }
            }
            b = new Branch(
              id: bs[j]['id'],
              branchName:
                  bs[j]['branchName'] != null ? bs[j]['branchName'] : '',
              branchAddress:
                  bs[j]['branchAddress'] != null ? bs[j]['branchAddress'] : '',
              branchLocation: bs[j]['branchLocation'] != null
                  ? bs[j]['branchLocation']
                  : '',
              branchTelephone: bs[j]['branchTelephone'] != null
                  ? bs[j]['branchTelephone']
                  : '',
              availableFeatures: fs,
            );
            branches.add(b);
          }
        }

        if (cs != null) {
          coupons = new List<Coupon>();
          for (var j = 0; j < cs.length; j++) {
            f = cs[j]['availableFeatures'];
            c = new Coupon(
              id: cs[j]['id'],
              validTillEN:
                  cs[j]['validTillEN'] != null ? cs[j]['validTillEN'] : '',
              validTillAR:
                  cs[j]['validTillAR'] != null ? cs[j]['validTillAR'] : '',
              image: cs[j]['image'] != null ? cs[j]['image'] : '',
              icon: cs[j]['icon'] != null ? cs[j]['icon'] : '',
              descriptionAR:
                  cs[j]['descriptionAR'] != null ? cs[j]['descriptionAR'] : '',
              descriptionEN:
                  cs[j]['descriptionEN'] != null ? cs[j]['descriptionEN'] : '',
              isSelected: false,
              isActive: cs[j]['isActive'] != null ? cs[j]['isActive'].toString().toLowerCase()=='true'?true:false : false,
              isUsed: cs[j]['used'] != null ? cs[j]['used'].toString().toLowerCase()=='true'?true:false : false,
            );
            coupons.add(c);
          }
        }
        if (ps != null) {
          platinums = new List<Platinum>();
          for (var j = 0; j < ps.length; j++) {
            //f = cs[j]['availableFeatures'];
            p = new Platinum(
              id: ps[j]['id'],
              description: ps[j]['description'],
              title: ps[j]['title'],
              faceBookLink: ps[j]['faceBookLink'],
              image: ps[j]['image'],
              whatsNumber: ps[j]['whatsNumber'],
              isSelected: false,
              isActive: ps[j]['isActive'] != null ? ps[j]['isActive'].toString().toLowerCase()=='true'?true:false : false,
              isUsed: ps[j]['used'] != null ? ps[j]['used'].toString().toLowerCase()=='true'?true:false : false,
            );
            platinums.add(p);
          }
        }
        res = new BrandDetails(
            id: int.parse(data['id'].toString()),
            brandName: data['brandName'].toString(),
            brandDescription: data['brandDescription'].toString(),
            brandPhone: data['brandPhone'].toString(),
            brandLocation: data['brandLocation'].toString(),
            brandIcon: data['brandIcon'].toString(),
            brandImage: data['brandImage'].toString(),
            brandTwttierLink: data['brandTwttierLink'].toString(),
            brandFaceLink: data['brandFaceLink'].toString(),
            branches: branches,
            platinums: platinums,
            coupons: coupons);
      }
    }
    //print(res);
    return res;
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    _isLoading = true;
    notifyListeners();
    Map<String, dynamic> user = {'username': email, 'password': password};
    http.Response response = await http.post(baseURL + 'Auth/Login',
        headers: {"Content-Type": "application/json"}, body: json.encode(user));
    bool hasError = true;
    String message = 'user name not exist or password is not valid';
    //http.Response response = await http.post(baseURL + 'login?username=' + email + '&password=' + password );
    //print(response.statusCode.toString());
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      //print(responseData.toString());
      if (responseData.containsKey('token')) {
        hasError = false;

        _authenticatedUser = User(
            userName: responseData['user']['userName'],
            token: responseData['token'],
            email: responseData['user']['email'],
            id: 0,
            mobileNumber: responseData['user']['Mobile'],
            address: '',
            birthDate: responseData['user']['BirthDate'],
            lastName: responseData['user']['lastName'],
            gender: responseData['user']['gender'],
            firstName: responseData['user']['firstName'],
            currentPackage: responseData['currentPackage'],
            image:  responseData['user']['ProfilePicture']);
        //print('authonticated user: ' + _authenticatedUser.toString());
        message = 'Authontication succeeded';
        /*final SharedPreferences preps = await SharedPreferences.getInstance();
        preps.setString('token', responseData['token'].toString());
        preps.setString(
            'userName', responseData['user']['userName'].toString());
        preps.setString('email', responseData['user']['email'].toString());
        preps.setString(
            'mobileNumber', responseData['user']['Mobile'].toString());
        preps.setString(
            'birthDate', responseData['user']['BirthDate'].toString());
        preps.setString(
            'lastName', responseData['user']['lastName'].toString());
        preps.setString(
            'firstName', responseData['user']['firstName'].toString());
        preps.setString('gender', responseData['user']['gender'].toString());
*/
        //await initializeCat();
      }
    }
    _isLoading = false;
    notifyListeners();
    //print(message);
    return {'success': !hasError, 'message': message};
    //return truel
  }

  void logout() async{
   // final SharedPreferences preps = await SharedPreferences.getInstance();
    _authenticatedUser = null;
   // preps.clear();

  }
  void AutoAuth() async {
    /*final SharedPreferences preps = await SharedPreferences.getInstance();
    final String token = preps.getString('token');
    if (token != null) {
      final String userName = preps.getString('userName');
      final String email = preps.getString('email');
      final String mobileNumber = preps.getString('mobileNumber');
      final String birthDate = preps.getString('birthDate');
      final String lastName = preps.getString('lastName');
      final String firstName = preps.getString('firstName');
      final String gender = preps.getString('gender');
      _authenticatedUser = User(
          userName: userName,
          token: token,
          email: email,
          id: 0,
          mobileNumber: mobileNumber,
          address: '',
          //birthDate:DateTime.parse( birthDate),
          lastName: lastName,
          gender: int.parse(gender),
          firstName: firstName,
          currentPackage: '');
      notifyListeners();
    }*/
  }

  Future<List<Brand>> getPackageOffers(int packageID) async {
    List<Brand> coupons = new List<Brand>();
    http.Response response =
        await http.get(baseURL + 'Packages/getPackage/' + packageID.toString());
    List res;
    var data;
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      // print(data);
      if (data != null) {
        Brand c;

        for (var j = 0; j < data.length; j++) {
          //f = cs[j]['availableFeatures'];
          c = new Brand(
            id: data[j]['id'],
            brandName: data[j]['name'] != null ? data[j]['name'] : '',
            brandDescription: data[j]['brandDescription'] != null
                ? data[j]['brandDescription']
                : '',
            brandImage:
                data[j]['logoImage'] != null ? data[j]['logoImage'] : '',
            price: data[j]['price'] != null
                ? double.parse(data[j]['price'].toString())
                : 0.0,
          );
          coupons.add(c);
        }
        // _couponList = coupons;
      }
    }
    notifyListeners();
    return coupons;
  }
}
