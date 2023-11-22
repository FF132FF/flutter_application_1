import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/geo_math.dart';

void main() => runApp(const DegPage());

class DegPage extends StatefulWidget {
  const DegPage({super.key});

  @override
  State<DegPage> createState() => _NameState();
}

class _NameState extends State<DegPage> {
  final TextEditingController _textcontroller1 = TextEditingController();
  String res = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 240),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: const Text(
                  'DegToGMS',
                  style: TextStyle(
                    color: Color.fromARGB(229, 76, 108, 198),
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

              Container(
                width: 310,
                height: 60,
                margin: const EdgeInsets.only(left: 25, right: 25, bottom: 50),
                child: TextField(
                  controller: _textcontroller1,
                  onSubmitted: (value) {
                    setState(() {
                      res = GeoMath.toGMS(double.parse(_textcontroller1.text));
                    });
                  },
                  decoration: const InputDecoration(
                      labelText: "Введите градусы:",
                      border: OutlineInputBorder()),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              SelectableText(
                res,
                style: const TextStyle(fontSize: 25),
                onTap: () {
                  _textcontroller1.clear();
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
