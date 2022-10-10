import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chart/views/dashboard.dart';


class NavigationDrawerWidget extends StatefulWidget {
  NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationDrawerWidget> createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding =  EdgeInsets.symmetric(horizontal: 20);

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
      child: Material(
        color: Colors.red,
        child: ListView(
          padding: padding,
          children: [
            const SizedBox(height: 28,),
            buildHeader(
                name: name,
                email: email,
                urlmage: "img/profile.jpeg" ,
                onClick: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Dashboard()
                  ));
                }
            ),
            const SizedBox(height: 8,),
            buildMenuItem(
                text: 'Home',
                icon: Icons.home,
                onClicked: ()=> selectedItem(context, 0)
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
                text: 'My orders',
                icon: Icons.wallet_giftcard,
                onClicked: ()=> selectedItem(context, 2)
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
                text: 'Transaction',
                icon: Icons.update,
                onClicked: ()=> selectedItem(context, 3)
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
                text: 'Privacy policy',
                icon: Icons.lock,
                onClicked: ()=> selectedItem(context, 4)
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
                text: 'About us ',
                icon: Icons.transfer_within_a_station_sharp,
                onClicked: ()=> selectedItem(context, 4)
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
                text: 'Contact Us ',
                icon: Icons.perm_contact_calendar_rounded,
                onClicked: ()=> selectedItem(context, 1)
            ),
            const SizedBox(height: 24,),
            Divider(color: Colors.white,),
            const SizedBox(height: 24,),

            buildMenuItem(
                text: 'Settings',
                icon: Icons.settings,
                onClicked: ()=> selectedItem(context, 5)
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
                text: 'Logout',
                icon: Icons.logout,
                onClicked: ()=> selectedItem(context, 6)
            ),
          ],
        ),
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
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(urlmage),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 20, color: Colors.brown),),
                const SizedBox(height: 4,),
                Text(email, style: TextStyle(color: Colors.brown, fontSize: 14),)
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
  final color = Colors.brown;
  final hoverColor = Colors.white24;

  return ListTile(
    leading: Icon(icon, color: color,),
    title: Text(text, style: TextStyle(color: color)),
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
    case 2:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Dashboard()
      ));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Dashboard()
      ));
      break;
    case 4:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Dashboard()
      ));
      break;
    case 5:
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Dashboard()
      ));
      break;
    case 6:
      FirebaseAuth.instance.signOut().then((value) {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Dashboard()
        ));
      });

      break;


  }
}
