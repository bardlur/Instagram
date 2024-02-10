import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> category = ['All', 'Account', 'Hashtag', 'Caption', 'Story'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _getSearchBox(),
              ),
              SliverToBoxAdapter(
                child: _getCategoryList(),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset('images/item$index.png'),
                      )
                    )
                  );
                }, 
                  childCount: 10,
                ), 
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 3, 
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    QuiltedGridTile(2, 1),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(1, 1),
                    QuiltedGridTile(1, 1), 
                    QuiltedGridTile(1, 1),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getSearchBox() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            height: 46,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              color: Color(0xff272B40)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Image.asset('images/icon_search.png'),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search User',
                        hintStyle: TextStyle(
                          color: Colors.white
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Image.asset('images/icon_scan.png')
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _getCategoryList() {
    return Container(
      height: 23,
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: Color(0xff272B40),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 4),
              child: Text(
                category[index],
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'GM',
                  color: Colors.white
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}