import 'package:flutter/material.dart';
import 'package:project_f/UI/brand_box.dart';
import 'package:project_f/UI/text_column_product_page.dart';

class ProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProductPageState();
  }
}

class ProductPageState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return new Theme(
        data: new ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.black,
          primaryColorLight: Colors.black54,
          primaryColorDark: Colors.black,
          platform: Theme.of(context).platform,
        ),
        child: new Scaffold(
            backgroundColor: Colors.white,
            body: new CustomScrollView(
              slivers: <Widget>[
                new SliverAppBar(
                  expandedHeight: 350.0,
                  pinned: true,
                  actions: <Widget>[
                    new IconButton(
                      icon: const Icon(Icons.create),
                      tooltip: 'Edit',
                      onPressed: () {},
                    ),
                  ],
                  flexibleSpace: new FlexibleSpaceBar(
                    title: const Text(''),
                    background: new Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        new Image.asset(
                          'images/socks_2.png',
                          fit: BoxFit.cover,
                          height: 350.0,
                        ),
                        // This gradient ensures that the toolbar icons are distinct
                        // against the background image.
                        const DecoratedBox(
                          decoration: const BoxDecoration(
                            gradient: const LinearGradient(
                              begin: const Alignment(0.0, -1.0),
                              end: const Alignment(0.0, -0.4),
                              colors: const <Color>[
                                const Color(0x60000000),
                                const Color(0x00000000)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                new SliverList(
                    delegate: new SliverChildListDelegate(
                  <Widget>[
                    new TextPriceTextColumn(),
                    new Container(
                      padding: new EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.only(right: 8.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text(
                                  "Кількість:",
                                  style: new TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                new Container(
                                  decoration: new BoxDecoration(
                                      border: new Border.all(
                                          color: new Color.fromRGBO(
                                              149, 152, 154, 1.0),
                                          width: 2.0),
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(10.0))),
                                  padding: new EdgeInsets.fromLTRB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: new DropdownButton<int>(
                                    items: <int>[0, 1, 2, 3, 4, 5]
                                        .map((int value) {
                                      return new DropdownMenuItem<int>(
                                        value: value,
                                        child: new Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              24.0, 0.0, 24.0, 0.0),
                                          child: new Text('$value шт.'),
                                        ),
                                      );
                                    }).toList(),
//                        value: quantity,
                                    onChanged: null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          new Padding(
                            padding: new EdgeInsets.only(right: 8.0),
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Text(
                                  "Кількість:",
                                  style: new TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                new Container(
                                  decoration: new BoxDecoration(
                                      border: new Border.all(
                                          color: new Color.fromRGBO(
                                              149, 152, 154, 1.0),
                                          width: 2.0),
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(10.0))),
                                  padding: new EdgeInsets.fromLTRB(
                                      16.0, 0.0, 16.0, 0.0),
                                  child: new DropdownButton<String>(
                                    items: <String>[
                                      "28-30",
                                      "31-33",
                                      "34-36",
                                      "37-40"
                                    ].map((String value) {
                                      return new DropdownMenuItem<String>(
                                        value: value,
                                        child: new Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0.0, 0.0, 0.0, 0.0),
                                          child: new Text('$value розмір'),
                                        ),
                                      );
                                    }).toList(),
//                        value: quantity,
                                    onChanged: null,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    confirmAddToCart,
                    textForProduct,
                    new BrandBox()
                  ],
                ))
              ],
            )));
  }

  Widget confirmAddToCart = new Container(
      margin: new EdgeInsets.fromLTRB(30.0, 16.0, 30.0, 0.0),
      child: new MaterialButton(
          height: 50.0,
          color: Colors.black,
          onPressed: () => {},
          child: new Text(
            "ОФОРМИТИ В КОРЗИНУ",
            style: new TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          )));

  Widget textForProduct = new Container(
    padding: new EdgeInsets.all(16.0),
    child: new Text(
      "Коли Семмі був маленьким, "
          "він думав, що бенгальский тигр – це тигр, який запалює бенгальскі вогники. "
          "Вже будучи дорослим і зустрівши цього велетня у Гімалаях, він зрозумів свою помилку: "
          "не було ні гірлянд, ні вогників… була тільки необхідність бігти чимдуж. "
          "Але Семмі таки встиг замалювати тигра, "
          "щоб назавжди запам’ятати той момент прозріння.",
      style: new TextStyle(fontSize: 13.0),
    ),
  );
}
