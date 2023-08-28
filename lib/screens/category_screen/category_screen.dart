import 'package:flutter/material.dart';
import 'category.dart';
import 'category_widget.dart';

class CategoryScreen extends StatelessWidget {
  var categories = Categories.getCategories();
  Function onClickCategory;
  CategoryScreen(this.onClickCategory);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              'Pick your category'
              '\nof interest',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                        onClickCategory(categories[index]);
                    },
                      child: CategoryWidget(categories[index], index));
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                )),
          )
        ],
      ),
    );
  }
}
