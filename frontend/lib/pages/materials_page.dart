import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MaterialsPage extends StatefulWidget {
  @override
  _MaterialsPageState createState() => _MaterialsPageState();
}

class _MaterialsPageState extends State<MaterialsPage> {
  List<dynamic> _materials = [];

  @override
  void initState() {
    super.initState();
    _fetchMaterials();
  }

  Future<void> _fetchMaterials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';

    final dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $token';

    final response = await dio.get('http://localhost:8000/api/materials');

    setState(() {
      _materials = response.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Materials')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _materials.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_materials[index]['judul']),
              trailing: IconButton(
                icon: Icon(Icons.download),
                onPressed: () {
                  // Implementasi download file materi
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
