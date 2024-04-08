import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_summary_genarator/pages/description.dart';

class PlayerController extends StatefulWidget {
  const PlayerController({Key? key}) : super(key: key);

  @override
  _PlayerControllerState createState() => _PlayerControllerState();
}

class _PlayerControllerState extends State<PlayerController> {
  late PageController _pageController;
  late VideoPlayerController _currentController;
  late int _currentIndex;

  final List<String> assetUrls = const [
    'assets/vid.mp4',
    'assets/vid2.mp4',
    'assets/vid3.mp4',
    'assets/vid4.mp4',
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _currentController = VideoPlayerController.asset(assetUrls[_currentIndex])
      ..initialize().then((_) {
        setState(() {
          _currentController.play();
        });
      });
    _pageController = PageController();
  }

  @override
  void dispose() {
    _currentController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _handlePageChange(int index) {
    setState(() {
      if (_currentController.value.isPlaying) {
        _currentController.pause();
      } else {
        _currentController.play();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _handlePageChange(_currentIndex),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: assetUrls.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                  _currentController = VideoPlayerController.asset(assetUrls[_currentIndex])
                    ..initialize().then((_) {
                      setState(() {
                        _currentController.play();
                      });
                    });
                });
              },
              itemBuilder: (ctx, index) {
                return VideoPlayer(_currentIndex == index ? _currentController : VideoPlayerController.asset(assetUrls[index]));
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Description(),
            ),
          ],
        ),
      ),
    );
  }
}
