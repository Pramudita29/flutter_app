import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestCubit extends Cubit<double> {
  SimpleInterestCubit() : super(0);

  void calculateSimpleInterest(double principal, double rate, double time) {
    final interest = (principal * rate * time) / 100;
    emit(interest);
  }
}
