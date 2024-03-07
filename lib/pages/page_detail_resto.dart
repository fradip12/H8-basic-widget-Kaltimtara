import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_one/controller/resto_provider.dart';
import 'package:session_one/models/restaurant_models.dart';

class PageRestoDetail extends StatefulWidget {
  const PageRestoDetail({super.key});

  @override
  State<PageRestoDetail> createState() => _PageRestoDetailState();
}

class _PageRestoDetailState extends State<PageRestoDetail> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<RestoProvider>(context);
    return Consumer<RestoProvider>(builder: (_, restoProv, __) {
      return Scaffold(
        appBar: AppBar(
          title: Text(restoProv.selectedResto?.name ?? '-'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              ListView.builder(
                primary: true,
                shrinkWrap: true,
                itemCount: restoProv.selectedResto?.menus?.length,
                itemBuilder: (_, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(restoProv.selectedResto?.menus?[index].menu ?? '-'),
                      Text(
                          'Rp. ${restoProv.selectedResto?.menus?[index].price ?? '0'}'),
                      InkWell(
                        onTap: () {
                          prov.addProduct(
                              restoProv.selectedResto!.menus![index]);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Berhasil menambahkan ${restoProv.selectedResto!.menus![index].menu} ke keranjang !!!',
                              ),
                            ),
                          );
                        },
                        child: const Icon(Icons.add),
                      )
                    ],
                  );
                },
              ),
              Icon(
                Icons.favorite,
                color: (restoProv.selectedResto?.isFavorite ?? false)
                    ? Colors.pink
                    : Colors.grey,
              )
            ],
          ),
        ),
      );
    });
  }
}
