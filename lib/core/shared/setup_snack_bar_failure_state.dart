import 'package:flutter/material.dart';

////setup snackbar when state is failure
setupSnackbarForFailureState(BuildContext context, String errMsg) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        errMsg,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      backgroundColor: Colors.red.shade700,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      duration: const Duration(seconds: 5),
    ),
  );
}
