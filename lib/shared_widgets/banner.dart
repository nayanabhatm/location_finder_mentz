import 'package:flutter/material.dart';
import 'package:mentz_project/utils/styles.dart';

class LocationsFinderBanner extends StatelessWidget {
  const LocationsFinderBanner({
    Key? key,
    required this.title,
    this.childWidget,
  }) : super(key: key);

  final String title;
  final Widget? childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      decoration: const BoxDecoration(
        color: Color(Styles.primaryColor),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(Styles.radius30),
          bottomRight: Radius.circular(Styles.radius30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: Styles.fontSize20,
              color: Color(Styles.white),
            ),
          ),
          if (childWidget != null) childWidget!,
        ],
      ),
    );
  }
}
