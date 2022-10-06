import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../widgets/acitve_user.dart';
import '../widgets/projectwise_user.dart';


class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late List<GDPData> _chartData;
  late List<ProjectUser> _projectData;

  @override
  void initState() {
    _chartData = getChartData();
    _projectData = getProjectUserData();
    super.initState();
  }

  final dataMap = <String, double>{
    "Flutter": 5,
  };

  final colorList = <Color>[
    Colors.greenAccent,
    Colors.blue,
    Colors.amberAccent,
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.camera, size: 27, color: Colors.white,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Acrobuild', style: TextStyle(color: Colors.white, fontSize: 20),),
            )
          ],
        ),
        actions:  const [
          Padding(
            padding: EdgeInsets.all(10.0),
            child:  Icon(Icons.search, size: 27, color: Colors.white,),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.notifications_none_outlined, size: 27, color: Colors.white,),
          ),
          Padding(
            padding: EdgeInsets.only(right: 30, left: 10),
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
                  children: [
                    Text('Admin', style: TextStyle(fontSize: 15, color: Colors.grey),),
                    Icon(Icons.arrow_forward_ios_rounded, size: 15, ),
                    Text('Dashboard', style: TextStyle(fontSize: 18, color: Colors.black),),
                  ],
                ),
              ),

              SizedBox(height: 15,),
              //Active User
              ChartCard(chartData: _chartData, topic: 'Active Users', description: 'Visually departs how many registered users are active to a project.',),
              SizedBox(height: 15,),
              //Project wise User
              ProjectWise_ChartCard(projectData: _projectData, title: 'Project Wise Users', description: 'Describes the number of users allocated per project.',),
              SizedBox(height: 15,),
              //Sms usage
              ChartCard(chartData: _chartData, topic: 'SMS Usage', description: 'Stat for your SMS usage(as per your subscription and/or offer avail',),
              SizedBox(height: 15,),
              //Email usage

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





class GDPData{
  GDPData(this.noOfActiveUser, this.inActiveUser);
  final int noOfActiveUser;
  final String inActiveUser;

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
