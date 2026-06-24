import 'package:flutter/material.dart';

class StoryContent {
  final Color bgColor;
  final Color bgColor2;
  final IconData icon;
  final String title;
  final String subtitle;
  final String authorName;
  final String authorInitials;
  final Color authorColor;
  final String timeAgo;

  const StoryContent({
    required this.bgColor,
    required this.bgColor2,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.authorName,
    required this.authorInitials,
    required this.authorColor,
    this.timeAgo = 'Just now',
  });
}

class StoryStore {
  // Own stories (achievements + reels added by the user)
  static final myStories = ValueNotifier<List<StoryContent>>([]);

  // Track which achievement indices are in story
  static final postedAchievements = ValueNotifier<Set<int>>(<int>{});

  // Track which reel indices are in story
  static final postedReels = ValueNotifier<Set<int>>(<int>{});

  // Track which reels have been watched
  static final watchedReels = ValueNotifier<Set<int>>(<int>{0});

  static void addAchievement(int index, StoryContent content) {
    if (!postedAchievements.value.contains(index)) {
      postedAchievements.value = {...postedAchievements.value, index};
      myStories.value = [...myStories.value, content];
    }
  }

  static void addReel(int index, StoryContent content) {
    if (!postedReels.value.contains(index)) {
      postedReels.value = {...postedReels.value, index};
      myStories.value = [...myStories.value, content];
    }
  }

  static void markWatched(int index) {
    watchedReels.value = {...watchedReels.value, index};
  }
}
