import 'package:flutter/material.dart';
import 'package:my_flutter_news_app/models/model.dart';
import 'package:my_flutter_news_app/services/news_service.dart';
import 'package:my_flutter_news_app/views/detail_page.dart';
import 'package:my_flutter_news_app/widgets/newslist.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  List<Article> news = [];
  bool isLoaded = true;

  // gethere() {
  //   String data = getnews();
  //   return data;
  // }

  @override
  void initState() {
    getnews();
    super.initState();
  }

  getnews() async {
    try {
      setState(() {
        isLoaded = false;
      });
      final articles = NewsService();
      news = await articles.getnews();
    } catch (e) {
      print(e);
      setState(() {
        isLoaded = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoaded
        ? const Center(child: CircularProgressIndicator())
        : SafeArea(
            child: Scaffold(
              body: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Find Best news \n For Today',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                onSubmitted: (value) {
                                  // value = searchTextController.text;
                                },
                                // controller: searchTextController,
                                decoration: const InputDecoration(
                                  hintText: 'search Destination',
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.search),
                                  // suffixIcon: Icon(Icons.add_a_photo_outlined),
                                ),
                              ),
                            ),
                            Container(
                              child: const Icon(
                                Icons.menu_open_sharp,
                                color: Color(0xff51C98B),
                              ),
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: const Color(0xffE7F4F0),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ],
                        ),
                        const NewsList(),
                        const Text(
                          'Trending News',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ...List.generate(
                          news.length,
                          (index) => InkWell(
                            onTap: (() => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DatailedPage()))),
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 450,
                                    width: MediaQuery.of(context).size.width,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        // color: Colors.black.withOpacity(0.9),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: "${news[index].urlToImage}",
                                      // 'https://media.istockphoto.com/photos/herbs-and-spices-for-cooking-on-dark-background-picture-id941858854?k=20&m=941858854&s=612x612&w=0&h=c6_v6jU2u8hbbxIhldg4TtY5BYzn0i2UovFdAr-xAUU='
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 450,
                                    width: MediaQuery.of(context).size.width,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                ),
                                Positioned(
                                    // top: 34,
                                    bottom: 120,
                                    left: 30,
                                    child: Text(
                                      "${news[index].title}",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 25),
                                    )),
                                Positioned(
                                    bottom: 100,
                                    left: 30,
                                    child: Text(
                                      "${news[index].author}",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )),
                                Positioned(
                                    bottom: 80,
                                    left: 30,
                                    child: Text(
                                      "${news[index].description}",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )),
                                Positioned(
                                  top: 30,
                                  right: 30,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffB48665),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Icon(
                                      Icons.bookmark,
                                      color: Color(0xffFEFEFE),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
