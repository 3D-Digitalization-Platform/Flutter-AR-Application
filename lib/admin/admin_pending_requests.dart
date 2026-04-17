import 'package:flutter/material.dart';

class PendingRequestsScreen extends StatelessWidget {
  const PendingRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> companies = [
      {
        "name": "Cuong Duyen Ceramics",
        "email": "Cuong.Duyen@gmail.com",
        "logo": "assets/logos/company1.png"
      },
      {
        "name": "Ikea",
        "email": "Ikea@gmail.com",
        "logo": "assets/logos/company2.png"
      },
      {
        "name": "Porsche",
        "email": "Porsche@gmail.com",
        "logo": "assets/logos/company3.png"
      },
      {
        "name": "Aston Martin",
        "email": "Aston.Martin@gmail.com",
        "logo": "assets/logos/company4.png"
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFE9EDF3),

      /// 🔹 AppBar
      appBar: AppBar(
        backgroundColor: const Color(0xFFE9EDF3),
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        centerTitle: true,
        title: const Text(
          "Company Requests",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.menu, color: Colors.black),
          )
        ],
      ),

      /// 🔹 Body
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16),
        itemCount: companies.length,
        itemBuilder: (context, index) {
          final company = companies[index];

          return CompanyCard(
            name: company["name"]!,
            email: company["email"]!,
            logo: company["logo"]!,
            onDetailsTap: () {
              // TODO: Navigate to details screen
            },
          );
        },
      ),

      /// 🔹 Bottom Nav (same as previous screen)
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A8ECF), Color(0xFF8AA6D9)],
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.home, color: Colors.white),
            Icon(Icons.shopping_cart, color: Colors.white),
            Icon(Icons.shield, color: Colors.white),
            Icon(Icons.search, color: Colors.white),
            Icon(Icons.person, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
class CompanyCard extends StatelessWidget {
  final String name;
  final String email;
  final String logo;
  final VoidCallback onDetailsTap;

  const CompanyCard({
    super.key,
    required this.name,
    required this.email,
    required this.logo,
    required this.onDetailsTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [

          /// 🔹 Logo
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(logo),
          ),

          const SizedBox(width: 16),

          /// 🔹 Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(
                    color: Colors.blueGrey.shade400,
                  ),
                ),
                const SizedBox(height: 12),

                /// 🔹 Details Button
                SizedBox(
                  height: 36,
                  child: ElevatedButton(
                    onPressed: onDetailsTap,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5E8FD6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: const Text("Details"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}