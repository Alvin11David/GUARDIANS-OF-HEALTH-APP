import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TrendsStatsScreen extends StatelessWidget {
  const TrendsStatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle = GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w800,
      color: Colors.black,
      height: 1.1,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _HeaderSection(),
              const _DateSelectorRow(),
              _UserSummarySection(titleStyle: titleStyle),
              const _ResistancePatternSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  const _HeaderSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      height: 190,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/back.png',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFECECEC), Color(0xFFD6D6D6)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  );
                },
              ),
            ),
            // slight overlay for contrast
            Container(color: Colors.black.withOpacity(0.05)),
            // Top controls
            Positioned(
              left: 12,
              right: 12,
              top: 12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _circleButton(
                    context,
                    icon: Icons.arrow_back_ios_new_rounded,
                    onTap: () => Navigator.of(context).maybePop(),
                  ),
                  Row(
                    children: [
                      _circleButton(context, icon: Icons.notifications_none_rounded),
                      const SizedBox(width: 8),
                      _circleButton(context, icon: Icons.person_outline_rounded, isProfile: true),
                    ],
                  ),
                ],
              ),
            ),
            // Center title - positioned exactly as in design
            Positioned(
              left: 0,
              right: 0,
              top: 0,
              bottom: 0,
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'TRENDS\n',
                        style: GoogleFonts.poppins(
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          letterSpacing: 2.0,
                          height: 0.8,
                        ),
                      ),
                      TextSpan(
                        text: '& STATS',
                        style: GoogleFonts.poppins(
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          letterSpacing: 2.0,
                          height: 0.8,
                        ),
                      ),
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

  Widget _circleButton(BuildContext context, {required IconData icon, VoidCallback? onTap, bool isProfile = false}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFF4CAF50), // Lighter green outline
            width: 1.5,
          ),
        ),
        child: isProfile 
          ? ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                'assets/images/pro.png',
                width: 36,
                height: 36,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Container(
                    color: Colors.grey[200],
                    child: Icon(Icons.person, size: 20, color: Colors.grey[600]),
                  );
                },
              ),
            )
          : Stack(
              children: [
                Center(
                  child: Icon(icon, size: 20, color: Colors.black),
                ),
                if (icon == Icons.notifications_none_rounded)
                  Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF4CAF50),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
              ],
            ),
      ),
    );
  }
}

class _DateSelectorRow extends StatelessWidget {
  const _DateSelectorRow();

  @override
  Widget build(BuildContext context) {
    final items = [
      _DateItem(label: 'Sun', day: '01', active: false),
      _DateItem(label: 'Mon', day: '02', active: false),
      _DateItem(label: 'Tue', day: '03', active: false),
      _DateItem(label: 'Wed', day: '04', active: true),
      _DateItem(label: 'Thu', day: '05', active: false),
      _DateItem(label: 'Fri', day: '06', active: false),
      _DateItem(label: 'Sat', day: '07', active: false),
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: items.map((item) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: item,
          )).toList(),
        ),
      ),
    );
  }
}

