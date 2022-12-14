[![Staging](https://github.com/TraveLoGue-f12/TraveLoGue-mob/actions/workflows/staging.yml/badge.svg)](https://github.com/TraveLoGue-f12/TraveLoGue-mob/actions/workflows/staging.yml)
[![Pre-Release](https://github.com/TraveLoGue-f12/TraveLoGue-mob/actions/workflows/pre-release.yml/badge.svg)](https://github.com/TraveLoGue-f12/TraveLoGue-mob/actions/workflows/pre-release.yml)
[![Release](https://github.com/TraveLoGue-f12/TraveLoGue-mob/actions/workflows/release.yml/badge.svg)](https://github.com/TraveLoGue-f12/TraveLoGue-mob/actions/workflows/release.yml)
[![Build status](https://build.appcenter.ms/v0.1/apps/43af980c-7df8-4cc0-9e94-380f90eb19e7/branches/main/badge)](https://install.appcenter.ms/orgs/travelogue/apps/travelogue/distribution_groups/public)


# TraveLoGue: Panduan Wisata Indonesia

**Kini, dapat diakses secara langsung melalui ponsel.**

> Proyek ini dibuat untuk memenuhi tugas Proyek Akhir Semester (PAS)
> pada mata kuliah Pemrograman Berbasis Platform (CSGE602022) yang
> diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia
> pada Semester Gasal, Tahun Ajaran 2022/2023.

## 📱 Aplikasi 📱
Saat ini, hanya tersedia versi Android (APK) untuk diunduh. File APK dapat diunduh di bagian [_releases_](https://github.com/TraveLoGue-f12/TraveLoGue-mob/releases) atau melalui [Microsoft Visual Studio App Center](https://install.appcenter.ms/orgs/travelogue/apps/travelogue/distribution_groups/public).

## 👥 Anggota Kelompok F-12 👥
* [Ahmad Fatahillah](https://github.com/ahmdfthlh) (2106653741)
* [Alanna](https://github.com/alannaaa) (2106639913)
* [Nabila Zahra Putri Awangga](https://github.com/nabilaawangga) (2106703840)
* [Muhammad Iqbal Dwitama](https://github.com/iqbaldwitama) (2106750490)
* [Muhammad Raditya Hanif](https://github.com/radityahnf) (2106750585)

## ⛰ Latar Belakang TraveLoGue ⛰
Terhitung sejak 1 Desember 2021 hingga 30 November 2022, Indonesia terpilih menjadi tuan rumah Presidensi G20. Tujuan utama dibentuknya G20 adalah menemukan solusi bersama atas kondisi ekonomi global. Forum G20 merepresentasikan 80% ekonomi dunia, 75% perdagangan internasional, dan 2/3 populasi dunia. Hal ini menunjukkan betapa pentingnya forum ini dalam menentukan arah kebijakan ekonomi dunia. </br>
TraveLoGue hadir memanfaatkan momentum presidensi G20 untuk mempromosikan objek pariwisata dan UMKM Indonesia. TraveLoGue mengajak para masyarakat Indonesia untuk ikut serta membagikan keindahan dan keberagaman Indonesia kepada turis asing. Tujuan utama kami yaitu menyediakan wadah bagi warga lokal untuk berbagi perspektif serta rekomendasi aktivitas yang dapat dilakukan saat berkunjung ke kota-kota di Indonesia – dari objek pariwisata yang memiliki nilai historis unik, hingga aneka ragam UMKM lokal yang kreatif. TraveLoGue diharapkan dapat menarik perhatian turis asing untuk mengunjungi dan mengeksplorasi pesona-pesona yang dimiliki Indonesia. Dengan bertambahnya turis asing yang mengunjungi Indonesia, maraknya pengunjung objek pariwisata, serta meningkatnya eksposur UMKM lokal, diharapkan bahwa ekonomi Indonesia pun dapat ikut terbantu.

## 📝 Pembagian Tugas Modul 📝
* Recommended Local Shops - [Muhammad Raditya Hanif](https://github.com/radityahnf)
* Recommended Attractions - [Ahmad Fatahillah](https://github.com/ahmdfthlh)
* Event Promotions - [Nabila Zahra Putri Awangga](https://github.com/nabilaawangga)
* Travel Forum - [Muhammad Iqbal Dwitama](https://github.com/iqbaldwitama)
* Travel Planner - [Alanna](https://github.com/alannaaa)

## 🔗 Integrasi dengan Situs Web 🔗
Berikut adalah langkah-langkah yang akan dilakukan untuk mengintegrasikan aplikasi dengan server web:

1. Mengimplementasikan sebuah _wrapper class_ dengan menggunakan library _http_ dan _map_ untuk mendukung penggunaan _cookie-based authentication_ pada aplikasi.
2. Mengimplementasikan REST API pada Django (views.<area>py) dengan menggunakan JsonResponse atau Django JSON Serializer.
3. Mengimplementasikan desain _front-end_ untuk aplikasi berdasarkan desain website yang sudah ada sebelumnya.
4. Melakukan integrasi antara _front-end_ dengan _back-end_ dengan menggunakan konsep _asynchronous_ HTTP.

## 📂 Daftar Modul 📂
Berikut ini beberapa fitur yang disediakan pada aplikasi TraveLoGue:
### 🛍 Recommended Local Shops
Menurut Menteri Koperasi dan UKM, sebanyak 19,5 juta pelaku UMKM dari 65 juta, telah bergerak, terhubung, dan on boarding di bidang digital. Pada fitur ini, terdapat informasi dan rekomendasi terkait UMKM yang ada di Indonesia. Modul ini menerapkan `post` yang berfungsi untuk menambahkan rekomendasi UMKM lokal yang ditambahkan oleh user lokal, sedangkan fungsi `get` berfungsi untuk mengambil data objek UMKM lokal yang ada.

#### Peran Persona 
| Warga Lokal  | Turis Asing |
| ------------- | ------------- |
| Dapat memberikan rekomendasi UMKM yang menarik untuk turis asing.  | Dapat melihat rekomendasi UMKM yang diberikan oleh warga lokal.  |

### 🏙 Recommended Attractions
Tentunya, objek wisata menjadi salah satu tujuan paling populer bagi turis saat berkunjung ke negara asing. Pada fitur ini, terdapat informasi dan rekomendasi terkait objek-objek wisata yang ada di Indonesia. Modul ini menerapkan `post` yang berfungsi untuk menambahkan rekomendasi objek wisata terbaru yang ditambahkan oleh user lokal, sedangkan fungsi `get` berfungsi untuk mengambil data objek wisata yang ada. 
#### Peran Persona
| Warga Lokal  | Turis Asing |
| ------------- | ------------- |
| Dapat memberikan rekomendasi objek wisata yang menarik untuk turis asing.  | Dapat melihat rekomendasi objek wisata yang diberikan oleh warga lokal.  |

### 🎟 Event Promotions
Untuk para turis yang mencari kegiatan _hands-on_ dan ingin terjun beraktivitas langsung bersama warga lokal Indonesia, kami menyediakan fitur Event Promotions. Pada fitur ini, turis dapat menemukan informasi mengenai acara-acara yang sedang diselenggarakan oleh warga lokal, dari lokakarya membatik hingga _fun hike_.  Modul ini menerapkan `post` yang berfungsi untuk menambahkan rekomendasi _event_ lokal yang ditambahkan oleh user lokal, sedangkan fungsi `get` berfungsi untuk mengambil data objek _event_ lokal yang ada.

Event handler yang digunakan pada modul:

1. `onTap`:
* Digunakan pada tiap card event di mana ketika card di-tap akan memanggil `Navigator.push` dan melakukan push menuju halaman yang berisi detail event
* Digunakan pada button My Event di mana ketika di-tap akan memanggil `Navigator.push` dan melakukan push menuju halaman My Event
* Digunakan pada tiap card category di mana ketika card di-tap akan memanggil `Navigator.push` dan melakukan push menuju halaman tiap kategori event

2.  `onPressed` digunakan untuk button Add Event di mana saat di-pressed/dipencet akan memanggil `Navigator.push` dan melakukan push menuju halaman Add Event

#### Peran Persona
| Warga Lokal  | Turis Asing |
| ------------- | ------------- |
| Dapat membuat submisi berupa informasi acara yang ingin dipromosikan.| Dapat melihat rekomendasi acara yang diberikan oleh pengguna warga lokal.  |
| Dapat melihat informasi acara yang dibuat oleh masing-masing user.||

### 📆 Travel Planner
Turis dan warga lokal yang memiliki akun dapat menambahkan berbagai rencana perjalanan ke dalam Travel Planner mereka. Para pengguna dapat menambahkan rincian nama, rencana tanggal, serta catatan mengenai rencana tersebut. Modul ini menerapkan `get` untuk mengambil data rencana-rencana perjalanan milik pengguna yang kemudian akan ditampilkan pada laman Planner. Sementara, untuk menambahkan rencana baru serta menyunting rencana yang sudah ada, digunakan metode `post`.<br>
Event handler yang digunakan pada modul:
* `onTap` pada tiap card Plan yang akan memanggil `Navigator.push` di mana akan ter-push halaman Edit Plan untuk menyunting Plan tersebut.
* `onPressed` untuk button Add Plan, Edit Plan (pada Slideable), dan back yang akan mengarahkan ke halaman yang sesuai, kemudian untuk button SAVE dan EDIT yang akan memanggil function yang sesuai untuk menambahkan atau menyunting Plan.

#### Peran Persona
| Warga Lokal | Turis Asing |
| ------------- | ------------- |
| Dapat menambahkan berbagai rencana perjalanan ke dalam Travel Planner pribadi. | Dapat menambahkan berbagai rencana perjalanan ke dalam Travel Planner pribadi.  |
| Dapat menyunting rencana yang telah dibuat. | Dapat menyunting rencana yang telah dibuat. |

### 💬 Travel Forum
Di Travel Forum, turis asing dapat dengan bebas menyampaikan pertanyaan mereka seputar kunjungan ke Indonesia langsung ke penduduk lokal. Komunitas lokal TraveLoGue pun dapat sukarela menjawab pertanyaan-pertanyaan tersebut. Modul ini menerapkan `post` yang berfungsi untuk menambahkan pertanyaan dan jawaban pada forum tanya jawab. Sedangkan, `get` digunakan untuk menampilkan data pertanyaan dan jawaban pada forum tanya jawab.

Event handler yang digunakan pada modul:

* `onTap` dugnakan pada tiap card Question yang akan memanggil `Navigator.push` di mana akan ter-push halaman Answers untuk menampilkan jawaban dari pertanyaan tersebut.
* `onPressed` digunakan pada:
  * Button Add Question dan Add Answer yang akan mengarahkan ke halaman form yang sesuai untuk menambahkan pertanyaan atau jawaban.
  * Button Delete Question dan Delete Answer yang akan memanggil function yang sesuai untuk menghapus pertanyaan atau jawaban.
  * Button Back yang akan mengarahkan ke halaman sebelumnya yang sesuai.
* `onChanged` digunakan pada halaman form Add Question dan Add Answer untuk inisiasi perubahan value sebuah TextField ketika text baru ditambahkan.

#### Peran Persona.
| Warga Lokal  | Turis Asing |
| ------------- | ------------- |
| Dapat menjawab semua pertanyaan yang telah ditanyakan oleh turis asing mengenai Indonesia. | Dapat mengajukan pertanyaan yang ingin ditanyakan mengenai Indonesia ke warga lokal. |
