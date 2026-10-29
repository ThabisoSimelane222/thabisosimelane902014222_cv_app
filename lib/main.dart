
import 'package:flutter/material.dart';

void main() {
  runApp(const MyCVApp());
}

class MyCVApp extends StatelessWidget {
  const MyCVApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Thabiso Simelane CV App',
      theme: ThemeData(
        primaryColor: const Color(0xFF142C59),
        scaffoldBackgroundColor: const Color(0xFFF4F7FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF079568),
        ),
        useMaterial3: true,
      ),
      home: const CVHomePage(),
    );
  }
}

class CVHomePage extends StatefulWidget {
  const CVHomePage({super.key});

  @override
  State<CVHomePage> createState() => _CVHomePageState();
}

class _CVHomePageState extends State<CVHomePage> {
  int selectedIndex = 0;

  final Color navy = const Color(0xFF142C59);
  final Color green = const Color(0xFF079568);

  final List<String> pageTitles = [
    'Thabiso Mlondi Simelane CV',
    'Skills & Experience',
    'Education',
    'Contact Me',
  ];

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget sectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 8),
      child: Row(
        children: [
          Icon(icon, color: green, size: 27),
          const SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: navy,
            ),
          ),
        ],
      ),
    );
  }

  Widget makeCard(Widget child) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
    );
  }


  Widget homeScreen() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: navy,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 58,
                backgroundColor: green,
                child: const CircleAvatar(
                  radius: 53,
                  backgroundImage:
                  AssetImage('images/thabiso.jpg'),
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Thabiso  Mlondi Simelane ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Bachelor of Science in Information Technology Student | Junior Developer',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.greenAccent.shade100,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'I am an BScIT student interested in software '
                    'development, mobile applications and solving '
                    'problems using technology. I enjoy learning '
                    'new skills and developing useful applications.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
        sectionTitle('Quick Contact', Icons.contact_mail),
        makeCard(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              contactIcon(Icons.email, 'Email', 'thabisosimelane222@gmail.com'),
              contactIcon(Icons.phone, 'Phone', '+268 79412229 0r 78427443'),
              contactIcon(Icons.link, 'LinkedIn', 'Thabiso Simelane'),
              contactIcon(Icons.code, 'GitHub', 'Thabiso Simelane222'),
            ],
          ),
        ),
        makeCard(
          Row(
            children: [
              Icon(Icons.format_quote, color: green, size: 32),
              const Expanded(
                child: Text(
                  'Turning ideas into digital solutions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF142C59),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget contactIcon(IconData icon, String label, String detail) {
    return Expanded(
      child: InkWell(
        onTap: () => showMessage('$label: $detail'),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: green,
                child: Icon(icon, color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // SCREEN 2: SKILLS AND EXPERIENCE
  Widget skillsScreen() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        makeCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle('My Skills', Icons.stars),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  'Flutter',
                  'C++',
                  'Java Script',
                  'HTML/CSS',
                  'Communication',
                  'Problem Solving',
                ].map((skill) {
                  return Chip(
                    label: Text(
                      skill,
                      style: const TextStyle(color: Colors.white),
                    ),
                    backgroundColor: green,
                    side: BorderSide.none,
                  );
                }).toList(),
              ),
              const SizedBox(height: 18),
              skillBar('Flutter', 0.65),
              skillBar('C++', 0.75),
              skillBar('Java Script', 0.60),
              skillBar('HTML/CSS', 0.70),
              skillBar('Communication', 0.90),
              skillBar('Problem Solving', 0.85),
            ],
          ),
        ),
        makeCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle('Work / Project Experience', Icons.work),
              experienceItem(
                'Student Project - CV App',
                'October 2026 - Present',
                'Designing a personal CV mobile application '
                    'using Flutter widgets.',
              ),
              const Divider(height: 28),
              experienceItem(
                'Tourism Records System',
                'Academic Project',
                'Developing a C++ application to manage tourism '
                    'records and improve record keeping.',
              ),
              const Divider(height: 28),
              experienceItem(
                'Web Design Project',
                'Academic Project',
                'Learning to create website interfaces using '
                    'HTML and CSS.',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget skillBar(String name, double value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name),
              Text('${(value * 100).round()}%'),
            ],
          ),
          const SizedBox(height: 7),
          LinearProgressIndicator(
            value: value,
            minHeight: 8,
            backgroundColor: Colors.blueGrey.shade100,
            color: green,
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }

  Widget experienceItem(
      String title,
      String date,
      String description,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: navy,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          date,
          style: TextStyle(color: green, fontSize: 13),
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: const TextStyle(height: 1.5),
        ),
      ],
    );
  }

  Widget educationScreen() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        makeCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle('Education', Icons.school),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: CircleAvatar(
                  backgroundColor: green,
                  child: const Icon(
                    Icons.account_balance,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  'Bacholor of Sceince in Information Technology',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Limkokwing University of Creative Technology',
                ),
              ),
            ],
          ),
        ),
        makeCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle('Certifications', Icons.workspace_premium),
              certificateItem(
                'Bachelor of  Science in Infomation Technology',
                'Currently in year 2 ',
              ),
              certificateItem(
                'Eswatini General Certificate of Secondary Education',
                'Completed November 2023',
              ),
              certificateItem(
                'Web Development (HTML/CSS)',
                'Completed 2025',
              ),
            ],
          ),
        ),
        makeCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sectionTitle('Career Objective', Icons.flag),
              const Text(
                'To develop my knowledge of information '
                    'technology, gain practical experience and '
                    'contribute to useful software projects.',
                style: TextStyle(height: 1.6),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget certificateItem(String name, String year) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.verified, color: green),
      title: Text(name),
      subtitle: Text(year),
    );
  }

  // SCREEN 4: CONTACT DETAILS
  Widget contactScreen() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        makeCard(
          Column(
            children: [
              CircleAvatar(
                radius: 38,
                backgroundColor: green,
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 48,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Thabiso  Mlondi Simelane ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF142C59),
                ),
              ),
              const SizedBox(height: 6),
              const Text('BSc IT Student | Junior Developer'),
              const SizedBox(height: 20),
              const Divider(),
              contactRow(
                Icons.email,
                'Email',
                'thabisosimelane222@gmail.com',
              ),
              contactRow(
                Icons.phone,
                'Phone',
                '+268 79412229 or 78427443',
              ),
              contactRow(
                Icons.link,
                'LinkedIn',
                'Thabiso Simelane',
              ),
              contactRow(
                Icons.code,
                'GitHub',
                'ThabisoSimelane222',
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    showMessage(
                      'thabisosimelame222@gmail.com'

                          '79412229.',
                    );
                  },
                  icon: const Icon(Icons.send),
                  label: const Text('Contact Me'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget contactRow(IconData icon, String label, String value) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: navy,
        child: Icon(icon, color: Colors.white),
      ),
      title: Text(label),
      subtitle: Text(value),
      onTap: () => showMessage('$label: $value'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      homeScreen(),
      skillsScreen(),
      educationScreen(),
      contactScreen(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: navy,
        foregroundColor: Colors.white,
        title: Text(pageTitles[selectedIndex]),
        centerTitle: true,
      ),
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: pages,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        backgroundColor: Colors.white,
        indicatorColor: green.withValues(alpha: 0.15),
        onDestinationSelected: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.code),
            label: 'Skills',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Education',
          ),
          NavigationDestination(
            icon: Icon(Icons.email_outlined),
            selectedIcon: Icon(Icons.email),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}
