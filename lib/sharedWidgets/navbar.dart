import 'package:flutter/material.dart';

class NavBar extends StatefulWidget implements PreferredSizeWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue, // Change the background color as needed
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: Icon(Icons.menu), // Hamburger menu icon
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open the sidebar
            },
          );
        },
      ),
      title: Row(
        children: [
          Text('Your Logo'),
          SizedBox(width: 20),
          Container(
            constraints: BoxConstraints(maxWidth: 500),
            // Limit search bar width
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none, // Remove the underline
                    ),
                    // Implement search functionality here
                    onChanged: (text) {
                      // Handle search text changes
                    },
                    onSubmitted: (text) {
                      // Handle search submission
                    },
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality here
            },
          ),
        ],
      ),

      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          onPressed: () {
            // Implement notifications functionality here
          },
        ),
        IconButton(
          icon: Icon(Icons.person),
          onPressed: () {
            // Implement profile details functionality here
          },
        ),
      ],
    );
  }
}
