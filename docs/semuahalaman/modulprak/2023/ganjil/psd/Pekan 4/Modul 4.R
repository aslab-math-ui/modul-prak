#Hypothesis Testing
#1. Definisi Hipotesis
#2. Definisi tingkat signifikansi alpha
#3. Penentuan statistik uji
#4. Daerah kritis
#5. Pengambilan keputusan dan interpretasi

#a) uji mean 1 sampel
#ingat asumsi
# - data berdistribusi normal
# - antar observasi saling bebas

#kasus uji 2 arah
#H0 : \mu = \mu_0
#H1 : \mu != \mu_0
#\mu_0 itu ditentukan peneliti, tergantung pengujian yg ingin dilakukan

x <- rnorm(20)
t.test(x,
       mu = 0.5,
       alternative = "two.sided") #Untuk kasus ini \mu_0 = 0.5

#pengambilan keputusan: statistik uji, CI, p-value
#statistik uji
#t tabel dengan df = n-1 = 20-1 = 19
qt(0.025, 19)
qt(0.975, 19)
#bandingkan t tabel dan statistik uji t

#p-value manual
2*(pt(-2.5414, 19)) #Angka -2,5414 ini tergantung dari nilai t yang didapatkan pada t.test sebelumnya
2*(1-pt(2.5414, 19)) #Artinya bisa jadi nilai t yang didapatkan itu bukan -2,5414 tinggal menyesuaikan saja

#CI : kalo \mu_0 ada di dalam CI ya H0 diterima (perhitungan CI ga diajarin disini ya)

#viz daerah penolakan
x_grafik <- seq(-4, 4, length = 100)
x_daerah_penolakan <- seq(-4, -2.5414, length = 100)
y_daerah_penolakan <- dt(x_daerah_penolakan, df = 19)
x_daerah_penolakan2 <- seq(2.5414, 4, length = 100)
y_daerah_penolakan2 <- dt(x_daerah_penolakan2, df = 19)

plot(x_grafik,
     dt(x_grafik, df = 19),
     type = 'l',
     main = "Luas Daerah Penolakan",
     xlab = "x",
     ylab = "Pr(X=x)",
     lwd = 2)
polygon(c(-4,x_daerah_penolakan, -2.5414),
        c(0, y_daerah_penolakan, 0),
        col = "red")
polygon(c(2.5414,x_daerah_penolakan2, 4),
        c(0, y_daerah_penolakan2, 0),
        col = "red")

#kasus uji 1 arah (lower tailed test)
#H0 : mu >= 0.3
#H1 : mu < 0.3

#Ingin diuji apakah mean populasi >= 0.3 atau tidak
#Ingat saja untuk lower tailed test perhatikan tanda pada H1 nya harus "<"
#Jadi kalo ketemu H1 tandanya "<" maka udah pasti lower tailed test.

t.test(x,
       mu = 0.3,
       alternative = "less")

#Sebelumnya perhatikan bahwa apabila nilai t yang didapatkan bernilai positif
#Maka uji lower tailed test tidak dapat dilakukan
#Harus diganti dengan uji upper tailed test
#Sebaliknya, jika nilai t yang didapatkan negatif, maka uji lower tailed test dapat digunakan
#Ingat saja, untuk lower tailed test, nilai t yang didapatkan harus negatif

#t tabel dengan df = n-1 = 20-1 = 19
qt(0.05, 19)
qt(0.95, 19)
#bandingkan t tabel dan statistik uji t

#p-value manual
pt(-1.5175, 19) #Angka -1,5175 ini tergantung dari nilai t yang didapatkan pada t.test sebelumnya
1-pt(1.5175, 19) #Artinya bisa jadi nilai t yang didapatkan itu bukan -1,5175 tinggal menyesuaikan saja

#viz daerah penolakan
x_grafik <- seq(-4, 4, length = 100)
x_daerah_penolakan <- seq(-4, -1.5175, length = 100)
y_daerah_penolakan <- dt(x_daerah_penolakan, df = 19)

