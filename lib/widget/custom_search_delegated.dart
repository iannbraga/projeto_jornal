import 'package:flutter/material.dart';

class CustomSearchDelegated extends SearchDelegate {
  List<String> list = [
    "Drugs",
    "Sex",
    "Money",
  ];

  List<String> noticias = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var termo in list) {
      if (termo.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(termo);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var resultado = matchQuery[index];
          return ListTile(
            title: Text(resultado),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var termo in list) {
      if (termo.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(termo);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var resultado = matchQuery[index];
          return ListTile(
            title: Text(resultado),
          );
        });
  }
}
