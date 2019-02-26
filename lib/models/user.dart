import 'package:flutter/material.dart';


class User{
  
  
  final String userName;
  final String mobileNumber;// = '0100xxxxxxx';
  final String email ;
  final String birthDate;// =  new DateTime(1981,1,26);
  final String address;// = 'address';
  final String country ;
  final String city ;
  final String password;
  final String firstName;
  final String lastName;
  final int gender;
  final String image;
  final String currentPackage;



  
  final int id;
  final String token;


  User({@required this.userName,@required this.id,@required this.token,@required this.email, 
  @required this.mobileNumber,@required this.birthDate,@required this.address, @required this.password,
  @required this.country,@required this.city,@required this.firstName,@required this.lastName,
  @required this.gender ,@required this.image,@required this.currentPackage });

}