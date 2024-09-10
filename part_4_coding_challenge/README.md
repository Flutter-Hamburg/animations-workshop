# Kata: Flutter Animations - Coding Challenges

After working on different animation approaches throughout our workshop series, it is time to make use of the gained knowledge and put it to test!

## examples

We have three challenges for you to solve, to make it fair we don't publish them here before the workshop starts.

You will see the challenges live on screen and will have to solve them one by one.

## Starter Code for the Challenges

### Challenge 1

```dart
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );


    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
```

### Challenge 2

```dart
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // reverse the animation
        Future.delayed(Duration(seconds: 1), () => _controller.reverse());
      }
      if (status == AnimationStatus.dismissed) {
        // forward the animation
        Future.delayed(Duration(seconds: 1), () => _controller.forward());
      }
    });
```

### Challenge 3

```dart
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentPage == 3) {
        _currentPage = 1;
      } else {
        _currentPage++;
      }
      setState(() {});
    });
```
