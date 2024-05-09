import 'package:flutter/material.dart';
import 'package:livelife/Screens/signUP.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _showIntro = true; // varsayılan olarak intronun gösterilmesini sağlar
  @override
  void initState() {
    super.initState();
    _checkIntroStatus();
  }

  void _checkIntroStatus() async {
    // SharedPreferences kullanarak intronun gösterilip gösterilmediğini kontrol edin
    // Eğer bir kayıt yoksa, intronun gösterilmesini sağlamak için _showIntro'yu true yapın
    // Eğer kayıt varsa, _showIntro'yu kaydedilmiş değere göre güncelleyin
    // Bu adımlar için shared_preferences paketini kullanabilirsiniz
  }

  void _saveIntroStatus(bool value) async {
    // SharedPreferences kullanarak intronun gösterilme durumunu kaydedin
  }

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
            controller: _pageController,
            children: _pages,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
          ),
          if (_currentPage == _pages.length - 1) // Sadece son sayfada göster
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: _buildStartButton(),
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
                value: _showIntro,
                onChanged: (bool? value) {
                  setState(() {
                    _showIntro = value ?? false;
                  });
                },
              ),
              Text('Bir daha gösterme'),
            ],
          ),
          SizedBox(height: 8),
          ElevatedButton(
            child: Text('Başlayın'),
            onPressed: () {
              _saveIntroStatus(_showIntro);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignUpPage()),
              );
            },
          ),
        ],
      ),
    );
  }

  static Widget _buildPage({String? title, String? description}) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
}
