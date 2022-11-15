Nama    : Trisno Bayu Pamungkas

NPM     : 2106702200

Kelas   : PBP-F

Asdos   : BYN


# Tugas 7 (Flutter)


1) Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.


Stateless Widget merupakan widget di dalam Flutter yang tidak menyimpan sebuah state di dalamnya, yang berarti widget tersebut tidak akan bisa mengalami perubahan (statis).


Sedangkan, Stateful widget merupakan widget yang dapat mengalami perubahan karena di dalamnya menyimpan suatu state yang sifatnya dinamis (bisa diubah-ubah sesuai kondisi tertentu).


2) Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.

1. Scaffold - Widget yang digunakan untuk mengimplementasikan halaman utama pada flutter

2. AppBar - Widget untuk menampilkan sebuah bar pada bagian atas aplikasi, bisa digunakan untuk menjadi control menu dari aplikasi

3. Text - Widget untuk menampilkan teks di dalam aplikasi

4. Center - Widget untuk memposisikan child yang ada di dalamnya berada di bagian tengah halaman aplikasi

5. Column - Widget untuk memposisikan widget-widget atau children yang dimilikinya secara vertikal

6. Row - Widget untuk memposisikan widget-widget atau children yang dimilikinya secara horizontal

7. Padding - Widget yang digunakan untuk mengatur padding dari widget yang ada di dalamnya

8. Visibility - Widget yang bisa digunakan untuk mengatur visibility dari widget yang ada di dalamnya

9. Icon - Widget untuk menampilkan icon di dalam aplikasi

10. FloatingActionButton - Widget berupa sebuah bottom yang bisa digunakan untuk melakukan suatu action atau merubah State dari suatu widget


3) Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.


Fungsi setState() bertugas untuk melakukan perubahan pada state yang disimpan pada tiap widget. Nantinya, saat fungsi tersebut dipanggil, fungsi tersebut memberi tahu bahwa ada perubahan pada State di Widget, sehingga nantinya Widget tersebut akan di-build ulang untuk meng-update State.


Variabel yang terdampak oleh setState() adalah _counter, _evenOrOdd, _textColor, dan _isVisible.


4) Jelaskan perbedaan antara const dengan final.

Const dan Final merupakan variabel yang berguna untuk menyimpan nilai yang tetap atau tidak akan berubah-ubah lagi (immutable), namun terdapat perbedaan di antara keduanya, yaitu:


Const - Variabel tersebut nilainya sudah harus diinisiasi saat sebelum di-compile
Final - Variabel tersebut nilainya bisa sudah ataupun belum diketahui saat waktu kompilasi berjalan


5) Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.


- Menambahkan 4 variabel State di dalam _MyHomePage State, yaitu _counter, _evenOrOdd, _textColor, dan _isVisible.


- Menambahkan 2 fungsi baru untuk mengatur state, yaitu _incrementCounter dan _decrementCounter. Pada _incrementCounter, dilakukan pengecekan ganjil dan genap pada counter, kemudian dilakukan perubahan pada State, sedangkan pada _decrementCounter, dilakukan pengecekan tambahan yaitu apakah nilai counter sudah 0 atau belum, jika sudah maka dilakukan perubahan pada State yang mengatur visibility widget.


- Menambahkan widget Row untuk menampung tombol decrement dan increment dan juga Padding untuk mengatur padding dari tombol decrement.


# Tugas 8

1. Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.


    - Navigator.push = Navigator yang memungkinkan kita untuk pergi ke route atau page baru. Biasanya Navigator.push saling berhubungan dengan Navigator.pop, di mana Navigator.pop berfungsi agar kita bisa kembali ke route atau page sebelumnya.

    - Navigator.pushReplacement = Navigator.pushReplacement memungkinkan kita untuk pergi ke route atau page baru dan sekaligus me-replace route yang lama dengan route baru. Dengan demikian, kita tidak akan bisa pergi ke route atau page sebelumnya (Contoh: Auth)


2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.


    - SnackBar = Widget untuk menampilkan pop-up message pada aplikasi dalam jangka waktu tertentu

    - TextButton = Widget untuk menampilkan button tanpa border (by default)

    - DropDownButtonFormField = Widget untuk menampilkan sebuah dropwdown list yang berisi beberapa item

    - Container = Widget yang biasanya digunakan untuk membungkus widget lainnya. Biasanya, container digunakan untuk positioning dan sizing dari child widget

    - ListTile = Widget yang digunakan untuk menampilkan informasi yang membentuk sebuah list dan juga terdapat sekumpulan widget di dalamnya

    - SafeArea = Widget yang digunakan untuk membuat tampilan aplikasi kita menjadi aman (tidak terpotong) dan tidak terganggung oleh bentuk layar perangkat 

    - TextFormField = Widget yang merupakan bagian dari form, di mana widget ini akan mengambil input yang ditulis oleh user

    - Form = Widget untuk membuat form di dalam aplikasi

    - Drawer = Widget untuk menampilkan menu yang tersembunyi pada sisi kanan atau kiri sebuah aplikasi

    - ListView = Widget yang dapat di-scroll dan menampilkan beberapa widget di dalamnya


3. Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).


    - onLongPressed = Saat widget ditekan agak lama (dalam jangka waktu tertentu)

    - onTap = Saat widget tersebut ditekan

    - onSaved = Saat dilakukan penyimpanan pada form

    - onChanged = Saat terjadi perubahan data pada widget (Example: TextFormField, yang berubah-ubah sesuai input dari user)


4. Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.


    Cara kerja Navigator hampir sama konsepnya dengan Stack. Di mana, saat kita ingin membuka suatu page atau route, dilakukan push ke dalam Stack, sehingga item paling atas dari Stack adalah route yang kita tuju. Jika kita ingin kembali ke route sebelumnya, dilakukan Navigator.pop untuk menghapus route paling atas dari Stack, sehingga nanti item paling atas adalah route atau page sebelumnya.


5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.


    - Membuat 3 folder utama, yaitu widgets, pages, dan models. Folder widgets berisi file-file custom widget, folder pages berisi setiap page yang ada di dalam aplikasi, dan folder models berisi file untuk mendefinisikan class dari object yang akan digunakan.

    - Refactor widget Drawer ke sebuah file terpisah, yaitu drawer.dart pada folder widgets.

    - Membuat form budgeting pada file budget_form dengan memanfaatkan widget Form dan child widget lainnya untuk meminta input, seperti TextFormField, DropDownButtonFormField, dan DatePicker. Kemudian setiap input yang diberikan oleh user, akan disimpan ke dalam list yang ada di file budget_data dalam bentuk object, yaitu Data Object (class Data didefinisikan di file data.dart pada folder models)

    - Menampilkan data budgeting yang di-input user pada page budget_data menggunakan widget Card. Untuk menampilkan keseluruhan data yang ada di dalam list, digunakan widget ListView.






