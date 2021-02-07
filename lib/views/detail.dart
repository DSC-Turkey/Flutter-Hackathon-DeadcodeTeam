import 'package:eogretmen/resource/constants.dart';
import 'package:eogretmen/resource/utils.dart';
import 'package:eogretmen/state/detailsState.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DetailState c = Get.put(DetailState());
    return Scaffold(
        backgroundColor: learner_layout_background,
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
                      decoration: boxDecoration(
                          showShadow: true, radius: 16, bgColor: learner_white),
                      child: Column(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(16),
                                topLeft: Radius.circular(16)),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          text(c.data[0], fontSize: textSizeNormal),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              LearnerOptionDescription(
                                  "learner_lbl_1_6k", " learner_lbl_students"),
                              LearnerOptionDescription(
                                  " learner_lbl_5_0", "learner_lbl_rating"),
                              LearnerOptionDescription(
                                  "learner_lbl_37", "learner_lbl_lectures"),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.keyboard_arrow_up,
                            color: learner_textColorSecondary,
                          ),
                          text("Kurs içeriklerini görmek için kaydır",
                              textColor: learner_textColorSecondary)
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
                          color: learner_textColorSecondary,
                          size: 20,
                        )),
                    text(
                      "learner_lbl_project_management",
                      fontSize: textSizeNormal,
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
                              text("learner_lbl_hannah_tran",
                                  textColor: learner_colorPrimary)
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.body1,
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Icon(
                                      Icons.star,
                                      color: learner_yellow,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                TextSpan(
                                    text: " learner_lbl_5_0",
                                    style: TextStyle(
                                      fontSize: textSizeMedium,
                                      color: learner_yellow,
                                    )),
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
                          return LearnerQuestion();
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
  var i;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Row(
        children: <Widget>[
          text("1", textColor: learner_textColorSecondary),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                text("model.name",
                    fontSize: textSizeLargeMedium,
                    maxLine: 2,
                    isLongText: true),
                text("model.subtitle", isLongText: true, maxLine: 2),
                text("model.typ", textColor: learner_colorPrimary)
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget LearnerOptionDescription(var total, var type) {
  return Container(
    margin: EdgeInsets.only(left: 16, right: 16),
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 4,
        ),
        Text("total, fontFamily: fontMedium, isLongText: true"),
        text(type, textColor: learner_textColorSecondary),
      ],
    ),
  );
}
