import 'package:flutter/material.dart';

class ItemView extends StatelessWidget {
  const ItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.orangeAccent,
            borderRadius: BorderRadius.circular(10)),
        height: 200,
        width: 350,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(top: 20, left: 15, bottom: 15),
        child: Row(
          children: [
            const SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Flutter tips ",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Build your career with Ahmed Mohammad ",
                    style: TextStyle(color: Colors.black54, fontSize: 15),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.delete_sharp),
                    color: Colors.black,
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      "May 21,2024",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
