import 'package:flutter/material.dart';

import '../Theme/JuntaPayFont.dart';

class JuntaPayAppBar extends StatelessWidget implements PreferredSizeWidget {
  const JuntaPayAppBar({
    required this.title,
    this.backgroundColor,
    this.size = const Size.fromHeight(80.0),
    Key? key,
  }) : super(key: key);

  factory JuntaPayAppBar.white({required String title}) => JuntaPayAppBar(title: title, backgroundColor: Colors.white);

  final String title;
  final Color? backgroundColor;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(fontSize: 20, fontWeight: JuntaPayFont.semiBold),
      ),
      iconTheme: IconThemeData(color: backgroundColor == Colors.white ? Colors.black : Colors.white),
      elevation: 0,
      centerTitle: true,
      toolbarHeight: size.height,
      backgroundColor: backgroundColor,
      foregroundColor: backgroundColor == Colors.white ? Colors.black : Colors.white,
    );
  }

  @override
  Size get preferredSize => this.size;
}
