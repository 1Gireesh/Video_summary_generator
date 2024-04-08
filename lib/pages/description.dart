import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the column
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(), // Placeholder for other content
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the column
                children: [
                  SizedBox(height: 110),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        child: Icon(Icons.person, size: 18),
                      ),
                      SizedBox(width: 6),
                      Text('flutter_developer', style: TextStyle(color: Colors.white)),
                      SizedBox(width: 10),
                      Icon(Icons.verified, size: 15),
                      SizedBox(width: 6),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 6),
                  Text('Me hoo jiyan ..', style: TextStyle(color: Colors.white)),
                  SizedBox(height: 10),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
