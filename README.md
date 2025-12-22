<div align="center">

  # TOURISM


![Flutter](https://img.shields.io/badge/Flutter-E1F5FE?style=flat-square&logo=flutter&logoColor=02569B)
![Dart](https://img.shields.io/badge/Dart-E3F2FD?style=flat-square&logo=dart&logoColor=0175C2)
![GetX](https://img.shields.io/badge/GetX-FCE4EC?style=flat-square&logo=flutter&logoColor=E91E63)
![Node.js](https://img.shields.io/badge/Node.js-E8F5E9?style=flat-square&logo=nodedotjs&logoColor=339933)
![Express.js](https://img.shields.io/badge/Express.js-EEEEEE?style=flat-square&logo=express&logoColor=000000)
![JWT](https://img.shields.io/badge/JWT-F3E5F5?style=flat-square&logo=jsonwebtokens&logoColor=000000)
![MySQL](https://img.shields.io/badge/MySQL-F3E5F5?style=flat-square&logo=mysql&logoColor=4479A1)
![SharedPreferences](https://img.shields.io/badge/Shared_Preferences-E0F7FA?style=flat-square&logo=flutter&logoColor=007ACC)
![OpenStreetMap](https://img.shields.io/badge/OpenStreetMap-E0F2F1?style=flat-square&logo=openstreetmap&logoColor=7EBC6F)
![intl](https://img.shields.io/badge/intl-FCE4EC?style=flat-square&logo=dart&logoColor=E91E63)

Tourism adalah aplikasi mobile berbasis Flutter yang dirancang untuk membantu pengguna merencanakan perjalanan secara sederhana dan terorganisir. Aplikasi ini mengintegrasikan fitur perencanaan itinerary, pencarian destinasi berbasis lokasi, serta utilitas konversi waktu dan mata uang untuk mendukung pengalaman perjalanan yang lebih efisien.

</div>
<br>

## 🧭 main features

- 🔐 **authentication**
  - login & register (JWT)
  - session disimpan secara lokal

- 🗺️ **explore destination**
  - pencarian destinasi
  - rekomendasi berdasarkan lokasi pengguna (LBS)

- 🧳 **travel planner**
  - membuat & mengelola itinerary
  - penyesuaian waktu otomatis (WIB, WITA, WIT)

- ⏰ **time conversion**
  - konversi zona waktu indonesia

- 💱 **currency conversion**
  - IDR, USD, EUR / JPY

- 🔔 **notification**
  - reminder jadwal itinerary

- 📍 **location based service**
  - menampilkan destinasi terdekat dari lokasi pengguna

- 👤 **profile**
  - informasi akun & riwayat perjalanan

---

## 🏗️ simple architecture

```

Flutter App
│
│ REST API
▼
Node.js (Express)
│
▼
MySQL Database

```


