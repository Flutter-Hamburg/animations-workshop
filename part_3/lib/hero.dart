import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

void main() {
  timeDilation = 50;
  runApp(const MainApp());
}

Widget _flightShuttle(
  BuildContext flightContext,
  Animation<double> animation,
  HeroFlightDirection flightDirection,
  BuildContext fromHeroContext,
  BuildContext toHeroContext,
) {
  final Hero toHero = toHeroContext.widget as Hero;

  const curveRotation = Curves.easeInOut;
  const curveStart = Curves.easeIn;
  const curveEnd = Curves.easeOut;

  const colorStart = Colors.black;
  const colorEnd = Colors.red;

  const scaleStart = 1.0;
  const scaleEnd = 0.7;

  return RotationTransition(
    turns: Tween(begin: 0.0, end: 2.0)
        .chain(CurveTween(curve: curveRotation))
        .animate(animation),
    child: DecoratedBoxTransition(
      decoration: TweenSequence([
        TweenSequenceItem(
          tween: DecorationTween(
            begin: BoxDecoration(
              color: colorStart,
              borderRadius: BorderRadius.circular(12.0),
            ),
            end: BoxDecoration(
              color: colorEnd,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ).chain(CurveTween(curve: curveStart)),
          weight: 50,
        ),
        TweenSequenceItem(
          tween: DecorationTween(
            begin: BoxDecoration(
              color: colorEnd,
              borderRadius: BorderRadius.circular(12.0),
            ),
            end: BoxDecoration(
              color: colorStart,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ).chain(CurveTween(curve: curveEnd)),
          weight: 50,
        ),
      ]).animate(animation),
      child: ScaleTransition(
        scale: TweenSequence([
          TweenSequenceItem(
            tween: Tween(
              begin: scaleStart,
              end: scaleEnd,
            ).chain(CurveTween(curve: curveStart)),
            weight: 50,
          ),
          TweenSequenceItem(
            tween: Tween(
              begin: scaleEnd,
              end: scaleStart,
            ).chain(CurveTween(curve: curveEnd)),
            weight: 50,
          ),
        ]).animate(animation),
        child: toHero.child,
      ),
    ),
  );
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
                  'Hero',
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
                const Center(
                  child: Hero(
                    tag: 'unique',
                    flightShuttleBuilder: _flightShuttle,
                    child: IconContainer(),
                  ),
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Show me the Hero!',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 12.0),
                const Text(
                  'We want to animate one element (which exists in both pages) to animate (fly-over) while we navigate to a new page! Depending on the page transition you have used, this can achieve very cool effects!',
                ),
                const SizedBox(height: 24.0),
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SecondPage(),
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
              'Hero',
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
              'Now make sure the Container is actually flying into the new page and looks similar to what you can see in the video example on github! You can also freely change the animation to whatever you want to try out, the example should just be a good starting point!',
            ),
            const SizedBox(height: 64.0),
            const Center(
              child: Hero(
                tag: 'unique',
                flightShuttleBuilder: _flightShuttle,
                child: IconContainer(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  const IconContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
