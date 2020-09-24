
Бердник Ярослави
2 курс магістратури
2020 р.

Лабораторна робота № 1. Завантаження та зчитування даних.

1. За допомогою download.file() завантажте любий excel файл з порталу 
http://data.gov.ua та зчитайте його (xls, xlsx – бінарні формати, тому встановить mode = “wb”. 
Виведіть перші 6 строк отриманого фрейму даних.

Видобуток рядового вугілля державними підприємствами, установами, організаціями та об’єднаннями, що належать до сфери управління Міненерговугілля, та господарських товариств, щодо яких Міненерговугілля здійснює управління корпоративними правами держави (за шахтами, марками продукції)
https://data.gov.ua/dataset/8b56ac6b-6e79-44a4-9723-96806f91b728

> coal_mining <- "https://data.gov.ua/dataset/66b11f1a-a130-49e7-8a0b-aa146b962b1f/resource/efab0ec6-d027-4fb6-97d6-e1b6a4f822ab/download/coal_extraction_07_2020.xlsx"
> coal <- " C:/Users/PC/Documents/coal_extraction_07_2020.xlsx "
> download.file(coal_mining, coal, mode='wb')
пробую URL 'https://data.gov.ua/dataset/66b11f1a-a130-49e7-8a0b-aa146b962b1f/resource/efab0ec6-d027-4fb6-97d6-e1b6a4f822ab/download/coal_extraction_07_2020.xlsx'
Content type 'application/octet-stream' length 90638 bytes (88 KB)
downloaded 88 KB
> library(readxl)
> head(read_excel("C:/Users/PC/Documents/coal_extraction_07_2020.xlsx", sheet=1, col_names=TRUE, col_types=NULL, skip=0), 6)
# A tibble: 6 x 12
  month               company company_code mine  ministry_owned_~ region region_code mark  extraction_fact
  <dttm>              <chr>   <chr>        <chr>            <dbl> <chr>  <chr>       <chr>           <dbl>
1 2020-07-01 00:00:00 "ДП ш/~ 34032208     "ДП ~                1 Донец~ 1400000000  ДГ                  0
2 2020-07-01 00:00:00 "ДП \"~ 40695853     "ДП ~                1 Донец~ 1400000000  Г(Г2)           16920
3 2020-07-01 00:00:00 "ДП Ми~ 32087941     "ВП ~                1 Донец~ 1400000000  ГЖП              1000
4 2020-07-01 00:00:00 "ДП Ми~ 32087941     "ВП ~                1 Донец~ 1400000000  ГЖП             43500
5 2020-07-01 00:00:00 "ДП Ми~ 32087941     "ВП ~                1 Донец~ 1400000000  Г(Г2)             500
6 2020-07-01 00:00:00 "ДП Се~ 33426253     "ВП ~                1 Донец~ 1400000000  ДГ               1440
# ... with 3 more variables: extraction_plan <dbl>, ash_percent_fact <dbl>, ash_percent_plan <dbl>


2. За допомогою download.file() завантажте файл getdata_data_ss06hid.csv за посиланням 
https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv та завантажте дані в R. 
Code book, що пояснює значення змінних знаходиться за посиланням https://www.dropbox.com/s/dijv0rlwo4mryv5/PUMSDataDict06.pdf?dl=0 
Необхідно знайти, скільки property мають value $1000000+

> get_data <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
> d3_data <- "C:/Users/PC/Documents/getdata_data_ss06hid.csv"
> download.file (get_data, d3_data)
пробую URL 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv'
Content type 'text/csv' length 4246554 bytes (4.0 MB)
downloaded 4.0 MB
> library(readr)
> mdata <- read.csv (d3_data)
> mdata
  RT SERIALNO DIVISION PUMA REGION ST  ADJUST WGTP NP TYPE ACR AGS BDS BLD BUS CONP ELEP FS FULP GASP HFL
