import 'package:flutter/material.dart';
import '../../api_manager/apis.dart';
import '../../models/NewsResponce.dart';
import '../../models/SourceResponce.dart';
import 'news_widget.dart';

class NewsData extends StatelessWidget {

  Sources sources;
  NewsData(this.sources);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponce>(
        future: Api_Manage.getNewsData(sourceId: sources.id??''),
        builder: (context, snapshot) {
    if (snapshot.hasError) {
       Padding(
         padding: const EdgeInsets.all(12.0),
         child: Center(child: Text(snapshot.data?.message ?? "")),
       );
    }
    if (snapshot.connectionState == ConnectionState.waiting) {
    return Center(
    child: CircularProgressIndicator(color: Theme
        .of(context)
        .primaryColor,),
    );
    }
    if ('ok' != snapshot.data?.status) {
    return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Text(snapshot.data?.message ?? ""),
    );
    }
    var newsData = snapshot.data?.articles;
    
        return ListView.separated(
          physics: BouncingScrollPhysics(),
            itemCount: newsData?.length??0,
            itemBuilder: (context, index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                child: NewsWidget(newsData![index])),
          separatorBuilder: (context, index) => Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(thickness: 2,color: Colors.grey,)),
        );
        }
    );
  }
}
