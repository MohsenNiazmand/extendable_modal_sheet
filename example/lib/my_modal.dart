import 'package:extendable_modal_sheet/extendable_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyModal extends StatelessWidget {
  const MyModal({super.key});

  @override
  Widget build(BuildContext context) => ExtendableModalSheet(
        backgroundColor: Colors.grey.shade100,
        mainWidget: Column(
          children: List.generate(
              10,
              (index) => (index == 0)
                  ? Container(
                      width: double.infinity,
                      height: 64,
                      margin: const EdgeInsets.all(8),
                      decoration:
                          BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(12)),
                    child: const Center(child: Text('!! Enjoy using This dialog !!',style: TextStyle(color: Colors.white),),),
                    )
                  : Container(
                width: double.infinity,
                height: 64,
                margin: const EdgeInsets.all(8),
                decoration:
                BoxDecoration(color: Colors.blueAccent.shade400, borderRadius: BorderRadius.circular(12)),
              )),
        ),
        bottomWidget: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('dismiss',style: TextStyle(fontSize: 24,color: Colors.black54),)),
        ),
      );
}
