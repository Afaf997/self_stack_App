import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:self_stack/advisor/bloc/dashboard/bloc/batch_bloc.dart';
import 'package:self_stack/advisor/response/domain_model.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/widget/add_batch_dialog.dart';
import 'package:self_stack/advisor/screens/admin_dashboard_screen.dart/widget/batch_list.dart';
import 'package:self_stack/advisor/screens/navigation_screen.dart/navigation_admin.dart';
import 'package:self_stack/advisor/services/batch_services.dart/get_batch.dart';
import 'package:self_stack/advisor/services/batch_services.dart/post_batch.dart';
import 'package:self_stack/utils/constans.dart';

class BatchScreen extends StatefulWidget {
  const BatchScreen({Key? key}) : super(key: key);

  @override
  _BatchScreenState createState() => _BatchScreenState();
}

class _BatchScreenState extends State<BatchScreen> {
  late Future<Welcome> future;

  @override
  void initState() {
    super.initState();
    future = BatchService().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BatchBloc, BatchState>(
      listener: (context, state) {
        if (state is navigationState) {
          _showAddDialog(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false, 
            backgroundColor: kbackgroundmodel,
            title: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("All Batches",style: TextStyle(color: kwhiteModel,fontWeight: FontWeight.bold,fontSize: 25),),
            ),
          ),
          backgroundColor: kbackgroundmodel,
          body: _buildBody(),
          floatingActionButton: _buildFloatingActionButton(),
        );
      },
    );
  }


  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Container(
        child: _buildFutureBuilder(),
      ),
    );
  }

  FutureBuilder<Welcome> _buildFutureBuilder() {
    return FutureBuilder<Welcome>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingWidget();
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final welcome = snapshot.data!;
          return BatchList(welcome: welcome);
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(
        color: kselfstackGreen,
      ),
    );
  }

  FloatingActionButton _buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        BlocProvider.of<BatchBloc>(context).add(NavigationEvent());
      },
      child: Icon(Icons.add, color: kwhiteModel),
      backgroundColor: kselfstackGreen,
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

  Future<void> _showAddDialog(BuildContext context) async {
    // String batchNumber = '';
    // DateTime? startDate;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddBatchDialog(
          onAddPressed: (batchNumber, startDate) {
            Navigator.of(context).pop();
            _addNewContainer(batchNumber, startDate);
          },
        );
      },
    );
  }

  void _addNewContainer(String batchNumber, DateTime? startDate) async {
    try {
      bool success = await BatchPostService().PostBatchDetails(batchNumber, startDate!);

      if (success) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavbarAdmin()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add batch. Please try again.'),
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again later.$e'),
        ),
      );
    }
  }
}
