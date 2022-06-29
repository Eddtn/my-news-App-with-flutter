import 'package:flutter/material.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<String> items = [
    "Home",
    "BookMark",
    "Favourite",
    "More",
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        // color: Colors.blue,
        // margin: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  setState(() {});
                  _selectedIndex = index;
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: 90,
                  decoration: BoxDecoration(
                      color:
                          _selectedIndex == index ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(items[index]),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
