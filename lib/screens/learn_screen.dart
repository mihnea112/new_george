import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../story_store.dart';

// ── Data ─────────────────────────────────────────────────────────────────────

class _Reel {
  final String title;
  final String handle;
  final String duration;
  final String likes;
  final Color bgColor;
  final IconData icon;
  final bool watched;
  final String tag;
  final String description;
  final _QuizData quiz;

  const _Reel({
    required this.title,
    required this.handle,
    required this.duration,
    required this.likes,
    required this.bgColor,
    required this.icon,
    this.watched = false,
    required this.tag,
    required this.description,
    required this.quiz,
  });
}

class _QuizData {
  final String question;
  final List<String> options;
  final int correctIndex;
  const _QuizData(
      {required this.question,
      required this.options,
      required this.correctIndex});
}

class _Subject {
  final String name;
  final IconData icon;
  final Color color;
  final int done;
  final int total;
  const _Subject(
      {required this.name,
      required this.icon,
      required this.color,
      required this.done,
      required this.total});
}

const _reels = [
  _Reel(
    title: 'The 50/30/20 Rule',
    handle: '@george.learn',
    duration: '0:48',
    likes: '1.2K',
    bgColor: Color(0xFF2870ED),
    icon: Icons.calculate_outlined,
    watched: true,
    tag: 'Budget',
    description: 'Split your income into 3 simple categories.',
    quiz: _QuizData(
      question: 'What percentage of income goes to needs?',
      options: ['20%', '30%', '50%'],
      correctIndex: 2,
    ),
  ),
  _Reel(
    title: 'What is compound interest',
    handle: '@george.learn',
    duration: '0:57',
    likes: '2.1K',
    bgColor: Color(0xFF0CB43F),
    icon: Icons.trending_up,
    tag: 'Saving',
    description: 'Interest that grows exponentially over time.',
    quiz: _QuizData(
      question: 'Compound interest is calculated on:',
      options: ['Initial capital', 'Capital + accumulated interest', 'Interest only'],
      correctIndex: 1,
    ),
  ),
  _Reel(
    title: 'How to avoid fraud',
    handle: '@george.learn',
    duration: '0:39',
    likes: '980',
    bgColor: Color(0xFFFF6130),
    icon: Icons.security_outlined,
    tag: 'Fraud',
    description: 'No codes via SMS. Ever.',
    quiz: _QuizData(
      question: 'Does your bank ever ask for your PIN by phone?',
      options: ['Yes', 'Never'],
      correctIndex: 1,
    ),
  ),
  _Reel(
    title: 'Emergency fund',
    handle: '@george.learn',
    duration: '0:52',
    likes: '1.5K',
    bgColor: Color(0xFF02A3A4),
    icon: Icons.local_fire_department_outlined,
    tag: 'Saving',
    description: 'Savings to cover 3–6 months of expenses.',
    quiz: _QuizData(
      question: 'How much should an emergency fund cover?',
      options: ['1 month of expenses', '3–6 months', '1 year'],
      correctIndex: 1,
    ),
  ),
  _Reel(
    title: 'How to invest in ETFs',
    handle: '@george.learn',
    duration: '1:12',
    likes: '3.2K',
    bgColor: Color(0xFF721C7A),
    icon: Icons.pie_chart_outline,
    tag: 'Investing',
    description: 'Simple diversification with low fees.',
    quiz: _QuizData(
      question: 'ETF stands for:',
      options: [
        'Exchange-Traded Fund',
        'Extra Tax Fee',
        'European Trade Finance'
      ],
      correctIndex: 0,
    ),
  ),
  _Reel(
    title: 'Credit card vs debit card',
    handle: '@george.learn',
    duration: '0:44',
    likes: '890',
    bgColor: Color(0xFF245375),
    icon: Icons.credit_card_outlined,
    tag: 'Cards',
    description: 'Choose the right card for every situation.',
    quiz: _QuizData(
      question: 'Does a credit card offer purchase protection?',
      options: ['Yes, usually', 'No'],
      correctIndex: 0,
    ),
  ),
];

const _subjects = [
  _Subject(
      name: 'Budget',
      icon: Icons.calculate_outlined,
      color: Color(0xFF2870ED),
      done: 1,
      total: 1),
  _Subject(
      name: 'Saving',
      icon: Icons.savings_outlined,
      color: Color(0xFF0CB43F),
      done: 0,
      total: 1),
  _Subject(
      name: 'Investing',
      icon: Icons.trending_up,
      color: Color(0xFF721C7A),
      done: 0,
      total: 1),
  _Subject(
      name: 'Fraud',
      icon: Icons.security_outlined,
      color: Color(0xFFFF6130),
      done: 0,
      total: 1),
  _Subject(
      name: 'Crypto',
      icon: Icons.currency_bitcoin,
      color: Color(0xFF028661),
      done: 0,
      total: 1),
  _Subject(
      name: 'Cards',
      icon: Icons.credit_card_outlined,
      color: Color(0xFF245375),
      done: 0,
      total: 1),
  _Subject(
      name: 'Entrepreneur',
      icon: Icons.rocket_launch_outlined,
      color: Color(0xFFEB4C79),
      done: 0,
      total: 1),
];

