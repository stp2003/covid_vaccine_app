import 'dart:convert';

import 'package:covid_vaccine_app/screens/home_screen.dart';
import 'package:covid_vaccine_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VaccineResultsScreen extends StatefulWidget {
  const VaccineResultsScreen({Key? key}) : super(key: key);

  @override
  State<VaccineResultsScreen> createState() => _VaccineResultsScreenState();
}

class _VaccineResultsScreenState extends State<VaccineResultsScreen> {
  var sessions = [];

  var listCount = 0;

  var pinCode = '';

  //?? over-ridding initState ->
  @override
  void initState() {
    pinCode = HomeScreen.pinCode;

    getData();
    super.initState();
  }

  //?? getting data from api ->
  getData() async {
    var url = Uri.parse(
      'https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/findByPin?pincode=$pinCode&date=28-02-2022',
    );
    var response = await http.get(url);

    var decode = jsonDecode(response.body);

    sessions = decode['sessions'];

    setState(() {
      listCount = sessions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBAR(
          title: 'Vaccine Results',
        ),
      ),

      //** body ->
      body: Container(
        child: ListView.builder(
          itemCount: listCount,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
              height: 200.0,
              child: Container(
                child: Card(
                  color: Colors.grey.shade100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 200.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              sessions[index]['vaccine'],
                              style: const TextStyle(
                                color: Colors.lightGreen,
                                fontFamily: 'poppins_bold',
                              ),
                            ),
                            Text(
                              sessions[index]['available_capacity'].toString(),
                              style: const TextStyle(
                                color: Colors.orange,
                                fontFamily: 'poppins_bold',
                              ),
                            ),
                            Text(
                              sessions[index]['name'],
                              style: const TextStyle(
                                color: Colors.black87,
                                fontFamily: 'poppins_bold',
                              ),
                            ),
                            Text(
                              sessions[index]['address'],
                              style: const TextStyle(
                                color: Colors.black87,
                                fontFamily: 'poppins_bold',
                              ),
                            ),
                            Text(
                              "${sessions[index]['district_name']}, ${sessions[index]['state_name']} ",
                              style: const TextStyle(
                                color: Colors.cyan,
                                fontFamily: 'poppins_bold',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              sessions[index]['fee_type'].toString(),
                              style: const TextStyle(
                                color: Colors.green,
                                fontFamily: 'poppins_bold',
                              ),
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Available",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.red,
                                  ),
                                ),
                                Text(
                                  sessions[index]['available_capacity']
                                      .toString(),
                                  style: const TextStyle(
                                    fontSize: 30.0,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Min age: ${sessions[index]['min_age_limit'].toString()}",
                              style: const TextStyle(
                                color: Colors.purple,
                                fontFamily: 'poppins_bold',
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
