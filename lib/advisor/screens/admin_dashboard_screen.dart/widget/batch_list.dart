import 'package:flutter/material.dart';
import 'package:self_stack/advisor/response/batch_model.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/list_of_students.dart';
import 'package:self_stack/utils/constans.dart';

class BatchList extends StatelessWidget {
  final Welcome welcome;

  const BatchList({Key? key, required this.welcome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
              ),
              itemCount: welcome.batches.length,
              itemBuilder: (BuildContext context, int index) {
                final batch = welcome.batches[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentsBatchScreen(),
                      ),
                    );
                  },
                  child: buildGridItem(batch),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridItem(BatchElement batch) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 172, 172, 172),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Text(
              'BATCH ${batch.batch.name}',
              style: const TextStyle(
                color:kblackDark,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 40,
            width: double.infinity,
            color: kblackLight,
            child: Center(
              child: Text(
                '${batch.batch.studentIds?.length ?? 0} Students',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
