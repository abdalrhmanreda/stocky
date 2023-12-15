import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:project1/core/cubit/app_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Stocky'),
            actions: [
              IconButton(
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  icon: const Icon(Icons.exit_to_app)),
            ],
            //AppBar
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: AppCubit.get(context).currentIndex,
              onTap: (index) {
                AppCubit.get(context).changeNav(index);
              },
              iconSize: 25,
              selectedItemColor: Colors.orange,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(IconlyBroken.home), label: "*"),
                BottomNavigationBarItem(
                    icon: Icon(IconlyBroken.buy), label: "*"),
                BottomNavigationBarItem(
                    icon: Icon(IconlyBroken.profile), label: "*"),
              ]),
          body:
              AppCubit.get(context).screen[AppCubit.get(context).currentIndex],
        );
      },
    );
  }
}
