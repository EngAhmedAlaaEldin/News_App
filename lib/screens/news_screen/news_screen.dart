import 'package:flutter/material.dart';
import 'package:untitled7/screens/news_screen/tab_item.dart';
import '../../api_manager/apis.dart';
import '../../models/SourceResponce.dart';
import '../category_screen/category.dart';

class NewsScreen extends StatelessWidget {
static const String routeName = 'newsTab';
  Categories? category;
  NewsScreen(this.category);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
          future: Api_Manage.getSourceData(category?.id??''),
          builder: (context, snapshot) {
            if(snapshot.hasError){
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(child: Text(snapshot.data?.message ?? "")),
              );
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(color: Theme.of(context).primaryColor,),
              );
            }
            if('ok' != snapshot.data?.status){
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(snapshot.data?.message??""),
                );
            }
            return TabsNews(snapshot.data?.sources??[]);
          },
        );
  }
}
