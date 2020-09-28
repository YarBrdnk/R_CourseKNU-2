Бердник Ярослави
2 курс магістратури
2020 р.

Лабораторна робота № 2. Формат HDF5.

В цій лабораторній роботі побудуємо за даними детектора гравітаційних волн LIGO графік злиття двох нейтронних зір. 
Подія GW170817 https://uk.wikipedia.org/wiki/GW170817. Лабораторну роботу створено на основі https://losc.ligo.org/tutorial00/

1. Завантажте файл з даними за посиланням https://dcc.ligo.org/public/0146/P1700337/001/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5

> ligo0 <- "https://dcc.ligo.org/public/0146/P1700337/001/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5"
> ligo1 <- "C:/Users/PC/Documents/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5"
> download.file (ligo0, ligo1, mode="wb")
пробую URL 'https://dcc.ligo.org/public/0146/P1700337/001/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5'
Content type '' length 125217658 bytes (119.4 MB)
downloaded 119.4 MB

2. Встановить в R пакет для роботи з HDF5 файлами.

> install.packages("hdf5r")
> if (!requireNamespace("BiocManager", quietly = TRUE))
+ install.packages("BiocManager")
> BiocManager::install("rhdf5")
> library(rhdf5)

3. Виведіть зміст файлу командою h5ls().

> file <- h5ls(ligo1)
> file
                 group            name       otype  dclass      dim
0                    /            meta   H5I_GROUP                 
1                /meta     Description H5I_DATASET  STRING    ( 0 )
2                /meta  DescriptionURL H5I_DATASET  STRING    ( 0 )
3                /meta        Detector H5I_DATASET  STRING    ( 0 )
4                /meta        Duration H5I_DATASET INTEGER    ( 0 )
5                /meta        GPSstart H5I_DATASET INTEGER    ( 0 )
6                /meta     Observatory H5I_DATASET  STRING    ( 0 )
7                /meta            Type H5I_DATASET  STRING    ( 0 )
8                /meta        UTCstart H5I_DATASET  STRING    ( 0 )
9                    /         quality   H5I_GROUP                 
10            /quality          detail   H5I_GROUP                 
11            /quality      injections   H5I_GROUP                 
12 /quality/injections InjDescriptions H5I_DATASET  STRING        5
13 /quality/injections   InjShortnames H5I_DATASET  STRING        5
14 /quality/injections         Injmask H5I_DATASET INTEGER     4096
15            /quality          simple   H5I_GROUP                 
16     /quality/simple  DQDescriptions H5I_DATASET  STRING        7
17     /quality/simple    DQShortnames H5I_DATASET  STRING        7
18     /quality/simple          DQmask H5I_DATASET INTEGER     4096
19                   /          strain   H5I_GROUP                 
20             /strain          Strain H5I_DATASET   FLOAT 16777216

4. Зчитайте результати вимірів. Для цього зчитайте name Strain з групи strain в змінну strain.

