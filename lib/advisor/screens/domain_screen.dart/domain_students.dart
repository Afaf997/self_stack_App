import 'package:flutter/material.dart';
import 'package:self_stack/advisor/response/domain.dart';
import 'package:self_stack/advisor/screens/domain_screen.dart/list_of_domain_student.dart';
import 'package:self_stack/advisor/services/domain_service/get_domain.dart';
import 'package:self_stack/utils/constans.dart';

class DomainPage extends StatefulWidget {
  DomainPage({Key? key}) : super(key: key);

  @override
  _DomainPageState createState() => _DomainPageState();
}

class _DomainPageState extends State<DomainPage> {
  late Future<List<Domain>> _domainDataFuture;

  @override
  void initState() {
    super.initState();
    _domainDataFuture = _fetchDomainData();
  }

  Future<List<Domain>> _fetchDomainData() async {
    try {
      final service = DomainStudentService();
      final data = await service.DomainStudentData();
      return List<Domain>.from(data.map((domainJson) => Domain.fromJson(domainJson)));
    } catch (error) {
      print('Error fetching domain data: $error');
      throw Exception("Error fetching domain data: $error");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackgroundmodel,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: kselfstackGreen,
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(55.0),
            bottomLeft: Radius.circular(55.0),
          ),
        ),
        title: const Text(
          'Domain Students',
          style: TextStyle(
            color: kwhiteModel,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Domain>>(
        future: _domainDataFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final   domain = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DomainStudent(domain:domain ,)),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: kblackDark,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          domain.image.toString(),
                          width: double.infinity,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 10.0),
                        Center(
                          child: Text(
                            '${domain.courseName}',
                            maxLines: 2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: kwhiteModel,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          children: [
                            Text(
                              'Number of Tasks: ',
                              style: TextStyle(
                                fontSize: 13.0,
                                color: kwhiteModel,
                              ),
                            ),
                            Text(
                              '${domain.tasks!.length.toString()}',
                              style: TextStyle(
                                fontSize: 13.0,
                                color: kredtheme,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Number Of Students: ${domain.students!.length}',
                          style: TextStyle(
                            fontSize: 13.0,
                            color: kwhiteModel,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
