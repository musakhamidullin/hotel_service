import 'package:flutter/material.dart';

import '../../../common/widgets/modals.dart';
import 'filter_sheet.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: TextField(
              onTapOutside: (_) {
                FocusScope.of(context).unfocus();
              },
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(4.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      12,
                    ),
                  ),
                ),
                prefixIcon: Icon(Icons.search),
                hintText: 'Поиск',
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: () {
            Modals.showBottomSheet(
              context,
              const FilterSheet(),
              showDragHandle: true,
            );
          },
          icon: const Icon(Icons.filter_alt_rounded),
        )
      ],
    );
  }
}
