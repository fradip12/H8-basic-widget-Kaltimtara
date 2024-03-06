import 'package:flutter/material.dart';
import 'package:session_one/models/restaurant_models.dart';

class PageRestoDetail extends StatefulWidget {
  final RestaurantModels arguments;
  const PageRestoDetail({super.key, required this.arguments});

  @override
  State<PageRestoDetail> createState() => _PageRestoDetailState();
}

class _PageRestoDetailState extends State<PageRestoDetail> {
  int angka = 0;
  @override
  void initState() {
    super.initState();
    print('===== Init State Page Detail =====');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('========= Dispose Page Detail ======== ');
  }

  // @override
  // void deactivate() {
  //   // TODO: implement deactivate
  //   super.deactivate();
  //   print('======= Deactivate Page Detail ======= ');
  // }

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   print('======== Did Change Dependenciees ======== ');
  // }

  @override
  Widget build(BuildContext context) {
    // final arguments =
    //     ModalRoute.of(context)?.settings.arguments as RestaurantModels;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arguments.name ?? '-'),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => setState(() {
          angka++;
        }),
        child: Icon(
          Icons.add,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            ListView.builder(
              primary: true,
              shrinkWrap: true,
              itemCount: widget.arguments.menus?.length,
              itemBuilder: (_, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.arguments.menus?[index].menu ?? '-'),
                    Text('Rp. ${widget.arguments.menus?[index].price ?? '0'}'),
                  ],
                );
              },
            ),
            Text(
              '$angka',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
            // Expanded(
            //   child: Row(
            //     children: List.generate(
            //       arguments.rating == '-'
            //           ? 0
            //           : double.parse(arguments.rating ?? '0') ~/ 1,
            //       (index) => Icon(
            //         Icons.star,
            //         color: Colors.orangeAccent,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
