import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class AboutScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("About us",style:TextStyle(fontWeight: FontWeight.w100,color: Colors.purple,fontFamily: 'Lobster',fontSize: 30)),)),
      body: Padding(padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          
          children: [
                        Container(
              width: double.infinity,
              height: 1,
              color: Colors.deepPurpleAccent,
            ),
            SizedBox(height:20),
            Text("Welcome to our bank, where we make it easy for you to transfer money to your loved ones, friends, and colleagues.",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple,fontSize: 17)),
            SizedBox(height:20),
            Text("Our bank is dedicated to providing a secure and reliable platform that simplifies the process of transferring money. Whether you need to pay for a dinner bill or send money to someone across the country, we have got you covered.",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple,fontSize: 17)),
            SizedBox(height:20),
            Text("Our bank is committed to providing the best possible customer experience. We understand the importance of trust in financial transactions, which is why we use advanced security measures to ensure that your personal and financial information is safe at all times. Our user-friendly interface makes it easy for you to initiate and track your transactions, and our support team is always available to help you with any questions or concerns you may have.",style:TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple,fontSize: 17)),
            SizedBox(height:20),
            Text(" At our bank, we believe in putting our customers first. That's why we offer competitive rates and low fees to ensure that you get the most out of your money. Our platform is designed to be intuitive and hassle-free, so you can focus on what's important: sending money to your loved ones.", style:TextStyle(fontWeight: FontWeight.bold,color: Colors.deepPurple,fontSize: 17) ),
            SizedBox(height:30),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.purple,
            ),
            SizedBox(height: 10,),
            Text("Contact us",style:TextStyle(fontWeight: FontWeight.w100,color: Colors.purple,fontFamily: 'Lobster',fontSize: 20)),
            SizedBox(height:5),
            Row(
              children: [
                Icon(Icons.call),
                SizedBox(width: 5,),
                Text("01234"),

              ],
            ),
            Row(
              children: [
                Icon(Icons.email),
                SizedBox(width: 5,),
                Text("BBS@gmail.com")

              ],
            )

          ],
        ),
      ),),
    );
    throw UnimplementedError();
  }

}