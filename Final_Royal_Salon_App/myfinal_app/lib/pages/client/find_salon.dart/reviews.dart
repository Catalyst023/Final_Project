import 'package:flutter/material.dart';
import 'package:myfinal_app/services/user_service.dart';
import 'package:provider/src/provider.dart';

class SalonReviews extends StatelessWidget {
  SalonReviews({Key? key}) : super(key: key);

  final TextEditingController _commentsController = TextEditingController();

  double calcRating(int hygiene, int experience, int hairstyle) {
    double total = 0.0;

    total = (hygiene + experience + hairstyle) / 3;

    return total;
  }

  @override
  Widget build(BuildContext context) {
    // String salonname =
    //     context.read<UserService>().currentUser!.getProperty('salon_name');
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Reviews List',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Card(
                  child: ListTile(
                title: Text('Salon Name: '),
                subtitle: Text('I did not have a good experience with them.'),
                trailing: Text('3.5'),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
