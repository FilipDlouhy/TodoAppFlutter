import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_todo_app/providers/category_provider.dart';
import 'package:flutter_riverpod_todo_app/utils/utils.dart';
import 'package:flutter_riverpod_todo_app/widgets/widgets.dart';
import 'package:gap/gap.dart';

class CategoriesSelection extends ConsumerWidget {
  const CategoriesSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final List<TaskCategory> categories = TaskCategory.values.toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Choose Category',
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: context.colorScheme.onBackground,
          ),
        ),
        const Gap(10),
        SizedBox(
          height: 80, // Increased height for larger icons
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (ctx, index) {
              final category = categories[index];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0),
                child: GestureDetector(
                  onTap: () {
                    ref.read(categoryProvider.notifier).state = category;
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: category.color.withOpacity(0.2),
                        child: Icon(
                          category.icon,
                          color: selectedCategory == category
                              ? context.colorScheme.primary
                              : category.color.withOpacity(0.6),
                          size: 30, // Increased icon size
                        ),
                      ),
                      const Gap(6),
                      Text(
                        category.name, // Added category name under the icon
                        style: context.textTheme.bodySmall?.copyWith(
                          color: selectedCategory == category
                              ? context.colorScheme.primary
                              : category.color.withOpacity(0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
