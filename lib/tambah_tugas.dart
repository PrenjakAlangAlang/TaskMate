import 'package:flutter/material.dart';
import 'package:tugas2/dashboard.dart';

class TambahTugas extends StatefulWidget {
  const TambahTugas({super.key});

  @override
  State<TambahTugas> createState() => _TambahTugasState();
}

class _TambahTugasState extends State<TambahTugas> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate)
      setState(() {
        _selectedDate = pickedDate;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Tugas',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Tambahkan Tugas Baru',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _judulController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12.0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: 'Masukkan Judul Tugas'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _deskripsiController,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12.0),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelText: 'Masukkan Deskripsi Tugas'),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(_selectedDate == null
                    ? 'No date chosen!'
                    : 'Deadline: ${_selectedDate!.toLocal()}'),
                Spacer(),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Masukkan Deadline',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
                if (_judulController.text.isNotEmpty &&
                    _deskripsiController.text.isNotEmpty &&
                    _selectedDate != null) {
                  Navigator.pop(
                    context,
                    Task(
                      judul: _judulController.text,
                      deskripsi: _deskripsiController.text,
                      deadline: _selectedDate!,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
