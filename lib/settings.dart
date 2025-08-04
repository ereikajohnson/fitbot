import 'package:flutter/material.dart';

class settingss extends StatelessWidget {
  const settingss({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 230, 99, 99),
              Color.fromARGB(255, 54, 123, 179),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              _buildSettingsSection(
                title: "Account",
                children: [
                  _buildSettingsTile(
                    icon: Icons.person,
                    title: "Profile",
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.lock,
                    title: "Privacy & Security",
                    onTap: () {},
                  ),
                ],
              ),
              
              
              _buildSettingsSection(
                title: "Preferences",
                children: [
                  _buildSettingsTile(
                    icon: Icons.notifications,
                    title: "Notifications",
                    trailing: Switch(value: true, onChanged: (val) {}),
                  ),
                  _buildSettingsTile(
                    icon: Icons.dark_mode,
                    title: "Dark Mode",
                    trailing: Switch(value: false, onChanged: (val) {}),
                  ),
                ],
              ),
              
              
              _buildSettingsSection(
                title: "Support",
                children: [
                  _buildSettingsTile(
                    icon: Icons.help_center,
                    title: "Help Center",
                    onTap: () {},
                  ),
                  _buildSettingsTile(
                    icon: Icons.description,
                    title: "Terms & Conditions",
                    onTap: () {},
                  ),
                ],
              ),
              
              
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsSection({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16.0, bottom: 8.0, left: 8.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: children,
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: trailing,
      onTap: onTap,
    );
  }
}