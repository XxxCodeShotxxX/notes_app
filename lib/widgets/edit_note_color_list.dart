import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/color_item.dart';

class EditNoteColorList extends StatefulWidget {
  const EditNoteColorList({super.key, required this.note});
  final NoteModel note;
  @override
  State<EditNoteColorList> createState() => _EditNoteColorListState();
}

class _EditNoteColorListState extends State<EditNoteColorList> {
  List<Color> colors = const [
    Color(0xffCDFADB),
    Color(0xffF6FDC3),
    Color(0xffFFCF96),
    Color(0xffFF8080),
  ];
  late int currentIndex;

  @override
  void initState() {
    currentIndex = colors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 38 * 2,
        child: ListView.builder(
            itemCount: colors.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: GestureDetector(
                  onTap: () {
                    currentIndex = index;
                    widget.note.color = colors[index].value;
                    setState(() {});
                  },
                  child: ColorItem(
                    color: colors[index],
                    isActive: currentIndex == index,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
