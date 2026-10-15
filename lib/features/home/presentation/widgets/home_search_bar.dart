import 'package:flutter/material.dart';
import 'package:real_estate_app/core/constants/sizes.dart';
import 'package:real_estate_app/core/constants/text_style.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.all(AppSizes.lg),
      height: 56,

      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSizes.md),
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            offset: const Offset(0, 4),
            color: Colors.black.withValues(alpha: 0.08),
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: AppSizes.md),

          Icon(Icons.search_rounded, color: colorScheme.primary, size: 24),

          const SizedBox(width: AppSizes.sm),

          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search properties...',
                hintStyle: AppTextStyles.body.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),

          IconButton(
            onPressed: () {},
            icon: Icon(Icons.tune_rounded, color: colorScheme.primary),
          ),

          const SizedBox(width: AppSizes.xs),
        ],
      ),
    );
  }
}
