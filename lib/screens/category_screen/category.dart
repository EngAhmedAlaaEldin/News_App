import 'dart:ui';

class Categories{
  String title;
  String imageName;
  String id;
  Color color;

  Categories({required this.title,required this.imageName,required this.id,required this.color});

  static List<Categories> getCategories(){
    return [
      Categories(
        title: 'Sports',
        imageName: 'sports.png',
        id: 'sports',
        color: Color(0xFFC91C22)
    ),
      Categories(
          title: 'Entertainment',
          imageName: 'entertainment.png',
          id: 'entertainment',
          color: Color(0xFF003E90)
      ),
      Categories(
          title: 'Health',
          imageName: 'health.png',
          id: 'health',
          color: Color(0xFFED1E79)
      ),
      Categories(
          title: 'Business',
          imageName: 'business.png',
          id: 'business',
          color: Color(0xFFCF7E48)
      ),
      Categories(
          title: 'General',
          imageName: 'general.png',
          id: 'general',
          color: Color(0xFF4882CF)
      ),
      Categories(
          title: 'Science',
          imageName: 'science.png',
          id: 'science',
          color: Color(0xFFF2D352)
      ),
    ];
  }

}