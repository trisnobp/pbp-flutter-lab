# Tugas 7 (Flutter)
Nama    : Trisno Bayu Pamungkas

NPM     : 2106702200

Kelas   : PBP-F

Asdos   : BYN

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




