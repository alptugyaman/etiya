import 'package:etiya/src/core/network/network_manager.dart';
import 'package:etiya/src/data/datasources/remote/remote_data_source.dart';
import 'package:etiya/src/domain/repositories/playlist_track_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks([
  PlaylistRepository,
  RemoteDataSource,
], customMocks: [
  MockSpec<NetworkManager>(as: #MockNetworkManager)
])
void main() {}
