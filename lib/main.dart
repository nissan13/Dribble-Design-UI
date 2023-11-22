import 'package:chatapp_ui/pages/project.dart';
import 'package:chatapp_ui/pages/team_folder.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CloudFileManagerUI());
}

class CloudFileManagerUI extends StatelessWidget {
  const CloudFileManagerUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CloudFiles",
      home: TeamFolderPage(),
    );
  }
}
