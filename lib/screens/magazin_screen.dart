import 'package:flutter/material.dart';

class MagazinScreen extends StatefulWidget {
  const MagazinScreen({super.key});

  @override
  State<MagazinScreen> createState() => _MagazinScreenState();
}

class _MagazinScreenState extends State<MagazinScreen> {
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2870ED),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SizedBox(height: 12),
            const Text(
              'Discover',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 14),
            _buildTabBar(),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                color: const Color(0xFFF0F2F5),
                child: _tabIndex == 0
                    ? _buildBankingProducts()
                    : _buildGeorgePartners(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          _Tab(
            label: 'Banking Products',
            isActive: _tabIndex == 0,
            onTap: () => setState(() => _tabIndex = 0),
          ),
          _Tab(
            label: 'George Partners',
            isActive: _tabIndex == 1,
            onTap: () => setState(() => _tabIndex = 1),
          ),
        ],
      ),
    );
  }

  Widget _buildBankingProducts() {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader('Let George do it'),
          _letGeorgeCard(
            imageWidget: _GeorgeBillsIcon(),
            title: 'George Bills',
            subtitle: 'Pay your bills in just a few seconds',
            tag: 'Free',
          ),
          const SizedBox(height: 8),
          _letGeorgeCard(
            imageWidget: _MoneyBackIcon(),
            title: 'MoneyBack',
            subtitle: 'Shop smart and get money back',
            tag: 'Free',
          ),
          _sectionHeader('Recommended for you'),
          _recommendedRow(),
          _sectionHeader('Extra'),
          const SizedBox(height: 4),
          _extraGrid(),
        ],
      ),
    );
  }

  Widget _buildGeorgePartners() {
    return const Center(
      child: Text(
        'George Partners',
        style: TextStyle(fontSize: 18, color: Color(0xFF888888)),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w800,
          color: Color(0xFF1A1A1A),
        ),
      ),
    );
  }

  Widget _letGeorgeCard(
      {required Widget imageWidget,
      required String title,
      required String subtitle,
      required String tag}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(width: 72, height: 72, child: imageWidget),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(
                        fontSize: 13, color: Color(0xFF666666), height: 1.4),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    tag,
                    style: const TextStyle(
                        fontSize: 13, color: Color(0xFF888888)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _recommendedRow() {
    return SizedBox(
      height: 220,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _RecommendedCard(
            iconWidget: const Icon(Icons.calendar_today_outlined,
                color: Color(0xFF028661), size: 36),
            title: 'Term deposit',
            subtitle:
                'One click away to save for a dream holiday or to redesign your house',
          ),
          const SizedBox(width: 12),
          _RecommendedCard(
            iconWidget: const _WaveIcon(color: Color(0xFF721C7A)),
            title: 'Financial\nInvestments',
            subtitle:
                'To access all investment products, you need to sign the contract here.',
          ),
          const SizedBox(width: 12),
          _RecommendedCard(
            iconWidget: const Icon(Icons.savings_outlined,
                color: Color(0xFF2870ED), size: 36),
            title: 'Pension\nFund',
            subtitle: 'Start building your future today with our pension plans.',
          ),
        ],
      ),
    );
  }

  Widget _extraGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _ExtraTile(
            color: const Color(0xFF721C7A),
            icon: Icons.school_outlined,
            label: 'Money School',
          ),
          const SizedBox(width: 12),
          _ExtraTile(
            color: const Color(0xFF721C7A),
            icon: Icons.account_balance_outlined,
            label: 'Branches\nand ATMs',
          ),
        ],
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _Tab(
      {required this.label, required this.isActive, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isActive ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isActive ? const Color(0xFF2870ED) : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class _GeorgeBillsIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF245375), Color(0xFF2870ED)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Icon(Icons.receipt_long, color: Colors.white, size: 36),
      ),
    );
  }
}

class _MoneyBackIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFFFF3E0),
      child: const Center(
        child: Icon(Icons.shopping_bag_outlined,
            color: Color(0xFFFF6130), size: 40),
      ),
    );
  }
}

class _WaveIcon extends StatelessWidget {
  final Color color;
  const _WaveIcon({required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(40, 36),
      painter: _WavePainter(color: color),
    );
  }
}

class _WavePainter extends CustomPainter {
  final Color color;
  const _WavePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final path = Path();
    path.moveTo(0, size.height * 0.6);
    path.lineTo(size.width * 0.2, size.height * 0.6);
    path.lineTo(size.width * 0.3, size.height * 0.2);
    path.lineTo(size.width * 0.4, size.height * 0.8);
    path.lineTo(size.width * 0.5, size.height * 0.3);
    path.lineTo(size.width * 0.6, size.height * 0.7);
    path.lineTo(size.width * 0.7, size.height * 0.4);
    path.lineTo(size.width * 0.8, size.height * 0.6);
    path.lineTo(size.width, size.height * 0.6);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_WavePainter old) => old.color != color;
}

class _RecommendedCard extends StatelessWidget {
  final Widget iconWidget;
  final String title;
  final String subtitle;

  const _RecommendedCard({
    required this.iconWidget,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            iconWidget,
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w800,
                color: Color(0xFF1A1A1A),
                height: 1.3,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: Color(0xFF666666),
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExtraTile extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String label;

  const _ExtraTile({
    required this.color,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 130,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.25),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 26),
              ),
              const Spacer(),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
