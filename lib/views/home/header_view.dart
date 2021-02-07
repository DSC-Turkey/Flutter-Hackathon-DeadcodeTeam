import 'package:flutter/material.dart';
import 'package:eogretmen/resource/themeColors.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({Key key, this.userFirstName = ""}) : super(key: key);

  final String userFirstName;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: userFirstName != "" ? 30 : 20,
        vertical: userFirstName != "" ? 40 : 10,
      ),
      decoration: BoxDecoration(
        color: ThemeColors.LIGHT_GRAY,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userFirstName != ""
                    ? "Merhaba\n" + userFirstName + "!"
                    : "Merhaba!",
                style: GoogleFonts.balooBhai(
                  fontSize: 32,
                  height: 1,
                  color: ThemeColors.BLACK,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Öğrenmenin yaşı yoktur,\n" +
                    "kaliteli eğitim alabilmen için,\n" +
                    "farklı türlerden içeriklerle artık\n" +
                    "senin E-Öğretmenin olacağız.",
                style: GoogleFonts.balooBhai(
                  fontSize: 12,
                  color: ThemeColors.GRAY,
                ),
              ),
            ],
          ),
          Container(
            width: size.width * 0.32,
            child: SvgPicture.asset(
              'assets/images/svg/kid_illustration.svg',
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
