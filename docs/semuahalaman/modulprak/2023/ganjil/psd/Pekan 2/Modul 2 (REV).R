#Visualisasi Tambahan
## STEM AND LEAF PLOT :Untuk ngeliat persebaran data (min,max,distribusi), mirip kaya histogram
?stem
View(ChickWeight) #data dari r
stem(ChickWeight$weight)
hist(ChickWeight$weight) #buat perbandingan

min(ChickWeight$weight) #cek nilai minimumnya
max(ChickWeight$weight) #cek maxnya

###Kalau ternyata min sama maxnya kurang tepat, ganti scalenya
stem(ChickWeight$weight, scale = 5) 
stem(ChickWeight$weight, width = 100) 
 
##DOT DIAGRAM
?dotchart
View(mtcars)
###Paling Sederhana
dotchart(mtcars$mpg)
###Tambah Judul dan Label
dotchart(mtcars$mpg, labels = row.names(mtcars),
         cex = 0.9, xlab = "mpg",
         main = "Persebaran Jarak Yang Dapat Ditempuh Per Galon")
###Berdasarkan Grup
grps <- as.factor(mtcars$cyl)
my_cols <- c("blue", "darkgreen", "orange")
dotchart(mtcars$mpg, labels = row.names(mtcars),
         groups = grps, gcolor = my_cols,
         color = my_cols[grps],
         cex = 0.9,  pch = 22, xlab = "mpg",
         main = "Persebaran Jarak Yang Dapat Ditempuh Per Galon Berdasarkan Jumlah Silinder")
legend("bottomright", legend = c("4","6", "6"),
       fill = my_cols, cex = 0.8)

#distribusi: plot pdf, cdf, dan data yang dibangkitkan dari distribusi tersebut

#1. Distribusi Diskrit: domainnya (dalam hal ini ruang sampel) hanya bisa diskrit
#1a. Bernoulli
library("Rlab")

#pdf -> Pr(X=x)
dbern(0, prob = 0.3) #0 adalah domain, atau bisa dikatakan akan dihitung f(0)
#parameter prob adalah probabilitas sukses atau f(1)

dbern(1, prob = 0.6)

#plot pdf
x <- seq(0, 1, by = 1)
plot(dbern(x, prob = 0.6)) #visualisasi masih jelek, 
#improve plotnya coba (terutama perhatiin sumbu x nya) -> bukan domain tapi index doang

plot(x,
     dbern(x, prob = 0.6),
     main = "PDF Distribusi Bernoulli dengan p = 0.6",
     xlab = "x",
     ylab = "f(x)",
     ylim = c(0, 1),
     pch = 20,
     cex = 2)

plot(x,
     dbern(x, prob = 0.6),
     main = "PDF Distribusi Bernoulli dengan p = 0.6",
     xlab = "x",
     ylab = "f(x)",
     ylim = c(0, 1),
     pch = 20,
     cex = 2,
     type = "o") #hindari plot seperti ini dalam distribusi diskrit, kenapa? 
#balik lagi, domainnya diskrit jadi harusnya ga terdefinisi untuk 0 < x < 1 sehingga harusnya tidak boleh dihubungkan oleh garis lurus

#kalo pake garis putus2 masih oke lah, tapi kurang recommend untuk distribusi diskrit
plot(x,
     dbern(x, prob = 0.6),
     main = "PDF Distribusi Bernoulli dengan p = 0.4",
     xlab = "x",
     ylab = "f(x)",
     ylim = c(0, 1),
     pch = 20,
     cex = 2,
     type = "o", 
     lty = 2)

x2 <- seq(0, 10, by = 1)

plot(x2,
     dbern(x2, prob = 0.6),
     pch = 20,
     cex = 2,
     xaxp = c(0,10,10))
#apa kesimpulannya? untuk x = 2,3,4,... f(x) = 0

#cdf -> Pr(X <= k)
pbern(0, prob = 0.6)
pbern(1, prob = 0.6)
plot(x2,
     pbern(x2, prob = 0.6),
     pch = 20,
     cex = 2,
     xaxp = c(0,10,10))
#apa kesimpulannya? untuk x = 1,2,3,... F(x) = 1 else F(x) = 1-p

#bangkitkan n data dari distribusi bernoulli
set.seed(122)
n <- 100
random_bern <- rbern(n, prob = 0.6)

table(random_bern)/sum(table(random_bern))

random_bern_plot <- barplot(table(random_bern),
                            ylim = c(0,100))
text(x = random_bern_plot,
     y = table(random_bern),
     labels = table(random_bern),
     pos = 3)

#1b. Distribusi Binomial
#pdf
dbinom(2,
       size = 10,
       prob = 0.6) #artinya adalah Pr(X=2) dimana X ~ binom(10, 0.6)

plot(x2,
     dbinom(x2,10,0.4),
     xaxp = c(0,10,10),
     pch = 20,
     ylim = c(0, 0.3)) #plot pdf

#cdf
pbinom(2, size = 10, prob = 0.6)

plot(x2,
     pbinom(x2,10,0.4),
     xaxp = c(0,10,10),
     pch = 20,
     ylim = c(0, 1)) #plot cdf

#bangkitkan n data dari distribusi binomial
set.seed(122)
n <- 100
random_binom <- rbinom(n, size = 10, prob = 0.6)

table(random_binom)/sum(table(random_binom))

random_binom_plot <- barplot(table(random_binom),
                             ylim = c(0,40))
text(x = random_binom_plot,
     y = table(random_binom),
     labels = table(random_binom),
     pos = 3)

#untuk distribusi lain, intinya tetap sama hanya sesuaikan parameternya saja
#format:

#pdf -> d+nama distribusi()
#misal pdf poisson berarti dpois()
#cdf poisson: ppois()
#data random dari distribusi poisson rpois()
#selengkapnya bisa cek di dokumentasi 
?Distributions