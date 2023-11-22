import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/geo_math.dart';

void main() => runApp(const RoundPage());

class RoundPage extends StatefulWidget {
  const RoundPage({super.key});

  @override
  State<RoundPage> createState() => _NameState();
}

class _NameState extends State<RoundPage> {
  final List<TextEditingController> _controllers = List.generate(4, (i) => TextEditingController());
  String res = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: const Text(
                      'InverseGeodeticTask',
                      style: TextStyle(
                        color: Color.fromARGB(229, 76, 108, 198),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  
                  Container(
                    width: 200,
                    height: 60,
                    margin: const EdgeInsets.only(left: 25, right: 135, top: 10, bottom: 10),
                    child: TextField(
                      onSubmitted: (text) {
                        setState(() {
                          if (!_controllers.any((controller) => controller.text.isEmpty || double.tryParse(controller.text) == null)) {
                            res = GeoMath.inverseGeodeticTask(double.parse(_controllers[0].text), double.parse(_controllers[1].text), double.parse(_controllers[2].text), double.parse(_controllers[3].text));
                          }
                        });
                      },
                      controller: _controllers[0],
                      decoration: const InputDecoration(
                        labelText: "x1: ",
                        border: OutlineInputBorder()
                      ),
                      keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),

                  Container(
                    width: 200,
                    height: 60,
                    margin: const EdgeInsets.only(left: 135, right: 25, top: 20, bottom: 10),
                    child: TextField(
                      onSubmitted: (text) {
                        setState(() {
                          if (!_controllers.any((controller) => controller.text.isEmpty || double.tryParse(controller.text) == null)) {
                            res = GeoMath.inverseGeodeticTask(double.parse(_controllers[0].text), double.parse(_controllers[1].text), double.parse(_controllers[2].text), double.parse(_controllers[3].text));
                          }
                        });
                      },
                      controller: _controllers[1],
                      decoration: const InputDecoration(
                        labelText: "y1: ",
                        border: OutlineInputBorder()
                      ),
                      keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),

                  Container(
                    width: 200,
                    height: 60,
                    margin: const EdgeInsets.only(left: 25, right: 135, top: 20, bottom: 10),
                    child: TextField(
                      onSubmitted: (text) {
                        setState(() {
                          if (!_controllers.any((controller) => controller.text.isEmpty || double.tryParse(controller.text) == null)) {
                            res = GeoMath.inverseGeodeticTask(double.parse(_controllers[0].text), double.parse(_controllers[1].text), double.parse(_controllers[2].text), double.parse(_controllers[3].text));
                          }
                        });
                      },
                      controller: _controllers[2],
                      decoration: const InputDecoration(
                        labelText: "x2: ",
                        border: OutlineInputBorder()
                      ),
                      keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),

                  Container(
                    width: 200,
                    height: 60,
                    margin: const EdgeInsets.only(left: 135, right: 25, top: 20, bottom: 60),
                    child: TextField(
                      onSubmitted: (text) {
                        setState(() {
                          if (!_controllers.any((controller) => controller.text.isEmpty || double.tryParse(controller.text) == null)) {
                            res = GeoMath.inverseGeodeticTask(double.parse(_controllers[0].text), double.parse(_controllers[1].text), double.parse(_controllers[2].text), double.parse(_controllers[3].text));
                          }
                        });
                      },
                      controller: _controllers[3],
                      decoration: const InputDecoration(
                        labelText: "y2: ",
                        border: OutlineInputBorder()
                      ),
                      keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  
                  SelectableText(
                    res,
                    style: const TextStyle(fontSize: 25),
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: res)).then(
                        (_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Текст скопирован!",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  )],
                ),
            ],
          ), 
        ),
      ),
    );
  }
}