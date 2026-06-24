import 'package:flutter/material.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  final _searchController = TextEditingController();
  String _query = '';

  static const _contacts = [
    _Contact(
      initials: 'MI',
      name: 'Maria Ionescu',
      description: 'Sent you 200 lei',
      date: '23 Jun',
      color: Color(0xFF2870ED),
    ),
    _Contact(
      initials: 'RC',
      name: 'Radu Constantin',
      description: 'You sent 50 lei',
      date: '22 Jun',
      color: Color(0xFF0CB43F),
    ),
    _Contact(
      initials: 'EP',
      name: 'Elena Popescu',
      description: 'Sent you 300 lei',
      date: '20 Jun',
      color: Color(0xFFEB4C79),
    ),
    _Contact(
      initials: 'DM',
      name: 'Dan Muresan',
      description: 'You sent 75 lei',
      date: '18 Jun',
      color: Color(0xFF721C7A),
    ),
    _Contact(
      initials: 'CV',
      name: 'Cristina Vasilescu',
      description: 'Sent you 120 lei',
      date: '15 Jun',
      color: Color(0xFF02A3A4),
    ),
    _Contact(
      initials: 'AG',
      name: 'Andrei Gheorghe',
      description: 'You sent 90 lei',
      date: '14 Jun',
      color: Color(0xFF028661),
    ),
    _Contact(
      initials: 'IS',
      name: 'Ioana Stan',
      description: 'Sent you 250 lei',
      date: '10 Jun',
      color: Color(0xFF245375),
    ),
    _Contact(
      initials: 'MD',
      name: 'Mihai Dumitru',
      description: 'You sent 45 lei',
      date: '5 Jun',
      color: Color(0xFFFF6130),
    ),
    _Contact(
      initials: 'LN',
      name: 'Laura Niculescu',
      description: 'Sent you 85 lei',
      date: '1 Jun',
      color: Color(0xFF2870ED),
    ),
    _Contact(
      initials: 'BC',
      name: 'Bogdan Cernat',
      description: 'You sent 130 lei',
      date: '28 May',
      color: Color(0xFFEB4C79),
    ),
  ];

  List<_Contact> get _filtered => _query.isEmpty
      ? _contacts
      : _contacts
          .where((c) =>
              c.name.toLowerCase().contains(_query.toLowerCase()))
          .toList();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2870ED),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _buildHeader(),
            const SizedBox(height: 12),
            Expanded(child: _buildList()),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person_outline,
                    color: Colors.white, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.18),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: (v) => setState(() => _query = v),
                    style: const TextStyle(
                        color: Colors.white, fontSize: 15),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(
                          color: Colors.white.withValues(alpha: 0.7),
                          fontSize: 15),
                      prefixIcon: Icon(Icons.search,
                          color: Colors.white.withValues(alpha: 0.8),
                          size: 20),
                      border: InputBorder.none,
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              _IconCircle(
                icon: Icons.calendar_today_outlined,
                onTap: () {},
              ),
              const SizedBox(width: 10),
              _IconCircle(
                icon: Icons.add,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Friends',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList() {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFF0F2F5),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: _filtered.isEmpty
            ? const Center(
                child: Text(
                  'No friends found',
                  style: TextStyle(color: Color(0xFF9CA3AF), fontSize: 15),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.only(top: 8, bottom: 24),
                itemCount: _filtered.length,
                itemBuilder: (context, i) =>
                    _ContactTile(contact: _filtered[i]),
              ),
      ),
    );
  }
}

class _IconCircle extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _IconCircle({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.18),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 20),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final _Contact contact;
  const _ContactTile({required this.contact});

  @override
  Widget build(BuildContext context) {
    final sent = contact.description.startsWith('You sent');
    return GestureDetector(
      onTap: () {},
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: contact.color,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    contact.initials,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -2,
                  right: -2,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2870ED),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white, width: 1.5),
                    ),
                    child: const Center(
                      child: Text(
                        'G',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: const TextStyle(
                      color: Color(0xFF1A1A1A),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    contact.description,
                    style: TextStyle(
                      color: sent
                          ? const Color(0xFF888888)
                          : const Color(0xFF0CB43F),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              contact.date,
              style: const TextStyle(
                color: Color(0xFF9E9E9E),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Contact {
  final String initials;
  final String name;
  final String description;
  final String date;
  final Color color;

  const _Contact({
    required this.initials,
    required this.name,
    required this.description,
    required this.date,
    required this.color,
  });
}
