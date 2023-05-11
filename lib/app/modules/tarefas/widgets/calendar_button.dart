
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/app/core/ui/theme_extensions.dart';
import 'package:todo_list_provider/app/modules/tarefas/tarefas_create_controller.dart';

class CalendarButton extends StatelessWidget {
  CalendarButton({Key? key}) : super(key: key);


  final dateFormat = DateFormat('dd/MM/y');
  @override
  Widget build(BuildContext context) {
    //deixar o botao clicavel(inkWell)
    return InkWell(
      onTap: () async {
        var lastDate = DateTime.now();
        lastDate = lastDate.add(Duration(days: 10 * 365));
        final DateTime? SelectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: lastDate,
        );
        context.read<TarefasCreateController>().selectedDate = SelectedDate;
      },
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          //usar o minimo
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.today,
              color: Colors.grey,
            ),
            SizedBox(
              width: 10,
            ),
            Selector<TarefasCreateController, DateTime?>(
                selector: (context, controller) => controller.selectedDate,
                builder: (context, selectedDate, child) {
                  if(selectedDate != null){
                    return Text(dateFormat.format(selectedDate),style: context.tilleStyle,);
                  }else{
                    return Text('SELECIONE UMA DATA',style: context.tilleStyle,);
                  }
                },
            ),
          ],
        ),
      ),
    );
  }
}
