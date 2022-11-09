import 'package:equatable/equatable.dart';

class Images extends Equatable {
  final int? height;
  final String? url;
  final int? width;

  const Images({this.height, this.url, this.width});

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [height, url, width];
}
