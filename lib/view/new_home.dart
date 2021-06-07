import 'package:flutter/material.dart';
import 'package:news_mvvm_app/utils/constants.dart';
import 'package:news_mvvm_app/view_model/news_list_view_model.dart';
import 'package:news_mvvm_app/widget/home_grid_view.dart';
import 'package:news_mvvm_app/widget/home_header.dart';
import 'package:news_mvvm_app/widget/home_slider.dart';
import 'package:provider/provider.dart';

class NewsHome extends StatefulWidget {
  @override
  _NewsHomeState createState() => _NewsHomeState();
}

class _NewsHomeState extends State<NewsHome> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsListViewModel>(context, listen: false).fetchArticle();
    Provider.of<NewsListViewModel>(context, listen: false).fetchAppleArticle();
  }

  @override
  Widget build(BuildContext context) {
    var newsItem = Provider.of<NewsListViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.dehaze,
          color: Colors.black,
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            itemBuilder: (context) {
              return Constants.Countries.keys
                  .map((e) => PopupMenuItem(
                        child: Text(e),
                        value: e,
                      ))
                  .toList();
            },
            onSelected: (country) {
              newsItem.fetchArticleCountry(Constants.Countries[country]);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: HomeHeader(header: 'Trending'),
              ),
            ),
            newsItem.appleArticle.length != 0
                ? HomeSlider(newsItem)
                : Center(
                    child: CircularProgressIndicator(),
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SizedBox(
                  width: double.infinity,
                  child: HomeHeader(header: 'HeadLines')),
            ),
            HomeGridView(newsItem)
          ],
        ),
      ),
    );
  }
}
