import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lift/domain/hire/model/hire_company.dart';

class ListHireItemWidget extends StatelessWidget {
  HireCompany hireCompany;

  ListHireItemWidget({Key? key, required this.hireCompany}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: CachedNetworkImage(
              imageUrl: hireCompany.img,
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Container(),
        ),
        ),
        Text(
          hireCompany.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Text(
          hireCompany.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 10, color: Colors.black),
        ),
        FittedBox(
          fit: BoxFit.contain,
          child: Row(
            children: [
              Text(
                getCompanyAddress(hireCompany.address.split(' ')).toString(),
                style: const TextStyle(fontSize: 10, color: Colors.black),
              ),
              const Text(
                ' • ',
                style: TextStyle(fontSize: 10, color: Colors.black),
              ),
              Text(
                "경력 ${hireCompany.exprMin}~${hireCompany.exprMax}년",
                style: const TextStyle(fontSize: 10, color: Colors.black),
              ),
            ],
          ),
        )

      ],
    );
  }

  String getCompanyAddress(List<String> list)  {
    return (list.length >= 2) ? "${list[0]} ${list[1]}" : "";
  }
}
