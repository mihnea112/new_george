import 'package:flutter/material.dart';
import 'learn_screen.dart';
import '../story_store.dart';
import 'story_preview_page.dart';

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
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
      child: Row(
        children: [
          // Search bar
          Expanded(
            child: Container(
              height: 44,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.18),
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: _searchController,
                onChanged: (v) => setState(() => _query = v),
                style: const TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'Search friends',
                  hintStyle: TextStyle(
                      color: Colors.white.withValues(alpha: 0.65),
                      fontSize: 15),
                  prefixIcon: Icon(Icons.search,
                      color: Colors.white.withValues(alpha: 0.8), size: 20),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 13),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          // Learn button
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const _LearnPage()),
            ),
            child: Container(
              height: 44,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              alignment: Alignment.center,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.school_outlined,
                      color: Color(0xFF2870ED), size: 18),
                  SizedBox(width: 6),
                  Text(
                    'Learn',
                    style: TextStyle(
                      color: Color(0xFF2870ED),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _StoriesSection(),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 4, 16, 0),
              child: Divider(height: 1, color: Color(0xFFE5E7EB)),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 14, 16, 4),
              child: Text(
                'Recent',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF9E9E9E),
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Expanded(
              child: _filtered.isEmpty
                  ? const Center(
                      child: Text(
                        'No friends found',
                        style:
                            TextStyle(color: Color(0xFF9CA3AF), fontSize: 15),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.only(bottom: 24),
                      itemCount: _filtered.length,
                      itemBuilder: (context, i) =>
                          _ContactTile(contact: _filtered[i]),
                    ),
            ),
          ],
        ),
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

// ── Stories ──────────────────────────────────────────────────────────────────

class _Achievement {
  final String label;
  final IconData icon;
  final List<Color> ringColors;
  final Color bgColor;

  const _Achievement({
    required this.label,
    required this.icon,
    required this.ringColors,
    required this.bgColor,
  });
}

class _StoriesSection extends StatefulWidget {
  @override
  State<_StoriesSection> createState() => _StoriesSectionState();
}

class _StoriesSectionState extends State<_StoriesSection> {
  static const _friendStories = [
    (initials: 'MI', name: 'Maria', color: Color(0xFF2870ED)),
    (initials: 'RC', name: 'Radu', color: Color(0xFF0CB43F)),
    (initials: 'EP', name: 'Elena', color: Color(0xFFEB4C79)),
    (initials: 'CV', name: 'Cristina', color: Color(0xFF02A3A4)),
  ];

  static const _achievements = [
    _Achievement(
      label: 'Budget\nHero',
      icon: Icons.emoji_events_outlined,
      ringColors: [Color(0xFF0CB43F), Color(0xFF2870ED)],
      bgColor: Color(0xFFE8F5E9),
    ),
    _Achievement(
      label: 'First\n1,000 RON',
      icon: Icons.savings_outlined,
      ringColors: [Color(0xFFFF6130), Color(0xFFEB4C79)],
      bgColor: Color(0xFFFFF3E0),
    ),
    _Achievement(
      label: 'Saver\nPro',
      icon: Icons.workspace_premium_outlined,
      ringColors: [Color(0xFFEB4C79), Color(0xFF721C7A)],
      bgColor: Color(0xFFFCE4EC),
    ),
    _Achievement(
      label: 'On\nTrack',
      icon: Icons.trending_up,
      ringColors: [Color(0xFF02A3A4), Color(0xFF028661)],
      bgColor: Color(0xFFE0F7FA),
    ),
    _Achievement(
      label: 'Investor',
      icon: Icons.pie_chart_outline,
      ringColors: [Color(0xFF721C7A), Color(0xFF2870ED)],
      bgColor: Color(0xFFF3E5F5),
    ),
  ];

  // Fake friend story content for preview
  static final _friendStoryContent = [
    [
      StoryContent(
        bgColor: const Color(0xFF2870ED),
        bgColor2: const Color(0xFF245375),
        icon: Icons.emoji_events_outlined,
        title: 'Budget Hero',
        subtitle: 'Maria saved 3,500 RON this month! 🎉',
        authorName: 'Maria',
        authorInitials: 'MI',
        authorColor: const Color(0xFF2870ED),
        timeAgo: '2h ago',
      ),
    ],
    [
      StoryContent(
        bgColor: const Color(0xFF0CB43F),
        bgColor2: const Color(0xFF028661),
        icon: Icons.savings_outlined,
        title: 'First 1,000 RON',
        subtitle: 'Radu reached his first savings milestone! 💰',
        authorName: 'Radu',
        authorInitials: 'RC',
        authorColor: const Color(0xFF0CB43F),
        timeAgo: '4h ago',
      ),
    ],
    [
      StoryContent(
        bgColor: const Color(0xFFEB4C79),
        bgColor2: const Color(0xFF721C7A),
        icon: Icons.workspace_premium_outlined,
        title: 'Saver Pro',
        subtitle: 'Elena saved every month for 6 months straight 🏆',
        authorName: 'Elena',
        authorInitials: 'EP',
        authorColor: const Color(0xFFEB4C79),
        timeAgo: '6h ago',
      ),
    ],
    [
      StoryContent(
        bgColor: const Color(0xFF02A3A4),
        bgColor2: const Color(0xFF028661),
        icon: Icons.trending_up,
        title: 'On Track',
        subtitle: 'Cristina is hitting all her financial goals 📈',
        authorName: 'Cristina',
        authorInitials: 'CV',
        authorColor: const Color(0xFF02A3A4),
        timeAgo: '8h ago',
      ),
    ],
  ];

