// ignore_for_file: non_constant_identifier_names

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

// Assuming style.dart is in the same directory or a parent directory.  If not, adjust the path.
import '../style/style.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> popularSuggestions = [
    'Self-Improvement',
    'Pet Care',
    'Gardening',
    'Art & Design',
    'Photography',
    'Technology & Gadgets',
  ];

  List<String> socialSuggestions = [
    'Community Gatherings',
    'Social Events',
    'Friends Meetup',
    'Networking Events',
    'Group Activities',
    'Club Events',
    'Casual Hangouts',
  ];

  List<String> travelSuggestions = [
    'Outdoor Adventures',
    'Outdoor Fitness',
    'Travel',
    'Outdoors',
    'Hiking',
    'Adventure',
    'Weekend Adventure',
  ];

  List<String> sportsSuggestions = [
    'Strength Training',
    'Cardio Workouts',
    'Yoga & Meditation',
    'Functional Fitness',
    'HIIT Workouts',
    'CrossFit Training',
    'Running & Jogging',
  ];

  List<String> identitySuggestions = [
    'Cultural Heritage',
    'Multilingual Community',
    'Language Learning',
    'Dialects & Accents',
    'Sign Language',
    'Indigenous Languages',
  ];

  List<String> selectedSuggestions = [];

  bool isExpanded1 = false;
  bool isExpanded2 = false;
  bool isExpanded3 = false;
  bool isExpanded4 = false;
  bool isExpanded5 = false;

  void toggleSuggestion(String suggestion) {
    setState(() {
      if (selectedSuggestions.contains(suggestion)) {
        selectedSuggestions.remove(suggestion);
      } else if (selectedSuggestions.length < 3) {
        selectedSuggestions.add(suggestion);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Color.fromARGB(255, 234, 240, 240)),
          padding: EdgeInsets.all(10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Step 1 of 2', style: WidgetStyle.style_1()),
                Text(
                  'Get Started by picking a few interests',
                  style: WidgetStyle.style_2(),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'These help with future event and group recommendations.',
                  textAlign: TextAlign.center,
                  style: WidgetStyle.style_1(),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      hintText: 'Search by keyword',
                      hintStyle: WidgetStyle.style_1(),
                    ),
                  ),
                ),

                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            isExpanded1 == true
                                ? Border.all(
                                  color: const Color.fromARGB(
                                    255,
                                    22,
                                    117,
                                    121,
                                  ),
                                  width: 1.5,
                                )
                                : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            isExpanded1 = !isExpanded1;
                          });
                        },
                        textAlignVertical: TextAlignVertical.center,
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Image.asset(
                            "assets/popular.png",
                            scale: 20,
                            height: 10,
                            width: 10,
                          ),
                          suffixIcon: Image.asset(
                            isExpanded1 == true
                                ? "assets/up_chevron.png"
                                : "assets/down_chevron.png",
                            scale: 25,
                            height: 5,
                            width: 5,
                          ),
                          fillColor: Colors.white,
                          hintText: 'Popular Interests',
                          hintStyle: WidgetStyle.style_2(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    if (isExpanded1 == true)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 5.0,
                          runSpacing: 5.0,
                          children:
                              popularSuggestions.map((suggestion) {
                                final isSelected = selectedSuggestions.contains(
                                  suggestion,
                                );
                                return GestureDetector(
                                  onTap: () => toggleSuggestion(suggestion),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? Colors.black
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          suggestion,
                                          style: TextStyle(
                                            color:
                                                isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.plus,
                                          size: 10,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                  ],
                ),

                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border:
                            isExpanded2 == true
                                ? Border.all(
                                  color: const Color.fromARGB(
                                    255,
                                    22,
                                    117,
                                    121,
                                  ),
                                  width: 1.5,
                                )
                                : null,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            isExpanded2 = !isExpanded2;
                          });
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Image.asset(
                            "assets/social.png",
                            scale: 20,
                            height: 10,
                            width: 10,
                          ),
                          suffixIcon: Image.asset(
                            isExpanded2 == true
                                ? "assets/up_chevron.png"
                                : "assets/down_chevron.png",
                            scale: 25,
                            height: 5,
                            width: 5,
                          ),
                          fillColor: Colors.white,
                          hintText: 'Social Activies',
                          hintStyle: WidgetStyle.style_2(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    if (isExpanded2 == true)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 5.0,
                          runSpacing: 5.0,
                          children:
                              socialSuggestions.map((suggestion) {
                                final isSelected = selectedSuggestions.contains(
                                  suggestion,
                                );
                                return GestureDetector(
                                  onTap: () => toggleSuggestion(suggestion),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? Colors.black
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          suggestion,
                                          style: TextStyle(
                                            color:
                                                isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.plus,
                                          size: 10,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                  ],
                ),

                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            isExpanded3 == true
                                ? Border.all(
                                  color: const Color.fromARGB(
                                    255,
                                    22,
                                    117,
                                    121,
                                  ),
                                  width: 1.5,
                                )
                                : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            isExpanded3 = !isExpanded3;
                          });
                        },
                        textAlignVertical: TextAlignVertical.center,
                        readOnly: true,
                        decoration: InputDecoration(
                          isDense: true,
                          filled: true,
                          prefixIcon: Image.asset(
                            "assets/travel.png",
                            scale: 20,
                            height: 10,
                            width: 10,
                          ),
                          suffixIcon: Image.asset(
                            isExpanded3 == true
                                ? "assets/up_chevron.png"
                                : "assets/down_chevron.png",
                            scale: 25,
                            height: 5,
                            width: 5,
                          ),
                          fillColor: Colors.white,
                          hintText: 'Travel & Outdoor',
                          hintStyle: WidgetStyle.style_2(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    if (isExpanded3 == true)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 5.0,
                          runSpacing: 5.0,
                          children:
                              travelSuggestions.map((suggestion) {
                                final isSelected = selectedSuggestions.contains(
                                  suggestion,
                                );
                                return GestureDetector(
                                  onTap: () => toggleSuggestion(suggestion),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? Colors.black
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          suggestion,
                                          style: TextStyle(
                                            color:
                                                isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.plus,
                                          size: 10,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                  ],
                ),

                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            isExpanded4 == true
                                ? Border.all(
                                  color: const Color.fromARGB(
                                    255,
                                    22,
                                    117,
                                    121,
                                  ),
                                  width: 1.5,
                                )
                                : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            isExpanded4 = !isExpanded4;
                          });
                        },

                        textAlignVertical: TextAlignVertical.center,
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Image.asset(
                            "assets/dumbbell.png",
                            scale: 20,
                            height: 10,
                            width: 10,
                          ),
                          suffixIcon: Image.asset(
                            isExpanded4 == true
                                ? "assets/up_chevron.png"
                                : "assets/down_chevron.png",
                            scale: 25,
                            height: 5,
                            width: 5,
                          ),
                          fillColor: Colors.white,
                          hintText: 'Sports & Fittness',
                          hintStyle: WidgetStyle.style_2(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    if (isExpanded4 == true)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 5.0,
                          runSpacing: 5.0,
                          children:
                              sportsSuggestions.map((suggestion) {
                                final isSelected = selectedSuggestions.contains(
                                  suggestion,
                                );
                                return GestureDetector(
                                  onTap: () => toggleSuggestion(suggestion),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? Colors.black
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          suggestion,
                                          style: TextStyle(
                                            color:
                                                isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.plus,
                                          size: 10,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                  ],
                ),

                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border:
                            isExpanded5 == true
                                ? Border.all(
                                  color: const Color.fromARGB(
                                    255,
                                    22,
                                    117,
                                    121,
                                  ),
                                  width: 1.5,
                                )
                                : null,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        onTap: () {
                          setState(() {
                            isExpanded5 = !isExpanded5;
                          });
                        },
                        textAlignVertical: TextAlignVertical.center,
                        readOnly: true,
                        decoration: InputDecoration(
                          filled: true,
                          prefixIcon: Image.asset(
                            "assets/belgium.png",
                            scale: 20,
                            height: 10,
                            width: 10,
                          ),
                          suffixIcon: Image.asset(
                            isExpanded5 == true
                                ? "assets/up_chevron.png"
                                : "assets/down_chevron.png",
                            scale: 25,
                            height: 5,
                            width: 5,
                          ),
                          fillColor: Colors.white,
                          hintText: 'Identity & Language',
                          hintStyle: WidgetStyle.style_2(),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    if (isExpanded5 == true)
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 5.0,
                          runSpacing: 5.0,
                          children:
                              identitySuggestions.map((suggestion) {
                                final isSelected = selectedSuggestions.contains(
                                  suggestion,
                                );
                                return GestureDetector(
                                  onTap: () => toggleSuggestion(suggestion),
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? Colors.black
                                              : Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          suggestion,
                                          style: TextStyle(
                                            color:
                                                isSelected
                                                    ? Colors.white
                                                    : Colors.black,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        FaIcon(
                                          FontAwesomeIcons.plus,
                                          size: 10,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                        ),
                      ),
                  ],
                ),

                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    color:
                        selectedSuggestions.length != 3
                            ? const Color.fromARGB(255, 212, 212, 212)
                            : Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        selectedSuggestions.length != 3
                            ? Text(
                              "${selectedSuggestions.length}/3 selected",
                              style: WidgetStyle.style_1(),
                            )
                            : Text(
                              "Next",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
