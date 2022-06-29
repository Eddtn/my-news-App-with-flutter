import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DatailedPage extends StatelessWidget {
  const DatailedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        child: const Icon(
                          Icons.arrow_back_sharp,
                          color: Color(0xffCCCBCC),
                        ),
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: const Color(0xffFFFDFE),
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                    const Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff110F14),
                      ),
                    ),
                    Container(
                      child: const Icon(
                        Icons.more_horiz,
                        color: Color(0xffCCCBCC),
                      ),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: const Color(0xffFFFDFE),
                          borderRadius: BorderRadius.circular(5)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          /////imageurl
                          'https://media.istockphoto.com/photos/herbs-and-spices-for-cooking-on-dark-background-picture-id941858854?k=20&m=941858854&s=612x612&w=0&h=c6_v6jU2u8hbbxIhldg4TtY5BYzn0i2UovFdAr-xAUU='),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('BookMark'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
