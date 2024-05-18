import 'package:flutter/material.dart';

import '../../../../core/theming/fonts.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      IconButton(onPressed: (){}, icon: Icon(Icons.menu , size: 30,) , color: Colors.white, ),
      Text("My Wallet", style: FontHelper.font18BoldWhite),
      IconButton(onPressed: (){}, icon: Icon(Icons.notifications , size: 30,) , color: Colors.white,),
    
    ],);
  }
}
