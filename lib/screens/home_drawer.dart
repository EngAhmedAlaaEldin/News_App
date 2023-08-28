import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  static const String category = 'category';
  static const String setting = 'setting';

  Function onBtnSelectedWidget;
  HomeDrawer(this.onBtnSelectedWidget);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            height: 200,
            color: Theme.of(context).primaryColor,
            child: Text('News App!',
            style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          SizedBox(height: 40,),
          InkWell(
            onTap: (){
              onBtnSelectedWidget(category);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset('assets/images/category.png'),
                  SizedBox(width: 12,),
                  Text('Categories',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 25,),
          InkWell(
            onTap: (){
              onBtnSelectedWidget(setting);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Image.asset('assets/images/settings.png'),
                  SizedBox(width: 12,),
                  Text('Settings',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Colors.black
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
