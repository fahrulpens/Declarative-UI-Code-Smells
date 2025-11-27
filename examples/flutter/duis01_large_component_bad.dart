import 'package:flutter/material.dart';

/// DUIS-01 – Monolithic UI Component (God / Large Component)
/// - Too many responsibilities in a single widget:
///   layout + state + business logic + navigation.
class MonolithicDashboardScreen extends StatefulWidget {
  const MonolithicDashboardScreen({super.key});

  @override
  State<MonolithicDashboardScreen> createState() =>
      _MonolithicDashboardScreenState();
}

class _MonolithicDashboardScreenState extends State<MonolithicDashboardScreen> {
  int _selectedTab = 0;
  String _username = "";
  bool _isLoading = false;
  List<String> _items = [];

  Future<void> _loadData() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 1)); // fake API call
    setState(() {
      _items = List.generate(50, (i) => "Item #$i");
      _isLoading = false;
    });
  }

  bool _isPrime(int n) {
    if (n < 2) return false;
    for (var i = 2; i * i <= n; i++) {
      if (n % i == 0) return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello $_username"),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: _loadData),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                TextField(
                  decoration: const InputDecoration(labelText: "Username"),
                  onChanged: (v) => setState(() => _username = v.trim()),
                ),
                Text(
                  _isPrime(_items.length)
                      ? "Number of items is prime"
                      : "Number of items is not prime",
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (_, i) => ListTile(
                      title: Text(_items[i]),
                      onTap: () {
                        // navigation logic here as well
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                DetailScreen(item: _items[i]), // another UI
                          ),
                        );
                      },
                    ),
                  ),
                ),
                BottomNavigationBar(
                  currentIndex: _selectedTab,
                  onTap: (i) => setState(() => _selectedTab = i),
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Home"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings), label: "Settings"),
                  ],
                ),
              ],
            ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String item;
  const DetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(item)),
      body: Center(child: Text("Detail of $item")),
    );
  }
}
