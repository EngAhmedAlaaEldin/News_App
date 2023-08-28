import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/NewsResponce.dart';
import '../news_details_screen/news_details.dart';

class NewsWidget extends StatelessWidget {

  Articles articles;
  NewsWidget(this.articles);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetails.routeName,arguments: articles);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: articles.urlToImage!,
              placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: 8,),
          Text(articles.author??'',
            textAlign: TextAlign.start,
            maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 8,),
          Text(articles.title??'',
            textAlign: TextAlign.start,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 8,),
          Text('${DateFormat.yMMMd().add_jm().format(DateTime.parse(articles.publishedAt!))}',
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
