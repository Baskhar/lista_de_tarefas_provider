import 'package:flutter/material.dart';

class Tarefas extends StatelessWidget {
  const Tarefas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container  (
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: Colors.grey),
          ]),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: IntrinsicHeight(
        child: ListTile(
          contentPadding: EdgeInsets.all(8),
          leading: Checkbox(value: true, onChanged: (value) {}),
          title: Text(
            'Descrição da TAREFA',
            style: TextStyle(
              decoration: false
                  ? TextDecoration.lineThrough
                  : null, // risco de completado(se for true ?TextDecoration.lineThrough senão : null)
            ),
          ),
          subtitle: Text(
            '23/04/2023',
            style: TextStyle(
              decoration: false
                  ? TextDecoration.lineThrough
                  : null, // risco de completado(se for true ?TextDecoration.lineThrough senão : null)
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(width: 1),
          ),
        ),

      ),
    );
  }
}
