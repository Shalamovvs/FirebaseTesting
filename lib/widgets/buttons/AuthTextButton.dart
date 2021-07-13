import 'package:flutter/material.dart';

class AuthTextButton extends StatelessWidget {
  final String title;
  final Widget page;

  AuthTextButton({required this.title, required this.page});

  void _pushPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('$title', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      onPressed: () => _pushPage(context, page),
    );
  }
}