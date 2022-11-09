import 'package:equatable/equatable.dart';
import 'external_urls.dart';

class Artist extends Equatable {
  final ExternalUrls? externalUrls;
  final String? id;
  final String? name;
  final String? type;
  final String? uri;

  const Artist({
    this.externalUrls,
    this.id,
    this.name,
    this.type,
    this.uri,
  });

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [externalUrls, id, name, type, uri];
}
