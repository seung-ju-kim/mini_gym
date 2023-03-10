import 'package:flutter/material.dart';
import 'package:minigym/constants/sizes.dart';

class AddBodyPartButton extends StatefulWidget {
  final String part;

  const AddBodyPartButton({
    super.key,
    required this.part,
  });

  @override
  State<AddBodyPartButton> createState() => _AddBodyPartButtonState();
}

class _AddBodyPartButtonState extends State<AddBodyPartButton> {
  bool _isSelected = false;

  void _onTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 300,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size10,
          horizontal: Sizes.size24,
        ),
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          border: Border.all(color: Colors.black.withOpacity(0.1)),
          borderRadius: BorderRadius.circular(Sizes.size10),
        ),
        child: Text(
          widget.part,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _isSelected ? Colors.white : Colors.black87,
          ),
        ),
      ),
    );
  }
}
