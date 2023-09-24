import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sportify/repos/repos.dart';

import '../models/product.dart';

part 'training_event.dart';
part 'training_state.dart';

class TrainingBloc extends Bloc<TrainingEvent, TrainingState> {
  TrainingBloc() : super(TrainingInitial()) {
    on<ProductItemLoadedEvent>(_handleFetchProduct);
    
  }
}

Future<void> _handleFetchProduct(ProductItemLoadedEvent event,Emitter<TrainingState> emit )async{
  emit(LoadingState());
  try{
    List<Product> productList= await ProductRepost.FetchProduct();
    emit(ProductItemLoadedState(products: productList));
  }
  catch(e){
    emit(FailureState(errorFailureMessage: e.toString()));
  }
}



