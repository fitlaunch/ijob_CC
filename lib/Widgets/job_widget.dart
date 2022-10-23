import 'package:flutter/material.dart';

class JobWidget extends StatefulWidget {
  const JobWidget({
    Key? key,
    required this.jobTitle,
    required this.jobDescription,
    required this.jobId,
    required this.uploadedBy,
    required this.userImage,
    required this.name,
    required this.recruitment,
    required this.email,
    required this.address,
  }) : super(key: key);

  final String jobTitle;
  final String jobDescription;
  final String jobId;
  final String uploadedBy;
  final String userImage;
  final String name;
  final bool recruitment;
  final String email;
  final String address;

  @override
  State<JobWidget> createState() => _JobWidgetState();
}

class _JobWidgetState extends State<JobWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white24,
        elevation: 8,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: ListTile(
          onTap: () {},
          onLongPress: () {},
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          leading: Container(
            padding: const EdgeInsets.only(right: 12),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(width: 1),
              ),
            ),
            child: Image.network(widget.userImage),
          ),
          title: Text(
            widget.jobTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text('Post Creator: ', style: TextStyle(fontSize: 12)),
                  Text(
                    widget.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.jobDescription,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const Text('soemthing')
                ],
              ),
            ],
          ),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
