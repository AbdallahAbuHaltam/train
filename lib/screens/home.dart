import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/training_bloc.dart';
import '../models/product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> product = [];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrainingBloc()..add(ProductItemLoadedEvent()),
      child: BlocConsumer<TrainingBloc, TrainingState>(
        listener: (context, state) {
          // TODO: implement listener
           if(state is LoadingState){
                const CircularProgressIndicator();
              }
              if(state is ProductItemLoadedState){
                product=state.products;
              }
              if(state is FailureState){
                           print(state.errorFailureMessage);
              }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                      itemBuilder: (BuildContext context, int index) {
                        //TODO list of API
                          return Card(
                            color: Colors.amber,
                            child: Stack(
                              children: [
                                Text(product[index].title)
                              ],
                            ),
                          );
                      },
                      itemCount: //TODO list of APIlength
                      product.length,
                    ),
          );
        },
      ),
    );
  }
}
