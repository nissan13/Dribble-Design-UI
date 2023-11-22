import 'package:chatapp_ui/pages/project.dart';
import 'package:flutter/material.dart';

class TeamFolderPage extends StatefulWidget {
  const TeamFolderPage({super.key});

  @override
  State<TeamFolderPage> createState() => _TeamFolderPageState();
}

class _TeamFolderPageState extends State<TeamFolderPage> {
  double availableScreenWidth = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    availableScreenWidth = MediaQuery.of(context).size.width - 50;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            alignment: Alignment.bottomCenter,
            height: 170,
            decoration: BoxDecoration(color: Colors.blue.shade800),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Riotters",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          color: Colors.white),
                    ),
                    Text(
                      "TeamFolder",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withOpacity(.1),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                        color: Colors.white,
                        iconSize: 26,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black.withOpacity(.1),
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications),
                        color: Colors.white,
                        iconSize: 26,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: const TextSpan(
                        text: "Storage ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18),
                        children: [
                      TextSpan(
                        text: "9.1/10GB",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                    ])),
                const Text(
                  "Upgrade",
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              children: [
                buildFileSizeChart("SOURCES", Colors.blue, .3),
                const SizedBox(width: 2),
                buildFileSizeChart("DOCS", Colors.red, .25),
                const SizedBox(width: 2),
                buildFileSizeChart("IMAGES", Colors.yellow, .20),
                const SizedBox(width: 2),
                buildFileSizeChart("", Colors.grey, .23),
              ],
            ),
          ),
          const SizedBox(height: 15),
          const Divider(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(25),
              children: [
                const Text(
                  "Recently Updated",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    buildFileColumn(
                        "assets/images/sketch.png", "desktop", ".sketch"),
                    SizedBox(width: availableScreenWidth * .03),
                    buildFileColumn(
                        "assets/images/sketch.png", "mobile", ".sketch"),
                    SizedBox(width: availableScreenWidth * .03),
                    buildFileColumn(
                        "assets/images/prd.png", "interaction", ".prd"),
                  ],
                ),
                const Divider(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "Projects",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "Create new",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                buildProjectRow("ChatBox"),
                buildProjectRow("TimeNote"),
                buildProjectRow("Something"),
                buildProjectRow("Other"),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: Colors.white, spreadRadius: 7, blurRadius: 1),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: "Time",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box),
            label: "Folder",
          ),
        ],
      ),
    );
  }

  Widget buildProjectRow(String folderName) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => ProjectPage(
              folderName: folderName,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        height: 65,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[200],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.folder,
                  color: Colors.blue[200],
                ),
                Text(
                  folderName,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_rounded),
            ),
          ],
        ),
      ),
    );
  }

  Column buildFileColumn(String image, String filename, String extension) {
    return Column(
      children: [
        Container(
          width: availableScreenWidth * .31,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15),
          ),
          height: 110,
          padding: const EdgeInsets.all(38),
          child: Image.asset(image),
        ),
        const SizedBox(height: 10),
        RichText(
          text: TextSpan(
            text: filename,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black),
            children: [
              TextSpan(
                text: extension,
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    fontSize: 12),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column buildFileSizeChart(String title, Color color, double widthPercentage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: color,
          height: 8,
          width: availableScreenWidth * widthPercentage,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
