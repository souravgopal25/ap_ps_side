import 'package:ap_ps_side/page/selector.dart';
import 'package:flutter/material.dart';

class MenuNav extends StatelessWidget {
  const MenuNav({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.white24),
            accountName: Text(
              "Sourav Sharma",
              style: TextStyle(fontSize: 22, color: Colors.black),
            ),
            accountEmail: Text("souravgopal25@gmail.com",
                style: TextStyle(fontSize: 23, color: Colors.black)),
            currentAccountPicture: CircleAvatar(
              radius: 100.0,
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.verified_user,
              color: Colors.blueAccent,
            ),
            title: Text(
              'User Profile',
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.translate,
              color: Colors.blueAccent,
            ),
            title: Text(
              'Language Change',
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.call,
              color: Colors.blueAccent,
            ),
            title: Text(
              'Helpline',
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,
              color: Colors.blueAccent,
            ),
            title: Text(
              'Log out',
              style: TextStyle(fontSize: 25.0),
            ),
            onTap: () {
              Navigator.push(context,
                  new MaterialPageRoute(builder: (context) => Selector()));
            },
          ),
        ],
      ),
    );
  }
}
