import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_application_1/utils/colors.dart';

class TaskTile extends StatelessWidget {
  final String taskName;
  final bool taskStatus;
  final Function(bool?)? onPressed;
  final Function(BuildContext)? delete;
  const TaskTile({
    super.key,
    required this.taskName,
    required this.taskStatus,
    required this.onPressed,
    required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: delete,
            icon: Icons.delete,
            backgroundColor: redColor,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: secondaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Checkbox(
                  value: taskStatus,
                  onChanged: onPressed,
                  activeColor: Colors.black,
                ),
                Expanded(
                  child: Text(
                    taskName,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        decoration: taskStatus
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ),
                // IconButton(
                //   onPressed: delete,
                //   icon: const Icon(
                //     Icons.add,
                //     size: 30,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
