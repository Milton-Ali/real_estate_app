import 'package:flutter/material.dart';

import 'package:real_estate_app/core/constants/sizes.dart';
import 'package:real_estate_app/core/constants/text_style.dart';
import 'package:real_estate_app/core/responsive/app_breakpoints.dart';
import 'package:real_estate_app/features/home/presentation/widgets/home_search_bar.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final width = MediaQuery.of(context).size.width;

    final isTablet =
        width >= AppBreakpoints.mobile && width < AppBreakpoints.tablet;

    return Container(
      width: double.infinity,
      height: isTablet ? 400 : 360,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(AppSizes.lg),
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/home/real_estate_header.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
          isTablet ? AppSizes.xl : AppSizes.lg,
          isTablet ? AppSizes.lg : AppSizes.md,
          isTablet ? AppSizes.xl : AppSizes.lg,
          AppSizes.xl,
        ),
        decoration: BoxDecoration(
          color: colorScheme.primary.withValues(alpha: 0.35),
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(AppSizes.lg),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section
            Row(
              children: [
                Icon(
                  Icons.home_rounded,
                  size: isTablet ? 32 : 28,
                  color: colorScheme.onPrimary,
                ),

                const SizedBox(width: AppSizes.sm),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'RealEstate',
                        style:
                            (isTablet
                                    ? AppTextStyles.heading
                                    : AppTextStyles.title)
                                .copyWith(color: colorScheme.onPrimary),
                      ),

                      Text(
                        'Find Your Dream Home',
                        style: AppTextStyles.caption.copyWith(
                          color: colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none_rounded,
                    size: isTablet ? 30 : 26,
                    color: colorScheme.onPrimary,
                  ),
                ),
              ],
            ),

            const Spacer(),

            // Greeting Section
            Text(
              'Hello, Milton 👋',
              style: (isTablet ? AppTextStyles.heading : AppTextStyles.heading)
                  .copyWith(
                    color: colorScheme.onPrimary,
                    fontSize: isTablet ? 32 : 28,
                  ),
            ),

            const SizedBox(height: AppSizes.xs),

            Text(
              'Find your perfect property today',
              style: AppTextStyles.body.copyWith(
                color: colorScheme.onPrimary,
                fontSize: isTablet ? 16 : 14,
              ),
            ),
            HomeSearchBar(),
          ],
        ),
      ),
    );
  }
}
