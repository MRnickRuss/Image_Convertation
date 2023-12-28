import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/geo_math.dart';

void main() => runApp(const ReverseTask());

class ReverseTask extends StatefulWidget {
  const ReverseTask({super.key});

  @override
  State<ReverseTask> createState() => _nameState();
}

class _nameState extends State<ReverseTask> {

  final List<TextEditingController> _controllers = List.generate(4, (i) => TextEditingController());
  List<String> res = ['', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          child: Column(
            children: [     
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                  width: 70,
                  child: TextField(
                    onSubmitted: (text) {
                      setState(() {
                        if (!_controllers.any((controller) => controller.text.isEmpty || double.tryParse(controller.text) == null)) {
                          res = GeoMath.reserveTask(double.parse(_controllers[0].text), double.parse(_controllers[1].text), double.parse(_controllers[2].text), double.parse(_controllers[3].text));
                        }
                      });
                    },
                    controller: _controllers[0],
                    decoration: const InputDecoration(
                      labelText: "X1:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.zero,
                      )
                    ),
                    keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),

                  const SizedBox(width:30),

                  Container(
                    width: 70,
                    child: TextField(
                      onSubmitted: (text) {
                        setState(() {
                          if (!_controllers.any((controller) => controller.text.isEmpty || double.tryParse(controller.text) == null)) {
                            res = GeoMath.reserveTask(double.parse(_controllers[0].text), double.parse(_controllers[1].text), double.parse(_controllers[2].text), double.parse(_controllers[3].text));
                          }
                        });
                      },
                      controller: _controllers[1],
                      decoration: const InputDecoration(
                        labelText: "Y1:",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        )
                      ),
                      keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                
                  const SizedBox(width:30),

                  Container(
                    width: 70,
                    child: TextField(
                      onSubmitted: (text) {
                        setState(() {
                          if (!_controllers.any((controller) => controller.text.isEmpty || double.tryParse(controller.text) == null)) {
                            res = GeoMath.reserveTask(double.parse(_controllers[0].text), double.parse(_controllers[1].text), double.parse(_controllers[2].text), double.parse(_controllers[3].text));
                          }
                        });
                      },
                      controller: _controllers[2],
                      decoration: const InputDecoration(
                        labelText: "X2:",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        )
                      ),
                      keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                      ),
                    ),
                  const SizedBox(width: 30),
                  Container(
                    width: 70,
                    child: TextField(
                      onSubmitted: (text) {
                        setState(() {
                          if (!_controllers.any((controller) => controller.text.isEmpty || double.tryParse(controller.text) == null)) {
                            res = GeoMath.reserveTask(double.parse(_controllers[0].text), double.parse(_controllers[1].text), double.parse(_controllers[2].text), double.parse(_controllers[3].text));
                          }
                        });
                      },
                      controller: _controllers[3],
                      decoration: const InputDecoration(
                        labelText: "Y2:",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.zero,
                        )
                      ),
                      keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                      ),
                  )
                ],
              ),
              const SizedBox(height: 80),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                      alignment: Alignment.center,
                        height: 50,
                        width: 140,
                        color: Colors.red[700],
                        child: const Text(
                          "Dist:",
                          style: TextStyle(
                          fontSize: 20,
                            color: Colors.white,
                          ),
                        )
                      ),
                      const SizedBox(width: 3),
                      Container(
                        height: 50,
                        width: 180,
                        color: Color.fromARGB(255, 211, 47, 47),
                        alignment: Alignment.center,
                        child: SelectableText(
                          textAlign: TextAlign.center,
                          res[0],
                          style: const TextStyle(
                            wordSpacing: 5,
                            fontSize: 30, 
                            color: Colors.white, 
                          ),
                          onTap: () {
                            if (res.isNotEmpty) {
                              _controllers.clear();
                              Clipboard.setData(ClipboardData(text: res[0])).then(
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
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                      alignment: Alignment.center,
                        height: 50,
                        width: 140,
                        color: Color.fromARGB(255, 211, 47, 47),
                        child: const Text(
                          "Angle:",
                          style: TextStyle(
                          fontSize: 20,
                            color: Colors.white,
                          ),
                        )
                      ),
                      const SizedBox(width: 3),
                      Container(
                        height: 50,
                        width: 180,
                        color: Color.fromARGB(255, 211, 47, 47),
                        alignment: Alignment.center,
                        child: SelectableText(
                          textAlign: TextAlign.center,
                          res[1],
                          style: const TextStyle(
                            wordSpacing: 5,
                            fontSize: 30,
                            color: Colors.white, 
                          ),
                          onTap: () {
                            if (res.isNotEmpty) {
                              _controllers.clear();
                              Clipboard.setData(ClipboardData(text: res[1])).then(
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
