import 'package:flutter/material.dart';
import 'package:flutter_mobx_counter/resources/custom_string.dart';
import 'package:flutter_mobx_counter/resources/custom_theme.dart';
import 'package:flutter_mobx_counter/resources/custom_widget.dart';
import 'package:flutter_mobx_counter/store/counter/counter.dart';
import 'package:flutter_mobx_counter/ui/detail.dart';

class MobxConfirm extends StatelessWidget {
  final Counter counter;

  MobxConfirm({this.counter});

  final ThemeData _customTheme = CustomTheme.getInstance().customTheme;
  final String _title =
      "${CustomString.getInstance().mobxBtnTitle} ${CustomString.getInstance().confirmTitle} ";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: _customTheme,
      home: Scaffold(
        appBar: CustomWidget.getInstance().secondaryAppBarWidget(context,_title,_customTheme),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Your counter value is: ${counter.count}',
                style: TextStyle(fontSize: 18.0),
              ),
              RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Confirm'),
                  onPressed: () {
                    navigatorPages(context, counter);
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Future navigatorPages(BuildContext context, Counter counter) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MobxDetail(
                  counter: counter,
                )));
  }
}
