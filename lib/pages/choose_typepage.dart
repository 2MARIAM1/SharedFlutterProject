
import 'package:flutter/material.dart';

class ChooseType extends StatefulWidget {
  const ChooseType({super.key});

  @override
  _ChooseTypeState createState() => _ChooseTypeState();
}

class _ChooseTypeState extends State<ChooseType> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.8, // to show a preview of the upcoming page
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView Example'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                Container(
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      'Page 1',
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      'Page 2',
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'Page 3',
                      style: TextStyle(fontSize: 28, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 3; i++)
                  if (i == _currentPage)
                    _buildPageIndicator(true)
                  else
                    _buildPageIndicator(false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(bool isCurrentPage) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: isCurrentPage ? 8 : 6,
      width: isCurrentPage ? 8 : 6,
      decoration: BoxDecoration(
        color: isCurrentPage ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
