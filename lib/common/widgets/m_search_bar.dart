import 'package:configuration/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';

class SearchBar extends StatefulWidget {
  final Future<List<String>> Function()? history;
  final void Function(String query)? onSubmitted;
  final Widget? body;
  const SearchBar({super.key, this.history, this.onSubmitted, this.body});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  static const historyLength = 5;
  late List<String> _searchHistory;
  List<String> filteredSearchHistory = [];
  String? selectedTerm;
  late FloatingSearchBarController controller;
  bool isLoadedHistory = false;

  List<String> filterSearchTerms({String? filter}) {
    if (filter != null && filter.isNotEmpty) {
      return _searchHistory.reversed
          .where((term) => term.startsWith(filter))
          .toList();
    } else {
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term) {
    if (_searchHistory.contains(term)) {
      putSearchTermFirst(term);
      return;
    }
    _searchHistory.add(term);
    if (_searchHistory.length > historyLength) {
      _searchHistory.removeRange(0, _searchHistory.length - historyLength);
    }

    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term) {
    _searchHistory.removeWhere((t) => t == term);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term) {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  @override
  void initState() {
    super.initState();
    if (widget.history != null) {
      widget.history!().then((value) {
        _searchHistory = value;
        filteredSearchHistory = filterSearchTerms(filter: null);
        setState(() => isLoadedHistory = true);
      });
    } else {
      isLoadedHistory = true;
    }

    controller = FloatingSearchBarController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void onSubmitted(String query) {
    if (widget.onSubmitted != null) widget.onSubmitted!(query);
    setState(() {
      addSearchTerm(query);
      selectedTerm = query;
    });
    controller.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FloatingSearchBar(
        elevation: 0.0,
        controller: controller,
        borderRadius: BorderRadius.circular(8.0),
        body: widget.body,
        transition: CircularFloatingSearchBarTransition(),
        physics: const BouncingScrollPhysics(),
        title: Text(selectedTerm ?? MultiLanguage.of(context).search),
        hint: MultiLanguage.of(context).hintSearch,
        actions: [FloatingSearchBarAction.searchToClear()],
        onQueryChanged: (query) {
          setState(() {
            filteredSearchHistory = filterSearchTerms(filter: query);
          });
        },
        onSubmitted: onSubmitted,
        builder: (context, transition) => ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Material(
                elevation: 4,
                child: isLoadedHistory
                    ? Builder(
                        builder: (context) {
                          if (filteredSearchHistory.isEmpty &&
                              controller.query.isEmpty) {
                            return Container(
                              height: 56,
                              width: double.maxFinite,
                              alignment: Alignment.center,
                              child: Text(MultiLanguage.of(context).empty,
                                  maxLines: 1, overflow: TextOverflow.ellipsis),
                            );
                          } else if (filteredSearchHistory.isEmpty) {
                            return ListTile(
                                title: Text(controller.query),
                                leading: const Icon(Icons.search),
                                onTap: () => onSubmitted(controller.query));
                          } else {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: filteredSearchHistory
                                  .map(
                                    (term) => ListTile(
                                      title: Text(
                                        term,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      leading: const Icon(Icons.history),
                                      trailing: IconButton(
                                        icon: const Icon(Icons.clear),
                                        onPressed: () {
                                          setState(() {
                                            deleteSearchTerm(term);
                                          });
                                        },
                                      ),
                                      onTap: () => onSubmitted(term),
                                    ),
                                  )
                                  .toList(),
                            );
                          }
                        },
                      )
                    : const LinearProgressIndicator())),
      ),
    );
  }
}
