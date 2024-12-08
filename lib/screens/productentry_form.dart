import 'package:flutter/material.dart';
import 'package:sipacil/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert';

class ProductEntryFormPage extends StatefulWidget {
  const ProductEntryFormPage({super.key});

  @override
  State<ProductEntryFormPage> createState() => _ProductEntryFormPageState();
}

class _ProductEntryFormPageState extends State<ProductEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _product = "";
  int _price = 0;
  String _description = "";
  String _rating = "0.00"; // Sesuaikan dengan format DecimalField
  bool _available = false; // Default value sesuai dengan Django model

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Tambah Produk',
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Input
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Product",
                    labelText: "Product",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _product = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Product tidak boleh kosong!";
                    }
                    if (value.length < 3 || value.length > 255) {
                      return "Product harus memiliki 3-255 karakter!";
                    }
                    return null;
                  },
                ),
              ),
              // Description Input
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Description",
                    labelText: "Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Description tidak boleh kosong!";
                    }
                    if (value.length > 200) {
                      return "Description tidak boleh lebih dari 200 karakter!";
                    }
                    return null;
                  },
                ),
              ),
              // Price Input
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Price",
                    labelText: "Price",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Price tidak boleh kosong!";
                    }
                    final parsedValue = int.tryParse(value);
                    if (parsedValue == null || parsedValue <= 0) {
                      return "Price harus berupa angka positif!";
                    }
                    return null;
                  },
                ),
              ),
              // Rating Input
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Rating (0.00 - 9.99)",
                    labelText: "Rating",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _rating = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Rating tidak boleh kosong!";
                    }
                    final parsedValue = double.tryParse(value);
                    if (parsedValue == null ||
                        parsedValue < 0 ||
                        parsedValue > 9.99) {
                      return "Rating harus di antara 0.00 dan 9.99!";
                    }
                    return null;
                  },
                ),
              ),
              // Available Input
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Text("Available: "),
                    Switch(
                      value: _available,
                      onChanged: (bool value) {
                        setState(() {
                          _available = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              // Submit Button
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await request.postJson(
                        "http://127.0.0.1:8000/create-flutter/",
                        jsonEncode(<String, dynamic>{
                          'product': _product,
                          'price': _price,
                          'description': _description,
                          'rating': _rating,
                          'available': _available,
                        }),
                      );
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Produk berhasil disimpan!")),
                          );
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Gagal menyimpan produk.")),
                          );
                        }
                      }
                    }
                  },
                  child: const Text("Save"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
