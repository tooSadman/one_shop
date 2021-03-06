import 'dart:async';
import 'package:project_f/Pages/home_pages/search_page.dart';
import 'package:project_f/UI/blank_search_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_f/Pages/home_pages/boxes_page.dart';
import 'package:project_f/Pages/home_pages/list_page.dart';
import 'package:project_f/Pages/home_pages/profile_page.dart';
import 'package:project_f/Pages/home_pages/cart_page.dart';
import 'package:project_f/main.dart';

///
/// Create by Nikita Kiselov
///

class HomePage extends StatefulWidget {
// This widget is the home page of your application. It is stateful, meaning
// that it has a State object (defined below) that contains fields that affect
// how it looks.


  static SharedPreferences prefs;

  @override
  _HomePageState createState() {
    _setPreferences();
    return new _HomePageState();
  }

  Future _setPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }
}

class NavigationIconView {
  NavigationIconView({
    Widget icon,
    String title,
    Color color,
    TickerProvider vsync,
  })  : _icon = icon,
        _color = color,
        _title = title,
        item = new BottomNavigationBarItem(
          icon: icon,
          title: new Text(title),
          backgroundColor: color,
        ),
        controller = new AnimationController(
          duration: kThemeAnimationDuration,
          vsync: vsync,
        ) {
    _animation = new CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
  }

  final Widget _icon;
  final Color _color;
  final String _title;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  CurvedAnimation _animation;

  FadeTransition transition(
      BottomNavigationBarType type, BuildContext context) {
    Color iconColor;

    final ThemeData themeData = Theme.of(context);
    iconColor = themeData.brightness == Brightness.light
        ? themeData.primaryColor
        : themeData.accentColor;

    return new FadeTransition(
      opacity: _animation,
      child: new SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(0.0, 0.02), // Slightly down.
          end: Offset.zero,
        ).animate(_animation),
        child: new IconTheme(
          data: new IconThemeData(
            color: iconColor,
            size: 120.0,
          ),
          child: new Semantics(
            label: 'Placeholder for $_title tab',
            child: _icon,
          ),
        ),
      ),
    );
  }
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  static ListPage _list_page = new ListPage();
  static SearchPage _search_page = new SearchPage();
  static CartPage _cart_page = new CartPage();
  static BoxesPage _boxes_page = new BoxesPage();
  static ProfilePage _profile_page = new ProfilePage(
      HomePage.prefs.getString("name"), HomePage.prefs.getString("photo_url"));

  IconData _icon = Icons.email;
  int _currentIndex = 0;
  BottomNavigationBarType _type = BottomNavigationBarType.shifting;
  List<NavigationIconView> _navigationViews;
  Widget _homeWidget = _list_page;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: const Icon(Icons.store_mall_directory),
        title: 'Home',
        color: Colors.black,
        vsync: this,
      ),
      new NavigationIconView(
        icon: new Icon(Icons.search),
        title: 'Search',
        color: Colors.black,
        vsync: this,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.shopping_cart),
        title: 'Cart',
        color: Colors.black,
        vsync: this,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.collections_bookmark),
        title: 'Boxes',
        color: Colors.black,
        vsync: this,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.person),
        title: 'Profile',
        color: Colors.black,
        vsync: this,
      )
    ];

    for (NavigationIconView view in _navigationViews)
      view.controller.addListener(_rebuild);
  }

  @override
  void dispose() {
    for (NavigationIconView view in _navigationViews) view.controller.dispose();
    super.dispose();
  }

  void _rebuild() {
    setState(() {
      _icon = Icons.shuffle;
    });
  }

  @override
  Widget build(BuildContext context) {

    //Bottom Navigation menu
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: _type,
      onTap: (int index) {
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
          switch (index) {
            case 0:
              _homeWidget = _list_page;
              break;
            case 1:
              _homeWidget = _search_page;
              break;
            case 2:
              _homeWidget = _cart_page;
              break;
            case 3:
              _homeWidget = _boxes_page;
              break;
            case 4:
              _homeWidget = _profile_page;
              break;
          }
        });
      },
    );

    return new Scaffold(
      appBar: null,
      body: _homeWidget,
      bottomNavigationBar: botNavBar,
    );
  }
}
