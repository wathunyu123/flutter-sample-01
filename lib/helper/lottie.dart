import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:lottie/lottie.dart';

import 'size.dart';

Future<LottieComposition?> customDecoder(List<int> bytes) {
  return LottieComposition.decodeZip(bytes, filePicker: (files) {
    return files.firstWhereOrNull(
        (f) => f.name.startsWith('animations/') && f.name.endsWith('.json'));
  });
}

Widget lottieFile({
  required BuildContext context,
  required String path,
  required double width,
  required double height,
}) {
  return Lottie.asset(
    path,
    decoder: customDecoder,
    width: width,
    height: height,
  );
}