> strain <- h5read(ligo1, name = "strain/Strain")
> strain
   [1] -2.391646e-18 -2.411660e-18 -2.427382e-18 -2.426351e-18 -2.427996e-18 -2.446291e-18 -2.462962e-18
   [8] -2.463456e-18 -2.464039e-18 -2.481933e-18 -2.499762e-18 -2.499653e-18 -2.499740e-18 -2.514827e-18
  [15] -2.534504e-18 -2.539017e-18 -2.534552e-18 -2.547276e-18 -2.567941e-18 -2.573345e-18 -2.569082e-18
  [22] -2.580038e-18 -2.601175e-18 -2.606781e-18 -2.602693e-18 -2.610871e-18 -2.633490e-18 -2.643470e-18
  [29] -2.636836e-18 -2.644074e-18 -2.664256e-18 -2.672044e-18 -2.668297e-18 -2.674602e-18 -2.694475e-18
  [36] -2.704304e-18 -2.701060e-18 -2.704327e-18 -2.721023e-18 -2.736411e-18 -2.734468e-18 -2.734657e-18
  [43] -2.750277e-18 -2.764038e-18 -2.762714e-18 -2.760657e-18 -2.775542e-18 -2.791775e-18 -2.792872e-18
  [50] -2.789694e-18 -2.802051e-18 -2.818514e-18 -2.819640e-18 -2.817563e-18 -2.825702e-18 -2.840493e-18
  [57] -2.844911e-18 -2.840323e-18 -2.849236e-18 -2.864024e-18 -2.866516e-18 -2.864561e-18 -2.870113e-18
  [64] -2.884157e-18 -2.892315e-18 -2.886803e-18 -2.888990e-18 -2.905280e-18 -2.910579e-18 -2.905710e-18
  [71] -2.907789e-18 -2.918407e-18 -2.929630e-18 -2.924219e-18 -2.920615e-18 -2.935474e-18 -2.945064e-18
  [78] -2.941400e-18 -2.938474e-18 -2.948497e-18 -2.958899e-18 -2.953137e-18 -2.947170e-18 -2.958416e-18
  [85] -2.969287e-18 -2.965243e-18 -2.960560e-18 -2.965839e-18 -2.977932e-18 -2.977669e-18 -2.966931e-18
  [92] -2.973528e-18 -2.984989e-18 -2.982362e-18 -2.976018e-18 -2.976060e-18 -2.985538e-18 -2.990464e-18
  [99] -2.980658e-18 -2.979012e-18 -2.992554e-18 -2.993673e-18 -2.983490e-18 -2.983633e-18 -2.990969e-18
 [106] -2.995566e-18 -2.987276e-18 -2.977768e-18 -2.989824e-18 -2.996801e-18 -2.986069e-18 -2.982921e-18
 [113] -2.987598e-18 -2.994141e-18 -2.990823e-18 -2.976841e-18 -2.982596e-18 -2.994848e-18 -2.983718e-18
 [120] -2.972993e-18 -2.978196e-18 -2.985418e-18 -2.982360e-18 -2.969311e-18 -2.970785e-18 -2.983330e-18
 [127] -2.976511e-18 -2.963970e-18 -2.965071e-18 -2.971571e-18 -2.971095e-18 -2.957552e-18 -2.951694e-18
 [134] -2.963511e-18 -2.963733e-18 -2.947448e-18 -2.944827e-18 -2.953143e-18 -2.952919e-18 -2.942992e-18
 [141] -2.931173e-18 -2.939483e-18 -2.946320e-18 -2.927756e-18 -2.917904e-18 -2.925625e-18 -2.929853e-18
 [148] -2.919138e-18 -2.905329e-18 -2.909864e-18 -2.918871e-18 -2.906497e-18 -2.890520e-18 -2.895777e-18
 [155] -2.901754e-18 -2.890156e-18 -2.876019e-18 -2.874160e-18 -2.883428e-18 -2.878781e-18 -2.856674e-18
 [162] -2.855804e-18 -2.867701e-18 -2.860627e-18 -2.842941e-18 -2.834326e-18 -2.845909e-18 -2.845614e-18
 [169] -2.820366e-18 -2.814046e-18 -2.825091e-18 -2.821311e-18 -2.805165e-18 -2.794329e-18 -2.800551e-18
 [176] -2.804899e-18 -2.784277e-18 -2.770095e-18 -2.780324e-18 -2.780628e-18 -2.762369e-18 -2.748153e-18
 [183] -2.752459e-18 -2.759136e-18 -2.742678e-18 -2.722568e-18 -2.729435e-18 -2.737542e-18 -2.719774e-18
 [190] -2.701331e-18 -2.702023e-18 -2.710814e-18 -2.697693e-18 -2.671427e-18 -2.673959e-18 -2.685997e-18
 [197] -2.672847e-18 -2.650269e-18 -2.647375e-18 -2.657167e-18 -2.649589e-18 -2.625884e-18 -2.618118e-18
 [204] -2.629841e-18 -2.622142e-18 -2.595089e-18 -2.589168e-18 -2.600928e-18 -2.596661e-18 -2.571079e-18
 [211] -2.557603e-18 -2.569716e-18 -2.570445e-18 -2.544824e-18 -2.529862e-18 -2.540617e-18 -2.541530e-18
 [218] -2.516841e-18 -2.498130e-18 -2.506710e-18 -2.514081e-18 -2.491844e-18 -2.467756e-18 -2.477225e-18
 [225] -2.485931e-18 -2.463102e-18 -2.442936e-18 -2.444579e-18 -2.455042e-18 -2.440329e-18 -2.409416e-18
 [232] -2.415368e-18 -2.428024e-18 -2.409383e-18 -2.386124e-18 -2.383985e-18 -2.399225e-18 -2.389959e-18
 [239] -2.357779e-18 -2.355079e-18 -2.373632e-18 -2.362608e-18 -2.331935e-18 -2.328918e-18 -2.342933e-18
 [246] -2.337705e-18 -2.312707e-18 -2.300934e-18 -2.318247e-18 -2.318595e-18 -2.288545e-18 -2.277624e-18
 [253] -2.291634e-18 -2.293081e-18 -2.269336e-18 -2.251407e-18 -2.266069e-18 -2.277109e-18 -2.249707e-18
 [260] -2.229448e-18 -2.245147e-18 -2.252756e-18 -2.233317e-18 -2.212832e-18 -2.219320e-18 -2.236733e-18
 [267] -2.216193e-18 -2.188689e-18 -2.201310e-18 -2.215052e-18 -2.199548e-18 -2.175542e-18 -2.179771e-18
 [274] -2.201330e-18 -2.186158e-18 -2.156256e-18 -2.163556e-18 -2.182762e-18 -2.171597e-18 -2.145168e-18
 [281] -2.144321e-18 -2.164966e-18 -2.161968e-18 -2.130893e-18 -2.126259e-18 -2.151037e-18 -2.148131e-18
 [288] -2.121240e-18 -2.114580e-18 -2.133248e-18 -2.140552e-18 -2.111452e-18 -2.096232e-18 -2.121889e-18
 [295] -2.126165e-18 -2.100108e-18 -2.090257e-18 -2.105836e-18 -2.117962e-18 -2.095146e-18 -2.074681e-18
 [302] -2.096782e-18 -2.111579e-18 -2.086777e-18 -2.068894e-18 -2.083646e-18 -2.099472e-18 -2.085613e-18
 [309] -2.059746e-18 -2.071529e-18 -2.097650e-18 -2.078945e-18 -2.054552e-18 -2.066763e-18 -2.087595e-18
 [316] -2.079979e-18 -2.051851e-18 -2.056658e-18 -2.083818e-18 -2.076071e-18 -2.048349e-18 -2.054145e-18
 [323] -2.081110e-18 -2.077810e-18 -2.051859e-18 -2.049547e-18 -2.076125e-18 -2.081558e-18 -2.052416e-18
 [330] -2.049233e-18 -2.076431e-18 -2.080905e-18 -2.058711e-18 -2.049706e-18 -2.075683e-18 -2.090001e-18
 [337] -2.064809e-18 -2.053578e-18 -2.078991e-18 -2.092964e-18 -2.072631e-18 -2.059671e-18 -2.079052e-18
 [344] -2.099189e-18 -2.085636e-18 -2.064706e-18 -2.084489e-18 -2.110356e-18 -2.097354e-18 -2.078372e-18
 [351] -2.092161e-18 -2.118660e-18 -2.110908e-18 -2.087687e-18 -2.101080e-18 -2.128298e-18 -2.123623e-18
 [358] -2.104123e-18 -2.114515e-18 -2.143291e-18 -2.142906e-18 -2.121594e-18 -2.125721e-18 -2.157485e-18
 [365] -2.163373e-18 -2.137718e-18 -2.140310e-18 -2.173179e-18 -2.180674e-18 -2.160848e-18 -2.160308e-18
 [372] -2.190821e-18 -2.206422e-18 -2.183801e-18 -2.179677e-18 -2.212038e-18 -2.224463e-18 -2.208543e-18
 [379] -2.205010e-18 -2.227914e-18 -2.250610e-18 -2.239668e-18 -2.225701e-18 -2.253620e-18 -2.278564e-18
 [386] -2.266547e-18 -2.257835e-18 -2.276828e-18 -2.303125e-18 -2.300600e-18 -2.282319e-18 -2.299504e-18
 [393] -2.332997e-18 -2.329232e-18 -2.314751e-18 -2.331895e-18 -2.359673e-18 -2.364811e-18 -2.347819e-18
 [400] -2.356212e-18 -2.393487e-18 -2.397352e-18 -2.379946e-18 -2.390692e-18 -2.417628e-18 -2.430380e-18
 [407] -2.418817e-18 -2.417367e-18 -2.451898e-18 -2.468529e-18 -2.449606e-18 -2.454065e-18 -2.483323e-18
 [414] -2.497469e-18 -2.489404e-18 -2.482573e-18 -2.511777e-18 -2.539226e-18 -2.521175e-18 -2.517290e-18
 [421] -2.547900e-18 -2.565701e-18 -2.562799e-18 -2.555376e-18 -2.573557e-18 -2.606910e-18 -2.599402e-18
 [428] -2.584945e-18 -2.612126e-18 -2.635258e-18 -2.634139e-18 -2.627791e-18 -2.637335e-18 -2.671487e-18
 [435] -2.677780e-18 -2.658450e-18 -2.675008e-18 -2.705181e-18 -2.709397e-18 -2.701475e-18 -2.705793e-18
 [442] -2.734315e-18 -2.753226e-18 -2.734327e-18 -2.738138e-18 -2.776743e-18 -2.784481e-18 -2.775012e-18
 [449] -2.779004e-18 -2.800998e-18 -2.827776e-18 -2.816640e-18 -2.807763e-18 -2.842383e-18 -2.860863e-18
 [456] -2.852131e-18 -2.855748e-18 -2.873854e-18 -2.900044e-18 -2.900626e-18 -2.883273e-18 -2.911252e-18
 [463] -2.941121e-18 -2.932250e-18 -2.931254e-18 -2.947104e-18 -2.973165e-18 -2.983480e-18 -2.966661e-18
 [470] -2.981681e-18 -3.019089e-18 -3.017216e-18 -3.008144e-18 -3.025113e-18 -3.048197e-18 -3.063894e-18
 [477] -3.053006e-18 -3.052924e-18 -3.093053e-18 -3.103313e-18 -3.088109e-18 -3.102656e-18 -3.125205e-18
 [484] -3.143233e-18 -3.141497e-18 -3.131215e-18 -3.164006e-18 -3.186855e-18 -3.172137e-18 -3.178296e-18
 [491] -3.196914e-18 -3.217487e-18 -3.226042e-18 -3.212269e-18 -3.233553e-18 -3.267322e-18 -3.257941e-18
 [498] -3.252997e-18 -3.275181e-18 -3.296873e-18 -3.303597e-18 -3.292328e-18 -3.302527e-18 -3.338780e-18
 [505] -3.340960e-18 -3.327528e-18 -3.345842e-18 -3.370658e-18 -3.381326e-18 -3.373629e-18 -3.373641e-18
 [512] -3.406915e-18 -3.421276e-18 -3.403872e-18 -3.410177e-18 -3.439131e-18 -3.453061e-18 -3.446400e-18
 [519] -3.443198e-18 -3.469568e-18 -3.494614e-18 -3.477646e-18 -3.476268e-18 -3.507703e-18 -3.520423e-18
 [526] -3.517607e-18 -3.508531e-18 -3.525439e-18 -3.558825e-18 -3.550300e-18 -3.537984e-18 -3.560390e-18
 [533] -3.584613e-18 -3.584084e-18 -3.570854e-18 -3.581735e-18 -3.614721e-18 -3.616341e-18 -3.594702e-18
 [540] -3.610321e-18 -3.639606e-18 -3.641524e-18 -3.629327e-18 -3.631485e-18 -3.662813e-18 -3.674618e-18
 [547] -3.651845e-18 -3.655035e-18 -3.684648e-18 -3.695125e-18 -3.680664e-18 -3.675622e-18 -3.701822e-18
 [554] -3.720363e-18 -3.701011e-18 -3.693875e-18 -3.723696e-18 -3.739985e-18 -3.725344e-18 -3.715443e-18
 [561] -3.735613e-18 -3.758931e-18 -3.746281e-18 -3.729296e-18 -3.751282e-18 -3.776533e-18 -3.764661e-18
 [568] -3.746871e-18 -3.762619e-18 -3.791929e-18 -3.787122e-18 -3.762571e-18 -3.775285e-18 -3.806358e-18
 [575] -3.801248e-18 -3.779369e-18 -3.785538e-18 -3.813955e-18 -3.818987e-18 -3.793033e-18 -3.795389e-18
 [582] -3.828253e-18 -3.832134e-18 -3.809452e-18 -3.805000e-18 -3.833904e-18 -3.848236e-18 -3.821094e-18
 [589] -3.813880e-18 -3.844576e-18 -3.856499e-18 -3.835906e-18 -3.823028e-18 -3.847614e-18 -3.871433e-18
 [596] -3.848889e-18 -3.830644e-18 -3.856369e-18 -3.876679e-18 -3.860387e-18 -3.839939e-18 -3.857062e-18
 [603] -3.886013e-18 -3.871800e-18 -3.845931e-18 -3.864243e-18 -3.891104e-18 -3.879580e-18 -3.856686e-18
 [610] -3.865573e-18 -3.895261e-18 -3.890696e-18 -3.859373e-18 -3.865969e-18 -3.897348e-18 -3.894839e-18
 [617] -3.867520e-18 -3.865837e-18 -3.895700e-18 -3.902743e-18 -3.869270e-18 -3.864343e-18 -3.898661e-18
 [624] -3.901212e-18 -3.872784e-18 -3.863709e-18 -3.887999e-18 -3.904311e-18 -3.875530e-18 -3.858252e-18
 [631] -3.887285e-18 -3.900893e-18 -3.874507e-18 -3.855658e-18 -3.874991e-18 -3.897238e-18 -3.875817e-18
 [638] -3.845861e-18 -3.866081e-18 -3.892473e-18 -3.868723e-18 -3.840877e-18 -3.854672e-18 -3.879502e-18
 [645] -3.865788e-18 -3.831068e-18 -3.841686e-18 -3.873407e-18 -3.856613e-18 -3.821804e-18 -3.826614e-18
 [652] -3.855028e-18 -3.849411e-18 -3.811711e-18 -3.810478e-18 -3.842463e-18 -3.838183e-18 -3.800026e-18
 [659] -3.795460e-18 -3.824169e-18 -3.824336e-18 -3.790805e-18 -3.775178e-18 -3.802737e-18 -3.813079e-18
 [666] -3.775188e-18 -3.758951e-18 -3.784111e-18 -3.795136e-18 -3.764453e-18 -3.738203e-18 -3.760877e-18
 [673] -3.780857e-18 -3.747796e-18 -3.718232e-18 -3.739622e-18 -3.756925e-18 -3.731170e-18 -3.700854e-18
 [680] -3.712443e-18 -3.739177e-18 -3.715949e-18 -3.680207e-18 -3.692046e-18 -3.713652e-18 -3.697379e-18
 [687] -3.660974e-18 -3.661729e-18 -3.691322e-18 -3.679805e-18 -3.637713e-18 -3.637582e-18 -3.667598e-18
 [694] -3.658834e-18 -3.619878e-18 -3.611170e-18 -3.640240e-18 -3.641986e-18 -3.597773e-18 -3.584966e-18
 [701] -3.613363e-18 -3.614788e-18 -3.579861e-18 -3.561072e-18 -3.586387e-18 -3.597466e-18 -3.557988e-18
 [708] -3.534620e-18 -3.558828e-18 -3.571405e-18 -3.538831e-18 -3.511745e-18 -3.529210e-18 -3.545577e-18
 [715] -3.519823e-18 -3.487790e-18 -3.500681e-18 -3.524222e-18 -3.497852e-18 -3.464138e-18 -3.475043e-18
 [722] -3.498099e-18 -3.481170e-18 -3.440649e-18 -3.444965e-18 -3.474265e-18 -3.458326e-18 -3.418579e-18
 [729] -3.420284e-18 -3.448696e-18 -3.438522e-18 -3.399117e-18 -3.393391e-18 -3.421991e-18 -3.417501e-18
 [736] -3.375761e-18 -3.367663e-18 -3.394551e-18 -3.394084e-18 -3.355921e-18 -3.341225e-18 -3.369496e-18
 [743] -3.374607e-18 -3.337419e-18 -3.317273e-18 -3.339047e-18 -3.349673e-18 -3.315552e-18 -3.290963e-18
 [750] -3.309607e-18 -3.325535e-18 -3.297007e-18 -3.264553e-18 -3.282435e-18 -3.302458e-18 -3.274122e-18
 [757] -3.242495e-18 -3.253440e-18 -3.274276e-18 -3.253354e-18 -3.215685e-18 -3.221369e-18 -3.247298e-18
 [764] -3.230269e-18 -3.192224e-18 -3.192993e-18 -3.219897e-18 -3.210047e-18 -3.168961e-18 -3.166062e-18
 [771] -3.192312e-18 -3.183125e-18 -3.144648e-18 -3.135422e-18 -3.159827e-18 -3.159739e-18 -3.123894e-18
 [778] -3.109910e-18 -3.134923e-18 -3.137399e-18 -3.099450e-18 -3.082883e-18 -3.105908e-18 -3.115820e-18
 [785] -3.081935e-18 -3.055493e-18 -3.076468e-18 -3.089538e-18 -3.058905e-18 -3.034233e-18 -3.050271e-18
 [792] -3.067304e-18 -3.042403e-18 -3.012477e-18 -3.025724e-18 -3.047652e-18 -3.023468e-18 -2.986936e-18
 [799] -2.998894e-18 -3.022991e-18 -3.007420e-18 -2.974068e-18 -2.975691e-18 -3.004542e-18 -2.993496e-18
 [806] -2.958937e-18 -2.957755e-18 -2.979899e-18 -2.978732e-18 -2.943953e-18 -2.934415e-18 -2.963346e-18
 [813] -2.966669e-18 -2.931142e-18 -2.919243e-18 -2.946725e-18 -2.953320e-18 -2.923942e-18 -2.907211e-18
 [820] -2.928592e-18 -2.943587e-18 -2.913109e-18 -2.892817e-18 -2.916664e-18 -2.931457e-18 -2.908653e-18
 [827] -2.885459e-18 -2.901759e-18 -2.925350e-18 -2.903764e-18 -2.875607e-18 -2.894580e-18 -2.916500e-18
 [834] -2.898451e-18 -2.874297e-18 -2.881457e-18 -2.906966e-18 -2.899187e-18 -2.867804e-18 -2.876407e-18
 [841] -2.904964e-18 -2.898584e-18 -2.871228e-18 -2.869741e-18 -2.898633e-18 -2.900242e-18 -2.867762e-18
 [848] -2.867102e-18 -2.896014e-18 -2.899108e-18 -2.874381e-18 -2.866186e-18 -2.890691e-18 -2.905300e-18
 [855] -2.881181e-18 -2.865218e-18 -2.892778e-18 -2.908378e-18 -2.884519e-18 -2.870242e-18 -2.891806e-18
 [862] -2.914300e-18 -2.894320e-18 -2.872212e-18 -2.895128e-18 -2.919036e-18 -2.903641e-18 -2.883455e-18
 [869] -2.898433e-18 -2.923949e-18 -2.916460e-18 -2.890858e-18 -2.902585e-18 -2.933752e-18 -2.925619e-18
 [876] -2.901755e-18 -2.909135e-18 -2.938896e-18 -2.942229e-18 -2.915820e-18 -2.917664e-18 -2.949701e-18
 [883] -2.955421e-18 -2.928446e-18 -2.927606e-18 -2.958754e-18 -2.967847e-18 -2.946659e-18 -2.938638e-18
 [890] -2.969997e-18 -2.987397e-18 -2.961839e-18 -2.955562e-18 -2.983048e-18 -2.999124e-18 -2.983915e-18
 [897] -2.968957e-18 -2.993287e-18 -3.018440e-18 -3.002069e-18 -2.987717e-18 -3.011065e-18 -3.036963e-18
 [904] -3.026983e-18 -3.007207e-18 -3.026518e-18 -3.057320e-18 -3.049757e-18 -3.029282e-18 -3.043385e-18
 [911] -3.076742e-18 -3.076230e-18 -3.054350e-18 -3.063577e-18 -3.098892e-18 -3.105481e-18 -3.082211e-18
 [918] -3.088202e-18 -3.122085e-18 -3.132087e-18 -3.111222e-18 -3.112847e-18 -3.147935e-18 -3.161161e-18
 [925] -3.142392e-18 -3.140785e-18 -3.174890e-18 -3.194839e-18 -3.179570e-18 -3.172138e-18 -3.202178e-18
 [932] -3.230074e-18 -3.213654e-18 -3.202567e-18 -3.233487e-18 -3.262332e-18 -3.253668e-18 -3.241080e-18
 [939] -3.267239e-18 -3.299735e-18 -3.296094e-18 -3.280646e-18 -3.299809e-18 -3.337970e-18 -3.337159e-18
 [946] -3.318591e-18 -3.338626e-18 -3.373068e-18 -3.379044e-18 -3.365250e-18 -3.374527e-18 -3.413425e-18
 [953] -3.425940e-18 -3.405930e-18 -3.416179e-18 -3.456189e-18 -3.469823e-18 -3.452820e-18 -3.454139e-18
 [960] -3.491639e-18 -3.515448e-18 -3.498750e-18 -3.497532e-18 -3.537944e-18 -3.560837e-18 -3.547357e-18
 [967] -3.544897e-18 -3.574418e-18 -3.606304e-18 -3.597368e-18 -3.582815e-18 -3.617292e-18 -3.648781e-18
 [974] -3.641178e-18 -3.634610e-18 -3.657906e-18 -3.693414e-18 -3.693891e-18 -3.676057e-18 -3.699009e-18
 [981] -3.739058e-18 -3.737266e-18 -3.722160e-18 -3.741761e-18 -3.775167e-18 -3.786966e-18 -3.770152e-18
 [988] -3.777503e-18 -3.824569e-18 -3.835306e-18 -3.814705e-18 -3.825354e-18 -3.860983e-18 -3.880884e-18
 [995] -3.864703e-18 -3.860612e-18 -3.902815e-18 -3.925970e-18 -3.905986e-18 -3.907975e-18
 [ reached getOption("max.print") -- omitted 16776216 entries ]

