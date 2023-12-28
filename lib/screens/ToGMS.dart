import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/geo_math.dart';

void main() => runApp(const toDeg());

class toDeg extends StatefulWidget {
  const toDeg({super.key});

  @override
  State<toDeg> createState() => _nameState();
}

class _nameState extends State<toDeg> {

  final List<TextEditingController> _controllers = List.generate(3, (i) => TextEditingController());
  String res = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            children: [     
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                  width: 100,
                  child: TextField(
                    onSubmitted: (text) {
                      setState(() {
                        if (!_controllers.any((controller) => controller.text.isEmpty || double.tryParse(controller.text) == null)) {
                          res = GeoMath.toDegrees(double.parse(_controllers[0].text), double.parse(_controllers[1].text), double.parse(_controllers[2].text));
                        }
                      });
                    },
                    controller: _controllers[0],
                    decoration: const InputDecoration(
                      labelText: "Градусы:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      )
                    ),
                    keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),

                  Container(
                    width: 100,
                    child: TextField(
                      onSubmitted: (text) {
                        setState(() {
                          if (!_controllers.any((controller) => controller.text.isEmpty || double.tryParse(controller.text) == null)) {
                            res = GeoMath.toDegrees(double.parse(_controllers[0].text), double.parse(_controllers[1].text), double.parse(_controllers[2].text));
                          }
                        });
                      },
                      controller: _controllers[1],
                      decoration: const InputDecoration(
                        labelText: "Минуты:",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        )
                      ),
                      keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),

                  Container(
                  width: 100,
                  child: TextField(
                    onSubmitted: (text) {
                      setState(() {
                        if (!_controllers.any((controller) => controller.text.isEmpty || double.tryParse(controller.text) == null)) {
                          res = GeoMath.toDegrees(double.parse(_controllers[0].text), double.parse(_controllers[1].text), double.parse(_controllers[2].text));
                        }
                      });
                    },
                    controller: _controllers[2],
                    decoration: const InputDecoration(
                      labelText: "Секунды:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      )
                    ),
                    keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  ),
                )],
              ),
              const SizedBox(height: 40),
              Container(
                height: 50,
                width: 180,
                color: Color.fromARGB(255, 211, 47, 47),
                alignment: Alignment.center,
                child: SelectableText(
                  textAlign: TextAlign.center,
                  res,
                  style: const TextStyle(
                    wordSpacing: 5,
                    fontSize: 30, 
                    color: Colors.white, 
                  ),
                  onTap: () {
                    if (res.isNotEmpty) {
                      _controllers.clear();
                      Clipboard.setData(ClipboardData(text: res)).then(
                        (_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Color.fromARGB(255, 211, 47, 47),
                              content: Text(
                                "Текст скопирован!",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
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