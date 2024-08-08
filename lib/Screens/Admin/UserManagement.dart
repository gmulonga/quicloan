import 'package:flutter/material.dart';
import 'package:quicloan/theme_notifier.dart';
import 'package:provider/provider.dart';
import 'package:quicloan/Utilis/Constants.dart';
import 'package:quicloan/Components/CustomButton.dart';
import 'package:quicloan/Components/ReusableTile.dart';
import 'package:quicloan/Screens/Admin/RegisterScreen.dart';

void main() => runApp(const SearchBarApp());

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    void _handleSearch() {
      String searchTerm = _searchController.text;
      print('Search term: $searchTerm');
      // You can add your logic here to handle the search action
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'User Management',
            style: TextStyle(color: kCream),
          ),
          backgroundColor: themeNotifier.isDark ? kDarkTheme1 : kNavyBlue,
        ),
        backgroundColor: themeNotifier.isDark ? kDarkTheme2 : kCream,
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    color: themeNotifier.isDark ? kDarkTheme1 : kNavyBlue,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            hintStyle: TextStyle(
                                color: Colors.grey), // Set the hint text color
                            suffixIconColor: kCream,
                            suffixIcon: IconButton(
                              icon: Icon(Icons.search),
                              onPressed: _handleSearch,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kOrange,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: kCream,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                          ),
                          style: TextStyle(color: kCream), // Set the text color
                          onSubmitted: (String searchTerm) {
                            _handleSearch();
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: CustomButton(
                            callBackFunction: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Registerscreen()),
                              );
                            },
                            label: 'Add User',
                            bgColor: kOrange,
                            txtColor: kCream),
                      ),
                    ],
                  ),
                ),
                ReusableTile(
                  label: 'Jane Doe',
                  status: 'Active',
                  onButtonPressed: () {},
                ),
                ReusableTile(
                  label: 'Jane Doe',
                  status: 'Suspended',
                  onButtonPressed: () {},
                ),
                ReusableTile(
                  label: 'Jane Doe',
                  status: 'Active',
                  onButtonPressed: () {},
                ),
              ],
            )
          ],
        ));
  }
}
