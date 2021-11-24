import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {
  const CardTemplate({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
      child: Card(
        child: ListTile(
          enableFeedback: true,
          leading: const Icon(Icons.info_outline_rounded),
          title: Text(
            title,
            style:
                const TextStyle(fontSize: 20.0, fontWeight: FontWeight.normal),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 10.0,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
          ),
          onTap: onPressed,
        ),
      ),
    );
  }
}
