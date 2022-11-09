import 'package:etiya/src/presentation/bloc/search/search_bloc.dart';
import 'package:etiya/src/presentation/widget/search/tracklist_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This widget is a BlocBuilder that builds a TracklistWidget if the state is SearchHasData, otherwise
/// it builds a SizedBox.shrink().
class SearchBlocWidget extends StatelessWidget {
  const SearchBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state is SearchInitial) {
          return const SizedBox.shrink();
        } else if (state is SearchError) {
          return Center(child: Text(state.message));
        } else if (state is SearchHasData) {
          /// Passing the state to the TracklistWidget.
          return TracklistWidget(state: state);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
