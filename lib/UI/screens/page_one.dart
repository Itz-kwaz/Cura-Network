import 'package:cura_network/UI/reUsableWidgets/cura_card.dart';
import 'package:cura_network/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageOne extends StatefulWidget {
  PageOne({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  String dropdownValue = 'All';

  int _currentIndex = 1;

  int tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            color: kPrimaryColor,
            height: 2.0,
          ),
          BottomNavigationBar(
            unselectedLabelStyle: TextStyle(color: kPrimaryColor),
            selectedItemColor: kPrimaryColor,
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'images/home.svg',
                    color:
                        _currentIndex == 0 ? kPrimaryColor : Color(0xFFBDE8FC),
                    width: 25.0,
                    height: 25.0,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'images/doctor.svg',
                    // color: _currentIndex == 1 ? kPrimaryColor : Color(0xFFBDE8FC),
                    width: 25.0,
                    height: 25.0,
                  ),
                  label: 'Appointments'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'images/wallet.svg',
                    color:
                        _currentIndex == 2 ? kPrimaryColor : Color(0xFFBDE8FC),
                    width: 25.0,
                    height: 25.0,
                  ),
                  label: 'Appointments'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'images/user.svg',
                    // color: _currentIndex == 3 ? kPrimaryColor : Color(0xFFBDE8FC),
                    width: 25.0,
                    height: 25.0,
                  ),
                  label: 'Profile'),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: kToolbarHeight,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: kPrimaryColor, width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Appointments',
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              color: kPrimaryColor,
                              fontSize: 26.0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.calendar_today_rounded,
                      color: kPrimaryColor,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF1F6FA),
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(32.0)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 22.0),
                        child: Text(
                          'Appointments',
                          style: Theme.of(context).textTheme.headline6.copyWith(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F6FA),
                        borderRadius: BorderRadius.circular(32.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 22.0),
                        child: Center(
                          child: Text(
                            'Availability',
                            style:
                                Theme.of(context).textTheme.subtitle1.copyWith(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          tabIndex = 0;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          'Upcoming Appointments',
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color:
                                    tabIndex == 0 ? kPrimaryColor : Colors.grey,
                                fontWeight: tabIndex == 0
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          tabIndex = 1;
                        });
                      },
                      child: Text(
                        'Past Appointments',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color:
                                  tabIndex == 1 ? kPrimaryColor : Colors.grey,
                              fontWeight: tabIndex == 1
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: IndexedStack(
                index: tabIndex,
                children: [
                  PageB(),
                  PageA(),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sort by:',
              style: Theme.of(context).textTheme.subtitle2.copyWith(
                    color: Colors.grey,
                  ),
            ),
            SizedBox(
              width: 8.0,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  6.0,
                ),
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1.5,
                ),
              ),
              child: Flexible(
                child: Row(
                  children: [
                    Text(
                      'All',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Color(0xFFD6D6D7),
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down,
                      color: Color(0xFFD6D6D7),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
        Expanded(
          child: ListView(
            children: [
              CuraCard(
                name: 'Chukwudi Duru',
                categories: 'Eye, Teeth',
                date: '15',
                color: Color(0xFFA7B8D5),
              ),
              SizedBox(
                height: 16.0,
              ),
              CuraCard(
                name: 'Deji Oladepo',
                categories: 'Nose',
                date: '13',
                color: Color(0xFFA7B8D5),
              ),
              SizedBox(
                height: 16.0,
              ),
              CuraCard(
                name: 'Samuel Olakira',
                categories: 'Nose',
                date: '11',
                color: Color(0xFFA7B8D5),
              ),
              SizedBox(
                height: 16.0,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.0,
        ),
        Text(
          'Today, Jan 18th',
          style: Theme.of(context).textTheme.subtitle2.copyWith(
                color: Colors.grey,
              ),
        ),
        SizedBox(
          height: 16.0,
        ),
        Expanded(
          child: ListView(
            children: [
              CuraCard(
                name: 'Chukwudi Duru',
                categories: 'Eye, Others',
                date: '15',
                color: Color(0xFFFFA082),
              ),
              SizedBox(
                height: 16.0,
              ),
              CuraCard(
                name: 'Deji Oladepo',
                categories: 'Nose',
                date: '13',
                color: Color(0xFFFFA082),
              ),
              SizedBox(
                height: 16.0,
              ),
              CuraCard(
                name: 'Samuel Olakira',
                categories: 'Nose',
                date: '11',
                color: Color(0xFFFFA082),
              ),
              SizedBox(
                height: 16.0,
              ),
            ],
          ),
        )
      ],
    );
  }
}
