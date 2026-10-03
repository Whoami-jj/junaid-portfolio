class Experience {
  final String id;
  final String title;
  final String company;
  final String location;
  final String startDate;
  final String? endDate; // null = Present
  final String description;
  final List<String> responsibilities;
  final bool isEducation;

  const Experience({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.startDate,
    this.endDate,
    required this.description,
    required this.responsibilities,
    this.isEducation = false,
  });

  bool get isCurrent => endDate == null;
}

final List<Experience> sampleExperiences = [
  const Experience(
    id: '1',
    title: 'Flutter Developer',
    company: 'Inspire Uplift IT Solutions',
    location: 'Faisalabad, Pakistan',
    startDate: 'Mar 2024',
    endDate: null,
    description:
        'Building and launching production apps for a global e-commerce platform serving 20+ million products, 55,000+ sellers, and 2 million+ customers.',
    responsibilities: [
      'Built and launched Seller Central & Marketplace applications',
      'Reduced application crash rate through optimized state management and memory leak resolution',
      'Integrated REST APIs and Firebase Firestore for real-time order tracking and seller analytics',
      'Automated seller onboarding workflow, reducing registration time and eliminating manual errors',
      'Developed interactive analytics dashboards for better seller decision-making',
      'Integrated Braintree payment gateway with comprehensive edge-case handling',
    ],
  ),
  const Experience(
    id: '2',
    title: 'Flutter Developer',
    company: 'Hexamile',
    location: 'Faisalabad, Pakistan',
    startDate: 'Dec 2023',
    endDate: 'Feb 2024',
    description:
        'Worked on Sonata App — a social platform with posts, comments, and real-time feeds.',
    responsibilities: [
      'Built core features including posts, comments, and real-time feeds',
      'Implemented OTP-based multi-method authentication (Sign-up, Login, Google, Facebook)',
      'Optimized Firestore listeners to eliminate real-time update lag',
      'Patched security vulnerabilities in data pipelines, improving overall app integrity',
    ],
  ),
  const Experience(
    id: '3',
    title: 'BS in Software Engineering',
    company: 'Riphah International University (RIUF)',
    location: 'Pakistan',
    startDate: '2020',
    endDate: '2024',
    description:
        'Bachelor of Science in Software Engineering with focus on mobile application development and software engineering principles.',
    responsibilities: [
      'Final Year Project: Meal Match — AI-powered nutritionist app',
      'Relevant coursework in Data Structures, Algorithms, and Mobile Development',
      'Hands-on experience building cross-platform applications with Flutter',
    ],
    isEducation: true,
  ),
];
