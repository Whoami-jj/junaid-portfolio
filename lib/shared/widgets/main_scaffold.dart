import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  static const _routes = ['/', '/projects', '/skills', '/experience', '/contact'];

  int _selectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    for (var i = 1; i < _routes.length; i++) {
      if (location.startsWith(_routes[i])) return i;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: child,
        ),
      ),
      bottomNavigationBar: _Dock(
        selectedIndex: _selectedIndex(context),
        onSelected: (i) => context.go(_routes[i]),
      ),
    );
  }
}

class _DockItem {
  final String label;
  final IconData icon;
  final IconData activeIcon;
  const _DockItem(this.label, this.icon, this.activeIcon);
}

class _Dock extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const _Dock({required this.selectedIndex, required this.onSelected});

  static const _items = [
    _DockItem('Home', Icons.home_outlined, Icons.home_rounded),
    _DockItem('Projects', Icons.apps_outlined, Icons.apps_rounded),
    _DockItem('Skills', Icons.layers_outlined, Icons.layers_rounded),
    _DockItem('Experience', Icons.timeline_outlined, Icons.timeline_rounded),
    _DockItem('Contact', Icons.mail_outline_rounded, Icons.mail_rounded),
  ];

  @override
  Widget build(BuildContext context) {
    final c = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: c.surface,
        border: Border(top: BorderSide(color: c.outlineVariant)),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 720),
              child: Row(
                children: [
                  for (var i = 0; i < _items.length; i++)
                    Expanded(
                      child: _DockButton(
                        item: _items[i],
                        selected: i == selectedIndex,
                        onTap: () => onSelected(i),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DockButton extends StatelessWidget {
  final _DockItem item;
  final bool selected;
  final VoidCallback onTap;

  const _DockButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final c = theme.colorScheme;
    final color = selected ? c.primary : c.onSurfaceVariant;

    return Semantics(
      button: true,
      selected: selected,
      label: item.label,
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 3,
              decoration: BoxDecoration(
                color: selected ? c.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 6),
            Icon(selected ? item.activeIcon : item.icon, size: 24, color: color),
            const SizedBox(height: 2),
            Text(
              item.label,
              style: theme.textTheme.labelMedium?.copyWith(
                fontSize: 12,
                color: color,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
