import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String nama =
        ModalRoute.of(context)!.settings.arguments as String? ?? "User";

    return Scaffold(
      // 🔥 APPBAR
      appBar: AppBar(
        title: const Text("Dashboard Tezza"),
        backgroundColor: Colors.deepPurple,

        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (route) => false,
              );
            },
          )
        ],
      ),

      // 🔥 BODY
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 🔥 WELCOME TEXT
            Center(
              child: Text(
                "Selamat datang, $nama",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // 🔥 CARD 
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const SizedBox(
                height: 60,
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              "Daftar Menu",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            // 🔥 LISTVIEW BUILDER
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: ListTile(
                      leading: const Icon(
                        Icons.circle,
                        color: Colors.black,
                        size: 10,
                      ),
                      title: Text("Menu ${index + 1}"),
                      subtitle: Text("Deskripsi menu ${index + 1}"),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}