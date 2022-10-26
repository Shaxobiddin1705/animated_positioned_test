import 'package:animated_positioned_text/pages/widgets/bottom_bar.dart';
import 'package:animated_positioned_text/pages/widgets/side_bar.dart';
import 'package:animated_positioned_text/pages/widgets/upper_bar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  bool isLeftCollapsed = true;
  bool isRightCollapsed = true;
  bool isTopCollapsed = true;
  bool isBottomCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          const UpperBarWidget(),
          const SidebarWidget(),
          const BottomBarWidget(),
          AnimatedPositioned(
              curve: Curves.decelerate,
              left: isLeftCollapsed ? 0 : 0.5 * screenWidth,
              right: isRightCollapsed ? 0 : -0.2 * screenWidth,
              top: isTopCollapsed ? 0 : 0.1 * screenHeight,
              bottom: isBottomCollapsed ? 0 : 0.1 * screenHeight,
              duration: duration,
              child: dashboard(context)),
        ],
      ),
    );
  }

  Widget dashboard(context) {
    return SafeArea(
      child: Material(
        type: MaterialType.card,
        animationDuration: duration,
        elevation: 8,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('MarketWatch'),
            actions: [
              IconButton(
                icon: isTopCollapsed
                    ? const Icon(Icons.keyboard_arrow_down_outlined, size: 40, color: Colors.white)
                    : const Icon(Icons.keyboard_arrow_up_outlined, size: 40, color: Colors.white),
                onPressed: () {
                  setState(() {
                    isTopCollapsed ? _controller.forward() : _controller.reverse();
                    isTopCollapsed = !isTopCollapsed;
                  });
                },
              )
            ],
            leading: IconButton(
                icon: isLeftCollapsed ? const Icon(Icons.menu) : const Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    if (isLeftCollapsed) {
                      _controller.forward();
                    } else {
                      _controller.reverse();
                    }
                    isTopCollapsed = !isTopCollapsed;
                    isLeftCollapsed = !isLeftCollapsed;
                    isBottomCollapsed = !isBottomCollapsed;
                  });
                }),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                isBottomCollapsed ? _controller.forward() : _controller.reverse();
                isBottomCollapsed = !isBottomCollapsed;
              });
            },
            child: isBottomCollapsed
                ? const Icon(Icons.keyboard_arrow_up_outlined, size: 40)
                : const Icon(Icons.keyboard_arrow_down_outlined, size: 40),
          ),
        ),
      ),
    );
  }

}
