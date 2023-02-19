import 'dart:convert';

List<MvModel> mvModelFromJson(String str) => List<MvModel>.from(json.decode(str).map((x) => MvModel.fromJson(x)));

String mvModelToJson(List<MvModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MvModel {
    MvModel({
        this.id,
        this.uuid,
        this.name,
        this.imgUrl,
        this.domain,
        this.quality,
        this.category,
        this.srcLink,
        this.shortName,
        this.createdAt,
        this.magnet,
        this.torrent,
    });

    final int? id;
    final String? uuid;
    final String? name;
    final String? imgUrl;
    final String? domain;
    final String? quality;
    final String? category;
    final String? srcLink;
    final String? shortName;
    final DateTime? createdAt;
    final List<String>? magnet;
    final List<String>? torrent;

    factory MvModel.fromJson(Map<String, dynamic> json) => MvModel(
        id: json["id"],
        uuid: json["uuid"],
        name: json["name"],
        imgUrl: json["ImgUrl"],
        domain: json["domain"],
        quality: json["Quality"],
        category: json["category"],
        srcLink: json["srcLink"],
        shortName: json["shortName"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        magnet: json["magnet"] == null ? [] : List<String>.from(json["magnet"]!.map((x) => x)),
        torrent: json["torrent"] == null ? [] : List<String>.from(json["torrent"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": name,
        "ImgUrl": imgUrl,
        "domain": domain,
        "Quality": quality,
        "category": category,
        "srcLink": srcLink,
        "shortName": shortName,
        "createdAt": createdAt?.toIso8601String(),
        "magnet": magnet == null ? [] : List<dynamic>.from(magnet!.map((x) => x)),
        "torrent": torrent == null ? [] : List<dynamic>.from(torrent!.map((x) => x)),
    };
}