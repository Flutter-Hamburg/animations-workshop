import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  timeDilation = 10;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 12.0,
            title: Column(
              children: [
                const Text('Home'),
                Text(
                  'PageTransition',
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24.0),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(24.0),
                      child: Icon(
                        CupertinoIcons.collections_solid,
                        color: Colors.white,
                        size: 64.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Let\'s do a PageTransition!',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 12.0),
                const Text(
                  'This example will start off with the default one provided by MaterialPageRoute which will produce a known and common way of transitioning (navigating) form one page to another. Ultimately we want to have maximum freedom of how this transition will actually look like and behave! Give it a shot and see what kind of animations you can fit in there ;)',
                ),
                const SizedBox(height: 24.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                      /// TODO: maybe there is another Route we can use
                      /// here ;)
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const SecondPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) =>
                                SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(1, 1),
                            end: const Offset(0, 0),
                          )
                              .chain(CurveTween(curve: Curves.bounceIn))
                              .animate(animation),
                        ),
                      ),
                    ),
                    child: const Text('Navigate'),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 12.0,
        title: Column(
          children: [
            const Text('Second Page'),
            Text(
              'PageTransition',
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nice, you navigated!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12.0),
            const Text(
              'Play around with the different options you have when providing a Route object to either use the predefined ones (like Material) or make your own and create your own animation for that!',
            ),
          ],
        ),
      ),
    );
  }
}
