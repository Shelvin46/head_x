import 'package:flutter/material.dart';
// import 'package:head_x/core/uiConstant.dart';
import 'package:head_x/presentation/search/widgets/normal_show.dart';
import 'package:head_x/presentation/search/widgets/search_field.dart';

class MainSearch extends StatelessWidget {
  const MainSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD9D9D9),
      body: Column(
        children: const [
          SearchField(),
          Expanded(
            child: NormalShow(),
          )
        ],
      ),
    );
  }
}
