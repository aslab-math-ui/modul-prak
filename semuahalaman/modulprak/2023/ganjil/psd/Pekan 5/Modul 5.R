#1) Uji Chi-Square

#Uji independensi antar variabel kategorik
#Inputnya merupakan tabel kontingensi (kategorik vs kategorik)
#H0: tidak ada asosiasi antar variabel kategorik (independen)
#H1: ada asosiasi (tidak independen)

#Kasus tabel kontingensi 2x2
library(readr)
df <- read_csv("https://raw.githubusercontent.com/selva86/datasets/master/treatment.csv")
#Kalau read_csv gak bisa coba pakai read.csv
View(df)

tabel <- table(df$treatment, df$improvement)

#Ingat asumsi Uji chi-square
#Tabel 2x2: semua expected count harus > 5 dan tidak boleh ada observed count yang 0
# > tabel 2x2: expected count yang < 5 maksimal 20% 
uji <- chisq.test(tabel)
uji$observed
uji$expected

#Asumsi terpenuhi, semua expected >5 dan observed count != 0
#Maka Uji Chi Square dapat dilakukan
uji

#Perhatikan disini, Uji Chi Square nya ada koreksi Yates
#Koreksi yates hanya digunakan jika asumsi semua expected > 5 gagal
#Koreksi yates khusus tabel 2x2 saja
uji <- chisq.test(tabel, correct = FALSE)
uji

#H0 ditolak pada alpha 0.05 maka antar variabel tidak independen (ada asosiasinya)
#Tapi tidak bisa disimpulkan asosiasinya apa
#Jadi, kita hanya bisa mengindikasi adanya asosiasi antar kedua variabel tersebut
#Tanpa mengetahui apa/bagaimana asosiasinya (perlu dilakukan uji lanjutan untuk menjelaskan lebih lanjut)

#Sekarang gimana kasus tabel bukan 2x2
#Misalnya, pakai data mtcars (dataset bawaan dari R)
data("mtcars")
View(mtcars)

#Misalkan dianggap variabel carb dan cyl adalah kategorik
tabel2 <- table(mtcars$carb, mtcars$cyl)

chisq.test(tabel2)$expected

#Asumsi gagal karena semua expected count < 5 -> perhatikan ada warning message juga karena asumsi gagal
#Padahal expected count < 5 hanya boleh  4 sel (0.2 * 18 = 3.6, dibulatkan ke atas (selalu) menjadi 4)
#Jika asumsi gagal gunakan Fisher Exact Test untuk uji independensinya
#H0 dan H1 sama seperti Chi-Square
fisher.test(tabel2)

#Kesimpulan: H0 ditolak sehingga variabel carb dan cyl tidak independen (ada asosiasi)

#2) Korelasi

#Korelasi hanya bisa dilakukan pada variabel numerik
cor(mtcars)
round(cor(mtcars), 2) #Membulatkan ke 2 digit belakang tanda koma

#Defaultnya adalah korelasi pearson (yang kalian pelajari di PSD), bisa diganti spearman atau kendall
round(cor(mtcars, method = "spearman"),2)
round(cor(mtcars, method = "kendall"),2)

#Correlation plot
matriks_korelasi <- cor(mtcars, method = "pearson")
library(corrplot)
corrplot(matriks_korelasi)

corrplot(matriks_korelasi,
         type = "upper",
         tl.col = "black")

corrplot(matriks_korelasi,
         type = "upper",
         tl.col = "black",
         method = "color")

#Uji korelasi antar 2 variabel
#Misalkan, akan dilakukan uji antara variabel disp dan wt (masih data mtcars)
#H0: korelasi = 0
#H1: korelasi != 0
cor.test(mtcars$disp,
         mtcars$wt,
         method = "pearson")

#Visualisasi pake package sekali-kali
library(ggpubr)
ggscatter(mtcars, 
          x = "disp",
          y = "wt",
          add = "reg.line",
          cor.coef = TRUE,
          cor.method = "pearson")

#3) Regresi Linear Sederhana

#Yang selalu diingat dalam regresi, ada variabel dependen dan independen
#Misalkan dianggap variabel dependennya wt dan independennya disp
#Hubungan apa yang terjadi jika variabel dependen dan independennya seperti itu? -> cari persamaan regresinya
#Persamaan refresi linier sederhana: Y = beta_0 + beta_1*X + random error, di mana error ~ N(0, sigma^2)
#Karena Y = wt dan X = disp, maka persamaan taksiran regresinya menjadi
# wt = \beta_0 + \beta_1*disp

#Ada 2 cara untuk membuat persamaan model liniernya
model1 <- lm(wt ~ disp, data = mtcars) #Cara 1
model1 <- lm(mtcars$wt ~ mtcars$disp) #Cara 2
#Keduanya sama aja, jadi bebas terserah kalian mau pakai yang mana

summary(model1)

#wt = 1.6 + 0.007disp
#Interpretasi: Jika disp naik 1 satuan, maka RATA-RATA wt naik 0.007 kali

#Bisa juga dilakukan Uji GoF (Goodness of Fit) pakai anova
#Uji GoF tidak diajarkan di sini, hanya sekedar info tambahan aja :D
anova(model1)

#Visualisasi dikit
plot(mtcars$disp,
     mtcars$wt,
     pch = 16)
abline(model1,
       col = "red",
       lwd = 2)
legend("bottomright",
       legend = "garis regresi",
       col = "red",
       lwd = 2,
       bty = "n")