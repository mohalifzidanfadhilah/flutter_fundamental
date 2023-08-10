import 'package:flutter/foundation.dart';


@immutable
class ProdukModel {

  const ProdukModel({
    required this.id,
    required this.namaProduk,
    required this.kategori,
    required this.harga,
    required this.cover,
  });

  final String id;
  final String namaProduk;
  final String kategori;
  final String harga;
  final String cover;

  factory ProdukModel.fromJson(Map<String,dynamic> json) => ProdukModel(
    id: json['id'] as String,
    namaProduk: json['nama_produk'] as String,
    kategori: json['kategori'] as String,
    harga: json['harga'] as String,
    cover: json['cover'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'nama_produk': namaProduk,
    'kategori': kategori,
    'harga': harga,
    'cover': cover
  };

  ProdukModel clone() => ProdukModel(
    id: id,
    namaProduk: namaProduk,
    kategori: kategori,
    harga: harga,
    cover: cover
  );


  ProdukModel copyWith({
    String? id,
    String? namaProduk,
    String? kategori,
    String? harga,
    String? cover
  }) => ProdukModel(
    id: id ?? this.id,
    namaProduk: namaProduk ?? this.namaProduk,
    kategori: kategori ?? this.kategori,
    harga: harga ?? this.harga,
    cover: cover ?? this.cover,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ProdukModel && id == other.id && namaProduk == other.namaProduk && kategori == other.kategori && harga == other.harga && cover == other.cover;

  @override
  int get hashCode => id.hashCode ^ namaProduk.hashCode ^ kategori.hashCode ^ harga.hashCode ^ cover.hashCode;
}
