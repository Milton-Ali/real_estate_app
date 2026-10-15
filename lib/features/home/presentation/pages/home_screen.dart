import 'package:flutter/material.dart';
import 'package:real_estate_app/core/responsive/app_breakpoints.dart';
import 'package:real_estate_app/features/home/presentation/widgets/featured_properties_section.dart';
import 'package:real_estate_app/features/home/presentation/widgets/home_header.dart';
import 'package:real_estate_app/features/home/presentation/widgets/home_search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            if (width >= AppBreakpoints.tablet) {
              return _buildDesktopLayout();
            }

            if (width >= AppBreakpoints.mobile) {
              return _buildTabletLayout();
            }

            return _buildMobileLayout();
          },
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [HomeHeader(), HomeSearchBar(), FeaturedPropertiesSection()],
      ),
    );
  }

  Widget _buildTabletLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [HomeHeader(), HomeSearchBar(), FeaturedPropertiesSection()],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [HomeHeader(), HomeSearchBar(), FeaturedPropertiesSection()],
      ),
    );
  }
}
