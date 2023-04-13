import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';
import 'package:todo/todo/Pages/Home_Page.dart';

class alarmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Alarm Clock',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

// creating text editing controller to take hour
// and minute as input
  TextEditingController hourController = TextEditingController();
  TextEditingController minuteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(201, 44, 109, 1),
        title: const Text('Set a alarm'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: <Widget>[
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(0)),
                  child: Center(
                    child: TextField(
                      controller: hourController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  height: 40,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: TextField(
                      controller: minuteController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text(
                  'Create alarm',
                  style: TextStyle(fontSize: 30.0, color: Color.fromRGBO(97, 158, 162, 1)),
                ),
                onPressed: () {
                  int hour;
                  int minutes;
                  hour = int.parse(hourController.text);
                  minutes = int.parse(minuteController.text);

                  // creating alarm after converting hour
                  // and minute into integer
                  FlutterAlarmClock.createAlarm(hour, minutes);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // show alarm
                FlutterAlarmClock.showAlarms();
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(96, 158, 162, 1),
              ),
              child: const Text(
                'Show Alarms',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                  child: const Text(
                    'Create timer',
                    style: TextStyle(fontSize: 30.0, color: Color.fromRGBO(96, 158, 162, 1)),
                  ),
                  onPressed: () {
                    int minutes;
                    minutes = int.parse(minuteController.text);

                    // create timer
                    FlutterAlarmClock.createTimer(minutes);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AboutDialog(
                            children: [
                              Center(
                                child: Text("Timer is set",
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.bold)),
                              )
                            ],
                          );
                        });
                  }),
            ),
            ElevatedButton(
              onPressed: () {
                FlutterAlarmClock.showTimers();
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(96, 158, 162, 1), // Background color
              ),
              child: Text(
                "Show Timers",
                style: TextStyle(fontSize: 17),
              ),
            )
          ])),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(201, 44, 109, 1),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
