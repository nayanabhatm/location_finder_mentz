import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 6,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
