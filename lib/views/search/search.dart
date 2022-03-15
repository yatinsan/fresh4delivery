import 'package:flutter/material.dart';

import 'package:flutter_typeahead/flutter_typeahead.dart';

class SearchScreen extends SearchDelegate {
  static const routeName = '/search';
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return <Widget>[IconButton(onPressed: () {}, icon: Icon(Icons.clear))];
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("result");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("result");
  }
}

TypeAheadField<String> caatogoryseacrh() {
  return TypeAheadField(
      noItemsFoundBuilder: (context) => const ListTile(
            title: Text('Category not available'),
          ),
      suggestionsBoxDecoration:
          SuggestionsBoxDecoration(borderRadius: BorderRadius.circular(10)),
      keepSuggestionsOnLoading: true,
      textFieldConfiguration: TextFieldConfiguration(
        controller: TextEditingController(),
        decoration: InputDecoration(
          labelText: "Category",
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
              gapPadding: 0),
        ),
      ),
      suggestionsCallback: (pattern) => searchcatogery(pattern),
      itemBuilder: (context, String item) => ListTile(
            title: Text(item),
          ),
      onSuggestionSelected: (selected) {
        // selected;
      });
}

List<String> searchcatogery(String catogery) {
  List<String> catogerys = [
    "dog",
    "cat",
    "cow",
    "goat",
    "pig",
    "fish",
    "squirel",
    "birds"
  ];
  return catogerys
      .where(
          (element) => element.toLowerCase().contains(catogery.toLowerCase()))
      .toList();
}
