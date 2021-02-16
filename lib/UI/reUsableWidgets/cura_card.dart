import 'package:cura_network/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CuraCard extends StatelessWidget {
  final String name;
  final String categories;
  final String date;
  final Color color;

  const CuraCard({
    Key key,
    @required this.name,
    @required this.categories,
    @required this.date,
    @required this.color,
  })  : assert(name != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: const EdgeInsets.only(
          left: 8.0,
          top: 8.0,
          bottom: 8.0,
          right: 12.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Color(0xFFEFF3F9),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Column(
                    children: [
                      Text(
                        ' Jan',
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        date,
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Category: $categories ',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Complaints',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        '08:30AM - 09:30AM',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 20.0,
              ),
              child: Divider(
                height: 2.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'images/messenger.svg',
                  color: kPrimaryColor,
                  height: 20,
                  width: 20,
                ),
                Icon(
                  Icons.local_phone,
                  color: Colors.grey,
                ),
                Icon(
                  Icons.videocam,
                  color: Colors.grey,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
