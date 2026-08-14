import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../data/classes/activity_class.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  CoursePageState createState() => CoursePageState();
}

class CoursePageState extends State<CoursePage> {
  late Future<Activity>? _futureActivity;

  @override
  void initState() {
    super.initState();
    _fetchRandomActivity();
  }

  void _fetchRandomActivity() {
    setState(() {
      _futureActivity = fetchActivity();
    });
  }

  Future<Activity> fetchActivity() async {
    final response = await http.get(
      Uri.parse('https://bored-api.appbrewery.com/random'),
    );
    if (response.statusCode == 200) {
      return Activity.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load activity');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Activity Viewer')),
      body: FutureBuilder<Activity>(
        future: _futureActivity,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final activity = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(activity.activity, style: TextStyle(fontSize: 20)),
                  SizedBox(height: 8),
                  Text('Type: ${activity.type}'),
                  Text('Participants: ${activity.participants}'),
                  Text('Price: ${activity.price}'),
                  Text('Availability: ${activity.availability}'),
                  Text('Accessibility: ${activity.accessibility}'),
                  Text('Duration: ${activity.duration}'),
                  Text('Kid-Friendly: ${activity.kidFriendly ? "Yes" : "No"}'),
                  SizedBox(height: 16),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _fetchRandomActivity,
                    child: Text('Fetch Another Activity'),
                  ),
                ],
              ),
            );
          }
          return Center(child: Text('No data available.'));
        },
      ),
    );
  }
}
