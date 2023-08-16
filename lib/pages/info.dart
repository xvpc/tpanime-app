import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tpanime/components/drawer.dart';
import 'package:tpanime/components/errorMessage.dart';
import 'package:tpanime/data/assetsdata.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:device_apps/device_apps.dart';

//
import 'package:tpanime/data/getdata.dart';
import 'package:tpanime/hooks/capitalize.dart';
import 'package:tpanime/hooks/filtertext.dart';

class InfoPage extends StatefulWidget {
  final String infoId;
  const InfoPage({super.key, required this.infoId});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late String infoId;

  Map<String, dynamic> data = {
    "id": "5114",
    "title": {
      "romaji": "Hagane no Renkinjutsushi: FULLMETAL ALCHEMIST",
      "english": "Fullmetal Alchemist: Brotherhood",
      "native": "鋼の錬金術師 FULLMETAL ALCHEMIST"
    },
    "malId": 5114,
    "synonyms": [
      "FMA",
      "FMAB",
      "Hagaren",
      "الخيميائي الفولاذي",
      "אלכימאי המתכת: אחוות אחים",
      "Full Metal Alchemist: Brotherhood",
      "钢之炼金术师 FULLMETAL ALCHEMIST",
      "แขนกล คนแปรธาตุ: บราเธอร์ฮูด"
    ],
    "isLicensed": true,
    "isAdult": false,
    "countryOfOrigin": "JP",
    "image":
        "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx5114-KJTQz9AIm6Wk.jpg",
    "popularity": 492396,
    "color": "#e4c993",
    "cover":
        "https://s4.anilist.co/file/anilistcdn/media/anime/banner/5114-q0V5URebphSG.jpg",
    "description":
        "\"In order for something to be obtained, something of equal value must be lost.\"\n<br><br>\nAlchemy is bound by this Law of Equivalent Exchange—something the young brothers Edward and Alphonse Elric only realize after attempting human transmutation: the one forbidden act of alchemy. They pay a terrible price for their transgression—Edward loses his left leg, Alphonse his physical body. It is only by the desperate sacrifice of Edward's right arm that he is able to affix Alphonse's soul to a suit of armor. Devastated and alone, it is the hope that they would both eventually return to their original bodies that gives Edward the inspiration to obtain metal limbs called \"automail\" and become a state alchemist, the Fullmetal Alchemist.\n<br><br>\nThree years of searching later, the brothers seek the Philosopher's Stone, a mythical relic that allows an alchemist to overcome the Law of Equivalent Exchange. Even with military allies Colonel Roy Mustang, Lieutenant Riza Hawkeye, and Lieutenant Colonel Maes Hughes on their side, the brothers find themselves caught up in a nationwide conspiracy that leads them not only to the true nature of the elusive Philosopher's Stone, but their country's murky history as well. In between finding a serial killer and racing against time, Edward and Alphonse must ask themselves if what they are doing will make them human again... or take away their humanity.\n<br><br>\n(Source: MAL Rewrite)",
    "status": "Completed",
    "releaseDate": 2009,
    "startDate": {"year": 2009, "month": 4, "day": 5},
    "endDate": {"year": 2010, "month": 7, "day": 4},
    "totalEpisodes": 64,
    "currentEpisode": 64,
    "rating": 90,
    "duration": 25,
    "genres": ["Action", "Adventure", "Drama", "Fantasy"],
    "season": "SPRING",
    "studios": ["bones"],
    "subOrDub": "sub",
    "type": "TV",
    "recommendations": [
      {
        "id": 21,
        "malId": 21,
        "title": {
          "romaji": "ONE PIECE",
          "english": "ONE PIECE",
          "native": "ONE PIECE",
          "userPreferred": "ONE PIECE"
        },
        "status": "Ongoing",
        "episodes": null,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/nx21-tXMN3Y20PIL9.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/21-wf37VakJmZqs.jpg",
        "rating": 87,
        "type": "TV"
      },
      {
        "id": 99147,
        "malId": 35760,
        "title": {
          "romaji": "Shingeki no Kyojin 3",
          "english": "Attack on Titan Season 3",
          "native": "進撃の巨人３",
          "userPreferred": "Shingeki no Kyojin 3"
        },
        "status": "Completed",
        "episodes": 12,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx99147-5RXELRvwjFl6.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/99147-HACsFVrynFf5.jpg",
        "rating": 85,
        "type": "TV"
      },
      {
        "id": 11061,
        "malId": 11061,
        "title": {
          "romaji": "HUNTER×HUNTER (2011)",
          "english": "Hunter x Hunter (2011)",
          "native": "HUNTER×HUNTER (2011)",
          "userPreferred": "HUNTER×HUNTER (2011)"
        },
        "status": "Completed",
        "episodes": 148,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx11061-sIpBprNRfzCe.png",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/11061-8WkkTZ6duKpq.jpg",
        "rating": 89,
        "type": "TV"
      },
      {
        "id": 1482,
        "malId": 1482,
        "title": {
          "romaji": "D.Gray-man",
          "english": "D.Gray-man",
          "native": "ディー・グレイマン",
          "userPreferred": "D.Gray-man"
        },
        "status": "Completed",
        "episodes": 103,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx1482-3IT5wm5AK9tF.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/1482-nmGoqdGfaKEt.jpg",
        "rating": 76,
        "type": "TV"
      },
      {
        "id": 99699,
        "malId": 36028,
        "title": {
          "romaji": "Golden Kamuy",
          "english": "Golden Kamuy",
          "native": "ゴールデンカムイ",
          "userPreferred": "Golden Kamuy"
        },
        "status": "Completed",
        "episodes": 12,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx99699-mBCjpoWpAVGX.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/99699-95D2XWA6eWAH.jpg",
        "rating": 77,
        "type": "TV"
      },
      {
        "id": 104578,
        "malId": 38524,
        "title": {
          "romaji": "Shingeki no Kyojin 3 Part 2",
          "english": "Attack on Titan Season 3 Part 2",
          "native": "進撃の巨人３ Part.2",
          "userPreferred": "Shingeki no Kyojin 3 Part 2"
        },
        "status": "Completed",
        "episodes": 10,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx104578-LaZYFkmhinfB.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/104578-z7SadpYEuAsy.jpg",
        "rating": 90,
        "type": "TV"
      },
      {
        "id": 16498,
        "malId": 16498,
        "title": {
          "romaji": "Shingeki no Kyojin",
          "english": "Attack on Titan",
          "native": "進撃の巨人",
          "userPreferred": "Shingeki no Kyojin"
        },
        "status": "Completed",
        "episodes": 25,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx16498-C6FPmWm59CyP.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/16498-8jpFCOcDmneX.jpg",
        "rating": 84,
        "type": "TV"
      },
      {
        "id": 101922,
        "malId": 38000,
        "title": {
          "romaji": "Kimetsu no Yaiba",
          "english": "Demon Slayer: Kimetsu no Yaiba",
          "native": "鬼滅の刃",
          "userPreferred": "Kimetsu no Yaiba"
        },
        "status": "Completed",
        "episodes": 26,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx101922-PEn1CTc93blC.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/101922-YfZhKBUDDS6L.jpg",
        "rating": 84,
        "type": "TV"
      },
      {
        "id": 3588,
        "malId": 3588,
        "title": {
          "romaji": "Soul Eater",
          "english": "Soul Eater",
          "native": "ソウルイーター",
          "userPreferred": "Soul Eater"
        },
        "status": "Completed",
        "episodes": 51,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx3588-CA8LE5gjm9Qx.png",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/3588.jpg",
        "rating": 76,
        "type": "TV"
      },
      {
        "id": 11741,
        "malId": 11741,
        "title": {
          "romaji": "Fate/Zero 2nd Season",
          "english": "Fate/Zero Season 2",
          "native": "Fate/Zero 2ndシーズン",
          "userPreferred": "Fate/Zero 2nd Season"
        },
        "status": "Completed",
        "episodes": 12,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/nx11741-Twb6iJx77FFV.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/11741-TWwZCgsK5aXh.jpg",
        "rating": 85,
        "type": "TV"
      },
      {
        "id": 101759,
        "malId": 37779,
        "title": {
          "romaji": "Yakusoku no Neverland",
          "english": "The Promised Neverland",
          "native": "約束のネバーランド",
          "userPreferred": "Yakusoku no Neverland"
        },
        "status": "Completed",
        "episodes": 12,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx101759-NhSwxv7HY9y9.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/101759-MhlCoeqnODso.jpg",
        "rating": 84,
        "type": "TV"
      },
      {
        "id": 102883,
        "malId": 37991,
        "title": {
          "romaji": "JoJo no Kimyou na Bouken: Ougon no Kaze",
          "english": "JoJo's Bizarre Adventure: Golden Wind",
          "native": "ジョジョの奇妙な冒険 黄金の風",
          "userPreferred": "JoJo no Kimyou na Bouken: Ougon no Kaze"
        },
        "status": "Completed",
        "episodes": 39,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/nx102883-CZEVeUWllM26.png",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/102883-8ffuBLnY5vNR.jpg",
        "rating": 84,
        "type": "TV"
      },
      {
        "id": 101347,
        "malId": 37520,
        "title": {
          "romaji": "Dororo",
          "english": "Dororo",
          "native": "どろろ",
          "userPreferred": "Dororo"
        },
        "status": "Completed",
        "episodes": 24,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/nx101347-2J2p8qJpxpfZ.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/n101347-tHurKfTlhtFl.jpg",
        "rating": 81,
        "type": "TV"
      },
      {
        "id": 1735,
        "malId": 1735,
        "title": {
          "romaji": "NARUTO: Shippuuden",
          "english": "Naruto: Shippuden",
          "native": "NARUTO -ナルト- 疾風伝",
          "userPreferred": "NARUTO: Shippuuden"
        },
        "status": "Completed",
        "episodes": 500,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx1735-Az5gbEdWeotG.png",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/1735.jpg",
        "rating": 82,
        "type": "TV"
      },
      {
        "id": 14513,
        "malId": 14513,
        "title": {
          "romaji": "Magi: The labyrinth of magic",
          "english": "Magi: The Labyrinth of Magic",
          "native": "マギ The labyrinth of magic",
          "userPreferred": "Magi: The labyrinth of magic"
        },
        "status": "Completed",
        "episodes": 25,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx14513-b4C3J03GF6UT.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/14513-DDBxCumOyPIa.jpg",
        "rating": 78,
        "type": "TV"
      },
      {
        "id": 117755,
        "malId": 37599,
        "title": {
          "romaji": "Magatsu Wahrheit: ZUERST",
          "english": "MAGATSU WAHRHEIT",
          "native": "禍つヴァールハイト -ZUERST-",
          "userPreferred": "Magatsu Wahrheit: ZUERST"
        },
        "status": "Completed",
        "episodes": 12,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx117755-feOzwxzB9gEk.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx117755-feOzwxzB9gEk.jpg",
        "rating": 61,
        "type": "TV"
      },
      {
        "id": 114236,
        "malId": 40956,
        "title": {
          "romaji": "Enen no Shouboutai: Ni no Shou",
          "english": "Fire Force Season 2",
          "native": "炎炎ノ消防隊 弐ノ章",
          "userPreferred": "Enen no Shouboutai: Ni no Shou"
        },
        "status": "Completed",
        "episodes": 24,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx114236-wfQOWF0Ii3h2.png",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/114236-6nbw38bHeXYQ.jpg",
        "rating": 78,
        "type": "TV"
      },
      {
        "id": 113415,
        "malId": 40748,
        "title": {
          "romaji": "Jujutsu Kaisen",
          "english": "JUJUTSU KAISEN",
          "native": "呪術廻戦",
          "userPreferred": "Jujutsu Kaisen"
        },
        "status": "Completed",
        "episodes": 24,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx113415-bbBWj4pEFseh.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/113415-jQBSkxWAAk83.jpg",
        "rating": 86,
        "type": "TV"
      },
      {
        "id": 6,
        "malId": 6,
        "title": {
          "romaji": "TRIGUN",
          "english": "Trigun",
          "native": "TRIGUN",
          "userPreferred": "TRIGUN"
        },
        "status": "Completed",
        "episodes": 26,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx6-Zzun7PHNNgPt.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/6-4pIR2RY8AHZ0.jpg",
        "rating": 79,
        "type": "TV"
      },
      {
        "id": 2125,
        "malId": 2125,
        "title": {
          "romaji": "Yuu☆Yuu☆Hakusho: Eizou Hakusho",
          "english": "Yu Yu Hakusho: Eizou Hakusho",
          "native": "幽☆遊☆白書 映像白書 暗黒武術会の章 上巻 & 下巻",
          "userPreferred": "Yuu☆Yuu☆Hakusho: Eizou Hakusho"
        },
        "status": "Completed",
        "episodes": 2,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/2125.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/2125-WxCFwl4VstOY.jpg",
        "rating": 70,
        "type": "OVA"
      },
      {
        "id": 1575,
        "malId": 1575,
        "title": {
          "romaji": "Code Geass: Hangyaku no Lelouch",
          "english": "Code Geass: Lelouch of the Rebellion",
          "native": "コードギアス 反逆のルルーシュ",
          "userPreferred": "Code Geass: Hangyaku no Lelouch"
        },
        "status": "Completed",
        "episodes": 25,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx1575-ZJYlg8yjvMKI.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/1575.jpg",
        "rating": 84,
        "type": "TV"
      },
      {
        "id": 131646,
        "malId": 48580,
        "title": {
          "romaji": "Vanitas no Carte",
          "english": "The Case Study of Vanitas",
          "native": "ヴァニタスの手記",
          "userPreferred": "Vanitas no Carte"
        },
        "status": "Completed",
        "episodes": 12,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx131646-k6u2UXIsMXEa.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/131646-ewbYrSfyUyp6.jpg",
        "rating": 78,
        "type": "TV"
      },
      {
        "id": 18313,
        "malId": 18313,
        "title": {
          "romaji": "Dokkaebi Gamtu",
          "english": null,
          "native": "도깨비 감투",
          "userPreferred": "Dokkaebi Gamtu"
        },
        "status": "Completed",
        "episodes": 1,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/18313.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/18313.jpg",
        "rating": 36,
        "type": "MOVIE"
      },
      {
        "id": 1536,
        "malId": 1536,
        "title": {
          "romaji": "Busou Renkin",
          "english": "Arms Alchemy",
          "native": "武装錬金",
          "userPreferred": "Busou Renkin"
        },
        "status": "Completed",
        "episodes": 26,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx1536-IkwAKpAiioIv.png",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/1536-SUxbhDyLbASP.jpg",
        "rating": 68,
        "type": "TV"
      },
      {
        "id": 20447,
        "malId": 20507,
        "title": {
          "romaji": "Noragami",
          "english": "Noragami",
          "native": "ノラガミ",
          "userPreferred": "Noragami"
        },
        "status": "Completed",
        "episodes": 12,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx20447-EoQXeygHaVCK.jpg",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/20447-nlgQQzcgWbgw.jpg",
        "rating": 78,
        "type": "TV"
      }
    ],
    "characters": [
      {
        "id": 12,
        "role": "MAIN",
        "name": {
          "first": "Alphonse",
          "last": "Elric",
          "full": "Alphonse Elric",
          "native": "アルフォンス・エルリック",
          "userPreferred": "Alphonse Elric"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/b12-tCKu8yK5kFL5.jpg",
        "voiceActors": [
          {
            "id": 95008,
            "language": "Japanese",
            "name": {
              "first": "Rie",
              "last": "Kugimiya",
              "full": "Rie Kugimiya",
              "native": "釘宮理恵",
              "userPreferred": "Rie Kugimiya"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95008-2y0EeuSTHIri.png"
          },
          {
            "id": 103722,
            "language": "English",
            "name": {
              "first": "Maxey",
              "last": "Whitehead",
              "full": "Maxey Whitehead",
              "native": null,
              "userPreferred": "Maxey Whitehead"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n103722-4IYtnwwabhYI.jpg"
          },
          {
            "id": 115542,
            "language": "English",
            "name": {
              "first": "Lily",
              "last": "Truncale",
              "full": "Lily Truncale",
              "native": null,
              "userPreferred": "Lily Truncale"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/20542.jpg"
          },
          {
            "id": 109823,
            "language": "Korean",
            "name": {
              "first": "Mi Na",
              "last": "Yun",
              "full": "Mi Na Yun",
              "native": "미나 윤",
              "userPreferred": "Mi Na Yun"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/14823.jpg"
          },
          {
            "id": 96162,
            "language": "Italian",
            "name": {
              "first": "Benedetta",
              "last": "Ponticelli",
              "full": "Benedetta Ponticelli",
              "native": null,
              "userPreferred": "Benedetta Ponticelli"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/1162.jpg"
          },
          {
            "id": 189471,
            "language": "Spanish",
            "name": {
              "first": "Jhonny",
              "last": "Torres",
              "full": "Jhonny Torres",
              "native": null,
              "userPreferred": "Jhonny Torres"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n189471-BEhsuR3eFIlt.jpg"
          },
          {
            "id": 100084,
            "language": "Portuguese",
            "name": {
              "first": "Rodrigo",
              "last": "Andreatto",
              "full": "Rodrigo Andreatto",
              "native": null,
              "userPreferred": "Rodrigo Andreatto"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/5084.jpg"
          },
          {
            "id": 185306,
            "language": "Portuguese",
            "name": {
              "first": "Marina",
              "last": "Santana",
              "full": "Marina Santana",
              "native": null,
              "userPreferred": "Marina Santana"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n185306-FjbOFoJBDXUe.jpg"
          },
          {
            "id": 154940,
            "language": "French",
            "name": {
              "first": "Audrey",
              "last": "Pic",
              "full": "Audrey Pic",
              "native": null,
              "userPreferred": "Audrey Pic"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/default.jpg"
          },
          {
            "id": 101066,
            "language": "German",
            "name": {
              "first": "Wanja",
              "last": "Gerick",
              "full": "Wanja Gerick",
              "native": null,
              "userPreferred": "Wanja Gerick"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/6066.jpg"
          },
          {
            "id": 102763,
            "language": "Hungarian",
            "name": {
              "first": "István",
              "last": "Baráth",
              "full": "István Baráth",
              "native": null,
              "userPreferred": "István Baráth"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/7763.jpg"
          }
        ]
      },
      {
        "id": 11,
        "role": "MAIN",
        "name": {
          "first": "Edward",
          "last": "Elric",
          "full": "Edward Elric",
          "native": "エドワード・エルリック",
          "userPreferred": "Edward Elric"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/b11-TA5Nuk7EDUZG.jpg",
        "voiceActors": [
          {
            "id": 95082,
            "language": "Japanese",
            "name": {
              "first": "Romi",
              "last": "Park",
              "full": "Romi Park",
              "native": "朴璐美",
              "userPreferred": "Romi Park"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95082-pNGbnYv4cHAK.png"
          },
          {
            "id": 95043,
            "language": "English",
            "name": {
              "first": "Vic",
              "last": "Mignogna",
              "full": "Vic Mignogna",
              "native": "Victor Joseph Mignogna",
              "userPreferred": "Vic Mignogna"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95043-cgQunZolvkPW.png"
          },
          {
            "id": 115913,
            "language": "English",
            "name": {
              "first": "Muriel",
              "last": "Hofmann",
              "full": "Muriel Hofmann",
              "native": null,
              "userPreferred": "Muriel Hofmann"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/20913.jpg"
          },
          {
            "id": 110097,
            "language": "Korean",
            "name": {
              "first": "In-Seong",
              "last": "Oh",
              "full": "In-Seong Oh",
              "native": "오인성",
              "userPreferred": "In-Seong Oh"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/15097.jpg"
          },
          {
            "id": 96163,
            "language": "Italian",
            "name": {
              "first": "Renato",
              "last": "Novara",
              "full": "Renato Novara",
              "native": null,
              "userPreferred": "Renato Novara"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n96163-YaGjTo1XM8qd.png"
          },
          {
            "id": 96275,
            "language": "Italian",
            "name": {
              "first": "Patrizia",
              "last": "Scianca",
              "full": "Patrizia Scianca",
              "native": null,
              "userPreferred": "Patrizia Scianca"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n96275-K5vy1UBZWPA0.png"
          },
          {
            "id": 96471,
            "language": "Spanish",
            "name": {
              "first": "José Manuel",
              "last": "Vieira",
              "full": "José Manuel Vieira",
              "native": null,
              "userPreferred": "José Manuel Vieira"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n96471-T1bTuG0gCGB9.png"
          },
          {
            "id": 96423,
            "language": "Portuguese",
            "name": {
              "first": "Marcelo",
              "last": "Campos",
              "full": "Marcelo Campos",
              "native": null,
              "userPreferred": "Marcelo Campos"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n96423-YaAvwaxG5fNk.jpg"
          },
          {
            "id": 185888,
            "language": "Portuguese",
            "name": {
              "first": "Mariana",
              "last": "Zink",
              "full": "Mariana Zink",
              "native": null,
              "userPreferred": "Mariana Zink"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n185888-UOA3nuLNCBzk.jpg"
          },
          {
            "id": 116201,
            "language": "French",
            "name": {
              "first": "Arthur",
              "last": "Pestel",
              "full": "Arthur Pestel",
              "native": null,
              "userPreferred": "Arthur Pestel"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/21201.jpg"
          },
          {
            "id": 101105,
            "language": "German",
            "name": {
              "first": "David",
              "last": "Turba",
              "full": "David Turba",
              "native": null,
              "userPreferred": "David Turba"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/6105.jpg"
          },
          {
            "id": 102825,
            "language": "Hungarian",
            "name": {
              "first": "Máté",
              "last": "Szabó",
              "full": "Máté Szabó",
              "native": null,
              "userPreferred": "Máté Szabó"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/7825.jpg"
          }
        ]
      },
      {
        "id": 5988,
        "role": "SUPPORTING",
        "name": {
          "first": "Rosé",
          "last": "Tomas",
          "full": "Rosé Tomas",
          "native": "ロゼ",
          "userPreferred": "Rosé Tomas"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/b5988-Wo1TMSnDnPIm.jpg",
        "voiceActors": [
          {
            "id": 95003,
            "language": "Japanese",
            "name": {
              "first": "Satsuki",
              "last": "Yukino",
              "full": "Satsuki Yukino",
              "native": "ゆきのさつき",
              "userPreferred": "Satsuki Yukino"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95003-Du7wb5JJzb8P.png"
          },
          {
            "id": 95472,
            "language": "English",
            "name": {
              "first": "Colleen",
              "last": "Clinkenbeard",
              "full": "Colleen Clinkenbeard",
              "native": null,
              "userPreferred": "Colleen Clinkenbeard"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95472-fznpewUW95vm.jpg"
          },
          {
            "id": 116811,
            "language": "Italian",
            "name": {
              "first": "Alessandra",
              "last": "Karpoff",
              "full": "Alessandra Karpoff",
              "native": null,
              "userPreferred": "Alessandra Karpoff"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/21811.jpg"
          },
          {
            "id": 104246,
            "language": "Spanish",
            "name": {
              "first": "Maythe",
              "last": "Guedes",
              "full": "Maythe Guedes",
              "native": null,
              "userPreferred": "Maythe Guedes"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/default.jpg"
          },
          {
            "id": 182631,
            "language": "Spanish",
            "name": {
              "first": "Erika",
              "last": "Langarica",
              "full": "Erika Langarica",
              "native": null,
              "userPreferred": "Erika Langarica"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n182631-ybXCM5pXa7Mu.png"
          },
          {
            "id": 96445,
            "language": "Portuguese",
            "name": {
              "first": "Fernanda",
              "last": "Bullara",
              "full": "Fernanda Bullara",
              "native": null,
              "userPreferred": "Fernanda Bullara"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n96445-74PzPrUhV5pi.jpg"
          },
          {
            "id": 106403,
            "language": "Portuguese",
            "name": {
              "first": "Flora",
              "last": "Paulita",
              "full": "Flora Paulita",
              "native": null,
              "userPreferred": "Flora Paulita"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n106403-io0B6PS3mWTh.jpg"
          },
          {
            "id": 146821,
            "language": "German",
            "name": {
              "first": "Betül Jülide",
              "last": "Gülgec",
              "full": "Betül Jülide Gülgec",
              "native": null,
              "userPreferred": "Betül Jülide Gülgec"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n146821-Fd0Fhxm94xFX.png"
          }
        ]
      },
      {
        "id": 15540,
        "role": "SUPPORTING",
        "name": {
          "first": "Miles",
          "last": null,
          "full": "Miles",
          "native": "マイルズ",
          "userPreferred": "Miles"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/15540.jpg",
        "voiceActors": [
          {
            "id": 95123,
            "language": "Japanese",
            "name": {
              "first": "Kazuya",
              "last": "Nakai",
              "full": "Kazuya Nakai",
              "native": "中井和哉",
              "userPreferred": "Kazuya Nakai"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95123-qdVFNraYmQ5K.png"
          },
          {
            "id": 95039,
            "language": "English",
            "name": {
              "first": "Jason",
              "last": "Douglas",
              "full": "Jason Douglas",
              "native": null,
              "userPreferred": "Jason Douglas"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95039-F0UuxfqLslls.jpg"
          },
          {
            "id": 286065,
            "language": "Italian",
            "name": {
              "first": "Giacomo",
              "last": "Zito",
              "full": "Giacomo Zito",
              "native": null,
              "userPreferred": "Giacomo Zito"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/default.jpg"
          },
          {
            "id": 191530,
            "language": "Spanish",
            "name": {
              "first": "Daniel",
              "last": "Lacy",
              "full": "Daniel Lacy",
              "native": "Daniel Muñoz Lacy",
              "userPreferred": "Daniel Lacy"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n191530-bAqKvWQNfigk.png"
          },
          {
            "id": 103882,
            "language": "Portuguese",
            "name": {
              "first": "Élcio",
              "last": "Sodré",
              "full": "Élcio Sodré",
              "native": "Élcio Sodré",
              "userPreferred": "Élcio Sodré"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n103882-5ARxuNV5TBBu.jpg"
          },
          {
            "id": 107217,
            "language": "Portuguese",
            "name": {
              "first": "Sílvio",
              "last": "Giraldi",
              "full": "Sílvio Giraldi",
              "native": null,
              "userPreferred": "Sílvio Giraldi"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/12217.jpg"
          },
          {
            "id": 130892,
            "language": "German",
            "name": {
              "first": "Tobias",
              "last": "Brecklinghaus",
              "full": "Tobias Brecklinghaus",
              "native": null,
              "userPreferred": "Tobias Brecklinghaus"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n130892-SmKFy9cXBeyx.png"
          }
        ]
      },
      {
        "id": 10974,
        "role": "SUPPORTING",
        "name": {
          "first": "Paninya",
          "last": null,
          "full": "Paninya",
          "native": "パニーニャ",
          "userPreferred": "Paninya"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/10974.jpg",
        "voiceActors": [
          {
            "id": 95076,
            "language": "Japanese",
            "name": {
              "first": "Akemi",
              "last": "Okamura",
              "full": "Akemi Okamura",
              "native": "岡村明美",
              "userPreferred": "Akemi Okamura"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95076-itRGy8F3x5Em.png"
          },
          {
            "id": 95851,
            "language": "English",
            "name": {
              "first": "Cynthia",
              "last": "Cranz",
              "full": "Cynthia Cranz",
              "native": null,
              "userPreferred": "Cynthia Cranz"
            },
            "image": "https://s4.anilist.co/file/anilistcdn/staff/large/851.jpg"
          },
          {
            "id": 104985,
            "language": "Italian",
            "name": {
              "first": "Cinzia",
              "last": "Massironi",
              "full": "Cinzia Massironi",
              "native": null,
              "userPreferred": "Cinzia Massironi"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/9985.jpg"
          },
          {
            "id": 202437,
            "language": "Spanish",
            "name": {
              "first": "Vanessa",
              "last": "Olea",
              "full": "Vanessa Olea",
              "native": null,
              "userPreferred": "Vanessa Olea"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n202437-kjSAeMjrnaFP.png"
          },
          {
            "id": 106637,
            "language": "Portuguese",
            "name": {
              "first": "Angelica",
              "last": "Santos",
              "full": "Angelica Santos",
              "native": null,
              "userPreferred": "Angelica Santos"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/11637.jpg"
          },
          {
            "id": 195050,
            "language": "Portuguese",
            "name": {
              "first": "Carol",
              "last": "Crespo Simões",
              "full": "Carol Crespo Simões",
              "native": null,
              "userPreferred": "Carol Crespo Simões"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n195050-RIzHn0mvoh3a.jpg"
          },
          {
            "id": 139368,
            "language": "German",
            "name": {
              "first": "Katrin",
              "last": "Heß",
              "full": "Katrin Heß",
              "native": null,
              "userPreferred": "Katrin Heß"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n139368-lchyJfVISfR6.png"
          },
          {
            "id": 102802,
            "language": "Hungarian",
            "name": {
              "first": "Kitty",
              "last": "Mezei",
              "full": "Kitty Mezei",
              "native": null,
              "userPreferred": "Kitty Mezei"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/7802.jpg"
          }
        ]
      },
      {
        "id": 15532,
        "role": "SUPPORTING",
        "name": {
          "first": "May",
          "last": "Chang",
          "full": "May Chang",
          "native": "メイ・チャン",
          "userPreferred": "May Chang"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/15532.jpg",
        "voiceActors": [
          {
            "id": 100281,
            "language": "Japanese",
            "name": {
              "first": "Mai",
              "last": "Gotou",
              "full": "Mai Gotou",
              "native": "後藤麻衣",
              "userPreferred": "Mai Gotou"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/5281.jpg"
          },
          {
            "id": 95159,
            "language": "English",
            "name": {
              "first": "Monica",
              "last": "Rial",
              "full": "Monica Rial",
              "native": null,
              "userPreferred": "Monica Rial"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95159-iTd65o5LhA62.png"
          },
          {
            "id": 115542,
            "language": "English",
            "name": {
              "first": "Lily",
              "last": "Truncale",
              "full": "Lily Truncale",
              "native": null,
              "userPreferred": "Lily Truncale"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/20542.jpg"
          },
          {
            "id": 109993,
            "language": "Korean",
            "name": {
              "first": "Ji Yeong",
              "last": "Lee",
              "full": "Ji Yeong Lee",
              "native": "이지영",
              "userPreferred": "Ji Yeong Lee"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n109993-WIQ4T5SCuW8X.jpg"
          },
          {
            "id": 96233,
            "language": "Italian",
            "name": {
              "first": "Serena",
              "last": "Clerici",
              "full": "Serena Clerici",
              "native": null,
              "userPreferred": "Serena Clerici"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/1233.jpg"
          },
          {
            "id": 197835,
            "language": "Spanish",
            "name": {
              "first": "María José",
              "last": "Estévez",
              "full": "María José Estévez",
              "native": null,
              "userPreferred": "María José Estévez"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n197835-tYz9zR3WfN3h.png"
          },
          {
            "id": 181978,
            "language": "Spanish",
            "name": {
              "first": "Nycolle",
              "last": "González",
              "full": "Nycolle González",
              "native": "Nycolle González Andrade",
              "userPreferred": "Nycolle González"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n181978-Tyh9cab7w2M3.png"
          },
          {
            "id": 115094,
            "language": "Portuguese",
            "name": {
              "first": "Bianca",
              "last": "Alencar",
              "full": "Bianca Alencar",
              "native": null,
              "userPreferred": "Bianca Alencar"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n115094-nqZApJ1pNrGM.jpg"
          },
          {
            "id": 101128,
            "language": "German",
            "name": {
              "first": "Kirstin",
              "last": "Hesse",
              "full": "Kirstin Hesse",
              "native": null,
              "userPreferred": "Kirstin Hesse"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/6128.jpg"
          }
        ]
      },
      {
        "id": 41216,
        "role": "SUPPORTING",
        "name": {
          "first": "Neil",
          "last": null,
          "full": "Neil",
          "native": "ニール",
          "userPreferred": "Neil"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/n41216-H4lznpL0Bzor.png",
        "voiceActors": [
          {
            "id": 96659,
            "language": "Japanese",
            "name": {
              "first": "Tooru",
              "last": "Nara",
              "full": "Tooru Nara",
              "native": "奈良徹",
              "userPreferred": "Tooru Nara"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n96659-zLvDfHLoxCne.png"
          },
          {
            "id": 95203,
            "language": "English",
            "name": {
              "first": "Justin",
              "last": "Cook",
              "full": "Justin Cook",
              "native": null,
              "userPreferred": "Justin Ryan Cook"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95203-S3aCVxUoYwJl.jpg"
          },
          {
            "id": 96830,
            "language": "Portuguese",
            "name": {
              "first": "Wendel",
              "last": "Bezerra",
              "full": "Wendel Bezerra",
              "native": null,
              "userPreferred": "Wendel Bezerra"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n96830-z4QYyXcQgjHB.png"
          },
          {
            "id": 185662,
            "language": "Portuguese",
            "name": {
              "first": "Igor",
              "last": "Lott",
              "full": "Igor Lott",
              "native": null,
              "userPreferred": "Igor Lott"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n185662-YtCzk9nmUgr9.jpg"
          },
          {
            "id": 139115,
            "language": "German",
            "name": {
              "first": "Stefan",
              "last": "Naas",
              "full": "Stefan Naas",
              "native": null,
              "userPreferred": "Stefan Naas"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n139115-1xEEBMFqAnG6.jpg"
          }
        ]
      },
      {
        "id": 15543,
        "role": "SUPPORTING",
        "name": {
          "first": "Sloth",
          "last": null,
          "full": "Sloth",
          "native": "スロウス",
          "userPreferred": "Sloth"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/b15543-InwPEKIOdTvX.png",
        "voiceActors": [
          {
            "id": 95284,
            "language": "Japanese",
            "name": {
              "first": "Fumihiko",
              "last": "Tachiki",
              "full": "Fumihiko Tachiki",
              "native": "立木文彦",
              "userPreferred": "Fumihiko Tachiki"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95284-k97k9dULn4vr.png"
          },
          {
            "id": 95340,
            "language": "English",
            "name": {
              "first": "Patrick",
              "last": "Seitz",
              "full": "Patrick Seitz",
              "native": null,
              "userPreferred": "Patrick Seitz"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95340-W5PAwurtgtXs.jpg"
          },
          {
            "id": 157834,
            "language": "Italian",
            "name": {
              "first": "Dario",
              "last": "Oppido",
              "full": "Dario Oppido",
              "native": null,
              "userPreferred": "Dario Oppido"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n157834-YQJeBlG5IApf.jpg"
          },
          {
            "id": 193998,
            "language": "Spanish",
            "name": {
              "first": "Ismael",
              "last": "Verástegui",
              "full": "Ismael Verástegui",
              "native": "Ismael Verástegui Bengoa",
              "userPreferred": "Ismael Verástegui"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n193998-hYjfxGxUReha.png"
          },
          {
            "id": 192670,
            "language": "Portuguese",
            "name": {
              "first": "Faduli",
              "last": "Costa",
              "full": "Faduli Costa",
              "native": null,
              "userPreferred": "Faduli Costa"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n192670-gRv93mDicD0H.jpg"
          },
          {
            "id": 200008,
            "language": "Portuguese",
            "name": {
              "first": "Vanderlan",
              "last": "Mendes",
              "full": "Vanderlan Mendes",
              "native": null,
              "userPreferred": "Vanderlan Mendes"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n200008-koAjQl3ElFSG.png"
          },
          {
            "id": 102320,
            "language": "German",
            "name": {
              "first": "Hans",
              "last": "Bayer",
              "full": "Hans Bayer",
              "native": null,
              "userPreferred": "Hans Bayer"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n102320-VVZdgbVubzHE.jpg"
          }
        ]
      },
      {
        "id": 27028,
        "role": "SUPPORTING",
        "name": {
          "first": "Knox",
          "last": null,
          "full": "Knox",
          "native": "ノックス",
          "userPreferred": "Knox"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/b27028-pv8abhTjBcVj.jpg",
        "voiceActors": [
          {
            "id": 95459,
            "language": "Japanese",
            "name": {
              "first": "Kinryuu",
              "last": "Arimoto",
              "full": "Kinryuu Arimoto",
              "native": "有本欽隆",
              "userPreferred": "Kinryuu Arimoto"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95459-guzIZZ731L9r.png"
          },
          {
            "id": 95480,
            "language": "English",
            "name": {
              "first": "R. Bruce",
              "last": "Elliott",
              "full": "R. Bruce Elliott",
              "native": null,
              "userPreferred": "R. Bruce Elliott"
            },
            "image": "https://s4.anilist.co/file/anilistcdn/staff/large/480.jpg"
          },
          {
            "id": 157834,
            "language": "Italian",
            "name": {
              "first": "Dario",
              "last": "Oppido",
              "full": "Dario Oppido",
              "native": null,
              "userPreferred": "Dario Oppido"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n157834-YQJeBlG5IApf.jpg"
          },
          {
            "id": 198895,
            "language": "Spanish",
            "name": {
              "first": "Manuel",
              "last": "Bastos",
              "full": "Manuel Bastos",
              "native": null,
              "userPreferred": "Manuel Bastos"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n198895-FhNFXVMGunnf.png"
          },
          {
            "id": 208327,
            "language": "Spanish",
            "name": {
              "first": "Alfredo",
              "last": "Tovar",
              "full": "Alfredo Tovar",
              "native": null,
              "userPreferred": "Alfredo Tovar"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n208327-gOOX8qUud8VO.png"
          },
          {
            "id": 106531,
            "language": "Portuguese",
            "name": {
              "first": "Guilherme",
              "last": "Lopes",
              "full": "Guilherme Lopes",
              "native": null,
              "userPreferred": "Guilherme Lopes"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n106531-vOxd4fxQt9UL.jpg"
          },
          {
            "id": 176913,
            "language": "Portuguese",
            "name": {
              "first": "Marcio",
              "last": "Dondi",
              "full": "Marcio Dondi",
              "native": "Márcio Dondi",
              "userPreferred": "Marcio Dondi"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n176913-EOeaPVqnqwzT.jpg"
          },
          {
            "id": 131997,
            "language": "German",
            "name": {
              "first": "Rolf",
              "last": "Berg",
              "full": "Rolf Berg",
              "native": null,
              "userPreferred": "Rolf Berg"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n131997-lfxx8xx7uTNS.png"
          }
        ]
      },
      {
        "id": 35144,
        "role": "SUPPORTING",
        "name": {
          "first": "Garfiel",
          "last": null,
          "full": "Garfiel",
          "native": "ガーフィール",
          "userPreferred": "Garfiel"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/b35144-UjyMf6g71t5c.png",
        "voiceActors": [
          {
            "id": 95720,
            "language": "Japanese",
            "name": {
              "first": "Kenta",
              "last": "Miyake",
              "full": "Kenta Miyake",
              "native": "三宅健太",
              "userPreferred": "Kenta Miyake"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95720-enxx6kZKuwGi.jpg"
          },
          {
            "id": 95662,
            "language": "English",
            "name": {
              "first": "Antimere",
              "last": "Robinson",
              "full": "Antimere Robinson",
              "native": null,
              "userPreferred": "Antimere Robinson"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95662-H3FLEV7RqEoE.jpg"
          },
          {
            "id": 100139,
            "language": "Portuguese",
            "name": {
              "first": "Ricardo",
              "last": "Sawaya",
              "full": "Ricardo Sawaya",
              "native": null,
              "userPreferred": "Ricardo Sawaya"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/5139.jpg"
          },
          {
            "id": 185303,
            "language": "Portuguese",
            "name": {
              "first": "Vágner",
              "last": "Santos",
              "full": "Vágner Santos",
              "native": null,
              "userPreferred": "Vágner Santos"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n185303-1CMnAVDLpqbJ.jpg"
          },
          {
            "id": 117899,
            "language": "German",
            "name": {
              "first": "Markus",
              "last": "Haase",
              "full": "Markus Haase",
              "native": null,
              "userPreferred": "Markus Haase"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/22899.jpg"
          }
        ]
      },
      {
        "id": 52739,
        "role": "SUPPORTING",
        "name": {
          "first": "Damiano",
          "last": null,
          "full": "Damiano",
          "native": "ダミアノ",
          "userPreferred": "Damiano"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/n52739-CVU3CZq0UBx7.png",
        "voiceActors": [
          {
            "id": 111989,
            "language": "Japanese",
            "name": {
              "first": "Masayuki",
              "last": "Shouji",
              "full": "Masayuki Shouji",
              "native": "庄司将之",
              "userPreferred": "Masayuki Shouji"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/16989.jpg"
          },
          {
            "id": 96047,
            "language": "English",
            "name": {
              "first": "Jessie James",
              "last": "Grelle",
              "full": "Jessie James Grelle",
              "native": null,
              "userPreferred": "Jessie James Grelle"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n96047-E9nBWn3YL0Tn.jpg"
          },
          {
            "id": 311861,
            "language": "Portuguese",
            "name": {
              "first": "Marcio",
              "last": "Vaz",
              "full": "Marcio Vaz",
              "native": null,
              "userPreferred": "Marcio Vaz"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n311861-19pllPOifcXr.jpg"
          }
        ]
      },
      {
        "id": 10970,
        "role": "SUPPORTING",
        "name": {
          "first": "Shifu",
          "last": null,
          "full": "Shifu",
          "native": "師父",
          "userPreferred": "Shifu"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/10970.jpg",
        "voiceActors": [
          {
            "id": 101455,
            "language": "Japanese",
            "name": {
              "first": "Yuzuru",
              "last": "Fujimoto",
              "full": "Yuzuru Fujimoto",
              "native": "藤本譲",
              "userPreferred": "Yuzuru Fujimoto"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/6455.jpg"
          },
          {
            "id": 100442,
            "language": "English",
            "name": {
              "first": "Grant",
              "last": "James",
              "full": "Grant James",
              "native": null,
              "userPreferred": "Grant James"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n100442-1CGN74lnCa2c.jpg"
          },
          {
            "id": 253296,
            "language": "Spanish",
            "name": {
              "first": "Itzíhuappe",
              "last": "Escalera",
              "full": "Itzíhuappe Escalera",
              "native": null,
              "userPreferred": "Itzíhuappe Escalera"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n253296-GEXyMqL9Y9TJ.png"
          },
          {
            "id": 184977,
            "language": "Portuguese",
            "name": {
              "first": "Luiz Carlos",
              "last": "De Moraes",
              "full": "Luiz Carlos De Moraes",
              "native": null,
              "userPreferred": "Luiz Carlos De Moraes"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n184977-32C2f6ZPqXBB.jpg"
          },
          {
            "id": 109487,
            "language": "Portuguese",
            "name": {
              "first": "Carlos",
              "last": "Campanile",
              "full": "Carlos Campanile",
              "native": null,
              "userPreferred": "Carlos Campanile"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/14487.jpg"
          },
          {
            "id": 185363,
            "language": "Portuguese",
            "name": {
              "first": "Walter",
              "last": "Cruz",
              "full": "Walter Cruz",
              "native": null,
              "userPreferred": "Walter Cruz"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n185363-LEzsXiLX9wu8.jpg"
          },
          {
            "id": 132005,
            "language": "German",
            "name": {
              "first": "Volker",
              "last": "Wolf",
              "full": "Volker Wolf",
              "native": null,
              "userPreferred": "Volker Wolf"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/default.jpg"
          }
        ]
      },
      {
        "id": 36309,
        "role": "SUPPORTING",
        "name": {
          "first": "Narrator",
          "last": null,
          "full": "Narrator",
          "native": "ナレーター",
          "userPreferred": "Narrator"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/b36309-yRLEQYd2dDI5.jpg",
        "voiceActors": [
          {
            "id": 96485,
            "language": "Japanese",
            "name": {
              "first": "Iemasa",
              "last": "Kayumi",
              "full": "Iemasa Kayumi",
              "native": "家弓家正",
              "userPreferred": "Iemasa Kayumi"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/1485.jpg"
          },
          {
            "id": 95872,
            "language": "English",
            "name": {
              "first": "Kent",
              "last": "Williams",
              "full": "Kent Williams",
              "native": null,
              "userPreferred": "Kent Williams"
            },
            "image": "https://s4.anilist.co/file/anilistcdn/staff/large/872.jpg"
          },
          {
            "id": 156130,
            "language": "Italian",
            "name": {
              "first": "Paolo",
              "last": "Sesana",
              "full": "Paolo Sesana",
              "native": null,
              "userPreferred": "Paolo Sesana"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n156130-yJUVNuEcXemU.jpg"
          },
          {
            "id": 190009,
            "language": "Spanish",
            "name": {
              "first": "Arturo",
              "last": "Mercado",
              "full": "Arturo Mercado",
              "native": "Arturo Mercado Chacón",
              "userPreferred": "Arturo Mercado"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n190009-gjbZlyWBemZX.png"
          },
          {
            "id": 184109,
            "language": "Portuguese",
            "name": {
              "first": "Marco Antônio",
              "last": "Abreu",
              "full": "Marco Antônio Abreu",
              "native": null,
              "userPreferred": "Marco Antônio Abreu"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n184109-DYVjrI1bJAa2.jpg"
          },
          {
            "id": 191567,
            "language": "Portuguese",
            "name": {
              "first": "Luiz Feier",
              "last": "Motta",
              "full": "Luiz Feier Motta",
              "native": null,
              "userPreferred": "Luiz Feier Motta"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n191567-tPoNGtimtANR.jpg"
          },
          {
            "id": 140553,
            "language": "German",
            "name": {
              "first": "Renier",
              "last": "Baaken",
              "full": "Renier Baaken",
              "native": null,
              "userPreferred": "Renier Baaken"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n140553-ChBSWYFmRUgi.jpg"
          }
        ]
      },
      {
        "id": 250771,
        "role": "SUPPORTING",
        "name": {
          "first": "Gardner",
          "last": null,
          "full": "Gardner",
          "native": "ガードナー",
          "userPreferred": "Gardner"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/b250771-632ZJyiQcux1.png",
        "voiceActors": [
          {
            "id": 101966,
            "language": "Japanese",
            "name": {
              "first": "Hiroshi",
              "last": "Ito",
              "full": "Hiroshi Ito",
              "native": "糸博",
              "userPreferred": "Hiroshi Ito"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n101966-lCa3Ykl4h4py.jpg"
          },
          {
            "id": 104574,
            "language": "English",
            "name": {
              "first": "Steve",
              "last": "Powell",
              "full": "Steve Powell",
              "native": null,
              "userPreferred": "Steve Powell"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/9574.jpg"
          },
          {
            "id": 277209,
            "language": "Italian",
            "name": {
              "first": "Silvano",
              "last": "Piccardi",
              "full": "Silvano Piccardi",
              "native": null,
              "userPreferred": "Silvano Piccardi"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/default.jpg"
          },
          {
            "id": 179062,
            "language": "Portuguese",
            "name": {
              "first": "Marcelo",
              "last": "Pissardini",
              "full": "Marcelo Pissardini",
              "native": null,
              "userPreferred": "Marcelo Pissardini"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n179062-RQ3Z6GVhMj3d.jpg"
          },
          {
            "id": 182488,
            "language": "Portuguese",
            "name": {
              "first": "Hélio",
              "last": "Ribeiro",
              "full": "Hélio Ribeiro",
              "native": null,
              "userPreferred": "Hélio Ribeiro"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n182488-iJuYz3JIxLQZ.jpg"
          }
        ]
      },
      {
        "id": 251148,
        "role": "SUPPORTING",
        "name": {
          "first": "Kinba Isha",
          "last": null,
          "full": "Kinba Isha",
          "native": "金歯医者",
          "userPreferred": "Kinba Isha"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/b251148-vIsdu6WtDJpZ.png",
        "voiceActors": [
          {
            "id": 96549,
            "language": "Japanese",
            "name": {
              "first": "Bon",
              "last": "Ishihara",
              "full": "Bon Ishihara",
              "native": "石原凡",
              "userPreferred": "Bon Ishihara"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n96549-6SwX8QcYpEp0.png"
          },
          {
            "id": 95474,
            "language": "English",
            "name": {
              "first": "Mark",
              "last": "Stoddard",
              "full": "Mark Stoddard",
              "native": null,
              "userPreferred": "Mark Stoddard"
            },
            "image": "https://s4.anilist.co/file/anilistcdn/staff/large/474.jpg"
          },
          {
            "id": 198895,
            "language": "Spanish",
            "name": {
              "first": "Manuel",
              "last": "Bastos",
              "full": "Manuel Bastos",
              "native": null,
              "userPreferred": "Manuel Bastos"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n198895-FhNFXVMGunnf.png"
          },
          {
            "id": 184302,
            "language": "Spanish",
            "name": {
              "first": "Esteban",
              "last": "Desco",
              "full": "Esteban Desco",
              "native": null,
              "userPreferred": "Esteban Desco"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n184302-5XGTZcN1CT8c.jpg"
          },
          {
            "id": 185363,
            "language": "Portuguese",
            "name": {
              "first": "Walter",
              "last": "Cruz",
              "full": "Walter Cruz",
              "native": null,
              "userPreferred": "Walter Cruz"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n185363-LEzsXiLX9wu8.jpg"
          }
        ]
      },
      {
        "id": 8840,
        "role": "SUPPORTING",
        "name": {
          "first": "Martel",
          "last": null,
          "full": "Martel",
          "native": "マーテル",
          "userPreferred": "Martel"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/n8840-FdmCCLVXcynw.png",
        "voiceActors": [
          {
            "id": 95041,
            "language": "Japanese",
            "name": {
              "first": "Takako",
              "last": "Honda",
              "full": "Takako Honda",
              "native": "本田貴子",
              "userPreferred": "Takako Honda"
            },
            "image": "https://s4.anilist.co/file/anilistcdn/staff/large/41.jpg"
          },
          {
            "id": 95145,
            "language": "English",
            "name": {
              "first": "Tiffany",
              "last": "Grant",
              "full": "Tiffany Grant",
              "native": null,
              "userPreferred": "Tiffany Lynn Grant"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95145-c3MjV5tshGXX.jpg"
          },
          {
            "id": 119595,
            "language": "Italian",
            "name": {
              "first": "Beatrice",
              "last": "Caggiula",
              "full": "Beatrice Caggiula",
              "native": null,
              "userPreferred": "Beatrice Caggiula"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n119595-mSjuz5Ni4dcK.jpg"
          },
          {
            "id": 198307,
            "language": "Spanish",
            "name": {
              "first": "Danann",
              "last": "Huicochea",
              "full": "Danann Huicochea",
              "native": "Danann Alejandría Galván Huicochea",
              "userPreferred": "Danann Huicochea"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n198307-pYxKukUy9MwB.png"
          },
          {
            "id": 179631,
            "language": "Portuguese",
            "name": {
              "first": "Lucia",
              "last": "Helena",
              "full": "Lucia Helena",
              "native": "Lúcia Helena",
              "userPreferred": "Lucia Helena"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n179631-LvYh53HJB1dP.jpg"
          },
          {
            "id": 96445,
            "language": "Portuguese",
            "name": {
              "first": "Fernanda",
              "last": "Bullara",
              "full": "Fernanda Bullara",
              "native": null,
              "userPreferred": "Fernanda Bullara"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n96445-74PzPrUhV5pi.jpg"
          },
          {
            "id": 104747,
            "language": "French",
            "name": {
              "first": "Susan",
              "last": "Sindberg",
              "full": "Susan Sindberg",
              "native": null,
              "userPreferred": "Susan Sindberg"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n104747-3HN1vSuPSlEb.jpg"
          },
          {
            "id": 142565,
            "language": "German",
            "name": {
              "first": "Annette",
              "last": "Potempa",
              "full": "Annette Potempa",
              "native": null,
              "userPreferred": "Annette Potempa"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n142565-ORWPt6TX2sPu.png"
          },
          {
            "id": 104594,
            "language": "Hungarian",
            "name": {
              "first": "Judit",
              "last": "Wégner",
              "full": "Judit Wégner",
              "native": null,
              "userPreferred": "Judit Wégner"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/9594.jpg"
          }
        ]
      },
      {
        "id": 9319,
        "role": "SUPPORTING",
        "name": {
          "first": "Maria",
          "last": "Ross",
          "full": "Maria Ross",
          "native": "マリア・ロス",
          "userPreferred": "Maria Ross"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/9319.jpg",
        "voiceActors": [
          {
            "id": 95078,
            "language": "Japanese",
            "name": {
              "first": "Kaori",
              "last": "Nazuka",
              "full": "Kaori Nazuka",
              "native": "名塚佳織",
              "userPreferred": "Kaori Nazuka"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95078-tMm7zdlRNZ3P.jpg"
          },
          {
            "id": 95535,
            "language": "English",
            "name": {
              "first": "Meredith",
              "last": "McCoy",
              "full": "Meredith McCoy",
              "native": null,
              "userPreferred": "Meredith McCoy"
            },
            "image": "https://s4.anilist.co/file/anilistcdn/staff/large/535.jpg"
          },
          {
            "id": 158217,
            "language": "Italian",
            "name": {
              "first": "Maddalena",
              "last": "Vadacca",
              "full": "Maddalena Vadacca",
              "native": null,
              "userPreferred": "Maddalena Vadacca"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/default.jpg"
          },
          {
            "id": 184400,
            "language": "Spanish",
            "name": {
              "first": "Jennifer",
              "last": "Medel",
              "full": "Jennifer Medel",
              "native": null,
              "userPreferred": "Jennifer Medel"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n184400-7hfzD7giOuSA.jpg"
          },
          {
            "id": 100137,
            "language": "Portuguese",
            "name": {
              "first": "Silvia",
              "last": "Suzy",
              "full": "Silvia Suzy",
              "native": null,
              "userPreferred": "Silvia Suzy"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/5137.jpg"
          },
          {
            "id": 102705,
            "language": "German",
            "name": {
              "first": "Birte",
              "last": "Baumgardt",
              "full": "Birte Baumgardt",
              "native": null,
              "userPreferred": "Birte Baumgardt"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/7705.jpg"
          }
        ]
      },
      {
        "id": 25547,
        "role": "SUPPORTING",
        "name": {
          "first": "Scar Ani",
          "last": null,
          "full": "Scar Ani",
          "native": "スカー兄",
          "userPreferred": "Scar Ani"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/b25547-U0HRIl70uz8H.png",
        "voiceActors": [
          {
            "id": 95160,
            "language": "Japanese",
            "name": {
              "first": "Takehito",
              "last": "Koyasu",
              "full": "Takehito Koyasu",
              "native": "子安武人",
              "userPreferred": "Takehito Koyasu"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95160-jWevcH7BmfE1.jpg"
          },
          {
            "id": 95666,
            "language": "English",
            "name": {
              "first": "Robert",
              "last": "McCollum",
              "full": "Robert McCollum",
              "native": null,
              "userPreferred": "Robert McCollum"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95666-er3JLtqV1TLy.jpg"
          },
          {
            "id": 109863,
            "language": "Korean",
            "name": {
              "first": "Beom Gi",
              "last": "Hong",
              "full": "Beom Gi Hong",
              "native": "범기 홍",
              "userPreferred": "Beom Gi Hong"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/14863.jpg"
          },
          {
            "id": 193945,
            "language": "Spanish",
            "name": {
              "first": "Armando",
              "last": "Guerrero",
              "full": "Armando Guerrero",
              "native": "Jesús Armando Guerrero Morales",
              "userPreferred": "Armando Guerrero"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n193945-g5RZlBJvMNQC.png"
          },
          {
            "id": 102350,
            "language": "Portuguese",
            "name": {
              "first": "Alfredo",
              "last": "Rollo",
              "full": "Alfredo Rollo",
              "native": null,
              "userPreferred": "Alfredo Rollo"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n102350-J9WM40ldrYng.jpg"
          },
          {
            "id": 176914,
            "language": "Portuguese",
            "name": {
              "first": "Fabrício",
              "last": "Vila Verde",
              "full": "Fabrício Vila Verde",
              "native": null,
              "userPreferred": "Fabrício Vila Verde"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n176914-35uXwCsraZkG.jpg"
          },
          {
            "id": 139123,
            "language": "German",
            "name": {
              "first": "Thomas",
              "last": "Friebe",
              "full": "Thomas Friebe",
              "native": null,
              "userPreferred": "Thomas Friebe"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/default.jpg"
          }
        ]
      },
      {
        "id": 22474,
        "role": "SUPPORTING",
        "name": {
          "first": "Elicia",
          "last": "Hughes",
          "full": "Elicia Hughes",
          "native": "エリシア・ヒューズ",
          "userPreferred": "Elicia Hughes"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/b22474-S1qwbkCGW91I.png",
        "voiceActors": [
          {
            "id": 95207,
            "language": "Japanese",
            "name": {
              "first": "Misato",
              "last": "Fukuen",
              "full": "Misato Fukuen",
              "native": "福圓美里",
              "userPreferred": "Misato Fukuen"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95207-TYPMa0JKUDAf.jpg"
          },
          {
            "id": 96650,
            "language": "English",
            "name": {
              "first": "Cherami",
              "last": "Leigh",
              "full": "Cherami Leigh",
              "native": null,
              "userPreferred": "Cherami Leigh"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n96650-nIeKAJ8drDza.jpg"
          },
          {
            "id": 96233,
            "language": "Italian",
            "name": {
              "first": "Serena",
              "last": "Clerici",
              "full": "Serena Clerici",
              "native": null,
              "userPreferred": "Serena Clerici"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/1233.jpg"
          },
          {
            "id": 106403,
            "language": "Portuguese",
            "name": {
              "first": "Flora",
              "last": "Paulita",
              "full": "Flora Paulita",
              "native": null,
              "userPreferred": "Flora Paulita"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n106403-io0B6PS3mWTh.jpg"
          },
          {
            "id": 244870,
            "language": "Portuguese",
            "name": {
              "first": "Gigi",
              "last": "Patta",
              "full": "Gigi Patta",
              "native": null,
              "userPreferred": "Gigi Patta"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n244870-FK3IrKecDcEX.png"
          },
          {
            "id": 96679,
            "language": "German",
            "name": {
              "first": "Sarah",
              "last": "Brückner",
              "full": "Sarah Brückner",
              "native": null,
              "userPreferred": "Sarah Brückner"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/default.jpg"
          }
        ]
      },
      {
        "id": 5428,
        "role": "SUPPORTING",
        "name": {
          "first": "Barry the Chopper",
          "last": null,
          "full": "Barry the Chopper",
          "native": "バリー・ザ・チョッパー",
          "userPreferred": "Barry the Chopper"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/n5428-TJbELkDf4F0N.png",
        "voiceActors": [
          {
            "id": 101602,
            "language": "Japanese",
            "name": {
              "first": "Hideyuki",
              "last": "Umezu",
              "full": "Hideyuki Umezu",
              "native": "梅津秀行",
              "userPreferred": "Hideyuki Umezu"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n101602-wUvWtCkvNGNB.jpg"
          },
          {
            "id": 95302,
            "language": "English",
            "name": {
              "first": "Jerry",
              "last": "Jewell",
              "full": "Jerry Jewell",
              "native": null,
              "userPreferred": "Jerry Jewell"
            },
            "image": "https://s4.anilist.co/file/anilistcdn/staff/large/302.jpg"
          },
          {
            "id": 106920,
            "language": "Italian",
            "name": {
              "first": "Luca",
              "last": "Bottale",
              "full": "Luca Bottale",
              "native": null,
              "userPreferred": "Luca Bottale"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n106920-pIJQfJ0oF9Wi.png"
          },
          {
            "id": 189579,
            "language": "Spanish",
            "name": {
              "first": "Héctor",
              "last": "Estrada",
              "full": "Héctor Estrada",
              "native": null,
              "userPreferred": "Héctor Estrada"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n189579-vj82YhdMx4DD.png"
          },
          {
            "id": 103882,
            "language": "Portuguese",
            "name": {
              "first": "Élcio",
              "last": "Sodré",
              "full": "Élcio Sodré",
              "native": "Élcio Sodré",
              "userPreferred": "Élcio Sodré"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n103882-5ARxuNV5TBBu.jpg"
          },
          {
            "id": 115338,
            "language": "Portuguese",
            "name": {
              "first": "Mario",
              "last": "Jorge Andrade",
              "full": "Mario Jorge Andrade",
              "native": null,
              "userPreferred": "Mario Jorge Andrade"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n115338-EDZjVgdPQ4Ed.jpg"
          },
          {
            "id": 139127,
            "language": "German",
            "name": {
              "first": "Arne",
              "last": "Obermeyer",
              "full": "Arne Obermeyer",
              "native": null,
              "userPreferred": "Arne Obermeyer"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n139127-WWNoGrt469cu.png"
          }
        ]
      },
      {
        "id": 10954,
        "role": "SUPPORTING",
        "name": {
          "first": "Gracia",
          "last": "Hughes",
          "full": "Gracia Hughes",
          "native": "グレイシア・ヒューズ",
          "userPreferred": "Gracia Hughes"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/b10954-lbg0Qqj7EPOR.png",
        "voiceActors": [
          {
            "id": 95471,
            "language": "Japanese",
            "name": {
              "first": "Tomoe",
              "last": "Hanba",
              "full": "Tomoe Hanba",
              "native": "半場友恵",
              "userPreferred": "Tomoe Hanba"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95471-QFtcXqtRwhlS.png"
          },
          {
            "id": 105292,
            "language": "English",
            "name": {
              "first": "Anastasia",
              "last": "Muñoz",
              "full": "Anastasia Muñoz",
              "native": null,
              "userPreferred": "Anastasia Muñoz"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/10292.jpg"
          },
          {
            "id": 96275,
            "language": "Italian",
            "name": {
              "first": "Patrizia",
              "last": "Scianca",
              "full": "Patrizia Scianca",
              "native": null,
              "userPreferred": "Patrizia Scianca"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n96275-K5vy1UBZWPA0.png"
          },
          {
            "id": 201446,
            "language": "Spanish",
            "name": {
              "first": "Dolores",
              "last": "Mondragón",
              "full": "Dolores Mondragón",
              "native": null,
              "userPreferred": "Dolores Mondragón"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n201446-vZUaDfUTL8li.png"
          },
          {
            "id": 102593,
            "language": "Portuguese",
            "name": {
              "first": "Adriana",
              "last": "Pissardini",
              "full": "Adriana Pissardini",
              "native": null,
              "userPreferred": "Adriana Pissardini"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/7593.jpg"
          },
          {
            "id": 101122,
            "language": "German",
            "name": {
              "first": "Petra",
              "last": "Glunz-grosch",
              "full": "Petra Glunz-grosch",
              "native": null,
              "userPreferred": "Petra Glunz-grosch"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/6122.jpg"
          },
          {
            "id": 102811,
            "language": "Hungarian",
            "name": {
              "first": "Orsolya",
              "last": "Oláh",
              "full": "Orsolya Oláh",
              "native": null,
              "userPreferred": "Orsolya Oláh"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/default.jpg"
          }
        ]
      },
      {
        "id": 66,
        "role": "SUPPORTING",
        "name": {
          "first": "Scar",
          "last": null,
          "full": "Scar",
          "native": "スカー",
          "userPreferred": "Scar"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/b66-bLbGWXrmDqfV.png",
        "voiceActors": [
          {
            "id": 95720,
            "language": "Japanese",
            "name": {
              "first": "Kenta",
              "last": "Miyake",
              "full": "Kenta Miyake",
              "native": "三宅健太",
              "userPreferred": "Kenta Miyake"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n95720-enxx6kZKuwGi.jpg"
          },
          {
            "id": 96602,
            "language": "English",
            "name": {
              "first": "J. Michael",
              "last": "Tatum",
              "full": "J. Michael Tatum",
              "native": "John Michael Tatum",
              "userPreferred": "J. Michael Tatum"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n96602-ztTfuo3nzu5t.png"
          },
          {
            "id": 160266,
            "language": "Italian",
            "name": {
              "first": "Massimiliano",
              "last": "Lotti",
              "full": "Massimiliano Lotti",
              "native": null,
              "userPreferred": "Massimiliano Lotti"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n160266-5OJb8QO3Bgsz.jpg"
          },
          {
            "id": 199294,
            "language": "Spanish",
            "name": {
              "first": "Ricardo",
              "last": "Brust",
              "full": "Ricardo Brust",
              "native": "Ricardo Salas Brust",
              "userPreferred": "Ricardo Brust"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n199294-ALZ45Jgn1mcp.png"
          },
          {
            "id": 153004,
            "language": "Portuguese",
            "name": {
              "first": "Felipe",
              "last": "Grinnan",
              "full": "Felipe Grinnan",
              "native": null,
              "userPreferred": "Felipe Grinnan"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n153004-CgGmVAsohWRg.png"
          },
          {
            "id": 177125,
            "language": "Portuguese",
            "name": {
              "first": "Francisco",
              "last": "Junior",
              "full": "Francisco Junior",
              "native": "Francisco Júnior",
              "userPreferred": "Francisco Junior"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n177125-bfwA5g2AW0oX.jpg"
          },
          {
            "id": 96179,
            "language": "French",
            "name": {
              "first": "Antoine",
              "last": "Tomé",
              "full": "Antoine Tomé",
              "native": null,
              "userPreferred": "Antoine Tomé"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n96179-1gXdEKvBylBF.jpg"
          },
          {
            "id": 96694,
            "language": "German",
            "name": {
              "first": "Stephan",
              "last": "Schleberger",
              "full": "Stephan Schleberger",
              "native": null,
              "userPreferred": "Stephan Schleberger"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/default.jpg"
          },
          {
            "id": 102857,
            "language": "Hungarian",
            "name": {
              "first": "Viczián",
              "last": "Ottó",
              "full": "Viczián Ottó",
              "native": null,
              "userPreferred": "Viczián Ottó"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/7857.jpg"
          }
        ]
      },
      {
        "id": 15531,
        "role": "SUPPORTING",
        "name": {
          "first": "Grumman",
          "last": null,
          "full": "Grumman",
          "native": "グラマン",
          "userPreferred": "Grumman"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/n15531-ibDxEMsxkrzT.png",
        "voiceActors": [
          {
            "id": 96128,
            "language": "Japanese",
            "name": {
              "first": "Rokuro",
              "last": "Naya",
              "full": "Rokuro Naya",
              "native": "納谷六朗",
              "userPreferred": "Rokuro Naya"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n96128-cHvdKhF6dgK9.png"
          },
          {
            "id": 101876,
            "language": "English",
            "name": {
              "first": "Bill",
              "last": "Flynn",
              "full": "Bill Flynn",
              "native": null,
              "userPreferred": "Bill Flynn"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/6876.jpg"
          },
          {
            "id": 96240,
            "language": "Italian",
            "name": {
              "first": "Mario",
              "last": "Scarabelli",
              "full": "Mario Scarabelli",
              "native": null,
              "userPreferred": "Mario Scarabelli"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n96240-skGulG7kauYH.png"
          },
          {
            "id": 200036,
            "language": "Spanish",
            "name": {
              "first": "Jesse",
              "last": "Conde",
              "full": "Jesse Conde",
              "native": null,
              "userPreferred": "Jesse Conde"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n200036-6nYRfW1UqfRS.png"
          },
          {
            "id": 208643,
            "language": "Portuguese",
            "name": {
              "first": "José Carlos",
              "last": "Guerra",
              "full": "José Carlos Guerra",
              "native": null,
              "userPreferred": "José Carlos Guerra"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n208643-zFancQ3Pt78H.jpg"
          },
          {
            "id": 175188,
            "language": "Portuguese",
            "name": {
              "first": "Carlos",
              "last": "Gesteira",
              "full": "Carlos Gesteira",
              "native": null,
              "userPreferred": "Carlos Gesteira"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n175188-pL7OsoxYpzd9.png"
          },
          {
            "id": 139138,
            "language": "German",
            "name": {
              "first": "Hans-Gerd",
              "last": "Kilbinger",
              "full": "Hans-Gerd Kilbinger",
              "native": null,
              "userPreferred": "Hans-Gerd Kilbinger"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n139138-3s9KGBE9YtEc.jpg"
          }
        ]
      },
      {
        "id": 50123,
        "role": "SUPPORTING",
        "name": {
          "first": "Charlie",
          "last": null,
          "full": "Charlie",
          "native": "チャーリー",
          "userPreferred": "Charlie"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/n50123-2kInS5rwOuM7.png",
        "voiceActors": [
          {
            "id": 100928,
            "language": "Japanese",
            "name": {
              "first": "Rintarou",
              "last": "Nishi",
              "full": "Rintarou Nishi",
              "native": "西凜太朗",
              "userPreferred": "Rintarou Nishi"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n100928-OfFb5f55VSFB.png"
          },
          {
            "id": 104777,
            "language": "English",
            "name": {
              "first": "David",
              "last": "Wald",
              "full": "David Wald",
              "native": null,
              "userPreferred": "David Wald"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/9777.jpg"
          },
          {
            "id": 208644,
            "language": "Portuguese",
            "name": {
              "first": "Fernando",
              "last": "Peron",
              "full": "Fernando Peron",
              "native": null,
              "userPreferred": "Fernando Peron"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n208644-WqciQcTpX3OF.png"
          },
          {
            "id": 216160,
            "language": "Portuguese",
            "name": {
              "first": "Eduardo",
              "last": "Villas",
              "full": "Eduardo Villas",
              "native": null,
              "userPreferred": "Eduardo Villas"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/n216160-omRUbpKwj7um.png"
          },
          {
            "id": 117899,
            "language": "German",
            "name": {
              "first": "Markus",
              "last": "Haase",
              "full": "Markus Haase",
              "native": null,
              "userPreferred": "Markus Haase"
            },
            "image":
                "https://s4.anilist.co/file/anilistcdn/staff/large/22899.jpg"
          }
        ]
      },
      {
        "id": 7203,
        "role": "SUPPORTING",
        "name": {
          "first": "Black Hayate",
          "last": null,
          "full": "Black Hayate",
          "native": "ブラックハヤテ",
          "userPreferred": "Black Hayate"
        },
        "image":
            "https://s4.anilist.co/file/anilistcdn/character/large/b7203-FcriYVNERLe3.png",
        "voiceActors": []
      }
    ],
    "relations": [
      {
        "id": 30025,
        "relationType": "ADAPTATION",
        "malId": 25,
        "title": {
          "romaji": "Hagane no Renkinjutsushi",
          "english": "Fullmetal Alchemist",
          "native": "鋼の錬金術師",
          "userPreferred": "Hagane no Renkinjutsushi"
        },
        "status": "Completed",
        "episodes": null,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/manga/cover/large/bx30025-H2Es0tn49tir.png",
        "color": "#DD2D2D",
        "type": "MANGA",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/manga/banner/30025-IaxAxX9hIGx0.jpg",
        "rating": 88
      },
      {
        "id": 6421,
        "relationType": "SIDE_STORY",
        "malId": 6421,
        "title": {
          "romaji":
              "Hagane no Renkinjutsushi: FULLMETAL ALCHEMIST Mihousou Episode",
          "english": "Fullmetal Alchemist: Brotherhood OVA Collection",
          "native": "鋼の錬金術師 FULLMETAL ALCHEMIST 未放送エピソード",
          "userPreferred":
              "Hagane no Renkinjutsushi: FULLMETAL ALCHEMIST Mihousou Episode"
        },
        "status": "Completed",
        "episodes": 4,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/6421.jpg",
        "color": "#bbf1ff",
        "type": "OVA",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/6421-yqShxVmGNtd0.jpg",
        "rating": 77
      },
      {
        "id": 9135,
        "relationType": "SIDE_STORY",
        "malId": 9135,
        "title": {
          "romaji": "Hagane no Renkinjutsushi: Milos no Seinaru Hoshi",
          "english": "Fullmetal Alchemist: The Sacred Star of Milos",
          "native": "劇場版 鋼の錬金術師 嘆きの丘の聖なる星",
          "userPreferred": "Hagane no Renkinjutsushi: Milos no Seinaru Hoshi"
        },
        "status": "Completed",
        "episodes": 1,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx9135-nPvbvO7QCx7L.jpg",
        "color": "#785028",
        "type": "MOVIE",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/9135-Ffg7j7Rd641G.jpg",
        "rating": 69
      },
      {
        "id": 121,
        "relationType": "ALTERNATIVE",
        "malId": 121,
        "title": {
          "romaji": "Hagane no Renkinjutsushi",
          "english": "Fullmetal Alchemist",
          "native": "鋼の錬金術師",
          "userPreferred": "Hagane no Renkinjutsushi"
        },
        "status": "Completed",
        "episodes": 51,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/large/bx121-JUlbsyhTUNkk.png",
        "color": "#e4bb43",
        "type": "TV",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/banner/121-t5K7c8WRuPWl.jpg",
        "rating": 79
      },
      {
        "id": 7902,
        "relationType": "SPIN_OFF",
        "malId": 7902,
        "title": {
          "romaji":
              "Hagane no Renkinjutsushi: FULLMETAL ALCHEMIST - Arakawa Hiromu Kaki Oroshi 4-koma Gekijou",
          "english": "Fullmetal Alchemist: Brotherhood: 4-Koma Theater",
          "native": "鋼の錬金術師 FULLMETAL ALCHEMIST 荒川弘 描き下ろし4コマ劇場",
          "userPreferred":
              "Hagane no Renkinjutsushi: FULLMETAL ALCHEMIST - Arakawa Hiromu Kaki Oroshi 4-koma Gekijou"
        },
        "status": "Completed",
        "episodes": 16,
        "image":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/7902.jpg",
        "color": "#e4c9a1",
        "type": "SPECIAL",
        "cover":
            "https://s4.anilist.co/file/anilistcdn/media/anime/cover/medium/7902.jpg",
        "rating": 70
      }
    ],
    "episodes": [
      {
        "id": "fullmetal-alchemist-brotherhood-episode-1",
        "title": "Fullmetal Alchemist",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66063/original.jpg",
        "number": 1,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-1"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-2",
        "title": "The First Day",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66064/original.jpg",
        "number": 2,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-2"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-3",
        "title": "City of Heresy",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66065/original.jpg",
        "number": 3,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-3"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-4",
        "title": "An Alchemist's Anguish",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66066/original.jpg",
        "number": 4,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-4"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-5",
        "title": "Rain of Sorrows",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66067/original.jpg",
        "number": 5,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-5"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-6",
        "title": "Road of Hope",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66068/original.jpg",
        "number": 6,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-6"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-7",
        "title": "Hidden Truths",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66069/original.jpg",
        "number": 7,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-7"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-8",
        "title": "The Fifth Laboratory",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66070/original.jpg",
        "number": 8,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-8"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-9",
        "title": "Created Feelings",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66071/original.jpg",
        "number": 9,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-9"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-10",
        "title": "Separate Destinations",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66072/original.jpg",
        "number": 10,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-10"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-11",
        "title": "Miracle at Rush Valley",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66073/original.jpg",
        "number": 11,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-11"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-12",
        "title": "One is All, All is One",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66074/original.jpg",
        "number": 12,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-12"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-13",
        "title": "Beasts of Dublith",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66075/original.jpg",
        "number": 13,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-13"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-14",
        "title": "Those Who Lurk Underground",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66076/original.jpg",
        "number": 14,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-14"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-15",
        "title": "Envoy From the East",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66077/original.jpg",
        "number": 15,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-15"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-16",
        "title": "Footsteps of a Comrade-in-Arms",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66078/original.jpg",
        "number": 16,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-16"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-17",
        "title": "Cold Flame",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66079/original.jpg",
        "number": 17,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-17"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-18",
        "title": "The Arrogant Palm of a Small Human",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66080/original.jpg",
        "number": 18,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-18"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-19",
        "title": "Death of the Undying",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66081/original.jpg",
        "number": 19,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-19"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-20",
        "title": "Father Before the Grave",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66082/original.jpg",
        "number": 20,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-20"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-21",
        "title": "Advance of the Fool",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66083/original.jpg",
        "number": 21,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-21"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-22",
        "title": "Backs in the Distance",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66084/original.jpg",
        "number": 22,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-22"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-23",
        "title": "Girl on the Battlefield",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66085/original.jpg",
        "number": 23,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-23"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-24",
        "title": "Inside the Belly",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66086/original.jpg",
        "number": 24,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-24"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-25",
        "title": "Doorway of Darkness",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66087/original.jpg",
        "number": 25,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-25"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-26",
        "title": "Reunion",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66088/original.jpg",
        "number": 26,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-26"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-27",
        "title": "Interlude Party",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66089/original.jpg",
        "number": 27,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-27"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-28",
        "title": "Father",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66090/original.jpg",
        "number": 28,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-28"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-29",
        "title": "Struggle of the Fool",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66091/original.jpg",
        "number": 29,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-29"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-30",
        "title": "The Ishvalan War of Extermination",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66092/original.jpg",
        "number": 30,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-30"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-31",
        "title": "The 520 Cens Promise",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66093/original.jpg",
        "number": 31,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-31"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-32",
        "title": "The Fuhrer's Son",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66094/original.jpg",
        "number": 32,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-32"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-33",
        "title": "The Northern Wall of Briggs",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66095/original.jpg",
        "number": 33,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-33"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-34",
        "title": "Ice Queen",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66096/original.jpg",
        "number": 34,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-34"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-35",
        "title": "The Shape of This Country",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66097/original.jpg",
        "number": 35,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-35"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-36",
        "title": "Family Portrait",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66098/original.jpg",
        "number": 36,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-36"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-37",
        "title": "The First Homunculus",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66099/original.jpg",
        "number": 37,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-37"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-38",
        "title": "Conflict at Baschool",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66100/original.jpg",
        "number": 38,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-38"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-39",
        "title": "Daydream",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66101/original.jpg",
        "number": 39,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-39"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-40",
        "title": "Homunculus (The Dwarf in the Flask)",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66102/original.jpg",
        "number": 40,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-40"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-41",
        "title": "The Abyss",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66103/original.jpg",
        "number": 41,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-41"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-42",
        "title": "Signs of a Counteroffensive",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66104/original.jpg",
        "number": 42,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-42"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-43",
        "title": "Bite of the Ant",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66105/original.jpg",
        "number": 43,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-43"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-44",
        "title": "Revving at Full Throttle",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66106/original.jpg",
        "number": 44,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-44"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-45",
        "title": "The Promised Day",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66107/original.jpg",
        "number": 45,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-45"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-46",
        "title": "Looming Shadows",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66108/original.jpg",
        "number": 46,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-46"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-47",
        "title": "Emissary of Darkness",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66109/original.jpg",
        "number": 47,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-47"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-48",
        "title": "The Oath in the Tunnel",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66110/original.jpg",
        "number": 48,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-48"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-49",
        "title": "Filial Affection",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66111/original.jpg",
        "number": 49,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-49"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-50",
        "title": "Upheaval in Central",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66112/original.jpg",
        "number": 50,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-50"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-51",
        "title": "The Immortal Legion",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66113/original.jpg",
        "number": 51,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-51"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-52",
        "title": "Combined Strength",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66114/original.jpg",
        "number": 52,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-52"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-53",
        "title": "Flame of Vengeance",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66115/original.jpg",
        "number": 53,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-53"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-54",
        "title": "Beyond the Inferno",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66116/original.jpg",
        "number": 54,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-54"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-55",
        "title": "The Adults' Way of Life",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66117/original.jpg",
        "number": 55,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-55"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-56",
        "title": "The Return of the Fuhrer",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66118/original.jpg",
        "number": 56,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-56"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-57",
        "title": "Eternal Leave",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66119/original.jpg",
        "number": 57,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-57"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-58",
        "title": "Sacrifices",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66120/original.jpg",
        "number": 58,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-58"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-59",
        "title": "Lost Light",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66121/original.jpg",
        "number": 59,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-59"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-60",
        "title": "Eye of Heaven, Gateway of Earth",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66122/original.jpg",
        "number": 60,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-60"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-61",
        "title": "He Who Would Swallow God",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66123/original.jpg",
        "number": 61,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-61"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-62",
        "title": "A Fierce Counterattack",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66124/original.jpg",
        "number": 62,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-62"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-63",
        "title": "The Other Side of the Gateway",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66125/original.jpg",
        "number": 63,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-63"
      },
      {
        "id": "fullmetal-alchemist-brotherhood-episode-64",
        "title": "Journey's End",
        "image":
            "https://media.kitsu.io/episodes/thumbnails/66126/original.jpg",
        "number": 64,
        "createdAt": "2013-02-20T18:26:25Z",
        "description": null,
        "url":
            "https://gogoanimehd.to//fullmetal-alchemist-brotherhood-episode-64"
      }
    ]
  };

  // Future info() async {
  //   var temp = await getInfo(infoId);
  //   setState(() {
  //     data = temp;
  //   });
  //   print('info data => ${data}');
  // }

  // @override
  // void initState() {
  //   infoId = widget.infoId;
  //   info();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
              title: Text(
                  maxLines: 1,
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.titleLarge,
                  '${data["title"]?["romaji"] != null ? data["title"]["romaji"] : data["title"]?["english"] != null ? data["title"]["english"] : data["title"]?["native"] != null ? data["title"]["native"] : "Anime Info"}'),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("popular");
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.white,
                    ))
              ],
              elevation: 2,
              shadowColor: Colors.white,
              bottom: TabBar(
                isScrollable: true,
                indicatorWeight: 1,
                indicatorSize: TabBarIndicatorSize.tab,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                indicatorColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.white,
                indicator: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 4, color: Colors.white))),
                tabs: [
                  Tab(
                    child: Text("Info",
                        style: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.fontSize,
                            fontWeight: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.fontWeight,
                            overflow: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.overflow)),
                  ),
                  Tab(
                      child: Text("Characters",
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.fontWeight,
                              overflow: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.overflow))),
                  Tab(
                      child: Text("Episodes",
                          style: TextStyle(
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.fontSize,
                              fontWeight: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.fontWeight,
                              overflow: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.overflow))),
                ],
              )),
          drawer: Drawer(
            child: AppDrawer(),
          ),
          body: ScrollConfiguration(
            behavior: const ScrollBehavior()
                .copyWith(physics: const ClampingScrollPhysics()),
            child: TabBarView(
              children: [
                InfoWidget(
                  data: data,
                ),
                CharactersWidget(characters: data["characters"]),
                EpisodesWidget(
                  episodes: data["episodes"],
                  mainImage:
                      data["image"] != null ? data["image"] : data["cover"],
                  showTitle: data["title"]?["romaji"] != null
                      ? data["title"]["romaji"]
                      : data["title"]?["english"] != null
                          ? data["title"]["english"]
                          : data["title"]?["native"] != null
                              ? data["title"]["native"]
                              : "Unknown",
                ),
              ],
            ),
          )),
    );
  }
}

class InfoWidget extends StatelessWidget {
  final data;
  const InfoWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ScrollConfiguration(
        behavior: const ScrollBehavior()
            .copyWith(physics: const ClampingScrollPhysics()),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
                // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                // height: double.infinity,
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: data["error"] != null
                    ? ErrorMessage(
                        message: data["error"] ?? "",
                      )
                    : data.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.lightBlue,
                            ),
                          )
                        : Column(
                            children: [
                              data["cover"] != null && data["image"] != null
                                  ? Expanded(
                                      flex: 2,
                                      child: Stack(
                                        alignment: Alignment.topCenter,
                                        children: [
                                          Positioned(
                                              top: 0,
                                              left: 0,
                                              right: 0,
                                              height: 200,
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.white,
                                                        blurRadius: 1.0,
                                                      )
                                                    ]),
                                                child: FadeInImage.assetNetwork(
                                                  placeholder: placeholderImage,
                                                  image:
                                                      '${data["cover"] ?? data["image"]}',
                                                  fadeInCurve:
                                                      Curves.fastOutSlowIn,
                                                  fit: BoxFit.cover,
                                                  width: double.maxFinite,
                                                  height: double.maxFinite,
                                                ),
                                              )),
                                          Positioned(
                                              top: 40,
                                              left: 10,
                                              // width: 110,
                                              // height: 150,
                                              // width: double.maxFinite,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                            boxShadow: [
                                                          BoxShadow(
                                                              color:
                                                                  Colors.black,
                                                              blurRadius: 10.0,
                                                              offset:
                                                                  Offset(6, 8))
                                                        ]),
                                                    child: FadeInImage
                                                        .assetNetwork(
                                                      fadeInCurve: Curves
                                                          .fastLinearToSlowEaseIn,
                                                      placeholder:
                                                          placeholderImage,
                                                      image: '${data["image"]}',
                                                      fit: BoxFit.cover,
                                                      width: 110,
                                                      height: 150,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 240,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Text(
                                                        maxLines: 3,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium,
                                                        '${data["title"]?["romaji"] != null ? data["title"]["romaji"] : data["title"]?["english"] != null ? data["title"]["english"] : data["title"]?["native"] != null ? data["title"]["native"] : "Unknown"}'),
                                                  )
                                                ],
                                              )),
                                        ],
                                      ),
                                    )
                                  : const Placeholder(
                                      color: Colors.red,
                                      fallbackHeight: 200,
                                    ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      data["description"] != null
                                          ? Container(
                                              padding: const EdgeInsets.all(15),
                                              decoration: const BoxDecoration(
                                                  border: Border.symmetric(
                                                horizontal: BorderSide(
                                                  color: Color.fromARGB(
                                                      64, 158, 158, 158),
                                                  width: 1,
                                                ),
                                              )),
                                              // height: 300,
                                              child: InkWell(
                                                onTap: () {
                                                  showModalBottomSheet(
                                                      context: context,
                                                      isDismissible: true,
                                                      showDragHandle: true,
                                                      enableDrag: true,
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255, 2, 2, 2),
                                                      barrierColor:
                                                          const Color.fromARGB(
                                                              160, 15, 15, 15),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      builder: (context) {
                                                        return Container(
                                                          // height: 200,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15),
                                                          child:
                                                              ScrollConfiguration(
                                                            behavior:
                                                                const ScrollBehavior()
                                                                    .copyWith(
                                                                        physics:
                                                                            const ClampingScrollPhysics()),
                                                            child:
                                                                SingleChildScrollView(
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              child: Text(
                                                                '${filterText(data["description"])}',
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                overflow:
                                                                    TextOverflow
                                                                        .visible,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodySmall,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      });
                                                },
                                                child: Text(
                                                  '${filterText(data["description"])}',
                                                  maxLines: 6,
                                                  textAlign: TextAlign.start,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                              ),
                                            )
                                          : Text(
                                              '${data["title"]?["romaji"] != null ? data["title"]["romaji"] : data["title"]?["english"] != null ? data["title"]["english"] : data["title"]?["native"] != null ? data["title"]["native"] : "Unknown"}',
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall,
                                            ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              data["status"] != null
                                                  ? Row(children: [
                                                      Text(
                                                        "Status: ",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall,
                                                      ),
                                                      Text("${data["status"]}",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleSmall)
                                                    ])
                                                  : const SizedBox(width: 0),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              (data["studios"] != null ||
                                                      data["studios"]
                                                          .isNotEmpty())
                                                  ? Row(children: [
                                                      Text(
                                                        "Studios: ",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall,
                                                      ),
                                                      Text(
                                                          "${data["studios"]?[0].toUpperCase()}",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleSmall)
                                                    ])
                                                  : const SizedBox(
                                                      width: 0,
                                                    ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(children: [
                                                Text(
                                                  "Start: ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                                data["startDate"] != null ||
                                                        data["startDate"]
                                                            .isNotEmpty()
                                                    ? Text(
                                                        ' ${data["startDate"]?["month"] ?? "??"}/${data["startDate"]?["day"] ?? "??"}/${data["startDate"]?["year"] ?? "??"}',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium)
                                                    : Text("Unknown",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium)
                                              ]),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              Row(children: [
                                                Text(
                                                  "End: ",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                                data["endDate"] != null ||
                                                        data["endDate"]
                                                            .isNotEmpty()
                                                    ? Text(
                                                        ' ${data["endDate"]?["month"] ?? "??"}/${data["endDate"]?["day"] ?? "??"}/${data["endDate"]?["year"] ?? "??"} ',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium)
                                                    : Text(" Unknown ",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium)
                                              ]),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 30,
                                          ),
                                          (data["genres"].isNotEmpty ||
                                                  data["genres"] != null)
                                              ? Container(
                                                  width: constraints.maxWidth,
                                                  height: 30,
                                                  alignment: Alignment.center,
                                                  child: ScrollConfiguration(
                                                    behavior: const ScrollBehavior()
                                                        .copyWith(
                                                            physics:
                                                                const BouncingScrollPhysics()),
                                                    child: ListView.separated(
                                                      separatorBuilder:
                                                          (context, index) =>
                                                              const SizedBox(
                                                        width: 8,
                                                      ),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          data["genres"].length,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return ElevatedButton(
                                                          // color: Colors.green,
                                                          style: ButtonStyle(
                                                            shape:
                                                                MaterialStateProperty
                                                                    .all(
                                                              RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            3), // Set the border radius as per your requirement
                                                                side: const BorderSide(
                                                                    color: Colors
                                                                        .white,
                                                                    width:
                                                                        1), // Set the border color and width
                                                              ),
                                                            ),
                                                          ),
                                                          onPressed: () {},
                                                          child: Text(
                                                            '${data["genres"][index]}',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .labelSmall,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox(
                                                  width: 0,
                                                )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              // data["characters"] != null || data["characters"].length > 0
                              //     ? CharactersWidget(characters: data["characters"],)
                              //     : const SizedBox(
                              //         height: 0,
                              //       ),
                            ],
                          )),
          ],
        ),
      );
    });
  }
}

class CharactersWidget extends StatelessWidget {
  final characters;
  const CharactersWidget({super.key, required this.characters});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ScrollConfiguration(
        behavior: const ScrollBehavior()
            .copyWith(physics: const ClampingScrollPhysics()),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
                // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                // height: double.infinity,
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: characters == null
                    ? const ErrorMessage(
                        message: "No characters!",
                      )
                    : characters.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.lightBlue,
                            ),
                          )
                        : Expanded(
                            child: Container(
                                // height: 200,
                                // width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: 150,
                                      mainAxisExtent: 150,
                                    ),
                                    // scrollDirection:
                                    //     Axis.horizontal,
                                    itemCount: characters.length > 0
                                        ? characters.length
                                        : 0,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              isDismissible: true,
                                              showDragHandle: true,
                                              enableDrag: true,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 2, 2, 2),
                                              barrierColor:
                                                  const Color.fromARGB(
                                                      160, 15, 15, 15),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              builder: (context) {
                                                return Container(
                                                    width: double.infinity,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: ScrollConfiguration(
                                                      behavior:
                                                          const ScrollBehavior()
                                                              .copyWith(
                                                                  physics:
                                                                      const ClampingScrollPhysics()),
                                                      child: ListView(
                                                        children: [
                                                          Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          50),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      characters[index]["role"] !=
                                                                              null
                                                                          ? Row(
                                                                              children: [
                                                                                Text("Role: ", style: TextStyle(color: Colors.grey, fontSize: Theme.of(context).textTheme.titleMedium?.fontSize)),
                                                                                Text(
                                                                                  "${capitalize(characters[index]["role"])}",
                                                                                  style: Theme.of(context).textTheme.titleMedium,
                                                                                )
                                                                              ],
                                                                            )
                                                                          : const SizedBox(
                                                                              width: 0,
                                                                            ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      characters[index]["name"]?["userPreferred"] !=
                                                                              null
                                                                          ? Row(
                                                                              children: [
                                                                                Text("Character: ", style: TextStyle(color: Colors.grey, fontSize: Theme.of(context).textTheme.titleMedium?.fontSize)),
                                                                                Text(
                                                                                  "${characters[index]["name"]["userPreferred"]}",
                                                                                  style: Theme.of(context).textTheme.titleMedium,
                                                                                )
                                                                              ],
                                                                            )
                                                                          : characters[index]["name"]?["full"] != null
                                                                              ? Row(
                                                                                  children: [
                                                                                    Text("Character: ", style: TextStyle(color: Colors.grey, fontSize: Theme.of(context).textTheme.titleMedium?.fontSize)),
                                                                                    Text(
                                                                                      "${characters[index]["name"]["full"]}",
                                                                                      style: Theme.of(context).textTheme.titleMedium,
                                                                                    )
                                                                                  ],
                                                                                )
                                                                              : Row(
                                                                                  children: [
                                                                                    Text("Character: ", style: TextStyle(color: Colors.grey, fontSize: Theme.of(context).textTheme.titleMedium?.fontSize)),
                                                                                    Text(
                                                                                      "Unknown",
                                                                                      style: Theme.of(context).textTheme.titleMedium,
                                                                                    )
                                                                                  ],
                                                                                ),
                                                                      const SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      characters[index]["voiceActors"]?.length >
                                                                              0
                                                                          ? characters[index]["voiceActors"][0]["name"]["userPreferred"] != null
                                                                              ? Row(
                                                                                  children: [
                                                                                    Text("Voice actor: ", style: TextStyle(color: Colors.grey, fontSize: Theme.of(context).textTheme.titleMedium?.fontSize)),
                                                                                    Text(
                                                                                      "${characters[index]["voiceActors"][0]["name"]["userPreferred"]}",
                                                                                      style: Theme.of(context).textTheme.titleMedium,
                                                                                    )
                                                                                  ],
                                                                                )
                                                                              : characters[index]["voiceActors"][0]["name"]["full"] != null
                                                                                  ? Row(
                                                                                      children: [
                                                                                        Text("Voice actor: ", style: TextStyle(color: Colors.grey, fontSize: Theme.of(context).textTheme.titleMedium?.fontSize)),
                                                                                        Text(
                                                                                          "${characters[index]["voiceActors"][0]["name"]["full"]}",
                                                                                          style: Theme.of(context).textTheme.titleMedium,
                                                                                        )
                                                                                      ],
                                                                                    )
                                                                                  : Row(
                                                                                      children: [
                                                                                        Text("Voice actor: ", style: TextStyle(color: Colors.grey, fontSize: Theme.of(context).textTheme.titleMedium?.fontSize)),
                                                                                        Text(
                                                                                          "Unknown",
                                                                                          style: Theme.of(context).textTheme.titleMedium,
                                                                                        )
                                                                                      ],
                                                                                    )
                                                                          : const SizedBox(
                                                                              width: 0,
                                                                            ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                  height: 20,
                                                                ),
                                                                Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Container(
                                                                        height:
                                                                            200,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            characters[index]["image"] != null
                                                                                ? FadeInImage.assetNetwork(
                                                                                    fadeInCurve: Curves.fastLinearToSlowEaseIn,
                                                                                    placeholder: placeholderImage,
                                                                                    image: '${characters[index]["image"]}',
                                                                                    fit: BoxFit.cover,
                                                                                  )
                                                                                : Image.asset(
                                                                                    backupImage,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                            const SizedBox(width: 20),
                                                                            (characters[index]["voiceActors"]?.length > 0 && characters[index]["voiceActors"][0]["image"] != null)
                                                                                ? FadeInImage.assetNetwork(
                                                                                    fadeInCurve: Curves.fastLinearToSlowEaseIn,
                                                                                    placeholder: placeholderImage,
                                                                                    image: '${characters[index]["voiceActors"][0]["image"]}',
                                                                                    fit: BoxFit.cover,
                                                                                  )
                                                                                : Image.asset(
                                                                                    backupImage,
                                                                                    fit: BoxFit.cover,
                                                                                    // width: 100,
                                                                                  ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ])
                                                              ]),
                                                        ],
                                                      ),
                                                    ));
                                              });
                                        },
                                        child: Container(
                                            margin: const EdgeInsets.all(5),
                                            decoration: const BoxDecoration(
                                              color: Colors.lightBlueAccent,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            // width: 120,
                                            // height: 120,
                                            child: characters[index]["image"] !=
                                                    null
                                                ? Stack(
                                                    children: [
                                                      Positioned(
                                                          left: 0,
                                                          right: 0,
                                                          child: FadeInImage
                                                              .assetNetwork(
                                                            fadeInCurve: Curves
                                                                .fastLinearToSlowEaseIn,
                                                            placeholder:
                                                                placeholderImage,
                                                            image:
                                                                '${characters[index]["image"]}',
                                                            fit: BoxFit.cover,
                                                            // width: 60,
                                                            // height: double.maxFinite,
                                                          )),
                                                      Positioned(
                                                          bottom: 0,
                                                          left: 5,
                                                          width: 120,
                                                          child: characters[index]
                                                                          ["name"]?[
                                                                      "userPreferred"] !=
                                                                  null
                                                              ? Text(
                                                                  "${characters[index]["name"]["userPreferred"]}",
                                                                  maxLines: 2,
                                                                  style: Theme.of(context)
                                                                      .textTheme
                                                                      .titleMedium)
                                                              : characters[index]["name"]?["full"] !=
                                                                      null
                                                                  ? Text(
                                                                      "${characters[index]["name"]["full"]}",
                                                                      maxLines:
                                                                          2,
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .titleMedium)
                                                                  : Text(
                                                                      "Unknown",
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .titleMedium)),
                                                    ],
                                                  )
                                                : Stack(
                                                    children: [
                                                      Positioned(
                                                          left: 0,
                                                          right: 0,
                                                          child: Image.asset(
                                                            backupImage,
                                                            // width: 60,
                                                            // height: double.maxFinite,
                                                            fit: BoxFit.cover,
                                                          )),
                                                      Positioned(
                                                          bottom: 0,
                                                          left: 5,
                                                          width: 120,
                                                          child: characters[index]
                                                                          ["name"]?[
                                                                      "userPreferred"] !=
                                                                  null
                                                              ? Text(
                                                                  "${characters[index]["name"]["userPreferred"]}",
                                                                  maxLines: 2,
                                                                  style: Theme.of(context)
                                                                      .textTheme
                                                                      .titleMedium)
                                                              : characters[index]["name"]?["full"] !=
                                                                      null
                                                                  ? Text(
                                                                      "${characters[index]["name"]["full"]}",
                                                                      maxLines:
                                                                          2,
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .titleMedium)
                                                                  : Text(
                                                                      "Unknown",
                                                                      style: Theme.of(context)
                                                                          .textTheme
                                                                          .titleMedium)),
                                                    ],
                                                  )),
                                      );
                                    })),
                          )),
          ],
        ),
      );
    });
  }
}

// https://www047.vipanicdn.net/streamhls/08d70b9ac9efcd106996e472d2f690a0/ep.11.1686841450.1080.m3u8

class EpisodesWidget extends StatelessWidget {
  final showTitle;
  final mainImage;
  final episodes;
  const EpisodesWidget(
      {super.key,
      required this.showTitle,
      required this.mainImage,
      required this.episodes});

  Future<void> _launchUrl(String id) async {
    try {
      var dataEp = await getInfo(id);
      if (dataEp["error"] == null ||
          dataEp["sources"] == null ||
          dataEp["sources"].length <= 0) {
        print("$dataEp");
        print("Something went wrong with the fetching episode");
      } else {
        var epUrl = dataEp["sources"][dataEp["sources"].length - 1]["url"] !=
                null
            ? dataEp["sources"][dataEp["sources"].length - 1]["url"]
            : dataEp["sources"][dataEp["sources"].length - 2]?["url"] != null
                ? dataEp["sources"][dataEp["sources"].length - 2]["url"]
                : dataEp["sources"][0]?["url"] != null
                    ? dataEp["sources"][0]["url"]
                    : null;
        if (epUrl != null) {
          Uri url = Uri.parse(epUrl);
          if (await launchUrl(url)) {
            await launchUrl(mode: LaunchMode.externalApplication, url);
          } else {
            throw Exception('Could not launch $epUrl');
          }
        } else {
          print("Something went wrong with the sources information");
        }
      }
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return ScrollConfiguration(
        behavior: const ScrollBehavior()
            .copyWith(physics: const ClampingScrollPhysics()),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
                // padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                // height: double.infinity,
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: episodes == null
                    ? const ErrorMessage(
                        message: "No Episodes!",
                      )
                    : episodes.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.lightBlue,
                            ),
                          )
                        : Expanded(
                            child: Container(
                                // height: 200,
                                width: double.infinity,
                                padding: const EdgeInsets.all(10),
                                child: ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(
                                          height: 20,
                                        ),
                                    // scrollDirection:
                                    //     Axis.horizontal,
                                    itemCount: episodes.length > 0
                                        ? episodes.length
                                        : 0,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          _launchUrl(
                                              episodes[index]["id"].toString());
                                        },
                                        child: Container(
                                            height: 200,
                                            width: double.maxFinite,
                                            padding: const EdgeInsets.all(8.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Stack(
                                                children: [
                                                  Positioned(
                                                      left: 0,
                                                      right: 0,
                                                      top: 0,
                                                      bottom: 0,
                                                      child: episodes[index]
                                                                  ["image"] !=
                                                              null
                                                          ? FadeInImage
                                                              .assetNetwork(
                                                              fadeInCurve: Curves
                                                                  .fastLinearToSlowEaseIn,
                                                              placeholder:
                                                                  placeholderImage,
                                                              image:
                                                                  '${episodes[index]["image"]}',
                                                              fit: BoxFit.cover,
                                                              // height: double.maxFinite,
                                                            )
                                                          : mainImage != null
                                                              ? FadeInImage
                                                                  .assetNetwork(
                                                                  fadeInCurve:
                                                                      Curves
                                                                          .fastLinearToSlowEaseIn,
                                                                  placeholder:
                                                                      placeholderImage,
                                                                  image:
                                                                      '${mainImage}',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  // height: double.maxFinite,
                                                                )
                                                              : Image.asset(
                                                                  backupImage,
                                                                  // height: double.maxFinite,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                )),
                                                  Positioned(
                                                      top: 0,
                                                      left: 0,
                                                      height: 35,
                                                      width: 35,
                                                      child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5),
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: Colors
                                                                      .black26),
                                                          child: (episodes[index]
                                                                          [
                                                                          "number"] !=
                                                                      null ||
                                                                  episodes[index]
                                                                          [
                                                                          "number"] >
                                                                      0)
                                                              ? Text(
                                                                  "${episodes[index]["number"]}",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleLarge,
                                                                )
                                                              : Text(
                                                                  "${index + 1}",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleLarge,
                                                                ))),
                                                  Positioned(
                                                      bottom: 0,
                                                      left: 0,
                                                      right: 0,
                                                      height: 40,
                                                      child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5),
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  color: Colors
                                                                      .black26),
                                                          child: episodes[index]
                                                                      [
                                                                      "title"] !=
                                                                  null
                                                              ? Text(
                                                                  "${episodes[index]["title"]}",
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .titleMedium,
                                                                )
                                                              : showTitle !=
                                                                      null
                                                                  ? Text(
                                                                      "${showTitle}",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .titleMedium,
                                                                    )
                                                                  : Text(
                                                                      "Episode ${index + 1}",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .titleMedium,
                                                                    )))
                                                ],
                                              ),
                                            )),
                                      );
                                    })),
                          )),
          ],
        ),
      );
    });
  }
}