// ── Main screen ───────────────────────────────────────────────────────────────

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF2870ED),
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 20, 8),
              child: Row(
                children: [
                  if (Navigator.canPop(context))
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new,
                          color: Colors.white, size: 20),
                      onPressed: () => Navigator.pop(context),
                    )
                  else
                    const SizedBox(width: 20),
                  const Text(
                    'Learn',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                      letterSpacing: -0.5,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFF0F2F5),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(24)),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        _buildProgressSection(),
                        const SizedBox(height: 24),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            'Reels',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF1A1A1A),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildReelsGrid(context),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressSection() {
    final mastered = _subjects.where((s) => s.done == s.total).length;
    final total = _subjects.length;
    final pct = mastered / total;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Progress by subject',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              SizedBox(
                width: 64,
                height: 64,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: pct,
                      strokeWidth: 6,
                      backgroundColor: const Color(0xFFE5E7EB),
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF2870ED)),
                    ),
                    Text(
                      '${(pct * 100).round()}%',
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF1A1A1A),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                            fontSize: 14, color: Color(0xFF1A1A1A)),
                        children: [
                          const TextSpan(text: 'You mastered '),
                          TextSpan(
                            text: '$mastered subject',
                            style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF2870ED)),
                          ),
                          const TextSpan(text: ' 🎯'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${_reels.where((r) => r.watched).length} of ${_reels.length} reels watched · $mastered/$total subjects started',
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xFF888888)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ..._subjects.map((s) => _SubjectRow(subject: s)),
        ],
      ),
    );
  }

  Widget _buildReelsGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.72,
        ),
        itemCount: _reels.length,
        itemBuilder: (ctx, i) => _ReelCard(
          reel: _reels[i],
          reelIndex: i,
          onTap: () => Navigator.push(
            ctx,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (_) => _ReelPlayerPage(
                  reel: _reels[i], allReels: _reels, initialIndex: i),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Subject row ───────────────────────────────────────────────────────────────

class _SubjectRow extends StatelessWidget {
  final _Subject subject;
  const _SubjectRow({required this.subject});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: subject.color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(subject.icon, size: 18, color: subject.color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      subject.name,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1A1A1A)),
                    ),
                    Text(
                      subject.done == subject.total
                          ? '✦ ${subject.done}/${subject.total}'
                          : '${subject.done}/${subject.total}',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: subject.done == subject.total
                            ? const Color(0xFF0CB43F)
                            : const Color(0xFF9E9E9E),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                    value: subject.total == 0
                        ? 0
                        : subject.done / subject.total,
                    minHeight: 4,
                    backgroundColor: const Color(0xFFE5E7EB),
                    valueColor:
                        AlwaysStoppedAnimation<Color>(subject.color),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Reel card ─────────────────────────────────────────────────────────────────

class _ReelCard extends StatelessWidget {
  final _Reel reel;
  final int reelIndex;
  final VoidCallback onTap;
  const _ReelCard(
      {required this.reel, required this.reelIndex, required this.onTap});

  StoryContent _toStory() => StoryContent(
        bgColor: reel.bgColor,
        bgColor2: reel.bgColor.withValues(alpha: 0.6),
        icon: reel.icon,
        title: reel.title,
        subtitle: reel.description,
        authorName: reel.handle,
        authorInitials: 'GL',
        authorColor: reel.bgColor,
      );

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: StoryStore.watchedReels,
      builder: (ctx1, watched, child1) {
        return ValueListenableBuilder(
          valueListenable: StoryStore.postedReels,
          builder: (ctx2, posted, child2) {
            final isWatched = watched.contains(reelIndex);
            final isPosted = posted.contains(reelIndex);
            return GestureDetector(
              onTap: onTap,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(color: reel.bgColor),
                          Center(
                            child: Container(
                              width: 72,
                              height: 72,
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.2),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.play_arrow_rounded,
                                  color: Colors.white, size: 40),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 10,
                            child: _Chip(label: reel.duration),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: _Chip(label: '♥ ${reel.likes}'),
                          ),
                          if (isWatched)
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0CB43F),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.check,
                                        color: Colors.white, size: 11),
                                    SizedBox(width: 3),
                                    Text('Watched',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w700)),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    reel.title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A1A),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 7,
                        height: 7,
                        margin: const EdgeInsets.only(right: 4),
                        decoration: const BoxDecoration(
                          color: Color(0xFF2870ED),
                          shape: BoxShape.circle,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          reel.handle,
                          style: const TextStyle(
                              fontSize: 11, color: Color(0xFF888888)),
                        ),
                      ),
                    ],
                  ),
                  if (isWatched) ...[
                    const SizedBox(height: 6),
                    GestureDetector(
                      onTap: isPosted
                          ? null
                          : () => StoryStore.addReel(reelIndex, _toStory()),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: isPosted
                              ? const Color(0xFFE8F5E9)
                              : const Color(0xFFEEF2FF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              isPosted
                                  ? Icons.check_circle
                                  : Icons.add_circle_outline,
                              size: 12,
                              color: isPosted
                                  ? const Color(0xFF0CB43F)
                                  : const Color(0xFF2870ED),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              isPosted ? 'In story' : 'Add to story',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: isPosted
                                    ? const Color(0xFF0CB43F)
                                    : const Color(0xFF2870ED),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  const _Chip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(
            color: Colors.white, fontSize: 11, fontWeight: FontWeight.w600),
      ),
    );
  }
}

