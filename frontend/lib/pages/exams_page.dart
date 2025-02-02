import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExamsPage extends StatefulWidget {
  @override
  _ExamsPageState createState() => _ExamsPageState();
}

class _ExamsPageState extends State<ExamsPage> {
  List<dynamic> _exams = [];

  @override
  void initState() {
    super.initState();
    _fetchExams();
  }

  Future<void> _fetchExams() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';

    final response = await dio.get('http://localhost:8000/api/exams');

    setState(() {
      _exams = response.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exams')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _exams.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_exams[index]['judul']),
              onTap: () {
                // Implementasi navigasi ke halaman detail ujian
              },
            );
          },
        ),
      ),
    );
  }
}
