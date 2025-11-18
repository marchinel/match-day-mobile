import 'package:flutter/material.dart';
import 'package:matchday_mobile/models/product_entry.dart';
import 'package:matchday_mobile/widgets/left_drawer.dart';
import 'package:matchday_mobile/screens/product_detail.dart';
import 'package:matchday_mobile/widgets/product_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductEntryListPage extends StatefulWidget {
  const ProductEntryListPage({super.key});

  @override
  State<ProductEntryListPage> createState() => _ProductEntryListPageState();
}

class _ProductEntryListPageState extends State<ProductEntryListPage> {
  String selectedView = "all"; // ⭐ NEW: toggle state

  Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
    final response = await request.get('http://localhost:8000/json/');
    var data = response;

    List<ProductEntry> listProduct = [];
    for (var d in data) {
      if (d != null) {
        listProduct.add(ProductEntry.fromJson(d));
      }
    }
    return listProduct;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    final currentUserId = request.jsonData['user_id'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Entry List'),
      ),
      drawer: const LeftDrawer(),

      // ⭐ NEW: bungkus FutureBuilder dalam Column agar bisa tambah toggle
      body: Column(
        children: [
          const SizedBox(height: 12),

          // ⭐ NEW: Segmented Toggle
          SegmentedButton<String>(
            segments: const <ButtonSegment<String>>[
              ButtonSegment(
                value: "all",
                label: Text("All Products"),
              ),
              ButtonSegment(
                value: "mine",
                label: Text("My Products"),
              ),
            ],
            selected: {selectedView},
            onSelectionChanged: (value) {
              setState(() {
                selectedView = value.first;
              });
            },
          ),

          const SizedBox(height: 12),

          // ⭐ Expanded supaya FutureBuilder tetap fleksibel
          Expanded(
            child: FutureBuilder(
              future: fetchProduct(request),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return const Column(
                      children: [
                        Text(
                          'There are no products yet.',
                          style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    List<ProductEntry> allProducts = snapshot.data!;

                    // FILTER PRODUK MILIK USER LOGIN
                    List<ProductEntry> myProducts = allProducts
                        .where((p) => p.userId == currentUserId)
                        .toList();

                    // ⭐ NEW: tentukan list yang akan ditampilkan
                    final productsToShow =
                    selectedView == "all" ? allProducts : myProducts;

                    if (productsToShow.isEmpty) {
                      return Center(
                        child: Text(
                          selectedView == "mine"
                              ? 'You have no products yet.'
                              : 'No products found.',
                          style: const TextStyle(
                              fontSize: 18, color: Colors.grey),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: productsToShow.length,
                      itemBuilder: (_, index) => ProductEntryCard(
                        product: productsToShow[index],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                product: productsToShow[index],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
