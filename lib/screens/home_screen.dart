import 'package:flutter/material.dart';
import 'package:untitled7/screens/search_delegate.dart';
import 'package:untitled7/screens/settings_screen/settings_screen.dart';
import 'category_screen/category.dart';
import 'category_screen/category_screen.dart';
import 'home_drawer.dart';
import 'news_screen/news_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
    void initState() {
    // TODO: implement initState
    super.initState();
    selectedWidget = CategoryScreen(onClickCategory);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage('assets/images/background.png',)
    )
    ),
    child: Scaffold(
    backgroundColor: Colors.transparent,
    appBar: AppBar(
    title: Text('News App'),
      actions: [
        Container(
            padding: EdgeInsets.only(right: 3),
            child: IconButton(onPressed: (){
                      showSearch(context: context, delegate: SearchNews());
            }, icon: Icon(Icons.search,size: 30,)))
      ],
    ),
      drawer: Drawer(
        child: HomeDrawer(onBtnSelectedWidget),
      ),
      body: selectedWidget,
    )
    );
  }

  void onClickCategory(Categories category){
    selectedWidget = NewsScreen(category);
    setState(() {

    });
  }

 late Widget selectedWidget;
  onBtnSelectedWidget(String input){
    Navigator.pop(context);
    if(input == HomeDrawer.category){
      selectedWidget = CategoryScreen(onClickCategory);
    }
    else if(input == HomeDrawer.setting){
      selectedWidget = SettingsScreen();
    }
    setState(() {
    });
  }
}

