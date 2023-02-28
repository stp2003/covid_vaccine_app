import 'package:covid_vaccine_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class VaccineResultsScreen extends StatefulWidget {
  const VaccineResultsScreen({Key? key}) : super(key: key);

  @override
  State<VaccineResultsScreen> createState() => _VaccineResultsScreenState();
}

class _VaccineResultsScreenState extends State<VaccineResultsScreen> {
  //?? over-ridding initState ->
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBAR(
          title: 'Vaccine Results',
        ),
      ),

      //** body ->
    );
  }
}
