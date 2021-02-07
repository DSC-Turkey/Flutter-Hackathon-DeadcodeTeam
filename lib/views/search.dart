import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(new MaterialApp(
      home: new Search(),
    ));

class Search extends StatefulWidget {
  @override
  _SearchListExampleState createState() => new _SearchListExampleState();
}

class _SearchListExampleState extends State<Search> {
  final globalKey = new GlobalKey<ScaffoldState>();
  final TextEditingController _controller = new TextEditingController();
  List<dynamic> _list;
  bool _isSearching;
  String _searchText = "";
  List searchresult = new List();

  _SearchListExampleState() {
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

  @override
  void initState() {
    super.initState();
    _isSearching = false;
    values();
  }

  void values() {
    _list = List();
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
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  )),
                              child: new ListTile(
                                leading: new Image.asset(
                                  './lib/img/2.png',
                                  width: 50,
                                  height: 50,
                                ),
                                title: new Text(
                                  listData.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: new Text(
                                  '100 kişi öğreniyor',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                  ),
                                ),
                                trailing: RaisedButton(
                                    child: Text(
                                      'Button',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    onPressed: () => 0,
                                    color: Colors.black,
                                    textColor: Colors.white,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    )),
                              ),
                            );
                          },
                        )
                      : new ListView.builder(
                          shrinkWrap: true,
                          itemCount: _list.length,
                          itemBuilder: (BuildContext context, int index) {
                            String listData = _list[index];
                            return Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                      style: BorderStyle.solid),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  )),
                              child: new ListTile(
                                leading: new Image.asset(
                                  './lib/img/2.png',
                                  width: 50,
                                  height: 50,
                                ),
                                title: new Text(
                                  listData.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle: new Text(
                                  '100 kişi öğreniyor',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                  ),
                                ),
                                trailing: RaisedButton(
                                    child: Text(
                                      'Button',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    onPressed: () => 0,
                                    color: Colors.black,
                                    textColor: Colors.white,
                                    shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(10.0),
                                    )),
                              ),
                            );
                          },
                        ))
            ],
          ),
        ));
  }

  Widget appBarTitle = new Text(
    "Search Example",
    style: GoogleFonts.poppins(
        fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),
  );
  Icon icon = new Icon(
    Icons.search,
    color: Colors.black,
  );

  Widget buildAppBar(BuildContext context) {
    return new AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        title: appBarTitle,
        backgroundColor: Color(0xffF5F5F7),
        actions: <Widget>[
          new IconButton(
            icon: icon,
            onPressed: () {
              setState(() {
                if (this.icon.icon == Icons.search) {
                  this.icon = new Icon(
                    Icons.close,
                    color: Colors.black,
                  );
                  this.appBarTitle = new TextField(
                    controller: _controller,
                    style: new TextStyle(
                      color: Colors.black,
                    ),
                    decoration: new InputDecoration(
                        prefixIcon: new Icon(Icons.search, color: Colors.black),
                        hintText: "Search...",
                        hintStyle: new TextStyle(color: Colors.black)),
                    onChanged: searchOperation,
                  );
                  _handleSearchStart();
                } else {
                  _handleSearchEnd();
                }
              });
            },
          ),
        ]);
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
        color: Colors.black,
      );
      this.appBarTitle = new Text(
        "Search Sample",
        style: GoogleFonts.poppins(
            fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),
      );
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
