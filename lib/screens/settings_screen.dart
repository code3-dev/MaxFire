import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView(
                children: const [
                  _SettingsSection(
                    title: 'General',
                    children: [
                      _SettingsTile(
                        title: 'Auto-connect',
                        subtitle: 'Automatically connect to VPN on startup',
                        leadingIcon: Icons.power_settings_new,
                      ),
                      _SettingsTile(
                        title: 'Notifications',
                        subtitle: 'Show connection status notifications',
                        leadingIcon: Icons.notifications,
                      ),
                      _SettingsTile(
                        title: 'Dark Mode',
                        subtitle: 'Enable dark theme',
                        leadingIcon: Icons.dark_mode,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  _SettingsSection(
                    title: 'Security',
                    children: [
                      _SettingsTile(
                        title: 'Kill Switch',
                        subtitle: 'Block internet if VPN disconnects',
                        leadingIcon: Icons.security,
                      ),
                      _SettingsTile(
                        title: 'DNS Leak Protection',
                        subtitle: 'Prevent DNS queries from leaking',
                        leadingIcon: Icons.dns,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  _SettingsSection(
                    title: 'Connection',
                    children: [
                      _SettingsTile(
                        title: 'Protocol',
                        subtitle: 'Vless (Recommended)',
                        leadingIcon: Icons.swap_horiz,
                      ),
                      _SettingsTile(
                        title: 'Port',
                        subtitle: 'Automatic',
                        leadingIcon: Icons.settings_ethernet,
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  _SettingsSection(
                    title: 'Advanced',
                    children: [
                      _SettingsTile(
                        title: 'IPv6',
                        subtitle: 'Enable IPv6 support',
                        leadingIcon: Icons.network_wifi,
                      ),
                      _SettingsTile(
                        title: 'Custom DNS',
                        subtitle: 'Use custom DNS servers',
                        leadingIcon: Icons.dns,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _SettingsSection({
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: children
                .map((child) => Column(
                      children: [
                        child,
                        if (child != children.last)
                          const Divider(
                            height: 1,
                            indent: 72,
                            endIndent: 24,
                          ),
                      ],
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _SettingsTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leadingIcon;

  const _SettingsTile({
    required this.title,
    required this.subtitle,
    required this.leadingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          shape: BoxShape.circle,
        ),
        child: Icon(
          leadingIcon,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
      trailing: Switch(
        value: title == 'Dark Mode' ? false : true, // Default values
        onChanged: (value) {
          // Handle switch toggle
        },
      ),
    );
  }
}