// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:abcd/models/event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    final events = Provider.of<List<Event>>(context);

    List<DataRow> details = [];
    for (int i = 0; i < events.length; i++) {
      details.add(DataRow(cells: [
        DataCell(Text(events[i].name)),
        DataCell(Text(events[i].dates[0]))
      ]));
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://raw.githubusercontent.com/afgprogrammer/Flutter-Login-Page-UI/master/assets/images/background.png'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.brown[100],
          appBar: AppBar(
            title: Text('Schedule'),
            centerTitle: true,
          ),
          body: Center(
              child: ListView(children: [
            DataTable(columns: [
              DataColumn(
                  label: Text(
                'Event Name',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.redAccent,
                ),
              )),
              DataColumn(
                  label: Text(
                'Date and Time',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.redAccent,
                ),
              )),
            ], rows: details
                //     DataRow(cells: [
                //       DataCell(Text('Event 1')),
                //       DataCell(Text('Date 1')),
                //     ]),
                //     DataRow(cells: [
                //       DataCell(Text('Event 2')),
                //       DataCell(Text('Date 2')),
                //     ]),
                //     DataRow(cells: [
                //       DataCell(Text('Event 3')),
                //       DataCell(Text('Date 3')),
                //     ]),
                //     DataRow(cells: [
                //       DataCell(Text('Event 4')),
                //       DataCell(Text('Date 4')),
                //     ]),
                //     DataRow(cells: [
                //       DataCell(Text('Event 5')),
                //       DataCell(Text('Date 5')),
                //     ]),
                //     DataRow(cells: [
                //       DataCell(Text('Event 6')),
                //       DataCell(Text('Date 6')),
                //     ]),
                //     DataRow(cells: [
                //       DataCell(Text('Event 7')),
                //       DataCell(Text('Date 7')),
                //     ]),
                //     DataRow(cells: [
                //       DataCell(Text('Event 8')),
                //       DataCell(Text('Date 8')),
                //     ]),
                //     DataRow(cells: [
                //       DataCell(Text('Event 9')),
                //       DataCell(Text('Date 9')),
                //     ]),
                //     DataRow(cells: [
                //       DataCell(Text('Event 10')),
                //       DataCell(Text('Date 10')),
                //     ]),
                //   ])
                // ],
                ),
          ]))),
    );
  }
}
