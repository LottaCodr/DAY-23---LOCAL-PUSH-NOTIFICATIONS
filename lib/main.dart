import 'package:flutter/material.dart';
import 'package:notify_me/buttons.dart';
import 'package:notify_me/notification.dart';

void main() =>
    runApp(MaterialApp(
      home: const MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.orange),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    NotificationApi.init();
    listenNotifications();
  }

  void listenNotifications() =>
      NotificationApi.onNotifications.stream.listen((event) {
        onClickedNotifiication('');
      });

  void onClickedNotifiication(String? payload) =>
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Scaffold(body: Text('News About OBO'),)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container(
                  color: Colors.orange,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: CircleAvatar(
                            // backgroundImage: AssetImage('lib/assets/images/lota.jpg'),
                            radius: 69,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          'Local ',
                          style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Notifications',
                          style:
                          TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Mybuttons(
                              title: 'Click here for Simple Notification',
                              myIcon: const Icon(Icons.notifications),
                              onClicked: () {}),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Mybuttons(
                              title: 'Scheduled Notification',
                              myIcon: const Icon(Icons.notifications_active),
                              onClicked: () =>
                                  NotificationApi.showNotification(
                                      title: 'Lota Latest',
                                      body:
                                      'OBO just gave lota a contract to design an app for his record label',
                                      payload: 'lota.abs')),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: Mybuttons(
                              title: 'Click here for Simple Notification',
                              myIcon: const Icon(Icons.notifications),
                              onClicked: () {}),
                        )
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}


//the body
