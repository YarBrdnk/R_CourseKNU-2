Бердник Ярослави
2 курс магістратури
2020 р.

Лабораторна робота № 4. Зчитування даних з реляційних баз даних.

Дані для цієї лабораторної роботи взяті з «https://www.kaggle.com/benhamner/nips-2015-papers»
Для виконання лабораторної необхідно завантажити файл бази даних SQLite за посиланням: 
«https://www.dropbox.com/s/pf2htfcrdoqh3ii/database.sqlite?dl=0». 
В цьому файлі містяться дані по доповідям на Neural Information Processing Systems (NIPS) яка є однією з ведучих конференцій по машинному навчанню в світі. 
База даних складається з наступних таблиць:
Papers
This file contains one row for each of the 403 NIPS papers from this year's conference. It includes the following fields
Id - unique identifier for the paper (equivalent to the one in NIPS's system)
Title - title of the paper
EventType - whether it's a poster, oral, or spotlight presentation
PdfName - filename for the PDF document
Abstract - text for the abstract (scraped from the NIPS website)
PaperText - raw text from the PDF document (created using the tool pdftotext)
Authors
This file contains id's and names for each of the authors on this year's NIPS papers.
Id - unique identifier for the author (equivalent to the one in NIPS's system)
Name - author's name
PaperAuthors
This file links papers to their corresponding authors.
Id - unique identifier
PaperId - id for the paper
AuthorId - id for the author

Для роботи з базою даних SQLite в R можна використовувати бібліотекі DBI та RSQLite.
Спочатку необхідно створити з’єдання з базою даних
conn <- dbConnect(RSQLite::SQLite(), "Шлях до БД")
Функція dbSendQuery(conn, "Запит») формує запит і виконує його в БД. Для отримання результатів у вигляді фрейму даних необхідно використати функцію dbFetch(res, n), де n – кількість строк, які будуть отримані. Для обмеження виводу даних, в подальших завданнях встановіть n = 10.
Приклад. Створимо фрейм даних який буде містити у стовпці «Author» авторів, відсортованих в алфавітному порядку. Обмежимось тільки 10 записами.
library(DBI)
conn <- dbConnect(RSQlite::SQLite(), "c:\\Dropbox\\Public\\database.sqlite")
res <- dbSendQuery(conn, "SELECT Name as Author FROM Authors ORDER BY Name")
df <- dbFetch(res, n=10)
> df
Author
1 ABHISEK KUNDU
2 Aaditya Ramdas
3 Aaron C. Courville
4 Aaron Klein
5 Aaron Roth
6 Aarti Singh
7 Abbas Abdolmaleki
8 Abhradeep Thakurta
9 Adam Smith
10 Adarsh Prasad
dbClearResult(res)
dbDisconnect(con)

> install.packages("RSQLite")
> library(RSQLite)
> library(DBI)



В результаті виконання лабораторної роботи необхідно створити фрейми даних:

1. Назва статті (Title), тип виступу (EventType). Необхідно вибрати тільки статті с типом виступу Spotlight. Сортування по назві статті.

> conn <- dbConnect(RSQLite::SQLite(), "C:/Users/PC/database (1).sqlite")
> conn
<SQLiteConnection>
  Path: C:\Users\PC\database (1).sqlite
  Extensions: TRUE

> res <- dbSendQuery(conn, "SELECT Title, EventType FROM Papers WHERE EventType = 'Spotlight' ORDER BY Title")
> res
<SQLiteResult>
EXPIRED

> df <- dbFetch(res, n=10)
> df
                                                                                          Title EventType
1  A Tractable Approximation to Optimal Point Process Filtering: Application to Neural Encoding Spotlight
2                                    Accelerated Mirror Descent in Continuous and Discrete Time Spotlight
3                        Action-Conditional Video Prediction using Deep Networks in Atari Games Spotlight
4                                                                      Adaptive Online Learning Spotlight
5                          Asynchronous Parallel Stochastic Gradient for Nonconvex Optimization Spotlight
6                                                 Attention-Based Models for Speech Recognition Spotlight
7                                                       Automatic Variational Inference in Stan Spotlight
8                                   Backpropagation for Energy-Efficient Neuromorphic Computing Spotlight
9                       Bandit Smooth Convex Optimization: Improving the Bias-Variance Tradeoff Spotlight
10                         Biologically Inspired Dynamic Textures for Probing Motion Perception Spotlight

> dbClearResult(res)
> dbDisconnect(conn)


2. Ім’я автора (Name), Назва статті (Title). Необхідно вивести всі назви статей для автора «Josh Tenenbaum». Сортування по назві статті.

> conn0 <- dbConnect(RSQLite::SQLite(), "C:/Users/PC/database (1).sqlite")
> conn0
<SQLiteConnection>
  Path: C:\Users\PC\database (1).sqlite
  Extensions: TRUE

> res0 <- dbSendQuery(conn0, "SELECT Name, Title FROM Authors INNER JOIN PaperAuthors ON Authors.Id = PaperAuthors.AuthorID INNER JOIN Papers ON PaperAuthors.PaperId = Papers.Id WHERE Name = 'Josh Tenenbaum'ORDER BY Title")
> res0
<SQLiteResult>
  SQL  SELECT Name, Title FROM Authors INNER JOIN PaperAuthors ON Authors.Id = PaperAuthors.AuthorID INNER JOIN Papers ON PaperAuthors.PaperId = Papers.Id WHERE Name = 'Josh Tenenbaum'ORDER BY Title
  ROWS Fetched: 0 [incomplete]
       Changed: 0

> df0 <- dbFetch(res0, n=10)
> df0
            Name
1 Josh Tenenbaum
2 Josh Tenenbaum
3 Josh Tenenbaum
4 Josh Tenenbaum
                                                                                              Title
1                                                       Deep Convolutional Inverse Graphics Network
2 Galileo: Perceiving Physical Object Properties by Integrating a Physics Engine with Deep Learning
3                                                Softstar: Heuristic-Guided Probabilistic Inference
4                                                        Unsupervised Learning by Program Synthesis


3. Вибрати всі назви статей (Title), в яких є слово «statistical». Сортування по назві статті.

> conn1 <- dbConnect(RSQLite::SQLite(), "C:/Users/PC/database (1).sqlite")
> conn1
<SQLiteConnection>
  Path: C:\Users\PC\database (1).sqlite
  Extensions: TRUE

> res1 <- dbSendQuery(conn1, "SELECT Title FROM Papers WHERE Title LIKE '%statistical%' ORDER BY Title")
> res1
<SQLiteResult>
  SQL  SELECT Title FROM Papers WHERE Title LIKE '%statistical%' ORDER BY Title
  ROWS Fetched: 0 [incomplete]
       Changed: 0

> df1 <- dbFetch(res1, n=10)
> dbClearResult(res1)
> dbDisconnect(conn1)
> df1
                                                                                 Title
1 Adaptive Primal-Dual Splitting Methods for Statistical Learning and Image Processing
2                                Evaluating the statistical significance of biclusters
3                  Fast Randomized Kernel Ridge Regression with Statistical Guarantees
4     High Dimensional EM Algorithm: Statistical Optimization and Asymptotic Normality
5                Non-convex Statistical Optimization for Sparse Tensor Graphical Model
6            Regularized EM Algorithms: A Unified Framework and Statistical Guarantees
7                            Statistical Model Criticism using Kernel Two Sample Tests
8                         Statistical Topological Data Analysis - A Kernel Perspective
> 


4. Ім’я автору (Name), кількість статей по кожному автору (NumPapers). Сортування по кількості статей від більшої кількості до меньшої.

> conn2 <- dbConnect(RSQLite::SQLite(), "C:/Users/PC/database (1).sqlite")
> conn2
<SQLiteConnection>
  Path: C:\Users\PC\database (1).sqlite
  Extensions: TRUE

> res2 <- dbSendQuery(conn2, "SELECT Name, COUNT (Title) AS NumPapers FROM Authors INNER JOIN PaperAuthors ON Authors.Id = PaperAuthors.AuthorID INNER JOIN Papers ON PaperAuthors.PaperId = Papers.Id GROUP BY Name ORDER BY NumPapers DESC")
> res2
<SQLiteResult>
  SQL  SELECT Name, COUNT (Title) AS NumPapers FROM Authors INNER JOIN PaperAuthors ON Authors.Id = PaperAuthors.AuthorID INNER JOIN Papers ON PaperAuthors.PaperId = Papers.Id GROUP BY Name ORDER BY NumPapers DESC
  ROWS Fetched: 0 [incomplete]
       Changed: 0

> df2 <- dbFetch(res2, n=10)
> dbClearResult(res2)
> dbDisconnect(conn2)
> df2
                   Name NumPapers
1  Pradeep K. Ravikumar         7
2        Lawrence Carin         6
3               Han Liu         6
4     Zoubin Ghahramani         5
5               Le Song         5
6   Inderjit S. Dhillon         5
7          Zhaoran Wang         4
8         Yoshua Bengio         4
9  Simon Lacoste-Julien         4
10          Shie Mannor         4