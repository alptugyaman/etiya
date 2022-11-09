import 'package:equatable/equatable.dart';

import 'external_urls.dart';

class AddedBy extends Equatable {
  final ExternalUrls? externalUrls;
  final String? id;
  final String? type;
  final String? uri;

  const AddedBy({this.externalUrls, this.id, this.type, this.uri});

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [externalUrls, id, type, uri];
}
