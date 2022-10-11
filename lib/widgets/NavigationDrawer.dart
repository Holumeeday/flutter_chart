import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chart/views/dashboard.dart';
import 'package:flutter_chart/views/login_page.dart';


class NavigationDrawerWidget extends StatefulWidget {
  NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  // final user = FirebaseAuth.instance.currentUser;
  String  email = "";
  // String uid;
  String  name = "";

  User? user = FirebaseAuth.instance.currentUser;

  // CollectionReference ref = FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    getdata();

    super.initState();
  }

  void getdata() async {
    // DocumentSnapshot userdoc = await ref.doc(user!.uid).get();
    setState(() {
      // email = userdoc.get('email');
      // name = userdoc.get('username');
    });
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child:  ExpansionTile(
              collapsedIconColor: Colors.white,
              title: Row(
                children: const[
                  CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('img/profile.jpeg')
                  ),
                  SizedBox(width: 10,),
                  Text('Zen Reality', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),

                ],
              ),
            ),
          ),
          ExpansionTile(
            title: Row(
              children: const[
                SizedBox(width: 18,),
                Icon(Icons.people, size: 20, color: Colors.grey,),
                SizedBox(width: 11,),
                Text('Admin', style: TextStyle(fontSize: 16),),
              ],
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: const[
                          SizedBox(width: 40,),
                          Icon(Icons.dashboard, size: 13, color: Colors.grey,),
                          SizedBox(width: 7,),
                          Text('Dashboard', style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      const   SizedBox(height: 13,),
                      Row(
                        children: const[
                          SizedBox(width: 40,),
                          Icon(Icons.add_location, size: 13, color: Colors.grey,),
                          SizedBox(width: 7,),
                          Text('Company', style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      const  SizedBox(height: 13,),
                      Row(
                        children: const[
                          SizedBox(width: 40,),
                          Icon(Icons.contact_page, size: 13, color: Colors.grey,),
                          SizedBox(width: 7,),
                          Text('Roles & Permission', style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      const SizedBox(height: 13,),
                      Row(
                        children: const[
                          SizedBox(width: 40,),
                          Icon(Icons.supervised_user_circle_rounded, size: 13, color: Colors.grey,),
                          SizedBox(width: 7,),
                          Text('User', style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      const SizedBox(height: 13,),
                      Row(
                        children: const[
                          SizedBox(width: 40,),
                          Icon(Icons.contact_mail_sharp, size: 13, color: Colors.grey,),
                          SizedBox(width: 7,),
                          Text('Referrals', style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      const SizedBox(height: 13,),
                      Row(
                        children: const[
                          SizedBox(width: 40,),
                          Icon(Icons.card_travel_outlined, size: 13, color: Colors.grey,),
                          SizedBox(width: 7,),
                          Text('Activities', style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      const SizedBox(height: 13,),
                      Row(
                        children: const[
                          SizedBox(width: 40,),
                          Icon(Icons.map, size: 13, color: Colors.grey,),
                          SizedBox(width: 7,),
                          Text('Automation', style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      const SizedBox(height: 13,),
                      Row(
                        children: const[
                          SizedBox(width: 40,),
                          Icon(Icons.description, size: 13, color: Colors.grey,),
                          SizedBox(width: 7,),
                          Text('Project', style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      const SizedBox(height: 13,),
                      Row(
                        children: const[
                          SizedBox(width: 40,),
                          Icon(Icons.topic, size: 13, color: Colors.grey,),
                          SizedBox(width: 7,),
                          Text('Wings', style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      const SizedBox(height: 13,),
                      Row(
                        children: const[
                          SizedBox(width: 40,),
                          Icon(Icons.stream, size: 13, color: Colors.grey,),
                          SizedBox(width: 7,),
                          Text('Inventory', style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      const SizedBox(height: 13,),
                      Row(
                        children: const[
                          SizedBox(width: 40,),
                          Icon(Icons.settings, size: 13, color: Colors.grey,),
                          SizedBox(width: 7,),
                          Text('Settings', style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      const   SizedBox(height: 13,),
                      Row(
                        children: const[
                          SizedBox(width: 40,),
                          Icon(Icons.supervised_user_circle_rounded, size: 13, color: Colors.grey,),
                          SizedBox(width: 7,),
                          Text('Channel Partner Firms', style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      const   SizedBox(height: 13,),
                      Row(
                        children: const[
                          SizedBox(width: 40,),
                          Icon(Icons.score, size: 13, color: Colors.grey,),
                          SizedBox(width: 7,),
                          Text('Channel Partner', style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      const  SizedBox(height: 16,),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ExpansionTile(
            title: Row(
              children: const[
                SizedBox(width: 18,),
                Icon(Icons.transfer_within_a_station_sharp, size: 20, color: Colors.grey,),
                SizedBox(width: 11,),
                Text('Marketing', style: TextStyle(fontSize: 16),),
              ],
            ),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Row(
                        children: const[
                          SizedBox(width: 40,),
                          Icon(Icons.dashboard, size: 13, color: Colors.grey,),
                          SizedBox(width: 7,),
                          Text('Dashboard', style: TextStyle(fontSize: 12),),
                        ],
                      ),
                      const  SizedBox(height: 16,),
                    ],
                  ),
                ),
              ),
            ],
          ),


        ],
      ),
    );
  }
}

Widget buildHeader({
  required String name,
  required String email,
  required String urlmage,
  required VoidCallback onClick
})=>
    InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(urlmage),
            ),
            const SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontSize: 20, color: Colors.brown),),
                const SizedBox(height: 4,),
                Text(email, style: const TextStyle(color: Colors.brown, fontSize: 14),)
              ],
            )
          ],
        ),
      ),
    );


Widget buildMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClicked
}){
  const color = Colors.blueAccent;
  const hoverColor = Colors.white24;

  return ListTile(
    leading: Icon(icon, color: color,),
    title: Text(text, style: const TextStyle(color: color)),
    hoverColor: hoverColor,
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index){
  Navigator.of(context).pop();

  switch(index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Dashboard()
      ));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Dashboard()
      ));
      break;

  }
}
