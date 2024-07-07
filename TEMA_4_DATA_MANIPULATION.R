library(tidyverse)
# install.packages("nycflights13") # INSTALAR EN CASO DE QUE NO ESTE DISPONIBLE
library(nycflights13)
nycflights13::flights
View(flights)
str(flights)

# TIPOS DE DATOS BASICOS

# * int <- numero enteros
# * dbl <- numeros reales(double)
# * chr <- vector de caracteres o string
# * dttm <- date +time
# * lgl <- logical, valores booleanos(T o F)
# * fctr <- factor , variables categoricas
# * date <- fecha(dia,mes,año)

# FUNCIONES BASICAS

# * filter <- filtrar observaciones a partir de valores concretos
# * arrange <- ordena filas
# * select <- selecciona variables por su nombre
# * mutate <- crea nuevas variables a partir de las ya existentes
# * summarise <- colapsa varios valores para dar un resumen de los mismos
# * group_by <- opera la funcion a la que acompaña grupo a grupo


# FILTER ----------------------------------------------------------------------------------------------------------
jan1 <- flights %>% filter(month == 1, day ==1)
nov21 <- flights %>% filter(month == 11 , day == 21)

# OPCIONES DE FITRADO (>, >=,<,<=,==,!=)
# 1/49*49 == 1
# near(1/49*49,1)

filter(flights, month == 5 | month == 6)
# filter(flights, month == 5 | 6) ESTE TIPO DE FILTRADO NO FUNCIONARA
filter(flights, month %in% c (5,6))

#LEYES DE MORGAN
#!(x&y) == (!x)|(!y)
#!(x|y) == (!x)&(!y)

# "no (A y B)" es lo mismo que "(no A) o (no B)"
# "no (A o B)" es lo mismo que "(no A) y (no B)"

filter(flights, !(arr_delay > 60 | dep_delay >60))
filter(flights, arr_delay <= 60, dep_delay <= 60)

# PROBLEMA CON LOS NA
NA > 0
10 == NA
NA + 5
NA / 5
NA == NA

df <- tibble(x = c(1,2,NA,4,5))
df
filter(df, x>2)
filter(df, is.na(x)|x>2)


# ARRANGE ---------------------------------------------------------------------------------------------------------

head(flights)
tail(flights)
arrange(flights,year,month,day)
names(flights)
flights[1:10,year:day]









