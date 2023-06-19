import 'package:flutter/services.dart';
import 'package:sparks_bank/modules/AboutScreen.dart';
import 'package:sparks_bank/modules/TransactionsScreen.dart';
import 'package:sparks_bank/modules/UsersScreen.dart';
import 'package:sparks_bank/shared/BLoC/cubit.dart';
import 'package:sparks_bank/shared/BLoC/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqlite_api.dart';

class WelcomeScreen extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {

    var cubit=BankCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("WELCOME TO BBS BANK!",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w900,fontFamily: 'DancingScript',color:Colors.purple),),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarBrightness: Brightness.dark),
      ),
      body:Padding(padding: EdgeInsets.symmetric(horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
          children: [
           SizedBox(height:3),
           Text("   Easing communications between customers!",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100,color: Colors.deepPurpleAccent,fontFamily: 'Lobster'),),
           SizedBox(height:35),
            Image(image: AssetImage('assets/images/images.jpeg')),
            
            
            SizedBox(height:10),
            GredientButton(
              onPressed: ()
              {
                
                  cubit.navigateTo(context,UsersScreen());

                  cubit.InsertIntoUsers(name: "Rawan Sameh", email: "rawan@gmail.com", amount: 3000,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Renad Hamad", email: "renad@gamil.com", amount: 1200,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Jana Sherif", email: "jana@gmail.com", amount: 4000,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Nada Moursi", email: "nada@gmail.com", amount: 5500,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Zeina Qassem", email: "zeina@gamil.com", amount: 2000,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Iman Elsadany", email: "iman@gmail.com", amount: 6000,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Mira Shanouda", email: "mira@gmail.com", amount: 7080,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Mariam Ali", email: "mariam@gmail.com", amount: 8000,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Ahmed Salah", email: "ahmed@gmail.com", amount: 7700,phone: "01123453224",url:"assets/images/profile.png");
                  cubit.InsertIntoUsers(name: "Nardeen Meligy", email: "nardeen@gmail.com", amount: 5000,phone: "01123453224",url:"assets/images/profile.png");


              },
                  colors: [
                     Colors.purple,
                    Colors.deepPurpleAccent
                  ], title: "       Customers      ",),
                  SizedBox(height:10),
            GredientButton(
              onPressed: (){
                cubit.navigateTo(context, TransactionsScreen());
              },
                  colors: [

                    Colors.purple,
                    Colors.deepPurpleAccent
                  ], title: "     Transactions    ",),
                 
                  SizedBox(height:10),
                  GredientButton(
              onPressed: (){
                cubit.navigateTo(context, AboutScreen());
              },
                  colors: [

                    Colors.purple,
                    Colors.deepPurpleAccent
                  ], title: "        About Us         ",),
          ],
        ),
        )) ,

       

    );
  }
  
}