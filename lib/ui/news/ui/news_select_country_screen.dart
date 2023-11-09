import 'package:flutter/material.dart';
import 'package:instant2/shared.dart';

class NewsSelectCountryScreen extends StatefulWidget {
  const NewsSelectCountryScreen({super.key});

  @override
  State<NewsSelectCountryScreen> createState() =>
      _NewsSelectCountryScreenState();
}

class _NewsSelectCountryScreenState extends State<NewsSelectCountryScreen> {
  final countries = [
    'us',
    'eg',
    'sa',
    'ae',
    'ch',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select country'),
      ),
      body: ListView.separated(
        itemCount: countries.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => saveSelectedCountry(countries[index]),
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Text(countries[index]),
                  const Spacer(),
                  const Icon(Icons.keyboard_arrow_right_rounded),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.grey,
            height: 1,
          );
        },
      ),
    );
  }

  saveSelectedCountry(String selectedCountry) {
    PreferenceUtils.setString(
      PrefKeys.newsCountry,
      selectedCountry,
    );

    Navigator.pop(context);
  }
}
