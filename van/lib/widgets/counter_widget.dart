import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: AppConstants.animationDuration,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut,
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
      _animationController.forward().then((_) {
        _animationController.reverse();
      });
    }
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Padding(
      padding: const EdgeInsets.all(AppConstants.paddingMedium),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(AppConstants.paddingLarge),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.eco,
                        color: AppConstants.primaryColor,
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Forest Seeds Planted',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: AppConstants.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.local_florist,
                        color: AppConstants.accentColor,
                        size: 24,
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConstants.paddingMedium),
                  AnimatedBuilder(
                    animation: _scaleAnimation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _scaleAnimation.value,
                        child: Text(
                          '$_counter',
                          style: theme.textTheme.displayLarge?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppConstants.paddingLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: _decrementCounter,
                heroTag: 'decrement',
                tooltip: 'Remove Tree',
                backgroundColor: AppConstants.earthBrown,
                child: const Icon(Icons.remove, color: Colors.white),
              ),
              FloatingActionButton.extended(
                onPressed: _resetCounter,
                heroTag: 'reset',
                tooltip: 'Clear Forest',
                backgroundColor: AppConstants.mossGreen,
                label: const Text('Clear Forest', style: TextStyle(color: Colors.white)),
                icon: const Icon(Icons.refresh, color: Colors.white),
              ),
              FloatingActionButton(
                onPressed: _incrementCounter,
                heroTag: 'increment',
                tooltip: 'Plant Tree',
                backgroundColor: AppConstants.primaryColor,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
