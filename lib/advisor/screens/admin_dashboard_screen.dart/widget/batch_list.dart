import 'package:flutter/material.dart';
import 'package:self_stack/advisor/response/domain_model.dart';
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
                        builder: (context) => StudentsBatchScreen(index: index,),
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
        color: kblackDark,
        // borderRadius: BorderRadius.circular(8.0), 
        borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))
        // border: Border.all(
        //   color: kwhiteModel,
        //   width:0.7
        // ), 
        // border: BorderDirectional(start: BorderSide(color: kwhiteModel),)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Text(
              'Batch  ${batch.batch.name}',
              style: const TextStyle(
                color:kwhiteModel,
                fontSize: 22,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 40,
            width: double.infinity,
            color: Color.fromARGB(132, 158, 158, 158),
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
