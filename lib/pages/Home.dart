import 'package:blocks/pages/Login.dart';
import 'package:blocks/pages/details.dart';
import 'package:blocks/provider/userData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Homes'),

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
      ),
      body: Container(
        padding: EdgeInsets.only(top: 25),
        child: Card(
          child: FutureBuilder(
            future: userData.getdata(),
            builder: (context, _) {
              return ListView.builder(
                  itemCount: userData.userList.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 2,
                                blurRadius: 10)
                          ]),
                      child: ListTile(
                        leading: Hero(
                          tag: userData.userList[i]["avatar"],
                          child: CircleAvatar(
                            radius: 36,
                            backgroundImage: NetworkImage(
                              userData.userList[i]["avatar"],

                              //   // child: Image.network(
                              //   //     'https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg'),
                            ),
                          ),
                        ),
                        title: Text(userData.userList[i]["first_name"]),
                        subtitle: Text(userData.userList[i]["email"],
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            )),
                        trailing: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.blue)))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Details(
                                  userData.userList[i]["avatar"],
                                  userData.userList[i]["first_name"],
                                  userData.userList[i]["email"],
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Profile',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                        // subtitle: Text(snapshot.data[i].email),
                        // title: Text(snapshot.data[i].body),
                      ),
                    );
                  });
            },
          ),
        ),
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
