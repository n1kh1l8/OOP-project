import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:abcd/models/event.dart';
import 'package:transparent_image/transparent_image.dart';


class EventDetails extends StatelessWidget {
  //const EventDetails({Key? key}) : super(key: key);

  final EVent event;
  EventDetails({required this.event});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: const Text(
            'Event Details',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 25,
        )),
        backgroundColor: Colors.brown[100],
        elevation: 0.0,
        centerTitle: true,
      ),
      body:   Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Stack(
                children: [
                   const Padding(
                    padding: EdgeInsets.only(top: 75),
                    child: Center(child: CircularProgressIndicator()),
                  ),
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    child:  ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Hero(
                        tag: event.name,
                        child: FadeInImage.memoryNetwork(
                            placeholder: kTransparentImage,
                            image: event.images,
                            fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                  event.name,
                  style: const TextStyle(
                    color: Colors.brown,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    //fontFamily: "Overlock",
                  )
              ),
              Text(
                "Dates: ${event.dates}",
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    //fontFamily: "Nunito"),
                ),
              ),

              Text(
                "Time:  - ${event.times}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  //fontFamily: "Nunito"),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),

              Text(
                event.status,
                style: const TextStyle(
                      color: Colors.brown,
                      fontSize: 20.0,
                      //fontFamily: "Nunito")
                ),
              ),
              const SizedBox(
                height: 7.0,
              ),

              Text(
                  event.description,
                  style: const TextStyle(
                      color: Colors.brown,
                      fontSize: 20.0,
                      //fontFamily: "Nunito")
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Text(
                "Defending Champions: ${event.winners}",
                style: const TextStyle(
                  color: Colors.brown,
                  fontSize: 20.0,
                  //fontFamily: "Nunito")
                ),
              ),
            const SizedBox(height: 15.0),
            ButtonTheme(
              minWidth: 150,
              height: 40,
              child: RaisedButton(
                color: Colors.pink[400],
                child: const Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                onPressed: (){},
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
