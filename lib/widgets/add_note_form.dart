import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/note/note_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_button.dart';
import 'package:note_app/widgets/custom_textfield.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            hintText: "Title",
            onSaved: (value) {
              title = value;
            },
          ),
          CustomTextField(
            hintText: "Comment",
            maxLines: 5,
            onSaved: (value) {
              subtitle = value;
            },
          ),
          BlocBuilder<NoteCubit, NoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is NoteLoading ? true : false,
                onTap: () {
                  debugPrint("clicked !");
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var date = DateTime.now();
                    var noteModel = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: '${date.year}-${date.month}-${date.day}',
                        color: Colors.blue.value);
                    BlocProvider.of<NoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