5. Також з «strain/Strain» зчитайте атрибут (функція h5readAttributes) Xspacing в змінну st та виведіть її. Це інтервал часу між вимірами.

> stlist <- h5readAttributes(ligo1, name = "strain/Strain")
> stlist
$Npoints
[1] 16777216

$Xlabel
[1] "GPS time"

$Xspacing
[1] 0.0002441406

$Xstart
[1] 1187006834

$Xunits
[1] "second"

$Ylabel
[1] "Strain"

$Yunits
[1] ""

> st <- stlist$Xspacing
> st
[1] 0.0002441406

6. Знайдіть час початку події та її тривалість. Для цього з групи meta зчитайте в змінну gpsStart name GPSstart та в змінну duration name Duration.

> gpsStart <- h5read(ligo1, name = "meta/GPSstart")
> gpsStart
[1] 1187006834
> duration <- h5read(ligo1, name = "meta/Duration")
> duration
[1] 4096

7. Знайдіть час закінчення події та збережіть його в змінну gpsEnd.

> gpsEnd <- gpsStart + duration
> gpsEnd
[1] 1187010930

8. Створіть вектор з часу вимірів і збережіть у змінну myTime. Початок послідовності – gpsStart, кінець – gpsEnd, крок – st.

> myTime <- seq(gpsStart, gpsEnd, st)
> myTime
   [1] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
  [10] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
  [19] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
  [28] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
  [37] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
  [46] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
  [55] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
  [64] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
  [73] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
  [82] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
  [91] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [100] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [109] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [118] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [127] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [136] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [145] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [154] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [163] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [172] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [181] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [190] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [199] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [208] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [217] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [226] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [235] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [244] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [253] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [262] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [271] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [280] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [289] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [298] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [307] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [316] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [325] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [334] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [343] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [352] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [361] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [370] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [379] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [388] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [397] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [406] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [415] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [424] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [433] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [442] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [451] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [460] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [469] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [478] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [487] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [496] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [505] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [514] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [523] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [532] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [541] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [550] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [559] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [568] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [577] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [586] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [595] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [604] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [613] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [622] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [631] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [640] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [649] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [658] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [667] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [676] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [685] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [694] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [703] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [712] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [721] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [730] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [739] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [748] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [757] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [766] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [775] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [784] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [793] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [802] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [811] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [820] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [829] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [838] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [847] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [856] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [865] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [874] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [883] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [892] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [901] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [910] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [919] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [928] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [937] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [946] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [955] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [964] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [973] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [982] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
 [991] 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834 1187006834
[1000] 1187006834
 [ reached getOption("max.print") -- omitted 16776217 entries ]

9. Побудуємо графік тільки для першого мільйону вимірів. Для цього створіть змінну numSamples, яка дорівнює 1000000.

> numSamples <- 1000000
> numSamples
[1] 1e+06

10. Побудуйте графік за допомогою функції plot(myTime[0:numSamples], strain[0:numSamples], type = "l", xlab = "GPS Time (s)", ylab = "H1 Strain")

> plot(myTime[0:numSamples], strain[0:numSamples], type = "l", xlab = "GPS Time (s)", ylab = "H1 Strain")

function (x, y, ...) 
UseMethod("plot")
<bytecode: 0x0000029d9a435e60>
<environment: namespace:graphics>
*графік прикріплений до листа в пошті.