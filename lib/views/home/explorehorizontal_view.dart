import 'dart:ui';

import 'package:eogretmen/app/routes.dart';
import 'package:eogretmen/state/detailsState.dart';
import 'package:flutter/material.dart';
import 'package:eogretmen/resource/themeColors.dart';
import 'package:eogretmen/widgets/custom_rectangle_tab_indicator_widget.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreHorizontalView extends StatefulWidget {
  @override
  _ExploreHorizontalViewState createState() => _ExploreHorizontalViewState();
}

class _ExploreHorizontalViewState extends State<ExploreHorizontalView> {
  static Widget currentTabContent;
  static int tappedIndex;

  @override
  void initState() {
    super.initState();
    DetailState c = Get.find();
    c.veriGetir("abc", "maths");
    tappedIndex = tappedIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    currentTabContent = renderTabContent(context);

    return GetBuilder<DetailState>(
        builder: (_) => Container(
              margin: EdgeInsets.only(
                left: size.width * 0.02,
                top: size.width * 0.08,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customTabIndicator(context, size),
                  Container(
                    height: 200,
                    child: ListView(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: [
                        currentTabContent != null
                            ? currentTabContent
                            : Text('Yükleniyor..'),
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }

  Widget customTabIndicator(BuildContext context, Size size) {
    return Container(
      height: 30,
      child: DefaultTabController(
        length: 4,
        child: TabBar(
          labelPadding: EdgeInsets.only(
            left: size.width * 0.02,
            right: size.width * 0.02,
          ),
          indicatorPadding: EdgeInsets.only(
            left: size.width * 0.02,
            right: size.width * 0.02,
          ),
          isScrollable: true,
          labelColor: ThemeColors.BLACK,
          unselectedLabelColor: ThemeColors.GRAY,
          labelStyle: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
          indicator: CustomRoundedRectangleTabIndicator(
            color: Colors.black,
            weight: 2.4,
            width: size.width * 0.02,
          ),
          onTap: (index) => {
            setState(() {
              tappedIndex = index;
              currentTabContent = renderTabContent(context);
            })
          },
          tabs: [
            Tab(
              child: Container(
                child: Text('Alfabe Dersleri'),
              ),
            ),
            Tab(
              child: Container(
                child: Text('Matematik'),
              ),
            ),
            Tab(
              child: Container(
                child: Text('Her Yaşa Göre'),
              ),
            ),
            Tab(
              child: Container(
                child: Text('Okuryazarlık Gelişimi'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderTabContent(BuildContext context) {
    DetailState c = Get.put(DetailState());
    final Size size = MediaQuery.of(context).size;

    switch (tappedIndex) {
      case 0:
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: c.data.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return tabContainerTemplate(
                context,
                size,
                c.data[index]['content'],
                c.data[index]['imageUrl'],
                12,
              );
            });

      case 1:
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: c.data2.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return tabContainerTemplate(
                context,
                size,
                c.data2[index]['content'],
                c.data2[index]['imageUrl'],
                12,
              );
            });
      case 2:
        return Row(
          children: [
            tabContainerTemplate(
              context,
              size,
              "ÇOK YAKINDA",
              "https://rightsagenda.org/wp-content/uploads/2019/01/guide-moving-abroad-education-netherlands.jpg",
              23,
            ),
            tabContainerTemplate(
              context,
              size,
              "ÇOK YAKINDA",
              "https://rightsagenda.org/wp-content/uploads/2019/01/guide-moving-abroad-education-netherlands.jpg",
              34,
            ),
            tabContainerTemplate(
              context,
              size,
              "ÇOK YAKINDA",
              "https://rightsagenda.org/wp-content/uploads/2019/01/guide-moving-abroad-education-netherlands.jpg",
              32,
            ),
            tabContainerTemplate(
              context,
              size,
              "ÇOK YAKINDA",
              "https://rightsagenda.org/wp-content/uploads/2019/01/guide-moving-abroad-education-netherlands.jpg",
              54,
            ),
          ],
        );
      case 3:
        return Row(
          children: [
            tabContainerTemplate(
              context,
              size,
              "ÇOK YAKINDA",
              "https://us.123rf.com/450wm/vladwel/vladwel1805/vladwel180500030/101657415-writer-writing-on-computer-paper-sheet-vector-illustration-flat-cartoon-person-editor-write-electron.jpg?ver=6",
              54,
            ),
            tabContainerTemplate(
              context,
              size,
              "ÇOK YAKINDA",
              "https://us.123rf.com/450wm/vladwel/vladwel1805/vladwel180500030/101657415-writer-writing-on-computer-paper-sheet-vector-illustration-flat-cartoon-person-editor-write-electron.jpg?ver=6",
              23,
            ),
            tabContainerTemplate(
              context,
              size,
              "ÇOK YAKINDA",
              "https://us.123rf.com/450wm/vladwel/vladwel1805/vladwel180500030/101657415-writer-writing-on-computer-paper-sheet-vector-illustration-flat-cartoon-person-editor-write-electron.jpg?ver=6",
              34,
            ),
            tabContainerTemplate(
              context,
              size,
              "ÇOK YAKINDA",
              "https://us.123rf.com/450wm/vladwel/vladwel1805/vladwel180500030/101657415-writer-writing-on-computer-paper-sheet-vector-illustration-flat-cartoon-person-editor-write-electron.jpg?ver=6",
              54,
            ),
          ],
        );
      default:
        return null;
    }
  }

  Widget tabContainerTemplate(BuildContext context, Size size, String cardLabel,
      String imageUrl, int cardActiveUser) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRouteGenerator.APP_ROUTE_DETAIL);
      },
      child: Container(
        width: 300,
        height: size.height,
        margin: EdgeInsets.only(right: 20, top: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: size.width * 0.03,
              bottom: size.height * 0.03,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 15, sigmaX: 15),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    constraints: BoxConstraints(maxWidth: size.width * 0.6),
                    child: Text(
                      cardLabel,
                      style: GoogleFonts.balooBhai(
                        fontSize: 18,
                        height: 1,
                        color: ThemeColors.WHITE,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.01,
              right: size.width * 0.03,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaY: 2, sigmaX: 2),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    constraints: BoxConstraints(maxWidth: size.width * 0.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.person_outline_rounded,
                          size: 18,
                          color: ThemeColors.LIGHT_GRAY,
                        ),
                        Text(
                          cardActiveUser.toString() + " kişi",
                          style: GoogleFonts.balooBhai(
                            fontSize: 14,
                            height: 1,
                            color: ThemeColors.LIGHT_GRAY,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
