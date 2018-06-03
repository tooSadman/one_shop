import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:project_f/UI/grid_item.dart';
import 'package:project_f/UI/grid_item_category.dart';
import 'package:project_f/UI/order_item.dart';

class CategoryGirlPage extends StatefulWidget {
  @override
  State createState() => new OrderPageState();
}

class OrderPageState extends State<CategoryGirlPage> {

  List<Widget> _shopItemList = new List();

  @override
  Widget build(BuildContext context) {

    List<StaggeredTile> _allNewStaggeredTiles() {
      var _staggeredTilesList = new List<StaggeredTile>();
//      for (int i = 0; i < index; i++) {
//      // index - number of products
//      _staggeredTilesList.add(new StaggeredTile.count(2, 2));
//      }

      _staggeredTilesList.add(new StaggeredTile.count(2, 2));
      _staggeredTilesList.add(new StaggeredTile.count(2, 3));
      _staggeredTilesList.add(new StaggeredTile.count(2, 3));
      _staggeredTilesList.add(new StaggeredTile.count(2, 1));
      _staggeredTilesList.add(new StaggeredTile.count(2, 3));
      _staggeredTilesList.add(new StaggeredTile.count(2, 2));
      _staggeredTilesList.add(new StaggeredTile.count(2, 3));
      _staggeredTilesList.add(new StaggeredTile.count(2, 3));

      return _staggeredTilesList;
    }

    _shopItemList.addAll([
      new GridItemCategory("images/category_girl/big_girl.png"),
      new GridItemCategory("images/category_girl/colord_socks.png"),
      new GridItemCategory("images/category_girl/high_girl.png"),
      new GridItemCategory("images/category_girl/another_girl.png"),
      new GridItemCategory("images/category_girl/coffe_girl.png"),
      new GridItemCategory("images/category_girl/chair_girl.png"),
      new GridItemCategory("images/category_girl/good_socks.png"),
      new GridItemCategory("images/gel.png"),


    ]);

    return new Scaffold(
        appBar: new AppBar(
          elevation: 0.0,
          title: new Text("Категорія",
              style: new TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: new IconButton(
            color: Colors.black,
            icon: new Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: new StaggeredGridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 6.0,
            crossAxisSpacing: 6.0,
            children: _shopItemList,
            staggeredTiles: _allNewStaggeredTiles()),

    );
  }

}


