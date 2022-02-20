import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentz_project/cubits/locations/locations_cubit.dart';
import 'package:mentz_project/data/respositories/locations_repository.dart';
import 'package:mentz_project/screens/location_search/location_search_screen.dart';
import 'package:mentz_project/utils/styles.dart';

void main() {
  runApp(LocationsFinderApp(locationsRepository: LocationsRepository()));
}

class LocationsFinderApp extends StatelessWidget {
  const LocationsFinderApp({
    Key? key,
    required this.locationsRepository,
  }) : super(key: key);

  final LocationsRepository locationsRepository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Location Finder!',
      theme: ThemeData(
        primarySwatch: MaterialColor(Styles.primaryColor, _swatchColors()),
        textTheme: const TextTheme(
          headline5: TextStyle(
            fontSize: 18.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Color(Styles.white),
          ),
          headline6: TextStyle(
            fontSize: 18.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            color: Color(Styles.black),
          ),
          bodyText1: TextStyle(
            fontSize: 16.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Color(Styles.black),
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            color: Color(Styles.black),
          ),
        ),
      ),
      home: RepositoryProvider.value(
        value: locationsRepository,
        child: BlocProvider<LocationsCubit>(
          create: (context) => LocationsCubit(locationsRepository),
          child: const LocationsSearchScreen(),
        ),
      ),
    );
  }

  Map<int, Color> _swatchColors() {
    return const {
      50: Color(0xffefe5fd),
      100: Color(0xffd4bff9),
      200: Color(0xffb794f6),
      300: Color(0xff9965f4),
      400: Color(0xff7e3ff2),
      500: Color(0xff6002ee),
      600: Color(0xff5300e8),
      700: Color(0xff3d00e0),
      800: Color(0xff1d00db),
      900: Color(0xff0000d6)
    };
  }
}
