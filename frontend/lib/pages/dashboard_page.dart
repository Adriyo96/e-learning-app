import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<dynamic> _materials = [];
  List<dynamic> _exams = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';

    final materialsResponse = await dio.get('http://localhost:8000/api/materials');
    final examsResponse = await dio.get('http://localhost:8000/api/exams');

    setState(() {
      _materials = materialsResponse.data;
      _exams = examsResponse.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Materials', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: _materials.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_materials[index]['judul']),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text('Exams', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Expanded(
              child: ListView.builder(
                itemCount: _exams.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_exams[index]['judul']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
