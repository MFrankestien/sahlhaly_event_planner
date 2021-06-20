
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sahlhaly_event_planner/Component/style.dart';
import 'package:table_calendar/table_calendar.dart';
import 'models/event_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isExpanded = false;
  CalendarController _calendarController;
  int _sliderValue = 0;
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
    _calendarController = CalendarController();
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
            buildMainHeader(),
            buildToggleButton(),


          ],
        ),
        buildExpandableChildren(),
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
                                FontAwesomeIcons.userTie,
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
                                    "Event",
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .accentColor,
                                        fontSize: 23.0),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(
                                        left: 20),
                                    child: Text(
                                      "firmtext",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .accentColor,
                                          fontSize: 15.0),
                                    ),
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
                                FontAwesomeIcons.userAlt,
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
                                      "jobSeeker",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .accentColor,
                                          fontSize: 23.0),
                                    ),
                                    Text(
                                      "jobSeekertext",
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .accentColor,
                                          fontSize: 15.0),
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
        SizedBox(
          height: 30,
        ),


      ],
    );
  }

  Widget buildUpcomingEventsTitle() {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Upcoming Event',
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: () {
              //TODO implement navigator.push method,

              Navigator.of(context).push(MaterialPageRoute(
                builder: (_)=>Listings(),
              ));
            },
            child: Text(
              'View All',
              style: TextStyle(
                color: Colors.lightBlue[200],
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
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
              _buildHorizontalDatesCalender(),
              SizedBox(height: 10),
              _buildDistanceSelectorSlider(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalDatesCalender() {
    return TableCalendar(
      calendarController: _calendarController,
      initialCalendarFormat: CalendarFormat.week,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.monday,
      availableCalendarFormats: {CalendarFormat.week: ''},
      calendarStyle: CalendarStyle(
        selectedColor: searchBarColor,
      ),
    );
  }

  Widget _buildDistanceSelectorSlider() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(32),
      decoration: distanceBoxDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Events near me',
            style: TextStyle(
              fontSize: 22,
              color: searchBarColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Use the slider to select the events area',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: searchBarColor,
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: searchBarColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '$_sliderValue Kms',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                Slider(
                  min: 0.0,
                  max: 50.0,
                  label: '',
                  divisions: 50,
                  activeColor: Colors.white,
                  inactiveColor: Colors.grey,
                  value: _sliderValue.toDouble(),
                  onChanged: (double _newValue) {
                    setState(() {
                      _sliderValue = _newValue.round();
                    });
                  },
                ),
              ],
            ),
          )
        ],
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
      height: 350,
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
            'Find Amazing \nevents happening \nnear you.',
            style: mainTitleStyle,
          ),
          SizedBox(height: 12),
          Text(
            '32 Events in your area',
            style: mainSubtitleStyle,
          ),
          SizedBox(height: 12),
          buildSearchBar(),
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
  Widget eventsSlider(){

    return Expanded(
      child: ListView.builder(
        itemCount: events.length,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context,index){
          var event=events[index];

          return SingleEvent(
            eventDate: event.eventDate,
            eventType: event.eventType,
            eventImage: event.eventImage,
            eventName: event.eventName,
            eventOfferText: event.eventOfferText,
            eventVenue: event.eventVenue,
            guestName: event.guestName,
            guestDesignation: event.guestDesignation,
            guestPicture: event.guestPicture,
          );
        },
      ),
    );
  }
}
