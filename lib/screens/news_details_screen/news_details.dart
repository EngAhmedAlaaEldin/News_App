import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:untitled7/screens/news_details_screen/web_view.dart';
import '../../models/NewsResponce.dart';

class NewsDetails extends StatelessWidget {
    static const String routeName = 'newsDetails';

  @override
  Widget build(BuildContext context) {
    Articles news = ModalRoute.of(context)?.settings.arguments as Articles;
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
    ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage!,
                placeholder: (context, url) => Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor,)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(height: 8,),
            Text(news.author!,
              maxLines: 1,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 8,),
            Text(news.title!,
              maxLines: 2,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 8,),
            Text('${DateFormat.yMMMd().add_jm().format(DateTime.parse(news.publishedAt!))}',
              textAlign: TextAlign.end,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(news.description!,
                    style: Theme.of(context).textTheme.bodyMedium),
                  SizedBox(height: 40,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context,WebViewScreen.routeName,arguments: news);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('View Full Article',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 13,
                        )
                        ),
                        Icon(Icons.arrow_right,size: 25,)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    )
    );
  }
}
