import 'package:fluttertoast/fluttertoast.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:sparks_bank/modules/TransactionHistory.dart';
import 'package:sparks_bank/shared/BLoC/cubit.dart';
import 'package:sparks_bank/shared/BLoC/states.dart';
import 'package:sparks_bank/shared/Components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_buttons/flutter_awesome_buttons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';


class UserProfile extends StatefulWidget
{
  late Map user;
  UserProfile(Map u)
  {
    user=u;
  }
  @override
 User createState() {
    return User(user);
    throw UnimplementedError();
  }

}


class User extends State<UserProfile>
{
  
  late Map user;
  late int amountt;
  User(Map u)
  {
    user=u;
    amountt=user['amount'];
  }
  
          var nameController=TextEditingController();
        var amountController=TextEditingController();
        var formkey = GlobalKey<FormState>();

        Future<void>_handleRefresh()async
        {
          return await Future.delayed(Duration(seconds: 1));
        }
  @override
  Widget build(BuildContext context) {
    List<Map>history=[];
    return BlocConsumer<BankCubit,BankSatates>(
      builder: (context,state){

        var cubit=BankCubit.get(context);
        
        

        return new Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.purple,),onPressed: (){Navigator.pop(context);},),
           ),
          body:Center(
            child: Padding(
            padding: EdgeInsets.all(5),
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.deepPurple,
                  radius: 100,
                  child: Image(image: AssetImage('assets/images/profile.png')),
                ),

                SizedBox(height: 30,),
                Text("${user['name']}",style:TextStyle(fontWeight: FontWeight.w100,color: Colors.purple,fontFamily: 'Lobster',fontSize: 30),),
                SizedBox(height: 30,),


                Center(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(height:10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    
                      Text("Email:",style: TextStyle(color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 20)),
                      SizedBox(width: 10,),
                      Text("${user['email']}", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20) ),
                    ],),
                    SizedBox(height:10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("Balance:",style: TextStyle(color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 20),),
                        SizedBox(width: 10,),
                        Text("${amountt}" + " EGP", style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20)),
                      ],),


                  ],
                ),

                ),

                SizedBox(height:40),

                GredientButton(
              onPressed: ()
              {
                _displayTextInputDialog(context,user['amount'],user['name']);
                

              },
                  colors: [
                    Colors.purple,
                    Colors.deepPurpleAccent
                  ], title: "     Transfer   ",),

                  SizedBox(height:10),

                   GredientButton(
              onPressed: ()
              {
                cubit.history(user['name']);
                Navigator.push(context, MaterialPageRoute(builder: (context) => TransactionsHistory()));

              },
                  colors: [

                    Colors.purple,
                    Colors.deepPurpleAccent
                  ], title: "     Transaction history    ",),

              ],
            ),
              ))),
          )
        );
      },
       listener:(context,state){} );
    throw UnimplementedError();
  }

  Future<void> _displayTextInputDialog(BuildContext context,int useramount,String sendername) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Transfer to',style:TextStyle(fontWeight: FontWeight.w100,color: Colors.purple,fontFamily: 'Lobster',fontSize: 20),),
          content: SingleChildScrollView(

            child:Container(
            height: 150,
            child: Form(
              key: formkey,
            child:
                SizedBox(
                  height: 400,
                  width: 200,
                  child: ListView(
                  children: [
                    TextFormField(
            onChanged: (value) {
     
            },
            keyboardType: TextInputType.name,
            controller: nameController,
            decoration: InputDecoration(
              hintText: "Name",
              prefixIcon: Icon(Icons.person,color: Colors.purple,)),
              validator: (value) {
                if(value!.isEmpty)
                {
                  return "Please enter a name. ";
                }
                if(!BankCubit.get(context).recieverFound(value, BankCubit.get(context).users))
                {
                  return "There is no account for this name. ";
                }
              },
              
          ),

          TextFormField(
            onChanged: (value) {

     
            },
            validator: (value) {
              if(value!.isEmpty)
              {
                return "Please enter the amount";
              }
              if(int.parse(value)>user['amount'])
              {
                return "No sufficient balance in this account  ";
              }
            },
            keyboardType: TextInputType.number,
            controller: amountController,
            decoration: InputDecoration(
              hintText: "Amount",
              prefixIcon: Icon(Icons.attach_money_outlined,color: Colors.purple,)),
          ),
                  ],
                ),)
              ),
          ) ,
          ),

            actions: <Widget>[
               GredientButton(
              onPressed: (){
                int index=BankCubit.get(context).recieverIndex(nameController.text, BankCubit.get(context).users);
                if(formkey.currentState != null &&
                      formkey.currentState!.validate())
                      {
                        if(int.parse(amountController.text)<=user['amount'])
                        {

                          

                          setState(() {
                            BankCubit.get(context).UpdateSenderDB(amount: useramount-int.parse(amountController.text), sender: user['name']);
                          BankCubit.get(context).UpdateRecieverDB(amount: BankCubit.get(context).users[index]['amount']+int.parse(amountController.text), reciever: nameController.text);
                          });

                                                    var dt = new DateTime.now();
                          var formatter = new DateFormat('yyyy-MM-dd HH:mm:ss');
                          String formatted = formatter.format(dt);
                          BankCubit.get(context).InsertIntoTransactions(sender: user['name'], reciever: nameController.text, amount: int.parse(amountController.text), datetime: formatted);


                           Navigator.pop(context);

                           Fluttertoast.showToast(
                           msg: "Amount transferred successfully!",
                           toastLength: Toast.LENGTH_SHORT,
                           gravity: ToastGravity.CENTER,
                           timeInSecForIosWeb: 1,
                           backgroundColor: Colors.deepPurpleAccent,
                           textColor: Colors.white,
                           fontSize: 16.0);





                        }
                      }
              },
                  colors: [
                       Colors.purple,
                    Colors.deepPurpleAccent
                  ], title: "    Transfer   ",),


            
  
           ],

        );
      });
}



} 