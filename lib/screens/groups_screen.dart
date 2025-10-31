import 'package:flutter/material.dart';

class GroupsScreen extends StatelessWidget {
  const GroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Server Groups',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Select a group of servers to connect to',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: const [
                  _ServerGroupCard(
                    title: 'North America',
                    serverCount: 42,
                    flag: '🇺🇸',
                    color: Colors.blue,
                  ),
                  _ServerGroupCard(
                    title: 'Europe',
                    serverCount: 38,
                    flag: '🇪🇺',
                    color: Colors.green,
                  ),
                  _ServerGroupCard(
                    title: 'Asia Pacific',
                    serverCount: 27,
                    flag: '🌏',
                    color: Colors.orange,
                  ),
                  _ServerGroupCard(
                    title: 'South America',
                    serverCount: 15,
                    flag: '🌎',
                    color: Colors.red,
                  ),
                  _ServerGroupCard(
                    title: 'Africa',
                    serverCount: 12,
                    flag: '🌍',
                    color: Colors.purple,
                  ),
                  _ServerGroupCard(
                    title: 'Middle East',
                    serverCount: 9,
                    flag: '🕌',
                    color: Colors.teal,
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

class _ServerGroupCard extends StatelessWidget {
  final String title;
  final int serverCount;
  final String flag;
  final Color color;

  const _ServerGroupCard({
    required this.title,
    required this.serverCount,
    required this.flag,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          // Handle group selection
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        flag,
                        style: const TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '$serverCount servers',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}