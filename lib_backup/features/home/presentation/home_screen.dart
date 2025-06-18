import 'package:auvnet_flutter_internship/core/Helper/app_colors.dart';
import 'package:auvnet_flutter_internship/core/Helper/app_dimens.dart';
import 'package:auvnet_flutter_internship/core/Helper/asset_helper.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/bloc/auth_event.dart';
import 'package:auvnet_flutter_internship/features/auth/presentation/bloc/auth_state.dart';
import 'package:auvnet_flutter_internship/features/home/presentation/widgets/code_banner.dart';
import 'package:auvnet_flutter_internship/features/home/presentation/widgets/home_header.dart';
import 'package:auvnet_flutter_internship/features/home/presentation/widgets/promotional_banner.dart';
import 'package:auvnet_flutter_internship/features/home/presentation/widgets/restaurant_item.dart';
import 'package:auvnet_flutter_internship/features/home/presentation/widgets/service_item.dart';
import 'package:auvnet_flutter_internship/features/home/presentation/widgets/shortcut_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    String userName = 'Hi hepa!';

    if (authState is Authenticated) {}

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          HomeHeader(userName: userName),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.all(AppDimens.paddingLarge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Services:',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: AppDimens.spaceMedium),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ServiceItem(
                            iconPath: Assets.food,
                            title: 'Food',
                            subtitle: 'Up to 50%',
                          ),
                          ServiceItem(
                            iconPath: Assets.health,
                            title: 'Health & wellness',
                            subtitle: '20mins',
                          ),
                          ServiceItem(
                            iconPath: Assets.groceries,
                            title: 'Groceries',
                            subtitle: '15 mins',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppDimens.paddingLarge),
                  child: CodeBanner(
                    iconPath: Assets.security,
                    title: 'Got a code !',
                    description: 'Add your code and save on your order',
                  ),
                ),
                const SizedBox(height: AppDimens.spaceLarge),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppDimens.paddingLarge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Shortcuts:',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: AppDimens.spaceMedium),
                      ShortcutList(),
                    ],
                  ),
                ),
                const SizedBox(height: AppDimens.spaceLarge),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppDimens.paddingLarge),
                  child: PromotionalBanner(
                    imagePath: Assets.made_with,
                  ),
                ),
                const SizedBox(height: AppDimens.spaceLarge),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppDimens.paddingLarge),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Popular restaurants nearby',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                      ),
                      SizedBox(height: AppDimens.spaceMedium),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            RestaurantItem(
                              imagePath: Assets.beirot,
                              name: 'Alio Beirut',
                              time: '32 mins',
                            ),
                            RestaurantItem(
                              imagePath: Assets.lafa,
                              name: 'Laffah',
                              time: '38 mins',
                            ),
                            RestaurantItem(
                              imagePath: Assets.falafel,
                              name: 'Falafil Al Rabiah Al kha...',
                              time: '44 mins',
                            ),
                            RestaurantItem(
                              imagePath: Assets.brbr,
                              name: 'Barbar',
                              time: '34 mins',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppDimens.spaceLarge * 2),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryPurple,
        unselectedItemColor: AppColors.textGrey,
        backgroundColor: Colors.white,
        currentIndex: 0,
        onTap: (index) {
          if (index == 4) {
            context.read<AuthBloc>().add(LogoutRequested());
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining),
            label: 'deliver',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
