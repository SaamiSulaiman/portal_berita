import 'package:flutter/material.dart';
import 'package:portalberita/ui/constants/text_style.dart';

import 'article_view.dart';

class NewsItem extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl, name;

  NewsItem(
      {this.imgUrl,
        this.desc,
        this.title,
        this.content,
        this.name,
        @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                  postUrl: posturl,
                )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          maxLines: 2,
                          style: kTextTitle,
                        ),
                        Text(
                          desc,
                          maxLines: 2,
                          style: kSubTitle,
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          name,
                          maxLines: 2,
                          style: kSubTitle,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          imgUrl,
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                        )),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
