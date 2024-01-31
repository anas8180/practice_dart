import 'package:flutter/material.dart';
import 'package:practice_dart/test_business_login.dart';

class TestPageScreen extends StatefulWidget {
  const TestPageScreen({super.key});

  @override
  State<TestPageScreen> createState() => _TestPageScreenState();
}

class _TestPageScreenState extends State<TestPageScreen> {

  TestBusinessLogic businessLogic = TestBusinessLogic();
  TextEditingController textEditingController = TextEditingController();

  List<int> numbers = [1,2,3,4,5];
  String results = '';

  @override
  void initState() {
    textEditingController.text = '5';
    doSomeProcess(int.parse(textEditingController.text));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Dart Practice', style: TextStyle(color: Colors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(
                            hintText: 'Enter Multiplication Factor',
                            enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey,width: 1),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.blueGrey, width: 1.5),
                                borderRadius: BorderRadius.circular(8)
                            )
                        ),
                      ),
                    ),
                    const SizedBox(width: 16,),
                    SizedBox(
                      height: 55,
                      width: 120,
                      child: ElevatedButton(onPressed: submitTapped,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                            elevation: 0
                        ),
                        child: const Text('Submit',style: TextStyle(fontSize: 16),),),
                    )
                  ],
                ),
                const SizedBox(height: 24,),
                Text(results,style: Theme.of(context).textTheme.displaySmall,)
              ],
            ),
          ),
        )
      )
    );
  }

  doSomeProcess(int factorVal) {
    /*businessLogic.doSomeProcess(nums).then((value) {
      setState(() {
        numbers = value;
      });
    });*/

    businessLogic.multiplicationTable(factorVal).then((value) {
      setState(() {
        results = value;
      });
    });
  }

  void submitTapped() {
    doSomeProcess(int.parse(textEditingController.text));
  }
}
