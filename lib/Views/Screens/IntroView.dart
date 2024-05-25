import 'package:flutter/material.dart';

class IntroView extends StatelessWidget {
  final PageController pageController;
  final int currentPage;
  final bool showIntro;
  final Function(int) onPageChanged;
  final VoidCallback onStartPressed;
  final Function(bool?) onShowIntroChanged;

  IntroView({
    required this.pageController,
    required this.currentPage,
    required this.showIntro,
    required this.onPageChanged,
    required this.onStartPressed,
    required this.onShowIntroChanged,
  });

  static List<Widget> _pages = [
    _buildPage(
      title: 'Uygulamanızın İlk Özelliği',
      description: 'Uygulamanız hakkında bir açıklama buraya girin.',
    ),
    _buildPage(
      title: 'Uygulamanızın İkinci Özelliği',
      description: 'Burada başka bir özellik hakkında bilgi verin.',
    ),
    _buildPage(
      title: 'Başlamaya Hazır mısınız?',
      description: 'Şimdi başlayalım!',
    ),
    // Diğer sayfalarınızı buraya ekleyin
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            children: _pages,
            onPageChanged: onPageChanged,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Column(
              children: [
                _buildPageIndicator(),
                if (currentPage == _pages.length - 1)
                  _buildStartButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStartButton() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Checkbox(
                value: showIntro,
                onChanged: onShowIntroChanged,
              ),
              Text('Bir daha gösterme'),
            ],
          ),
          SizedBox(height: 8),
          ElevatedButton(
            child: Text('Başlayın'),
            onPressed: onStartPressed,
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(_pages.length, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: currentPage == index ? 12 : 8,
          height: currentPage == index ? 12 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? Colors.blue : Colors.grey,
          ),
        );
      }),
    );
  }

  static Widget _buildPage({required String title, required String description}) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            title,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
