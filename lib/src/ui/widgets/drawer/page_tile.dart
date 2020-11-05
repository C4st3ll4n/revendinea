import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool highlited;
  final Function onTap;

  const PageTile({Key key, this.label, this.icon, this.highlited, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: TextStyle(
          color: highlited ? Colors.purple : Colors.black54, fontWeight: FontWeight.w700
        ),
      ),
      leading: Icon(
        icon,
        color: highlited ? Colors.purple : Colors.black54,
      ),
      onTap: onTap,
    );
  }
}
