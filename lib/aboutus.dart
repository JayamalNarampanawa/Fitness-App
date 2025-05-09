//importing 
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AboutUsScreen(),
    );
  }
}
//UI Decorating
class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar
      appBar: AppBar(
        title: Text('About Us', style: TextStyle(color: Colors.white)  ),
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          //bg
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/abt.jpg'), 
                fit: BoxFit.fill,
                
              ),
            ),
          ),
          //title
          Container(
            color: Colors.black.withOpacity(0.6), 
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' About Us',
                    style: TextStyle(

                    ),
                  ),
                  SizedBox(height: 20),
                  //about
                  Text(
                    "Welcome to Max Burn Gym Application, your fitness companion on the go! 💪\n\n"
                    "We know staying fit isn’t always easy, so we created an app that makes workouts at home simple, fun, and effective.\n\n"
                    "Whether you’re just starting or a seasoned pro, Max Burn helps you track progress, follow personalized workout plans, and stay motivated.\n\n"
                    "Our members of group 'NIBM Kandy DSE 24.1F grp 05'  built this app to make staying active easier for everyone. With the right tools and support, reaching your fitness goals is closer than ever!\n\n"
                    "Join us and let’s train smarter, stay strong, and achieve more—together!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