class _DateItem extends StatelessWidget {
  final String label;
  final String day;
  final bool active;
  const _DateItem({required this.label, required this.day, required this.active});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 85,
      decoration: BoxDecoration(
        color: active ? const Color(0xFFFFD700) : Colors.black, // Yellow for active, black for inactive
        borderRadius: BorderRadius.circular(42),
        boxShadow: active ? [
          const BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ] : null,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              color: active ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: active ? Colors.black : const Color(0xFFFFD700),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                day,
                style: GoogleFonts.poppins(
                  color: active ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _UserSummarySection extends StatelessWidget {
  final TextStyle titleStyle;
  const _UserSummarySection({required this.titleStyle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('User Summary Section', style: titleStyle.copyWith(fontSize: 20)),
          const SizedBox(height: 4),
          Text('Here is your AMR health update', style: GoogleFonts.poppins(color: Colors.black54)),
          const SizedBox(height: 12),
          SizedBox(
            height: 300,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child:                     _DetailedSummaryCard(
                      color: const Color(0xFF66BB6A),
                      title: 'Infections\nRecorded',
                      subtitle: 'Yearly Basis',
                      value: '0%',
                      icon: Icons.health_and_safety_outlined,
                      chartType: 'line',
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child:                     _DetailedSummaryCard(
                      color: const Color(0xFFFF599E),
                      title: 'Antibiotics\nPrescribed',
                      subtitle: '',
                      value: '0\nTablets',
                      icon: Icons.medication_liquid_outlined,
                      chartType: 'bar',
                    ),
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child:                     _DetailedSummaryCard(
                      color: const Color(0xFF3C71FF),
                      title: 'Resistance\nDetected',
                      subtitle: '',
                      value: '0\nDetected',
                      icon: Icons.bug_report_outlined,
                      chartType: 'donut',
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
}

class _DetailedSummaryCard extends StatefulWidget {
  final Color color;
  final String title;
  final String subtitle;
  final String value;
  final IconData icon;
  final String chartType;
  
  const _DetailedSummaryCard({
    required this.color,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.icon,
    required this.chartType,
  });

  @override
  State<_DetailedSummaryCard> createState() => _DetailedSummaryCardState();
}

class _DetailedSummaryCardState extends State<_DetailedSummaryCard>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _chartController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _chartAnimation;

  @override
  void initState() {
    super.initState();
    
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    
    _chartController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOut),
    );
    
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _scaleController, curve: Curves.elasticOut),
    );
    
    _chartAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _chartController, curve: Curves.easeInOut),
    );

    // Start animations with staggered delays
    Future.delayed(Duration(milliseconds: 200 * (widget.chartType == 'line' ? 0 : widget.chartType == 'bar' ? 1 : 2)), () {
      _fadeController.forward();
      _scaleController.forward();
    });
    
    Future.delayed(Duration(milliseconds: 400 + (widget.chartType == 'line' ? 0 : widget.chartType == 'bar' ? 200 : 400)), () {
      _chartController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _chartController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_fadeAnimation, _scaleAnimation]),
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: Container(
              height: 280,
              decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: widget.color.withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Top section with title and icon
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedBuilder(
                                animation: _fadeAnimation,
                                builder: (context, child) {
                                  return Transform.translate(
                                    offset: Offset(0, 20 * (1 - _fadeAnimation.value)),
                                    child: Opacity(
                                      opacity: _fadeAnimation.value,
                                      child: Text(
                                        widget.title,
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                          height: 1.1,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              if (widget.subtitle.isNotEmpty) ...[
                                const SizedBox(height: 4),
                                AnimatedBuilder(
                                  animation: _fadeAnimation,
                                  builder: (context, child) {
                                    return Transform.translate(
                                      offset: Offset(0, 15 * (1 - _fadeAnimation.value)),
                                      child: Opacity(
                                        opacity: _fadeAnimation.value,
                                        child: Text(
                                          widget.subtitle,
                                          style: GoogleFonts.poppins(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 11,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ],
                          ),
                        ),
                        AnimatedBuilder(
                          animation: _scaleAnimation,
                          builder: (context, child) {
                            return Transform.scale(
                              scale: 0.8 + (0.2 * _scaleAnimation.value),
                              child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: widget.icon == Icons.health_and_safety_outlined
                                      ? Icon(
                                          Icons.health_and_safety_outlined,
                                          color: widget.color,
                                          size: 32,
                                        )
                                      : widget.icon == Icons.bug_report_outlined
                                          ? Icon(
                                              Icons.bug_report_outlined,
                                              color: widget.color,
                                              size: 32,
                                            )
                                          : Icon(
                                              widget.icon,
                                              color: widget.color,
                                              size: 32,
                                            ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // Value
                    Flexible(
                      child: AnimatedBuilder(
                        animation: _fadeAnimation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, 30 * (1 - _fadeAnimation.value)),
                            child: Opacity(
                              opacity: _fadeAnimation.value,
                              child: Text(
                                widget.value,
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: 28,
                                  height: 1.0,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Chart section
                    Expanded(
                      child: AnimatedBuilder(
                        animation: _chartAnimation,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: 0.7 + (0.3 * _chartAnimation.value),
                            child: Opacity(
                              opacity: _chartAnimation.value,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: _buildChart(),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildChart() {
    switch (widget.chartType) {
      case 'line':
        return _buildLineChart();
      case 'bar':
        return _buildBarChart();
      case 'donut':
        return _buildDonutChart();
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildLineChart() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 18,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('100', style: GoogleFonts.poppins(fontSize: 7, color: Colors.grey[600])),
                    Text('75', style: GoogleFonts.poppins(fontSize: 7, color: Colors.grey[600])),
                    Text('50', style: GoogleFonts.poppins(fontSize: 7, color: Colors.grey[600])),
                    Text('25', style: GoogleFonts.poppins(fontSize: 7, color: Colors.grey[600])),
                    Text('0', style: GoogleFonts.poppins(fontSize: 7, color: Colors.grey[600])),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.grey.shade300),
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: CustomPaint(
                    painter: _LineChartPainter(animation: _chartAnimation),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const SizedBox(width: 22),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['J', 'F', 'M', 'A', 'S', 'O', 'N', 'D']
                    .map((month) => Text(
                          month,
                          style: GoogleFonts.poppins(fontSize: 7, color: Colors.grey[600]),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBarChart() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 18,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('150', style: GoogleFonts.poppins(fontSize: 7, color: Colors.grey[600])),
                    Text('120', style: GoogleFonts.poppins(fontSize: 7, color: Colors.grey[600])),
                    Text('90', style: GoogleFonts.poppins(fontSize: 7, color: Colors.grey[600])),
                    Text('60', style: GoogleFonts.poppins(fontSize: 7, color: Colors.grey[600])),
                    Text('20', style: GoogleFonts.poppins(fontSize: 7, color: Colors.grey[600])),
                  ],
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.grey.shade300),
                      bottom: BorderSide(color: Colors.grey.shade300),
                    ),
                  ),
                  child: CustomPaint(
                    painter: _BarChartPainter(animation: _chartAnimation),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            const SizedBox(width: 22),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: ['J', 'F', 'M', 'A', 'S', 'O', 'N', 'D']
                    .map((month) => Text(
                          month,
                          style: GoogleFonts.poppins(fontSize: 7, color: Colors.grey[600]),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDonutChart() {
    return Center(
      child: CustomPaint(
        size: const Size(120, 120),
        painter: _DonutChartPainter(animation: _chartAnimation),
      ),
    );
  }
}

class _LineChartPainter extends CustomPainter {
  final Animation<double> animation;
  
  _LineChartPainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Draw horizontal line at 0% (bottom of chart) with animation
    final y = size.height * 0.95; // Near bottom
    final animatedWidth = size.width * animation.value;
    canvas.drawLine(
      Offset(0, y),
      Offset(animatedWidth, y),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _BarChartPainter extends CustomPainter {
  final Animation<double> animation;
  
  _BarChartPainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey.shade400
      ..style = PaintingStyle.fill;

    // Draw small circles at 0 level for each month with animation
    final monthWidth = size.width / 8;
    final animatedCount = (8 * animation.value).round();
    for (int i = 0; i < animatedCount; i++) {
      final x = (i + 0.5) * monthWidth;
      final y = size.height * 0.95;
      final scale = animation.value;
      canvas.drawCircle(Offset(x, y), 3 * scale, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _DonutChartPainter extends CustomPainter {
  final Animation<double> animation;
  
  _DonutChartPainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 8;
    final innerRadius = radius * 0.55;

    // More vibrant and lively colors matching the design
    final colors = [
      const Color(0xFFFFFFFF), // White (large segment)
      const Color(0xFFF59E0B), // Orange/Amber (medium segment)
      const Color(0xFFEF4444), // Red (medium segment)
      const Color(0xFF1E40AF), // Dark blue (large segment)
      const Color(0xFF1E3A8A), // Darker blue (small segment)
      const Color(0xFF06B6D4), // Teal (medium segment)
      const Color(0xFF10B981), // Light green (medium segment)
    ];

    // Segment sizes to match the design proportions
    final segmentSizes = [0.25, 0.15, 0.15, 0.2, 0.08, 0.1, 0.07]; // Total = 1.0

    final paint = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;

    double currentAngle = -1.5708; // Start from top (-π/2)
    final animatedSegments = (colors.length * animation.value).round();

    for (int i = 0; i < animatedSegments; i++) {
      paint.color = colors[i];
      final sweepAngle = segmentSizes[i] * 2 * 3.14159 * animation.value;
      
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        currentAngle,
        sweepAngle,
        true,
        paint,
      );
      
      currentAngle += sweepAngle;
    }

    // Draw inner circle (white center) with animation
    paint.color = Colors.white;
    final animatedInnerRadius = innerRadius * animation.value;
    canvas.drawCircle(center, animatedInnerRadius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _ResistancePatternSection extends StatefulWidget {
  const _ResistancePatternSection();

  @override
  State<_ResistancePatternSection> createState() => _ResistancePatternSectionState();
}

class _ResistancePatternSectionState extends State<_ResistancePatternSection>
    with TickerProviderStateMixin {
  late AnimationController _chartController;
  late Animation<double> _chartAnimation;

  @override
  void initState() {
    super.initState();
    _chartController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _chartAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _chartController, curve: Curves.easeInOut),
    );
    _chartController.forward();
  }

  @override
  void dispose() {
    _chartController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Your Resistance Pattern', style: GoogleFonts.poppins(fontWeight: FontWeight.w800, fontSize: 18, color: Colors.black)),
          const SizedBox(height: 12),
          Container(
            height: 260,
            decoration: BoxDecoration(
              color: const Color(0xFF004D4D),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4))],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Legend
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('KEY', style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 11,
                              )),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 2,
                                    color: const Color(0xFF1E90FF),
                                    margin: const EdgeInsets.only(right: 8),
                                  ),
                                  Text('Susceptible Cases', style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 11,
                                  )),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Row(
                                children: [
                                  Container(
                                    width: 20,
                                    height: 2,
                                    color: const Color(0xFFFF4500),
                                    margin: const EdgeInsets.only(right: 8),
                                  ),
                                  Text('Resistant Cases', style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 11,
                                  )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Chart
                    Expanded(
                      child: AnimatedBuilder(
                        animation: _chartAnimation,
                        builder: (context, child) {
                          return CustomPaint(
                            painter: _ResistanceChartPainter(animation: _chartAnimation),
                            size: Size.infinite,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ResistanceChartPainter extends CustomPainter {
  final Animation<double> animation;
  
  _ResistanceChartPainter({required this.animation}) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    // Chart dimensions
    final chartWidth = size.width - 40;
    final chartHeight = size.height - 20;
    final leftPadding = 30.0;
    final topPadding = 10.0;

    // Data points
    final susceptibleData = [9.0, 11.0, 13.0, 12.0, 14.0, 10.0, 9.0, 11.0];
    final resistantData = [1.0, 3.0, 5.0, 6.0, 4.0, 2.0, 1.0, 3.0];
    final weeks = ['W1', 'W2', 'W3', 'W4', 'W5', 'W6', 'W7', 'W8'];

    // Y-axis values
    final yValues = [0, 3, 6, 9, 12, 15];
    final maxValue = 15.0;

    // Draw Y-axis label
    textPainter.text = TextSpan(
      text: 'Resistance Level',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w600,
      ),
    );
    textPainter.layout();
    canvas.save();
    canvas.translate(8, size.height / 2);
    canvas.rotate(-1.5708); // -90 degrees
    textPainter.paint(canvas, Offset.zero);
    canvas.restore();

    // Draw grid lines
    paint.color = Colors.white.withOpacity(0.2);
    paint.strokeWidth = 1.0;
    paint.style = PaintingStyle.stroke;

    for (int i = 0; i < yValues.length; i++) {
      final y = topPadding + (chartHeight * (1 - yValues[i] / maxValue));
      canvas.drawLine(
        Offset(leftPadding, y),
        Offset(leftPadding + chartWidth, y),
        paint,
      );
    }

    // Draw Y-axis labels
    for (int i = 0; i < yValues.length; i++) {
      final y = topPadding + (chartHeight * (1 - yValues[i] / maxValue));
      textPainter.text = TextSpan(
        text: yValues[i].toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(leftPadding - 25, y - 6),
      );
    }

    // Draw X-axis labels
    final weekWidth = chartWidth / weeks.length;
    for (int i = 0; i < weeks.length; i++) {
      final x = leftPadding + (i * weekWidth) + (weekWidth / 2);
      textPainter.text = TextSpan(
        text: weeks[i],
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - 8, chartHeight + topPadding + 5),
      );
    }

    // Convert data to chart coordinates
    List<Offset> susceptiblePoints = [];
    List<Offset> resistantPoints = [];

    for (int i = 0; i < susceptibleData.length; i++) {
      final x = leftPadding + (i * weekWidth) + (weekWidth / 2);
      final susceptibleY = topPadding + (chartHeight * (1 - (susceptibleData[i] * animation.value) / maxValue));
      final resistantY = topPadding + (chartHeight * (1 - (resistantData[i] * animation.value) / maxValue));
      
      susceptiblePoints.add(Offset(x, susceptibleY));
      resistantPoints.add(Offset(x, resistantY));
    }

    // Draw susceptible line
    paint.color = const Color(0xFF1E90FF);
    paint.strokeWidth = 2.5;
    paint.style = PaintingStyle.stroke;
    
    for (int i = 0; i < susceptiblePoints.length - 1; i++) {
      canvas.drawLine(susceptiblePoints[i], susceptiblePoints[i + 1], paint);
    }

    // Draw resistant line
    paint.color = const Color(0xFFFF4500);
    paint.strokeWidth = 2.5;
    paint.style = PaintingStyle.stroke;
    
    for (int i = 0; i < resistantPoints.length - 1; i++) {
      canvas.drawLine(resistantPoints[i], resistantPoints[i + 1], paint);
    }

    // Draw data points
    paint.style = PaintingStyle.fill;
    
    // Susceptible points
    paint.color = const Color(0xFF1E90FF);
    for (final point in susceptiblePoints) {
      canvas.drawCircle(point, 4, paint);
    }

    // Resistant points
    paint.color = const Color(0xFFFF4500);
    for (final point in resistantPoints) {
      canvas.drawCircle(point, 4, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Bottom navigation bar removed as requested.