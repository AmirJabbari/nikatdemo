import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nikatdemo/image_picker_screen.dart';
import 'package:nikatdemo/login_page_screen.dart';
import 'news_screen.dart';
class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _selectedIndex=0;
  List<Widget> _widgetOption=<Widget>[
    News(),
    ImageScreen(),
    LoginPage(),

  ];
  void _onItemTap(int index){
    setState(() {
      _selectedIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Nav Bar"),
      ),
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(icon: Icon(Icons.image), title: Text("image")),
          BottomNavigationBarItem(icon: Icon(Icons.login), title: Text("login"))

        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
