import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentz_project/data/models/location.dart';

class LocationTile extends StatelessWidget {
  const LocationTile({
    Key? key,
    required this.location,
  }) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Card(
      elevation: 6,
      child: ListTile(
        isThreeLine: true,
        title: Text(
          location.name,
          style: themeData.textTheme.bodyText1,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location.type),
            Text(location.placeName),
          ],
        ),
        leading: FaIcon(
          _getIcon(location.type),
          color: themeData.primaryColor,
        ),
      ),
    );
  }

  IconData _getIcon(String type) {
    switch (type) {
      case 'stop':
        return FontAwesomeIcons.bus;
      case 'street':
        return FontAwesomeIcons.road;
      case 'suburb':
        return FontAwesomeIcons.city;
      default:
        return FontAwesomeIcons.mapMarkerAlt;
    }
  }
}