// ── Fullscreen player ─────────────────────────────────────────────────────────

class _ReelPlayerPage extends StatefulWidget {
  final _Reel reel;
  final List<_Reel> allReels;
  final int initialIndex;
  const _ReelPlayerPage(
      {required this.reel,
      required this.allReels,
      required this.initialIndex});

  @override
  State<_ReelPlayerPage> createState() => _ReelPlayerPageState();
}

class _ReelPlayerPageState extends State<_ReelPlayerPage>
    with SingleTickerProviderStateMixin {
  late int _index;
  late AnimationController _progressCtrl;
  bool _liked = false;
  bool _saved = false;
  bool _quizShown = false;

  _Reel get _current => widget.allReels[_index];

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
    _startProgress();
  }

  void _startProgress() {
    _progressCtrl = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..addStatusListener((s) {
        if (s == AnimationStatus.completed && !_quizShown) {
          _showQuiz();
        }
      });
    // show quiz at ~40% progress
    _progressCtrl.addListener(() {
      if (_progressCtrl.value > 0.4 && !_quizShown) {
        _showQuiz();
      }
    });
    _progressCtrl.forward();
  }

  void _showQuiz() {
    if (_quizShown) return;
    _quizShown = true;
    _progressCtrl.stop();
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      isDismissible: false,
      enableDrag: false,
      builder: (_) => _QuizSheet(
        quiz: _current.quiz,
        onDone: () {
          Navigator.pop(context);
          _progressCtrl.forward();
        },
      ),
    );
  }

  void _goTo(int newIndex) {
    _progressCtrl.dispose();
    setState(() {
      _index = newIndex.clamp(0, widget.allReels.length - 1);
      _liked = false;
      _saved = false;
      _quizShown = false;
    });
    _startProgress();
  }

  @override
  void dispose() {
    _progressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _current.bgColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // background
          Container(color: _current.bgColor),

          // center icon
          Center(
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(_current.icon,
                  color: Colors.white, size: 72),
            ),
          ),

          // top progress bars
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            left: 12,
            right: 12,
            child: Row(
              children: List.generate(widget.allReels.length, (i) {
                return Expanded(
                  child: AnimatedBuilder(
                    animation: _progressCtrl,
                    builder: (context2, child) {
                      double val = i < _index
                          ? 1.0
                          : i == _index
                              ? _progressCtrl.value
                              : 0.0;
                      return Container(
                        height: 3,
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: BoxDecoration(
                          color:
                              Colors.white.withValues(alpha: 0.35),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: val,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }),
            ),
          ),

          // top bar
          Positioned(
            top: MediaQuery.of(context).padding.top + 28,
            left: 16,
            right: 16,
            child: Row(
              children: [
                const Text(
                  'GEORGE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 15,
                    letterSpacing: 1,
                  ),
                ),
                Container(
                  width: 1,
                  height: 16,
                  color: Colors.white54,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                ),
                const Text(
                  'ACADEMY',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                    letterSpacing: 2,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.25),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.close,
                        color: Colors.white, size: 18),
                  ),
                ),
              ],
            ),
          ),

          // waveform + now playing
          Positioned(
            bottom: 200,
            left: 16,
            right: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF0CB43F),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'NOW PLAYING',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _WaveformWidget(),
              ],
            ),
          ),

          // bottom info
          Positioned(
            bottom: 40,
            left: 16,
            right: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.security_outlined,
                          color: Colors.white, size: 13),
                      const SizedBox(width: 4),
                      Text(
                        _current.tag,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _current.handle,
                  style: const TextStyle(
                      color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 4),
                Text(
                  _current.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _current.description,
                  style: const TextStyle(
                      color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),

          // "Got it" button
          Positioned(
            bottom: 40,
            right: 16,
            child: GestureDetector(
              onTap: () {
                StoryStore.markWatched(_index);
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Text(
                  'Got it ✅',
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontWeight: FontWeight.w700,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),

          // right actions
          Positioned(
            right: 12,
            top: 0,
            bottom: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // up
                _ActionBtn(
                  icon: Icons.keyboard_arrow_up,
                  onTap: _index > 0 ? () => _goTo(_index - 1) : null,
                ),
                const SizedBox(height: 10),
                // down
                _ActionBtn(
                  icon: Icons.keyboard_arrow_down,
                  onTap: _index < widget.allReels.length - 1
                      ? () => _goTo(_index + 1)
                      : null,
                ),
                const SizedBox(height: 20),
                // like
                _ActionBtn(
                  icon: _liked
                      ? Icons.favorite
                      : Icons.favorite_border,
                  iconColor: _liked ? const Color(0xFFEB4C79) : null,
                  label: _current.likes,
                  onTap: () => setState(() => _liked = !_liked),
                ),
                const SizedBox(height: 16),
                // save
                _ActionBtn(
                  icon: _saved
                      ? Icons.bookmark
                      : Icons.bookmark_border,
                  iconColor:
                      _saved ? const Color(0xFF2870ED) : null,
                  label: '410',
                  onTap: () => setState(() => _saved = !_saved),
                ),
                const SizedBox(height: 16),
                // share
                _ActionBtn(
                  icon: Icons.share_outlined,
                  label: 'Share',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String? label;
  final VoidCallback? onTap;

  const _ActionBtn(
      {required this.icon, this.iconColor, this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(icon,
                color: iconColor ?? Colors.white, size: 22),
          ),
          if (label != null) ...[
            const SizedBox(height: 4),
            Text(
              label!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ],
      ),
    );
  }
}

// ── Waveform ──────────────────────────────────────────────────────────────────

class _WaveformWidget extends StatefulWidget {
  @override
  State<_WaveformWidget> createState() => _WaveformWidgetState();
}

class _WaveformWidgetState extends State<_WaveformWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _ctrl,
      builder: (context, child) => CustomPaint(
        size: const Size(double.infinity, 28),
        painter: _WaveformPainter(phase: _ctrl.value),
      ),
    );
  }
}

class _WaveformPainter extends CustomPainter {
  final double phase;
  const _WaveformPainter({required this.phase});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.85)
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round;

    const bars = 40;
    final w = size.width / bars;
    for (int i = 0; i < bars; i++) {
      final h = (math.sin((i / bars * 2 * math.pi) + phase * 2 * math.pi)
                  .abs() *
              16 +
          4);
      final x = i * w + w / 2;
      canvas.drawLine(
        Offset(x, size.height / 2 - h / 2),
        Offset(x, size.height / 2 + h / 2),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_WaveformPainter old) => old.phase != phase;
}

// ── Quiz sheet ────────────────────────────────────────────────────────────────

class _QuizSheet extends StatefulWidget {
  final _QuizData quiz;
  final VoidCallback onDone;
  const _QuizSheet({required this.quiz, required this.onDone});

  @override
  State<_QuizSheet> createState() => _QuizSheetState();
}

class _QuizSheetState extends State<_QuizSheet> {
  int? _selected;
  bool get _answered => _selected != null;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 36,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFE5E7EB),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text('🧠 ', style: TextStyle(fontSize: 18)),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6130).withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Mini-quiz · +30 XP',
                  style: TextStyle(
                    color: Color(0xFFFF6130),
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            widget.quiz.question,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 16),
          ...widget.quiz.options.asMap().entries.map((e) {
            final correct = e.key == widget.quiz.correctIndex;
            Color bg = Colors.white;
            Color border = const Color(0xFFE5E7EB);
            if (_answered && e.key == _selected) {
              bg = correct
                  ? const Color(0xFF0CB43F).withValues(alpha: 0.1)
                  : const Color(0xFFE53935).withValues(alpha: 0.1);
              border = correct
                  ? const Color(0xFF0CB43F)
                  : const Color(0xFFE53935);
            }
            return GestureDetector(
              onTap: _answered
                  ? null
                  : () {
                      setState(() => _selected = e.key);
                      if (correct) {
                        Future.delayed(const Duration(milliseconds: 800),
                            widget.onDone);
                      }
                    },
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: bg,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: border, width: 1.5),
                ),
                child: Text(
                  e.value,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: _answered && e.key == _selected
                        ? (correct
                            ? const Color(0xFF0CB43F)
                            : const Color(0xFFE53935))
                        : const Color(0xFF1A1A1A),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
