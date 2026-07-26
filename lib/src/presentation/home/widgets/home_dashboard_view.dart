import 'package:eeagle_ai/gen/assets.gen.dart';
import 'package:eeagle_ai/src/domain/model/site.dart';
import 'package:eeagle_ai/src/presentation/home/widgets/home_website_thumbnail.dart';
import 'package:eeagle_ai/src/presentation/ui/theme/eeagle_theme.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text.dart';
import 'package:eeagle_ai/src/presentation/ui/typography/eeagle_text_style.dart';
import 'package:flutter/material.dart';

class HomeDashboardView extends StatefulWidget {
  const HomeDashboardView({
    super.key,
    required this.displayName,
    required this.initials,
    required this.sites,
    required this.onCreatePrompt,
    required this.onOpenSite,
    required this.onPreviewSite,
    required this.onShowProjects,
    required this.onLogout,
    required this.onRefresh,
  });

  final String displayName;
  final String initials;
  final List<Site> sites;
  final ValueChanged<String> onCreatePrompt;
  final ValueChanged<Site> onOpenSite;
  final ValueChanged<Site> onPreviewSite;
  final VoidCallback onShowProjects;
  final VoidCallback onLogout;
  final Future<void> Function() onRefresh;

  @override
  State<HomeDashboardView> createState() => _HomeDashboardViewState();
}

class _HomeDashboardViewState extends State<HomeDashboardView> {
  final _promptController = TextEditingController();

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  void _submitPrompt() {
    final prompt = _promptController.text.trim();
    if (prompt.isNotEmpty) widget.onCreatePrompt(prompt);
  }

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 116),
        children: [
          Row(
            children: [
              Image.asset(Assets.icons.eegaleIc.path, width: 44, height: 44),
              const SizedBox(width: 10),
              EeagleText(
                'eeagle.ai',
                style: EeagleTextStyles.titleLarge,
                textColor: colors.titleNatural,
              ),
              const Spacer(),
              PopupMenuButton<String>(
                tooltip: 'Account',
                color: const Color(0xFF182235),
                onSelected: (value) {
                  if (value == 'sign-out') widget.onLogout();
                },
                itemBuilder: (_) => const [
                  PopupMenuItem<String>(
                    value: 'sign-out',
                    child: Row(
                      children: [
                        Icon(Icons.logout_rounded, color: Colors.white),
                        SizedBox(width: 10),
                        Text('Sign out', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ],
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF2763D8), Color(0xFF6B2E91)],
                    ),
                    border: Border.all(color: const Color(0xFF688CF4)),
                  ),
                  alignment: Alignment.center,
                  child: Center(
                    child: Text(
                      widget.initials,
                      style: EeagleTextStyles.titleMedium.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 52),
          EeagleText(
            'Hey ${widget.displayName}!',
            style: EeagleTextStyles.headlineMedium,
            textColor: colors.titleNatural,
          ),
          const SizedBox(height: 4),
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF77B7FF), Color(0xFF577DFF), Color(0xFF8B4EFF)],
            ).createShader(bounds),
            child: Text(
              'What are we building today?',
              style: EeagleTextStyles.headlineMedium,
            ),
          ),
          const SizedBox(height: 12),
          EeagleText(
            'Your AI partner for building, launching, and growing your website.',
            style: EeagleTextStyles.bodyLarge,
            textColor: colors.bodyText,
          ),
          const SizedBox(height: 28),
          _PromptComposer(
            controller: _promptController,
            onSubmit: _submitPrompt,
          ),
          const SizedBox(height: 32),
          _SectionHeader(
            title: 'Start a project',
            action: 'View all',
            onTap: widget.onShowProjects,
          ),
          const SizedBox(height: 14),
          SizedBox(
            height: 150,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _projectIdeas.length,
              separatorBuilder: (_, _) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final idea = _projectIdeas[index];
                return _ProjectIdeaCard(
                  idea: idea,
                  onTap: () => widget.onCreatePrompt(idea.prompt),
                );
              },
            ),
          ),
          const SizedBox(height: 28),
          _RecentProjects(
            sites: widget.sites,
            onViewAll: widget.onShowProjects,
            onOpen: widget.onOpenSite,
            onPreview: widget.onPreviewSite,
          ),
        ],
      ),
    );
  }
}

