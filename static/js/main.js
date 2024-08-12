function formatDate(dateString) {
    // Parsing string tanggal ke objek Date
    var date = new Date(dateString);
    // Array untuk nama-nama bulan dalam Bahasa Indonesia
    var monthNames = ["Januari", "Februari", "Maret", "April", "Mei", "Juni",
        "Juli", "Agustus", "September", "Oktober", "November", "Desember"
    ];
    // Mendapatkan tanggal, bulan, dan tahun dari objek Date
    var day = date.getDate();
    var monthIndex = date.getMonth();
    var year = date.getFullYear();
    var hours = date.getHours();
    var minutes = date.getMinutes();
    // Menggabungkan semua informasi tanggal menjadi format yang diinginkan
    var formattedDate = day + ' ' + monthNames[monthIndex] + ' ' + year + ' ' + 
                        (hours < 10 ? '0' + hours : hours) + ':' + 
                        (minutes < 10 ? '0' + minutes : minutes);
    return formattedDate;
}

function formatRupiah(angka) {
    if (angka === null || angka === undefined) {
        return '';
    }

    var number_string = angka.toString().replace(/[^,\d]/g, ''),
        split = number_string.split(','),
        sisa = split[0].length % 3,
        rupiah = split[0].substr(0, sisa),
        ribuan = split[0].substr(sisa).match(/\d{3}/gi);

    if (ribuan) {
        separator = sisa ? '.' : '';
        rupiah += separator + ribuan.join('.');
    }
    rupiah = split[1] != undefined ? rupiah + ',' + split[1] : rupiah;
    return 'Rp ' + rupiah;
}