// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<ListFeedVertical> listFeedVertical = [
    ListFeedVertical(
        imageFeed:
            "https://kienthuc5s.com/wp-content/uploads/2022/01/11_hinh-anh-cho.jpg",
        titlePost: "Chó là bạn ",
        postDate: "1 chấm sành điệu"),
    ListFeedVertical(
        imageFeed: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        titlePost: "Chó là bạn ",
        postDate: "1 chấm sành điệu"),
    ListFeedVertical(
        imageFeed: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        titlePost: "Chó là bạn ",
        postDate: "1 chấm sành điệu"),
  ];
  List<ListFeedVertical> listHorizontalSearching = [
    ListFeedVertical(
        imageFeed: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        titlePost: "Chó là bạn không phải tôi",
        postDate: "một chấm sành điệu"),
    ListFeedVertical(
        imageFeed: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        titlePost: "Chó là bạn không phải tôi",
        postDate: "1 chấm sành điệu"),
    ListFeedVertical(
        imageFeed: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        titlePost: "Chó là bạn không phải tôi",
        postDate: "1 chấm sành điệu"),
  ];
  @override
  Widget build(BuildContext context) {
    int currentIndexfeed = 0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: SizedBox(
                      height: 36,
                      width: 10,
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            isDense: true,
                            prefixIcon: Icon(Icons.search),
                            hintText: 'Seach',
                            hintStyle:
                                TextStyle(color: Colors.grey.withOpacity(0.9)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              //borderSide: const BorderSide(color: Color(0XFFFBC16A)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              //borderSide: const BorderSide(color: Color(0XFFFBC16A)),
                            )),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.chat,
                      size: 36,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 16,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.local_grocery_store,
                        size: 36,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Bài viết mới',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey,
                  ),
                  Container(
                    height: 500,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: listFeedVertical.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 6,
                              color: Color(0XFFFBC16A),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 5),
                            padding: EdgeInsets.all(2),
                            child: Row(
                              children: [
                                Container(
                                    width: 100,
                                    height: 100,
                                    child: Image.network(
                                      listFeedVertical[index].imageFeed,
                                      width: 50,
                                      height: 50,
                                    )),
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          listFeedVertical[index].titlePost,
                                          overflow: TextOverflow.visible,
                                          softWrap: true,
                                          maxLines: 4,
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        listFeedVertical[index].postDate,
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w200,
                                            color: Color.fromARGB(
                                                255, 95, 93, 93)),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: GestureDetector(
                                          onTap: () {

                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 16),
                                            margin: const EdgeInsets.only(
                                                left: 20, right: 20),
                                            width: 100,
                                            height: 50,
                                            child: Text(
                                              'Xem thêm ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontFamily:
                                                      'fonts/Roboto-Bold.ttf'),
                                            ),
                                            decoration: BoxDecoration(
                                              color: Color(0XFFFBC16A),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListFeedVertical {
  String imageFeed;
  String titlePost;
  String postDate;
  ListFeedVertical({
    required this.imageFeed,
    required this.titlePost,
    required this.postDate,
  });
}
