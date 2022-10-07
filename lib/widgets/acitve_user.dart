import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/active_user_model.dart';
import '../views/dashboard.dart';


class ChartCard extends StatelessWidget {
  const ChartCard({
  required this.description,
  required this.topic,
  super.key,
  required List<GDPData> chartData,
}) : _chartData = chartData;

final String topic;
final String description;
final List<GDPData> _chartData;

@override
Widget build(BuildContext context) {
  return Container(
    width: 700,
    height: 290,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
    ),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Text(topic, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
              Spacer(),
              Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.3),
                      borderRadius: BorderRadius.circular(100)
                  ),
                  child: Icon(Icons.calendar_today_outlined, size: 18,))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              SizedBox(
                width: 300,
                child: Text(description),
              ),
            ],
          ),
        ),
        Expanded(
          child: SfCircularChart(
            legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            series: <CircularSeries>[
              DoughnutSeries<GDPData, String>(
                  strokeWidth: 10,
                  dataSource: _chartData,
                  yValueMapper: (GDPData data,_)=> data.noOfActiveUser,
                  xValueMapper: (GDPData data,_) => data.inActiveUser,
                  dataLabelSettings: DataLabelSettings(isVisible: true)
              )
            ],
          ),
        ),

      ],
    ),
  );
}
}
