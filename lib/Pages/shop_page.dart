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

  HashMap<int, String> map = new HashMap<int, String>();
  int index = 1;

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

  @override
  Widget build(BuildContext context) {
    map.putIfAbsent(3, () => "images/postcard.png");
    map.putIfAbsent(4, () => "images/gus.png");
    map.putIfAbsent(5, () => "images/socks.png");
    map.putIfAbsent(6, () => "images/sence.png");
    map.putIfAbsent(7, () => "images/box_image_1.png");
    map.putIfAbsent(8, () => "images/girl.png");
    map.putIfAbsent(9, () => "images/box_image_2.png");
    map.putIfAbsent(10, () => "images/postcard.png");

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
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new RegistrationPage())),
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
                          'images/background_brand.jpg',
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
                              image: new AssetImage('images/postcard.png'),
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
          
          new SliverFillRemaining(
            child: new StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: 10,
              padding: new EdgeInsets.all(8.0),
              itemBuilder: (BuildContext context, int index) {
                switch (index) {
                  case 0:
                    return new Container(
                        color: Colors.white,
                        padding: new EdgeInsets.symmetric(horizontal: 30.0),
                        child: new InkWell(
                            child: new Text(
                              'Незалежний бренд аксесуарів для тих, хто сприймає життя як справжню пригоду!',
                              textAlign: TextAlign.center,
                            ),
                            onTap: () => _showModalSheet()));
                    break;

                  case 1:
                    return new SizedBox(
                        height: 130.0,
                        child: new ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            new ShopCategoryItem('images/wr.jpg', 'Чоловіче'),
                            new ShopCategoryItem('images/wr.jpg', 'Чоловіче'),
                            new ShopCategoryItem('images/wr.jpg', 'Чоловіче'),
                            new ShopCategoryItem('images/wr.jpg', 'Чоловіче'),
                            new ShopCategoryItem('images/wr.jpg', 'Чоловіче'),
                            new ShopCategoryItem('images/wr.jpg', 'Чоловіче'),
                            new ShopCategoryItem('images/wr.jpg', 'Чоловіче'),
                            new ShopCategoryItem('images/wr.jpg', 'Чоловіче'),
                          ],
                        ));
                    break;
                  default:
                    return new GestureDetector(
                      child: new Container(
                        decoration: new BoxDecoration(
                            borderRadius:
                                new BorderRadius.all(new Radius.circular(10.0)),
                            border: new Border.all(
                                color: new Color.fromRGBO(149, 152, 154, 0.15),
                                width: 2.0),
                            image: new DecorationImage(
                              image: new AssetImage(map[++index]),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.white),
                      ),
                      onTap: () => {},
                    );
                }
              },
              staggeredTileBuilder: (int index) {
                switch (index) {
                  case 0:
                    return new StaggeredTile.count(4, 1);
                    break;
                  case 1:
                    return new StaggeredTile.count(4, 2);
                    break;
                  default:
                    return new StaggeredTile.count(
                        2, index > 4 ? index - 3 : index + 1);
                    break;
                }
              },
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
          ),
        ])));
  }
}
