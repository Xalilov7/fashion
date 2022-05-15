import 'package:fashion/ui/favorite_page.dart';
import 'package:fashion/ui/home_page.dart';
import 'package:fashion/ui/settings_page.dart';
import 'package:flutter/material.dart';

class WalcomePage extends StatefulWidget {
  const WalcomePage({Key? key}) : super(key: key);

  @override
  _WalcomePageState createState() => _WalcomePageState();
}

class _WalcomePageState extends State<WalcomePage> {
  int selectIndex = 0;
  List<Widget> _screens = [
    HomePage(),
    FavoritePage(),
    SettingsPage()
  ];
  void updateMenuIndex(int index) {
    setState(() {
      selectIndex = index;
    });
    print(selectIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Image.asset("assets/menu.png", height: 40.0,),
        elevation: 0.0,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(padding: EdgeInsets.all(10.0),   child : Image.asset("assets/img.png")),

        ],
      ),
      body: _screens[selectIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectIndex,
        selectedItemColor: Color(0xffAA78E9),
        onTap: updateMenuIndex,
        items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );

  }
}
