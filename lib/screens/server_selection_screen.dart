import 'package:flutter/material.dart';

class ServerSelectionScreen extends StatelessWidget {
  const ServerSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Server'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose a Server',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Select a server to connect to',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView(
                children: const [
                  _ServerListItem(
                    country: 'United States',
                    city: 'New York',
                    flag: '🇺🇸',
                    ping: '22ms',
                  ),
                  _ServerListItem(
                    country: 'United States',
                    city: 'Los Angeles',
                    flag: '🇺🇸',
                    ping: '58ms',
                  ),
                  _ServerListItem(
                    country: 'United Kingdom',
                    city: 'London',
                    flag: '🇬🇧',
                    ping: '87ms',
                  ),
                  _ServerListItem(
                    country: 'Germany',
                    city: 'Frankfurt',
                    flag: '🇩🇪',
                    ping: '92ms',
                  ),
                  _ServerListItem(
                    country: 'Japan',
                    city: 'Tokyo',
                    flag: '🇯🇵',
                    ping: '120ms',
                  ),
                  _ServerListItem(
                    country: 'Australia',
                    city: 'Sydney',
                    flag: '🇦🇺',
                    ping: '180ms',
                  ),
                  _ServerListItem(
                    country: 'Canada',
                    city: 'Toronto',
                    flag: '🇨🇦',
                    ping: '35ms',
                  ),
                  _ServerListItem(
                    country: 'France',
                    city: 'Paris',
                    flag: '🇫🇷',
                    ping: '105ms',
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

class _ServerListItem extends StatelessWidget {
  final String country;
  final String city;
  final String flag;
  final String ping;

  const _ServerListItem({
    required this.country,
    required this.city,
    required this.flag,
    required this.ping,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 1,
            ),
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
        title: Text(
          city,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(country),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            ping,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onTap: () {
          // Handle server selection
          Navigator.of(context).pop();
        },
      ),
    );
  }
}