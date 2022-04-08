import 'package:flutter/material.dart';

class ConstraintsPage extends StatelessWidget {
  const ConstraintsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Constraints'),
        actions: const [
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          ConstrainedBox(
            constraints:
                const BoxConstraints(minWidth: double.infinity, minHeight: 50),
            child: const SizedBox(
              height: 5,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
          ),
          const SizedBox(
            width: 50,
            height: 50,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 60, minHeight: 60),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 90, minHeight: 20),
              child: const DecoratedBox(
                decoration: BoxDecoration(color: Colors.red),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 90, minHeight: 20),
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 60, minHeight: 60),
                child: const DecoratedBox(
                  decoration: BoxDecoration(color: Colors.red),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 60, minHeight: 100),
              child: UnconstrainedBox(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(minWidth: 90, minHeight: 20),
                  child: const DecoratedBox(
                    decoration: BoxDecoration(color: Colors.red),
                  ),
                ),
              ),
            ),
          ),
          UnconstrainedBox(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [Text('xx' * 30)],
              ),
            ),
          )
        ],
      ),
    );
  }
}
