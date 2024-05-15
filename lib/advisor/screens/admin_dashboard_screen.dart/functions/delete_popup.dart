import 'package:flutter/material.dart';
import 'package:self_stack/utils/constans.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const DeleteConfirmationDialog({Key? key, required this.onConfirm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: kblackDark,
      title: Text(
        'Confirm Deletion',
        style: TextStyle(color: kwhiteModel),
      ),
      content: Text(
        'Are you sure you want to delete this user?',
        style: TextStyle(color: kwhiteModel),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Cancel',
            style: TextStyle(color: kwhiteModel),
          ),
        ),
        TextButton(
          onPressed: onConfirm,
          child: Text('Delete', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}

void showDeleteConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return DeleteConfirmationDialog(
        onConfirm: () {
          Navigator.of(context).pop();
        },
      );
    },
  );
}
