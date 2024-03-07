import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_one/controller/recipes_controller.dart';

class PageRestoDetail extends StatefulWidget {
  const PageRestoDetail({super.key});

  @override
  State<PageRestoDetail> createState() => _PageRestoDetailState();
}

class _PageRestoDetailState extends State<PageRestoDetail> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<RecipesProvider>(context);
    return Consumer<RecipesProvider>(
      builder: (_, data, __) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 250.0,
                automaticallyImplyLeading: false,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    data.selectedData?.name ?? '-',
                    style: TextStyle(color: Colors.black54),
                  ),
                  background: Image.network(
                    data.selectedData?.image ?? '',
                    fit: BoxFit.fill,
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.add_circle),
                    tooltip: 'Add new entry',
                    onPressed: () {/* ... */},
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      title:
                          Text(data.selectedData?.ingredients?[index] ?? '-'),
                    );
                  },
                  childCount: data.selectedData?.ingredients?.length,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      title:
                          Text(data.selectedData?.instructions?[index] ?? '-'),
                    );
                  },
                  childCount: data.selectedData?.instructions?.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
