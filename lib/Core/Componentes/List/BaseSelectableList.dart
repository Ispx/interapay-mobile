import 'package:flutter/material.dart';

import '../CardItemWidget.dart';
import '../CheckWidget.dart';
import '../../Theme/JuntaPayColors.dart';

class BaseSelectableList<T> extends StatelessWidget {
  const BaseSelectableList({
    required this.list,
    required this.titleGetter,
    required this.onSelect,
    required this.selected,
    this.physics,
    Key? key,
  }) : super(key: key);

  final List<T> list;
  final T? selected;
  final String Function(T) titleGetter;
  final void Function(T) onSelect;
  final ScrollPhysics? physics;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
       margin: EdgeInsets.only(top: 10, bottom:  MediaQuery.of(context).padding.bottom),
      child: ListView.custom(
        shrinkWrap: true,
        physics: physics ?? NeverScrollableScrollPhysics(),
        childrenDelegate: SliverChildListDelegate.fixed(
          list
              .map(
                (value) => CardItemWidget(
                  backgroundColor: selected == value ? Theme.of(context).primaryColor.withOpacity(0.1) : Colors.transparent,
                  onTap: () => onSelect(value),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          titleGetter(value),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 18,
                            color: JuntaPayColors.baseDark75,
                          ),
                        ),
                      ),
                      if (selected == value) ...{
                        CheckWidget(checked: true),
                      },
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
