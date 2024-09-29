### PART 1 ###
#Operasi Dasar. Layaknya matematika pada umumnya, R dapat malakukan operasi dasar. 
#Cara me-run sebuah program adalah dengan ctrl + Enter
#Untuk me-run beberapa program sekaligus, Anda select programnya, lalu ctrl + Enter 

2+3
7-5
3*5
3/4
2:4
2**3


#Pendefinisian variable pada R dapat menggunakan <- atau =
#Cara pendefinisian variable adalah sebagai berikut

apel<- 4
jeruk <- 7

#Kiri merupakan nama variable dan kanan merupakan nilai variable
#Untuk memanggil variable, cukup Anda ketik namanya

apel

#lalu run

#Layaknya sebuah angka, variable tersebut dapat melakukan opreasi dasar

apel+jeruk
apel-jeruk
apel*jeruk
apel/jeruk

#Variable juga dapat didefinisikan oleh variable variable lainnya

banyakbuah <- jeruk+apel 
banyakbuah

#Variable yang telah terdefinisi dapat dilihat pada enviorment (sebelah kanan script)
#atau menggunakan
ls() #lihat list variabel

#untuk menghapus variable, gunakan fungsi rm

rm(banyakbuah) #hapus variabel banyakbuah

#untuk menghapus semua variabel gunakan
rm(list=ls())

####LONCAT DULU KE DATA VIZ###
#import data iris (dataset built-in nya R)
data("iris")
iris #liat datanya di console
View(iris) #liat datanya di window baru
str(iris) #informasi dan tipe data

#atau kalo mau import data dari file
df <- read.csv("D:/Iris.csv") #janlup dikasih tau parameternya path ya jadi bebas

#atau pake package readr dan readxl pada R
library(readr)
df <- read_csv("D:/Iris.csv")

library(readxl)
df_excel <- read_excel("D:/Iris.xlsx")
#cara manual agak ribet sehingga direkomendasikan pake fitur import dataset di Rstudio saja

#deskriptif yg simple dulu
View(df)
dim(df) #cek dimensi
ls(df) #cek nama kolom

#deskriptif setiap kolom
mean(df$Sepal.Length)
median(df$Sepal.Length)
sum(df$Sepal.Length)
sd(df$Sepal.Length)
var(df$Sepal.Length)
length(df$Sepal.Length)
standarerror <- sd(df$Sepal.Length)/sqrt(length(df$Sepal.Length))
sort(df$Sepal.Length)

min(df$Sepal.Length)
max(df$Sepal.Length)
range(df$Sepal.Length)

library(DescTools)
Mode(df$Sepal.Length) #package DescTools
plot(density(df$Sepal.Length))

summary(df$Sepal.Length)

#alternatif
library(psych)
describe(df$Sepal.Length)

#kalo dari 1 kolom doang, skrg langsung keseluruhan variabel dalam data
summary(df) #khusus numerik
describe(df)

#plot paling dasar: semua variabel numerik menjadi scatter
plot(df)

plot(df$Sepal.Length, df$Sepal.Width)

#tambahkan judul pake main
plot(df$Sepal.Length, df$Sepal.Width, 
     main = "Ini Judul grafiknya")

#tambahkan label sumbu
plot(df$Sepal.Length, df$Sepal.Width, 
     main = "Ini Judul grafiknya",
     xlab = "Sumbu X",
     ylab = "Sumbu Y")

#histogram
hist(df$Sepal.Length) #standar

hist(df$Sepal.Length, main = "Judul", xlab = "Nilai Sepal Length")

hist(df$Sepal.Length, main = "Judul", xlab = "Nilai Sepal Length", freq = FALSE)

hist(df$Sepal.Length,
     main = "Judul",
     xlab = "Nilai Sepal Length",
     freq = FALSE,
     breaks = 20)

