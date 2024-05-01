import 'package:flutter/material.dart';
import 'package:livelife/Screens/signUP.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Widget> _pages = [
    _buildPage(
      title: 'Uygulamanızın İlk Özelliği',
      description: 'Uygulamanız hakkında bir açıklama buraya girin.',
      // image: AssetImage('assets/intro1.png'), // Görsel eklemek için
    ),
    _buildPage(
      title: 'Uygulamanızın İkinci Özelliği',
      description: 'Burada başka bir özellik hakkında bilgi verin.',
      // image: AssetImage('assets/intro2.png'),
    ),
    _buildPage(
      title: 'Başlamaya Hazır mısınız?',
      description: 'Şimdi başlayalım!',
      // image: AssetImage('assets/intro3.png'),
    ),
    // Diğer sayfalarınızı buraya ekleyin
  ];

  static Widget _buildPage(
      {String? title, String? description, ImageProvider? image}) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image(image: image), // Görseli eklemek için bu satırı kullanın
          SizedBox(height: 20),
          Text(title!,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text(description!,
              textAlign: TextAlign.center, style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
      ),
      bottomSheet: _currentPage == _pages.length - 1
          ? _buildStartButton()
          : _buildPageIndicator(),
    );
  }

  Widget _buildPageIndicator() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(_pages.length, (index) {
          return index == _currentPage ? _indicator(true) : _indicator(false);
        }),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 8,
      width: isActive ? 24 : 16,
      margin: EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    );
  }

  Widget _buildStartButton() {
    return Container(
      height: 100,
      width: double.infinity,
      color: Colors.white,
      alignment: Alignment.center,
      child: ElevatedButton(
        child: Text('Başlayın'),
        onPressed: () {
          // Anasayfa veya uygulamanın bir sonraki ekranına yönlendir
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => SignUpPage()),
          );
        },
      ),
    );
  }
}