plot(x_grafik,
     dt(x_grafik, df = 19),
     type = 'l',
     main = "Luas Daerah Penolakan",
     xlab = "x",
     ylab = "Pr(X=x)",
     lwd = 2)
polygon(c(-4,x_daerah_penolakan, -1.5175),
        c(0, y_daerah_penolakan, 0),
        col = "red")

#kasus uji 1 arah (upper tailed test)
#H0 : mu <= 0.3
#H1 : mu > 0.3

#Ingin diuji apakah mean populasi <= 0.3 atau tidak
#Ingat saja untuk upper tailed test perhatikan tanda pada H1 nya harus ">"
#Jadi kalo ketemu H1 tandanya ">" maka udah pasti upper tailed test.

t.test(x,
       mu = 0.3,
       alternative = "greater")

#Sebelumnya perhatikan bahwa apabila nilai t yang didapatkan bernilai negatif
#Maka uji upper tailed test tidak dapat dilakukan
#Harus diganti dengan uji lower tailed test
#Sebaliknya, jika nilai t yang didapatkan positif, maka uji upper tailed test dapat digunakan
#Ingat saja, untuk upper tailed test, nilai t yang didapatkan harus positif

x_grafik <- seq(-4, 4, length = 100)
x_daerah_penolakan <- seq(1.5175, 4, length = 100)
y_daerah_penolakan <- dt(x_daerah_penolakan, df = 19)

plot(x_grafik,
     dt(x_grafik, df = 19),
     type = 'l',
     main = "Luas Daerah Penolakan",
     xlab = "x",
     ylab = "Pr(X=x)",
     lwd = 2)
polygon(c(1.5175,x_daerah_penolakan, 4),
        c(0, y_daerah_penolakan, 0),
        col = "red")

#uji beda mean 2 populasi 
x <- rnorm(20, mean = 5)
y <- rnorm(20, mean = 2)

#H0 : \mu_1 - \mu_2 = \mu_0
t.test(x, y, mu = 0, var.equal = TRUE, alternative = "two.sided") #kasus asumsi variansi sama
t.test(x, y, mu = 0, var.equal = FALSE, alternative = "two.sided") #kasus asumsi variansi tidak sama

#uji berpasangan
#H0 : \mu_1 >= \mu_2
#H1 : \mu_1 < \mu_2
t.test(x, y, mu = 0, var.equal = TRUE, alternative = "less", paired = TRUE) 

#uji t 2 populasi per kategori
nilai_UTS <- c(90, 75, 100, 65, 70, 70, 60, 55)
matkul <- c(rep("PSD", 4), rep("MD", 4))
df <- data.frame(nilai_UTS, matkul)

#H0 : \mu_MD >= \mu_PSD
#H1 : \mu_MD < \mu_PSD

#Catatan: MD itu sama aja kayak Kalkulus (dulu Kalkulus namanya MD)

t.test(nilai_UTS ~ matkul,
       data = df,
       subset = matkul %in% c("PSD", "MD"),
       alternative = "less")

#kasus: setelah UTS MD, anak2 di kelas jadi rajin belajar buat UTS PSD
#setelah nilai UTS PSD keluar, apakah rajin belajar tadi negefek ke UTS PSD?
#karena ini kasus sebelum - sesudah, gunakan uji berpasangan
t.test(nilai_UTS ~ matkul,
       data = df,
       subset = matkul %in% c("PSD", "MD"),
       alternative = "less",
       paired = TRUE)
#ternyata pengaruh karena nilai UTS PSD jadi naik
#pesan moral: ayo rajin belajar :p (zany face)

#uji mean 2 populasi --> uji t
#kalo lebih dari 2 populasi gimana? jadinya anova
#jadi anova adalah uji t untuk > 2 populasi
#H0: \mu_MD = \mu_PSD = \mu_LDH (mean sama, artinya tidak ada efek perbedaan matkul terhadap nilai uts)
df2 <- data.frame(nilai_UTS = c(100, 90, 77, 85), matkul = c(rep("LDH",4)))
df <- rbind(df, df2)

anova(lm(nilai_UTS ~ matkul, data = df))