import 'package:flutter/material.dart';

import '../models/destination.dart';

const destinations = <Destination>[
  Destination(
    id: 'danau-toba',
    name: 'Danau Toba',
    location: 'Kabupaten Samosir',
    category: 'Alam',
    description:
        'Nikmati panorama danau vulkanik terbesar di Indonesia dengan udara '
        'sejuk dan pemandangan perbukitan. Jelajahi Desa Tomok, naik kapal '
        'menyusuri danau, dan kenali budaya Batak yang kaya di Pulau Samosir.',
    ticketPrice: 'Mulai Rp 10.000',
    icon: Icons.water,
    color: Color(0xFF367D91),
  ),
  Destination(
    id: 'bukit-lawang',
    name: 'Bukit Lawang',
    location: 'Kabupaten Langkat',
    category: 'Alam',
    description:
        'Gerbang menuju Taman Nasional Gunung Leuser ini menawarkan hutan '
        'hujan tropis, aliran Sungai Bohorok, dan kesempatan melihat orangutan '
        'Sumatera bersama pemandu lokal yang berpengalaman.',
    ticketPrice: 'Mulai Rp 5.000',
    icon: Icons.forest,
    color: Color(0xFF367A55),
  ),
  Destination(
    id: 'berastagi',
    name: 'Berastagi',
    location: 'Kabupaten Karo',
    category: 'Alam',
    description:
        'Kota dataran tinggi yang sejuk dengan kebun buah, pasar tradisional, '
        'dan pemandangan Gunung Sibayak. Cicipi hasil bumi Karo dan nikmati '
        'suasana pegunungan yang cocok untuk berlibur santai.',
    ticketPrice: 'Gratis',
    icon: Icons.landscape,
    color: Color(0xFF6D8B51),
  ),
  Destination(
    id: 'istana-maimun',
    name: 'Istana Maimun',
    location: 'Kota Medan',
    category: 'Budaya',
    description:
        'Bangunan bersejarah Kesultanan Deli ini memadukan arsitektur Melayu, '
        'Islam, dan Eropa. Kagumi ruang singgasana, detail interior berwarna '
        'keemasan, serta kisah sejarah Kota Medan.',
    ticketPrice: 'Mulai Rp 10.000',
    icon: Icons.account_balance,
    color: Color(0xFFB78138),
  ),
  Destination(
    id: 'sipiso-piso',
    name: 'Air Terjun Sipiso-piso',
    location: 'Kabupaten Karo',
    category: 'Alam',
    description:
        'Air terjun setinggi sekitar 120 meter ini jatuh dari tebing hijau '
        'menuju kawasan Danau Toba. Nikmati pemandangan dari gardu pandang '
        'atau susuri anak tangga untuk melihatnya dari dekat.',
    ticketPrice: 'Mulai Rp 7.500',
    icon: Icons.waterfall_chart,
    color: Color(0xFF477E9B),
  ),
  Destination(
    id: 'kampung-lingga',
    name: 'Desa Lingga',
    location: 'Kabupaten Karo',
    category: 'Budaya',
    description:
        'Kunjungi desa tradisional Karo untuk melihat rumah adat Siwaluh Jabu '
        'yang berusia ratusan tahun. Pelajari kehidupan masyarakat setempat, '
        'ragam ukiran, dan tradisi yang terus dijaga lintas generasi.',
    ticketPrice: 'Mulai Rp 5.000',
    icon: Icons.cottage,
    color: Color(0xFF96654B),
  ),
];
