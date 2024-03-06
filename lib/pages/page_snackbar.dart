import 'package:flutter/material.dart';

class PageSnackbar extends StatelessWidget {
  const PageSnackbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  content: const Text('Are you sure you want to logout...?'),
                  actions: [
                    ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.green),
                      ),
                      child: const Text('No'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll((Colors.green)),
                      ),
                      child: const Text('Yes'),
                    ),
                  ],
                );
              },
            );
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Row(
                  children: [
                    Icon(Icons.warning),
                    Text(
                      'Ini Snackbar',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          child: const Text('Open Snackbar'),
        ),
      ),
    );
  }
}
