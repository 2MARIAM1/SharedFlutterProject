import 'package:flutter/material.dart';

final TextEditingController _searchController = TextEditingController();

Widget buildSearchBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => _searchController.clear(),
          ),
          prefixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Perform the search here
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    ),
  );
}
