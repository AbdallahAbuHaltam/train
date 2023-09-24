// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'training_bloc.dart';

@immutable
sealed class TrainingState {}

final class TrainingInitial extends TrainingState {}

class ProductItemLoadedState extends TrainingState {
  final List<Product> products;
  ProductItemLoadedState({
    required this.products,
  });
  
}

class LoadingState extends TrainingState{

}
class FailureState extends TrainingState {
  final String errorFailureMessage;
  FailureState({
    required this.errorFailureMessage,
  });

  
}

