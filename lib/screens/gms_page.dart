import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils/geo_math.dart';

void main() => runApp(const GMSPage());

class GMSPage extends StatefulWidget {
  const GMSPage({super.key});

  @override
  State<GMSPage> createState() => _NameState();
}

class _NameState extends State<GMSPage> {

  final List<TextEditingController> _controllers = List.generate(3, (i) => TextEditingController());
  String res = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 150),
          
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    child: const Text(
                      'GMSToDeg',
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
                    margin: const EdgeInsets.only(left: 25, right: 135, bottom: 20),
                    child: TextField(
                      onSubmitted: (text) {
                        setState(() {
                          if (!_controllers.any((controller) => controller.text.isEmpty || double.tryParse(controller.text) == null)) {
                            res = GeoMath.toDeg(double.parse(_controllers[0].text), double.parse(_controllers[1].text), double.parse(_controllers[2].text));
                          }
                        });
                      },
                      controller: _controllers[0],
                      decoration: InputDecoration(
                        labelText: "Degrees:",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Color.fromARGB(229, 76, 108, 198), width: 0.0),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:  const BorderSide(color: Color.fromARGB(229, 76, 108, 198), width: 1.0),
                        ),

                        labelStyle: const TextStyle(
                          color: Color.fromARGB(229, 76, 108, 198),
                        ),
                      ),
                      keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),

                  Container(
                    width: 200,
                    height: 60,
                    margin: const EdgeInsets.only(left: 135, right: 25, top: 20, bottom: 20),
                    child: TextField(
                      onSubmitted: (text) {
                        setState(() {
                          if (!_controllers.any((controller) => controller.text.isEmpty || double.tryParse(controller.text) == null)) {
                            res = GeoMath.toDeg(double.parse(_controllers[0].text), double.parse(_controllers[1].text), double.parse(_controllers[2].text));
                          }
                        });
                      },
                      controller: _controllers[1],
                      decoration: InputDecoration(
                        labelText: "Minutes:",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Color.fromARGB(229, 76, 108, 198), width: 0.0),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:  const BorderSide(color: Color.fromARGB(229, 76, 108, 198), width: 1.0),
                        ),

                        labelStyle: const TextStyle(
                          color: Color.fromARGB(229, 76, 108, 198),
                        ),
                      ),
                      keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),

                  Container(
                    width: 200,
                    height: 60,
                    margin: const EdgeInsets.only(left: 25, right: 135, top: 20, bottom: 50),
                    child: TextField(
                      onSubmitted: (text) {
                        setState(() {
                          if (!_controllers.any((controller) => controller.text.isEmpty || double.tryParse(controller.text) == null)) {
                            res = GeoMath.toDeg(double.parse(_controllers[0].text), double.parse(_controllers[1].text), double.parse(_controllers[2].text));
                          }
                        });
                      },
                      controller: _controllers[2],
                      decoration: InputDecoration(
                        labelText: "Seconds:",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Color.fromARGB(229, 76, 108, 198), width: 0.0),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide:  const BorderSide(color: Color.fromARGB(229, 76, 108, 198), width: 1.0),
                        ),

                        labelStyle: const TextStyle(
                          color: Color.fromARGB(229, 76, 108, 198),
                        ),
                      ),
                      keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    ),
                  ),
                  
                  SelectableText(
                    res,
                    style: const TextStyle(fontSize: 25, color: Color.fromARGB(229, 76, 108, 198)),
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: res)).then(
                        (_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                "Text copied!",
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
