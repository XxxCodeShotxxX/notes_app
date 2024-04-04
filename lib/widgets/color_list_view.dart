import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/note/note_cubit.dart';
import 'package:note_app/widgets/color_item.dart';

class ColorListView extends StatefulWidget {
  const ColorListView({super.key, required this.isActive});
  final bool isActive;

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xffCDFADB),
    Color(0xffF6FDC3),
    Color(0xffFFCF96),
    Color(0xffFF8080),
  ];
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
                    BlocProvider.of<NoteCubit>(context).color = colors[index];
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
