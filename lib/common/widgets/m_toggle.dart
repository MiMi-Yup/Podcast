import 'package:flutter/material.dart';

class MToggle extends StatelessWidget {

  final bool initState;
  final bool Function(bool)? onToogle;
  final Widget child;
  final Widget? whenTrue;

  const MToggle(
      {super.key,
      required this.child,
      required this.initState,
      this.onToogle,
      this.whenTrue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (onToogle != null) {
            onToogle!(initState);
          }
        },
        child: initState ? whenTrue : child);
  }
}

// class MToggle extends StatefulWidget {
//   final bool initState;
//   final bool Function(bool)? onToogle;
//   final Widget child;
//   final Widget? whenTrue;
//   const MToggle(
//       {super.key,
//       required this.child,
//       required this.initState,
//       this.onToogle,
//       this.whenTrue});

//   @override
//   State<MToggle> createState() => _MToggleState();
// }

// class _MToggleState extends State<MToggle> {
//   late bool state;

//   @override
//   void initState() {
//     super.initState();
//     state = widget.initState;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         behavior: HitTestBehavior.translucent,
//         onTap: () {
//           if (widget.onToogle != null) {
//             final newState = widget.onToogle!(state);
//             if (newState != state) {
//               setState(() => state = newState);
//             }
//           }
//         },
//         child: state ? widget.whenTrue : widget.child);
//   }
// }
