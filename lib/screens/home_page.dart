import 'package:flutter/material.dart';
import 'deg_page.dart';
import 'gms_page.dart';
import 'direct_page.dart';
import 'round_page.dart';

void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _NameState();
}

class _NameState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 150),
            const Center(
              child: Text(
                'GeoCalc',
                style: TextStyle(
                  color: Color.fromARGB(229, 76, 108, 198),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              _getBasicButton(context, const DegPage(), "Deg to GMS"),
              _getBasicButton(context, const GMSPage(), "GMS to Deg"),
            ]),
            
            const SizedBox(height: 40),

            Row(
              children:[
                Column(crossAxisAlignment: CrossAxisAlignment.start, 
                children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, 
                  children: [
                    const SizedBox(width: 30),
                    _getModifyButton(context, const DirectPage(), "Direct geodetic task", ),
                    const SizedBox(width: 30),
                    Image.asset('assets/images/geodetic.png'),
                    // Image.asset('assets/images/geodetic.png'),
                    // const SizedBox(
                      
                    //   width: 40,
                    //   height: 80,
                    //   child: (
                    //     'G',
                    //     style: TextStyle(
                    //       color: Color.fromARGB(229, 76, 108, 198),
                    //       fontSize: 50,
                    //       fontWeight: FontWeight.bold,
                    //       fontStyle: FontStyle.italic,
                    //     ),
                    //   ),
                    // ),
                  ],),

                  const SizedBox(height: 40),

                  Row(crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(width: 40),
                    Image.asset('assets/images/calculations.png'),
                    const SizedBox(width: 30),
                    _getModifyButton(context, const RoundPage(), "Inverse geodetic task")
                  ],)
              ],)
              ]
            )
          ],
        ),
      ),
    );
  }
}

Widget _getBasicButton(BuildContext context, root, String text) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => root),
      );
    },
    style: ButtonStyle(
      alignment: Alignment.center,
      fixedSize: const MaterialStatePropertyAll(Size(130, 100)),
      backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 255, 255)),
      shadowColor: MaterialStateProperty.all(const Color.fromARGB(229, 76, 108, 198)),
      foregroundColor: MaterialStateProperty.all(const Color.fromARGB(229, 76, 108, 198)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
    ),
  );
}

Widget _getModifyButton(BuildContext context, root, String text) {
  return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => root),
      );
    },
    style: ButtonStyle(
      alignment: Alignment.center,
      fixedSize: const MaterialStatePropertyAll(Size(180, 80)),
      backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 255, 255, 255)),
      shadowColor: MaterialStateProperty.all(const Color.fromARGB(229, 76, 108, 198)),
      foregroundColor: MaterialStateProperty.all(const Color.fromARGB(229, 76, 108, 198)),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),  
        ),
      ),
    ),
    child: Text(
      text,
      textAlign: TextAlign.center
    ),
  );
}
