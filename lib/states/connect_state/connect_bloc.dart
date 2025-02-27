import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class ConnectivityEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConnectivityChanged extends ConnectivityEvent {
  final ConnectivityResult result;

  ConnectivityChanged(this.result);

  @override
  List<Object?> get props => [result];
}

// States
abstract class ConnectivityState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ConnectivityInitial extends ConnectivityState {}
class ConnectivityOnline extends ConnectivityState {}
class ConnectivityOffline extends ConnectivityState {}

// BLoC
class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity;
  StreamSubscription? _connectivitySubscription;

  ConnectivityBloc(this._connectivity) : super(ConnectivityInitial()) {
    on<ConnectivityChanged>((event, emit) {
      if (event.result == ConnectivityResult.none) {
        emit(ConnectivityOffline());
      } else {
        emit(ConnectivityOnline());
      }
    });

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      add(ConnectivityChanged(result));
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}