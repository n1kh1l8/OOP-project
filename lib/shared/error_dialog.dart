import 'package:flutter/material.dart';

class errorDialog extends StatefulWidget {
  //const errorDialog({ Key? key }) : super(key: key);
  final String error;
  errorDialog({required this.error});

  @override
  _errorDialogState createState() => _errorDialogState();
}

class _errorDialogState extends State<errorDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: AlertDialog(
        backgroundColor: Colors.yellow[50],
        insetPadding: EdgeInsets.only(top: 230.0, bottom: 230.0),
        elevation: 5.0,
        title: Text(
          "Error",
          style: TextStyle(
              color: Colors.red, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        content: Center(
          child: Text(
            widget.error,
            style: TextStyle(color: Colors.red, fontSize: 20.0),
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "OK",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
