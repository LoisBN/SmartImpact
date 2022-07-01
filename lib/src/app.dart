import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartimpact/src/cubit/auth_cubit.dart';
import 'package:smartimpact/src/cubit/navigation_cubit.dart';
import 'package:smartimpact/src/views/auth/auth.dart';
import 'package:smartimpact/src/views/home/home.dart';
import 'package:smartimpact/src/views/stats/stats.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Color.fromARGB(255, 20, 20, 20),
        brightness: Brightness.dark,
        accentColor: Colors.red,
        primarySwatch: Colors.red,
      ),
      home: const _AppWrapper(),
    );
  }
}

class _AppWrapper extends StatelessWidget {
  const _AppWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
      ],
      child: BlocBuilder<AuthCubit, AuthState>(
        buildWhen: (previous, current) =>
            previous != current &&
            !(previous is AuthInitial && current is AuthFailed),
        builder: (context, state) => PageTransitionSwitcher(
          transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
              FadeThroughTransition(
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          ),
          child: display(state),
        ),
      ),
    );
  }

  Widget display(AuthState authState) {
    if (authState is AuthSuccess) {
      return _AppDisplay();
    } else {
      return const AuthView();
    }
  }
}

class _AppDisplay extends StatelessWidget {
  final PageController _pageController = PageController();
  int page = 0;
  _AppDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        child: BlocConsumer<NavigationCubit, NavigationState>(
      listener: (context, state) {
        if (page != state.index) {
          _pageController.animateToPage(state.index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOutQuad);
        }
      },
      builder: (context, state) => Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.index,
            onTap: (index) {
              page = index;
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOutQuad);
              context.read<NavigationCubit>().navigateTo(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "Acceuil"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.stacked_bar_chart), label: "Statistiques")
            ]),
        body: SizedBox(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              page = index;
              context.read<NavigationCubit>().navigateTo(index);
            },
            children: const [Home(), Stats()],
          ),
        ),
      ),
    ));
  }
}
