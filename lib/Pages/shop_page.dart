import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:core';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:project_f/UI/shop_page_category_item.dart';
import './registration_page.dart';

enum AppBarBehavior { normal, pinned, floating, snapping }

class ShopPage extends StatefulWidget {
  @override
  State createState() => new ShopPageState();
}

class ShopPageState extends State<ShopPage> {
  //static final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBarBehavior _appBarBehavior = AppBarBehavior.pinned;

  var _shopItemList = new List<Widget>();

  HashMap<int, String> map = new HashMap<int, String>();
  int index = 0;

  bool _notification = false;

  String _shopHistory =
      'Начав свою историю в 2013 году, сегодня Sammy Icon - полноценный бренд аксессуаров, известный в первую очередь благодаря своим ярким носкам с разнообразием оригинальных расцветок и паттернов. Работая над каждой коллекцией, мы остаемся верны своему главному принципу - сделать яркими привычные повседневные аксессуары. На нашем счету уже больше 200 оригинальных дизайнов, а их количество непременно растет от сезона к сезону. Продолжая движение вперед, мы постоянно расширяем линейку товаров, придавая утилитарным предметам дух авантюризма и приключений. Продукцию Sammy Icon сегодня можно встретить более чем в 20-и странах мира, среди которых такие лидеры мировой индустрии моды как США, Канада, Великобритания, Италия, Германия, Япония, Китай, Россия и другие. За последние пару лет мы успели побывать на крупнейших мировых трейд шоу: от NY Now в США до главного европейского события в мире мужской моды - Pitty Uomo';

  /*@override
  void initState() {
    super.initState();
  
  }*/

  void changeNotificationStatus(bool status) {
    status == true
        ? this.setState(() {
            _notification = false;
          })
        : this.setState(() {
            _notification = true;
          }); // if clause
  }

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
              padding: new EdgeInsets.all(34.0),
              color: Colors.white,
              child: new ListView(
                children: <Widget>[
                  new Text(
                    _shopHistory,
                    textAlign: TextAlign.center,
                  )
                ],
              ));
        });
  }

  StaggeredTile _newStaggeredTile(int index) {
    switch (index) {

      //shop info
      case 0:
        ++index;
        return new StaggeredTile.count(4, 0.5);

        break;
      // product categories
      case 1:
        ++index;
        return new StaggeredTile.count(4, 1.35);

        break;

      //products
      default:
        ++index;
        return new StaggeredTile.count(2, index > 4 ? index - 3 : index + 1);

        break;
    }
  }

  List<StaggeredTile> _allNewStaggeredTiles(int index) {
    var _staggeredTilesList = new List<StaggeredTile>();
    for (int i = 0; i < index; i++) {
      // index - number of products
      _staggeredTilesList.add(_newStaggeredTile(i));
    }
    return _staggeredTilesList;
  }

  // this method creates new shop's product widget with given
  Widget _newShopItem(String _shopItemImage) {
    Widget _shopItem = new GestureDetector(
      child: new Container(
        decoration: new BoxDecoration(
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
            border: new Border.all(
                color: new Color.fromRGBO(149, 152, 154, 0.15), width: 2.0),
            image: new DecorationImage(
              image: new AssetImage(_shopItemImage),
              fit: BoxFit.cover,
            ),
            color: Colors.white),
      ),
      onTap: () => {},
    );

    return _shopItem;
  }

  // this method adds shop's  product to the given list
  void _addTOShopItemsList(Widget widget, List<Widget> shopList) {
    shopList.add(widget);
  }

  @override
  Widget build(BuildContext context) {
    // adding initial products to list here
    _shopItemList.addAll([
      new Container(
          color: Colors.white,
          padding: new EdgeInsets.symmetric(horizontal: 30.0),
          child: new InkWell(
              child: new Text(
                'Незалежний бренд аксесуарів для тих, хто сприймає життя як справжню пригоду!',
                textAlign: TextAlign.center,
              ),
              onTap: () => _showModalSheet())),
      // Categories
      new SizedBox(
          height: 130.0,
          child: new ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              new ShopCategoryItem('images/dad.png', 'Чоловіче'),
              new ShopCategoryItem('images/girl_category.png', 'Жіноче'),
              new ShopCategoryItem('images/socks_category.png', 'Шкарпетки'),
              new ShopCategoryItem('images/good_girl.png', 'Білизна'),
              new ShopCategoryItem('images/hat.png', 'Шапки'),
            ],
          )),
      _newShopItem("images/gus.png"),
      _newShopItem("images/socks.png"),
      _newShopItem("images/sence.png"),
      _newShopItem("images/box_image_1.png"),
      _newShopItem("images/girl.png"),
      _newShopItem("images/box_image_2.png"),
    ]);

    index = _shopItemList.length;

    return new Theme(
        data: new ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          platform: Theme.of(context).platform,
        ),
        child: new Scaffold(
            //    key: _scaffoldKey,
            body: new CustomScrollView(slivers: <Widget>[
          new SliverAppBar(
            expandedHeight: 300.0,
            pinned: true,
            leading: new IconButton(
              alignment: Alignment.center,
              icon: const Icon(Icons.arrow_back, color: Colors.white,),
              onPressed: () => Navigator.of(context).pushNamed("/home_page"),
            ),
            actions: <Widget>[],
            flexibleSpace: new FlexibleSpaceBar(
              title: new Text(
                'Sammy Icon',
                style: new TextStyle(fontSize: 18.0),
              ),
              centerTitle: true,
              background: new Stack(
                fit: StackFit.passthrough,
                children: <Widget>[
                  new Stack(fit: StackFit.expand, children: <Widget>[
                    new Container(
                        padding: new EdgeInsets.only(bottom: 125.0),
                        child: new Image.asset(
                          'images/cover_semy.png',
                          fit: BoxFit.cover,
                        ))
                  ]),
                  new Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        new Container(
                          margin: new EdgeInsets.only(bottom: 55.0),
                          height: 150.0,
                          width: 150.0,
                          decoration: new BoxDecoration(
                            color: const Color(0xff7c94b6),
                            image: new DecorationImage(
                              image: new AssetImage('images/samy_ico.png'),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: new BorderRadius.all(
                                new Radius.circular(100.0)),
                            border: new Border.all(
                              color: Colors.white,
                              width: 5.0,
                            ),
                          ),
                        ),
                      ])
                  // This gradient ensures that the toolbar icons are distinct
                  // against the background image.
                ],
              ),
            ),
          ),
          new SliverStaggeredGrid.count(
              crossAxisCount: 4,
              mainAxisSpacing: 6.0,
              crossAxisSpacing: 6.0,
              children: _shopItemList,
              staggeredTiles: _allNewStaggeredTiles(index)),
        ])));
  }
}
