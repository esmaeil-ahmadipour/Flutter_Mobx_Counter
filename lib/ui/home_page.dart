import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_mobx_counter/resources/custom_string.dart';
import 'package:flutter_mobx_counter/resources/custom_theme.dart';
import 'package:flutter_mobx_counter/resources/custom_widget.dart';
import 'package:flutter_mobx_counter/store/counter/counter.dart';
import 'package:flutter_mobx_counter/ui/confirm.dart';

class MobxPage extends StatelessWidget {
  final ThemeData _customTheme = CustomTheme.getInstance().customTheme;
  final String _title = CustomString.getInstance().mobxBtnTitle;
  final Counter counter = Counter();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: _title,
      theme: _customTheme,
      home: Scaffold(
        appBar: CustomWidget.getInstance().mainAppBarWidget(_title,_customTheme),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Observer(
                builder:(_)=> Text(
                '${counter.count}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
              SizedBox(height: 10.0),
              RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Submit'),
                  onPressed: () {
                    navigatorPages(context, counter);
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        counter.increment();
                      }, //increment
                      child: Icon(Icons.add),
                    ),
                    Spacer(),
                    RaisedButton(
                      onPressed: () {
                        counter.decrement();
                      }, //decrement
                      child: Icon(Icons.remove),
                    ),
                  ],
                ),
              ),
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
            builder: (context) => MobxConfirm(
              counter: counter,
            )));
  }
}