1  H      186        8  700      4 16 1015675   89  4    1   1  NA   4   2   2   NA  180  0    2    3   3
2  H      306        8  700      4 16 1015675  310  1    1  NA  NA   1   7  NA   NA   60  0    2    3   3
3  H      395        8  100      4 16 1015675  106  2    1   1  NA   3   2   2   NA   70  0    2   30   1
4  H      506        8  700      4 16 1015675  240  4    1   1  NA   4   2   2   NA   40  0    2   80   1
5  H      835        8  800      4 16 1015675  118  4    1   2   1   5   2   2   NA  250  0    2    3   3
  INSP KIT MHP MRGI MRGP MRGT MRGX PLM RMS RNTM RNTP SMP TEL TEN VACS VAL VEH WATP YBL FES  FINCP FPARC GRNTP
1  600   1  NA    1 1300    1    1   1   9   NA   NA  NA   1   1   NA  17   3  840   5   2 105600     2    NA
2   NA   1  NA   NA   NA   NA   NA   1   2    2  600  NA   1   3   NA  NA   1    1   3  NA     NA    NA   660
3  200   1  NA   NA   NA   NA    3   1   7   NA   NA  NA   1   2   NA  18   2   50   5   7   9400     2    NA
4  200   1  NA    1  860    1    1   1   6   NA   NA 400   1   1   NA  19   3  500   2   1  66000     1    NA
5  700   1  NA    1 1900    1    1   1   7   NA   NA 650   1   1   NA  20   5    2   3   1  93000     2    NA
  GRPIP HHL HHT  HINCP HUGCL HUPAC HUPAOC HUPARC LNGI MV NOC NPF NPP NR NRC OCPIP PARTNER PSF R18 R60 R65
1    NA   1   1 105600     0     2      2      2    1  4   2   4   0  0   2    18       0   0   1   0   0
2    23   1   4  34000     0     4      4      4    1  3   0  NA   0  0   0    NA       0   0   0   0   0
3    NA   1   3   9400     0     2      2      2    1  2   1   2   0  0   1    23       0   0   1   0   0
4    NA   1   1  66000     0     1      1      1    1  3   2   4   0  0   2    26       0   0   1   0   0
5    NA   1   1  93000     0     2      2      2    1  1   1   4   0  0   1    36       0   0   1   0   0
  RESMODE SMOCP SMX SRNT SVAL TAXP WIF WKEXREL WORKSTAT FACRP FAGSP FBDSP FBLDP FBUSP FCONP FELEP FFSP FFULP
1       1  1550   3    0    1   24   3       2        3     0     0     0     0     0     0     0    0     0
2       2    NA  NA    1    0   NA  NA      NA       NA     0     0     0     0     0     0     0    0     0
3       1   179  NA    0    1   16   1      13       13     0     0     0     0     0     0     0    0     0
4       2  1422   1    0    1   31   2       2        1     0     0     0     0     0     0     0    0     0
5       1  2800   1    0    1   25   3       1        1     0     0     0     0     0     0     0    0     0
  FGASP FHFLP FINSP FKITP FMHP FMRGIP FMRGP FMRGTP FMRGXP FMVYP FPLMP FRMSP FRNTMP FRNTP FSMP FSMXHP FSMXSP
1     0     0     0     0    0      0     0      0      0     0     0     0      0     0    0      0      0
2     0     0     0     0    0      0     0      0      0     0     0     0      0     0    0      0      0
3     0     0     0     0    0      0     0      0      0     0     0     0      0     0    0      0      0
4     0     0     0     0    0      0     0      0      0     0     0     0      0     0    0      0      0
5     0     0     0     0    0      0     0      0      0     0     0     0      0     0    0      0      0
  FTAXP FTELP FTENP FVACSP FVALP FVEHP FWATP FYBLP wgtp1 wgtp2 wgtp3 wgtp4 wgtp5 wgtp6 wgtp7 wgtp8 wgtp9
1     0     0     0      0     0     0     0     0    87    28   156    95    26    25    95    93    93
2     0     0     0      0     0     0     0     1   539   363   293   422   566   289    87   242   453
3     0     0     0      0     0     0     0     0   187    35   184   178    83    95    31    32   177
4     0     0     0      0     0     0     0     0   232   406   234   270   249   242   406   249   287
5     0     0     0      0     0     0     0     0   107   194   129    41   156   174    47   113   101
  wgtp10 wgtp11 wgtp12 wgtp13 wgtp14 wgtp15 wgtp16 wgtp17 wgtp18 wgtp19 wgtp20 wgtp21 wgtp22 wgtp23 wgtp24
