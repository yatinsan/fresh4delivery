import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh4delivery/views/cart/cart.dart';
import 'package:fresh4delivery/views/notification/notification.dart';
import 'package:fresh4delivery/widgets/header.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                    Color.fromRGBO(166, 206, 57, 1),
                    Color.fromARGB(255, 160, 224, 203),
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255),
                  ])),
            ),
            automaticallyImplyLeading: false,
            title: Image.asset("assets/icons/logo1.png"),
            actions: [
              IconButton(
                  onPressed: () {
                    print('notification');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => NotificationScreen()));
                  },
                  icon: Icon(Icons.notifications_none, color: Colors.black)),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Cart()));
                  },
                  icon: Icon(Icons.local_grocery_store_outlined,
                      color: Colors.black)),
            ],
            bottom: PreferredSize(
              child: Column(children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset("assets/images/profile.png")),
                Text("Janvi",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                Text("janvi@gmail.com", style: TextStyle(fontSize: 12)),
                SizedBox(height: 5),
                Text("09467328823", style: TextStyle(fontSize: 12)),
              ]),
              preferredSize: Size.fromHeight(200),
            )),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("your information"),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 20),
                  child: Column(
                    children: [
                      ProfileButtons(
                          title: "order history",
                          icon: Icons.assignment_outlined),
                      ProfileButtons(
                          title: "address book", icon: Icons.library_books),
                      ProfileButtons(
                          title: "notification",
                          icon: Icons.notifications_none_outlined),
                    ],
                  ),
                ),
                Text("others"),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    children: [
                      ProfileButtons(
                          title: "support", icon: Icons.support_agent_outlined),
                      ProfileButtons(
                          title: "share the app", icon: Icons.share_outlined),
                      ProfileButtons(
                          title: "about us", icon: Icons.quiz_rounded),
                      ProfileButtons(
                          title: "logout",
                          icon: Icons.power_settings_new_outlined),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class ProfileButtons extends StatelessWidget {
  final IconData icon;
  final String title;
  const ProfileButtons({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 15),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(5)),
            child: Icon(icon, color: Colors.grey.shade700)),
        SizedBox(width: 10),
        Text(title, style: TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  }
}
