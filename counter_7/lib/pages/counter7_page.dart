import 'package:counter_7/widgets/drawer.dart';
import 'package:flutter/material.dart';

class Counter7 extends StatefulWidget {
  const Counter7({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Counter7> createState() => _Counter7State();
}

class _Counter7State extends State<Counter7> {
  int _counter = 0;
  String _evenOrOdd = "GENAP";
  Color _textColor = Colors.red;
  bool _isVisible = false;

  void _incrementCounter() {
    setState(() {
      _isVisible = true; // Show button
      _counter++; // Increment counter

      if (_counter % 2 == 1) {
        // Set state
        _evenOrOdd = "GANJIL";
        _textColor = Colors.blue;
      } else {
        _evenOrOdd = "GENAP";
        _textColor = Colors.red;
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--; // Decrement counter

      if (_counter == 0) {
        _isVisible = false;
        _evenOrOdd = "GENAP";
        _textColor = Colors.red;
      } // Counter == 0, set visibility to false (hide button)
      else {
        _isVisible = true; // Show button
        if (_counter % 2 == 1) {
          // Set state
          _evenOrOdd = "GANJIL";
          _textColor = Colors.blue;
        } else {
          _evenOrOdd = "GENAP";
          _textColor = Colors.red;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const DrawerBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _evenOrOdd,
                style: TextStyle(
                  color: _textColor,
                ),
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Visibility(
                visible: _isVisible, // Show widget based on visibility state
                child: FloatingActionButton(
                  onPressed: _decrementCounter,
                  tooltip: "Decrement",
                  child: const Icon(Icons.remove),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: "Increment",
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
