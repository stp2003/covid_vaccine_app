import 'package:covid_vaccine_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static String pinCode = '';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBAR(
          title: 'Covid Vaccine App',
        ),
      ),

      //** body ->
      body: Container(
        margin: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //?? text field for pin code ->
            TextField(
              onChanged: (data) {
                HomeScreen.pinCode = data;
              },
              style: const TextStyle(
                fontFamily: 'poppins_bold',
                letterSpacing: 1.2,
              ),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter your PinCode',
                hintStyle: const TextStyle(
                  fontFamily: 'poppins',
                  letterSpacing: 1.8,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),

            const SizedBox(height: 45.0),

            //?? button for submitting ->
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
              ),

              //?? onPressed function ->
              onPressed: () {
                //** going to vaccine screen ->
                Navigator.pushNamed(context, 'vaccine');
              },

              //** child ->
              child: const Text(
                'Search',
                style: TextStyle(
                  fontFamily: 'poppins_bold',
                  letterSpacing: 1.2,
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
