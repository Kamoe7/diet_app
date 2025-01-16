/*import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SayFoodPage extends StatefulWidget {
  const SayFoodPage({super.key});

  @override
  _SayFoodPageState createState() => _SayFoodPageState();
}

class _SayFoodPageState extends State<SayFoodPage> {
  final databaseReference = FirebaseDatabase.instance.ref();
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';
  String _foodName = '';
  String _foodDetail = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void _saveToDatabase() {
    databaseReference.push().set({
      'foodName': _foodName,
      'foodDetail': _foodDetail,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Food by Voice'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                _foodName = value;
              },
              decoration: InputDecoration(labelText: 'Food Name'),
            ),
            TextField(
              onChanged: (value) {
                _foodDetail = value;
              },
              decoration: InputDecoration(labelText: 'Food Detail'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _listen,
              child: Text(_isListening ? 'Stop Listening' : 'Start Listening'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveToDatabase,
              child: Text('Save to Database'),
            ),
            SizedBox(height: 20),
            Text(
              'Recognized Words: $_text',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
*/