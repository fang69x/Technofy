import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MeraDrawer extends StatelessWidget {
  const MeraDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMduTVcX5tKkOu_5uestsoV90sG5i9VB3NlQ";
    return Drawer(
      child: Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Kislay"),
                  accountEmail: Text(" kislayk12@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white54,
              ),
              title: Text(
                "HOME",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.calendar_today,
                color: Colors.white54,
              ),
              title: Text(
                "Schedule",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.speaker_2,
                color: Colors.white54,
              ),
              title: Text(
                "White Noise",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
