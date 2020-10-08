Бердник Ярослави
2 курс магістратури
2020 р.

Лабораторна робота № 3. Зчитування даних з WEB.

В цій лабораторній роботі необхідно зчитати WEB сторінку з сайту IMDB.com зі 100 фільмами 2017 року виходу за посиланням 
«http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature». 
Необхідно створити data.frame «movies» (я створила imdb_url) з наступними даними: номер фільму (rank_data), назва фільму (title_data), тривалість (runtime_data). 
Для виконання лабораторної рекомендується використати бібліотеку «rvest». 
CSS селектори для зчитування необхідних даних: rank_data: «.text-primary», title_data: «.lister-item-header a», runtime_data: «.text-muted .runtime». 
Для зчитування url використовується функція read_html, для зчитування даних по CSS селектору – html_nodes і для перетворення зчитаних html даних в текст - html_text. 
Рекомендується перетворити rank_data та runtime_data з тексту в
числові значення. 
При формуванні дата фрейму функцією data.frame рекомендується використати параметр «stringsAsFactors = FALSE».

> install.packages("rvest")
> library(rvest)
> library(stringr)

> imdb_url <- "http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature"
> read_imdb_url <- read_html(imdb_url)
> read_imdb_url
{html_document}
<html xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml">
[1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n<script type="text/javascr ...
[2] <body id="styleguide-v2" class="fixed">\n            <img height="1" width="1" style="display:none;visi ...

> rank_data <- html_nodes(read_imdb_url, ".text-primary")
> title_data <- html_nodes(read_imdb_url, ".lister-item-header a")
> runtime_data <- html_nodes(read_imdb_url, ".text-muted .runtime")
> rank_text <- html_text(rank_data, trim = TRUE)
> title_text <- html_text(title_data, trim = TRUE)
> runtime_text <- html_text(runtime_data, trim = TRUE)
> rank <- as.integer(rank_text)
> runtime <- str_remove(runtime_text, " min")
> title <- title_text
> Sys.setlocale(locale = "Ukrainian")
[1] "LC_COLLATE=Ukrainian_Ukraine.1251;LC_CTYPE=Ukrainian_Ukraine.1251;LC_MONETARY=Ukrainian_Ukraine.1251;LC_NUMERIC=C;LC_TIME=Ukrainian_Ukraine.1251"


В результаті виконання лабораторної роботи необхідно відповісти на запитання:
1. Виведіть перші 6 назв фільмів дата фрейму.
> movies <- data.frame(rank, title, runtime, stringsAsFactors = FALSE)
> head(movies)
  rank                        title runtime
1    1                       Нянька      85
2    2 Той, хто біжить по лезу 2049     164
3    3                Тор: Раґнарок     130
4    4                         Воно     135
5    5         Красуня і Чудовисько     129
6    6 Вбивство у Східному експресі     114

> names06 <- head(movies$title, 6)
> names06
[1] "Нянька"                       "Той, хто біжить по лезу 2049"              "Тор: Раґнарок"               
[4] "Воно"                         "Красуня і Чудовисько"                      "Вбивство у Східному експресі"


2. Виведіть всі назви фільмів с тривалістю більше 120 хв.

> time120 <- subset(movies$title, runtime > 120)
> time120
 [1] "Нянька"                                   "Той, хто біжить по лезу 2049"            
 [3] "Тор: Раґнарок"                            "Воно"                                    
 [5] "Красуня і Чудовисько"                     "Назви мене своїм ім'ям"                  
 [7] "Пірати Карибського моря: Помста Салазара" "Вартові Галактики 2"                     
 [9] "Людина-павук: Повернення додому"          "Kingsman: Золоте кільце"                 
[11] "Леді Бьорд"                               "Логан: Росомаха"                         
[13] "Диво-жінка"                               "Форма води"                              
[15] "Чужий: Заповіт"                           "Зоряні війни: Епізод 8 - Останні Джедаї" 
[17] "Джон Вік 2"                               "Гра Моллі"                               
[19] "Примарна нитка"                           "Вбивство священного оленя"               
[21] "Тебе ніколи тут не було"                  "Король Артур: Легенда меча"              
[23] "Пастка часу"                              "Валеріан і місто тисячі планет"          
[25] "Трансформери: Останній лицар"             "Мати!"                                   
[27] "Щасливий день смерті"                     "Темна вежа"                              
[29] "Форсаж 8"                                 "Ритуал"                                  
[31] "Усі гроші світу"                          "Вороги"                                  
[33] "Detroit"                                  "Сім сестер"                              
[35] "Темні часи"                               "Війна за планету мавп"                   
[37] "Метелик"                                  "The Little Hours"                        
[39] "Зменшення"                                "Song to Song"                            
[41] "Постріл в безодню"                        "Пила 8"                                  
[43] "Saban's Могутні рейнджери"                "Історія примари"                         
[45] "Воно приходить уночі"                     "Dark River"                              
[47] "Ідеальний голос 3"                       


3. Скільки фільмів мають тривалість менше 100 хв.

> time100 <- length(subset(movies$title, runtime > 100))
> time100
[1] 99