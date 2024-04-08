import 'package:flutter/material.dart';
import 'package:video_summary_genarator/pages/player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // request for media permission

    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back_ios),
            SizedBox(width: 8.0),
            Text('Sunday, 28 Adar'),
            SizedBox(width: 8.0),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTab('Video', 0),
                _buildTab('Audio', 1),
                _buildTab('Text', 2),
              ],
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: const [
                // Video tab content
                PlayerController(),

                // Audio tab content
                Center(child: Text('Audio Content')),

                // Text tab content
                Center(child: Text('Text Content')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          // make the bottom border #6B4EFF if the tab is selected
          border: Border(
            bottom: BorderSide(
              color: _currentIndex == index ? const Color(0xff6a4dff) : Colors.transparent,
              width: 2.0,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: _currentIndex == index ? const Color(0xff6a4dff) : Colors.black,
          ),
        ),
      ),
    );
  }
}
