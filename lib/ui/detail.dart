import 'package:flutter/material.dart';
import 'package:flutter_mobx_counter/resources/custom_string.dart';
import 'package:flutter_mobx_counter/resources/custom_theme.dart';
import 'package:flutter_mobx_counter/resources/custom_widget.dart';
import 'package:flutter_mobx_counter/store/counter/counter.dart';


class MobxDetail extends StatelessWidget {
  final Counter counter;

  MobxDetail({this.counter});

  final ThemeData _customTheme = CustomTheme.getInstance().customTheme;
  final String _title =
      "${CustomString.getInstance().mobxBtnTitle} ${CustomString.getInstance().detailTitle} ";

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: _title,
      theme: _customTheme,
      home: Scaffold(
        appBar: CustomWidget.getInstance().secondaryAppBarWidget(context,_title,_customTheme),
        body: Center(
          child: Text(
            '${counter.count}',
            style: TextStyle(fontSize: 80.0),
          ),
        ),
      ),
    );
  }
}
