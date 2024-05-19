import 'package:extendable_modal_sheet/extendable_modal_sheet.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyExample());
}

class MyExample extends StatelessWidget {
  const MyExample({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Extendable Modal Sheet'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _showDialog() async {
    await showModalBottomSheet(
        isDismissible: true,
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        useRootNavigator: true,
        builder: (ctx) => const MyModal());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showDialog,
        tooltip: 'showDialog',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class MyModal extends StatelessWidget {
  const MyModal({super.key});

  @override
  Widget build(BuildContext context) => ExtendableModalSheet(
    backgroundColor: Colors.grey.shade100,
    mainWidget: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: List.generate(
            20,
                (index) => (index == 0)
                ? Container(
              width: double.infinity,
              height: 64,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(12)),
              child: const Center(
                child: Text(
                  '!! Enjoy using This dialog !!',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
                : Container(
              width: double.infinity,
              height: 64,
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.blueAccent.shade400,
                  borderRadius: BorderRadius.circular(12)),
            )),
      ),
    ),
    bottomWidget: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.black87),),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'dismiss',
            style: TextStyle(fontSize: 24, color: Colors.white),
          )),
    ),
  );
}
