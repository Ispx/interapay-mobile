import 'package:flutter/material.dart';

class CardItemWidget extends StatelessWidget {
  const CardItemWidget({
    required this.child,
    this.onTap,
    this.height = 65,
    this.backgroundColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
    Key? key,
  }) : super(key: key);

  final void Function()? onTap;
  final double height;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        curve: Curves.linear,
        duration: Duration(milliseconds: 200),
        padding: padding,
        height: height,
        child: child,
        color: backgroundColor,
      ),
    );
  }
}
