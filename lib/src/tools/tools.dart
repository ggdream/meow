import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hashids2/hashids2.dart';

class Tools {
  static Image getImage(
    String uri, {
    double? width,
    double? height,
  }) {
    if (uri.startsWith('http')) {
      return Image.network(
        uri,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        uri,
        width: width,
        height: height,
        fit: BoxFit.cover,
      );
    }
  }

  static Widget genImageView(String image) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      child: ClipOval(
        child: getImage(
          image,
          width: 32,
          height: 32,
        ),
      ),
    );
  }

  static String encodeId(String value) {
    final listValue = utf8.encode(value);
    return HashIds().encodeList(listValue);
  }

  static String decodeId(String hash) {
    final listValue = HashIds().decode(hash);
    return utf8.decode(listValue);
  }
}
