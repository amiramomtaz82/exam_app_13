import 'package:exam_app_13/features/result/presentation/view/result_screen.dart';
import 'package:exam_app_13/features/result/presentation/view_model/result_cubit.dart';
import 'package:exam_app_13/features/result/presentation/view_model/result_event.dart';
import 'package:exam_app_13/features/subject/presentation/view/subject_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../config/di/di.dart';
import '../subject/presentation/view_model/subject_cubit.dart';
import '../subject/presentation/view_model/subject_event.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final screens =  [
    BlocProvider(
      create: (_) => getIt<SubjectCubit>()
        ..doEvents(const GetAllSubjectsEvent()),
      child: const SubjectScreen(),
    ),

    BlocProvider(
      create: (_) => getIt<ResultCubit>()..doEvents(const GetAllResultsEvent()),
      child: const ResultScreen(),
    ),
    const Text("profile"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],

      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_outlined),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.assignment_outlined),
            selectedIcon: Icon(Icons.assignment_outlined),
            label: 'Result',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}