import 'package:flutter/material.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/modules/home/widgets/tarefas.dart';

class HomeTarefas extends StatelessWidget {
  const HomeTarefas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //verticalDirection: VerticalDirection.up,
     // mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          'TAREFA\'S DE HOJE',
          style: context.tilleStyle,
        ),
        Column(
          children: [
            Tarefas(),
            Tarefas(),
            Tarefas(),
            Tarefas(),
            Tarefas(),
            Tarefas(),
            Tarefas(),
            Tarefas(),
            Tarefas(),
            Tarefas(),
            Tarefas(),
            Tarefas(),
          ],
        )
      ],
    );
  }
}
