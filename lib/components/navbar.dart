import 'package:flutter/material.dart';
import 'constants.dart';

class Nav_Bar extends StatelessWidget implements PreferredSizeWidget {
  final String labeltext;
  const Nav_Bar({
    Key? key,
    required this.labeltext,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        labeltext,
        style: kNavBar,
      ),
      // backgroundColor: const Color.fromARGB(255, 200, 255, 0),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }
}

// const kNavBar = TextStyle(
//   color: Color(0xffffffff),
//   fontSize: 20.0,
// );
