import 'package:flutter/material.dart';

class MyAlbumsList extends StatelessWidget {
  const MyAlbumsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) => InkWell(
          onTap: () {},
          child: ListTile(
            title: Text("$index"),
          ),
        ),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
