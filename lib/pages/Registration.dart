
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:vehicle_rental_system/components/buttons.dart';
import 'package:vehicle_rental_system/components/constants.dart';
import 'package:vehicle_rental_system/pages/home_page.dart';
import 'package:vehicle_rental_system/pages/logIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey=GlobalKey<FormState>();
   late String email;
   late String password;
   late String userName;
   late String phoneNumber;
   final _auth=FirebaseAuth.instance;
   final _firestore= FirebaseFirestore.instance;
   bool showSpinner=false;
   final _userNameTextEditingController=TextEditingController();
   final _phoneNumbetrTextEditingController=TextEditingController();
   final _emailTextEditingController=TextEditingController();
   final _passwordTextEditingController=TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 60,
                    child: Hero(
                      tag: Text('hero'),
                      child: Image.asset('Images/car_logo.png')),),
                    SizedBox(height: 20,),
                  TypewriterAnimatedTextKit(
                  text: [
                    'Vehicle Rental'
                  ],
                  speed: Duration(milliseconds: 200),
                  textStyle: TextStyle( fontSize: 45.0,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w900,),
                     ),
                      SizedBox(
                    height: 48.0,
                  ),
                  TextFormField(
                    controller: _userNameTextEditingController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.name,
                    onChanged: (value) {
                      //Do something with the user input.
                      userName=value;
                      
                    },
                    decoration: Constants.kInputDecoration.copyWith(hintText: 'Enter your full_name'),
                     validator: (value){
                      if(value!.isEmpty || !RegExp(r'^[A-Z a-z]+$').hasMatch(value!)) {
                        return 'Enter correct name';
        
                      }
                      else return null;
                    },
                  ),
                  SizedBox(height: 8,),
                  TextFormField(
                    controller: _phoneNumbetrTextEditingController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      //Do something with the user input.
                      phoneNumber=value;
                      
                    },
                    decoration: Constants.kInputDecoration.copyWith(hintText: 'Enter your phone number'),
                     validator: (value){
                      if(value!.isEmpty || !RegExp(r'^[+]*[0-9]+$').hasMatch(value!)) {
                        return 'Enter correct phone number';
        
                      }
                      else return null;
                    },
                  ),
                  SizedBox(height: 8,),
                   TextFormField(
                    controller: _emailTextEditingController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      //Do something with the user input.
                      email=value;
                      
                    },
                    decoration: Constants.kInputDecoration.copyWith(hintText: 'Enter your email'),
                     validator: (value){
            if(value!.isEmpty || !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(value!)) {
                        return 'Enter correct email';
        
                      }
                      else return null;
                    },
                  ),
                  SizedBox(height: 8,),
                    TextFormField(
                      controller: _passwordTextEditingController,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    onChanged: (value) {
                      //Do something with the user input.
                      password=value;
                    },
                    decoration: Constants.kInputDecoration.copyWith(hintText: 'Enter your password'),
                     validator: (value){
                      if(value!.isEmpty) {
                        return 'Enter correct password';
        
                      }
                      if(value.length < 6 && value.length >0){
                        return 'the password must greater than 5';
                      }
                      else return null;
                    },
                  ),
                  SizedBox(height: 24,),
                  Buttons(buttonType: 'Register', onPressed: () async{
                      if(_formKey.currentState!.validate()){
                        _userNameTextEditingController.clear();
                        _passwordTextEditingController.clear();
                        _emailTextEditingController.clear();
                        _passwordTextEditingController.clear;
                        setState(() {
                          showSpinner=true;
                        });
                      final snackBar=SnackBar(content: Text('Submitting form'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      // Registering user with email and password
                         try{
                  final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                 if(newUser != null){
                  _firestore.collection('Registration').add(
                    {
                      'userName': userName,
                      'phoneNumber': phoneNumber,
                    }
                  );
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())); 
                 }
                 setState(() {
                   showSpinner=false;
                 });
            
                 }
                 catch(e){
                  print(e);
                 }
                    } 
                  }, 
                  color: Colors.blueAccent),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Do you have an account?',style: TextStyle(color: Colors.black45,fontSize: 15),),
                      MaterialButton(onPressed: (){},
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
                        },
                        child: Text('Sign In',style: TextStyle(color: Colors.blueAccent,fontSize: 15),)),)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}