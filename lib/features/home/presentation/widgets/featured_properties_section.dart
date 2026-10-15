import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:real_estate_app/core/constants/sizes.dart';
import 'package:real_estate_app/core/responsive/app_breakpoints.dart';
import 'package:real_estate_app/features/home/presentation/cubit/property_cubit.dart';
import 'package:real_estate_app/features/home/presentation/cubit/property_state.dart';
import 'package:real_estate_app/features/home/presentation/widgets/featured_property_card.dart';

class FeaturedPropertiesSection extends StatelessWidget {
  const FeaturedPropertiesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(AppSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Properties',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: AppSizes.md),
          BlocBuilder<PropertyCubit, PropertyState>(
            builder: (context, state) {
              if (state is PropertyLoading) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppSizes.xl),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (state is PropertyError) {
                return Center(
                  child: Text(
                    'Unable to load properties: ${state.message}',
                    textAlign: TextAlign.center,
                  ),
                );
              }

              if (state is PropertyLoaded) {
                if (state.properties.isEmpty) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(AppSizes.xl),
                      child: Text('No properties available yet.'),
                    ),
                  );
                }

                return LayoutBuilder(
                  builder: (context, constraints) {
                    final width = constraints.maxWidth;

                    final columns = width >= AppBreakpoints.tablet
                        ? 3
                        : width >= AppBreakpoints.mobile
                        ? 2
                        : 1;

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.properties.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: AppSizes.md,
                        mainAxisSpacing: AppSizes.md,
                        mainAxisExtent: 430,
                      ),
                      itemBuilder: (context, index) {
                        final property = state.properties[index];

                        return FeaturedPropertyCard(
                          imageUrl: property.imageUrls.isNotEmpty
                              ? property.imageUrls.first
                              : '',
                          name: property.title,
                          location: property.location,
                          price: property.price.toString(),
                          bedrooms: property.bedrooms,
                          bathrooms: property.bathrooms,
                          area: '${property.area} sq ft',
                        );
                      },
                    );
                  },
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
