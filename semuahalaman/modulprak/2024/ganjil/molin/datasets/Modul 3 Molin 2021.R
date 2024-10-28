###### Regresi orde 1 ##########
library(car)
data("Salaries")
View(Salaries)
head(Salaries)
str(Salaries)

model_1var <- lm(salary~yrs.since.phd, data = Salaries) 
summary(model_1var)

model_0 <- lm(salary~ 0+yrs.since.phd, data = Salaries)
summary(model_0)

model_2var <- lm(salary~yrs.since.phd + yrs.service, data = Salaries) 
summary(model_2var)

###### Regresi kategorik ##########
#bikin dummmy variabel manual
df <- Salaries
df$Male <- ifelse(df$sex == 'Male', 1, 0) 
View(df)

model1 <- lm(salary~yrs.since.phd + yrs.service + Male, data=df)
summary(model1)

#bikin dummy variabel pake package
library(fastDummies)
dataf <- dummy_cols(Salaries,select_columns ='sex')
head(dataf)

model2<- lm(salary~yrs.since.phd + yrs.service + sex_Male, data=dataf)
summary(model2)

#tanpa buat dummy variabel
model3 <-lm(salary~yrs.since.phd + yrs.service + sex, data=Salaries)
summary(model3)

#ganti base level
Salaries$sex <- relevel(Salaries$sex, ref='Male')

model4 <-lm(salary~yrs.since.phd + yrs.service + relevel(sex, ref='Male'), data=Salaries)
summary(model4)


#### Regresi Polinomial#######
library(readxl)
datareg <- read_excel("C:\\Users\\admin\\Documents\\Praktikum 3 Molin\\datareg.xlsx")
View(datareg)
plot(datareg$gaji, datareg$kesenangan)

#Model linear (orde 1)
linearModel <- lm(kesenangan ~ gaji, data=datareg)
summary(linearModel)

#Model Kuadratik (orde 2)
datareg$gajikuadrat <- datareg$gaji^2
View(datareg)

modelkuadratik <- lm(kesenangan~gaji + gajikuadrat, data=datareg)
modelkuadratik <- lm(kesenangan~gaji + I(gaji^2), data=datareg)
summary(modelkuadratik)

#Model Kubik (orde 3)
datareg$gajikubik <- datareg$gaji^3
modelkubik <- lm(kesenangan~gaji + gajikuadrat + gajikubik, data=datareg)
modelkubik <- lm(kesenangan~gaji + I(gaji^2) + I(gaji^3), data=datareg)
summary(modelkubik)

#Compare model kuadratik sama kubik
anova(modelkuadratik,modelkubik)


#plot regresi 
plot(datareg$gaji, datareg$kesenangan)
#Mengeluarkan nilai gaji
nilaigaji <- seq(0, 60, 0.1)
#Mengeluarkan nilai prediksi dari model kuadratik
predkesenangan <- predict(modelkuadratik,list(gaji=nilaigaji, gajikuadrat=nilaigaji^2))
#Mengeluarkan Plot dengan garis
lines(nilaigaji, predkesenangan, col='red')

#######Regresi Multiplicative (interaksi)######
library(readxl)
nilai_UTS <- read_excel("C:\\Users\\admin\\Documents\\Praktikum 3 Molin\\nilai_UTS.xlsx")
View(nilai_UTS)
str(nilai_UTS)

GenderMale <- nilai_UTS[which(nilai_UTS$JenisKelamin=="Male"),]
GenderFemale <- nilai_UTS[which(nilai_UTS$JenisKelamin=="Female"),]

modelMale <- lm(nilai_UTS ~ IQ, data = GenderMale)
modelFemale <- lm(nilai_UTS ~ IQ, data = GenderFemale)

#Ngeluarin plot dengan garis 
plot(nilai_UTS$IQ, nilai_UTS$nilai_UTS)
lines(GenderMale$IQ, predict(modelMale), col="red",
      lty = 1 , lwd = 2)
lines(GenderFemale$IQ, predict(modelFemale), col="blue",
      lty = 2 , lwd = 2)
legend("topleft", legend=c('Male','Female'), col=c('red','blue'),
       lty = c(1,2), lwd=c(2,2))

