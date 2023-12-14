import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillworker/theme/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(leading: Text('Hello')),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR3WuslWgMDmn3VZ9bktRigOki8oovpzWZ3DA&usqp=CAU'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration:
              BoxDecoration(color: Theme.of(context).colorScheme.primary),
          child: Center(
            child: InkWell(
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              child: Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12)),
                child: SizedBox(
                  child: Text('Toogle'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
