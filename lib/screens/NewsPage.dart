import 'package:flutter/material.dart';
import 'package:virtusa_assignment2/bloc/news_bloc.dart';
import 'package:virtusa_assignment2/models/NewsResponse.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    final newBloc = NewsBloc();
     newBloc.fetchNews();
   
    return StreamBuilder(
        stream: weatherBloc.newsStream,
        builder: (context, AsyncSnapshot<List<Articles>> snapshot) {
          if (snapshot.hasData) {
            return _buildWidgetNews(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Container _buildWidgetNews(List<Articles> newslist) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: ListView.builder(
          itemCount: newslist.length,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context, index) {
            return NewsTile(
              imgUrl: newslist[index].urlToImage ?? "",
              title: newslist[index].title ?? "",
              desc: newslist[index].description ?? "",
              content: newslist[index].content ?? "",
              posturl: newslist[index].urlToImage ?? "",
            );
          }),
    );
  }
}

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(
        //     builder: (context) => ArticleView(
        //       postUrl: posturl,
        //     )
        // ));
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
