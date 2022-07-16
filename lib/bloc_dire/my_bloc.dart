import 'package:bloc/bloc.dart';

part 'my_event.dart';
part 'my_state.dart';

class MyBloc extends Bloc<MyEvent, MyState> {
  MyBloc() : super(InitialState('no event is clicked')) {
    on<FirstEvent>((event, emit) {
      return emit.call(FirstState(
          'https://thumbs.dreamstime.com/b/rainbow-love-heart-background-red-wood-60045149.jpg'));
    });

    on<SecondEvent>((event, emit) {
      return emit(SecondState(200.0, 200.0, 10));
    });

    on<ThirdEvent>((ThirdEvent event, Emitter<MyState> emit) {
      return emit(ThirdState('text', 1));
    });
  }
}
