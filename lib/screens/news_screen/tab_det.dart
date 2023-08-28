import 'package:flutter/material.dart';

import '../../models/SourceResponce.dart';

class TabDetails extends StatelessWidget {
  Sources sources;
  bool isSelected;
  TabDetails(this.sources,this.isSelected);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 24),
      decoration: BoxDecoration(
        color: isSelected ? Theme.of(context).primaryColor:Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Text('${sources.name}',
      style: TextStyle(
        color: isSelected ? Colors.white:Theme.of(context).primaryColor
      ),
      ),
    );
  }
}
