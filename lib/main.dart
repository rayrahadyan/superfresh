// @dart=2.9
//import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

import 'package:superfresh/screens/product_detail_screen.dart';
import 'package:superfresh/screens/products_overview_screen.dart';
import 'package:superfresh/provider/all_products.dart';





void main(List<String> args) {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: Splash(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Splash Screen
class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: login(),
        title: Text("Super Fresh"),
        image: Image.asset("images/ic_launcher.png"),
        photoSize: 200.0
    );

  }
}

//Login Screen
class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Super Fresh"),
          backgroundColor: Colors.lightGreen,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              // margin: EdgeInsets.only(bottom: 1),
              height: 1000,
              width: 500,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Center(
                child: Column(
                  children: [
                    Image(
                      image: AssetImage("images/ic_launcher.png"),
                      height: 300,
                      width: 500,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: const TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 1),
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      child: const Text(
                        'Forgot Password',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Container(
                        height: 50,
                        width: 500,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text('Login'),
                          style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Home()));
                          },
                        )),
                    Row(
                      children: <Widget>[
                        const Text('Does not have account?'),
                        TextButton(
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signup()));
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Signup Screen
class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Super Fresh"),
          backgroundColor: Colors.lightGreen,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              padding: EdgeInsets.all(5),
              // margin: EdgeInsets.only(bottom: 1),
              height: 1000,
              width: 500,
              color: Color.fromARGB(255, 255, 255, 255),
              child: Center(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 20, top: 20),
                      child: const TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: const TextField(
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirm Password',
                        ),
                      ),
                    ),
                    Container(
                        height: 50,
                        width: 500,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text('Sign Up'),
                          style:
                          ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => login()));
                          },
                        )),
                    Row(
                      children: <Widget>[
                        const Text('Have an Account?'),
                        TextButton(
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => login()));
                            //signup screen
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Super Fresh',
        theme: ThemeData(
          primarySwatch: Colors.lightGreen,
          accentColor: Colors.white,
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}

//Home Screen
class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Super Fresh'),
            actions: [
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => profile()));
                }
              )

            ],
            backgroundColor: Colors.lightGreen,
          ),
          extendBodyBehindAppBar: true,
          body: Container(
            width: 500,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 5, right: 5),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox.fromSize(
                      size: Size.fromRadius(48), // Image radius
                      child: Image(
                          image: AssetImage('images/ic_launcher.png'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  // child: Image(image: AssetImage("images/kebakaran.jpg")),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 500,
                  width: 300,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(10), // Image border
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(48), // Image radius
                            child: Image(
                                image: AssetImage('images/milk.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        title: Text('Milk'),
                        subtitle: Text('Rp 36.000'),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => cartPage()));
                        },
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 0),
                  height: 500,
                  width: 300,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: ClipRRect(
                          borderRadius:
                          BorderRadius.circular(10), // Image border
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(48), // Image radius
                            child: Image(
                                image: AssetImage('images/milk.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        title: Text('Oreo'),
                        subtitle: Text('Rp 10.000'),
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => cartPage()));
                        },
                      );
                    }
                  ),
                )
              ],
            ),
          )),
    );
  }
}

//Cart Screen
class cartPage extends StatelessWidget {
  const cartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
          backgroundColor: Colors.lightGreen,
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => HomeScreen()));
            },
          ),
          // title: Text(""),
          // centerTitle: true,
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              margin: EdgeInsets.only(top: 0),
              height: 70,
              width: 300,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('Oreo'),
                      subtitle: Text('Rp 10.000'),
                    );
                  }
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Profile Screen
class profile extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Profile'),
            backgroundColor: Colors.lightGreen,
            leading: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => Home()));
              },
            ),
            // title: Text(""),
            // centerTitle: true,
          ),
          extendBodyBehindAppBar: true,
          body: Container(
            width: 500,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 50,
                  width: 300,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: IconButton(
                          icon:
                          Icon(Icons.person),
                        ),
                        title: Text('Profile'),
                        onTap: () {

                        },
                      );
                    },
                  ),
                ),
                Divider(
                  color: Colors.black54,
                ),
                Container(
                  margin: EdgeInsets.only(top: 0),
                  height: 50,
                  width: 300,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: IconButton(
                          icon:
                          Icon(Icons.discount),
                        ),
                        title: Text('Promo'),
                        onTap: () {

                        },
                      );
                    },
                  ),
                ),
                Divider(
                  color: Colors.black54,
                ),
                Container(
                  margin: EdgeInsets.only(top: 0),
                  height: 50,
                  width: 300,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: IconButton(
                          icon:
                          Icon(Icons.home),
                        ),
                        title: Text('Address'),
                        onTap: () {

                        },
                      );
                    },
                  ),
                ),
                Divider(
                  color: Colors.black54,
                ),
                Container(
                  margin: EdgeInsets.only(top: 0),
                  height: 50,
                  width: 300,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: IconButton(
                          icon:
                          Icon(Icons.credit_card),
                        ),
                        title: Text('Payment'),
                        onTap: () {

                        },
                      );
                    },
                  ),
                ),
                Divider(
                  color: Colors.black54,
                ),
              ],
            ),
          )),
    );
  }
}