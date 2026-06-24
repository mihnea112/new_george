import 'package:flutter/material.dart';

class FinCoachScreen extends StatelessWidget {
  const FinCoachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2870ED),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(),
            const SizedBox(height: 4),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Fin Coach',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                color: const Color(0xFFF0F2F5),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      _coachCard(
                        icon: _warningIcon(const Color(0xFFE53935)),
                        category: 'Budget',
                        title: 'You need to reduce your spending.',
                      ),
                      _coachCard(
                        icon: _warningIcon(const Color(0xFFE53935)),
                        category: 'Reserves',
                        title: 'Your reserves are not enough.',
                      ),
                      _coachCard(
                        icon: _warningIcon(const Color(0xFFE53935)),
                        category: 'Protection',
                        title: 'You are lacking essential protection.',
                      ),
                      _coachCard(
                        icon: _infoIcon(),
                        category: 'Pension',
                        title: 'Please tell me more.',
                      ),
                      _coachCard(
                        icon: _warningIcon(const Color(0xFFE53935)),
                        category: 'Investments',
                        title: 'Looks like you are not investing so far.',
                      ),
                      _sectionHeader('Goals'),
                      _goalsCard(),
                      _sectionHeader('Benefits'),
                      _benefitsCard(),
                      _sectionHeader('Additional services'),
                      const SizedBox(height: 4),
                      _additionalServicesGrid(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: const Icon(Icons.play_circle_outline,
                    color: Colors.white, size: 26),
                onPressed: () {},
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE53935),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined,
                color: Colors.white, size: 26),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _warningIcon(Color color) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        shape: BoxShape.circle,
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1.5),
      ),
      child: Icon(Icons.warning_amber_rounded, color: color, size: 22),
    );
  }

  Widget _infoIcon() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: const Color(0xFF2870ED).withValues(alpha: 0.1),
        shape: BoxShape.circle,
        border: Border.all(
            color: const Color(0xFF2870ED).withValues(alpha: 0.3), width: 1.5),
      ),
      child:
          const Icon(Icons.info_outline, color: Color(0xFF2870ED), size: 22),
    );
  }

  Widget _coachCard(
      {required Widget icon,
      required String category,
      required String title}) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
          icon,
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category,
                    style: const TextStyle(
                        fontSize: 13, color: Color(0xFF888888))),
                const SizedBox(height: 2),
                Text(title,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A1A))),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFFBBBBBB), size: 22),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
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

  Widget _goalsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "What's your next goal?",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1A1A1A),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Set, track and achieve your financial goals with ease.',
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xFF666666),
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 14),
                _NewGoalButton(),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 64,
            height: 64,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF721C7A), Color(0xFF2870ED)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child:
                const Icon(Icons.flutter_dash, color: Colors.white, size: 38),
          ),
        ],
      ),
    );
  }

  Widget _benefitsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: const Color(0xFF0CB43F).withValues(alpha: 0.12),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.verified, color: Color(0xFF0CB43F), size: 24),
        ),
        title: const Text('Your benefits level',
            style: TextStyle(fontSize: 13, color: Color(0xFF888888))),
        subtitle: const Text(
          'Advanced',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1A1A),
          ),
        ),
        trailing: const Icon(Icons.chevron_right,
            color: Color(0xFFBBBBBB), size: 22),
        onTap: () {},
      ),
    );
  }

  Widget _additionalServicesGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _serviceTile(
            color: const Color(0xFF2870ED),
            icon: Icons.school_outlined,
            label: 'Money\nSchool',
          ),
          const SizedBox(width: 12),
          _serviceTile(
            color: const Color(0xFF2870ED),
            icon: Icons.account_balance_outlined,
            label: 'Branches\nand ATMs',
          ),
        ],
      ),
    );
  }

  Widget _serviceTile(
      {required Color color, required IconData icon, required String label}) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(16),
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
                  fontSize: 15,
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

class _NewGoalButton extends StatelessWidget {
  const _NewGoalButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F2F5),
          borderRadius: BorderRadius.circular(24),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, size: 18, color: Color(0xFF2870ED)),
            SizedBox(width: 6),
            Text(
              'New goal',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2870ED),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
