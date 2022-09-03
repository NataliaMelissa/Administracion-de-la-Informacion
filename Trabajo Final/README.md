# EB-2021-1-CC51

## Objetivo
El objetivo de este examen final es aplicar los conocimientos aprendidos durante todo el ciclo para obtener conocimiento de los datos luego de hacer un análisis exploratorio y resolver un problema de modelización de datos. Para ello, se tratará este trabajo como un proyecto de analítica. Las herramientas de software a utilizar son python y R/RStudio, así se aplican todos los conocimientos del curso. El dataset a utilizar es Trending YouTube Video Statistics.

## Participantes
- Natalia Maury Castañeda
- Oscar Flores Palermo
- Carlos Iparraguirre

## Descripción del Dataset
El dataset a analizar es el de  Trending YouTube Video Statistics, la versión original es de kaggle.com creado por Mitchell Jolly, pero se ha modificado con la adición de 4 columnas adicionales (state, Iat, lon, geometry) para este trabajo. No obstante, el origen de los datos es el mismo y tiene al mismo creador del conjunto de datos. El dataset contiene información sobre los videos subidos a YouTube para conocer diversas características de ellos respecto a su ubicación geográfica por países. Estas características son la cantidad de vistas que tienen, cantidad de me gusta y no me gusta, categoría del video, etc. 

Para más información del dataset ver el pdf:

## Conclusiones
A partir de las visualizaciones realizadas se pueden obtener conclusiones que respondan a preguntas importantes de la consultora internacional. En cuanto a las categorías de videos, se pueden obtener las siguientes conclusiones. Basándose en los gráficos de likes y dislikes por categoría, se puede concluir que las categorías que más les gusta a las personas son music y comedy ya que tienen un gran volumen de likes que supera al de dislikes. En cuanto a qué categorías son las que les gustan menos a las personas, se puede concluir que shows, pets & animals y travel & events entran en esta categoría. Si bien shows tiene 491 likes y 90 dislikes, no tiene mucha interacción comparado con music o comedy, por lo que se puede concluir que le gusta a un grupo de personas pequeño pero no se puede considerar como las favoritas debido al poco volumen. Lo mismo aplica para  pets & animals y travel & events, ya que todas tienen más likes que dislikes pero tienen muy poca gente que reacciona a los videos por lo que se puede concluir que son las categorías que menos le gustan a las personas. Entertainment tiene la mayor cantidad de dislikes, pero esta equivale al 5% de la cantidad de likes+dislikes que recibe por lo que se puede concluir que a la gente sí le gusta esta categoría por más que sea la que más dislikes recibe.

En cuanto a las proporciones de likes y dislikes y vistas y comentarios se obtiene que no necesariamente la categoría con mayor proporción en un área tendrá la mayor proporción en otra. Mientras que los fans de la categoría deportes suelen dejar más comentarios y vistas en relación, no hay un ratio muy grande en cuanto a likes y dislikes. Lo inverso sucede con la categoría educación, donde hay más variedad entre likes y dislikes, sin embargo no se hallan muchos comentarios en esa categoría de videos.

En cuanto a la geografía por estado del país, se puede concluir que los estados con mayor cantidad de vistas son también los que tiene mayor cantidad de likes y dislikes, y viceversa para los que tienen la menor cantidad de vistas. Un ejemplo es Coahuila que tiene la mayor cantidad de vistas y la mayor cantidad de likes. Esto no es anormal, debido a que mientras más grande sean las vistas, tendrá mayores reacciones al video lo que permite que se de este fenómeno. 

En el modelado se usó la regresión lineal que es un manera muy fácil de utilizar por lo que se pueden observar en el gráfico nos facilitó la obtención de datos. Se pudieron analizar los coeficientes de “Vistas” o “Me gusta” o “No me gusta” de los videos para un mejor entendimiento. Al final de cuentas resulta muy difícil predecir por sus valores tan cambiantes que tienen los datos de Mexico de youtube.

## Licencia
La licencia utilizada es MIT

## Bibliografía
Kaggle (S/F). Kaggle Progression System. Recuperado de https://www.kaggle.com/progression [Consultado el 29 de junio del 2021]

Mitchell. J (2017). Mitchell J. Recuperado de https://www.kaggle.com/datasnaek [Consultado el 29 de junio del 2021]

Mitchell. J (2019). Trending YouTube Video Statistics: Daily statistics for trending YouTube videos. Recuperado de https://www.kaggle.com/datasnaek/youtube-new [Consultado el 29 de junio del 2021]

Mitchell. J (2017). Trending YouTube Video Statistics and Comments: Daily statistics (views, likes, category, comments+) for trending YouTube videos. Recuperado de https://www.kaggle.com/datasnaek/youtube [Consultado el 29 de junio del 2021].

Mitchell.J (S/F). Mitchell Jolly. Recuperado de https://uk.linkedin.com/in/mitchell-jolly-2bab06169?trk=public_profile_samename-profile [Consultado el 29 de junio del 2021]

Wikipedia (2021). Glasgow. Recuperado de https://es.wikipedia.org/wiki/Glasgow [Consultado el 29 de junio del 2021]
