class Skill {
  final String name;
  final double level; // 0.0 to 1.0
  final String category;
  final String? iconName;

  const Skill({
    required this.name,
    required this.level,
    required this.category,
    this.iconName,
  });
}

final List<Skill> sampleSkills = [
  // Mobile Development
  const Skill(name: 'Flutter', level: 0.95, category: 'Mobile Development'),
  const Skill(name: 'Dart', level: 0.93, category: 'Mobile Development'),
  const Skill(name: 'Riverpod', level: 0.90, category: 'Mobile Development'),
  const Skill(name: 'Bloc', level: 0.88, category: 'Mobile Development'),
  const Skill(name: 'GetX', level: 0.85, category: 'Mobile Development'),
  const Skill(name: 'Provider', level: 0.85, category: 'Mobile Development'),
  const Skill(name: 'MVVM Architecture', level: 0.85, category: 'Mobile Development'),

  // Backend & Database
  const Skill(name: 'Firebase Auth', level: 0.92, category: 'Backend & Database'),
  const Skill(name: 'Firebase Firestore', level: 0.90, category: 'Backend & Database'),
  const Skill(name: 'Firebase FCM', level: 0.85, category: 'Backend & Database'),
  const Skill(name: 'REST API Integration', level: 0.92, category: 'Backend & Database'),
  const Skill(name: 'GraphQL', level: 0.80, category: 'Backend & Database'),
  const Skill(name: 'WebSocket', level: 0.85, category: 'Backend & Database'),
  const Skill(name: 'Supabase', level: 0.75, category: 'Backend & Database'),
  const Skill(name: 'Real-Time Sync', level: 0.88, category: 'Backend & Database'),

  // Programming Languages
  const Skill(name: 'Python', level: 0.70, category: 'Languages'),
  const Skill(name: 'JavaScript (ES6+)', level: 0.75, category: 'Languages'),
  const Skill(name: 'TypeScript', level: 0.70, category: 'Languages'),

  // Tools & Others
  const Skill(name: 'Git & GitHub', level: 0.90, category: 'Tools'),
  const Skill(name: 'Android Studio', level: 0.90, category: 'Tools'),
  const Skill(name: 'VS Code', level: 0.88, category: 'Tools'),
  const Skill(name: 'Postman', level: 0.85, category: 'Tools'),
  const Skill(name: 'Braintree / Stripe', level: 0.85, category: 'Payment'),
];
