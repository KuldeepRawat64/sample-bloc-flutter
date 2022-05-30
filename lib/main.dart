import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

void main() {
  //device preview

  runApp(DevicePreview(
    enabled: true,
    tools: const [...DevicePreview.defaultTools],
    builder: (context) => const App(),
  ));
}