  StoryContent _achievementToStory(int i) {
    final a = _achievements[i];
    return StoryContent(
      bgColor: a.ringColors.first,
      bgColor2: a.ringColors.last,
      icon: a.icon,
      title: a.label.replaceAll('\n', ' '),
      subtitle: 'You unlocked this achievement! Share it with friends.',
      authorName: 'You',
      authorInitials: 'ME',
      authorColor: const Color(0xFF2870ED),
    );
  }

  void _openMyStoryPreview() {
    final stories = StoryStore.myStories.value;
    if (stories.isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => StoryPreviewPage(stories: stories, isOwn: true),
      ),
    );
  }

  void _openFriendPreview(int friendIndex) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (_) => StoryPreviewPage(
          stories: _friendStoryContent[friendIndex],
          isOwn: false,
        ),
      ),
    );
  }

  void _onAchievementTap(int i) {
    final posted = StoryStore.postedAchievements.value.contains(i);
    if (posted) {
      // Preview own stories starting at this achievement
      final allStories = StoryStore.myStories.value;
      if (allStories.isEmpty) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (_) => StoryPreviewPage(stories: allStories, isOwn: true),
        ),
      );
    } else {
      // Show add-to-story sheet for this specific achievement
      final a = _achievements[i];
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        builder: (_) => _SingleAchievementSheet(
          achievement: a,
          onAdd: () {
            StoryStore.addAchievement(i, _achievementToStory(i));
            Navigator.pop(context);
            setState(() {});
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: StoryStore.myStories,
      builder: (ctx, myStories, child) {
        final posted = StoryStore.postedAchievements.value;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Friend stories row ────────────────────────────
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Stories',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _AddStoryBubble(
                    hasStories: myStories.isNotEmpty,
                    onTap: myStories.isEmpty ? null : _openMyStoryPreview,
                  ),
                  const SizedBox(width: 14),
                  ...List.generate(_friendStories.length, (i) {
                    final f = _friendStories[i];
                    return Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: _FriendStoryBubble(
                        initials: f.initials,
                        name: f.name,
                        color: f.color,
                        onTap: () => _openFriendPreview(i),
                      ),
                    );
                  }),
                ],
              ),
            ),
            // ── Achievements row ──────────────────────────────
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Text(
                'Achievements',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A1A),
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: List.generate(_achievements.length, (i) {
                  final isPosted = posted.contains(i);
                  return Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: _StoryBubble(
                      achievement: _achievements[i],
                      locked: !isPosted,
                      onTap: () => _onAchievementTap(i),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 8),
          ],
        );
      },
    );
  }
}

class _FriendStoryBubble extends StatelessWidget {
  final String initials;
  final String name;
  final Color color;
  final VoidCallback? onTap;
  const _FriendStoryBubble(
      {required this.initials, required this.name, required this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [color, color.withValues(alpha: 0.6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: const EdgeInsets.all(3),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Text(
                  initials,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            name,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddStoryBubble extends StatelessWidget {
  final bool hasStories;
  final VoidCallback? onTap;
  const _AddStoryBubble({required this.hasStories, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          hasStories
              ? Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFF2870ED), Color(0xFF721C7A)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(3),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF2870ED),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.person,
                          color: Colors.white, size: 26),
                    ),
                  ),
                )
              : Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFFE5E7EB),
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const Icon(Icons.person_outline,
                          color: Color(0xFF9E9E9E), size: 30),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: Color(0xFF2870ED),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.add,
                              color: Colors.white, size: 14),
                        ),
                      ),
                    ],
                  ),
                ),
          const SizedBox(height: 6),
          Text(
            hasStories ? 'Your story' : 'Add',
            style: const TextStyle(
              fontSize: 11,
              color: Color(0xFF1A1A1A),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _StoryBubble extends StatelessWidget {
  final _Achievement achievement;
  final bool locked;
  final VoidCallback? onTap;

  const _StoryBubble(
      {required this.achievement, this.locked = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          locked
              ? Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color(0xFFE5E7EB), width: 2.5),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Color(0xFFF5F5F5),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(achievement.icon,
                            color: const Color(0xFFCCCCCC), size: 26),
                      ),
                    ),
                    // "+" badge for locked
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2870ED),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.add,
                            color: Colors.white, size: 13),
                      ),
                    ),
                  ],
                )
              : Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: achievement.ringColors,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(3),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: achievement.bgColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(achievement.icon,
                          color: achievement.ringColors.first, size: 24),
                    ),
                  ),
                ),
          const SizedBox(height: 6),
          Text(
            achievement.label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              height: 1.2,
              fontWeight: FontWeight.w600,
              color: locked
                  ? const Color(0xFFBBBBBB)
                  : const Color(0xFF1A1A1A),
            ),
          ),
        ],
      ),
    );
  }
}

// Per-achievement add-to-story sheet
class _SingleAchievementSheet extends StatelessWidget {
  final _Achievement achievement;
  final VoidCallback onAdd;

  const _SingleAchievementSheet(
      {required this.achievement, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // drag handle
          Container(
            width: 36,
            height: 4,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFE5E7EB),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: achievement.ringColors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Icon(achievement.icon, color: Colors.white, size: 40),
          ),
          const SizedBox(height: 16),
          Text(
            achievement.label.replaceAll('\n', ' '),
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Share this achievement with your friends.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Color(0xFF888888)),
          ),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: onAdd,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFF2870ED),
                borderRadius: BorderRadius.circular(28),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle_outline,
                      color: Colors.white, size: 20),
                  SizedBox(width: 8),
                  Text(
                    'Add to my story',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF888888),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Learn page (pushed from header button) ───────────────────────────────────

class _LearnPage extends StatelessWidget {
  const _LearnPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const LearnScreen(),
    );
  }
}

// ── Contacts ─────────────────────────────────────────────────────────────────

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
