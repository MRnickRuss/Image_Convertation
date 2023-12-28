import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/geo_math.dart';

void main() => runApp(const ToGMS());

class ToGMS extends StatefulWidget {
  const ToGMS({super.key});

  @override
  State<ToGMS> createState() => _nameState();
}

class _nameState extends State<ToGMS> {
  final TextEditingController _textcontroller1 = TextEditingController();
  String res = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 300,
                  child: TextField(
                    controller: _textcontroller1,
                    onSubmitted: (value) {
                      setState(() {
                        if (double.tryParse(_textcontroller1.text) != null)
                          res = GeoMath.toGMS(double.parse(_textcontroller1.text));
                      });
                    },
                    decoration: const InputDecoration(
                      labelText: "Введите градусы:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      )
                    ),
                    keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                height: 50,
                width: 240,
                color: const Color.fromARGB(255, 211, 47, 47),
                alignment: Alignment.center,
                child: SelectableText(
                  textAlign: TextAlign.center,
                  res,
                  style: const TextStyle(
                    color: Colors.white,
                    wordSpacing: 5,
                    fontSize: 30, 
                  ),
                  onTap: () {
                    if (res.isNotEmpty) {
                      _textcontroller1.clear();
                      Clipboard.setData(ClipboardData(text: res)).then(
                        (_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Color.fromARGB(255, 211, 47, 47),
                              content: Text(
                                "Текст скопирован!",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
