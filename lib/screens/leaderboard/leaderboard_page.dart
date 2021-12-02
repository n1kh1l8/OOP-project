import 'package:abcd/models/leaderboard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({Key? key}) : super(key: key);

  @override
  _LeaderboardPageState createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  bool _sortNameAsc = true;
  bool _sortPointsAsc = true;
  // bool _sortEventsAsc = true;
  bool _sortRanksAsc = true;
  bool _sortAsc = true;
  int _sortColumnIndex = 1;
  late List<Leaderboard> _leaderboard;

  @override
  initState() {
    super.initState();
    _leaderboard = [
      Leaderboard(
        name: 'ABC',
        points: 100,
        // events: 10,
        rank: 1,
      ),
      Leaderboard(
        name: 'GHI',
        points: 90,
        // events: 9,
        rank: 2,
      ),
      Leaderboard(
        name: 'DEF',
        points: 80,
        // events: 8,
        rank: 3,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final leaderboard = Provider.of<List<Leaderboard>>(context);
    _leaderboard = leaderboard;
    var myColumns = [
      DataColumn(
        label: const Text('Rank'),
        onSort: (columnIndex, sortAscending) {
          setState(() {
            if (columnIndex == _sortColumnIndex) {
              _sortAsc = _sortRanksAsc = sortAscending;
            } else {
              _sortColumnIndex = columnIndex;
              _sortAsc = _sortRanksAsc;
            }
            _leaderboard.sort((a, b) => a.rank.compareTo(b.rank));
            if (!(sortAscending)) {
              _leaderboard = _leaderboard.reversed.toList();
            }
          });
        },
      ),
      DataColumn(
        label: const Text('Name'),
        onSort: (columnIndex, sortAscending) {
          setState(() {
            if (columnIndex == _sortColumnIndex) {
              _sortAsc = _sortNameAsc = sortAscending;
            } else {
              _sortColumnIndex = columnIndex;
              _sortAsc = _sortNameAsc;
            }
            _leaderboard.sort((a, b) => a.name.compareTo(b.name));
            if (!sortAscending) {
              _leaderboard = _leaderboard.reversed.toList();
            }
          });
        },
      ),
      DataColumn(
        label: const Text('Points'),
        onSort: (columnIndex, sortAscending) {
          setState(() {
            if (columnIndex == _sortColumnIndex) {
              _sortAsc = _sortPointsAsc = sortAscending;
            } else {
              _sortColumnIndex = columnIndex;
              _sortAsc = _sortPointsAsc;
            }
            _leaderboard.sort((a, b) => a.points.compareTo(b.points));
            if (!sortAscending) {
              _leaderboard = _leaderboard.reversed.toList();
            }
          });
        },
      ),
      // DataColumn(
      //   label: const Text('Number of events'),
      //   onSort: (columnIndex, sortAscending) {
      //     setState(() {
      //       if (columnIndex == _sortColumnIndex) {
      //         _sortAsc = _sortEventsAsc = sortAscending;
      //       } else {
      //         _sortColumnIndex = columnIndex;
      //         _sortAsc = _sortEventsAsc;
      //       }
      //       _leader.sort((a, b) => a.events.compareTo(b.events));
      //       if (!(sortAscending)) {
      //         _leader = _leader.reversed.toList();
      //       }
      //     });
      //   },
      // ),
    ];

    var myRows = _leaderboard.map((leader) {
      return DataRow(cells: [
        DataCell(Text('${leader.rank}')),
        DataCell(Text(leader.name)),
        DataCell(Text('${leader.points}')),
        // DataCell( Text('${leader.events}')),
      ]);
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Leaderboard'),
        centerTitle: true,
        backgroundColor: Colors.blue[600],
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Container(
            child: Align(
              alignment: Alignment(0.025, 0),
              child: Image.network(
                'https://static.vecteezy.com/system/resources/previews/002/399/730/non_2x/victory-podium-with-gift-cups-vector.jpg',
                height: 250,
                width: 250,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: myColumns,
                rows: myRows.toList(),
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAsc,
              ),
            ),
          ),
          //       Expanded(
          //   child:SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //     child: DataTable(
          //     columns: const <DataColumn>[
          //     DataColumn(
          //     label: Text(
          //     'Rank',
          //       style: TextStyle(fontStyle: FontStyle.italic),
          //     ),
          // ),
          // DataColumn(
          // label: Text(
          // 'Team Name',
          // style: TextStyle(fontStyle: FontStyle.italic),
          // ),
          //
          // ),
          // DataColumn(
          // label: Text(
          // 'Number of Events',
          // style: TextStyle(fontStyle: FontStyle.italic),
          // ),
          // ),
          //       DataColumn(
          //         label: Text(
          //           'Points',
          //           style: TextStyle(fontStyle: FontStyle.italic),
          //         ),
          //       ),
          //
          //
          // ],
          // rows: const <DataRow>[
          // DataRow(
          // cells: <DataCell>[
          //     DataCell(Text('1')),
          //     DataCell(Text('ABC')),
          //     DataCell(Text('10')),
          //     DataCell(Text('100')),
          //
          // ],
          // ),
          // DataRow(
          // cells: <DataCell>[
          //     DataCell(Text('2')),
          //     DataCell(Text('GHI')),
          //     DataCell(Text('9')),
          //     DataCell(Text('90')),
          //
          // ],
          // ),
          // DataRow(
          // cells: <DataCell>[
          //     DataCell(Text('3')),
          //     DataCell(Text('DEF')),
          //     DataCell(Text('8')),
          //     DataCell(Text('80')),
          //
          // ],
          // ),
          // ],
          // ),
          //   ),),

//           ElevatedButton(
//             child: const Text('Back'),
//             onPressed: () {},
//             style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(Colors.red),
//                 // padding: MaterialStateProperty.all(EdgeInsets.all(20)),
//                  textStyle:const  MaterialStateProperty.all(TextStyle(fontSize: 25))),
//           ),
        ],
      ),

      //   floatingActionButton: FloatingActionButton(
      //   onPressed: (){},
      //   backgroundColor: Colors.red[600],
      //   child: Text('Back'),
      // ),
    );
  }
}
