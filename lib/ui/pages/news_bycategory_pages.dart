import 'package:flutter/material.dart';
import 'package:portalberita/model/news_respon.dart';
import 'package:portalberita/repositories/data_request.dart';
import 'package:portalberita/ui/views/news_item.dart';
import 'package:portalberita/ui/widgets/widgets.dart';

class NewsByCategory extends StatelessWidget {
  RequestByCategory requestByCategory = RequestByCategory();
  String newsCategory;

  NewsByCategory({this.newsCategory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(),
        body: FutureBuilder(
            future: requestByCategory.getNewsByCategory(newsCategory),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListNewsCategory(snapshot.data);
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text("Data tidak tersedia"));
              }

              return Center(child: CircularProgressIndicator());
            }));
  }
}

class ListNewsCategory extends StatelessWidget {
  NewsRespon responseBerita;

  ListNewsCategory(this.responseBerita);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Container(
          margin: EdgeInsets.only(top: 16),
          child: ListView.builder(
              itemCount: responseBerita.articles.length,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) {
                return NewsItem(
                  imgUrl: responseBerita.articles[index].urlToImage ?? "",
                  title: responseBerita.articles[index].title ?? "",
                  desc: responseBerita.articles[index].description ?? "",
                  content: responseBerita.articles[index].content ?? "",
                  posturl: responseBerita.articles[index].url ?? "",
                  name: responseBerita.articles[index].source.name ?? "",
                );
              }),
        ),
      ),
    );
  }
}