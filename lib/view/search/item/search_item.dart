import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sample_map_app/model/model/highlight_model.dart';
import 'package:sample_map_app/model/model/item_model.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key, required this.onTap, required this.location});
  final VoidCallback onTap;
  final Item location;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: 5,
        ),
        const Icon(Icons.location_on_outlined),
        const SizedBox(
          width: 5,
        ),
        Expanded(
            child: buildBoldSubstring(
                location.address.label, location.highlights.address.label!)),
        const SizedBox(
          width: 5,
        ),
        IconButton(
            onPressed: () {
              onTap();
            },
            icon: SvgPicture.asset(
              'assets/icons/diamond-turn-right.svg',
              height: 24,
              width: 24,
              fit: BoxFit.cover,
            ))
      ],
    );
  }

  //Bold highlight substring
  Widget buildBoldSubstring(String original, List<Highlight> highlights) {
    List<TextSpan> spans = [];
    int startIndex = 0;

    highlights.sort((a, b) => a.start.compareTo(b.start));

    for (var highlight in highlights) {
      int start = highlight.start;
      int end = highlight.end;

      if (startIndex < start) {
        spans.add(TextSpan(text: original.substring(startIndex, start)));
      }

      spans.add(TextSpan(
          text: original.substring(start, end),
          style: const TextStyle(fontWeight: FontWeight.bold)));

      startIndex = end;
    }

    if (startIndex < original.length) {
      spans.add(TextSpan(text: original.substring(startIndex)));
    }

    return Container(
      constraints: const BoxConstraints(maxHeight: 48),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black),
          children: spans,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}
