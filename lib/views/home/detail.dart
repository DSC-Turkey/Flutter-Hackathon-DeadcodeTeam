import 'package:eogretmen/state/detailsState.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  YoutubePlayerController _controller;

  void initState() {
    // TODO: implement initState
    super.initState();
    final DetailState c = Get.put(DetailState());

    _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(c.data[0]['videoUrl']));
  }

  @override
  Widget build(BuildContext context) {
    final DetailState c = Get.find();
    return Scaffold(
        body: GetBuilder<DetailState>(
      builder: (_) => SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 1.3,
                  margin: EdgeInsets.fromLTRB(16, 30, 16, 16),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              topLeft: Radius.circular(16)),
                          child: Image.network(c.data[0]['imageUrl'])),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        c.data[0]['name'],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      YoutubePlayer(
                        controller: _controller,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.keyboard_arrow_up, color: Colors.black),
                      Text(
                        "Kurs içeriklerini görmek için kaydır",
                      )
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 20,
                    )),
                Text(
                  c.data[0]['name'],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            "E-öğretmen",
                          )
                        ],
                      ),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.body1,
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.black,
                                  size: 16,
                                ),
                              ),
                            ),
                            TextSpan(text: "5.0", style: TextStyle()),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: c.data.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return LearnerQuestion(
                        index: index,
                      );
                    }),
                Container()
              ],
            )
          ],
        ),
      ),
    ));
  }
}

class LearnerQuestion extends StatelessWidget {
  int index;

  LearnerQuestion({this.index});
  var i;

  @override
  Widget build(BuildContext context) {
    final DetailState c = Get.find();
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: <Widget>[
          Text(
            index.toString(),
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  c.data[index]['content'],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
