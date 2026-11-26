import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const Color bg = Color(0xFF0B1012);
  static const Color card = Color(0xFF171F21);
  static const Color lime = Color(0xFFB8F34A);
  static const Color muted = Color(0xFF91A0A2);

  String get userName {
    final user = Supabase.instance.client.auth.currentUser;
    final name = user?.userMetadata?['full_name']?.toString();

    if (name != null && name.trim().isNotEmpty) {
      return name.trim().split(' ').first;
    }

    return 'Athlete';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 18, 20, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              Row(
                children: [
                  Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      color: lime,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: const Icon(
                      Icons.fitness_center,
                      color: bg,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 11),
                  const Text(
                    'GYMALIGNA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: card,
                    child: const Icon(Icons.person_outline, color: lime),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // GREETING
              const Text(
                'WELCOME BACK,',
                style: TextStyle(
                  color: muted,
                  fontSize: 12,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '$userName 👋',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 7),
              const Text(
                'Ready to become stronger today?',
                style: TextStyle(color: muted, fontSize: 14),
              ),

              const SizedBox(height: 25),

              // HERO CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(23),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF394D25), Color(0xFF1B2920)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.bolt, color: lime, size: 17),
                        SizedBox(width: 6),
                        Text(
                          'YOUR FITNESS JOURNEY',
                          style: TextStyle(
                            color: lime,
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 17),
                    const Text(
                      'BUILD YOUR\nSTRONGER SELF.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 29,
                        height: 1.15,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Train smart. Move right. Stay strong.',
                      style: TextStyle(color: Color(0xFFD2DEC8), fontSize: 13),
                    ),
                    const SizedBox(height: 22),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: lime,
                        foregroundColor: bg,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 13,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'START WORKOUT',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // DAILY STATS
              const _SectionTitle(
                title: "TODAY'S ACTIVITY",
                subtitle: 'Your daily fitness overview',
              ),
              const SizedBox(height: 14),

              const Row(
                children: [
                  Expanded(
                    child: _StatCard(
                      icon: Icons.local_fire_department,
                      value: '0',
                      label: 'Calories',
                    ),
                  ),
                  SizedBox(width: 11),
                  Expanded(
                    child: _StatCard(
                      icon: Icons.timer_outlined,
                      value: '0 min',
                      label: 'Active time',
                    ),
                  ),
                  SizedBox(width: 11),
                  Expanded(
                    child: _StatCard(
                      icon: Icons.fitness_center,
                      value: '0',
                      label: 'Workouts',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 29),

              // MUSCLE GROUPS
              const _SectionTitle(
                title: 'TRAIN BY MUSCLE',
                subtitle: 'Choose your training focus',
              ),
              const SizedBox(height: 15),

              SizedBox(
                height: 112,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    _MuscleCard(icon: Icons.accessibility_new, title: 'Chest'),
                    _MuscleCard(icon: Icons.fitness_center, title: 'Back'),
                    _MuscleCard(icon: Icons.directions_run, title: 'Legs'),
                    _MuscleCard(
                      icon: Icons.sports_gymnastics,
                      title: 'Shoulders',
                    ),
                    _MuscleCard(icon: Icons.sports_handball, title: 'Arms'),
                    _MuscleCard(icon: Icons.self_improvement, title: 'Core'),
                  ],
                ),
              ),

              const SizedBox(height: 29),

              // WORKOUT PLAN
              const _SectionTitle(
                title: "TODAY'S WORKOUT",
                subtitle: 'A simple routine to get started',
              ),
              const SizedBox(height: 14),

              const _WorkoutTile(
                number: '01',
                title: 'Warm-up',
                subtitle: 'Dynamic stretches and mobility',
                duration: '5 min',
                icon: Icons.directions_walk,
              ),
              const SizedBox(height: 10),
              const _WorkoutTile(
                number: '02',
                title: 'Push-ups',
                subtitle: '3 sets × 12 reps',
                duration: '8 min',
                icon: Icons.fitness_center,
              ),
              const SizedBox(height: 10),
              const _WorkoutTile(
                number: '03',
                title: 'Bodyweight Squats',
                subtitle: '3 sets × 15 reps',
                duration: '8 min',
                icon: Icons.accessibility_new,
              ),
              const SizedBox(height: 10),
              const _WorkoutTile(
                number: '04',
                title: 'Plank',
                subtitle: '3 sets × 30 seconds',
                duration: '5 min',
                icon: Icons.self_improvement,
              ),

              const SizedBox(height: 29),

              // AI FORM ANALYSIS
              Container(
                padding: const EdgeInsets.all(19),
                decoration: BoxDecoration(
                  color: card,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFF35452A)),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 49,
                      width: 49,
                      decoration: BoxDecoration(
                        color: const Color(0xFF293820),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: const Icon(
                        Icons.center_focus_strong,
                        color: lime,
                        size: 26,
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'AI FORM ANALYSIS',
                            style: TextStyle(
                              color: lime,
                              fontSize: 11,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Improve your exercise technique',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Get feedback on your movements.',
                            style: TextStyle(color: muted, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, color: lime, size: 16),
                  ],
                ),
              ),

              const SizedBox(height: 28),

              // MOTIVATION
              const Center(
                child: Text(
                  'EVERY REP COUNTS.',
                  style: TextStyle(
                    color: lime,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              const Center(
                child: Text(
                  'GYMALIGNA  •  TRAIN SMARTER',
                  style: TextStyle(
                    color: muted,
                    fontSize: 10,
                    letterSpacing: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// SECTION HEADING

class _SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const _SectionTitle({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.6,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(color: HomePage.muted, fontSize: 12),
        ),
      ],
    );
  }
}

// STATISTICS CARD

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _StatCard({
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 9),
      decoration: BoxDecoration(
        color: HomePage.card,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: HomePage.lime, size: 21),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 19,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(color: HomePage.muted, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

// MUSCLE GROUP CARD

class _MuscleCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const _MuscleCard({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 91,
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: HomePage.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: HomePage.lime, size: 28),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// WORKOUT LIST ITEM

class _WorkoutTile extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;
  final String duration;
  final IconData icon;

  const _WorkoutTile({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: HomePage.card,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Text(
            number,
            style: const TextStyle(
              color: HomePage.lime,
              fontWeight: FontWeight.w900,
              fontSize: 13,
            ),
          ),
          const SizedBox(width: 13),
          Container(
            height: 42,
            width: 42,
            decoration: BoxDecoration(
              color: const Color(0xFF293820),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: HomePage.lime, size: 21),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  subtitle,
                  style: const TextStyle(color: HomePage.muted, fontSize: 10),
                ),
              ],
            ),
          ),
          Text(
            duration,
            style: const TextStyle(
              color: HomePage.lime,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
