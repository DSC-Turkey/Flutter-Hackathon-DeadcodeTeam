import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:eogretmen/resource/themeColors.dart';
import 'package:eogretmen/widgets/custom_rectangle_tab_indicator.dart';
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

    tappedIndex = tappedIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    currentTabContent = renderTabContent(context);

    return Container(
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
    );
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
                child: Text('Kategoriler'),
              ),
            ),
            Tab(
              child: Container(
                child: Text('Önerilen'),
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
    final Size size = MediaQuery.of(context).size;

    switch (tappedIndex) {
      case 0:
        return Row(
          children: [
            tabContainerTemplate(context, size, "Kategoriler card 1",
                "https://i.ytimg.com/vi/_UR-l3QI2nE/maxresdefault.jpg", 12),
            tabContainerTemplate(context, size, "Kategoriler card 2",
                "https://i.ytimg.com/vi/_UR-l3QI2nE/maxresdefault.jpg", 12),
            tabContainerTemplate(context, size, "Kategoriler card 3",
                "https://i.ytimg.com/vi/_UR-l3QI2nE/maxresdefault.jpg", 12),
            tabContainerTemplate(context, size, "Kategoriler card 4",
                "https://i.ytimg.com/vi/_UR-l3QI2nE/maxresdefault.jpg", 12),
          ],
        );
      case 1:
        return Row(
          children: [
            tabContainerTemplate(context, size, "Önerilen card 1",
                "https://i.ytimg.com/vi/_UR-l3QI2nE/maxresdefault.jpg", 54),
            tabContainerTemplate(context, size, "Önerilen card 2",
                "https://i.ytimg.com/vi/_UR-l3QI2nE/maxresdefault.jpg", 43),
            tabContainerTemplate(context, size, "Önerilen card 3",
                "https://i.ytimg.com/vi/_UR-l3QI2nE/maxresdefault.jpg", 32),
            tabContainerTemplate(context, size, "Önerilen card 4",
                "https://i.ytimg.com/vi/_UR-l3QI2nE/maxresdefault.jpg", 12),
          ],
        );
      case 2:
        return Row(
          children: [
            tabContainerTemplate(context, size, "Her Yaşa Göre card 1",
                "https://i.ytimg.com/vi/_UR-l3QI2nE/maxresdefault.jpg", 23),
            tabContainerTemplate(context, size, "Her Yaşa Göre card 2",
                "https://i.ytimg.com/vi/_UR-l3QI2nE/maxresdefault.jpg", 34),
            tabContainerTemplate(context, size, "Her Yaşa Göre card 3",
                "https://i.ytimg.com/vi/_UR-l3QI2nE/maxresdefault.jpg", 34),
            tabContainerTemplate(context, size, "Her Yaşa Göre card 4",
                "https://i.ytimg.com/vi/_UR-l3QI2nE/maxresdefault.jpg", 54),
          ],
        );
      case 3:
        return Row(
          children: [
            tabContainerTemplate(context, size, "Okuryazarlık Gelişimi card 1",
                "https://i.ytimg.com/vi/_UR-l3QI2nE/maxresdefault.jpg", 54),
            tabContainerTemplate(context, size, "Okuryazarlık Gelişimi card 2",
                "https://i.ytimg.com/vi/_UR-l3QI2nE/maxresdefault.jpg", 23),
            tabContainerTemplate(context, size, "Okuryazarlık Gelişimi card 3",
                "https://i.ytimg.com/vi/_UR-l3QI2nE/maxresdefault.jpg", 34),
            tabContainerTemplate(context, size, "Okuryazarlık Gelişimi card 4",
                "https://i.ytimg.com/vi/_UR-l3QI2nE/maxresdefault.jpg", 54),
          ],
        );
      default:
        return null;
    }
  }

  Widget tabContainerTemplate(BuildContext context, Size size, String cardLabel,
      String imageUrl, int cardFavorites) {
    return Container(
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
        ],
      ),
    );
  }
}
