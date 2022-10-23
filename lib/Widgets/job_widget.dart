import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ijob_code_cafe/Services/global_method.dart';

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
  final FirebaseAuth _auth = FirebaseAuth.instance;

  _deleteDialog() {
    User? user = _auth.currentUser;
    final _uid = user!.uid;
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            actions: [
              TextButton(
                onPressed: () async {
                  try {
                    if (widget.uploadedBy == _uid) {
                      await FirebaseFirestore.instance
                          .collection('jobs')
                          .doc(widget.jobId)
                          .delete();
                      await Fluttertoast.showToast(
                          msg: 'Job has been removed',
                          toastLength: Toast.LENGTH_LONG,
                          backgroundColor: Colors.grey,
                          fontSize: 18);
                      Navigator.canPop(context) ? Navigator.pop(context) : null;
                    } else {
                      GlobalMethod.showErrorDialog(
                          error: 'You cannot perform this action', ctx: ctx);
                    }
                  } catch (error) {
                    GlobalMethod.showErrorDialog(
                      error: 'Not so fast. You cannot do this action',
                      ctx: ctx,
                    );
                  } finally {}
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white24,
        elevation: 8,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: ListTile(
          onTap: () {},
          onLongPress: () {
            _deleteDialog();
          },
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
                  const Text(
                      'something could go here, but would prefer category')
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
