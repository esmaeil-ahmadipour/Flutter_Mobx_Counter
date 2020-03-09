
import 'package:mobx/mobx.dart';
part 'counter.g.dart';

class Counter = _Counter with _$Counter;

/* Important Note :
1-Create 'abstract class'
2-Write In Terminal : flutter packages pub run build_runner watch
3-Create 'class Counter'
*/
abstract class _Counter with Store{
  @observable
  int count = 0;

  @action
  void increment(){
    count++;
  }

  @action
  void decrement(){
    count--;
  }

}