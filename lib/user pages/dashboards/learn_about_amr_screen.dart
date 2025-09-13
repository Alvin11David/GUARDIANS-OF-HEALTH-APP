import 'package:flutter/material.dart';

class LearnAboutAMRScreen extends StatefulWidget {
  const LearnAboutAMRScreen({Key? key}) : super(key: key);

  @override
  State<LearnAboutAMRScreen> createState() => _LearnAboutAMRScreenState();
}

class _LearnAboutAMRScreenState extends State<LearnAboutAMRScreen> {
  int _selectedIndex = 0;
  int? _expandedCardIndex;

  final List<_NavBarItem> _navItems = [
    _NavBarItem(icon: Icons.home, label: 'Home'),
    _NavBarItem(icon: Icons.chat_bubble_outline, label: 'Chat'),
    _NavBarItem(icon: Icons.person_outline, label: 'Profile'),
  ];

  // Card data with expanded content
  final List<Map<String, dynamic>> _cardData = [
    {
      'title': 'What is AMR?',
      'shortContent': 'Antimicrobial Resistance explained',
      'expandedContent': 'Antimicrobial resistance (AMR) occurs when bacteria, viruses, fungi and parasites change over time and no longer respond to medicines making infections harder to treat and increasing the risk of disease spread, severe illness and death.\n\nKey Points:\n• Microorganisms develop resistance naturally\n• Overuse and misuse accelerate this process\n• Makes standard treatments ineffective\n• Can affect anyone, anywhere',
      'color': Color(0xFFFFFF44), // Yellow
      'textColor': Colors.black,
      'icon': Icons.settings,
    },
    {
      'title': 'Why is AMR a Problem?',
      'shortContent': 'Understanding the global threat',
      'expandedContent': 'AMR is one of the top global public health and development threats. It makes infections harder to treat and makes other medical procedures and treatments much riskier.\n\nConsequences:\n• Longer hospital stays\n• Higher medical costs\n• Increased mortality\n• Failed surgeries and treatments\n• Economic burden on healthcare systems\n• Threatens modern medicine',
      'color': Color(0xFF1C79F8), // Blue
      'textColor': Colors.white,
    },
    {
      'title': 'How Does Resistance Happen?',
      'shortContent': 'The science behind resistance',
      'expandedContent': 'Resistance develops through natural selection and genetic changes in microorganisms when exposed to antimicrobials.\n\nProcess:\n1. Exposure to antimicrobials\n2. Susceptible microorganisms die\n3. Resistant ones survive and multiply\n4. Resistance genes spread\n5. Treatment becomes ineffective\n\nMain drivers:\n• Overuse in humans and animals\n• Inappropriate prescribing\n• Poor infection control',
      'color': Color(0xFF874D36), // Brown
      'textColor': Colors.white,
    },
    {
      'title': 'Global & Local Impact',
      'shortContent': 'Worldwide consequences',
      'expandedContent': 'AMR affects countries at all levels of development and threatens the achievements of modern medicine.\n\nGlobal Impact:\n• 700,000+ deaths annually worldwide\n• Could cause 10 million deaths by 2050\n• Economic cost: \$100 trillion by 2050\n\nLocal Impact:\n• Increased healthcare costs\n• Longer treatment periods\n• Higher risk of complications\n• Strain on healthcare resources',
      'color': Color(0xFFFF9203), // Orange
      'textColor': Colors.black,
    },
    {
      'title': 'How You Can Help',
      'shortContent': 'Your role in fighting AMR',
      'expandedContent': 'Everyone has a role to play in reducing the impact of antimicrobial resistance.\n\nWhat You Can Do:\n• Only take antibiotics when prescribed\n• Complete the full course of treatment\n• Never share or save leftover antibiotics\n• Prevent infections through good hygiene\n• Get vaccinated when available\n• Practice safe food handling\n• Avoid demanding antibiotics from healthcare providers',
      'color': Color(0xFFFF03B8), // Pink/Magenta
      'textColor': Colors.white,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Header
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back arrow
                      _circleIcon(Icons.arrow_back, Colors.white, Colors.black,
                          onTap: () {
                        Navigator.of(context).maybePop();
                      }),
                      // Action icons
                      Row(
                        children: [
                          _circleIcon(Icons.bookmark_outline,
                              const Color(0xFF3FD317), Colors.white),
                          const SizedBox(width: 14),
                          _circleIcon(Icons.notifications_none, Colors.white,
                              Colors.black),
                          const SizedBox(width: 14),
                          const CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.white,
                            backgroundImage:
                                AssetImage('assets/images/profile.png'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Title and subtitle
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ABOUT
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'ABOUT',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                                letterSpacing: -1.5,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '"Understand what AMR (Antimicrobial Resistance) is, why it matters, and how we can fight it together"',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black87,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // AMR + Virus Icon
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  'AMR',
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 4),
                                Icon(Icons.coronavirus,
                                    color: Color(0xFF3FD317), size: 28),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          // Expandable Cards List
          Positioned(
            left: 0,
            right: 0,
            top: 200,
            bottom: 74, // Above the nav bar
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                itemCount: _cardData.length,
                itemBuilder: (context, index) {
                  return _buildExpandableCard(index);
                },
              ),
            ),
          ),
          // Docked Navigation Bar
          _buildDockedNavBar(),
        ],
      ),
    );
  }

  Widget _buildDockedNavBar() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Center(
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width * 0.8,
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xFF3FD317),
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.12),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_navItems.length, (index) {
              final item = _navItems[index];
              final isActive = _selectedIndex == index;

              return GestureDetector(
                onTap: () => setState(() => _selectedIndex = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? Colors.white : Colors.transparent,
                  ),
                  child: Icon(
                    item.icon,
                    size: 26,
                    color: isActive ? const Color(0xFF3FD317) : Colors.white,
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildExpandableCard(int index) {
    final cardData = _cardData[index];
    final isExpanded = _expandedCardIndex == index;
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _expandedCardIndex = isExpanded ? null : index;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: cardData['color'],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      cardData['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: cardData['textColor'],
                      ),
                    ),
                  ),
                  if (cardData['icon'] != null)
                    Icon(
                      cardData['icon'],
                      color: cardData['textColor'],
                      size: 20,
                    ),
                ],
              ),
              const SizedBox(height: 8),
              AnimatedCrossFade(
                firstChild: Text(
                  cardData['shortContent'],
                  style: TextStyle(
                    fontSize: 14,
                    color: cardData['textColor'].withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                secondChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cardData['expandedContent'],
                      style: TextStyle(
                        fontSize: 14,
                        color: cardData['textColor'],
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: cardData['textColor'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        'Tap to collapse',
                        style: TextStyle(
                          fontSize: 12,
                          color: cardData['textColor'].withOpacity(0.7),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleIcon(IconData icon, Color bgColor, Color iconColor,
      {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 6,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
    );
  }
}

class _NavBarItem {
  final IconData icon;
  final String label;
  const _NavBarItem({required this.icon, required this.label});
}
