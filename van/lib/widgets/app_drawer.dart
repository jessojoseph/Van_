import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: AppConstants.forestGradient,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.nature_people,
                    size: 30,
                    color: AppConstants.primaryColor,
                  ),
                ),
                const SizedBox(height: AppConstants.paddingSmall),
                Text(
                  AppConstants.appName,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Version ${AppConstants.appVersion}',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onPrimary.withAlpha(204),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.forest, color: AppConstants.primaryColor),
            title: const Text('Forest Home'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.nature_people, color: AppConstants.leafGreen),
            title: const Text('Explorer Profile'),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to profile screen
            },
          ),
          ListTile(
            leading: Icon(Icons.eco, color: AppConstants.mossGreen),
            title: const Text('Nature Settings'),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to settings screen
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(Icons.help_outline, color: AppConstants.earthBrown),
            title: const Text('Forest Guide'),
            onTap: () {
              Navigator.pop(context);
              // TODO: Navigate to help screen
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline, color: AppConstants.accentColor),
            title: const Text('About Forest VAN'),
            onTap: () {
              Navigator.pop(context);
              _showAboutDialog(context);
            },
          ),
        ],
      ),
    );
  }

  void _showAboutDialog(BuildContext context) {
    showAboutDialog(
      context: context,
      applicationName: AppConstants.appName,
      applicationVersion: AppConstants.appVersion,
      applicationIcon: const Icon(Icons.flutter_dash),
      children: [
        const Text('A Flutter application built following official documentation best practices.'),
      ],
    );
  }
}
