import 'package:etiya/src/core/components/text_form_field/custom_text_form_field.dart';
import 'package:etiya/src/presentation/bloc/search/search_bloc.dart';
import 'package:etiya/src/presentation/widget/search/search_bloc_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// `SearchView` is a `StatefulWidget` that has a `TextEditingController` and a `CustomTextFormField`
/// that calls `OnLocalPlaylistTrackFetched` when the text changes
class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();

  /// > When the widget is first created, we want to fetch the local playlist tracks
  @override
  void initState() {
    super.initState();
    context.read<SearchBloc>().add(const OnLocalPlaylistTrackFetched(''));
  }

  /// It disposes the searchController when the widget is disposed.
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        /// A `CustomTextFormField` that calls `OnLocalPlaylistTrackFetched` when the text changes
        title: CustomTextFormField(
          isReadOnly: false,
          onChanged: (String input) {
            context.read<SearchBloc>().add(OnLocalPlaylistTrackFetched(input));
          },
        ),
      ),

      /// A `StatelessWidget` that is a `BlocBuilder` that builds the `SearchBloc`
      body: const SearchBlocWidget(),
    );
  }
}
