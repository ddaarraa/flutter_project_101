import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final CollectionReference products =
      FirebaseFirestore.instance.collection('Products');

  Future<void> _showProductDialog({DocumentSnapshot? document}) async {
    String name = document != null ? document['name'] : '';
    String description = document != null ? document['description'] : '';
    double price = document != null ? document['price'] : 0.0;

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(document != null ? 'Update Product' : 'New Product'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) => name = value,
                controller: TextEditingController(text: name),
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                onChanged: (value) => description = value,
                controller: TextEditingController(text: description),
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                onChanged: (value) => price = double.tryParse(value) ?? 0.0,
                controller: TextEditingController(text: price.toString()),
                decoration: const InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                if (document != null) {
                  await products.doc(document.id).update({
                    'name': name,
                    'description': description,
                    'price': price,
                  });
                } else {
                  await products.add({
                    'name': name,
                    'description': description,
                    'price': price,
                  });
                }
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteProduct(String docId) async {
    await products.doc(docId).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: StreamBuilder<QuerySnapshot>(
        stream: products.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!.docs;

          return ListView.separated(
            itemCount: data.length,
            separatorBuilder: (context, index) => const Divider(),
            itemBuilder: (context, index) {
              final product = data[index];
              return ListTile(
                title: Text(product['name'],style: const TextStyle(fontSize: 21)),
                subtitle: Text('${product['description']}'),
                isThreeLine: false,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${product['price']}',style: const TextStyle(fontSize: 18, )),
                    IconButton(
                      icon: const Icon(Icons.edit, color: Colors.blue),
                      onPressed: () => _showProductDialog(document: product),
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Confirm Delete'),
                              content: const Text(
                                  'Are you sure you want to delete this product?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text('Cancel'),
                                ),
                                ElevatedButton(
                                  onPressed: () async {
                                    await _deleteProduct(product.id);
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red),
                                  child: const Text('Delete'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showProductDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}