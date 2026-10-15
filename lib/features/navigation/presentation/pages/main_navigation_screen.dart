import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_app/core/responsive/app_breakpoints.dart';
import 'package:real_estate_app/features/home/data/datasources/property_remote_data_source_impl.dart';
import 'package:real_estate_app/features/home/data/repositories/property_repository_impl.dart';
import 'package:real_estate_app/features/home/domain/usecases/get_featured_properties.dart';
import 'package:real_estate_app/features/home/presentation/cubit/property_cubit.dart';
import 'package:real_estate_app/features/home/presentation/pages/home_screen.dart';
import 'package:real_estate_app/features/navigation/presentation/pages/profile_screen.dart';
import 'package:real_estate_app/features/navigation/presentation/pages/saved_screen.dart';
import 'package:real_estate_app/features/navigation/presentation/pages/search_screen.dart';
import 'package:real_estate_app/features/navigation/presentation/widgets/app_bottom_nav_bar.dart';
import 'package:real_estate_app/features/navigation/presentation/widgets/app_side_nav_bar.dart';

class MainNavigationScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int currentIndex = 0;
  final List<Widget> screen = [
    const HomeScreen(),
    const SearchScreen(),
    const SavedScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isMobile = width < AppBreakpoints.mobile;
    return BlocProvider(
      create: (_) => PropertyCubit(
        GetFeaturedProperties(
          PropertyRepositoryImpl(PropertyRemoteDataSourceImpl()),
        ),
      )..loadFeaturedProperties(),
      child: Scaffold(
        body: isMobile
            ? IndexedStack(index: currentIndex, children: screen)
            : Row(
                children: [
                  AppSideNavBar(
                    currentIndex: currentIndex,
                    onTap: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  Expanded(
                    child: IndexedStack(index: currentIndex, children: screen),
                  ),
                ],
              ),
        bottomNavigationBar: isMobile
            ? AppBottomNavBar(
                currentIndex: currentIndex,
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              )
            : null,
      ),
    );
  }
}
