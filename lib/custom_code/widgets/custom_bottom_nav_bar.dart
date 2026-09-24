// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/backend/supabase/supabase.dart';
import '/app_events/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_fonts/google_fonts.dart';
import 'package:shotcount/project/project_page/project_page_widget.dart';
import 'package:shotcount/your_projects/your_projects_page/your_projects_page_widget.dart';
import 'package:shotcount/more/more_page/more_page_widget.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({
    super.key,
    this.width,
    this.height,
    required this.currentPage,
  });

  final double? width;
  final double? height;
  final int currentPage;

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    pageIndex = widget.currentPage;
  }

  List<IconData> navIcons = [
    Icons.folder_rounded,
    Icons.access_time_rounded,
    Icons.person_rounded,
  ];

  List<String> navLabels = ["Project", "Your Projects", "More"];

  // TODO: replace with your actual page widgets
  List<Widget> _appPages = [
    ProjectPageWidget(),
    YourProjectsPageWidget(),
    MorePageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);

    return Scaffold(
      bottomNavigationBar: Container(
        color: theme.primaryBackground,
        padding: const EdgeInsets.only(top: 12, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(navIcons.length, (index) {
            final bool isSelected = pageIndex == index;
            final Color color = isSelected ? theme.primary : theme.containerClr;

            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() {
                  pageIndex = index;
                });
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    navIcons[index],
                    color: color,
                    size: 24,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    navLabels[index],
                    style: GoogleFonts.inter(
                      color: color,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // Small indicator dot below the label
                  Container(
                    height: 5,
                    width: 5,
                    decoration: BoxDecoration(
                      color: isSelected ? theme.primary : Colors.transparent,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
      body: SafeArea(child: _appPages[pageIndex]),
    );
  }
}