hist(df$Sepal.Length,
     main = "Judul",
     xlab = "Nilai Sepal Length",
     freq = FALSE,
     breaks = 20,
     xlim = c(min(df$Sepal.Length),max(df$Sepal.Length)),
     col = "yellow")

hist(df$Sepal.Length, prob = TRUE)
grid(lty = 2, col = "gray", lwd = 1)
grid(nx = NA, ny = NULL, lty = 2, col = "gray", lwd = 1)

lines(density(df$Sepal.Length), lwd = 2, col = 'red')

#boxplot
boxplot(df$Sepal.Length) #1 variabel

boxplot(df$Sepal.Length, df$Sepal.Width) #2 variabel atau lebih

boxplot(df$Sepal.Length, df$Sepal.Width,
        main = "Boxplot Perbandingan Sepal Length dan Sepal Width",
        names = c("Sepal Length", "Sepal Width")) #tambahkan judul dan xlabel

boxplot(df$Sepal.Length, df$Sepal.Width,
        main = "Boxplot Perbandingan Sepal Length dan Sepal Width",
        names = c("Sepal Length", "Sepal Width"),
        col = c("red", "blue")) #ganti warna

boxplot(df$Sepal.Length, df$Sepal.Width,
        main = "Boxplot Perbandingan Sepal Length dan Sepal Width",
        names = c("Sepal Length", "Sepal Width"),
        col = c("red", "blue"),
        horizontal = TRUE) #rotate jadi horizontal

boxplot(df$Sepal.Length ~ df$Species)

boxplot(Sepal.Length ~ Species, data = df)

boxplot(df$Sepal.Length ~ df$Species, 
        main = "Perbandingan Sepal Length berdasarkan Species",
        xlab = "Species",
        ylab = "Sepal Length",
        col = c("blue","yellow","red"),
        notch = TRUE)

#barchart
dummy <- data.frame(name=letters[1:5],
                    value=sample(seq(4,15),5))

barplot(height = dummy$value,
        names.arg = dummy$name,
        horiz = F,
        col = "violet",
        width = 1, space = 2, density = 10,
        font.axis = 2,
        col.axis = "red",
        cex.axis = 1)

counts <- table(df$Species)
barplot(counts,
        main = "Persebaran Spesies",
        xlab = "Spesies", ylab = "Counts")

#piechart
pie(counts, 
    labels = counts, 
    col = rainbow(6),
    main = "Persebaran Spesies")

pielabels <- round(counts/sum(counts)*100, 2)
pie(counts, 
    labels = paste0(pielabels, "%"), 
    col = rainbow(6),
    main = "Persebaran Spesies")
legend("topleft", legend = c("setosa","versicolor", "virginica"),
       fill = rainbow(6), cex = 0.8)

#line chart
plot(df$Sepal.Length, type = 'l')

plot(df$Sepal.Length, type = 'l', main = "Pergerakan Sepal Length per Waktu",
     xlab = "Unit Waktu",
     ylab = "Sepal Length",
     col = "darkgreen",
     lty = 1,
     lwd = 2)
lines(df$Sepal.Width, type = "l")

plot(df$Sepal.Length, type = 'l', main = "Perbandingan Pertumbuhan Panjang dan Lebar Kelopak",
     xlab = "Unit Waktu",
     ylab = "Pengukuran",
     col = "darkgreen",
     lty = 1,
     lwd = 2,
     ylim = c(min(df$Sepal.Length, df$Sepal.Width),
              max(df$Sepal.Length, df$Sepal.Width)))

lines(df$Sepal.Width,
      type = "l",
      col = "blue", lwd = 2)

legend("topleft",
       legend = c("Panjang", "Lebar"),
       col = c("darkgreen", "blue"),
       lty = 1, lwd = 2, 
       bty = "n")

legend(-10,8,
       legend = c("Panjang", "Lebar"),
       col = c("darkgreen", "blue"),
       lty = 1, lwd = 2, 
       bty = "n")