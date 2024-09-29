import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas2/login_page.dart';
import 'tambah_tugas.dart';

class Task {
  String judul;
  String deskripsi;
  DateTime deadline;

  Task({required this.judul, required this.deskripsi, required this.deadline});
}

class Dashboard extends StatefulWidget {
  final String username;
  const Dashboard({super.key, required this.username});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Task> tugas = [];

  void tambahTugas(Task task) {
    setState(() {
      tugas.add(task);
    });
  }

  void hapusTugas(int index) {
    setState(() {
      tugas.removeAt(index);
    });
  }

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.window_sharp),
            ),
            Text(
              'Dashboard',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
        actions: <Widget>[
          IconButton(
            onPressed: _logout,
            icon: Icon(Icons.logout_sharp),
          ),
        ],
      ),
      body: Container(
        color: const Color.fromARGB(255, 240, 255, 255),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome, ${widget.username}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Daftar Tugas :',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: tugas.isEmpty
                  ? Center(
                      child: Text(
                        'Belum ada tugas',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: tugas.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          elevation: 4,
                          child: ListTile(
                            title: Text(
                              tugas[index].judul,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(tugas[index].deskripsi),
                                Text(
                                  'Deadline: ${DateFormat('yyyy-MM-dd').format(tugas[index].deadline)}',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () => hapusTugas(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () async {
                  final newTask = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TambahTugas(),
                    ),
                  );
                  if (newTask != null) {
                    tambahTugas(newTask);
                  }
                },
                child: Text('Tambah Tugas'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
