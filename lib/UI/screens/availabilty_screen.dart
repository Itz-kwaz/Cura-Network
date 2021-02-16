import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class AvailabilityScreen extends StatelessWidget {
  final morningTimeObjList = [
    TimeObject(time: '8:00AM', enabled: true),
    TimeObject(time: '8:30AM', enabled: false),
    TimeObject(time: '9:00AM', enabled: true),
    TimeObject(time: '9:30AM', enabled: false),
    TimeObject(time: '10:00AM', enabled: true),
    TimeObject(time: '10:30AM', enabled: true),
    TimeObject(time: '11:00AM', enabled: false),
    TimeObject(time: '11:30AM', enabled: false),
    TimeObject(time: '12:00PM', enabled: true),
  ];

  final afternoonTimeObjList = [
    TimeObject(time: '12:00PM', enabled: true),
    TimeObject(time: '12:30PM', enabled: false),
    TimeObject(time: '1:00PM', enabled: true),
    TimeObject(time: '1:30PM', enabled: true),
    TimeObject(time: '2:00PM', enabled: true),
    TimeObject(time: '2:30PM', enabled: true),
    TimeObject(time: '3:00PM', enabled: false),
    TimeObject(time: '3:30PM', enabled: false),
    TimeObject(time: '4:00PM', enabled: true),
  ];

  final eveningObjList = [
    TimeObject(time: '4:00PM', enabled: true),
    TimeObject(time: '4:30PM', enabled: false),
    TimeObject(time: '5:00PM', enabled: true),
    TimeObject(time: '5:30PM', enabled: false),
    TimeObject(time: '6:00PM', enabled: true),
    TimeObject(time: '6:30PM', enabled: true),
    TimeObject(time: '7:00PM', enabled: false),
    TimeObject(time: '7:30PM', enabled: false),
    TimeObject(time: '8:00PM', enabled: true),
  ];

  final nightObjList = [
    TimeObject(time: '8:00PM', enabled: true),
    TimeObject(time: '8:30PM', enabled: false),
    TimeObject(time: '9:00PM', enabled: true),
    TimeObject(time: '9:30PM', enabled: false),
    TimeObject(time: '10:00PM', enabled: true),
    TimeObject(time: '10:30PM', enabled: true),
    TimeObject(time: '11:00PM', enabled: false),
    TimeObject(time: '11:30PM', enabled: false),
    TimeObject(time: '12:00AM', enabled: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
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
                    color: Color(0xFFF1F6FA),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 22.0),
                    child: Center(
                      child: Text(
                        'Appointments',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(32.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 22.0),
                    child: Text(
                      'Availability',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            color: Colors.white,
                            fontSize: 16,
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
              Text(
                'Mon 13',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
              Text(
                'Tue 14',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Color(0xFFE3D1DE),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Text(
                  'Wed 15',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Text(
                'Thurs 16',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
                ),
              ),
              Text(
                'Fri 17',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 15,
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
                _AvailabilityCard(
                  timeList: morningTimeObjList,
                  timeRange: '8:00 AM - 12:00PM',
                  title: 'Morning',
                ),
                SizedBox(
                  height: 16.0,
                ),
                _AvailabilityCard(
                  timeList: afternoonTimeObjList,
                  timeRange: '12:00 PM - 4:00PM',
                  title: 'Afternoon',
                ),
                SizedBox(
                  height: 16.0,
                ),
                _AvailabilityCard(
                  timeList: eveningObjList,
                  timeRange: '4:00 PM - 8:00PM',
                  title: 'Evening',
                ),
                SizedBox(
                  height: 16.0,
                ),
                _AvailabilityCard(
                  timeList: nightObjList,
                  timeRange: '8:00 PM - 12:00AM',
                  title: 'Night',
                ),
                SizedBox(
                  height: 16.0,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class _AvailabilityCard extends StatelessWidget {
  final String title;
  final String timeRange;

  const _AvailabilityCard({
    Key key,
    @required this.timeList,
    @required this.title,
    @required this.timeRange,
  })  : assert(title != null),
        assert(timeRange != null),
        super(key: key);

  final List<TimeObject> timeList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Color(0xFFE0E0E0),
          width: 1.0,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            timeRange,
            style: TextStyle(fontSize: 12.0, color: Colors.grey),
          ),
          SizedBox(
            height: 16.0,
          ),
          GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: timeList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 1,
                mainAxisSpacing: 4,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 4),
              ),
              itemBuilder: (context, index) {
                final timeObj = timeList[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: timeObj.enabled
                        ? Border.all(
                            color: kPrimaryColor,
                            width: 1.5,
                          )
                        : Border.all(
                            color: Color(0xFFE0E0E0),
                            width: 1.0,
                          ),
                  ),
                  child: Center(
                    child: Text(
                      timeObj.time,
                      style: timeObj.enabled
                          ? TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold)
                          : TextStyle(
                              color: Color(0xFFE0E0E0),
                              fontSize: 14,
                            ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}

class TimeObject {
  String time;
  bool enabled;

  TimeObject({this.time, this.enabled});
}
