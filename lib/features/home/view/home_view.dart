import 'package:flutter/material.dart';
import 'package:task/features/home/view/widgets/my_albums_list_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              SizedBox(height: 16),
              Text(
                "Name",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text("Address"),
              SizedBox(height: 16),
              Text(
                "My Albums",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              MyAlbumsList(),
            ],
          ),
        ),
      ),
    );
  }
}
