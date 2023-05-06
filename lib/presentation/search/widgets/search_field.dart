import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
      onTap: () {},
      onChanged: (value) async {},
      decoration: const InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: InputBorder.none,
        prefixIcon: Padding(
          padding: EdgeInsets.only(top: 27),
          child: Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
        ),
        focusColor: Colors.white,
        hintText: 'Explore Your Headphones',
        hintStyle: TextStyle(color: Color(0xFF052F3D)),
        filled: true,
        fillColor: Color(0xFFB3CDD6),
        contentPadding: EdgeInsets.fromLTRB(0, 50, 0, 22),
      ),
    );
  }
}
