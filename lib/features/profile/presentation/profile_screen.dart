import 'package:flutter/material.dart';
import 'package:life_medicals/core/theme/color_schemes.dart';
import 'package:life_medicals/core/size/size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: kBlackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            kHeight(20),
            // Profile Header Section
            _buildProfileHeader(context),
            kHeight(20),

            // Menu Items
            _buildMenuSection(context),
            kHeight(80), // Space for bottom navigation
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Profile Picture
          Stack(
            children: [
              CircleAvatar(
                radius: 45,
                backgroundColor: kPrimaryColor.withOpacity(0.1),
                child: const Icon(
                  Icons.person,
                  size: 45,
                  color: kPrimaryColor,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.camera_alt,
                    size: 14,
                    color: kWhiteColor,
                  ),
                ),
              ),
            ],
          ),
          kHeight(16),

          // User Name
          const Text(
            'John Doe',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: kBlackColor,
            ),
          ),
          kHeight(6),

          // User Contact
          Text(
            'johndoe@example.com',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          kHeight(4),
          Text(
            '+91 9876543210',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          kHeight(16),

          // Edit Profile Button
          OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: kPrimaryColor,
              side: const BorderSide(color: kPrimaryColor),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: const Icon(Icons.edit, size: 18),
            label: const Text(
              'Edit Profile',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          // Single consolidated menu card
          Container(
            decoration: BoxDecoration(
              color: kWhiteColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                _buildSimpleMenuItem(
                  icon: Icons.shopping_bag_outlined,
                  title: 'My Orders',
                  onTap: () {},
                ),
                _buildDivider(),
                _buildSimpleMenuItem(
                  icon: Icons.favorite_border,
                  title: 'Wishlist',
                  onTap: () {},
                ),
                _buildDivider(),
                _buildSimpleMenuItem(
                  icon: Icons.location_on_outlined,
                  title: 'Addresses',
                  onTap: () {},
                ),
                _buildDivider(),
                _buildSimpleMenuItem(
                  icon: Icons.payment_outlined,
                  title: 'Payment Methods',
                  onTap: () {},
                ),
                _buildDivider(),
                _buildSimpleMenuItem(
                  icon: Icons.receipt_outlined,
                  title: 'Prescriptions',
                  onTap: () {},
                ),
                _buildDivider(),
                _buildSimpleMenuItem(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                  onTap: () {},
                ),
                _buildDivider(),
                _buildSimpleMenuItem(
                  icon: Icons.settings_outlined,
                  title: 'Settings',
                  onTap: () {},
                ),
              ],
            ),
          ),
          kHeight(16),

          // Logout Button
          InkWell(
            onTap: () => _showLogoutDialog(context),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.withOpacity(0.2)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.logout, color: Colors.red, size: 20),
                  kWidth(8),
                  const Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpleMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: kPrimaryColor,
            ),
            kWidth(16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: kBlackColor,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 24,
              color: Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey[200],
      indent: 56,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Perform logout
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: kWhiteColor,
            ),
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
