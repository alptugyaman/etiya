import 'package:equatable/equatable.dart';

class ExternalIds extends Equatable {
  final String? isrc;

  const ExternalIds({this.isrc});

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [isrc];
}
