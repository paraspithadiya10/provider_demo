import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/counter_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('build method called!!');
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Center(
        child: Consumer<CounterProvider>(builder: (ctx, _, __) {
          debugPrint('consumer called!!');
          return Text(
            //'${Provider.of<CounterProvider>(ctx).getCount()}',
            '${ctx.watch<CounterProvider>().getCount()}',
            style: Theme.of(context).textTheme.headlineMedium,
          );
        }),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        FloatingActionButton(
          onPressed: () {
            //Provider.of<CounterProvider>(context, listen: false).incrementCount();
            context.read<CounterProvider>().decrementCount(2);
          },
          child: Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: () {
            //Provider.of<CounterProvider>(context, listen: false).incrementCount();
            context.read<CounterProvider>().incrementCount(5);
          },
          child: Icon(Icons.add),
        ),
      ]),
    );
  }
}
