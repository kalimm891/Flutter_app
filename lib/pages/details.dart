import 'package:blocks/pages/Login.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Details extends StatelessWidget {
  final email;
  final image;
  final name;
  Details(this.image, this.name, this.email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showAlertDialog(context);
            },
            icon: Icon(
              Icons.logout,
            ),
          ),
        ],
        title: Text('My Profile'),
        elevation: 00,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
      ),
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 60),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Center(
              child: Hero(
                tag: image,
                child: Container(
                  margin: EdgeInsets.only(top: 60),
                  height: 190,
                  width: 190,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey,
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.cover)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
              ),
              color: Colors.blue,
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: Text(
                      name,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: ListTile(
                    leading: Icon(Icons.email, color: Colors.white),
                    title: Text(
                      email,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: EdgeInsets.only(left: 8),
                  child: ListTile(
                    leading: Icon(Icons.phone, color: Colors.white),
                    title: Text(
                      '479896545',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {},
    );
    Widget continueButton = TextButton(
      child: Text("Continue"),
      onPressed: () async {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        await preferences.clear();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login()));
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Logout"),
      content: Text("Are you sure?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
