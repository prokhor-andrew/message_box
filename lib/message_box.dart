// Copyright (c) 2024 Andrii Prokhorenko
// This file is part of Obmin, licensed under the MIT License.
// See the LICENSE file in the project root for license information.

import 'package:flutter/material.dart';

final class MessageBox extends StatelessWidget {
  final bool isLoading;
  final String message;
  final String actionLabel;
  final void Function()? onPressed;

  const MessageBox.message({super.key, required this.message, required this.actionLabel, required this.onPressed}) : isLoading = false;

  const MessageBox.loading({super.key, required this.actionLabel, this.onPressed}) : message = "", isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (isLoading) Center(child: CircularProgressIndicator()) else Center(child: Text(message)),

          Center(
            child: MaterialButton(
              onPressed: onPressed,
              child: Text(actionLabel, style: TextStyle(color: Theme.of(context).colorScheme.primary)),
            ),
          ),
        ],
      ),
    );
  }
}