class _PromptComposer extends StatelessWidget {
  const _PromptComposer({required this.controller, required this.onSubmit});
  final TextEditingController controller;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 14, 14, 14),
      decoration: BoxDecoration(
        color: const Color(0xCC121D31),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: const Color(0xFF365384)),
        boxShadow: const [BoxShadow(color: Color(0x332A63FF), blurRadius: 24)],
      ),
      child: Column(
        children: [
          TextField(
            controller: controller,
            minLines: 2,
            maxLines: 4,
            textInputAction: TextInputAction.newline,
            style: EeagleTextStyles.bodyLarge.copyWith(
              color: colors.titleNatural,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Just say it - we will bring your idea to life.',
              hintStyle: EeagleTextStyles.bodyLarge.copyWith(
                color: colors.bodyText,
              ),
            ),
          ),
          Row(
            children: [
              const Icon(
                Icons.auto_awesome,
                color: Color(0xFF5DA7FF),
                size: 22,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Try: "Create a landing page for a SaaS product"',
                  style: EeagleTextStyles.bodySmall.copyWith(
                    color: const Color(0xFF5C8DFF),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              IconButton.filled(
                tooltip: 'Build website',
                onPressed: onSubmit,
                style: IconButton.styleFrom(
                  backgroundColor: const Color(0xFF486EF2),
                  foregroundColor: Colors.white,
                  fixedSize: const Size(48, 48),
                ),
                icon: const Icon(Icons.send_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.action,
    required this.onTap,
  });
  final String title;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    return Row(
      children: [
        Expanded(
          child: EeagleText(
            title,
            style: EeagleTextStyles.titleLarge,
            textColor: colors.titleNatural,
          ),
        ),
        TextButton.icon(
          onPressed: onTap,
          iconAlignment: IconAlignment.end,
          icon: const Icon(Icons.chevron_right_rounded, size: 18),
          label: Text(action),
          style: TextButton.styleFrom(foregroundColor: colors.bodyText),
        ),
      ],
    );
  }
}

class _ProjectIdea {
  const _ProjectIdea(
    this.title,
    this.subtitle,
    this.prompt,
    this.icon,
    this.color,
  );
  final String title;
  final String subtitle;
  final String prompt;
  final IconData icon;
  final Color color;
}

const _projectIdeas = [
  _ProjectIdea(
    'Landing Page',
    'Convert visitors',
    'Create a polished landing page with a strong hero, benefits, social proof, and a clear call to action.',
    Icons.web_rounded,
    Color(0xFF4B91FF),
  ),
  _ProjectIdea(
    'SaaS Website',
    'Show your product',
    'Create a modern SaaS website with product features, use cases, pricing, FAQ, and signup calls to action.',
    Icons.code_rounded,
    Color(0xFF8759E8),
  ),
  _ProjectIdea(
    'Online Store',
    'Launch e-commerce',
    'Create an online store with featured products, collections, product pages, trust sections, and a clear checkout journey.',
    Icons.shopping_cart_outlined,
    Color(0xFFF35FA8),
  ),
  _ProjectIdea(
    'Portfolio',
    'Showcase your work',
    'Create a personal portfolio with selected projects, skills, an about section, testimonials, and contact details.',
    Icons.person_outline_rounded,
    Color(0xFF64C77B),
  ),
];

class _ProjectIdeaCard extends StatelessWidget {
  const _ProjectIdeaCard({required this.idea, required this.onTap});
  final _ProjectIdea idea;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    return SizedBox(
      width: 142,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: Ink(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xB3131E31),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xFF2E4264)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(idea.icon, color: idea.color, size: 34),
                const Spacer(),
                EeagleText(
                  idea.title,
                  style: EeagleTextStyles.titleSmall,
                  textColor: colors.titleNatural,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                EeagleText(
                  idea.subtitle,
                  style: EeagleTextStyles.bodySmall,
                  textColor: colors.bodyText,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RecentProjects extends StatelessWidget {
  const _RecentProjects({
    required this.sites,
    required this.onViewAll,
    required this.onOpen,
    required this.onPreview,
  });
  final List<Site> sites;
  final VoidCallback onViewAll;
  final ValueChanged<Site> onOpen;
  final ValueChanged<Site> onPreview;

  @override
  Widget build(BuildContext context) {
    final colors = EeagleTheme.of(context).colors;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xB3131E31),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF2E4264)),
      ),
      child: Column(
        children: [
          _SectionHeader(
            title: 'Recent projects',
            action: 'See all',
            onTap: onViewAll,
          ),
          if (sites.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: EeagleText(
                'Your first website will appear here.',
                style: EeagleTextStyles.bodyMedium,
                textColor: colors.bodyText,
              ),
            )
          else
            for (final site in sites.take(3))
              ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () => onOpen(site),
                leading: HomeWebsiteThumbnail(site: site),
                title: EeagleText(
                  site.name,
                  style: EeagleTextStyles.titleSmall,
                  textColor: colors.titleNatural,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: EeagleText(
                  site.host,
                  style: EeagleTextStyles.bodySmall,
                  textColor: colors.bodyText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: IconButton(
                  tooltip: 'Preview website',
                  onPressed: () => onPreview(site),
                  icon: const Icon(Icons.open_in_new_rounded),
                  color: colors.bodyText,
                ),
              ),
        ],
      ),
    );
  }
}
