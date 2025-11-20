// Search with suggestions using Material 3 SearchAnchor
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:life_medicals/core/theme/color_schemes.dart';

class SearchHeader extends StatefulWidget {
  const SearchHeader({super.key});

  @override
  State<SearchHeader> createState() => _SearchHeaderState();
}

class _SearchHeaderState extends State<SearchHeader> {
  final List<String> _recent = [
    'Paracetamol 650',
    'Cetrizine',
    'Dolo 650',
    'Vitamin C'
  ];
  final List<String> _suggestions = [
    'BP Monitor',
    'Diabetes Care',
    'Cough Syrup',
    'Pain Relief Gel',
    'Protein Powder',
  ];

  List<String> _filtered = [];
  DateTime? _lastInput;

  @override
  void initState() {
    super.initState();
    _filtered = [..._recent];
  }

  void _onQueryChanged(String q) {
    // simple debounce ~200ms
    _lastInput = DateTime.now();
    Future.delayed(const Duration(milliseconds: 200), () {
      if (_lastInput != null &&
          DateTime.now().difference(_lastInput!) >=
              const Duration(milliseconds: 200)) {
        final query = q.trim().toLowerCase();
        setState(() {
          _filtered = query.isEmpty
              ? [..._recent]
              : _suggestions
                  .where((s) => s.toLowerCase().contains(query))
                  .toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return SearchAnchor.bar(
      barElevation: const WidgetStatePropertyAll(0),
      barLeading: const Icon(Icons.search, color: kPrimaryColor),
      barShape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      barBackgroundColor: const WidgetStatePropertyAll(Colors.transparent),
      barSide: WidgetStatePropertyAll(
        BorderSide(color: (kGreyColor300 ?? cs.outlineVariant)),
      ),
      suggestionsBuilder: (context, controller) {
        final items = _filtered;
        return List<ListTile>.generate(items.length, (index) {
          final text = items[index];
          return ListTile(
            minTileHeight: 48,
            leading: const Icon(Icons.history, size: 20),
            title: Text(text),
            onTap: () {
              controller.closeView(text);
              // navigate to results
            },
          );
        });
      },
      barHintText: 'Search medicines and health products',
      barHintStyle: const WidgetStatePropertyAll(
          TextStyle(fontSize: 15, color: Colors.grey)),
      viewBackgroundColor: Theme.of(context).colorScheme.surface,
      barTrailing: [
        IconButton(
          tooltip: 'Voice search',
          icon: const Icon(Icons.mic_none),
          onPressed: () {},
        ),
      ],
      onChanged: _onQueryChanged,
    );
  }
}
