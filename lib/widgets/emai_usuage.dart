import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/email_usage_model.dart';
import '../views/dashboard.dart';

class EmailUsageCard extends StatelessWidget {
  const EmailUsageCard({
  super.key,
  required List<EmailUsage> emailUsageData,
  required this.title,
  required this.description,
  }) : _emailUsageData = emailUsageData;

  final List<EmailUsage> _emailUsageData;
  final String title;
  final String description;

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
                Text(title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
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
                RadialBarSeries<EmailUsage, String>(
                    strokeWidth: 10,
                    dataSource: _emailUsageData,
                    yValueMapper: (EmailUsage data,_)=> data.promotional,
                    xValueMapper: (EmailUsage data,_) => data.transactional,
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