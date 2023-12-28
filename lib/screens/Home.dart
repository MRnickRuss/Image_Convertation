import 'package:flutter/material.dart';
import 'ToDeg.dart';
import 'ToGMS.dart';
import 'DirectTask.dart';
import 'Reversetask.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const Home());

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _nameState();
}

class _nameState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 150),
            _getButton(context, const ToGMS(), "Градусы в ГМС"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getButton(context, const DirectTask(), "ПГЗ"),
                Container(
                width: 125,
                alignment: Alignment.center,
                child: const Text(
                    'Geo',
                    style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                _getButton(context, const ReverseTask(), "ОГЗ"),
              ],
            ),
            _getButton(context, const toDeg(), "ГМС в градусы"),
          ]
        ),
      ),
    );
  }
}

Widget _getButton(BuildContext context, root, String text) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => root),
      );
    },
    style: ButtonStyle(
      alignment: Alignment.center,
      fixedSize: const MaterialStatePropertyAll(Size(125, 150)),
      backgroundColor: MaterialStateProperty.all(Colors.red[700]),
      shape: MaterialStateProperty.all(
        BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(double.infinity),
        ),
      ),
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: GoogleFonts.lato(
        fontSize: 15,
      )
    ),
  );
}
