library(Rlab)

#2. Distribusi Kontinu
#Distribusi Normal : Digunakan saat n>= 30
#pdf
dnorm(2.7,
      mean = 2,
      sd = 5)

#pdf normal standar
dnorm(2.7,
      mean = 0,
      sd = 1)

x3 <- seq(-4, 4, length = 100)

plot(x3,
     dnorm(x3, mean = 0, sd = 1),
     type = 'o')

#cdf 
pnorm(1.96,
      mean = 0,
      sd = 1)

plot(x3,
     pnorm(x3, mean = 0, sd = 1),
     type = 'o')

#kalo cdf kan inputnya x outputnya probabilitas
#gimana kalo mau inputnya probabilitas outputnya x? pake qnorm
#Pr(X <= x) = 1.96 (gimana cara cari x nya?)

qnorm(0.975,
      mean = 0,
      sd = 1)

#bangkitkan data random
set.seed(101)
n <- 100
random_normal <- rnorm(n, mean = 0, sd = 1)
random_normal2 <- rnorm(n, mean = 10, sd = 8)

par(mfrow = c(1,2))
plot(density(random_normal), main = "Mean 0 Sd 1")
plot(density(random_normal2), main = "Mean 10 Sd 8")
par(mfrow = c(1,1))

#CENTRAL LIMIT THEOREM : Semakin besar sampel yang diambil, bisa didekatkan ke dist. normal
##Sampling Distribution (Contoh: akan dilakukan sampling dari distribusi uniform)

unif <- c(1:8)
unif
###Lihat sebarannya
mean(unif)
sd(unif)
hist(unif, main = "Uniform Distribution", xlab = " ")
###Ambil berbagai ukuran sampel, bandingkan
set.seed(211)
# Sample size of 3, 1000 kali percobaan
sample_means <- c( )
for(i in 1:1000){
  sample_means[i] <- mean(sample(8, 3, replace = TRUE))
}
hist(sample_means, xlim = c(0,8), main = "Sample Size of 3", xlab = "Sample Means")

# Sample size of 10, 1000 kali percobaan
sample_means <- c( )
for(i in 1:1000){
  sample_means[i] <- mean(sample(8, 10, replace = TRUE))
}
hist(sample_means, xlim = c(0,8), main = "Sample Size of 10", xlab = "Sample Means")

#Sample size of 50
sample_means <- c( )
for(i in 1:1000){
  sample_means[i] <- mean(sample(8, 50, replace = TRUE))
}
hist(sample_means, xlim = c(0,8), main = "Sample Size of 50", xlab = "Sample Means")

#Apa kesimpulannya? (Semakin besar ukuran sampel, semakin berbentuk lonceng -> dist.normal)

#Penerapan CLT
#transformasi random_normal2 menjadi normal standar (berlaku untuk distribusi kontinu apapun -> sampling dist.)
#gunakan CLT -> scale
par(mfrow = c(1,2))
plot(density(random_normal2), main = "Sebelum")
plot(density(scale(random_normal2)), main = "Sesudah")
par(mfrow = c(1,1))

#Distribusi T : Digunakan saat n<30 dan variansi tidak diketahui
#pdf
dt(x = 0.5, df = 14)

#cdf
pt(0.025, df = 14) 

#Pr(T<t)=0.05 (alpha) -> nyari t nya (t-table)
qt(.95, df = 20)

#generating random data
set.seed(121)
n <- 100
randomt <- rt(n, df = 20)

hist(randomt, breaks=50, xlim = c(-6, 4))

#untuk distribusi lain, intinya tetap sama hanya sesuaikan parameternya saja
#format:

#pdf -> d+nama distribusi()
#misal pdf poisson berarti dpois()
#cdf poisson: ppois()
#data random dari distribusi poisson rpois()
#selengkapnya bisa cek di dokumentasi 
?Distributions
