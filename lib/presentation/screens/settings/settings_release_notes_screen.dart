import 'package:flutter/material.dart';
import 'package:retail_mobile/config/app_colors.dart';

class SettingsReleaseNotesScreen extends StatelessWidget {
  final List<ReleaseInfo> releases;

  const SettingsReleaseNotesScreen({
    super.key,
    required this.releases,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primaryButtonColor),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Center(
                  child: Text(
                    'Release Updates',
                    style: TextStyle(
                      color: AppColors.primaryButtonColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: releases.length,
                itemBuilder: (context, index) {
                  return ReleaseItem(
                    releaseInfo: releases[index],
                    isExpanded: index == 0,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReleaseInfo {
  final String version;
  final String releaseDate;
  final List<String> description;
  final List<String>? warnings;

  ReleaseInfo({
    required this.version,
    required this.releaseDate,
    required this.description,
    this.warnings,
  });
}

class ReleaseItem extends StatefulWidget {
  final ReleaseInfo releaseInfo;
  final bool isExpanded;

  const ReleaseItem({
    super.key,
    required this.releaseInfo,
    this.isExpanded = false,
  });

  @override
  State<ReleaseItem> createState() => _ReleaseItemState();
}

class _ReleaseItemState extends State<ReleaseItem> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                const Text(
                  'RU',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 20,
                  width: 1,
                  color: AppColors.lightGrey,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Version: ${widget.releaseInfo.version}',
                        style: const TextStyle(fontSize: 14),
                      ),
                      Text(
                        'Release Date: ${widget.releaseInfo.releaseDate}',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                  color: AppColors.primaryButtonColor,
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded) ...[
          Padding(
            padding: const EdgeInsets.only(left: 36, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Text(
                  'Version Description',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: AppColors.primaryButtonColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                ...widget.releaseInfo.description.asMap().entries.map((entry) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${entry.key + 1}. '),
                      Expanded(child: Text(entry.value)),
                    ],
                  );
                }),
                if (widget.releaseInfo.warnings != null) ...[
                  const SizedBox(height: 8),
                  const Padding(
                    padding: EdgeInsets.only(left: 36),
                    child: Text(
                      'Warnings',
                      style: TextStyle(
                        color: AppColors.primaryButtonColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
        const Divider(
          color: AppColors.lightGrey,
        ),
      ],
    );
  }
}
