import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';

class AR_core extends StatefulWidget {
  const AR_core({super.key});

  @override
  State<AR_core> createState() => _AR_coreState();
}

class _AR_coreState extends State<AR_core> {
  @override
  Widget build(BuildContext context) {
    ArCoreController arCoreController;

    onArCoreViewCreated(ArCoreController _arCoreController) {
      arCoreController = _arCoreController;
    }

    return Scaffold(
        appBar: AppBar(title: Text('Ar core')),
        body: ArCoreView(onArCoreViewCreated: onArCoreViewCreated));
  }
}
