import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
  super.key,
  required this.press,
  required this.text,
  });
  final Function() press;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: 200,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),

        ),
        child:  Center(child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.blue),)),
      ),
    );
  }
}

// class RoundedButton extends StatelessWidget {
//   const RoundedButton({
//     required this.text,
//     required this.press,
//     this.fontSize = 16,
//     this.verticalPadding = 16,
//
//     Key? key,
//   }) : super(key: key);
//
//   final String text;
//   final Function() press;
//   final double fontSize;
//   final double verticalPadding;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: press,
//       child: Container(
//         margin:const EdgeInsets.symmetric(vertical: 16),
//         padding:  EdgeInsets.symmetric(vertical:16, horizontal: 20 ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: Colors.white,
//           boxShadow: const [
//             BoxShadow(
//               offset: Offset(0, 15),
//               blurRadius: 70,
//               color: Colors.grey,
//             )
//           ],
//         ),
//         child: Text(text,
//           style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold
//           ),),
//       ),
//     );
//   }
// }