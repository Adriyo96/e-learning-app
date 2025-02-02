import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GradesPage extends StatefulWidget {
  @override
  _GradesPageState createState() => _GradesPageState();
}

class _GradesPageState extends State<GradesPage> {
  List<dynamic> _grades = [];

  @override
  void initState() {
    super.initState();
    _fetchGrades();
  }

  Future<void> _fetchGrades() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';

    final response = await dio.get('http://localhost:8000/api/grades');

    setState(() {
      _grades = response.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Grades')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _grades.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Exam: ' + _grades[index]['exam']['judul']),
              subtitle: Text('Grade: ' + _grades[index]['nilai'].toString()),
            );
          },
        ),
      ),
    );
  }
}
