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
    Key? key,
  }) : super(key: key);

  final List<T> list;
  final T selected;
  final String Function(T) titleGetter;
  final void Function(T) onSelect;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: MediaQuery.of(context).padding.bottom),
      child: Column(
        children: [
          Container(
            color: Colors.white,
            child: ListView.custom(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
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
          ),
        ],
      ),
    );
  }
}
