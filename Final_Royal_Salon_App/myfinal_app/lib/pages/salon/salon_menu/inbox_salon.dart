import 'package:flutter/material.dart';
import 'package:myfinal_app/routes/routes.dart';
import 'package:myfinal_app/widgets/dialogs.dart';

class InboxSalon extends StatelessWidget {
  const InboxSalon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'List of bookings',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.blue[200],
                      shadowColor: Colors.blue,
                      elevation: 12,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Client name: ',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Style name: ',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Price: ',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text('Date: ', style: TextStyle(fontSize: 20))
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Booking number: ',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                          titleTextStyle: const TextStyle(
                                            fontSize: 20.0,
                                          ),
                                          content: const Text(
                                              'Are you sure you want to Remove this?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                showSnackBar(
                                                    context, 'Cancelled!');
                                                Navigator.pop(context);
                                              },
                                              child: const Text(' NO '),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                showSnackBar(
                                                    context, 'Deleted!');
                                                Navigator.of(context).pushNamed(
                                                    RouteManager.noBooking);
                                              },
                                              child: const Text(' Yes '),
                                            ),
                                          ]);
                                    },
                                  );
                                },
                                child: Text('Remove'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class NoBookings extends StatelessWidget {
  const NoBookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Royal Salon'),
      ),
      body: Center(
        child: Text(
          'No Bookings yet',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
