library(tidyverse)
View(mpg)
help(mpg)
? mpg

ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy))

ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy, colour = class))

ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy, size = class))

ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy, alpha = class))

ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy, shape = class))

ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy, shape = class),
                                color = "blue")

ggplot(data = mpg) + geom_point(mapping = aes(x = displ , y = hwy), shape = 20)


d = data.frame(p = c(0:25, 32:127))
ggplot() +
  scale_y_continuous(name = "") +
  scale_x_continuous(name = "") +
  scale_shape_identity() +
  geom_point(
    data = d,
    mapping = aes(
      x = p %% 16,
      y = p %/% 16,
      shape = p
    ),
    size = 5,
    fill = "red"
  ) +
  geom_text(
    data = d,
    mapping = aes(
      x = p %% 16,
      y = p %/% 16 + 0.25,
      label = p
    ),
    size = 3
  )

# FACETS

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_wrap( ~
                                                                                   class, nrow = 3)

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_grid(. ~
                                                                                  cyl)
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_grid(drv ~
                                                                                  cyl)

# OTRAS GEOMETRIAS

ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
ggplot(data = mpg) + geom_smooth(mapping = aes(
  x = displ,
  y = hwy,
  linetype = drv,
  color = drv
))
ggplot(data = mpg) + geom_smooth(mapping = aes(
  x = displ,
  y = hwy,
  linetype = drv,
  color = drv
)) +
  geom_point(mapping = aes(displ, hwy, color = drv))

# COMBINAR GRAFICOS Y AÑADIR DIMENSIONES

ggplot(data = mpg) + geom_smooth(mapping = aes(
  x = displ,
  y = hwy,
  group = drv,
  color = drv
),
show.legend = T)

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) +
  geom_smooth(mapping = aes(x = displ, y = hwy))

# GLOBAL VS LOCAL(PREVALECE)
ggplot(data = mpg, mapping = aes(x = displ , y = hwy)) + geom_point() + geom_smooth()
ggplot(data = mpg, mapping = aes(x = displ , y = hwy)) + geom_point(aes(color = class)) + geom_smooth(aes(linetype = drv))

ggplot(data = mpg, mapping = aes(x = displ , y = hwy)) + geom_point(aes(color = class)) +
  geom_smooth(data = filter(mpg, class == "suv"), se = F)

# BARCHAR (VARIABLE CATEGORICA) Y STATS IMPLICITA
View(diamonds)
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut))
ggplot(data = diamonds) + stat_count(mapping = aes(x = cut))

# CAMBIANDO LAS TRANSFORMACIONES ESTADISTICAS
conteo <- diamonds %>% group_by(cut) %>% summarise(conteo = n())
ggplot(data = conteo) + geom_bar(mapping = aes(x = cut, y = conteo), stat = "identity")

ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))

ggplot(data = diamonds) + stat_summary(
  mapping = aes(x = cut, y = depth),
  fun.ymin = min,
  fun.ymax = max,
  fun.y = median
)

# EL PARAMETRO POSITION
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, colour = cut))
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = cut))

# APILADO
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = clarity))
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = color))

# position = "identity"
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + geom_bar(position = "identity", alpha = 0.2)
ggplot(data = diamonds, mapping = aes(x = cut, colour = clarity)) + geom_bar(fill = NA,
                                                                             position = "identity",
                                                                             alpha = 0.2)

# position = "fill" muy buena para comparar proporciones
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + geom_bar(position = "fill")

# position = "dodge"
ggplot(data = diamonds, mapping = aes(x = cut, fill = clarity)) + geom_bar(position = "dodge")

# GEOM_POINT VS GEOM_JITTER

ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), position = "jitter")

ggplot(data = mpg) + geom_jitter(mapping = aes(x = displ, y = hwy))


# SISTEMAS DE COORDENADAS

ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + geom_boxplot()
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + geom_boxplot() + coord_flip()

# coord_quickmap() --> configura el aspect ratio para mapas

# coordenadas polares

ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = cut), show.legend = F,width = 1) + 
  theme(aspect.ratio = 1) + labs(x = NULL, y = NULL) + coord_polar()

ggplot(data = diamonds) + geom_bar(mapping = aes(x = clarity, fill = clarity, y = ..count..)) + 
  coord_polar() + facet_wrap(~cut) + labs(x = NULL, y = NULL, title = "Ejemplo final", caption = "CAPTION",subtitle = "SUBTITLE") 

?stat_summary