1     91     87    166     90     25    153     89    148     82     25    180     90     24    140     92
2    453    334    358    414    102    281     99    108    278    131    407    447    264    352    238
3    118    110    114    184    107     95    115     33    118    120     37    184     35    176    176
4     67     72    413    399     77    245    424     67     63    226    254    238     69    238    255
5     33    115     52    113     95    135    206    100    185    135    279    116     33    105    244
  wgtp25 wgtp26 wgtp27 wgtp28 wgtp29 wgtp30 wgtp31 wgtp32 wgtp33 wgtp34 wgtp35 wgtp36 wgtp37 wgtp38 wgtp39
1     25     27     86     84     87     93     90    149     91     28    143     81    144     95     27
2    390    336    122    374    482    468    335    251    613    104    284    116     91    326    102
3    110    103     29     30    197    127     92    118    177     99     99    109     34    100    105
4    239    248     69    234    247    437    423     74     61    401    267     72    388    335    229
5     38     30    230    123    123    243    120    238     98     90    107     44    122     32    127
  wgtp40 wgtp41 wgtp42 wgtp43 wgtp44 wgtp45 wgtp46 wgtp47 wgtp48 wgtp49 wgtp50 wgtp51 wgtp52 wgtp53 wgtp54
1     22     90    171     27     83    153    148     92     91     91     93     90     26     94    142
2    361    107    253    321    289     96    343    564    274    118    118    321    261    130    463
3     33    173     36    168    175     99    103     30     35    155    102     95    107    185    120
4    236    239     65    259    247    230    225     82    220    233    419    390     69     74    391
5    195    116     36    135    237     33     33    249    102     84    224    119    250    119    125
  wgtp55 wgtp56 wgtp57 wgtp58 wgtp59 wgtp60 wgtp61 wgtp62 wgtp63 wgtp64 wgtp65 wgtp66 wgtp67 wgtp68 wgtp69
1     24     91     29     84    148     30     93    143     24     88    147    145     91     83     83
2    294    479    391    307    476    283    116    353    323    374    106    236    380    313     90
3    114    113     36    115    103     29    183     35    179    169     95    110     28     34    233
4    276     70    422    409    223    245    269    488    221    250    247    240    415    234    219
5    126     32    112     33    131     45    101    165    125     41    191    195     49    119     92
  wgtp70 wgtp71 wgtp72 wgtp73 wgtp74 wgtp75 wgtp76 wgtp77 wgtp78 wgtp79 wgtp80
1     86     81     27     93    151     28     79     25    101    157    129
2     94    292    401     81    494    346    496    615    286    454    260
3     97    123    119    168    107     95    101     30    124    106     31
4     66     68    359    385     71    234    421     76     77    242    231
5     44    127     36    119    121    116    209     97    176    144     38
 [ reached 'max' / getOption("max.print") -- omitted 6491 rows ]

> VAL24<-which(mdata$VAL==24)
> length(VAL24)
[1] 53


3. Зчитайте xml файл за посиланням http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml Скільки ресторанів мають zipcode 21231?
> library("XML")
> library("methods")
> rest1 <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
> rest2 <- xmlTreeParse(rest1 , useInternal = TRUE)
> root <- xmlRoot(rest2)
> zipcode <- xpathSApply(root , "//zipcode", xmlValue)
> which (zipcode==21231)
  [1]    2   10   19   25   26   40   52   56   88   89   90  119  124  130  135  142  145  150  157  163  175
 [22]  176  183  199  203  204  208  231  232  255  259  274  334  348  367  368  385  396  397  415  425  430
 [43]  445  446  458  463  497  502  505  518  519  535  536  537  555  605  630  640  656  662  694  709  710
 [64]  713  734  742  752  753  756  765  766  768  771  801  802  807  830  834  865  866  870  874  897  902
 [85]  928  936  939  953  967  972  990  991  999 1004 1026 1034 1045 1052 1055 1060 1064 1071 1075 1090 1097
[106] 1129 1134 1149 1150 1166 1171 1175 1178 1197 1199 1204 1207 1221 1225 1236 1238 1241 1267 1268 1303 1321
[127] 1324
> zipcode21231 <- which(zipcode==21231)
> length (zipcode21231)
[1] 127