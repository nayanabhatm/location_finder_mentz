import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentz_project/cubits/locations/locations_cubit.dart';
import 'package:mentz_project/screens/location_search/widgets/location_tile.dart';
import 'package:mentz_project/shared_widgets/banner.dart';
import 'package:mentz_project/shared_widgets/failure_widget.dart';
import 'package:mentz_project/shared_widgets/loading_indicator.dart';
import 'package:mentz_project/utils/constants.dart';
import 'package:mentz_project/utils/styles.dart';

class LocationsSearchScreen extends StatefulWidget {
  const LocationsSearchScreen({Key? key}) : super(key: key);

  @override
  State<LocationsSearchScreen> createState() => _LocationsSearchScreenState();
}

class _LocationsSearchScreenState extends State<LocationsSearchScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: DecoratedBox(
          decoration: BoxDecoration(
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(Constants.bkgImage),
              opacity: 0.8,
            ),
            color: themeData.primaryColorLight,
          ),
          child: Column(
            children: [
              LocationsFinderBanner(
                title: Constants.stopFinderTitle,
                childWidget: Padding(
                  padding: const EdgeInsets.all(Styles.padding20),
                  child: TextFormField(
                    controller: _textEditingController,
                    autofocus: false,
                    autocorrect: false,
                    style: themeData.textTheme.headline5,
                    cursorColor: themeData.primaryColorLight,
                    autovalidateMode: AutovalidateMode.disabled,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        FontAwesomeIcons.search,
                        color: themeData.primaryColorLight.withOpacity(0.5),
                      ),
                      hintText: Constants.hintText,
                      hintStyle: themeData.textTheme.bodyText1?.copyWith(
                        color: themeData.primaryColorLight,
                      ),
                      suffixIcon: IconButton(
                        icon: const FaIcon(FontAwesomeIcons.times),
                        color: const Color(Styles.white),
                        onPressed: () {
                          _textEditingController.clear();
                          BlocProvider.of<LocationsCubit>(context)
                              .resetLocations();
                        },
                      ),
                      border: _getBorder(context),
                      enabledBorder: _getBorder(context),
                      focusedBorder: _getBorder(context),
                      focusColor: themeData.primaryColorLight,
                    ),
                    onChanged: (String newLocation) async {
                      if (newLocation.length > 2) {
                        BlocProvider.of<LocationsCubit>(context)
                            .getLocations(newLocation);
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(Styles.padding10),
                  child: BlocConsumer<LocationsCubit, LocationsState>(
                    listener: (BuildContext context, LocationsState state) {
                      if (state is LocationsNetworkError) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: const Duration(seconds: 4),
                            content: Text(
                              state.message,
                              style: themeData.textTheme.headline5,
                            ),
                          ),
                        );
                      }
                    },
                    builder: (BuildContext context, LocationsState state) {
                      if (state is LocationsError) {
                        return FailureWidget(message: state.message);
                      } else if (state is LocationsSuccess) {
                        return ListView.builder(
                          itemCount: state.locations.length,
                          itemBuilder: (BuildContext context, int index) {
                            return LocationTile(
                              location: state.locations[index],
                            );
                          },
                        );
                      } else if (state is LocationsLoading) {
                        return const LoadingIndicator();
                      } else if (state is LocationsEmpty) {
                        return Card(
                          elevation: 6,
                          child: Center(
                            child: Text(
                              Constants.emptyLocations,
                              textAlign: TextAlign.center,
                              style: themeData.textTheme.headline6,
                            ),
                          ),
                        );
                      }
                      return Text(
                        Constants.defaultText,
                        style: themeData.textTheme.headline6,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _getBorder(BuildContext context) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: Theme.of(context).primaryColorLight,
        style: BorderStyle.solid,
      ),
    );
  }
}
