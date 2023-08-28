import 'package:flutter/material.dart';

import 'category.dart';

class CategoryWidget extends StatelessWidget {
  Categories categories;
  int index;
  CategoryWidget(this.categories,this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: categories.color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18),
          topRight: Radius.circular(18),
          bottomRight:Radius.circular(index%2 == 0? 0:18),
          bottomLeft:Radius.circular(index%2 == 0? 18:0),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/${categories.imageName}',
          height: 100,
            fit: BoxFit.fitHeight,
          ),
          Text(categories.title,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Colors.white
          ),
          )
        ],
      ),
    );
  }
}
