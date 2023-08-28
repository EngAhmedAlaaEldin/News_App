import 'package:flutter/material.dart';

import '../api_manager/apis.dart';
import '../models/NewsResponce.dart';
import 'news_screen/news_widget.dart';

class SearchNews extends SearchDelegate{

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        toolbarHeight: 80,
        color: Theme.of(context).primaryColor,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50)
            )
        ),
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Theme.of(context).primaryColor)
            ),
            enabledBorder:  OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: Theme.of(context).primaryColor)
            ),
            fillColor: Colors.white,
            filled: true,
          ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(onPressed: (){
      Navigator.pop(context);
    },
        icon: Icon(Icons.clear,size: 30,));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return const Text('');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if(query.isEmpty){
      return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/background.png',)
            )
        ),);
    }
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/background.png',)
          )
      ),
      child: FutureBuilder<NewsResponce>(
          future: Api_Manage.getNewsData(query: query),
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
      ),
    );
  }

}