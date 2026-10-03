class Project {
  final String id;
  final String title;
  final String description;
  final String longDescription;
  final List<String> techStack;
  final String? githubUrl;
  final String? demoUrl;
  final String? imageUrl;
  final bool isFeatured;

  const Project({
    required this.id,
    required this.title,
    required this.description,
    required this.longDescription,
    required this.techStack,
    this.githubUrl,
    this.demoUrl,
    this.imageUrl,
    this.isFeatured = false,
  });
}

// Real projects from resume
final List<Project> sampleProjects = [
  const Project(
    id: '1',
    title: 'Inspire Uplift Marketplace',
    description:
        'E-commerce marketplace app with 20+ million products, 55,000+ sellers, and 2 million+ customers worldwide.',
    longDescription:
        'Built and launched the Marketplace application for a global e-commerce platform. Integrated secure payment gateway, real-time messaging, REST APIs, and Firebase Firestore for real-time order tracking and seller analytics. Focused on performance optimization and reducing crash rates through improved state management.',
    techStack: ['Flutter', 'Firebase', 'REST APIs', 'Braintree', 'Firestore'],
    isFeatured: true,
  ),
  const Project(
    id: '2',
    title: 'Inspire Uplift Seller Central',
    description:
        'Seller dashboard enabling product management, order tracking, and interactive analytics.',
    longDescription:
        'Developed the Seller Central app that allows sellers to manage products, orders, and view analytics. Implemented real-time order tracking, interactive dashboards, and automated seller onboarding workflow that significantly reduced registration time and eliminated manual data entry errors.',
    techStack: ['Flutter', 'Firebase', 'REST APIs', 'Analytics', 'State Management'],
    isFeatured: true,
  ),
  const Project(
    id: '3',
    title: 'Live Streaming & Social Engagement Platform',
    description:
        'Real-time chat, audio/video calls, live streaming, and in-app support with payment integration.',
    longDescription:
        'Managed real-time chat, audio and video call interactions. Operated live streaming sessions, integrated payment gateway, developed in-app customer support ticket system, and implemented real-time data synchronisation across live comments, reactions, and transactions.',
    techStack: ['Flutter', 'WebSocket', 'Firebase', 'Payment Gateway', 'Real-time'],
    isFeatured: true,
  ),
  const Project(
    id: '4',
    title: 'Sonata App (Social Platform)',
    description:
        'Social platform with posts, comments, real-time feeds, and multi-method authentication.',
    longDescription:
        'Built core features of Sonata App including posts, comments, and real-time feeds. Implemented OTP-based multi-method authentication (Sign-up, Login, Google, Facebook). Optimized Firestore listeners to eliminate real-time update lag and patched security vulnerabilities in data pipelines.',
    techStack: ['Flutter', 'Firebase Auth', 'Firestore', 'OTP', 'Social Login'],
  ),
  const Project(
    id: '5',
    title: 'Pocket Tools',
    description:
        'Multi-tool Flutter app with 20+ utilities including QR scanner, password generator, and unit converter.',
    longDescription:
        'Built a multi-tool Flutter application featuring 20+ integrated utilities for everyday tasks. Developed core tools including QR code generator and scanner, password generator, and unit converter. Focused on lightweight, fast-loading UI to support quick access across a large number of tools.',
    techStack: ['Flutter', 'Riverpod', 'Local Storage', 'QR'],
  ),
  const Project(
    id: '6',
    title: 'Meal Match (Nutritionist App) - FYP',
    description:
        'AI-powered nutrition tracker with calorie calculator, food log, and dietitian consultation.',
    longDescription:
        'Built an AI-powered nutrition tracker with calorie calculator, food log, and diet recommendations. Integrated dietitian consultation feature for real-time personalised health advice. Helped users track food habits and analyze nutritional intake with real-time data processing.',
    techStack: ['Flutter', 'Firebase', 'AI Integration', 'Health'],
  ),
  const Project(
    id: '7',
    title: 'Sneaker Shop App',
    description:
        'E-commerce platform for sneakers with product grid, size selection, coupons, and checkout.',
    longDescription:
        'Developed an e-commerce platform for sneaker enthusiasts featuring curated collections from brands like Nike and Jordan. Implemented product grid, detailed sneaker pages with size selection, streamlined checkout with coupon support, and a clean modern UI.',
    techStack: ['Flutter', 'E-commerce', 'UI/UX'],
  ),
];
