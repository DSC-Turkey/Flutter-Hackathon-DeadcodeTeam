import 'package:eogretmen/resource/themeColors.dart';
import 'package:flutter/material.dart';
import 'package:eogretmen/app/routes.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final globalKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();
  List<dynamic> _list;
  bool _isSearching;
  // ignore: unused_field
  String _searchText = "";
  List searchresult = [];
  int isAppBarSearchOpened;

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    isAppBarSearchOpened = isAppBarSearchOpened ?? 2;
    values();

    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _controller.text;
        });
      }
    });
  }

  void values() {
    _list = [];
    _list.add("Indian rupee");
    _list.add("United States dollar");
    _list.add("Australian dollar");
    _list.add("Euro");
    _list.add("British pound");
    _list.add("Yemeni rial");
    _list.add("Japanese yen");
    _list.add("Hong Kong dollar");
    _list.add("Yemeni rial");
    _list.add("Japanese yen");
    _list.add("Hong Kong dollar");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: globalKey,
      appBar: buildAppBar(context),
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Flexible(
              child: searchresult.length != 0 || _controller.text.isNotEmpty
                  ? new ListView.builder(
                      shrinkWrap: true,
                      itemCount: searchresult.length,
                      itemBuilder: (BuildContext context, int index) {
                        String listData = searchresult[index];
                        return createSearchBoxes(context, listData);
                      },
                    )
                  : new ListView.builder(
                      shrinkWrap: true,
                      itemCount: _list.length,
                      itemBuilder: (BuildContext context, int index) {
                        String listData = _list[index];
                        return createSearchBoxes(context, listData);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createSearchBoxes(BuildContext context, String boxTitle) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeColors.WHITE,
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: new ListTile(
        leading: new Image.asset(
          './lib/img/2.png',
          width: 50,
          height: 50,
        ),
        title: new Text(
          boxTitle,
          style: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: new Text(
          '100 kişi öğreniyor',
          style: GoogleFonts.poppins(
            fontSize: 14,
          ),
        ),
        trailing: RaisedButton(
          child: Text(
            'Başla',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          onPressed: () {
            // Navigate to detail page
          },
          color: ThemeColors.BLACK,
          textColor: ThemeColors.WHITE,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }

  Widget createAppBarTitle(BuildContext context, int isTextBar) {
    if (isTextBar == 1) {
      return new TextField(
        controller: _controller,
        style: new TextStyle(
          color: ThemeColors.BLACK,
        ),
        decoration: new InputDecoration(
          prefixIcon: new Icon(Icons.search, color: ThemeColors.BLACK),
          hintText: "Arama Yap...",
          border: InputBorder.none,
          hintStyle: new TextStyle(color: ThemeColors.BLACK),
        ),
        onChanged: searchOperation,
      );
    } else {
      return new Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new IconButton(
              icon: Icon(
                Icons.arrow_back_ios_outlined,
                color: ThemeColors.BLACK,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, AppRouteGenerator.APP_ROUTE_HOME);
              },
            ),
            Text(
              "İçerik Arama",
              style: GoogleFonts.poppins(
                fontSize: 22,
                color: ThemeColors.BLACK,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 15),
          ],
        ),
      );
    }
  }

  Icon icon = new Icon(
    Icons.search,
    color: ThemeColors.BLACK,
  );

  Widget buildAppBar(BuildContext context) {
    return new AppBar(
      toolbarHeight: 80,
      centerTitle: true,
      title: createAppBarTitle(context, isAppBarSearchOpened),
      backgroundColor: ThemeColors.LIGHT_GRAY,
      actions: <Widget>[
        new IconButton(
          icon: icon,
          onPressed: () {
            setState(() {
              if (this.icon.icon == Icons.search) {
                this.icon = new Icon(
                  Icons.close,
                  color: ThemeColors.BLACK,
                );
                isAppBarSearchOpened = 1;
                _handleSearchStart();
              } else {
                _handleSearchEnd();
              }
            });
          },
        ),
        SizedBox(width: 15),
      ],
    );
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.icon = new Icon(
        Icons.search,
        color: ThemeColors.BLACK,
      );
      isAppBarSearchOpened = 2;
      _isSearching = false;
      _controller.clear();
    });
  }

  void searchOperation(String searchText) {
    searchresult.clear();
    if (_isSearching != null) {
      for (int i = 0; i < _list.length; i++) {
        String data = _list[i];
        if (data.toLowerCase().contains(searchText.toLowerCase())) {
          searchresult.add(data);
        }
      }
    }
  }
}
