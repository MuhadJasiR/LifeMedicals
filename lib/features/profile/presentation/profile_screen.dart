import 'package:flutter/material.dart';
import 'package:life_medicals/core/theme/color_schemes.dart';
import 'package:life_medicals/core/size/size.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header Section
              _buildProfileHeader(context),
              kHeight(10),

              // Stats Cards
              _buildStatsSection(context),
              kHeight(20),

              // Menu Sections
              _buildMenuSection(context),
              kHeight(20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            kPrimaryColor,
            kPrimaryColor.withOpacity(0.8),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            // Profile Picture with Edit Button
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kWhiteColor, width: 3),
                  ),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundColor: kWhiteColor,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 18,
                      color: kPrimaryColor,
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
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: kWhiteColor,
              ),
            ),
            kHeight(6),

            // User Email/Phone
            const Text(
              '+91 9876543210',
              style: TextStyle(
                fontSize: 14,
                color: kWhiteColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            kHeight(4),
            const Text(
              'johndoe@example.com',
              style: TextStyle(
                fontSize: 13,
                color: kWhiteColor,
                fontWeight: FontWeight.w300,
              ),
            ),
            kHeight(20),

            // Edit Profile Button
            ElevatedButton.icon(
              onPressed: () {
                // Navigate to edit profile
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kWhiteColor,
                foregroundColor: kPrimaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
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
      ),
    );
  }

  Widget _buildStatsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: _buildStatCard(
              icon: Icons.shopping_bag_outlined,
              count: '12',
              label: 'Orders',
              color: kPrimaryColor,
            ),
          ),
          kWidth(12),
          Expanded(
            child: _buildStatCard(
              icon: Icons.favorite_border,
              count: '8',
              label: 'Wishlist',
              color: Colors.red,
            ),
          ),
          kWidth(12),
          Expanded(
            child: _buildStatCard(
              icon: Icons.receipt_long_outlined,
              count: '₹450',
              label: 'Wallet',
              color: kYellowColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String count,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 28),
          kHeight(8),
          Text(
            count,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          kHeight(4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: kGreyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Account Section
          _buildSectionTitle('Account'),
          kHeight(10),
          _buildMenuCard(
            context,
            items: [
              _MenuItem(
                icon: Icons.location_on_outlined,
                title: 'My Addresses',
                subtitle: 'Manage delivery addresses',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.payment_outlined,
                title: 'Payment Methods',
                subtitle: 'Saved cards & UPI',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.local_offer_outlined,
                title: 'Coupons & Offers',
                subtitle: 'Available discounts',
                onTap: () {},
              ),
            ],
          ),
          kHeight(20),

          // Orders & History
          _buildSectionTitle('Orders & History'),
          kHeight(10),
          _buildMenuCard(
            context,
            items: [
              _MenuItem(
                icon: Icons.history,
                title: 'Order History',
                subtitle: 'View past orders',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.subscriptions_outlined,
                title: 'Subscriptions',
                subtitle: 'Manage your subscriptions',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.receipt_outlined,
                title: 'Prescriptions',
                subtitle: 'Upload & manage prescriptions',
                onTap: () {},
              ),
            ],
          ),
          kHeight(20),

          // Support & Settings
          _buildSectionTitle('Support & Settings'),
          kHeight(10),
          _buildMenuCard(
            context,
            items: [
              _MenuItem(
                icon: Icons.help_outline,
                title: 'Help & Support',
                subtitle: 'FAQs & customer care',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                subtitle: 'Manage alerts',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.language_outlined,
                title: 'Language',
                subtitle: 'English',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.security_outlined,
                title: 'Privacy & Security',
                subtitle: 'Manage your data',
                onTap: () {},
              ),
            ],
          ),
          kHeight(20),

          // About & Legal
          _buildSectionTitle('About & Legal'),
          kHeight(10),
          _buildMenuCard(
            context,
            items: [
              _MenuItem(
                icon: Icons.info_outline,
                title: 'About MedGo',
                subtitle: 'Version 1.0.0',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.description_outlined,
                title: 'Terms & Conditions',
                onTap: () {},
              ),
              _MenuItem(
                icon: Icons.privacy_tip_outlined,
                title: 'Privacy Policy',
                onTap: () {},
              ),
            ],
          ),
          kHeight(20),

          // Logout Button
          _buildLogoutButton(context),
          kHeight(30),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: kBlackColor,
      ),
    );
  }

  Widget _buildMenuCard(BuildContext context,
      {required List<_MenuItem> items}) {
    return Container(
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: kGreyColor300!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: List.generate(
          items.length,
          (index) => Column(
            children: [
              _buildMenuItem(
                context,
                icon: items[index].icon,
                title: items[index].title,
                subtitle: items[index].subtitle,
                onTap: items[index].onTap,
              ),
              if (index < items.length - 1)
                Divider(height: 1, color: kGreyColor200),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                size: 22,
                color: kPrimaryColor,
              ),
            ),
            kWidth(14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: kBlackColor,
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: kGreyColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: kGreyColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red.withOpacity(0.3)),
      ),
      child: InkWell(
        onTap: () {
          _showLogoutDialog(context);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.logout, color: Colors.red, size: 22),
              kWidth(10),
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

class _MenuItem {
  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  _MenuItem({
    required this.icon,
    required this.title,
    this.subtitle,
    required this.onTap,
  });
}
