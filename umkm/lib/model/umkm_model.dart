// To parse this JSON data, do
//
//     final umkm = umkmFromJson(jsonString);

import 'dart:convert';

List<UMKM> umkmFromJson(String str) => List<UMKM>.from(json.decode(str).map((x) => UMKM.fromJson(x)));

String umkmToJson(List<UMKM> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));



class UMKM {
    UMKM({
        
        required this.name,
        required this.description,
        required this.linkWebsite,
        required this.image,
        required this.imageUrl,
    });

    
    String name;
    String description;
    String linkWebsite;
    String image;
    String imageUrl;

    factory UMKM.fromJson(Map<String, dynamic> json) => UMKM(
        
        name: json["fields"]["name"],
        description: json["fields"]["description"],
        linkWebsite: json["fields"]["link_website"],
        image: json["fields"]["image"],
        imageUrl: json["fields"]["imageURL"],
    );

    Map<String, dynamic> toJson() => {
        
        "name": name,
        "description": description,
        "link_website": linkWebsite,
        "image": image,
        "imageURL": imageUrl,
    };
}
