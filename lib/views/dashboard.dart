import 'package:flutter/material.dart';
import '../models/active_user_model.dart';
import '../models/email_usage_model.dart';
import '../widgets/NavigationDrawer.dart';
import '../widgets/acitve_user.dart';
import '../widgets/emai_usuage.dart';
import '../widgets/projectwise_user.dart';
import '../widgets/sms_usage.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<GDPData> _chartData;
  late List<ProjectUser> _projectData;
  late List<SmsUsage> _smsUsageData;
  late List<EmailUsage> _emailUsageData;

  @override
  void initState() {
    _chartData = getChartData();
    _projectData = getProjectUserData();
    _smsUsageData = getSmsUsageData();
    _emailUsageData = getEmailUsageData();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('img/profile.jpeg')
                ),
                SizedBox(width: 10,),
                Text('Zen Reality', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
                SizedBox(width: 4,),
                Icon(Icons.arrow_drop_down_sharp, color: Colors.white, size: 25,)
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('Page 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.train,
            ),
            title: const Text('Page 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    ),

      appBar: AppBar(
          title: Expanded(
            child: Row(
            children: const [
              Icon(Icons.camera, size: 22, color: Colors.white,),
              SizedBox(width: 7,),
              Text('Acrobuild', style: TextStyle(color: Colors.white, fontSize: 20),)
            ],
          ),
          ),
      
        actions:  const [
          Padding(
            padding: EdgeInsets.all(5.0),
            child:  Icon(Icons.search, size: 27, color: Colors.white,),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(Icons.notifications_none_outlined, size: 27, color: Colors.white,),
          ),
          Padding(
            padding: EdgeInsets.only(right: 25, left: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage('img/profile.jpeg'),
            ),
          )

        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              //Header
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Row(
                  children: const[
                    Text('Admin', style: TextStyle(fontSize: 15, color: Colors.grey),),
                    Icon(Icons.arrow_forward_ios_rounded, size: 15, ),
                    Text('Dashboard', style: TextStyle(fontSize: 18, color: Colors.black),),
                  ],
                ),
              ),

            const  SizedBox(height: 15,),
              //Active User
              ChartCard(chartData: _chartData, topic: 'Active Users', description: 'Visually departs how many registered users are active to a project.',),
            const SizedBox(height: 15,),
              //Project wise User
              ProjectWise_ChartCard(projectData: _projectData, title: 'Project Wise Users', description: 'Describes the number of users allocated per project.',),
            const SizedBox(height: 15,),
              //Sms usage
              SmsUsageCard(smsUsageData: _smsUsageData, title: 'SMS Usage', description: 'Stat for your SMS usage(as per your subscription and/or offer available',),
            const SizedBox(height: 15,),
              //Email usage
              EmailUsageCard(emailUsageData: _emailUsageData, title: 'Email Usage', description: 'Stat for your SMS usage(as per your subscription and/or offer available',),
            const SizedBox(height: 25,),

            // If the data was live i will use the MVC pattern where the services will be called using http request
              // in services and also Future builder in the dashboard view to display the data


            ],
          ),
        ),
      ),
    );
  }

   List<GDPData> getChartData(){
    final List<GDPData> chartData = [
      GDPData(7, 'Active User',),
      GDPData(3, 'Inactive User',),
    ];
    return chartData;
   }
  }







List<ProjectUser> getProjectUserData(){
  final List<ProjectUser> projectUserData = [
    ProjectUser(9, 'User 1',),
    ProjectUser(21, 'User 2',),
    ProjectUser(12, 'User 3',),
    ProjectUser(5, 'User 4',),
  ];
  return projectUserData;
}


class ProjectUser{
  ProjectUser(this.allocatedUser, this.nonAllocatedUser);
  final int allocatedUser;
  final String nonAllocatedUser;
}


List<SmsUsage> getSmsUsageData(){
  final List<SmsUsage> smsUsageData = [
    SmsUsage(10, 'Transactional',),
    SmsUsage(20, 'Promotional',),

  ];
  return smsUsageData;
}



class SmsUsage{
  SmsUsage(this.promotional, this.transactional);
  final int promotional;
  final String transactional;
}


List<EmailUsage> getEmailUsageData(){
  final List<EmailUsage> emailUsageData = [
    EmailUsage(50, 'Transactional',),
    EmailUsage(20, 'Promotional',),

  ];
  return emailUsageData;
}

