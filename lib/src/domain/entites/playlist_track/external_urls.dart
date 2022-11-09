import 'package:equatable/equatable.dart';

class ExternalUrls extends Equatable {
  final String? spotify;

  const ExternalUrls({this.spotify});

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [spotify];
}
