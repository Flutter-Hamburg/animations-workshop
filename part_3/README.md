# Kata: Flutter Animations - Driven Animations

This time we will make use of external factors which will provide a value to derive animation from. Either because we get animation values directly to make use of or make use of the fact that we can listen to value changes which we then use to drive our own animation. Typical use cases for this are page transitions (navigation) and scrolling. Both are actions which have start and end points which also produce values to listen to and act on.

We will start easy by making use of what we learned so far (or already know from animations in general) to define our own `PageTransition`, will then play around with the capabilities of the `Hero` widget and ultimately make use of scrolling as the source of animation value!

We used `timeDilation` in each `main` method to slow down the animation. This makes it easier to copy and actually see the animation you are implementing. Feel free to change the value or get fully rid of it if you want to tweak the final result!

## page_transition.dart

https://github.com/user-attachments/assets/04e5a60f-1ac3-41ef-a11b-803420ce822e

A page transition is a great way to talk about animations because the default behaviour we know of transitioning from one page to another is very often a animation. Especially on mobile apps we know this "swift" motion the pages do when transitioning. Instead of the default behaviour which often comes from MaterialPageRoute, let's try our own!

Requirements:

- When pushing a new page, we want the new page to appear from the bottom and fill our viewport
- The background should get a little bit dimmer over time

In `page_transition.dart` you will find a skeleton with TODO comments to go through.

Suggested steps:

1. Check where the transition currently takes place and how the "default" code looks like
2. See what alternatives we have from the framework already to build our own - https://docs.flutter.dev/reference/widgets (look for PageRoute in the name)
3. Play around with the different animation styles we used so far! (Tip: \*Transition widgets are good for that)

## hero.dart

https://github.com/user-attachments/assets/eafa62fe-2e20-47f7-b7b3-2a1e093b9d85

Also part of page transitions: the Hero widget! You might know this one already, but have you used it extensively? This widget is used to animate a "fly-over" of an existing widget on one page to the same widget on the new page while transitioning between pages. Combined with a custom PageTransition (but already with the default one), this can create cool animations for the user to grasp and allows to shift the focus on the specific elements in your app!

Requirements:

- When pushing a new page, the widget has to fly-over to it's new position on the new page
- Try to copy the widget changes along the fly-over (color, rotation etc.)

In `hero.dart` you will find a skeleton with TODO comments to go through.

Suggested steps:

1. First implement the `Hero` widget properly - in it's current state it does nothing!
2. Discover the capabilities of the `Hero` widget and see what you could make use of! (Tip: `flightShuttleBuilder` property could be useful here)
3. Check the default implementation of the shuttle builder in the source code of Flutter (usually with CTRL/CMD + Left Click on the `Hero` widget) - the implementation can help you to build your own!

## scrolling.dart

https://github.com/user-attachments/assets/17d3aa8e-a2b2-4ebc-858d-76acb16773ac

Now let's use something else to animate on: scrolling! This is a cool trigger as this is something a user will do naturally to navigate the content of the app. Listening to the change of the scrolling element (like `ListView`) enables us to act on that and drive animations!

In this first exercise, we want to show the user some kind of "progress" of the content they scroll on (often seen on blog article websites).

Requirements:

- When scrolling, a progressbar shows the amount of content which has already been scrolled over

In `scrolling.dart` you will find a skeleton with TODO comments to go through.

Suggested steps:

1. Check the lonely `_controller` attribute - where can it be used? How can it be correctly initialised?
2. Check which information you can access from the `_controller` property and what could be useful for you
3. Make use of a widget which is able to show the progress and use the values of the `_controller`!

## scrolling_items.dart

https://github.com/user-attachments/assets/1233c5e4-1439-4921-9733-bfe158db10aa

NOTE: extra, more difficult challenge!

This one can be very useful and cool, although a bit more complicated to implement. To make the scrolling content more engaging and special, we can animate the elements coming into view while scrolling. Combined with other design elements of an app, this can give you a lot of design freedom and possibilities to make your app more unique!

Requirements:

- When scrolling, the new items at the bottom will be animated
- Depending on how much they have been scrolled, their state will change (more opacity, position etc.)

In `scrolling_items.dart` you will find a skeleton with TODO comments to go through.

Suggested steps:

1. Use the knowledge you have gained from the previous scrolling exercise to make the most of the information from the `\_controller``
2. Find out how to get the position of a widget on your screen (Tip: findRenderObject - google might help here)
3. Do the math thing: based on the position of an element and the dimensions of the scroll content, you can calculate an animation state!
