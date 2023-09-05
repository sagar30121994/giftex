import 'package:flutter/material.dart';
import 'package:giftex/screens/components/bottomnavigationbar/bottomnavigationbar.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  void _onItemTapped(int index) {
    setState(() {
      bottomViewModel.selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      backgroundColor: Color(0xffEAEEF2),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            // const DrawerHeader(
            //   decoration: BoxDecoration(
            //     color: Colors.blue,
            //   ),
            //   child: Text('Drawer Header'),
            // ),

            Row(
              children: [
                Image.asset("image/aboutus.png", width: 36, height: 36),
                SizedBox(width: 16),
                Text(
                  "About US".toUpperCase(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.red),
                ),
              ],
            ),

            ListTile(
              title: const Text('About Giftex'),
              onTap: () {
                _onItemTapped(29);
                Navigator.of(context).pop();
                // Navigator.pushReplacement(context,
                //     MaterialPageRoute(builder: (context) => Aboutuspage()));
                // Update the state of the app.

                // Update the state of the app.

                // ...
              },
            ),
            ListTile(
              title: const Text('Our Collectors'),
              onTap: () {
                _onItemTapped(32);
                Navigator.of(context).pop();
                // Update the state of the app.
                // ...
              },
            ),

            ListTile(
              title: const Text('Record Price Artwork'),
              onTap: () {
                _onItemTapped(28);
                Navigator.of(context).pop();
                // Update the state of the app.
                // ...
              },
            ),

            ListTile(
              title: const Text('Art Movement'),
              onTap: () {
                _onItemTapped(30);
                Navigator.of(context).pop();
                // Update the state of the app.
                // ...
              },
            ),

            Row(
              children: [
                Image.asset("image/insights.png", width: 36, height: 36),
                SizedBox(width: 16),
                Text(
                  "Insights".toUpperCase(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.red),
                ),
              ],
            ),

            ListTile(
                title: const Text('News & Updates'),
                selected: bottomViewModel.selectedIndex == 25,
                onTap: () {
                  _onItemTapped(25);
                  Navigator.pop(context);
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => NewsAndUpdatesPage()));
                  // Update the state of the app.

                  // ...
                }),

            ListTile(
              title: const Text('Our Services'),
              selected: bottomViewModel.selectedIndex == 9,
              onTap: () {
                _onItemTapped(9);

                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text('Blogs'),
              onTap: () {
                Navigator.of(context).pop();
                // Update the state of the app.
                // ...
              },
            ),

            ListTile(
                title: const Text('Departments'),
                selected: bottomViewModel.selectedIndex == 27,
                onTap: () {
                  _onItemTapped(27);

                  Navigator.pop(context);

                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) => Departments()));
                  // Update the state of the app.
                  // ...
                }),

            Row(
              children: [
                Image.asset("image/contactus.png", width: 36, height: 36),
                SizedBox(width: 16),
                Text(
                  "Contact us".toUpperCase(),
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.red),
                ),
              ],
            ),

            ListTile(
              title: const Text('Contact Us'),
              onTap: () {
                _onItemTapped(31);
                Navigator.of(context).pop();
                // Update the state of the app.
                // ...
              },
            ),

            ListTile(
              title: const Text('How To Buy'),
              selected: bottomViewModel.selectedIndex == 11,
              onTap: () {
                _onItemTapped(11);
                Navigator.pop(context);
                // Update the state of the app.
                // ...
              },
            ),

            ListTile(
              title: const Text('How To Sell'),
              selected: bottomViewModel.selectedIndex == 10,
              onTap: () {
                _onItemTapped(10);
                Navigator.pop(context);
                // Update the state of the app.
                // ...
              },
            ),

            ListTile(
              title: const Text('Career'),
              onTap: () {
                _onItemTapped(30);
                Navigator.of(context).pop();
                //Navigator.push(context, MaterialPageRoute(builder: (context) => ));
                // Update the state of the app.
                // ...
              },
            ),

            // Text(
            //   "Contact us".toUpperCase(),
            //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.red),
            // ),
          ],
        ),
      ),
    );
  }
}
