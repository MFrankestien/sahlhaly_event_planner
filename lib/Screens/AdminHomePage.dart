
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahlhaly_event_planner/Component/expanded_section.dart';
import 'package:sahlhaly_event_planner/Component/style.dart';
import 'add_new_event.dart';
import 'package:sahlhaly_event_planner/org_new_event.dart';


class AdHomePage extends StatefulWidget {
  @override
  _AdHomePageState createState() => _AdHomePageState();
}

class _AdHomePageState extends State<AdHomePage> {
  bool _isExpanded = true;
  PageController pageController;
  int pageIndex = 0;
  onPageChanged(int pageIndex) {
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onItemSelected(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  void _toogleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          overflow: Overflow.visible,
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            buildMainHeader(),
            buildToggleButton(),


          ],
        ),
        buildExpandableChildren(),




      ],
    );
  }


  Widget buildExpandableChildren() {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: ExpandedSection(
        expand: _isExpanded,
        child: Container(
          padding: EdgeInsets.only(bottom: 20),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddNewevent()),
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            children: <Widget>[
                              RawMaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.zero,
                                        bottomLeft: Radius.zero,
                                        bottomRight:
                                        Radius.circular(50.0)),
                                  ),
                                  onPressed: () {
                                  },
                                  fillColor: Color(0xFFDE1E37),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                        right: 20,
                                        bottom: 20),
                                    child: Icon(
                                      FontAwesomeIcons.locationArrow,
                                      size: 40.0,
                                      color: Colors.white,
                                    ),
                                  )),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          "Create Your Events",
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .accentColor,
                                              fontSize: 23.0),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    GestureDetector(

                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => orgevent()),
                        );

                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 5,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            children: <Widget>[
                              RawMaterialButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10.0),
                                        topRight: Radius.zero,
                                        bottomLeft: Radius.zero,
                                        bottomRight:
                                        Radius.circular(50.0)),
                                  ),
                                  onPressed: () {},
                                  fillColor:
                                  Theme.of(context).accentColor,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10,
                                        left: 10,
                                        right: 20,
                                        bottom: 20),
                                    child: Icon(
                                      FontAwesomeIcons.building,
                                      size: 40.0,
                                      color: Colors.white,
                                    ),
                                  )),
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Organization Events",
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .accentColor,
                                                fontSize: 23.0),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(

                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => orgevent()),
                  );

                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Row(
                      children: <Widget>[
                        RawMaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.zero,
                                  bottomLeft: Radius.zero,
                                  bottomRight:
                                  Radius.circular(50.0)),
                            ),
                            onPressed: () {},
                            fillColor:
                            Theme.of(context).accentColor,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10,
                                  left: 10,
                                  right: 20,
                                  bottom: 20),
                              child: Icon(
                                FontAwesomeIcons.building,
                                size: 40.0,
                                color: Colors.white,
                              ),
                            )),
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "Organization Events",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .accentColor,
                                          fontSize: 23.0),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }


  Positioned buildToggleButton() {
    return Positioned(
      bottom: -30,
      child: InkResponse(
        onTap: _toogleExpand,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.indigo[900],
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white,
              width: 10,
            ),
          ),
          child: Center(
            child: Icon(
              _isExpanded ? Icons.arrow_drop_down : Icons.arrow_drop_up,
              size: 42,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Container buildMainHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(24, 66, 24, 24),
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/header_image.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Create Amazing \nevents and \nenjoy our services.',
            style: mainTitleStyle,
          ),

          SizedBox(height: 12),


        ],
      ),
    );
  }

  Container buildSearchBar() {
    return Container(
      height: 60,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: searchBarDecoration,
      child: Center(
        child: TextField(
          decoration: InputDecoration(
              suffixIcon: Icon(Icons.search, color: Colors.white, size: 18),
              border: InputBorder.none,
              hintText: 'Search for an event ... ',
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              )),
        ),
      ),
    );
  }

}
