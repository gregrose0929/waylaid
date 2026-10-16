-- Towns (population >= 15,000) used to pull lost letters somewhere reachable.
-- Data: GeoNames (https://www.geonames.org), CC BY 4.0. 34165 places, split over two files
-- so each is small enough to paste into the Supabase SQL editor.
-- Format per line: label|lat|lng

create table public.towns (
  id        serial primary key,
  label     text not null,
  location  extensions.geography(Point, 4326) not null
);
alter table public.towns enable row level security;
create index towns_location_idx on public.towns using gist (location);

insert into public.towns (label, location)
select parts[1],
       extensions.ST_SetSRID(extensions.ST_MakePoint(parts[3]::float8, parts[2]::float8), 4326)::extensions.geography
from (select string_to_array(line, '|') as parts
      from regexp_split_to_table($towns$les Escaldes, AD|42.507|1.534
Andorra la Vella, AD|42.508|1.521
Warisan, AE|25.167|55.407
Umm Suqaym, AE|25.155|55.210
Umm Al Quwain City, AE|25.565|55.555
Tarif Kalba, AE|25.070|56.331
Ar Rashidiyah, AE|25.225|55.389
Ras Al Khaimah, AE|25.790|55.943
Zayed City, AE|23.654|53.705
Khawr Fakkan, AE|25.331|56.342
Kalba, AE|25.051|56.354
Jumayra, AE|25.208|55.250
Dubai, AE|25.077|55.309
Dibba Al-Fujairah, AE|25.592|56.262
Dibba Al-Hisn, AE|25.620|56.273
Dayrah, AE|25.271|55.302
Sharjah, AE|25.334|55.412
Ar Ruways, AE|24.110|52.731
Hatta, AE|24.801|56.127
Fujairah, AE|25.116|56.341
Al Ain City, AE|24.192|55.761
Ajman, AE|25.402|55.479
Adh Dhayd, AE|25.288|55.882
Abu Dhabi, AE|24.451|54.397
Abu Hayl, AE|25.284|55.332
As Satwah, AE|25.222|55.275
Al Hamidiyah, AE|25.400|55.529
Al Waheda, AE|25.292|55.338
Al Karama, AE|25.240|55.301
Al Wasl, AE|25.199|55.256
The Palm Jumeirah, AE|25.116|55.135
Bur Dubai, AE|25.260|55.299
Khalifah A City, AE|24.426|54.605
Mirdif, AE|25.224|55.414
Hawr al Anz, AE|25.277|55.337
Mankhul, AE|25.246|55.292
Nayf, AE|25.271|55.303
Al Murar al Qadim, AE|25.276|55.307
Al Warqaa, AE|25.193|55.420
International City, AE|25.164|55.410
Dubai Marina, AE|25.085|55.146
Dubai Internet City, AE|25.095|55.162
Al Safa, AE|25.170|55.233
Ar Rumaylah, AE|25.403|55.433
Al Jurf, AE|25.418|55.508
Al Majaz, AE|25.324|55.388
Dubai Festival City, AE|25.222|55.357
Dubai International Financial Centre, AE|25.211|55.278
Dubai Investments Park, AE|25.008|55.157
Jebel Ali, AE|25.003|55.108
Bani Yas City, AE|24.310|54.629
Musaffah, AE|24.359|54.483
Al Shamkhah City, AE|24.393|54.708
Reef Al Fujairah City, AE|25.145|56.248
Al Badaa, AE|25.225|55.269
Al Muteena, AE|25.274|55.323
Al Mizhar First, AE|25.248|55.441
Dubai Silicon Oasis, AE|25.120|55.387
Al Furjan, AE|25.027|55.146
Business Bay, AE|25.185|55.270
Al Qusais 1, AE|25.279|55.370
Halwan, AE|25.346|55.422
Al Sajaah, AE|25.315|55.632
Lahbab, AE|25.038|55.591
Mohammed Bin Zayed City, AE|24.348|54.554
Zaranj, AF|30.960|61.860
Bazar-e Yakawlang, AF|34.735|66.974
Taloqan, AF|36.736|69.535
Shindand, AF|33.303|62.147
Shibirghan, AF|36.668|65.753
Shahrak, AF|34.107|64.305
Sar-e Pul, AF|36.215|65.932
Sang-e Charak, AF|35.850|66.437
Aibak, AF|36.265|68.016
Rustaq, AF|37.126|69.830
Qarqin, AF|37.419|66.044
Qarawul, AF|37.220|68.780
Pul-e Khumri, AF|35.945|68.715
Paghman, AF|34.588|68.951
Nili, AF|33.722|66.130
Nahrin, AF|36.065|69.133
Maymana, AF|35.921|64.784
Mehtar Lam, AF|34.671|70.209
Mazar-e Sharif, AF|36.709|67.111
Lashkar Gah, AF|31.594|64.372
Kushk, AF|33.296|61.952
Kunduz, AF|36.729|68.857
Khost, AF|33.340|69.920
Khulm, AF|36.697|67.698
Khash, AF|31.529|62.791
Khan Neshin, AF|30.549|63.789
Khanabad, AF|36.683|69.113
Karukh, AF|34.481|62.586
Kandahar, AF|31.613|65.710
Kabul, AF|34.528|69.172
Jurm, AF|36.865|70.834
Jalalabad, AF|34.426|70.452
Jabal os Saraj, AF|35.118|69.238
Herat, AF|34.348|62.200
Ghormach, AF|35.731|63.783
Ghazni, AF|33.554|68.421
Gereshk, AF|31.821|64.570
Gardez, AF|33.597|69.226
Fayzabad, AF|37.117|70.580
Farah, AF|32.375|62.116
Istalif, AF|34.833|69.078
Eslam Qaleh, AF|34.667|61.067
Charikar, AF|35.014|69.171
Baraki Barak, AF|33.967|68.949
Bamyan, AF|34.822|67.827
Balkh, AF|36.756|66.897
Baharak, AF|37.003|70.907
Bagram, AF|34.967|69.265
Baghlan, AF|36.131|68.708
Art Khwajah, AF|37.086|69.480
Asmar, AF|35.033|71.358
Asadabad, AF|34.873|71.147
Andkhoy, AF|36.953|65.124
Bazarak, AF|35.313|69.515
Markaz-e Woluswali-ye Achin, AF|34.126|70.708
Saint Johns, AG|17.121|-61.843
The Valley, AI|18.217|-63.058
Sarande, AL|39.875|20.005
Pogradec, AL|40.903|20.652
Librazhd, AL|41.179|20.315
Kukes, AL|42.077|20.422
Korce, AL|40.619|20.781
Gjirokaster, AL|40.076|20.139
Elbasan, AL|41.111|20.082
Bulqize, AL|41.492|20.222
Vlore, AL|40.470|19.484
Tirana, AL|41.327|19.819
Shkoder, AL|42.068|19.513
Rrashbull, AL|41.323|19.510
Peqin, AL|41.046|19.751
Patos Fshat, AL|40.643|19.651
Patos, AL|40.683|19.619
Lushnje, AL|40.942|19.705
Lezhe, AL|41.784|19.644
Kucove, AL|40.800|19.917
Kruje, AL|41.509|19.793
Kavaje, AL|41.186|19.557
Fushe-Kruje, AL|41.478|19.718
Fier-Cifci, AL|40.717|19.567
Fier, AL|40.725|19.558
Durres, AL|41.324|19.455
Berat, AL|40.706|19.952
Kapan, AM|39.208|46.407
Goris, AM|39.511|46.342
Artashat, AM|39.955|44.549
Ararat, AM|39.855|44.695
Yerevan, AM|40.178|44.513
Vagharshapat, AM|40.166|44.295
Sevan, AM|40.548|44.953
Masis, AM|40.066|44.437
Vanadzor, AM|40.807|44.497
Gavar, AM|40.354|45.124
Ijevan, AM|40.880|45.148
Hrazdan, AM|40.517|44.756
Armavir, AM|40.156|44.039
Gyumri, AM|40.793|43.846
Dilijan, AM|40.740|44.863
Davtashen, AM|40.216|44.481
Charentsavan, AM|40.403|44.644
Avan, AM|40.214|44.578
Ashtarak, AM|40.298|44.362
Artik, AM|40.619|43.972
Abovyan, AM|40.272|44.633
Erebuni, AM|40.133|44.530
Nor Nork, AM|40.197|44.567
Ajapnyak, AM|40.199|44.471
Kanaker-Zeytun, AM|40.220|44.538
Malatia-Sebastia, AM|40.174|44.446
Kentron, AM|40.178|44.513
Shengavit, AM|40.156|44.478
Arabkir, AM|40.206|44.504
Saurimo, AO|-9.661|20.392
Lucapa, AO|-8.419|20.745
Dundo, AO|-7.366|20.816
Chitato, AO|-7.300|20.733
Cassanguidi, AO|-7.484|21.303
Lumbala, AO|-14.102|21.435
Luau, AO|-10.707|22.225
Cazombo, AO|-11.899|22.902
Nzagi, AO|-8.385|15.301
Viana, AO|-8.906|13.375
Uige, AO|-7.609|15.061
Ucua, AO|-8.652|14.157
Tomboco, AO|-6.805|13.330
Soyo, AO|-6.135|12.369
Songo, AO|-7.352|14.846
Sanza Pombo, AO|-7.315|16.002
Piri, AO|-8.534|14.436
Pango Aluquem, AO|-8.713|14.463
Nzeto, AO|-7.228|12.870
Negage, AO|-7.759|15.272
Ndalatando, AO|-9.298|14.912
Muxaluando, AO|-8.123|14.288
Mussende, AO|-10.514|16.020
Mbanza Kongo, AO|-6.267|14.238
Maquela do Zombo, AO|-6.057|15.110
Malanje, AO|-9.540|16.341
Maianga, AO|-8.847|13.237
Mabubas, AO|-8.524|13.686
Lucala, AO|-9.273|15.252
Lubalo, AO|-9.154|19.281
Luanda, AO|-8.837|13.234
Kunda dya Baze, AO|-8.908|17.053
Benfica, AO|-8.944|13.164
Gombe, AO|-8.124|14.291
Golungo Alto, AO|-9.133|14.767
Dondo, AO|-9.685|14.428
Dondo, AO|-9.050|15.317
Cuimba, AO|-6.121|14.621
Cuilo, AO|-8.236|19.526
Cuango-Luzamba, AO|-9.146|18.045
Cazombo, AO|-8.732|15.371
Caxito, AO|-8.578|13.664
Cangandala, AO|-9.783|16.433
Canacassala, AO|-8.163|14.117
Camabatela, AO|-8.188|15.375
Calumbo, AO|-9.147|13.419
Cage Mazumbo, AO|-8.300|14.345
Cacuso, AO|-9.421|15.747
Cacuaco, AO|-8.780|13.375
Cabinda, AO|-5.562|12.195
Bula Atumba, AO|-8.674|14.797
Buco Zau, AO|-4.767|12.550
Belize, AO|-4.650|12.767
Barra do Dande, AO|-8.472|13.370
Bailundo, AO|-9.575|15.994
Gama, AO|-8.568|13.476
Cazenga, AO|-8.838|13.284
Golfe, AO|-8.866|13.262
Camama, AO|-8.936|13.265
Talatona, AO|-8.918|13.186
Xangongo, AO|-16.744|14.975
Alto Hama, AO|-12.233|15.550
Virei, AO|-15.727|12.950
Ucuma, AO|-12.961|15.060
Ucu Seles, AO|-11.412|14.307
Tombua, AO|-15.804|11.845
Sumbe, AO|-11.206|13.844
Quipungo, AO|-14.819|14.535
Quibala, AO|-10.734|14.980
Porto Amboim, AO|-10.733|13.768
Ondjiva, AO|-17.067|15.733
Nharea, AO|-11.475|16.965
Mossamedes, AO|-15.196|12.152
Mungo, AO|-11.833|16.236
Menongue, AO|-14.659|17.691
Matala, AO|-14.733|15.035
Luquembo, AO|-10.739|17.718
Luena, AO|-11.783|19.917
Lubango, AO|-14.917|13.492
Longonjo, AO|-12.908|15.248
Londuimbali, AO|-12.237|15.317
Lobito, AO|-12.364|13.536
Cuito, AO|-12.383|16.933
Catchiungo, AO|-12.566|16.226
Humbe, AO|-16.686|14.903
Huambo, AO|-12.776|15.739
Ganda, AO|-13.016|14.635
Gabela, AO|-10.851|14.380
Ecunna, AO|-12.679|15.506
Dombe Grande, AO|-12.952|13.102
Cuemba, AO|-12.150|18.083
Cubal do Lumbo, AO|-12.313|14.127
Cubal, AO|-13.039|14.245
Conda, AO|-11.109|14.336
Chitembo, AO|-13.550|16.633
Chinguar, AO|-12.557|16.338
Chindumbo, AO|-11.950|14.467
Cela, AO|-11.422|15.123
Catumbela, AO|-12.430|13.547
Catabola, AO|-12.150|17.283
Capunda, AO|-11.133|14.467
Camucuio, AO|-14.114|13.241
Cambundi Catembo, AO|-10.075|17.551
Camacupa, AO|-12.017|17.483
Caluquembe, AO|-13.867|14.433
Calulo, AO|-10.001|14.895
Cahama, AO|-16.286|14.310
Caala, AO|-12.852|15.561
Bocoio, AO|-12.470|14.137
Benguela, AO|-12.577|13.403
Balombo, AO|-12.354|14.772
Baia Farta, AO|-12.604|13.197
Andulo, AO|-11.487|16.697
Cambundi, AO|-7.469|17.038
Kikolo, AO|-8.781|13.334
Cafunfo, AO|-8.767|17.996
Santa Clara, AO|-10.192|15.434
Quissecula, AO|-11.392|15.092
Cambundi, AO|-10.895|17.764
Mulenvos, AO|-8.867|13.334
Kilamba, AO|-8.849|13.275
Ingombota, AO|-8.818|13.229
Nova Vida, AO|-8.906|13.222
Zango, AO|-9.012|13.384
Vila Flor, AO|-8.980|13.308
Rangel, AO|-8.826|13.263
Samba, AO|-8.880|13.196
Sambizanga, AO|-8.789|13.275
Navegantes, AO|-12.590|13.391
Kima Kieza, AO|-8.834|13.295
Panguila, AO|-8.693|13.449
Ramiros, AO|-9.063|13.046
Hoji ya Henda, AO|-8.805|13.290
Zarate, AR|-34.096|-59.024
Colonia Wanda, AR|-25.973|-54.563
Villa Ortuzar, AR|-34.580|-58.468
Villa Ocampo, AR|-28.487|-59.354
Villa Lugano, AR|-34.679|-58.473
Villaguay, AR|-31.868|-59.027
Villa Gesell, AR|-37.264|-56.973
Villa de Mayo, AR|-34.511|-58.681
Valentin Alsina, AR|-34.671|-58.409
Tristan Suarez, AR|-34.890|-58.568
Tortuguitas, AR|-34.475|-58.754
Tigre, AR|-34.426|-58.580
Tandil, AR|-37.329|-59.137
Sarandi, AR|-34.682|-58.346
San Vicente, AR|-35.025|-58.424
San Vicente, AR|-26.617|-54.133
Santo Tome, AR|-28.551|-56.041
Santos Lugares, AR|-34.603|-58.541
Santa Teresita, AR|-36.541|-56.693
Santa Elena, AR|-30.944|-59.788
Santa Clara del Mar, AR|-37.834|-57.507
San Pedro, AR|-33.679|-59.666
San Pedro, AR|-26.622|-54.109
San Miguel del Monte, AR|-35.439|-58.807
San Luis del Palmar, AR|-27.508|-58.556
San Lorenzo, AR|-28.134|-58.767
San Justo, AR|-34.681|-58.564
San Javier, AR|-30.581|-59.930
San Isidro, AR|-34.470|-58.521
San Antonio de Padua, AR|-34.663|-58.698
San Antonio de Areco, AR|-34.251|-59.469
Saladillo, AR|-35.639|-59.779
Saladas, AR|-28.255|-58.624
Retiro, AR|-34.583|-58.383
Resistencia, AR|-27.464|-58.987
Remedios de Escalada de San Martin, AR|-34.726|-58.397
Reconquista, AR|-29.150|-59.650
Quilmes, AR|-34.721|-58.255
Puerto Rico, AR|-26.809|-55.021
Puerto Iguazu, AR|-25.599|-54.574
Puerto Esperanza, AR|-26.023|-54.614
Posadas, AR|-27.392|-55.924
Pontevedra, AR|-34.749|-58.702
Pirane, AR|-25.733|-59.110
Pinamar, AR|-37.111|-56.865
Pilar, AR|-34.459|-58.914
Paso de los Libres, AR|-29.713|-57.088
Palermo, AR|-34.589|-58.431
Obera, AR|-27.487|-55.120
Nogoya, AR|-32.394|-59.790
Necochea, AR|-38.554|-58.740
Navarro, AR|-35.006|-59.278
Muniz, AR|-34.556|-58.707
Moron, AR|-34.651|-58.622
Monte Chingolo, AR|-34.730|-58.354
Monte Caseros, AR|-30.252|-57.635
Montecarlo, AR|-26.568|-54.758
Miramar, AR|-38.272|-57.839
Merlo, AR|-34.665|-58.727
Mercedes, AR|-34.651|-59.431
Mercedes, AR|-29.184|-58.075
Haedo, AR|-34.642|-58.592
Mar del Tuyu, AR|-36.574|-56.694
Mar del Plata, AR|-38.000|-57.556
Mar de Ajo, AR|-36.729|-56.683
Magdalena, AR|-35.080|-57.514
Lujan, AR|-34.566|-59.115
Los Polvorines, AR|-34.503|-58.706
Lomas de Zamora, AR|-34.757|-58.403
Lobos, AR|-35.185|-59.098
Leandro N. Alem, AR|-27.604|-55.324
Las Flores, AR|-36.014|-59.100
La Plata, AR|-34.921|-57.954
La Paz, AR|-30.742|-59.645
Lanus, AR|-34.708|-58.391
Laferrere, AR|-34.750|-58.585
Jardin America, AR|-27.043|-55.227
Ituzaingo, AR|-27.585|-56.687
Isidro Casanova, AR|-34.700|-58.587
Hurlingham, AR|-34.590|-58.629
Gualeguaychu, AR|-33.008|-58.518
Gualeguay, AR|-33.141|-59.313
Goya, AR|-29.140|-59.263
Gobernador Virasora, AR|-28.050|-56.033
General Pacheco, AR|-34.453|-58.643
General Juan Madariaga, AR|-37.002|-57.136
General Jose de San Martin, AR|-26.536|-59.341
General Belgrano, AR|-35.768|-58.494
Garupa, AR|-27.483|-55.829
Formosa, AR|-26.185|-58.173
Fontana, AR|-27.420|-59.037
Federal, AR|-30.956|-58.780
Ezeiza, AR|-34.854|-58.525
Esquina, AR|-30.015|-59.529
Ensenada, AR|-34.861|-57.912
El Soberbio, AR|-27.297|-54.198
El Palomar, AR|-34.618|-58.602
Eldorado, AR|-26.405|-54.618
Don Torcuato, AR|-34.495|-58.627
Dolores, AR|-36.315|-57.675
Curuzu Cuatia, AR|-29.791|-58.050
Corrientes, AR|-27.468|-58.834
Concordia, AR|-31.392|-58.017
Concepcion del Uruguay, AR|-32.485|-58.232
Colon, AR|-32.223|-58.144
Colegiales, AR|-34.574|-58.449
Chascomus, AR|-35.577|-58.012
Chajari, AR|-30.755|-57.982
Castelar, AR|-34.651|-58.641
Carmen de Areco, AR|-34.377|-59.823
Canuelas, AR|-35.054|-58.762
Campana, AR|-34.163|-58.959
Burzaco, AR|-34.826|-58.395
Buenos Aires, AR|-34.613|-58.377
Coronel Brandsen, AR|-35.168|-58.237
Boedo, AR|-34.633|-58.417
Berisso, AR|-34.871|-57.883
Berazategui, AR|-34.765|-58.213
Benito Juarez, AR|-37.672|-59.807
Bella Vista, AR|-34.565|-58.690
Belgrano, AR|-34.563|-58.458
Barranqueras, AR|-27.481|-58.939
Barracas, AR|-34.650|-58.383
Baradero, AR|-33.812|-59.505
Banfield, AR|-34.746|-58.394
Balcarce, AR|-37.846|-58.255
Azul, AR|-36.778|-59.858
Ayacucho, AR|-37.153|-58.488
Avellaneda, AR|-29.118|-59.658
Apostoles, AR|-27.914|-55.754
Zapala, AR|-38.901|-70.067
Yerba Buena, AR|-26.813|-65.295
Villa Regina, AR|-39.096|-67.084
Villa Paula de Sarmiento, AR|-31.493|-68.538
Villa Nueva, AR|-32.433|-63.248
Villa Maria, AR|-32.408|-63.240
Villa Dolores, AR|-31.945|-65.190
Villa del Rosario, AR|-31.554|-63.536
Villa Constitucion, AR|-33.228|-60.330
Villa Carlos Paz, AR|-31.418|-64.490
Villa Angela, AR|-27.577|-60.711
Villa Allende, AR|-31.294|-64.298
Viedma, AR|-40.815|-63.000
Victoria, AR|-32.618|-60.155
Vera, AR|-29.460|-60.213
Venado Tuerto, AR|-33.746|-61.967
Veinticinco de Mayo, AR|-35.432|-60.172
Ushuaia, AR|-54.811|-68.316
Unquillo, AR|-31.237|-64.312
Tupungato, AR|-33.369|-69.148
Tunuyan, AR|-33.581|-69.015
Tres Isletas, AR|-26.341|-60.432
Tres Arroyos, AR|-38.377|-60.276
Trenque Lauquen, AR|-35.973|-62.733
Trelew, AR|-43.249|-65.305
Tostado, AR|-29.233|-61.769
Toay, AR|-36.674|-64.380
Termas de Rio Hondo, AR|-27.494|-64.860
Tartagal, AR|-22.517|-63.806
Tafi Viejo, AR|-26.733|-65.261
Sunchales, AR|-30.945|-61.560
Santo Tome, AR|-31.663|-60.765
Santiago del Estero, AR|-27.800|-64.263
Santa Rosa, AR|-36.616|-64.290
Santa Rosa, AR|-23.394|-64.425
Santa Maria, AR|-26.695|-66.048
Santa Lucia, AR|-31.541|-68.498
Santa Fe, AR|-31.649|-60.709
San Salvador de Jujuy, AR|-24.193|-65.293
San Ramon de la Nueva Oran, AR|-23.137|-64.324
San Rafael, AR|-34.615|-68.332
San Pedro de Jujuy, AR|-24.231|-64.866
San Nicolas de los Arroyos, AR|-33.334|-60.211
San Miguel de Tucuman, AR|-26.816|-65.211
San Martin de los Andes, AR|-40.158|-71.353
San Martin, AR|-33.083|-68.473
Villa General San Martin, AR|-31.440|-68.520
San Luis, AR|-33.291|-66.325
San Lorenzo, AR|-24.736|-65.487
San Justo, AR|-30.790|-60.593
San Juan, AR|-31.537|-68.526
San Jorge, AR|-31.897|-61.860
San Isidro, AR|-28.458|-65.725
San Francisco, AR|-31.425|-62.084
Catamarca, AR|-28.470|-65.785
San Carlos de Bolivar, AR|-36.231|-61.116
San Antonio Oeste, AR|-40.732|-64.948
Salto, AR|-34.292|-60.255
Salta, AR|-24.806|-65.420
Rufino, AR|-34.262|-62.711
Rosario de Lerma, AR|-24.986|-65.578
Rosario de la Frontera, AR|-25.799|-64.974
Rosario, AR|-32.947|-60.639
Rojas, AR|-34.198|-60.734
Rodeo del Medio, AR|-32.995|-68.686
Rivadavia, AR|-33.191|-68.462
Rio Tercero, AR|-32.177|-64.113
Rio Segundo, AR|-31.650|-63.912
Rio Grande, AR|-53.788|-67.710
Rio Gallegos, AR|-51.625|-69.252
Rio Cuarto, AR|-33.130|-64.353
Rio Colorado, AR|-38.991|-64.096
Rio Ceballos, AR|-31.170|-64.317
Rawson, AR|-43.300|-65.106
Ramallo, AR|-33.485|-60.006
Rafaela, AR|-31.253|-61.491
Quitilipi, AR|-26.871|-60.215
Punta Alta, AR|-38.880|-62.075
Puerto Madryn, AR|-42.768|-65.038
Puerto Deseado, AR|-47.751|-65.897
Profesor Salvador Mazza, AR|-22.049|-63.691
Presidencia Roque Saenz Pena, AR|-26.791|-60.441
Pocito, AR|-31.683|-68.583
Plottier, AR|-38.967|-68.233
Pilar, AR|-31.681|-63.882
Piguee, AR|-37.603|-62.408
Pico Truncado, AR|-46.799|-67.958
Pichanal, AR|-23.316|-64.218
Pergamino, AR|-33.891|-60.575
Perez, AR|-32.998|-60.768
Perdriel, AR|-33.075|-68.888
Pehuajo, AR|-35.811|-61.899
Parana, AR|-31.733|-60.529
Palpala, AR|-24.258|-65.214
Olavarria, AR|-36.894|-60.323
Nueve de Julio, AR|-35.444|-60.885
Neuquen, AR|-38.951|-68.059
Morteros, AR|-30.711|-62.007
Monteros, AR|-27.168|-65.499
San Jose de Metan, AR|-25.497|-64.971
Mendoza, AR|-32.889|-68.846
Marcos Juarez, AR|-32.698|-62.107
Malarguee, AR|-35.478|-69.585
Machagai, AR|-26.926|-60.049
Lincoln, AR|-34.868|-61.529
Libertador General San Martin, AR|-23.813|-64.794
Las Varillas, AR|-31.870|-62.720
Las Heras, AR|-46.541|-68.932
Las Brenas, AR|-27.088|-61.082
La Rioja, AR|-29.413|-66.856
La Falda, AR|-31.093|-64.484
La Calera, AR|-31.346|-64.338
Laboulaye, AR|-34.127|-63.391
Junin, AR|-34.594|-60.946
Joaquin V. Gonzalez, AR|-25.114|-64.126
Jesus Maria, AR|-30.982|-64.094
Granadero Baigorria, AR|-32.857|-60.718
Gobernador Galvez, AR|-33.030|-60.640
General Villegas, AR|-35.033|-63.015
Los Toldos, AR|-35.000|-61.039
General Roca, AR|-39.033|-67.583
General Pinedo, AR|-27.325|-61.281
General Pico, AR|-35.659|-63.758
General Gueemes, AR|-24.674|-65.047
General Mosconi, AR|-22.596|-63.811
General Alvear, AR|-34.977|-67.696
General Acha, AR|-37.378|-64.604
Galvez, AR|-32.030|-61.221
Firmat, AR|-33.459|-61.483
Famailla, AR|-27.055|-65.402
Esquel, AR|-42.911|-71.319
Esperanza, AR|-31.450|-60.932
Embarcacion, AR|-23.210|-64.100
Embalse, AR|-32.207|-64.401
El Calafate, AR|-50.341|-72.277
El Bolson, AR|-41.961|-71.533
Diamante, AR|-32.067|-60.643
Dean Funes, AR|-30.425|-64.353
Cutral-Co, AR|-38.934|-69.231
Cruz del Eje, AR|-30.726|-64.804
Crespo, AR|-32.031|-60.306
Cosquin, AR|-31.245|-64.466
Coronel Suarez, AR|-37.459|-61.933
Coronel Pringles, AR|-37.986|-61.350
Coronda, AR|-31.974|-60.919
Cordoba, AR|-31.406|-64.189
Comodoro Rivadavia, AR|-45.863|-67.494
Colonia Caroya, AR|-31.022|-64.062
Colon, AR|-33.897|-61.099
Cipolletti, AR|-38.934|-67.990
Cinco Saltos, AR|-38.822|-68.063
Chivilcoy, AR|-34.897|-60.019
Chimbas, AR|-31.493|-68.533
Chilecito, AR|-29.162|-67.499
Charata, AR|-27.218|-61.187
Chacabuco, AR|-34.642|-60.471
San Jose de los Cerrillos, AR|-24.897|-65.484
Centenario, AR|-38.830|-68.132
Caucete, AR|-31.651|-68.282
Catriel, AR|-37.876|-67.795
Juan Jose Castelli, AR|-25.947|-60.620
Casilda, AR|-33.045|-61.164
Carmen de Patagones, AR|-40.803|-62.983
Carlos Casares, AR|-35.622|-61.365
Carcarana, AR|-32.857|-61.151
Capitan Bermudez, AR|-32.823|-60.719
Canada de Gomez, AR|-32.820|-61.395
Caleta Olivia, AR|-46.448|-67.523
Cafayate, AR|-26.073|-65.978
Bragado, AR|-35.116|-60.490
Bell Ville, AR|-32.630|-62.689
Bella Vista, AR|-27.034|-65.302
Belen, AR|-27.650|-67.026
Bahia Blanca, AR|-38.718|-62.265
Arroyo Seco, AR|-33.154|-60.512
Arroyito, AR|-31.419|-63.051
Arrecifes, AR|-34.063|-60.103
Anatuya, AR|-28.460|-62.834
Alta Gracia, AR|-31.650|-64.430
Allen, AR|-38.977|-67.827
Alderetes, AR|-26.818|-65.142
Albardon, AR|-31.437|-68.526
Aimogasta, AR|-28.560|-66.807
Aguilares, AR|-27.431|-65.615
Balvanera, AR|-34.610|-58.398
Villa Santa Rita, AR|-34.611|-58.481
Villa Mercedes, AR|-33.676|-65.458
Avellaneda, AR|-34.660|-58.367
San Miguel, AR|-34.543|-58.712
San Carlos de Bariloche, AR|-41.146|-71.308
Moreno, AR|-34.634|-58.791
Adrogue, AR|-34.800|-58.384
La Union, AR|-34.876|-58.542
Ingeniero Pablo Nogues, AR|-34.478|-58.707
Villa Sarmiento, AR|-34.634|-58.570
San Vicente, AR|-26.996|-54.477
Jose C. Paz, AR|-34.515|-58.768
Ciudad de Las Heras, AR|-32.851|-68.836
Rawson, AR|-31.582|-68.542
Pago Pago, AS|-14.278|-170.702
Doebling, AT|48.250|16.333
Wolfsberg, AT|46.841|14.844
Wilten, AT|47.258|11.388
Wiener Neustadt, AT|47.805|16.232
Vienna, AT|48.208|16.372
Wetzelsdorf, AT|47.053|15.399
Wels, AT|48.167|14.033
Villach, AT|46.610|13.856
Traun, AT|48.221|14.238
Telfs, AT|47.307|11.068
Strassgang, AT|47.033|15.400
Stockerau, AT|48.383|16.217
Steyr, AT|48.043|14.421
Simmering, AT|48.183|16.433
Sankt Poelten, AT|48.208|15.637
Sankt Peter, AT|47.050|15.467
Sankt Peter, AT|46.630|14.340
Sankt Martin, AT|46.617|14.283
Salzburg, AT|47.799|13.044
Saalfelden am Steinernen Meer, AT|47.427|12.848
Pradl, AT|47.265|11.415
Perchtoldsdorf, AT|48.119|16.266
Ottakring, AT|48.217|16.300
Moedling, AT|48.086|16.289
Meidling, AT|48.167|16.333
Lustenau, AT|47.426|9.659
Linz, AT|48.306|14.286
Klosterneuburg, AT|48.305|16.325
Klagenfurt am Woerthersee, AT|46.625|14.305
Innsbruck, AT|47.263|11.395
Innere Stadt, AT|48.209|16.371
Penzing, AT|48.200|16.267
Hoetting, AT|47.268|11.369
Hohenems, AT|47.361|9.687
Hietzing, AT|48.186|16.297
Hernals, AT|48.225|16.309
Graz, AT|47.067|15.442
Fuenfhaus, AT|48.196|16.318
Floridsdorf, AT|48.250|16.400
Feldkirch, AT|47.236|9.597
Essling, AT|48.213|16.524
Eisenzicken, AT|47.276|16.259
Eggenberg, AT|47.070|15.399
Dornbirn, AT|47.414|9.742
Bregenz, AT|47.503|9.747
Bludenz, AT|47.155|9.823
Baden, AT|48.005|16.233
Aspern, AT|48.218|16.483
Ansfelden, AT|48.210|14.290
Amstetten, AT|48.123|14.872
Favoriten, AT|48.161|16.382
Donaustadt, AT|48.233|16.460
Jakomini, AT|47.054|15.450
Lend, AT|47.083|15.416
Geidorf, AT|47.084|15.444
Sankt Leonhard, AT|47.069|15.458
Andritz, AT|47.114|15.423
Gries, AT|47.062|15.424
Waehring, AT|48.226|16.345
Landstrasse, AT|48.202|16.388
Margareten, AT|48.185|16.354
Mariahilf, AT|48.196|16.352
Neubau, AT|48.202|16.347
Josefstadt, AT|48.212|16.345
Alsergrund, AT|48.223|16.355
Brigittenau, AT|48.243|16.376
Whyalla, AU|-33.033|137.565
Scarborough, AU|-31.896|115.764
Rockingham, AU|-32.277|115.730
Port Hedland, AU|-20.312|118.611
Perth, AU|-31.952|115.861
Mount Isa, AU|-20.725|139.497
Mount Barker, AU|-35.067|138.867
Morphett Vale, AU|-35.133|138.517
Mandurah, AU|-32.527|115.722
Kwinana, AU|-32.230|115.781
Kalgoorlie, AU|-30.746|121.474
Gosnells, AU|-32.081|116.005
Geraldton, AU|-28.779|114.615
Gawler, AU|-34.603|138.749
Darwin, AU|-12.461|130.842
Byford, AU|-32.221|116.009
Busselton, AU|-33.652|115.346
Bunbury, AU|-33.327|115.641
Australind, AU|-33.279|115.715
Alice Springs, AU|-23.697|133.884
Albany, AU|-35.027|117.884
Adelaide, AU|-34.929|138.599
Yarraville, AU|-37.817|144.900
Wollert, AU|-37.583|145.033
Wodonga, AU|-36.122|146.888
Wheelers Hill, AU|-37.900|145.183
Westmead, AU|-33.804|150.988
Werribee, AU|-37.900|144.667
Warwick, AU|-28.219|152.034
Warrnambool, AU|-38.382|142.488
Warragul, AU|-38.159|145.931
Wantirna South, AU|-37.883|145.217
Wangaratta, AU|-36.358|146.321
Wallan, AU|-37.416|144.979
Wahroonga, AU|-33.718|151.116
Upper Coomera, AU|-27.877|153.286
Tuggeranong, AU|-35.416|149.070
Truganina, AU|-37.817|144.750
Traralgon, AU|-38.195|146.542
Townsville, AU|-19.266|146.806
Torquay, AU|-38.331|144.326
Toowoomba, AU|-27.561|151.954
Thornbury, AU|-37.758|145.006
Thomastown, AU|-37.683|145.017
Templestowe, AU|-37.754|145.149
Tarneit, AU|-37.836|144.660
Taree, AU|-31.911|152.454
Tamworth, AU|-31.090|150.929
Sydney, AU|-33.868|151.207
Surry Hills, AU|-33.884|151.213
Surfers Paradise, AU|-28.003|153.430
Sunbury, AU|-37.577|144.726
Strathfield, AU|-33.881|151.080
Springvale, AU|-37.949|145.153
South Yarra, AU|-37.838|144.991
Southport, AU|-27.967|153.398
Shepparton, AU|-36.380|145.399
Seven Hills, AU|-33.783|150.933
Seaford, AU|-38.100|145.133
Saint Kilda, AU|-37.868|144.981
Saint Ives, AU|-33.730|151.160
Saint Albans, AU|-37.733|144.800
Ryde, AU|-33.819|151.106
Rowville, AU|-37.933|145.233
Rockhampton, AU|-23.380|150.506
Rockdale, AU|-33.950|151.133
Ringwood, AU|-37.817|145.233
Richmond, AU|-37.818|145.002
Reservoir, AU|-37.717|145.000
Quakers Hill, AU|-33.733|150.883
Preston, AU|-37.750|145.017
Port Melbourne, AU|-37.840|144.942
Port Macquarie, AU|-31.431|152.909
Point Cook, AU|-37.915|144.751
Pascoe Vale, AU|-37.733|144.933
Palm Beach, AU|-28.117|153.466
Pakenham, AU|-38.070|145.474
Orange, AU|-33.284|149.100
Officer, AU|-38.059|145.409
North Melbourne, AU|-37.798|144.945
Northcote, AU|-37.767|145.000
Noble Park, AU|-37.967|145.167
Newcastle, AU|-32.930|151.780
Nerang, AU|-27.989|153.336
Narre Warren, AU|-38.033|145.300
Narangba, AU|-27.203|152.959
Muswellbrook, AU|-32.261|150.890
Mulgrave, AU|-37.928|145.177
Mount Waverley, AU|-37.877|145.129
Mount Martha, AU|-38.267|145.017
Mount Gambier, AU|-37.832|140.779
Mount Eliza, AU|-38.183|145.083
Mount Druitt, AU|-33.767|150.817
Mosman, AU|-33.839|151.240
Mornington, AU|-38.218|145.039
Morayfield, AU|-27.109|152.949
South Morang, AU|-37.650|145.100
Mooroolbark, AU|-37.782|145.317
Moonee Ponds, AU|-37.767|144.917
Mitcham, AU|-37.817|145.200
Miranda, AU|-34.039|151.100
Mill Park, AU|-37.667|145.067
Mildura, AU|-34.186|142.163
Merrylands, AU|-33.833|150.983
Mernda, AU|-37.601|145.096
Melbourne, AU|-37.814|144.963
Mascot, AU|-33.926|151.193
Maryborough, AU|-25.541|152.705
Marrickville, AU|-33.907|151.155
Maroubra, AU|-33.950|151.233
Manly, AU|-33.798|151.288
Maitland, AU|-32.733|151.557
Mackay, AU|-21.153|149.166
Liverpool, AU|-33.919|150.926
Lilydale, AU|-37.750|145.350
Lidcombe, AU|-33.864|151.040
Launceston, AU|-41.439|147.135
Lara, AU|-38.024|144.406
Langwarrin, AU|-38.167|145.167
Lalor, AU|-37.667|145.017
Lakemba, AU|-33.920|151.076
Kogarah, AU|-33.968|151.136
Keysborough, AU|-37.991|145.174
Kew, AU|-37.806|145.031
Kensington, AU|-33.920|151.222
Horsham, AU|-36.711|142.200
Hornsby, AU|-33.702|151.099
Hobart, AU|-42.879|147.329
Hawthorn South, AU|-37.833|145.037
Hawthorn, AU|-37.820|145.036
Hampton Park, AU|-38.033|145.250
Gympie, AU|-26.190|152.665
Griffith, AU|-34.289|146.051
Greenvale, AU|-37.633|144.867
Greensborough, AU|-37.705|145.103
Granville, AU|-33.841|151.007
Grafton, AU|-29.681|152.934
Goulburn, AU|-34.752|149.721
Gold Coast, AU|-28.000|153.431
Glen Waverley, AU|-37.878|145.165
Glenroy, AU|-37.700|144.933
Glen Iris, AU|-37.867|145.067
Glenferrie, AU|-37.833|145.050
Gladstone, AU|-23.849|151.258
Geelong, AU|-38.147|144.361
Frankston East, AU|-38.133|145.133
Frankston, AU|-38.145|145.123
Footscray, AU|-37.800|144.900
Fairfield, AU|-33.867|150.950
Essendon, AU|-37.750|144.911
Epping, AU|-37.650|145.033
Epping, AU|-33.773|151.082
Engadine, AU|-34.066|151.013
Eltham, AU|-37.733|145.150
Eight Mile Plains, AU|-27.583|153.100
Echuca, AU|-36.141|144.752
Eastwood, AU|-33.792|151.081
Earlwood, AU|-33.921|151.125
Dubbo, AU|-32.243|148.605
Doreen, AU|-37.600|145.150
Doncaster East, AU|-37.788|145.149
Doncaster, AU|-37.788|145.124
Devonport, AU|-41.177|146.352
Deer Park, AU|-37.767|144.767
Deception Bay, AU|-27.194|153.026
Dandenong, AU|-37.983|145.200
Croydon, AU|-37.800|145.283
Cronulla, AU|-34.063|151.150
Cranbourne, AU|-38.113|145.283
Craigieburn, AU|-37.600|144.950
Corio, AU|-38.083|144.383
Coorparoo, AU|-27.493|153.058
Coogee, AU|-33.920|151.255
Coffs Harbour, AU|-30.296|153.114
Coburg, AU|-37.750|144.967
Clayton, AU|-37.917|145.117
Wollongong, AU|-34.424|150.893
Chatswood, AU|-33.800|151.183
Cessnock, AU|-32.832|151.356
Caulfield North, AU|-37.874|145.025
Castle Hill, AU|-33.733|151.000
Carrum Downs, AU|-38.100|145.172
Carnegie, AU|-37.894|145.055
Carlton, AU|-37.800|144.967
Carlingford, AU|-33.783|151.049
Capalaba, AU|-27.543|153.203
Canberra, AU|-35.283|149.128
Camberwell, AU|-37.842|145.069
Caloundra, AU|-26.803|153.122
Cairns, AU|-16.924|145.766
Caboolture, AU|-27.085|152.951
Burwood, AU|-33.883|151.100
Burnie, AU|-41.056|145.904
Bundaberg, AU|-24.866|152.348
Buderim, AU|-26.684|153.057
Brunswick, AU|-37.767|144.967
Broken Hill, AU|-31.965|141.451
Brisbane, AU|-27.468|153.028
Brighton, AU|-37.906|145.003
Boronia, AU|-37.867|145.283
Blacktown, AU|-33.767|150.917
Bexley, AU|-33.950|151.117
Berwick, AU|-38.033|145.350
Bentleigh East, AU|-37.919|145.053
Bentleigh, AU|-37.918|145.035
Bendigo, AU|-36.758|144.280
Baulkham Hills, AU|-33.759|150.993
Bathurst, AU|-33.417|149.581
Batemans Bay, AU|-35.707|150.175
Banora Point, AU|-28.213|153.536
Bankstown, AU|-33.917|151.033
Ballarat, AU|-37.566|143.850
Bairnsdale, AU|-37.823|147.610
Bacchus Marsh, AU|-37.673|144.438
Auburn, AU|-33.850|151.033
Ashfield, AU|-33.888|151.123
Ascot Vale, AU|-37.780|144.923
Armidale, AU|-30.501|151.666
Albany Creek, AU|-27.354|152.968
Maroochydore, AU|-26.660|153.100
Cheltenham, AU|-37.969|145.048
Randwick, AU|-33.914|151.249
Dee Why, AU|-33.751|151.289
Umina Beach, AU|-33.523|151.313
Palmerston, AU|-12.486|130.983
Hervey Bay, AU|-25.288|152.769
Blue Mountains, AU|-33.713|150.331
Sydney Central Business District, AU|-33.865|151.208
Karratha, AU|-20.738|116.846
Kingsford, AU|-33.924|151.227
Springfield Lakes, AU|-27.668|152.925
Bracken Ridge, AU|-27.317|153.031
Kallangur, AU|-27.252|152.992
North Lakes, AU|-27.224|153.021
The Gap, AU|-27.442|152.939
Pittwater, AU|-33.666|151.302
Caroline Springs, AU|-37.741|144.736
Hoppers Crossing, AU|-37.883|144.700
Logan City, AU|-27.639|153.109
Carindale, AU|-27.506|153.102
Parramatta, AU|-33.818|151.003
Ferntree Gully, AU|-37.885|145.295
Adelaide Hills, AU|-34.911|138.707
Canning Vale, AU|-32.058|115.918
Glenmore Park, AU|-33.791|150.669
Southbank, AU|-37.823|144.964
Docklands, AU|-37.815|144.951
Helensvale, AU|-27.918|153.333
Elwood, AU|-37.882|144.982
Burwood, AU|-37.850|145.119
Balwyn North, AU|-37.791|145.094
Malvern East, AU|-37.874|145.043
Brighton East, AU|-37.902|145.017
Redbank Plains, AU|-27.646|152.860
Labrador, AU|-27.944|153.398
St Albans, AU|-37.745|144.800
Central Coast, AU|-33.430|151.371
Endeavour Hills, AU|-37.977|145.259
Kellyville, AU|-33.710|150.951
Taylors Lakes, AU|-37.699|144.786
Cherrybrook, AU|-33.722|151.046
Roxburgh Park, AU|-37.626|144.926
Prestons, AU|-33.942|150.872
Wyndham Vale, AU|-37.891|144.624
Ballajura, AU|-31.841|115.895
Willetton, AU|-32.053|115.888
Glenwood, AU|-33.733|150.933
Cabramatta, AU|-33.897|150.934
Campsie, AU|-33.913|151.103
Casula, AU|-33.952|150.899
Cranebrook, AU|-33.706|150.709
Greenacre, AU|-33.900|151.056
Greystanes, AU|-33.823|150.946
Ellenbrook, AU|-31.767|115.969
Alexandra Hills, AU|-27.532|153.229
Calamvale, AU|-27.623|153.048
Yagoona, AU|-33.905|151.020
Highton, AU|-38.171|144.311
Pacific Pines, AU|-27.940|153.314
Robina, AU|-28.071|153.393
Paralowie, AU|-34.757|138.608
Baldivis, AU|-32.329|115.830
Dianella, AU|-31.888|115.872
Duncraig, AU|-31.833|115.776
Morley, AU|-31.888|115.910
Thornlie, AU|-32.060|115.955
Landsdale, AU|-31.808|115.866
Punchbowl, AU|-33.929|151.051
Parafield Gardens, AU|-34.783|138.611
Hillside, AU|-37.690|144.742
St Clair, AU|-33.797|150.785
Kirwan, AU|-19.303|146.725
Bundoora, AU|-37.698|145.060
Forest Lake, AU|-27.626|152.969
Sunnybank Hills, AU|-27.610|153.054
Rochedale South, AU|-27.595|153.123
Keilor East, AU|-37.733|144.865
Cranbourne East, AU|-38.115|145.298
Cranbourne North, AU|-38.078|145.299
Cranbourne West, AU|-38.096|145.267
Narre Warren South, AU|-38.044|145.292
Dandenong North, AU|-37.966|145.208
Frankston South, AU|-38.166|145.136
Sunshine West, AU|-37.791|144.816
Altona Meadows, AU|-37.884|144.784
Taylors Hill, AU|-37.710|144.755
Hurstville, AU|-33.968|151.101
West Pennant Hills, AU|-33.746|151.048
City of Port Phillip, AU|-37.834|144.938
Sunshine Coast, AU|-26.657|153.080
Melbourne City Centre, AU|-37.815|144.967
Adelaide city centre, AU|-34.929|138.603
Wollongong city centre, AU|-34.428|150.893
Tanki Leendert, AW|12.539|-70.020
Santa Cruz, AW|12.510|-69.981
Oranjestad, AW|12.524|-70.027
Noord, AW|12.566|-70.032
Mariehamn, AX|60.097|19.935
Ahmadbayli, AZ|39.881|48.392
Shusha, AZ|39.760|46.750
Salyan, AZ|39.596|48.985
Saatli, AZ|39.932|48.369
Nehram, AZ|39.116|45.462
Neftcala, AZ|39.377|49.247
Naxcivan, AZ|39.209|45.412
Lerik, AZ|38.774|48.415
Lankaran, AZ|38.754|48.851
Imishli, AZ|39.871|48.060
Fuzuli, AZ|39.601|47.145
Jalilabad, AZ|39.210|48.492
Pushkino, AZ|39.458|48.545
Beylagan, AZ|39.776|47.619
Astara, AZ|38.456|48.875
Sirvan, AZ|39.938|48.929
Aghdam, AZ|39.991|46.927
Zaqatala, AZ|41.632|46.645
Zabrat, AZ|40.477|49.942
Yevlakh, AZ|40.618|47.150
Goygol, AZ|40.586|46.319
Xacmaz, AZ|41.464|48.806
Ujar, AZ|40.519|47.654
Tartar, AZ|40.342|46.932
Sumgayit, AZ|40.590|49.669
Siyazan, AZ|41.078|49.116
Qaracuxur, AZ|40.397|49.974
Saray, AZ|40.533|49.717
Shamkhir, AZ|40.830|46.018
Shamakhi, AZ|40.631|48.641
Sheki, AZ|41.192|47.171
Sabuncu, AZ|40.443|49.948
Sabirabad, AZ|40.009|48.477
Qusar, AZ|41.428|48.430
Quba, AZ|41.361|48.513
Haciqabul, AZ|40.039|48.943
Gazakh, AZ|41.092|45.366
Haji Zeynalabdin, AZ|40.623|49.559
Mingachevir, AZ|40.764|47.062
Mastaga, AZ|40.530|50.006
Mardakan, AZ|40.492|50.143
Lokbatan, AZ|40.326|49.734
Kyurdarmir, AZ|40.343|48.156
Govlar, AZ|40.946|45.732
Gobu, AZ|40.405|49.713
Khirdalan, AZ|40.448|49.755
Ismayilli, AZ|40.785|48.151
Yeni Suraxani, AZ|40.430|50.036
Goeycay, AZ|40.651|47.742
Hovsan, AZ|40.374|50.085
Hokmali, AZ|40.431|49.737
Ganja, AZ|40.682|46.361
Jorat, AZ|40.572|49.705
Divichibazar, AZ|41.201|48.987
Buzovna, AZ|40.519|50.114
Biny Selo, AZ|40.451|50.087
Barda, AZ|40.376|47.126
Bilajari, AZ|40.444|49.806
Baku, AZ|40.378|49.892
Amirdzhan, AZ|40.426|49.984
Aghsu, AZ|40.570|48.401
Agdas, AZ|40.647|47.474
Aghjabadi, AZ|40.050|47.459
Bakixanov, AZ|40.419|49.967
Mehdiabad, AZ|40.497|49.852
Zenica, BA|44.202|17.904
Visoko, BA|43.989|18.178
Velika Kladusa, BA|45.185|15.806
Tuzla, BA|44.538|18.667
Trebinje, BA|42.712|18.344
Travnik, BA|44.226|17.666
Sarajevo, BA|43.849|18.356
Prijedor, BA|44.980|16.714
Mostar, BA|43.343|17.808
Lukavac, BA|44.542|18.526
Ilidza, BA|43.831|18.307
Gradacac, BA|44.879|18.428
Gracanica, BA|44.703|18.310
Gorazde, BA|43.668|18.976
Doboj, BA|44.732|18.087
Cazin, BA|44.967|15.943
Bugojno, BA|44.057|17.451
Brcko, BA|44.872|18.816
Bosanska Krupa, BA|44.883|16.151
Bijeljina, BA|44.759|19.214
Bihac, BA|44.817|15.871
Banja Luka, BA|44.779|17.206
Konjic, BA|43.651|17.961
Bridgetown, BB|13.107|-59.620
Thakurgaon, BD|26.031|88.470
Teknaf, BD|20.858|92.298
Tungi, BD|23.892|90.402
Sylhet, BD|24.899|91.872
Dohar, BD|23.593|90.143
Sunamganj, BD|25.069|91.402
Jamalpur, BD|24.920|89.948
Shibganj, BD|25.001|89.323
Shibganj, BD|24.685|88.156
Satkhira, BD|22.708|89.072
Sirajganj, BD|24.458|89.708
Netrakona, BD|24.884|90.729
Narsingdi, BD|23.923|90.718
Sandwip, BD|22.514|91.455
Shahzadpur, BD|24.177|89.599
Ramganj, BD|23.101|90.850
Rajshahi, BD|24.374|88.601
Pirojpur, BD|22.580|89.975
Panchagarh, BD|26.333|88.558
Patiya, BD|22.295|91.979
Parbatipur, BD|25.664|88.931
Narayanganj, BD|23.614|90.503
Nalchiti, BD|22.637|90.272
Nagarpur, BD|24.058|89.877
Nageswari, BD|25.968|89.692
Mymensingh, BD|24.756|90.406
Muktagacha, BD|24.765|90.257
Mirzapur, BD|24.103|90.098
Maulavi Bazar, BD|24.489|91.771
Morrelgonj, BD|22.456|89.856
Mehendiganj, BD|22.823|90.529
Mathba, BD|22.286|89.959
Lalmonirhat, BD|25.917|89.446
Laksham, BD|23.240|91.121
Comilla, BD|23.462|91.185
Rangpur, BD|25.747|89.252
Kushtia, BD|23.903|89.119
Kaliganj, BD|23.410|89.138
Jhingergacha, BD|23.111|89.091
Joypur Hat, BD|25.101|89.027
Ishwardi, BD|24.129|89.066
Habiganj, BD|24.380|91.413
Gaurnadi, BD|22.974|90.224
Gafargaon, BD|24.432|90.558
Feni, BD|23.014|91.397
Raipur, BD|23.039|90.768
Sarankhola, BD|22.310|89.791
Ramna Maidan, BD|23.733|90.400
Dhaka, BD|23.710|90.407
Chilmari, BD|25.556|89.671
Chhagalnaiya, BD|23.025|91.511
Lalmohan, BD|22.338|90.737
Khagrachhari, BD|23.108|91.970
Chhatak, BD|25.039|91.670
Bhatpara Abhaynagar, BD|23.015|89.439
Bheramara, BD|24.025|88.992
Bhairab Bazar, BD|24.052|90.976
Bandarban, BD|22.195|92.219
Kalia, BD|23.043|89.631
Baniachang, BD|24.519|91.358
Bajitpur, BD|24.216|90.950
Bagerhat, BD|22.657|89.791
Badarganj, BD|25.674|89.054
Narail, BD|23.155|89.495
Tungipara, BD|22.900|89.903
Sonargaon, BD|23.650|90.617
Shahbazpur Town, BD|24.053|91.172
Sarishabari, BD|24.751|89.831
Sakhipur, BD|24.320|90.169
Raojan, BD|22.535|91.919
Phultala, BD|22.717|89.512
Palang, BD|23.218|90.351
Par Naogaon, BD|24.804|88.949
Nagar Naluakot, BD|24.156|90.773
Nabinagar, BD|23.888|90.968
Mohammadpur, BD|24.898|88.528
Matuail, BD|23.712|90.460
Maijdi, BD|22.867|91.100
Lakshmipur, BD|22.944|90.830
Kesabpur, BD|22.907|89.220
Kafrul, BD|23.788|90.374
Gazipur, BD|23.998|90.422
Hajiganj, BD|23.252|90.855
Gopalganj, BD|23.223|90.060
Faridpur, BD|23.606|89.841
Dukuria, BD|23.711|90.374
Dohazari, BD|22.164|92.073
Dinajpur, BD|25.627|88.638
Uttar Char Fasson, BD|22.226|90.713
Chattogram, BD|22.338|91.832
Char Bhadrasan, BD|23.309|90.227
Charamaddi, BD|22.642|90.426
Chandpur, BD|23.227|90.654
Burirchar, BD|22.140|90.206
Bhatara, BD|23.800|90.450
Bera, BD|24.078|89.633
Burhanuddin, BD|22.495|90.724
Ayla Patakata, BD|22.217|90.210
Ashuganj City, BD|24.040|91.012
Satkania, BD|22.076|92.050
Coxs Bazar, BD|21.440|92.010
Khulna, BD|22.810|89.564
Bhola, BD|22.688|90.644
Barishal, BD|22.705|90.370
Rangamati, BD|22.643|92.192
Jessore, BD|23.170|89.214
Brahmanbaria, BD|23.975|91.112
Pabna, BD|24.006|89.237
Tangail, BD|24.250|89.917
Bogra, BD|24.851|89.371
Pirgaaj, BD|25.856|88.359
Nawabganj, BD|24.590|88.274
Madaripur, BD|23.171|90.209
Sherpur, BD|25.019|90.018
Kishorganj, BD|24.439|90.783
Manikganj, BD|23.858|90.010
Savar, BD|23.849|90.250
Hathazari, BD|22.505|91.813
Manikchari, BD|22.840|91.841
Bhandaria, BD|22.489|90.063
Bibir Hat, BD|22.683|91.791
Saidpur, BD|25.778|88.892
Taluker Char Doani, BD|22.140|89.941
Natona, BD|22.051|90.032
Puthia, BD|24.365|88.834
Natore, BD|24.411|88.987
Srimangal, BD|24.307|91.730
Patuakhali, BD|22.368|90.346
Dhanmondi, BD|23.740|90.385
Pallabi, BD|23.825|90.370
Azimpur, BD|23.730|90.385
Demra, BD|23.710|90.482
Paotana Hat, BD|25.665|89.503
Karnaphuli, BD|22.691|92.235
Bhanga, BD|23.392|89.984
Paltan, BD|23.736|90.414
Mirpur Model Thana, BD|23.809|90.361
Gulshan, BD|23.790|90.410
Motijheel, BD|23.728|90.419
Zwijndrecht, BE|51.220|4.327
Zwevegem, BE|50.813|3.338
Zottegem, BE|50.870|3.811
Zonhoven, BE|50.991|5.368
Zolder, BE|51.025|5.310
Zemst, BE|50.983|4.461
Zele, BE|51.066|4.040
Zedelgem, BE|51.142|3.137
Zaventem, BE|50.884|4.473
Wondelgem, BE|51.087|3.709
Woluwe-Saint-Lambert, BE|50.844|4.429
Wilrijk, BE|51.167|4.395
Willebroek, BE|51.060|4.360
Wevelgem, BE|50.800|3.167
Wetteren, BE|51.005|3.883
Westerlo, BE|51.090|4.915
Wervik, BE|50.781|3.039
Wavre, BE|50.717|4.601
Watermael-Boitsfort, BE|50.802|4.414
Waterloo, BE|50.715|4.399
Waregem, BE|50.889|3.428
Walcourt, BE|50.254|4.438
Vise, BE|50.738|5.699
Vilvoorde, BE|50.928|4.429
Verviers, BE|50.589|5.862
Uccle, BE|50.802|4.339
Turnhout, BE|51.323|4.945
Tubize, BE|50.691|4.201
Tournai, BE|50.607|3.389
Torhout, BE|51.066|3.101
Tongeren, BE|50.781|5.465
Tienen, BE|50.807|4.938
Tielt, BE|50.999|3.327
Tessenderlo, BE|51.065|5.089
Tervuren, BE|50.824|4.514
Temse, BE|51.128|4.214
Stekene, BE|51.210|4.037
Stabroek, BE|51.332|4.371
Soumagne, BE|50.614|5.747
Soignies, BE|50.579|4.071
Sint-Truiden, BE|50.817|5.186
Sint-Pieters-Leeuw, BE|50.779|4.244
Sint-Niklaas, BE|51.165|4.144
Sint-Kruis, BE|51.214|3.249
Sint-Katelijne-Waver, BE|51.067|4.535
Sint-Gillis-Waas, BE|51.219|4.124
Sint-Genesius-Rode, BE|50.746|4.358
Sint-Andries, BE|51.197|3.179
Sint-Amandsberg, BE|51.059|3.749
Seraing, BE|50.584|5.501
Schoten, BE|51.253|4.503
Schilde, BE|51.241|4.583
Schaerbeek, BE|50.869|4.377
Saint-Nicolas, BE|50.628|5.532
Saint-Josse-ten-Noode, BE|50.854|4.373
Saint-Gilles, BE|50.828|4.344
Saint-Ghislain, BE|50.448|3.819
Rotselaar, BE|50.953|4.717
Ronse, BE|50.746|3.600
Roeselare, BE|50.947|3.123
Rixensart, BE|50.712|4.525
Riemst, BE|50.810|5.601
Ranst, BE|51.190|4.565
Quaregnon, BE|50.441|3.865
Puurs, BE|51.074|4.288
Putte, BE|51.053|4.633
Poperinge, BE|50.854|2.727
Pont-a-Celles, BE|50.505|4.369
Peruwelz, BE|50.508|3.594
Peer, BE|51.130|5.460
Overijse, BE|50.774|4.535
Oupeye, BE|50.712|5.647
Oudenaarde, BE|50.852|3.609
Oostkamp, BE|51.154|3.231
Ostend, BE|51.216|2.927
Nivelles, BE|50.598|4.328
Ninove, BE|50.828|4.027
Nijlen, BE|51.161|4.670
Neerpelt, BE|51.228|5.443
Namur, BE|50.467|4.867
Mouscron, BE|50.745|3.206
Mortsel, BE|51.167|4.451
Morlanwelz-Mariemont, BE|50.455|4.245
Montignies-sur-Sambre, BE|50.411|4.491
Mons, BE|50.454|3.952
Molenbeek-Saint-Jean, BE|50.850|4.312
Mol, BE|51.192|5.117
Middelkerke, BE|51.185|2.821
Merksem, BE|51.246|4.449
Merelbeke, BE|50.994|3.746
Menen, BE|50.797|3.122
Meise, BE|50.939|4.327
Mechelen-aan-de-Maas, BE|50.966|5.691
Mechelen, BE|51.026|4.478
Mariakerke, BE|51.075|3.683
Marcinelle, BE|50.392|4.444
Marchienne-au-Pont, BE|50.406|4.395
Marche-en-Famenne, BE|50.227|5.344
Manage, BE|50.503|4.236
Maldegem, BE|51.207|3.445
Maasmechelen, BE|50.965|5.695
Maaseik, BE|51.098|5.784
Louvain-la-Neuve, BE|50.668|4.614
Lommel, BE|51.231|5.313
Lokeren, BE|51.104|3.993
Lochristi, BE|51.096|3.832
Lille, BE|51.242|4.823
Lier, BE|51.131|4.570
Liege, BE|50.634|5.567
Leuven, BE|50.880|4.701
Lessines, BE|50.711|3.836
Lede, BE|50.966|3.986
Lebbeke, BE|51.005|4.135
Lanaken, BE|50.893|5.647
La Louviere, BE|50.487|4.188
Kortrijk, BE|50.828|3.265
Kortenberg, BE|50.890|4.544
Kontich, BE|51.132|4.447
Koksijde, BE|51.116|2.638
Koersel, BE|51.059|5.271
Koekelberg, BE|50.861|4.331
Knokke-Heist, BE|51.350|3.267
Kessel-Lo, BE|50.885|4.737
Kasterlee, BE|51.241|4.967
Kapellen, BE|51.314|4.435
Kalmthout, BE|51.384|4.476
Jumet, BE|50.442|4.437
Jette, BE|50.873|4.334
Jambes, BE|50.456|4.872
Izegem, BE|50.914|3.214
Ixelles, BE|50.833|4.367
Ieper, BE|50.851|2.886
Huy, BE|50.519|5.233
Houthalen, BE|51.034|5.374
Hoogstraten, BE|51.400|4.760
Hoboken, BE|51.176|4.348
Heverlee, BE|50.864|4.696
Heusy, BE|50.575|5.866
Heusden, BE|51.037|5.280
Herzele, BE|50.887|3.890
Herve, BE|50.641|5.794
Herstal, BE|50.664|5.623
Herentals, BE|51.177|4.832
Herent, BE|50.909|4.671
Helchteren, BE|51.056|5.382
Heist-op-den-Berg, BE|51.075|4.728
Hasselt, BE|50.931|5.338
Harelbeke, BE|50.853|3.309
Hamme, BE|51.098|4.137
Halle, BE|50.734|4.235
Haaltert, BE|50.906|4.001
Grivegnee, BE|50.621|5.611
Grimbergen, BE|50.934|4.372
Gilly, BE|50.424|4.479
Geraardsbergen, BE|50.773|3.882
Gentbrugge, BE|51.037|3.765
Gent, BE|51.050|3.717
Genk, BE|50.965|5.501
Gembloux, BE|50.561|4.699
Geel, BE|51.166|4.989
Ganshoren, BE|50.871|4.315
Frameries, BE|50.406|3.896
Forest, BE|50.817|4.328
Fleurus, BE|50.484|4.550
Fleron, BE|50.615|5.681
Flemalle-Haute, BE|50.600|5.445
Evergem, BE|51.113|3.710
Evere, BE|50.874|4.399
Eupen, BE|50.628|6.036
Etterbeek, BE|50.833|4.388
Ekeren, BE|51.281|4.418
Eeklo, BE|51.187|3.557
Edegem, BE|51.157|4.445
Duffel, BE|51.096|4.509
Dour, BE|50.396|3.778
Dilbeek, BE|50.848|4.260
Diksmuide, BE|51.032|2.864
Diest, BE|50.989|5.051
Diepenbeek, BE|50.908|5.419
Deurne, BE|51.221|4.466
Destelbergen, BE|51.060|3.799
Dendermonde, BE|51.029|4.101
Denderleeuw, BE|50.885|4.076
Deinze, BE|50.982|3.531
Courcelles, BE|50.464|4.375
Colfontaine, BE|50.414|3.856
Chaudfontaine, BE|50.583|5.634
Chatelineau, BE|50.415|4.520
Chatelet, BE|50.403|4.528
Charleroi, BE|50.411|4.444
Brussels, BE|50.850|4.349
Brugge, BE|51.209|3.224
Brasschaat, BE|51.291|4.492
Braine-le-Comte, BE|50.610|4.147
Braine-lAlleud, BE|50.684|4.368
Boussu, BE|50.434|3.794
Bornem, BE|51.097|4.244
Borgerhout, BE|51.210|4.435
Boom, BE|51.092|4.372
Blauwput, BE|50.886|4.724
Blankenberge, BE|51.313|3.132
Binche, BE|50.412|4.165
Bilzen, BE|50.873|5.518
Beveren, BE|51.212|4.256
Bevere, BE|50.850|3.587
Beringen, BE|51.050|5.226
Berchem-Sainte-Agathe, BE|50.866|4.296
Berchem, BE|51.190|4.433
Beersel, BE|50.766|4.300
Beerse, BE|51.319|4.853
Balen, BE|51.168|5.170
Auderghem, BE|50.817|4.433
Ath, BE|50.629|3.778
Assebroek, BE|51.194|3.262
Asse, BE|50.910|4.198
Arlon, BE|49.683|5.817
Antwerp, BE|51.220|4.400
Ans, BE|50.662|5.520
Anderlecht, BE|50.836|4.315
Andenne, BE|50.489|5.095
Aarschot, BE|50.987|4.837
Aalter, BE|51.090|3.447
Aalst, BE|50.936|4.035
Zorgo, BF|12.249|-0.615
Ziniare, BF|12.582|-1.298
Zinguedesse, BF|12.247|-1.584
Zabre, BF|11.182|-0.632
Yalgo, BF|12.933|-0.850
Yako, BF|12.959|-2.261
Tougan, BF|13.072|-3.069
Toma, BF|12.758|-2.899
To, BF|11.444|-2.225
Titao, BF|13.767|-2.067
Tita, BF|11.921|-2.515
Tenkodogo, BF|11.784|-0.372
Solenzo, BF|12.174|-4.085
Sapouy, BF|11.554|-1.774
Saonre, BF|12.275|-1.577
Sabou, BF|12.067|-2.233
Saaba, BF|12.371|-1.415
Reo, BF|12.320|-2.471
Pouytenga, BF|12.252|-0.426
Po, BF|11.170|-1.145
Pissila, BF|13.164|-0.823
Pa, BF|12.667|-3.950
Ouahigouya, BF|13.577|-2.418
Ouagadougou, BF|12.366|-1.534
Orodara, BF|10.981|-4.919
Nioko I, BF|12.395|-1.439
Nouna, BF|12.729|-3.863
Niangoloko, BF|10.283|-4.917
Natiaboani, BF|11.699|0.506
Mogtedo, BF|12.284|-0.837
Manga, BF|11.665|-1.070
Leo, BF|11.100|-2.107
Koupela, BF|12.179|-0.351
Kouka, BF|13.434|-1.614
Koudougou, BF|12.252|-2.367
Korsimoro, BF|12.825|-1.067
Kongoussi, BF|13.326|-1.535
Kombissiri, BF|12.069|-1.336
Kokologo, BF|12.194|-1.877
Kindi, BF|12.439|-2.033
Kaya, BF|13.088|-1.084
Karankasso, BF|11.222|-4.644
Hounde, BF|11.500|-3.517
Gourcy, BF|13.208|-2.359
Gayeri, BF|12.648|0.493
Garango, BF|11.800|-0.551
Gaoua, BF|10.331|-3.182
Gao, BF|11.650|-2.178
Fara Department, BF|11.529|-2.768
Fada Ngourma, BF|12.062|0.358
Dori, BF|14.033|-0.033
Djibo, BF|14.099|-1.627
Diebougou, BF|10.962|-3.250
Diapaga, BF|12.073|1.788
Dedougou, BF|12.464|-3.461
Dano, BF|11.146|-3.058
Gomboussougou, BF|11.426|-0.773
Bousse, BF|12.661|-1.895
Bourzanga, BF|13.678|-1.546
Boulsa, BF|12.667|-0.575
Boromo, BF|11.745|-2.930
Bogande, BF|12.977|-0.147
Bobo-Dioulasso, BF|11.181|-4.295
Bittou, BF|11.258|-0.306
Beguedo, BF|11.781|-0.734
Batie, BF|9.883|-2.917
Barogo, BF|12.550|-0.967
Banfora, BF|10.641|-4.753
Bama, BF|12.036|-4.399
Aribinda, BF|14.230|-0.865
Mani, BF|13.258|-0.213
Namponkore, BF|11.737|1.777
Cinkanse, BF|11.119|0.010
Kompienga, BF|11.082|0.724
Yambol, BG|42.482|26.500
Vratsa, BG|43.211|23.563
Vidin, BG|43.992|22.882
Velingrad, BG|42.028|23.992
Veliko Turnovo, BG|43.081|25.629
Varna, BG|43.219|27.910
Targovishte, BG|43.251|26.572
Troyan, BG|42.894|24.716
Dobrich, BG|43.565|27.831
Svishtov, BG|43.619|25.350
Svilengrad, BG|41.768|26.198
Stara Zagora, BG|42.432|25.643
Dupnitsa, BG|42.265|23.117
Sofia, BG|42.698|23.324
Smolyan, BG|41.574|24.712
Sliven, BG|42.686|26.326
Silistra, BG|44.117|27.261
Shumen, BG|43.271|26.923
Sevlievo, BG|43.023|25.104
Sandanski, BG|41.567|23.283
Samokov, BG|42.339|23.558
Ruse, BG|43.849|25.953
Razgrad, BG|43.533|26.518
Rakovski, BG|42.288|24.968
Parvomay, BG|42.100|25.217
Popovo, BG|43.350|26.233
Plovdiv, BG|42.154|24.750
Pleven, BG|43.418|24.617
Petrich, BG|41.398|23.207
Peshtera, BG|42.034|24.300
Pernik, BG|42.597|23.033
Pazardzhik, BG|42.199|24.333
Panagyurishte, BG|42.495|24.190
Nova Zagora, BG|42.483|26.017
Montana, BG|43.413|23.222
Lovech, BG|43.132|24.718
Lom, BG|43.832|23.238
Kyustendil, BG|42.283|22.692
Kardzhali, BG|41.645|25.366
Haskovo, BG|41.934|25.556
Harmanli, BG|41.932|25.902
Kazanlak, BG|42.617|25.400
Karnobat, BG|42.650|26.983
Karlovo, BG|42.633|24.800
Gotse Delchev, BG|41.567|23.733
Gorna Oryahovitsa, BG|43.128|25.702
Gabrovo, BG|42.874|25.318
Dimitrovgrad, BG|42.050|25.600
Chirpan, BG|42.200|25.333
Burgas, BG|42.507|27.469
Botevgrad, BG|42.908|23.793
Blagoevgrad, BG|42.015|23.098
Berkovitsa, BG|43.237|23.125
Aytos, BG|42.703|27.255
Asparuhovo, BG|43.181|27.888
Asenovgrad, BG|42.017|24.867
Sitrah, BH|26.155|50.621
Madinat `Isa, BH|26.174|50.548
Jidd Hafs, BH|26.219|50.548
Madinat Hamad, BH|26.115|50.507
Dar Kulayb, BH|26.069|50.504
Al Muharraq, BH|26.257|50.612
Manama, BH|26.228|50.586
Ar Rifa, BH|26.130|50.555
Vyanda, BI|-4.102|29.606
Rumonge, BI|-3.974|29.439
Gatumba, BI|-3.333|29.250
Bujumbura, BI|-3.382|29.361
Gitega, BI|-3.427|29.925
Zanandore, BI|-3.255|30.114
Cendajuru, BI|-3.289|30.601
Karusi, BI|-3.101|30.163
Bubanza, BI|-3.080|29.391
Mpanda, BI|-3.170|29.403
Cibitoke, BI|-2.887|29.125
Ngozi, BI|-2.908|29.831
Kayanza, BI|-2.922|29.629
Kirundo, BI|-2.584|30.096
Zinvie, BJ|6.617|2.358
Ze, BJ|6.783|2.300
Toviklin, BJ|6.889|1.837
Toukountouna, BJ|10.503|1.374
Tobre, BJ|10.195|2.130
Tchaourou, BJ|8.886|2.598
Tanguieta, BJ|10.621|1.267
Sinende, BJ|10.350|2.379
Semi, BJ|6.367|2.617
Segbana, BJ|10.928|3.694
Se, BJ|6.511|1.828
Save, BJ|8.034|2.487
Savalou, BJ|7.928|1.976
Sakete, BJ|6.736|2.659
Porto-Novo, BJ|6.496|2.604
Pobe, BJ|6.980|2.665
Perere, BJ|9.797|2.984
Pehonko, BJ|10.227|2.002
Parakou, BJ|9.337|2.630
Ouinhi, BJ|7.084|2.483
Ouidah, BJ|6.363|2.085
Ouesse, BJ|8.486|2.429
Nikki, BJ|9.940|3.211
Ndali, BJ|9.864|2.721
Natitingou, BJ|10.304|1.380
Misserete, BJ|6.559|2.591
Materi, BJ|10.696|1.063
Malanville, BJ|11.868|3.383
Lokossa, BJ|6.639|1.717
Kouande, BJ|6.400|2.067
Ketou, BJ|7.363|2.600
Kerou, BJ|10.826|2.105
Kandi, BJ|11.134|2.939
Kalale, BJ|10.293|3.384
Godome, BJ|6.389|2.346
Glazoue, BJ|7.973|2.222
Ganvie, BJ|6.464|2.393
Ekpe, BJ|6.392|2.537
Dogbo, BJ|6.799|1.781
Djougou, BJ|9.709|1.666
Djidja, BJ|7.344|1.934
Djakotome, BJ|6.899|1.716
Dassa-Zoume, BJ|7.750|2.183
Cove, BJ|7.221|2.340
Cotonou, BJ|6.365|2.418
Kopargo, BJ|9.841|1.542
Come, BJ|6.408|1.882
Boukoumbe, BJ|10.177|1.106
Bohicon, BJ|7.178|2.067
Bembereke, BJ|10.228|2.663
Bassila, BJ|9.008|1.665
Bante, BJ|8.412|1.890
Banikoara, BJ|11.298|2.439
Banigbe, BJ|6.648|2.707
Avrankou, BJ|6.556|2.651
Athieme, BJ|6.581|1.670
Aplahoue, BJ|6.933|1.683
Allada, BJ|6.665|2.151
Adjarra, BJ|6.534|2.668
Adjaouere, BJ|7.002|2.606
Abomey-Calavi, BJ|6.449|2.356
Abomey, BJ|7.183|1.991
Ouake, BJ|9.662|1.385
Cobly, BJ|10.492|1.000
Klouekanme, BJ|6.980|1.842
Kpozoun, BJ|7.229|2.213
Gustavia, BL|17.896|-62.850
Hamilton, BM|32.295|-64.783
Tutong, BN|4.803|114.649
Kuala Belait, BN|4.584|114.231
Liang, BN|4.677|114.496
Serasa, BN|5.018|115.058
Sengkurong, BN|4.883|114.833
Mentiri, BN|4.971|115.021
Bandar Seri Begawan, BN|4.890|114.940
Yacuiba, BO|-22.016|-63.678
Warnes, BO|-17.516|-63.168
Vinto, BO|-17.391|-66.317
Villazon, BO|-22.087|-65.594
Villa Yapacani, BO|-17.400|-63.833
Villamontes, BO|-21.262|-63.469
Viacha, BO|-16.650|-68.300
Tupiza, BO|-21.443|-65.719
Trinidad, BO|-14.832|-64.903
Tiquipaya, BO|-17.338|-66.216
Tarija, BO|-21.535|-64.730
Sucre, BO|-19.033|-65.263
Sipe Sipe, BO|-17.454|-66.357
El Torno, BO|-18.000|-63.387
Santa Cruz de la Sierra, BO|-17.786|-63.181
San Ignacio de Velasco, BO|-16.378|-60.965
Sacaba, BO|-17.398|-66.038
Riberalta, BO|-11.010|-66.053
Quillacollo, BO|-17.392|-66.278
Punata, BO|-17.542|-65.835
Potosi, BO|-19.584|-65.753
Oruro, BO|-17.972|-67.093
Montero, BO|-17.339|-63.251
Mizque, BO|-17.941|-65.340
Llallagua, BO|-18.425|-66.578
La Paz, BO|-16.500|-68.150
Laja, BO|-16.533|-68.383
Huanuni, BO|-18.289|-66.836
Guayaramerin, BO|-10.826|-65.358
Cotoca, BO|-17.817|-63.050
Colcapirhua, BO|-17.386|-66.238
Cochabamba, BO|-17.382|-66.160
Cobija, BO|-11.027|-68.769
Caranavi, BO|-15.834|-67.566
Camiri, BO|-20.041|-63.524
Bermejo, BO|-22.732|-64.337
Achocalla, BO|-16.574|-68.151
Ascencion de Guarayos, BO|-15.893|-63.189
San Borja, BO|-14.852|-66.750
Kralendijk, BQ|12.150|-68.267
Vitorino Freire, BR|-4.288|-45.246
Vitoria do Mearim, BR|-3.462|-44.871
Vitoria de Santo Antao, BR|-8.118|-35.291
Viseu, BR|-1.197|-46.140
Conde, BR|-7.260|-34.907
Vigia, BR|-0.858|-48.142
Vicosa do Ceara, BR|-3.562|-41.092
Vicosa, BR|-9.371|-36.241
Vicencia, BR|-7.657|-35.327
Viana, BR|-3.220|-45.004
Vertentes, BR|-7.903|-35.988
Venturosa, BR|-8.575|-36.874
Varzea Alegre, BR|-5.350|-40.383
Varzea Alegre, BR|-6.789|-39.296
Varjota, BR|-4.194|-40.477
Vargem Grande, BR|-3.543|-43.916
Valenca do Piaui, BR|-6.407|-41.746
Urucurituba, BR|-3.129|-58.155
Urucui, BR|-7.229|-44.556
Urucara, BR|-2.536|-57.760
Uruburetama, BR|-3.625|-39.508
Urbano Santos, BR|-3.208|-43.404
Uniao dos Palmares, BR|-9.163|-36.032
Uniao, BR|-4.586|-42.864
Umirim, BR|-3.677|-39.350
Ubajara, BR|-3.854|-40.921
Uaua, BR|-9.841|-39.482
Tutoia, BR|-2.762|-42.274
Turiacu, BR|-1.663|-45.372
Turaru, BR|-3.600|-39.433
Tupanatinga, BR|-8.753|-37.340
Tuntum, BR|-5.258|-44.649
Tucurui, BR|-3.766|-49.679
Tucuma, BR|-0.155|-50.062
Triunfo, BR|-7.838|-38.102
Trindade, BR|-7.762|-40.268
Trairi, BR|-3.278|-39.269
Traipu, BR|-9.971|-37.003
Tracuateua, BR|-1.076|-46.903
Touros, BR|-5.199|-35.461
Toritama, BR|-8.007|-36.057
Tome-Acu, BR|-2.419|-48.152
Tocantinopolis, BR|-6.329|-47.416
Timon, BR|-5.094|-42.837
Timbiras, BR|-4.255|-43.941
Timbauba, BR|-7.505|-35.318
Tibau do Sul, BR|-6.187|-35.092
Tiangua, BR|-3.732|-40.992
Terra Santa, BR|-2.104|-56.487
Teresina, BR|-5.089|-42.802
Tejucuoca, BR|-3.989|-39.581
Taua, BR|-6.003|-40.293
Sao Joao dos Inhamuns, BR|-6.000|-40.283
Tartarugalzinho, BR|1.506|-50.912
Taquaritinga do Norte, BR|-7.903|-36.044
Taquarana, BR|-9.645|-36.497
Tamboril, BR|-4.832|-40.321
Itambe, BR|-7.410|-35.113
Tamandare, BR|-8.756|-35.100
Tacaratu, BR|-9.105|-38.149
Tabuleiro do Norte, BR|-5.247|-38.131
Tabira, BR|-7.591|-37.539
Surubim, BR|-7.833|-35.755
Sume, BR|-7.672|-36.880
Sousa, BR|-6.759|-38.228
Soure, BR|-0.717|-48.523
Solonopole, BR|-5.733|-39.008
Soledade, BR|-7.057|-36.363
Solanea, BR|-6.755|-35.664
Sobral, BR|-3.686|-40.350
Sobradinho, BR|-9.472|-40.802
Sirinhaem, BR|-8.591|-35.116
Sertania, BR|-8.074|-37.264
Serrita, BR|-7.933|-39.296
Serra Talhada, BR|-7.992|-38.298
Senador Pompeu, BR|-5.588|-39.372
Satuba, BR|-9.563|-35.824
Sape, BR|-7.096|-35.233
Sao Vicente Ferrer, BR|-7.591|-35.491
Sao Vicente Ferrer, BR|-2.894|-44.880
Sao Sebastiao da Boa Vista, BR|-1.715|-49.532
Sao Sebastiao, BR|-9.934|-36.554
Sao Raimundo Nonato, BR|-9.015|-42.699
Sao Raimundo das Mangabeiras, BR|-7.022|-45.481
Sao Paulo do Potengi, BR|-5.895|-35.763
Sao Miguel do Tapuio, BR|-5.504|-41.323
Sao Miguel dos Campos, BR|-9.781|-36.094
Sao Miguel do Guama, BR|-1.627|-47.483
Sao Miguel, BR|-6.212|-38.497
Sao Mateus do Maranhao, BR|-4.042|-44.475
Sao Luis do Quitunde, BR|-9.318|-35.561
Sao Luis, BR|-2.530|-44.303
Sao Lourenco da Mata, BR|-8.002|-35.018
Sao Jose do Egito, BR|-7.479|-37.274
Sao Jose do Belmonte, BR|-7.861|-38.760
Sao Jose de Ribamar, BR|-2.556|-44.060
Sao Jose de Piranhas, BR|-7.121|-38.502
Sao Jose de Mipibu, BR|-6.075|-35.238
Sao Jose da Tapera, BR|-9.558|-37.381
Sao Jose da Laje, BR|-9.010|-36.058
Sao Jose da Coroa Grande, BR|-8.898|-35.148
Sao Joaquim do Monte, BR|-8.432|-35.804
Sao Joao dos Patos, BR|-6.495|-43.702
Sao Joao do Piaui, BR|-8.358|-42.247
Sao Joao de Pirabas, BR|-0.775|-47.177
Sao Joao Batista, BR|-2.955|-44.807
Sao Joao, BR|-8.876|-36.367
Sao Goncalo do Amarante, BR|-5.793|-35.329
Sao Goncalo do Amarante, BR|-3.607|-38.968
Sao Geraldo do Araguaia, BR|-6.401|-48.555
Sao Felix do Xingu, BR|-6.645|-51.995
Sao Domingos do Maranhao, BR|-5.576|-44.385
Sao Domingos do Capim, BR|-1.674|-47.771
Sao Caitano, BR|-8.326|-36.143
Sao Caetano de Odivelas, BR|-0.750|-48.020
Sao Bernardo, BR|-3.361|-42.418
Sao Bento do Una, BR|-8.523|-36.444
Sao Bento, BR|-6.283|-37.750
Sao Bento, BR|-2.696|-44.821
Sao Benedito do Rio Preto, BR|-3.334|-43.528
Sao Benedito, BR|-4.049|-40.865
Santo Antonio do Taua, BR|-1.152|-48.129
Santo Antonio, BR|-6.311|-35.479
Santa Rita, BR|-7.114|-34.978
Santarem, BR|-2.443|-54.708
Santa Quiteria do Maranhao, BR|-3.496|-42.562
Santa Quiteria, BR|-4.332|-40.157
Santana do Ipanema, BR|-9.378|-37.245
Santana do Cariri, BR|-7.188|-39.737
Santana do Acarau, BR|-3.461|-40.212
Santa Rita, BR|-3.139|-44.325
Santa Maria do Para, BR|-1.350|-47.576
Santa Maria das Barreiras, BR|-8.872|-49.713
Santa Maria da Boa Vista, BR|-8.808|-39.826
Santa Luzia, BR|-7.643|-47.217
Santa Luzia, BR|-6.872|-36.919
Santa Isabel do Para, BR|-1.299|-48.161
Santa Ines, BR|-3.667|-45.380
Santa Helena, BR|-2.231|-45.300
Santa Cruz do Capibaribe, BR|-7.957|-36.205
Santa Cruz, BR|-6.229|-36.023
Sanharo, BR|-8.361|-36.566
Salvaterra, BR|-0.753|-48.517
Salitre, BR|-7.285|-40.457
Salinopolis, BR|-0.621|-47.354
Salgueiro, BR|-8.074|-39.119
Russas, BR|-4.940|-37.976
Rosario, BR|-2.940|-44.249
Rio Tinto, BR|-6.803|-35.081
Rio Largo, BR|-9.478|-35.853
Rio Formoso, BR|-8.669|-35.163
Ribeirao, BR|-8.514|-35.378
Riacho das Almas, BR|-8.134|-35.856
Riachao, BR|-7.362|-46.617
Reriutaba, BR|-4.142|-40.582
Remigio, BR|-6.966|-35.795
Remanso, BR|-9.622|-42.081
Regeneracao, BR|-6.231|-42.687
Redencao, BR|-4.226|-38.731
Recife, BR|-8.054|-34.881
Quixere, BR|-5.074|-37.989
Quixeramobim, BR|-5.199|-39.293
Quixelo, BR|-6.254|-39.202
Quixada, BR|-4.971|-39.015
Quipapa, BR|-8.828|-36.012
Queimadas, BR|-7.358|-35.898
Princesa Isabel, BR|-7.737|-37.993
Primeira Cruz, BR|-2.510|-43.438
Presidente Dutra, BR|-5.290|-44.490
Prainha, BR|-1.800|-53.480
Santana, BR|-0.038|-51.175
Porto Grande, BR|0.713|-51.413
Porto Franco, BR|-6.338|-47.399
Porto de Moz, BR|-1.748|-52.238
Porto da Folha, BR|-9.917|-37.278
Porto Calvo, BR|-9.045|-35.398
Portel, BR|-1.936|-50.821
Porteiras, BR|-7.535|-39.118
Ponta de Pedras, BR|-1.390|-48.871
Pombos, BR|-8.141|-35.396
Pombal, BR|-6.770|-37.802
Poco Redondo, BR|-9.805|-37.684
Pocinhos, BR|-7.077|-36.061
Pocao de Pedras, BR|-4.752|-44.944
Pitimbu, BR|-7.471|-34.809
Piripiri, BR|-4.273|-41.777
Pirapemas, BR|-3.727|-44.223
Piranhas, BR|-9.624|-37.757
Piracuruca, BR|-3.928|-41.709
Piquet Carneiro, BR|-5.804|-39.418
Pio XII, BR|-3.833|-45.153
Pio IX, BR|-6.835|-40.613
Pinheiro, BR|-2.521|-45.083
Pindoretama, BR|-4.027|-38.305
Pindare-Mirim, BR|-3.608|-45.343
Pilar, BR|-9.597|-35.957
Picui, BR|-6.511|-36.347
Picos, BR|-7.077|-41.467
Pianco, BR|-7.198|-37.929
Petrolina, BR|-9.399|-40.501
Pesqueira, BR|-8.358|-36.696
Peritoro, BR|-4.383|-44.333
Pereiro, BR|-6.042|-38.460
Pentecoste, BR|-3.793|-39.270
Penalva, BR|-3.294|-45.174
Pedro II, BR|-4.425|-41.459
Pedreiras, BR|-4.569|-44.592
Pedras de Fogo, BR|-7.402|-35.116
Pedra Branca, BR|-5.454|-39.717
Pedra, BR|-8.497|-36.941
Paulo Ramos, BR|-4.448|-45.241
Paulo Afonso, BR|-9.406|-38.215
Paulistana, BR|-8.144|-41.150
Paulista, BR|-7.941|-34.873
Paulino Neves, BR|-2.719|-42.533
Pau dos Ferros, BR|-6.109|-38.204
Paudalho, BR|-7.897|-35.180
Patos, BR|-7.024|-37.280
Pastos Bons, BR|-6.602|-44.077
Passira, BR|-7.995|-35.581
Passagem Franca, BR|-6.180|-43.784
Parnarama, BR|-5.682|-43.093
Parnamirim, BR|-8.091|-39.578
Parnamirim, BR|-5.916|-35.263
Parnaiba, BR|-2.905|-41.777
Parintins, BR|-2.628|-56.736
Parelhas, BR|-6.688|-36.657
Estreito, BR|-6.556|-47.441
Parambu, BR|-6.211|-40.694
Paraipaba, BR|-3.439|-39.148
Paraibano, BR|-6.433|-43.984
Paragominas, BR|-2.996|-47.355
Paracuru, BR|-3.410|-39.031
Pao de Acucar, BR|-9.748|-37.437
Panelas, BR|-8.664|-36.006
Palmares, BR|-8.683|-35.592
Pacatuba, BR|-3.984|-38.620
Pacajus, BR|-4.173|-38.461
Ouricuri, BR|-7.883|-40.082
Ourem, BR|-1.552|-47.114
Oros, BR|-6.244|-38.914
Orobo, BR|-7.745|-35.602
Oriximina, BR|-1.766|-55.866
Olinda, BR|-8.009|-34.855
Olho dAgua das Flores, BR|-9.536|-37.294
Oiapoque, BR|3.843|-51.835
Oeiras do Para, BR|-2.003|-49.854
Oeiras, BR|-7.025|-42.131
Ocara, BR|-4.491|-38.597
Obidos, BR|-1.917|-55.518
Novo Oriente, BR|-5.534|-40.774
Nova Timboteua, BR|-1.208|-47.392
Nova Russas, BR|-4.707|-40.563
Nova Olinda do Norte, BR|-3.892|-59.095
Nova Olinda, BR|-7.092|-39.681
Nova Cruz, BR|-6.478|-35.434
Nisia Floresta, BR|-6.091|-35.209
Nhamunda, BR|-2.186|-56.713
Nazare da Mata, BR|-7.742|-35.228
Natal, BR|-5.795|-35.209
Murici, BR|-9.307|-35.943
Muana, BR|-1.528|-49.217
Morros, BR|-2.864|-44.039
Morrinhos, BR|-3.229|-40.125
Moreno, BR|-8.119|-35.092
Morada Nova, BR|-5.107|-38.373
Monteiro, BR|-7.889|-37.120
Monte Alegre, BR|-6.068|-35.332
Monte Alegre, BR|-2.001|-54.081
Monsenhor Tabosa, BR|-4.789|-40.063
Moncao, BR|-3.492|-45.251
Mombaca, BR|-5.743|-39.627
Moju, BR|-1.884|-48.769
Mossoro, BR|-5.188|-37.344
Mocajuba, BR|-2.584|-49.507
Missao Velha, BR|-7.250|-39.143
Miranda do Norte, BR|-3.565|-44.580
Mirador, BR|-6.371|-44.363
Miracema do Tocantins, BR|-9.567|-48.392
Milagres, BR|-7.313|-38.946
Miguel Alves, BR|-4.166|-42.895
Messias, BR|-9.383|-35.842
Meruoca, BR|-3.542|-40.455
Melgaco, BR|-1.804|-50.712
Mazagao, BR|-0.115|-51.289
Mauriti, BR|-7.389|-38.774
Maues, BR|-3.384|-57.719
Matriz de Camaragibe, BR|-9.152|-35.533
Matoes, BR|-5.519|-43.199
Matinha, BR|-3.101|-45.034
Mata Grande, BR|-9.117|-37.732
Massape, BR|-3.523|-40.343
Mari, BR|-7.060|-35.319
Marechal Deodoro, BR|-9.710|-35.895
Marco, BR|-3.124|-40.147
Marapanim, BR|-0.718|-47.700
Maranguape, BR|-3.891|-38.686
Maragogi, BR|-9.012|-35.222
Maracanau, BR|-3.877|-38.626
Maracana, BR|-0.771|-47.452
Maracacume, BR|-2.043|-45.959
Maraba, BR|-5.381|-49.132
Manari, BR|-8.964|-37.628
Mamanguape, BR|-6.839|-35.126
Major Isidoro, BR|-9.532|-36.985
Madalena, BR|-4.857|-39.577
Maceio, BR|-9.666|-35.735
Macau, BR|-5.115|-36.634
Macaparana, BR|-7.555|-35.453
Macapa, BR|0.039|-51.066
Macaiba, BR|-5.858|-35.354
Luzilandia, BR|-3.458|-42.370
Luis Correia, BR|-2.879|-41.667
Limoeiro do Norte, BR|-5.146|-38.098
Limoeiro do Ajuru, BR|-1.895|-49.381
Limoeiro de Anadia, BR|-9.741|-36.503
Limoeiro, BR|-7.875|-35.450
Lavras da Mangabeira, BR|-6.753|-38.964
Lajedo, BR|-8.664|-36.320
Lago da Pedra, BR|-4.560|-45.132
Lagoa Seca, BR|-7.171|-35.854
Lagoa Nova, BR|-6.094|-36.472
Lagoa Grande, BR|-8.997|-40.272
Lagoa do Itaenga, BR|-7.936|-35.290
Lagoa do Carro, BR|-7.845|-35.320
Lagoa da Canoa, BR|-9.830|-36.738
Juruti, BR|-2.152|-56.092
Jupi, BR|-8.712|-36.415
Junqueiro, BR|-9.925|-36.476
Jucurutu, BR|-6.034|-37.020
Jucas, BR|-6.525|-39.528
Juazeiro do Norte, BR|-7.213|-39.315
Juazeiro, BR|-9.412|-40.499
Jose de Freitas, BR|-4.756|-42.576
Joaquim Gomes, BR|-9.133|-35.748
Joao Pessoa, BR|-7.115|-34.863
Joao Lisboa, BR|-5.448|-47.401
Joao Camara, BR|-5.537|-35.820
Joao Alfredo, BR|-7.856|-35.588
Girau do Ponciano, BR|-9.884|-36.829
Jatauba, BR|-7.990|-36.496
Jardim, BR|-7.582|-39.283
Jaicos, BR|-7.359|-41.138
Jaguaruana, BR|-4.834|-37.781
Jaguaribe, BR|-5.891|-38.622
Jaguaretama, BR|-5.613|-38.767
Jacunda, BR|-4.447|-49.116
Jacareacanga, BR|-6.222|-57.753
Itupiranga, BR|-5.135|-49.327
Itatira, BR|-4.529|-39.622
Itarema, BR|-2.920|-39.915
Itaquitinga, BR|-7.668|-35.102
Itacoatiara, BR|-3.143|-58.444
Itapororoca, BR|-6.830|-35.247
Itaporanga, BR|-7.304|-38.150
Itapiuna, BR|-4.564|-38.922
Itapissuma, BR|-7.776|-34.892
Itapipoca, BR|-3.494|-39.579
Itapecuru Mirim, BR|-3.393|-44.359
Itapage, BR|-3.687|-39.586
Ilha de Itamaraca, BR|-7.748|-34.826
Itaituba, BR|-4.276|-55.984
Itaitinga, BR|-3.969|-38.528
Itaiba, BR|-8.947|-37.423
Itabaiana, BR|-7.329|-35.333
Irituia, BR|-1.771|-47.438
Iraucuba, BR|-3.746|-39.783
Ipueiras, BR|-7.033|-40.450
Ipueiras, BR|-4.542|-40.719
Ipubi, BR|-7.652|-40.149
Ipu, BR|-4.322|-40.711
Ipojuca, BR|-8.399|-35.064
Inhuma, BR|-6.668|-41.708
Inhapi, BR|-9.221|-37.749
Inga, BR|-7.281|-35.604
Independencia, BR|-5.396|-40.309
Inaja, BR|-8.902|-37.824
Imperatriz, BR|-5.526|-47.492
Iguatu, BR|-6.359|-39.299
Igarape Miri, BR|-1.975|-48.960
Igarape-Acu, BR|-1.129|-47.620
Igarassu, BR|-7.834|-34.906
Igaci, BR|-9.537|-36.634
Ico, BR|-6.401|-38.862
Icatu, BR|-2.776|-44.066
Icapui, BR|-4.713|-37.355
Ibimirim, BR|-8.541|-37.690
Ibiapina, BR|-3.923|-40.889
Iati, BR|-9.046|-36.846
Humberto de Campos, BR|-2.598|-43.461
Horizonte, BR|-4.098|-38.486
Hidrolandia, BR|-4.408|-40.404
Gurupa, BR|-1.405|-51.640
Guaraciaba do Norte, BR|-4.167|-40.748
Guarabira, BR|-6.855|-35.490
Guarai, BR|-8.834|-48.510
Guamare, BR|-5.107|-36.320
Guaiuba, BR|-4.040|-38.637
Gravata, BR|-8.201|-35.565
Granja, BR|-3.120|-40.826
Grajau, BR|-5.819|-46.139
Goianinha, BR|-6.266|-35.210
Goiana, BR|-7.561|-35.002
Gloria do Goita, BR|-8.002|-35.293
Gloria, BR|-9.338|-38.255
Garanhuns, BR|-8.882|-36.502
Gameleira, BR|-8.584|-35.387
Fortuna, BR|-5.733|-44.158
Fortim, BR|-4.452|-37.797
Fortaleza, BR|-3.717|-38.543
Forquilha, BR|-3.798|-40.261
Formosa da Serra Negra, BR|-6.445|-46.189
Floriano, BR|-6.767|-43.023
Floresta, BR|-8.601|-38.569
Flores, BR|-7.868|-37.975
Ferreiros, BR|-7.447|-35.244
Feira Nova, BR|-7.951|-35.389
Feira Grande, BR|-9.900|-36.678
Farias Brito, BR|-6.928|-39.572
Exu, BR|-7.512|-39.724
Eusebio, BR|-3.890|-38.451
Extremoz, BR|-5.706|-35.307
Estreito, BR|-5.783|-43.250
Esperantinopolis, BR|-4.877|-44.882
Esperantina, BR|-3.902|-42.234
Esperanca, BR|-7.033|-35.857
Escada, BR|-8.359|-35.224
Dom Pedro, BR|-5.038|-44.437
Demerval Lobao, BR|-5.358|-42.676
Delmiro Gouveia, BR|-9.389|-37.999
Custodia, BR|-8.088|-37.643
Cururupu, BR|-1.828|-44.868
Curuca, BR|-0.729|-47.848
Curralinho, BR|-1.814|-49.795
Currais Novos, BR|-6.261|-36.518
Curaca, BR|-8.990|-39.909
Cupira, BR|-8.617|-35.950
Cumaru, BR|-8.006|-35.697
Cuite, BR|-6.484|-36.154
Cruz do Espirito Santo, BR|-7.140|-35.086
Croata, BR|-4.416|-40.905
Crato, BR|-7.234|-39.409
Crateus, BR|-5.178|-40.669
Craibas, BR|-9.618|-36.768
Quiterianopolis, BR|-5.844|-40.702
Correntes, BR|-9.129|-36.330
Coroata, BR|-4.130|-44.124
Coremas, BR|-7.014|-37.946
Coreau, BR|-3.551|-40.657
Condado, BR|-7.586|-35.106
Conceicao do Araguaia, BR|-8.264|-49.270
Conceicao, BR|-7.562|-38.509
Colonia Leopoldina, BR|-8.909|-35.725
Colinas, BR|-6.026|-44.249
Coelho Neto, BR|-4.257|-43.013
Codo, BR|-4.455|-43.886
Cocal, BR|-3.472|-41.557
Chorozinho, BR|-4.300|-38.498
Chaves, BR|-0.160|-49.988
Chapadinha, BR|-3.742|-43.360
Cha Grande, BR|-8.238|-35.462
Cedro, BR|-6.607|-39.062
Ceara-Mirim, BR|-5.634|-35.426
Caxias, BR|-4.859|-43.356
Caucaia, BR|-3.736|-38.653
Catole do Rocha, BR|-6.344|-37.747
Campo Alegre de Lourdes, BR|-9.517|-43.010
Catende, BR|-8.667|-35.717
Catarina, BR|-6.131|-39.877
Castelo do Piaui, BR|-5.322|-41.553
Castanhal, BR|-1.294|-47.926
Cascavel, BR|-4.133|-38.242
Casa Nova, BR|-9.174|-40.975
Carutapera, BR|-1.207|-46.024
Caruaru, BR|-8.283|-35.976
Carpina, BR|-7.851|-35.255
Carolina, BR|-7.336|-47.462
Carnaubal, BR|-4.167|-40.943
Carnaiba, BR|-7.805|-37.794
Carius, BR|-6.537|-39.497
Caririacu, BR|-7.042|-39.284
Carire, BR|-3.951|-40.473
Caridade, BR|-4.232|-39.193
Careiro da Varzea, BR|-3.197|-59.827
Caraubas, BR|-5.793|-37.557
Capoeiras, BR|-8.735|-36.627
Capitao Poco, BR|-1.746|-47.059
Capistrano, BR|-4.470|-38.901
Capela, BR|-9.408|-36.074
Capanema, BR|-1.196|-47.181
Canudos, BR|-9.897|-39.026
Canto do Buriti, BR|-8.110|-42.944
Cantanhede, BR|-3.633|-44.377
Caninde de Sao Francisco, BR|-9.660|-37.789
Caninde, BR|-4.359|-39.312
Canhotinho, BR|-8.882|-36.191
Canguaretama, BR|-6.380|-35.129
Candido Mendes, BR|-1.453|-45.728
Canapi, BR|-9.117|-37.602
Campos Sales, BR|-7.074|-40.376
Campo Maior, BR|-4.828|-42.169
Campo Alegre, BR|-9.782|-36.351
Campina Grande, BR|-7.231|-35.881
Camocim de Sao Felix, BR|-8.359|-35.762
Camocim, BR|-2.902|-40.841
Cameta, BR|-2.244|-49.496
Camaragibe, BR|-8.022|-34.981
Cajueiro, BR|-9.709|-36.448
Cajueiro, BR|-9.397|-36.154
Cajazeiras, BR|-6.890|-38.555
Cajari, BR|-3.321|-45.011
Caico, BR|-6.458|-37.098
Caetes, BR|-8.773|-36.623
Cacimba de Dentro, BR|-6.642|-35.790
Cachoeirinha, BR|-8.486|-36.233
Cachoeira do Arari, BR|-1.011|-48.963
Cabrobo, BR|-8.514|-39.310
Cabo de Santo Agostinho, BR|-8.288|-35.029
Cabedelo, BR|-6.981|-34.834
Caapora, BR|-7.516|-34.908
Buriti dos Lopes, BR|-3.175|-41.867
Buriti Bravo, BR|-5.837|-43.834
Buriti, BR|-3.942|-42.925
Bujaru, BR|-1.515|-48.045
Buique, BR|-8.623|-37.156
Breves, BR|-1.682|-50.480
Brejo Santo, BR|-7.493|-38.987
Brejo da Madre de Deus, BR|-8.146|-36.371
Brejo, BR|-3.684|-42.750
Braganca, BR|-1.054|-46.766
Borba, BR|-4.391|-59.589
Boqueirao, BR|-7.482|-36.132
Bonito, BR|-8.470|-35.729
Bonito, BR|-1.363|-47.306
Bom Jesus, BR|-9.074|-44.359
Bom Jardim, BR|-7.796|-35.587
Bom Conselho, BR|-9.170|-36.680
Bodoco, BR|-7.778|-39.941
Boca da Mata, BR|-9.641|-36.220
Boa Viagem, BR|-5.128|-39.732
Bezerros, BR|-8.233|-35.797
Bequimao, BR|-2.449|-44.782
Benevides, BR|-1.361|-48.245
Belterra, BR|-2.636|-54.937
Belo Jardim, BR|-8.336|-36.424
Belem de Sao Francisco, BR|-8.754|-38.966
Belem, BR|-6.692|-35.533
Belem, BR|-1.456|-48.504
Bela Cruz, BR|-3.051|-40.168
Beberibe, BR|-4.180|-38.131
Bayeux, BR|-7.125|-34.932
Baturite, BR|-4.329|-38.885
Batalha, BR|-9.678|-37.125
Batalha, BR|-4.025|-42.075
Barro, BR|-7.178|-38.780
Barreiros, BR|-8.818|-35.186
Barreirinhas, BR|-2.756|-42.826
Barreirinha, BR|-2.793|-57.070
Barreira, BR|-4.287|-38.643
Barras, BR|-4.244|-42.294
Barra do Corda, BR|-5.506|-45.243
Barra de Santo Antonio, BR|-9.405|-35.507
Barra de Santa Rosa, BR|-6.720|-36.061
Barcarena, BR|-1.506|-48.626
Barbalha, BR|-7.311|-39.304
Barauna, BR|-5.080|-37.617
Barao de Grajau, BR|-6.756|-43.024
Bananeiras, BR|-6.750|-35.633
Balsas, BR|-7.532|-46.036
Baiao, BR|-2.791|-49.672
Bagre, BR|-1.900|-50.208
Bacuri, BR|-1.728|-45.142
Bacabal, BR|-4.232|-44.782
Aveiro, BR|-3.606|-55.332
Autazes, BR|-3.580|-59.131
Aurora, BR|-6.942|-38.968
Augusto Correa, BR|-1.022|-46.635
Atalaia, BR|-9.502|-36.023
Assare, BR|-6.874|-39.875
Aroeiras, BR|-7.545|-35.708
Areia Branca, BR|-4.956|-37.137
Areia, BR|-6.963|-35.692
Arcoverde, BR|-8.419|-37.054
Araruna, BR|-6.558|-35.742
Araripina, BR|-7.576|-40.498
Araripe, BR|-7.213|-40.137
Arari, BR|-3.454|-44.780
Arapiraca, BR|-9.752|-36.661
Araioses, BR|-2.890|-41.903
Araguatins, BR|-5.651|-48.111
Araguaina, BR|-7.191|-48.207
Aracoiaba, BR|-7.790|-35.091
Aracoiaba, BR|-4.371|-38.814
Aracati, BR|-4.562|-37.770
Aracagi, BR|-6.853|-35.381
Aquiraz, BR|-3.901|-38.391
Apodi, BR|-5.664|-37.799
Sao Joao do Rio do Peixe, BR|-6.729|-38.449
Ananindeua, BR|-1.366|-48.372
Anajatuba, BR|-3.264|-44.620
Anajas, BR|-0.987|-49.940
Anadia, BR|-9.684|-36.304
Amontada, BR|-3.362|-39.832
Amarante do Maranhao, BR|-5.567|-46.742
Amarante, BR|-6.243|-42.845
Amaraji, BR|-8.383|-35.453
Altos, BR|-5.038|-42.460
Altinho, BR|-8.490|-36.059
Altamira, BR|-3.203|-52.206
Almeirim, BR|-1.523|-52.582
Alianca, BR|-7.603|-35.231
Alhandra, BR|-7.439|-34.914
Alenquer, BR|-1.942|-54.738
Alcantara, BR|-2.404|-44.417
Alagoa Nova, BR|-7.071|-35.758
Alagoa Grande, BR|-7.042|-35.627
Aguas Belas, BR|-9.111|-37.123
Agua Preta, BR|-8.707|-35.531
Agua Branca, BR|-9.261|-37.936
Agua Branca, BR|-5.892|-42.636
Agrestina, BR|-8.458|-35.945
Afua, BR|-0.157|-50.387
Afranio, BR|-8.515|-41.005
Afogados da Ingazeira, BR|-7.751|-37.639
Acu, BR|-5.577|-36.909
Acopiara, BR|-6.095|-39.453
Acarau, BR|-2.886|-40.120
Acara, BR|-1.961|-48.197
Abreu e Lima, BR|-7.912|-34.903
Abare, BR|-8.720|-39.114
Abaetetuba, BR|-1.718|-48.883
Mata Roma, BR|-3.625|-43.111
Colinas do Tocantins, BR|-8.059|-48.475
Xique-Xique, BR|-10.823|-42.728
Xaxim, BR|-26.962|-52.535
Xanxere, BR|-26.877|-52.404
Votuporanga, BR|-20.423|-49.973
Votorantim, BR|-23.547|-47.438
Volta Redonda, BR|-22.523|-44.104
Vitoria da Conquista, BR|-14.866|-40.839
Vitoria, BR|-20.319|-40.338
Visconde do Rio Branco, BR|-21.010|-42.841
Viradouro, BR|-20.873|-48.297
Vinhedo, BR|-23.030|-46.975
Vila Velha, BR|-20.330|-40.292
Vila Mariana, BR|-23.588|-46.635
Vila Maria, BR|-23.514|-46.586
Videira, BR|-27.008|-51.152
Vicosa, BR|-20.754|-42.882
Viana, BR|-20.390|-40.496
Viamao, BR|-30.081|-51.023
Vespasiano, BR|-19.692|-43.923
Veranopolis, BR|-28.936|-51.549
Vera Cruz, BR|-12.633|-41.033
Wenceslau Braz, BR|-23.874|-49.803
Venancio Aires, BR|-29.606|-52.192
Vazante, BR|-17.987|-46.908
Vassouras, BR|-22.404|-43.663
Varzelandia, BR|-15.701|-44.028
Varzea Paulista, BR|-23.211|-46.828
Varzea Grande, BR|-15.647|-56.133
Varzea da Palma, BR|-17.598|-44.734
Varginha, BR|-21.551|-45.430
Vargem Grande do Sul, BR|-21.832|-46.894
Vargem Alta, BR|-20.671|-41.007
Valparaiso, BR|-21.228|-50.868
Valinhos, BR|-22.971|-46.996
Valente, BR|-11.412|-39.462
Valenca, BR|-22.246|-43.700
Valenca, BR|-13.370|-39.073
Vacaria, BR|-28.512|-50.934
Utinga, BR|-12.082|-41.094
Urussanga, BR|-28.518|-49.321
Uruguaiana, BR|-29.755|-57.088
Urucuia, BR|-16.133|-45.742
Urucuca, BR|-14.593|-39.284
Uruacu, BR|-14.525|-49.141
Urandi, BR|-14.771|-42.655
Uniao da Vitoria, BR|-26.230|-51.086
Unai, BR|-16.358|-46.906
Una, BR|-15.293|-39.075
Umuarama, BR|-23.766|-53.325
Umburanas, BR|-10.733|-41.326
Umbauba, BR|-11.383|-37.658
Uberlandia, BR|-18.919|-48.277
Uberaba, BR|-19.748|-47.932
Ubatuba, BR|-23.434|-45.071
Ubata, BR|-14.209|-39.526
Ubaitaba, BR|-14.312|-39.323
Ubaira, BR|-13.268|-39.663
Uba, BR|-21.120|-42.943
Turmalina, BR|-17.286|-42.730
Tupi Paulista, BR|-21.381|-51.571
Boa Vista do Tupim, BR|-12.662|-40.607
Tupancireta, BR|-29.081|-53.836
Tupaciguara, BR|-18.592|-48.705
Tupa, BR|-21.935|-50.514
Tucuruvi, BR|-23.475|-46.606
Tucano, BR|-10.958|-38.791
Tubarao, BR|-28.467|-49.007
Triunfo, BR|-29.943|-51.718
Trindade, BR|-16.649|-49.489
Tres Rios, BR|-22.117|-43.209
Tres Pontas, BR|-21.367|-45.513
Tres Passos, BR|-27.456|-53.932
Tres Lagoas, BR|-20.788|-51.703
Tres de Maio, BR|-27.773|-54.240
Tres Coroas, BR|-29.517|-50.778
Tres Coracoes, BR|-21.697|-45.253
Tres Barras, BR|-26.106|-50.322
Tremembe, BR|-22.958|-45.549
Tremedal, BR|-14.976|-41.411
Amelia Rodrigues, BR|-12.399|-38.755
Tramandai, BR|-29.985|-50.134
Torres, BR|-29.335|-49.727
Toledo, BR|-24.714|-53.743
Tocantins, BR|-21.175|-43.018
Tobias Barreto, BR|-11.184|-37.998
Timoteo, BR|-19.581|-42.650
Timbo, BR|-26.823|-49.272
Tijucas do Sul, BR|-25.928|-49.180
Tijucas, BR|-27.241|-48.634
Tiete, BR|-23.102|-47.715
Tibagi, BR|-24.509|-50.414
Teutonia, BR|-29.448|-51.806
Terra Rica, BR|-22.726|-52.620
Terra Preta, BR|-22.633|-47.050
Terra Boa, BR|-23.768|-52.444
Teresopolis, BR|-22.417|-42.978
Vera Cruz, BR|-29.717|-52.503
Terenos, BR|-20.442|-54.860
Teofilo Otoni, BR|-17.858|-41.505
Teodoro Sampaio, BR|-22.532|-52.167
Telemaco Borba, BR|-24.324|-50.616
Taubate, BR|-23.026|-45.555
Tatui, BR|-23.356|-47.857
Taquarituba, BR|-23.533|-49.244
Taquaritinga, BR|-21.406|-48.505
Taquari, BR|-29.800|-51.864
Taquara, BR|-29.651|-50.781
Tapiramuta, BR|-11.847|-40.791
Taperoa, BR|-13.538|-39.099
Tapejara, BR|-28.068|-52.014
Tapejara, BR|-23.733|-52.873
Tanque Novo, BR|-13.546|-42.491
Tanhacu, BR|-14.021|-41.248
Tangua, BR|-22.730|-42.714
Tanabi, BR|-20.626|-49.649
Tambau, BR|-21.705|-47.274
Tamarana, BR|-23.723|-51.097
Taiobeiras, BR|-15.808|-42.233
Taio, BR|-27.116|-49.998
Taboao da Serra, BR|-23.626|-46.792
Suzano, BR|-23.543|-46.311
Sumidouro, BR|-22.050|-42.675
Sumare, BR|-22.822|-47.267
Souzas, BR|-22.879|-46.964
Sorocaba, BR|-23.502|-47.458
Sombrio, BR|-29.114|-49.617
Soledade, BR|-28.818|-52.510
Socorro, BR|-22.591|-46.529
Sobradinho, BR|-15.647|-47.793
Sobradinho, BR|-12.833|-39.100
Siqueira Campos, BR|-23.689|-49.834
Simonesia, BR|-20.124|-42.001
Simao Dias, BR|-10.738|-37.811
Silvania, BR|-16.667|-48.613
Silva Jardim, BR|-22.651|-42.392
Sidrolandia, BR|-20.932|-54.961
Sete Lagoas, BR|-19.466|-44.247
Sertaozinho, BR|-21.138|-47.990
Sertanopolis, BR|-23.059|-51.036
Serro, BR|-18.605|-43.379
Serrinha, BR|-11.664|-39.008
Serra Preta, BR|-12.160|-39.332
Serra Negra, BR|-22.612|-46.701
Serrana, BR|-21.211|-47.596
Serra, BR|-20.129|-40.308
Seropedica, BR|-22.744|-43.708
Serafina Correa, BR|-28.712|-51.935
Sepetiba, BR|-22.979|-43.698
Senhor do Bonfim, BR|-10.461|-40.189
Senges, BR|-24.113|-49.463
Senador Canedo, BR|-16.708|-49.093
Seara, BR|-27.149|-52.311
Seabra, BR|-12.417|-41.770
Schroeder, BR|-26.413|-49.073
Satiro Dias, BR|-11.604|-38.583
Sarzedo, BR|-20.035|-44.145
Sarandi, BR|-27.944|-52.923
Sarandi, BR|-23.444|-51.874
Saquarema, BR|-22.899|-42.470
Sapucaia do Sul, BR|-29.818|-51.146
Sapucaia, BR|-21.995|-42.914
Sapiranga, BR|-29.638|-51.007
Sapeacu, BR|-12.727|-39.182
Sao Vicente, BR|-23.963|-46.392
Sao Simao, BR|-18.991|-50.544
Sao Sepe, BR|-30.161|-53.565
Sao Sebastiao do Passe, BR|-12.512|-38.495
Sao Sebastiao do Paraiso, BR|-20.917|-46.991
Sao Sebastiao do Cai, BR|-29.587|-51.376
Sao Sebastiao, BR|-23.760|-45.410
Sao Roque, BR|-23.529|-47.135
Sao Pedro do Sul, BR|-29.621|-54.179
Sao Pedro da Aldeia, BR|-22.839|-42.103
Sao Pedro, BR|-22.549|-47.914
Sao Paulo, BR|-23.547|-46.636
Sao Miguel, BR|-23.494|-46.432
Sao Miguel do Iguacu, BR|-25.348|-54.238
Sao Miguel dOeste, BR|-26.725|-53.518
Sao Miguel do Araguaia, BR|-13.275|-50.163
Sao Miguel Arcanjo, BR|-23.878|-47.997
Sao Mateus do Sul, BR|-25.874|-50.383
Sao Mateus, BR|-18.720|-39.859
Sao Marcos, BR|-28.971|-51.068
Sao Manuel, BR|-22.731|-48.571
Sao Luiz Gonzaga, BR|-28.408|-54.961
Sao Luis de Montes Belos, BR|-16.525|-50.372
Sao Lourenco do Sul, BR|-31.365|-51.978
Sao Lourenco do Oeste, BR|-26.359|-52.851
Sao Lourenco da Serra, BR|-23.852|-46.943
Sao Lourenco, BR|-22.116|-45.054
Sao Leopoldo, BR|-29.760|-51.147
Sao Jose dos Pinhais, BR|-25.530|-49.208
Sao Jose dos Campos, BR|-23.179|-45.887
Sao Jose do Vale do Rio Preto, BR|-22.152|-42.923
Sao Jose do Rio Preto, BR|-20.820|-49.379
Sao Jose do Rio Pardo, BR|-21.596|-46.889
Sao Jose do Norte, BR|-32.015|-52.042
Sao Jose, BR|-28.213|-49.164
Sao Jose, BR|-27.615|-48.627
Sao Joaquim de Bicas, BR|-20.049|-44.274
Sao Joaquim da Barra, BR|-20.581|-47.855
Sao Joaquim, BR|-28.294|-49.932
Sao Joao Nepomuceno, BR|-21.540|-43.011
Sao Joao Evangelista, BR|-18.548|-42.763
Sao Joao do Paraiso, BR|-15.314|-42.014
Sao Joao de Meriti, BR|-22.804|-43.372
Sao Joao del Rei, BR|-21.136|-44.262
Sao Joao da Ponte, BR|-15.929|-44.008
Sao Joao da Boa Vista, BR|-21.969|-46.798
Sao Joao da Barra, BR|-21.640|-41.051
Sao Joao Batista, BR|-27.276|-48.849
Sao Jeronimo, BR|-29.959|-51.722
Sao Gotardo, BR|-19.311|-46.049
Sao Goncalo dos Campos, BR|-12.434|-38.951
Sao Goncalo do Sapucai, BR|-21.892|-45.595
Sao Goncalo, BR|-22.827|-43.054
Sao Gabriel, BR|-30.336|-54.320
Sao Gabriel da Palha, BR|-19.018|-40.537
Sao Francisco do Sul, BR|-26.243|-48.638
Sao Francisco do Conde, BR|-12.627|-38.680
Sao Francisco de Paula, BR|-29.448|-50.584
Sao Francisco de Assis, BR|-29.550|-55.131
Sao Francisco, BR|-15.949|-44.864
Sao Felipe, BR|-12.847|-39.089
Sao Fidelis, BR|-21.646|-41.747
Sao Domingos do Prata, BR|-19.865|-42.968
Sao Desiderio, BR|-12.363|-44.973
Sao Cristovao, BR|-11.015|-37.206
Sao Carlos, BR|-22.017|-47.891
Sao Caetano do Sul, BR|-23.623|-46.551
Sao Borja, BR|-28.661|-56.004
Sao Bernardo do Campo, BR|-23.694|-46.565
Sao Bento do Sul, BR|-26.250|-49.379
Santos Dumont, BR|-21.457|-43.553
Santos, BR|-23.961|-46.334
Santo Estevao, BR|-12.430|-39.251
Santo Cristo, BR|-27.824|-54.663
Santo Antonio do Sudoeste, BR|-26.074|-53.725
Santo Antonio do Monte, BR|-20.087|-45.294
Santo Antonio do Leverger, BR|-15.866|-56.077
Santo Antonio do Amparo, BR|-20.946|-44.919
Santo Antonio de Posse, BR|-22.606|-46.919
Santo Antonio de Padua, BR|-21.539|-42.180
Santo Antonio de Jesus, BR|-12.969|-39.261
Santo Antonio da Platina, BR|-23.295|-50.077
Santo Antonio da Patrulha, BR|-29.817|-50.520
Santo Angelo, BR|-28.299|-54.263
Santo Andre, BR|-23.664|-46.538
Santo Amaro da Imperatriz, BR|-27.688|-48.779
Santo Amaro, BR|-23.645|-46.704
Santo Amaro, BR|-12.547|-38.712
Santiago, BR|-29.192|-54.867
Santa Vitoria do Palmar, BR|-33.519|-53.368
Santa Vitoria, BR|-18.839|-50.121
Santa Teresa, BR|-19.936|-40.600
Santa Rosa de Viterbo, BR|-21.473|-47.363
Santa Rosa, BR|-27.871|-54.481
Santa Rita do Sapucai, BR|-22.252|-45.703
Santa Rita do Passa Quatro, BR|-21.710|-47.478
Nova Santa Rita, BR|-29.852|-51.277
Santana do Paraiso, BR|-19.364|-42.569
SantAna do Livramento, BR|-30.891|-55.533
Santana de Parnaiba, BR|-23.444|-46.918
Santana, BR|-12.983|-44.051
Santa Maria da Vitoria, BR|-13.388|-44.199
Santa Maria, BR|-29.684|-53.807
Santa Margarida, BR|-20.384|-42.251
Santa Luzia, BR|-19.770|-43.851
Santaluz, BR|-11.256|-39.375
Santa Juliana, BR|-19.309|-47.525
Santa Isabel, BR|-23.316|-46.221
Santa Helena de Goias, BR|-17.814|-50.597
Santa Helena, BR|-24.860|-54.333
Santa Gertrudes, BR|-22.457|-47.530
Santa Fe do Sul, BR|-20.211|-50.926
Santa Cruz do Sul, BR|-29.718|-52.426
Santa Cruz do Rio Pardo, BR|-22.899|-49.633
Santa Cruz das Palmeiras, BR|-21.827|-47.249
Santa Cruz Cabralia, BR|-16.278|-39.025
Santa Cecilia, BR|-26.961|-50.427
Santa Barbara dOeste, BR|-22.754|-47.414
Santa Barbara, BR|-19.959|-43.415
Sananduva, BR|-27.950|-51.807
Salvador, BR|-12.976|-38.491
Salto de Pirapora, BR|-23.649|-47.573
Salto, BR|-23.201|-47.287
Salinas, BR|-16.170|-42.290
Salgado, BR|-11.032|-37.475
Salesopolis, BR|-23.529|-45.849
Sacramento, BR|-19.865|-47.440
Sabara, BR|-19.886|-43.807
Ruy Barbosa, BR|-12.284|-40.494
Rubiataba, BR|-15.164|-49.803
Rosario Oeste, BR|-14.836|-56.428
Rosario do Sul, BR|-30.258|-54.914
Rondonopolis, BR|-16.471|-54.636
Rolante, BR|-29.651|-50.576
Rolandia, BR|-23.310|-51.369
Rio Verde de Mato Grosso, BR|-18.918|-54.844
Rio Verde, BR|-17.798|-50.928
Rio Real, BR|-11.485|-37.933
Rio Pomba, BR|-21.275|-43.179
Rio Pardo de Minas, BR|-15.610|-42.540
Rio Pardo, BR|-29.990|-52.378
Rio Negro, BR|-26.106|-49.797
Rio Negrinho, BR|-26.254|-49.518
Rio Grande da Serra, BR|-23.744|-46.398
Rio Grande, BR|-32.035|-52.099
Rio do Sul, BR|-27.214|-49.643
Rio do Antonio, BR|-14.411|-42.076
Rio de Janeiro, BR|-22.906|-43.182
Rio das Pedras, BR|-22.843|-47.606
Rio das Ostras, BR|-22.527|-41.945
Wenceslau Guimaraes, BR|-13.686|-39.478
Rio Claro, BR|-22.723|-44.136
Rio Claro, BR|-22.411|-47.561
Rio Brilhante, BR|-21.802|-54.546
Rio Branco do Sul, BR|-25.190|-49.314
Rio Bonito, BR|-22.709|-42.610
Rio Bananal, BR|-19.265|-40.333
Rio Azul, BR|-25.733|-50.796
Ribeiropolis, BR|-10.539|-37.417
Ribeirao Preto, BR|-21.177|-47.810
Ribeirao Pires, BR|-23.711|-46.413
Ribeirao das Neves, BR|-19.767|-44.087
Ribeirao da Ilha, BR|-27.699|-48.532
Ribeirao Branco, BR|-24.221|-48.766
Ribeira do Pombal, BR|-10.834|-38.536
Ribas do Rio Pardo, BR|-20.443|-53.759
Riacho de Santana, BR|-13.609|-42.939
Riachao do Jacuipe, BR|-11.807|-39.386
Riachao do Dantas, BR|-11.069|-37.725
Riachao das Neves, BR|-11.746|-44.910
Resplendor, BR|-19.326|-41.255
Reserva, BR|-24.650|-50.851
Resende, BR|-22.469|-44.447
Registro, BR|-24.488|-47.844
Regente Feijo, BR|-22.221|-51.303
Realeza, BR|-25.769|-53.532
Raul Soares, BR|-20.102|-42.453
Raposos, BR|-19.967|-43.804
Rancharia, BR|-22.229|-50.893
Quissama, BR|-22.107|-41.472
Quirinopolis, BR|-18.448|-50.452
Quijingue, BR|-10.752|-39.209
Queimados, BR|-22.716|-43.555
Queimadas, BR|-10.978|-39.626
Quatro Barras, BR|-25.366|-49.077
Quarai, BR|-30.387|-56.451
Prudentopolis, BR|-25.213|-50.978
Propria, BR|-10.211|-36.840
Promissao, BR|-21.537|-49.858
Presidente Venceslau, BR|-21.876|-51.844
Presidente Prudente, BR|-22.126|-51.389
Presidente Olegario, BR|-18.418|-46.418
Presidente Getulio, BR|-27.051|-49.623
Presidente Epitacio, BR|-21.763|-52.116
Prata, BR|-19.307|-48.924
Praia Grande, BR|-24.006|-46.403
Pradopolis, BR|-21.359|-48.066
Prado, BR|-17.341|-39.221
Poxoreu, BR|-15.837|-54.389
Pouso Redondo, BR|-27.258|-49.934
Pouso Alegre, BR|-22.230|-45.936
Potirendaba, BR|-21.043|-49.377
Posse, BR|-14.093|-46.369
Porto Uniao, BR|-26.238|-51.078
Porto Seguro, BR|-16.450|-39.065
Porto Real do Colegio, BR|-10.186|-36.840
Porto Real, BR|-22.420|-44.290
Porto Nacional, BR|-10.708|-48.417
Porto Ferreira, BR|-21.854|-47.479
Porto Feliz, BR|-23.215|-47.524
Porto Belo, BR|-27.158|-48.553
Porto Alegre, BR|-30.033|-51.230
Porteirinha, BR|-15.743|-43.028
Portao, BR|-29.702|-51.242
Porciuncula, BR|-20.963|-42.041
Porangatu, BR|-13.441|-49.149
Pontes e Lacerda, BR|-15.226|-59.335
Ponte Nova, BR|-20.416|-42.909
Ponta Pora, BR|-22.536|-55.726
Pontalina, BR|-17.525|-49.447
Pontal, BR|-21.023|-48.037
Ponta Grossa, BR|-25.095|-50.162
Pompeu, BR|-19.224|-44.935
Pompeia, BR|-22.109|-50.172
Pomerode, BR|-26.741|-49.177
Pojuca, BR|-12.431|-38.328
Poco Verde, BR|-10.708|-38.183
Pocos de Caldas, BR|-21.788|-46.561
Pocone, BR|-16.257|-56.623
Poco Fundo, BR|-21.781|-45.965
Pocoes, BR|-14.530|-40.365
Poa, BR|-23.528|-46.345
Planaltina, BR|-15.453|-47.614
Piuma, BR|-20.838|-40.722
Piumhi, BR|-20.465|-45.958
Pitangui, BR|-19.683|-44.890
Pitangueiras, BR|-21.009|-48.222
Pitanga, BR|-24.757|-51.761
Piritiba, BR|-11.730|-40.555
Pires do Rio, BR|-17.300|-48.279
Pirenopolis, BR|-15.851|-48.961
Piratininga, BR|-22.413|-49.135
Piratini, BR|-31.448|-53.104
Piraquara, BR|-25.442|-49.068
Pirapozinho, BR|-22.275|-51.500
Pirapora do Bom Jesus, BR|-23.397|-47.002
Pirapora, BR|-17.345|-44.942
Piranga, BR|-20.685|-43.300
Pirajui, BR|-21.999|-49.457
Piraju, BR|-23.194|-49.384
Pirai do Sul, BR|-24.526|-49.949
Pirai, BR|-22.629|-43.898
Pirassununga, BR|-21.996|-47.426
Piracicaba, BR|-22.725|-47.649
Piracanjuba, BR|-17.303|-49.017
Piracaia, BR|-23.054|-46.358
Pinheiros, BR|-23.567|-46.692
Pinheiral, BR|-22.513|-44.001
Pinhao, BR|-25.696|-51.660
Pinhalzinho, BR|-26.848|-52.992
Pinhalzinho, BR|-22.779|-46.591
Espirito Santo do Pinhal, BR|-22.196|-46.749
Pindobacu, BR|-10.742|-40.361
Pindamonhangaba, BR|-22.924|-45.462
Pindai, BR|-14.492|-42.687
Pilar do Sul, BR|-23.813|-47.716
Piedade, BR|-23.712|-47.428
Balneario Picarras, BR|-26.764|-48.672
Nova Hartz, BR|-29.584|-50.903
Piata, BR|-13.152|-41.773
Piacabucu, BR|-10.406|-36.434
Petropolis, BR|-22.505|-43.179
Perus, BR|-23.405|-46.755
Peruibe, BR|-24.320|-46.998
Pereira Barreto, BR|-20.638|-51.109
Perdoes, BR|-21.091|-45.091
Perdizes, BR|-19.353|-47.293
Penha, BR|-26.769|-48.646
Penedo, BR|-10.290|-36.586
Penapolis, BR|-21.420|-50.078
Serra Dourada, BR|-12.761|-43.950
Pelotas, BR|-31.770|-52.341
Pedro Leopoldo, BR|-19.618|-44.043
Pedreira, BR|-22.742|-46.901
Pedregulho, BR|-20.257|-47.477
Pedra Azul, BR|-16.005|-41.297
Pederneiras, BR|-22.352|-48.775
Pecanha, BR|-18.549|-42.557
Paulinia, BR|-22.761|-47.154
Patrocinio, BR|-18.944|-46.992
Patos de Minas, BR|-18.579|-46.518
Pato Branco, BR|-26.229|-52.671
Paty do Alferes, BR|-22.429|-43.419
Posto da Mata, BR|-17.886|-39.859
Passos, BR|-20.719|-46.610
Passo Fundo, BR|-28.263|-52.407
Alvorada, BR|-30.000|-51.076
Passa Quatro, BR|-22.390|-44.967
Parobe, BR|-29.629|-50.835
Pariquera-Acu, BR|-24.715|-47.881
Paripiranga, BR|-10.688|-37.862
Parelheiros, BR|-23.828|-46.727
Paratinga, BR|-12.691|-43.184
Rafael Jambeiro, BR|-12.408|-39.501
Paraty, BR|-23.218|-44.713
Paraopeba, BR|-19.274|-44.404
Paranoa, BR|-15.776|-47.781
Paranavai, BR|-23.073|-52.465
Paranapanema, BR|-23.386|-48.724
Paranaiba, BR|-19.677|-51.191
Paranagua, BR|-25.516|-48.525
Paramirim, BR|-13.443|-42.239
Paraisopolis, BR|-22.554|-45.780
Paraibuna, BR|-23.386|-45.662
Paraiba do Sul, BR|-22.158|-43.293
Paraguacu Paulista, BR|-22.413|-50.576
Paraguacu, BR|-21.547|-45.737
Para de Minas, BR|-19.860|-44.608
Paracatu, BR|-17.222|-46.875
Paracambi, BR|-22.608|-43.709
Papanduva, BR|-26.370|-50.144
Pancas, BR|-19.225|-40.851
Panambi, BR|-28.293|-53.502
Palotina, BR|-24.284|-53.840
Palmitos, BR|-27.067|-53.161
Palmital, BR|-22.789|-50.218
Palmeiras de Goias, BR|-16.805|-49.926
Palmeira das Missoes, BR|-27.899|-53.314
Palmeira, BR|-25.429|-50.006
Palmas de Monte Alto, BR|-14.267|-43.162
Palmas, BR|-26.484|-51.991
Palhoca, BR|-27.645|-48.668
Paicandu, BR|-23.457|-52.049
Padre Paraiso, BR|-17.074|-41.484
Padre Bernardo, BR|-15.165|-48.284
Santa Barbara, BR|-11.958|-38.975
Ouro Preto, BR|-20.395|-43.505
Ouro Fino, BR|-22.283|-46.369
Ouro Branco, BR|-20.523|-43.695
Ourolandia, BR|-10.971|-41.080
Ourinhos, BR|-22.979|-49.871
Otacilio Costa, BR|-27.483|-50.122
Osvaldo Cruz, BR|-21.797|-50.879
Osorio, BR|-29.887|-50.270
Osasco, BR|-23.532|-46.792
Ortigueira, BR|-24.208|-50.949
Orleans, BR|-28.359|-49.291
Orlandia, BR|-20.720|-47.887
Orizona, BR|-17.031|-48.296
Oliveira dos Brejinhos, BR|-12.317|-42.896
Oliveira, BR|-20.696|-44.827
Olindina, BR|-11.367|-38.333
Olimpia, BR|-20.737|-48.915
Nucleo Bandeirante, BR|-15.871|-47.969
Novo Horizonte, BR|-21.468|-49.221
Novo Hamburgo, BR|-29.678|-51.131
Novo Cruzeiro, BR|-17.468|-41.875
Nova Vicosa, BR|-17.892|-39.372
Nova Venecia, BR|-18.711|-40.401
Nova Soure, BR|-11.233|-38.483
Nova Serrana, BR|-19.876|-44.984
Nova Resende, BR|-21.126|-46.420
Nova Prata, BR|-28.784|-51.610
Nova Petropolis, BR|-29.376|-51.114
Nova Olimpia, BR|-14.797|-57.288
Nova Odessa, BR|-22.777|-47.296
Nova Lima, BR|-19.986|-43.847
Nova Iguacu, BR|-22.759|-43.451
Nova Granada, BR|-20.534|-49.314
Nova Friburgo, BR|-22.282|-42.531
Nova Esperanca, BR|-23.184|-52.205
Nova Era, BR|-19.750|-43.038
Nossa Senhora do Socorro, BR|-10.855|-37.126
Freguesia do O, BR|-23.499|-46.700
Nossa Senhora das Dores, BR|-10.492|-37.193
Nossa Senhora da Gloria, BR|-10.218|-37.420
Nobres, BR|-14.720|-56.328
Niteroi, BR|-22.883|-43.104
Niquelandia, BR|-14.474|-48.460
Nilopolis, BR|-22.808|-43.414
Neropolis, BR|-16.406|-49.219
Nepomuceno, BR|-21.233|-45.235
Neopolis, BR|-10.320|-36.579
Nazare Paulista, BR|-23.181|-46.395
Nazare, BR|-13.035|-39.014
Navirai, BR|-23.065|-54.191
Navegantes, BR|-26.899|-48.654
Natividade, BR|-21.042|-41.973
Nao-Me-Toque, BR|-28.459|-52.821
Nanuque, BR|-17.839|-40.354
Muzambinho, BR|-21.376|-46.526
Mutum, BR|-19.800|-41.438
Mutuipe, BR|-13.229|-39.505
Muritiba, BR|-12.917|-39.250
Muritiba, BR|-12.626|-38.990
Muriae, BR|-21.131|-42.366
Muniz Freire, BR|-20.464|-41.413
Mundo Novo, BR|-11.859|-40.472
Mucuri, BR|-18.086|-39.551
Mozarlandia, BR|-14.745|-50.571
Morro do Chapeu, BR|-11.549|-41.158
Morro da Fumaca, BR|-28.651|-49.210
Morro Agudo, BR|-20.731|-48.058
Morrinhos, BR|-17.731|-49.099
Morretes, BR|-25.477|-48.834
Monte Siao, BR|-22.433|-46.572
Montes Claros, BR|-16.735|-43.862
Monte Santo de Minas, BR|-21.190|-46.980
Monte Santo, BR|-10.438|-39.333
Montenegro, BR|-29.689|-51.461
Monte Mor, BR|-22.947|-47.316
Monte Carmelo, BR|-18.725|-47.499
Monte Azul Paulista, BR|-20.907|-48.641
Monte Azul, BR|-15.155|-42.875
Monte Aprazivel, BR|-20.773|-49.714
Monte Alto, BR|-21.261|-48.496
Monte Alegre de Minas, BR|-18.871|-48.881
Montanha, BR|-18.127|-40.363
Mongagua, BR|-24.093|-46.621
Mogi Mirim, BR|-22.432|-46.958
Mogi Guacu, BR|-22.368|-46.946
Mogi das Cruzes, BR|-23.523|-46.188
Mococa, BR|-21.468|-47.005
Mirassol, BR|-20.819|-49.521
Mirante do Paranapanema, BR|-22.292|-51.906
Mirangaba, BR|-10.954|-40.576
Mirandopolis, BR|-21.134|-51.102
Miranda, BR|-20.241|-56.378
Miracema, BR|-21.412|-42.197
Miracatu, BR|-24.281|-47.460
Mineiros, BR|-17.569|-52.551
Minas Novas, BR|-17.219|-42.590
Mimoso do Sul, BR|-21.064|-41.366
Miguel Pereira, BR|-22.454|-43.469
Miguelopolis, BR|-20.179|-48.032
Miguel Calmon, BR|-11.429|-40.595
Mendes, BR|-22.527|-43.733
Medina, BR|-16.223|-41.477
Medianeira, BR|-25.295|-54.094
Medeiros Neto, BR|-17.374|-40.221
Maua, BR|-23.668|-46.461
Matozinhos, BR|-19.558|-44.081
Vila Bela da Santissima Trindade, BR|-15.008|-59.951
Matipo, BR|-20.284|-42.341
Matinhos, BR|-25.832|-48.540
Mateus Leme, BR|-19.986|-44.428
Matelandia, BR|-25.240|-53.982
Matao, BR|-21.603|-48.366
Mata de Sao Joao, BR|-12.530|-38.299
Massaranduba, BR|-26.611|-49.008
Maruim, BR|-10.738|-37.082
Martinopolis, BR|-22.146|-51.171
Maringa, BR|-23.425|-51.939
Marilia, BR|-22.214|-49.946
Marica, BR|-22.919|-42.819
Mariana, BR|-20.378|-43.416
Marialva, BR|-23.485|-51.792
Marechal Floriano, BR|-20.413|-40.683
Marechal Candido Rondon, BR|-24.556|-54.057
Maravilha, BR|-26.761|-53.172
Marau, BR|-28.449|-52.200
Marau, BR|-14.104|-39.015
Marataizes, BR|-21.043|-40.824
Maragogipe, BR|-12.778|-38.919
Maracas, BR|-13.441|-40.431
Maracaju, BR|-21.614|-55.168
Mantena, BR|-18.782|-40.980
Manhumirim, BR|-20.358|-41.958
Manhuacu, BR|-20.258|-42.034
Mangueirinha, BR|-25.941|-52.176
Mangaratiba, BR|-22.960|-44.041
Manga, BR|-14.756|-43.932
Mandirituba, BR|-25.779|-49.326
Mandaguari, BR|-23.521|-51.682
Mandaguacu, BR|-23.347|-52.095
Malhada, BR|-14.336|-43.774
Malacacheta, BR|-17.842|-42.077
Mairipora, BR|-23.319|-46.587
Mairinque, BR|-23.546|-47.183
Mairi, BR|-11.711|-40.149
Mage, BR|-22.653|-43.041
Mafra, BR|-26.111|-49.805
Madre de Deus, BR|-12.741|-38.621
Machado, BR|-21.675|-45.920
Macaubas, BR|-13.019|-42.699
Macatuba, BR|-22.502|-48.711
Macarani, BR|-15.568|-40.423
Macae, BR|-22.385|-41.783
Luziania, BR|-16.253|-47.950
Luz, BR|-19.801|-45.686
Lucelia, BR|-21.720|-51.019
Lucas, BR|-16.333|-55.933
Louveira, BR|-23.086|-46.951
Lorena, BR|-22.731|-45.125
Londrina, BR|-23.310|-51.163
Loanda, BR|-22.923|-53.137
Livramento do Brumado, BR|-13.651|-41.846
Lins, BR|-21.679|-49.742
Linhares, BR|-19.391|-40.072
Limeira, BR|-22.565|-47.402
Lima Duarte, BR|-21.843|-43.793
Liberdade, BR|-23.563|-46.632
Leopoldina, BR|-21.532|-42.643
Lencois Paulista, BR|-22.599|-48.800
Leme, BR|-22.186|-47.390
Lavras, BR|-21.245|-45.000
Laranjeiras do Sul, BR|-25.408|-52.416
Laranjeiras, BR|-10.806|-37.170
Laranjal Paulista, BR|-23.050|-47.837
Lapao, BR|-11.383|-41.832
Lapa, BR|-23.524|-46.707
Lapa, BR|-25.770|-49.716
Lambari, BR|-21.976|-45.350
Lajinha, BR|-20.151|-41.623
Lages, BR|-27.816|-50.326
Teolandia, BR|-13.602|-39.492
Lajeado, BR|-29.467|-51.961
Laje, BR|-13.182|-39.425
Laguna, BR|-28.483|-48.781
Lagoa Vermelha, BR|-28.209|-51.526
Lagoa Santa, BR|-19.630|-43.901
Lagoa Real, BR|-14.035|-42.142
Lagoa Formosa, BR|-18.779|-46.407
Lagoa da Prata, BR|-20.023|-45.544
Presidente Dutra, BR|-11.295|-41.986
Lagarto, BR|-10.917|-37.650
Ladario, BR|-19.005|-57.602
Juquitiba, BR|-23.932|-47.068
Juquia, BR|-24.321|-47.635
Junqueiropolis, BR|-21.515|-51.434
Jundiai, BR|-23.186|-46.884
Julio de Castilhos, BR|-29.227|-53.682
Juiz de Fora, BR|-21.764|-43.350
Jussara, BR|-15.865|-50.868
Juatuba, BR|-19.952|-44.343
Jose Bonifacio, BR|-21.053|-49.688
Joinville, BR|-26.304|-48.846
Joao Pinheiro, BR|-17.742|-46.172
Joao Monlevade, BR|-19.810|-43.174
Joacaba, BR|-27.178|-51.505
Jeremoabo, BR|-10.076|-38.347
Jequitinhonha, BR|-16.434|-41.003
Jequie, BR|-13.859|-40.085
Jau, BR|-22.296|-48.558
Jatai, BR|-17.879|-51.722
Jarinu, BR|-23.101|-46.728
Jardinopolis, BR|-21.018|-47.764
Jardim, BR|-21.480|-56.138
Jaragua do Sul, BR|-26.486|-49.067
Jaragua, BR|-23.441|-46.738
Jaragua, BR|-15.757|-49.334
Japeri, BR|-22.643|-43.653
Japaratuba, BR|-10.593|-36.940
Januaria, BR|-15.479|-44.365
Jandira, BR|-23.527|-46.903
Jandaia do Sul, BR|-23.603|-51.643
Janauba, BR|-15.803|-43.309
Jales, BR|-20.269|-50.546
Jaguaruna, BR|-28.621|-49.025
Jaguariuna, BR|-22.706|-46.986
Jaguaripe, BR|-13.113|-38.896
Jaguariaiva, BR|-24.244|-49.709
Jaguarari, BR|-10.264|-40.196
Jaguarao, BR|-32.566|-53.376
Jaguaquara, BR|-13.531|-39.971
Jacutinga, BR|-22.286|-46.612
Jacupiranga, BR|-24.692|-48.002
Jacobina, BR|-11.181|-40.514
Jaciara, BR|-15.965|-54.968
Jacarezinho, BR|-23.161|-49.969
Jacarei, BR|-23.305|-45.966
Jaguare, BR|-18.906|-40.076
Jaboticabal, BR|-21.255|-48.322
Jaboticatubas, BR|-19.514|-43.745
Ivoti, BR|-29.591|-51.161
Ivaipora, BR|-24.248|-51.685
Iuna, BR|-20.346|-41.536
Ituverava, BR|-20.339|-47.781
Iturama, BR|-19.728|-50.196
Ituporanga, BR|-27.414|-49.602
Itupeva, BR|-23.153|-47.058
Itumbiara, BR|-18.419|-49.215
Ituiutaba, BR|-18.974|-49.462
Itubera, BR|-13.735|-39.148
Ituacu, BR|-13.813|-41.297
Itu, BR|-23.264|-47.299
Itororo, BR|-15.117|-40.070
Itiuba, BR|-10.692|-39.854
Itirapina, BR|-22.253|-47.823
Itauna, BR|-20.075|-44.576
Itatinga, BR|-23.102|-48.616
Itatiba, BR|-23.006|-46.839
Itatiaia, BR|-22.496|-44.563
Itariri, BR|-24.289|-47.174
Itarare, BR|-24.113|-49.332
Itarantim, BR|-15.660|-40.066
Itaqui, BR|-29.125|-56.553
Itaquera, BR|-23.532|-46.444
Itaquaquecetuba, BR|-23.486|-46.348
Itapuranga, BR|-15.562|-49.949
Itaporanga dAjuda, BR|-10.998|-37.311
Itapora, BR|-22.079|-54.789
Itapolis, BR|-21.596|-48.813
Teofilandia, BR|-11.483|-38.997
Itapiranga, BR|-27.169|-53.712
Itapira, BR|-22.436|-46.822
Itapicuru, BR|-11.317|-38.233
Itapevi, BR|-23.549|-46.934
Itapeva, BR|-23.982|-48.876
Itapetininga, BR|-23.592|-48.053
Itapetinga, BR|-15.249|-40.248
Itaperuna, BR|-21.205|-41.888
Itaperucu, BR|-25.220|-49.348
Itapemirim, BR|-21.011|-40.834
Itapema, BR|-27.090|-48.611
Itapoa, BR|-26.117|-48.616
Itapecerica da Serra, BR|-23.717|-46.849
Itapecerica, BR|-20.473|-45.126
Itaparica, BR|-12.888|-38.679
Itapaci, BR|-14.951|-49.549
Itaocara, BR|-21.669|-42.076
Itanhem, BR|-17.166|-40.330
Itanhandu, BR|-22.296|-44.935
Itanhaem, BR|-24.183|-46.789
Itambe, BR|-15.245|-40.624
Itambacuri, BR|-18.031|-41.685
Itamarandiba, BR|-17.857|-42.859
Itamaraju, BR|-17.039|-39.531
Itajuipe, BR|-14.678|-39.375
Itajuba, BR|-22.426|-45.453
Itajobi, BR|-21.318|-49.054
Itajai, BR|-26.908|-48.662
Itaiopolis, BR|-26.336|-49.906
Itai, BR|-23.418|-49.091
Itaguai, BR|-22.852|-43.775
Itaete, BR|-12.986|-40.972
Itacare, BR|-14.279|-38.996
Itacarambi, BR|-15.102|-44.092
Itabuna, BR|-14.786|-39.280
Itaborai, BR|-22.744|-42.859
Itabirito, BR|-20.253|-43.801
Itabira, BR|-19.619|-43.227
Itaberai, BR|-16.020|-49.810
Itaberaba, BR|-12.527|-40.307
Itabera, BR|-23.862|-49.137
Itabaianinha, BR|-11.274|-37.790
Itabaiana, BR|-10.685|-37.425
Irece, BR|-11.304|-41.856
Irati, BR|-25.467|-50.651
Irara, BR|-12.050|-38.767
Iraquara, BR|-12.249|-41.619
Iracemapolis, BR|-22.581|-47.519
Ipora, BR|-24.003|-53.704
Ipora, BR|-16.442|-51.118
Ipiranga, BR|-23.600|-46.616
Ipira, BR|-12.158|-39.737
Ipiau, BR|-14.134|-39.739
Ipero, BR|-23.350|-47.689
Ipatinga, BR|-19.468|-42.537
Ipanema, BR|-22.984|-43.203
Ipanema, BR|-19.801|-41.713
Ipameri, BR|-17.722|-48.160
Ipaba, BR|-19.414|-42.419
Inhumas, BR|-16.358|-49.496
Inhapim, BR|-19.549|-42.120
Inhambupe, BR|-11.784|-38.353
Indiaroba, BR|-11.519|-37.512
Indaiatuba, BR|-23.088|-47.212
Indaial, BR|-26.898|-49.232
Imbituva, BR|-25.230|-50.604
Imbituba, BR|-28.240|-48.670
Ilhota, BR|-26.900|-48.827
Ilheus, BR|-14.799|-39.032
Ilha Solteira, BR|-20.433|-51.343
Ilhabela, BR|-23.778|-45.358
Ijui, BR|-28.388|-53.915
Iguape, BR|-24.708|-47.555
Iguai, BR|-14.756|-40.089
Iguaba Grande, BR|-22.839|-42.229
Igrejinha, BR|-29.574|-50.790
Igreja Nova, BR|-10.125|-36.662
Igarape, BR|-20.070|-44.302
Igarapava, BR|-20.038|-47.747
Igaracu do Tiete, BR|-22.509|-48.558
Igapora, BR|-13.773|-42.714
Pilao Arcado, BR|-10.001|-42.480
Icara, BR|-28.713|-49.300
Ibotirama, BR|-12.185|-43.221
Ibiuna, BR|-23.656|-47.222
Ibitita, BR|-11.547|-41.977
Ibitinga, BR|-21.758|-48.829
Ibitiara, BR|-12.652|-42.218
Ibiruba, BR|-28.628|-53.090
Ibirite, BR|-20.022|-44.059
Ibirapitanga, BR|-14.164|-39.374
Ibirama, BR|-27.057|-49.518
Ibipora, BR|-23.269|-51.048
Santa Rita de Cassia, BR|-11.009|-44.519
Ibipeba, BR|-11.641|-42.011
Ibicui, BR|-14.842|-39.987
Ibicoara, BR|-13.413|-41.286
Ibicarai, BR|-14.865|-39.587
Ibia, BR|-19.478|-46.539
Ibatiba, BR|-20.234|-41.511
Ibate, BR|-21.955|-47.997
Ibaiti, BR|-23.849|-50.188
Iacu, BR|-12.767|-40.212
Hortolandia, BR|-22.858|-47.220
Horizontina, BR|-27.626|-54.308
Hidrolandia, BR|-16.962|-49.228
Gurupi, BR|-11.729|-49.069
Guaxupe, BR|-21.305|-46.713
Guarulhos, BR|-23.463|-46.533
Guaruja, BR|-23.993|-46.256
Guariba, BR|-21.360|-48.228
Guarei, BR|-23.373|-48.184
Guaratuba, BR|-25.883|-48.575
Guaratingueta, BR|-22.816|-45.193
Guaratinga, BR|-16.582|-39.781
Guararema, BR|-23.415|-46.035
Guararapes, BR|-21.261|-50.643
Guarapuava, BR|-25.390|-51.465
Guarapari, BR|-20.672|-40.502
Guaranesia, BR|-21.299|-46.803
Guaramirim, BR|-26.473|-49.003
Guara, BR|-20.428|-47.824
Guara, BR|-15.810|-47.972
Guapore, BR|-28.846|-51.890
Guapimirim, BR|-22.537|-42.982
Guapiara, BR|-24.185|-48.533
Guapiacu, BR|-20.795|-49.220
Guanhaes, BR|-18.775|-42.932
Guanambi, BR|-14.223|-42.781
Guaira, BR|-24.082|-54.246
Guaira, BR|-20.318|-48.311
Engenheiro Coelho, BR|-22.491|-47.212
Guaianases, BR|-23.543|-46.411
Guacui, BR|-20.776|-41.679
Gravatai, BR|-29.942|-50.993
Gramado, BR|-29.379|-50.874
Governador Valadares, BR|-18.851|-41.949
Goioere, BR|-24.185|-53.028
Goiatuba, BR|-18.012|-49.355
Goias, BR|-15.934|-50.140
Goianira, BR|-16.496|-49.426
Goiania, BR|-16.679|-49.254
Goianesia, BR|-15.318|-49.117
Girua, BR|-28.028|-54.350
Getulio Vargas, BR|-27.890|-52.227
Gaspar, BR|-26.931|-48.959
Garuva, BR|-26.027|-48.855
Garopaba, BR|-28.023|-48.613
Garibaldi, BR|-29.256|-51.534
Garca, BR|-22.211|-49.656
Gandu, BR|-13.744|-39.487
Gama, BR|-16.025|-48.071
Sao Gabriel, BR|-11.229|-41.876
Fundao, BR|-19.934|-40.405
Frutal, BR|-20.025|-48.941
Freguesia, BR|-22.790|-43.172
Frederico Westphalen, BR|-27.359|-53.394
Franco da Rocha, BR|-23.322|-46.727
Francisco Sa, BR|-16.476|-43.488
Francisco Morato, BR|-23.282|-46.745
Lucas do Rio Verde, BR|-13.071|-55.915
Francisco Beltrao, BR|-26.081|-53.055
Franca, BR|-20.539|-47.401
Foz do Iguacu, BR|-25.548|-54.588
Forquilhinha, BR|-28.747|-49.472
Formoso do Araguaia, BR|-11.797|-49.529
Formosa do Rio Preto, BR|-11.048|-45.193
Formosa, BR|-15.537|-47.334
Formiga, BR|-20.464|-45.426
Florianopolis, BR|-27.597|-48.549
Flores da Cunha, BR|-29.029|-51.182
Filadelfia, BR|-10.743|-40.132
Ferraz de Vasconcelos, BR|-23.541|-46.369
Fernandopolis, BR|-20.284|-50.246
Feira de Santana, BR|-12.267|-38.967
Faxinal, BR|-24.000|-51.319
Fatima, BR|-10.600|-38.217
Fartura, BR|-23.388|-49.510
Farroupilha, BR|-29.225|-51.348
Extrema, BR|-22.855|-46.318
Eunapolis, BR|-16.378|-39.580
Euclides da Cunha, BR|-10.508|-39.016
Estrela, BR|-29.502|-51.966
Estrela, BR|-28.061|-50.938
Esteio, BR|-29.861|-51.179
Estancia Velha, BR|-29.648|-51.174
Estancia, BR|-11.268|-37.438
Espumoso, BR|-28.725|-52.850
Esplanada, BR|-11.796|-37.945
Espinosa, BR|-14.926|-42.819
Espera Feliz, BR|-20.650|-41.907
Esmeraldas, BR|-19.762|-44.314
Ervalia, BR|-20.840|-42.657
Erechim, BR|-27.635|-52.275
Entre Rios, BR|-11.942|-38.084
Encruzilhada do Sul, BR|-30.544|-52.522
Encruzilhada, BR|-15.531|-40.909
Encantado, BR|-29.236|-51.870
Embu-Guacu, BR|-23.832|-46.811
Embu das Artes, BR|-23.649|-46.852
Eloi Mendes, BR|-21.610|-45.565
Elias Fausto, BR|-23.043|-47.374
Ecoporanga, BR|-18.373|-40.831
Duque de Caxias, BR|-22.786|-43.312
Dracena, BR|-21.483|-51.533
Dourados, BR|-22.221|-54.806
Dom Pedrito, BR|-30.983|-54.673
Domingos Martins, BR|-20.363|-40.659
Dom Feliciano, BR|-30.704|-52.108
Dois Vizinhos, BR|-25.734|-53.057
Dois Irmaos, BR|-29.580|-51.085
Dois Corregos, BR|-22.366|-48.380
Divinopolis, BR|-20.144|-44.891
Divino, BR|-20.614|-42.149
Dionisio Cerqueira, BR|-26.255|-53.640
Dias dAvila, BR|-12.613|-38.297
Dianopolis, BR|-11.628|-46.821
Diamantino, BR|-14.409|-56.446
Diamantina, BR|-18.247|-43.603
Diadema, BR|-23.686|-46.623
Descalvado, BR|-21.904|-47.619
Curvelo, BR|-18.756|-44.431
Curitibanos, BR|-27.283|-50.584
Curitiba, BR|-25.428|-49.273
Cunha, BR|-23.074|-44.960
Cuiaba, BR|-15.596|-56.097
Cubatao, BR|-23.895|-46.425
Cruz Machado, BR|-26.017|-51.347
Cruzilia, BR|-21.839|-44.808
Cruzeiro do Oeste, BR|-23.785|-53.073
Cruzeiro, BR|-22.573|-44.971
Cruz das Almas, BR|-12.670|-39.102
Cruz Alta, BR|-28.644|-53.606
Crixas, BR|-14.549|-49.969
Cristinapolis, BR|-11.476|-37.755
Cristalina, BR|-16.768|-47.615
Crisopolis, BR|-11.511|-38.150
Criciuma, BR|-28.677|-49.370
Cravinhos, BR|-21.340|-47.729
Coxim, BR|-18.507|-54.760
Cotia, BR|-23.604|-46.919
Cosmopolis, BR|-22.646|-47.196
Coruripe, BR|-10.126|-36.176
Corupa, BR|-26.425|-49.243
Corumba, BR|-19.009|-57.653
Correntina, BR|-13.343|-44.637
Corrente, BR|-10.443|-45.162
Correia Pinto, BR|-27.585|-50.361
Coronel Vivida, BR|-25.980|-52.568
Coronel Fabriciano, BR|-19.519|-42.629
Coromandel, BR|-18.473|-47.200
Cornelio Procopio, BR|-23.181|-50.647
Corinto, BR|-18.381|-44.456
Cordeiropolis, BR|-22.482|-47.457
Cordeiro, BR|-22.029|-42.361
Corbelia, BR|-24.799|-53.307
Coracao de Maria, BR|-12.233|-38.750
Coracao de Jesus, BR|-16.685|-44.365
Contenda, BR|-25.679|-49.537
Contagem, BR|-19.932|-44.054
Conselheiro Pena, BR|-19.172|-41.472
Conselheiro Lafaiete, BR|-20.660|-43.786
Congonhas, BR|-20.505|-43.859
Condeuba, BR|-14.895|-41.969
Conde, BR|-11.814|-37.611
Concordia, BR|-27.234|-52.028
Conchas, BR|-23.015|-48.011
Conchal, BR|-22.330|-47.172
Conceicao do Mato Dentro, BR|-19.037|-43.425
Conceicao do Coite, BR|-11.564|-39.283
Conceicao do Almeida, BR|-12.779|-39.170
Conceicao de Macabu, BR|-22.085|-41.868
Conceicao do Jacuipe, BR|-12.317|-38.767
Conceicao das Alagoas, BR|-19.915|-48.388
Conceicao da Feira, BR|-12.506|-38.999
Conceicao da Barra, BR|-18.593|-39.732
Vera Cruz, BR|-12.960|-38.609
Colorado, BR|-22.837|-51.973
Colombo, BR|-25.292|-49.224
Colina, BR|-20.713|-48.541
Colatina, BR|-19.539|-40.631
Cocos, BR|-14.184|-44.534
Cocal do Sul, BR|-28.599|-49.323
Coaraci, BR|-14.641|-39.551
Clevelandia, BR|-26.405|-52.351
Claudio, BR|-20.443|-44.766
Cipo, BR|-11.100|-38.514
Cidreira, BR|-30.181|-50.206
Cicero Dantas, BR|-10.600|-38.383
Cianorte, BR|-23.663|-52.605
Chopinzinho, BR|-25.856|-52.523
Nova Xavantina, BR|-14.664|-52.359
Charqueadas, BR|-29.955|-51.625
Charqueada, BR|-22.510|-47.778
Chapeco, BR|-27.096|-52.618
Chapada dos Guimaraes, BR|-15.461|-55.750
Jussara, BR|-11.044|-41.971
Cesario Lange, BR|-23.227|-47.953
Cerro Azul, BR|-24.824|-49.261
Cerquilho, BR|-23.165|-47.744
Cerqueira Cesar, BR|-23.036|-49.166
Ceres, BR|-15.308|-49.598
Central, BR|-11.136|-42.113
Ceilandia, BR|-15.809|-48.131
Caxias do Sul, BR|-29.168|-51.179
Caxambu, BR|-21.977|-44.932
Catu, BR|-12.353|-38.379
Catanduva, BR|-21.138|-48.973
Catalao, BR|-18.166|-47.946
Cataguases, BR|-21.389|-42.697
Castro Alves, BR|-12.766|-39.428
Castro, BR|-24.789|-50.012
Castilho, BR|-20.872|-51.487
Castelo, BR|-20.604|-41.185
Cassilandia, BR|-19.113|-51.734
Cassia, BR|-20.583|-46.922
Casimiro de Abreu, BR|-22.481|-42.204
Cascavel, BR|-24.956|-53.455
Casa Branca, BR|-21.774|-47.086
Carmopolis de Minas, BR|-20.541|-44.635
Carmopolis, BR|-10.648|-36.989
Carmo do Rio Claro, BR|-20.972|-46.119
Carmo do Paranaiba, BR|-19.001|-46.316
Carmo do Cajuru, BR|-20.184|-44.771
Carmo, BR|-21.934|-42.609
Carlos Chagas, BR|-17.703|-40.766
Carlos Barbosa, BR|-29.297|-51.504
Carira, BR|-10.361|-37.701
Carinhanha, BR|-14.305|-43.765
Cariacica, BR|-20.264|-40.420
Carazinho, BR|-28.284|-52.786
Caratinga, BR|-19.790|-42.139
Caarapo, BR|-22.634|-54.822
Carapicuiba, BR|-23.523|-46.835
Carangola, BR|-20.733|-42.029
Carandai, BR|-20.954|-43.806
Carambei, BR|-24.953|-50.116
Carai, BR|-17.189|-41.695
Caraguatatuba, BR|-23.620|-45.413
Capivari, BR|-22.995|-47.508
Capinzal, BR|-27.344|-51.612
Capim Grosso, BR|-11.381|-40.013
Capelinha, BR|-17.691|-42.516
Capela do Alto, BR|-23.471|-47.735
Capela, BR|-10.503|-37.053
Capao do Leao, BR|-31.763|-52.484
Capao da Canoa, BR|-29.746|-50.010
Capao Bonito, BR|-24.006|-48.349
Capanema, BR|-25.672|-53.809
Cantagalo, BR|-21.981|-42.368
Cansancao, BR|-10.667|-39.499
Canoinhas, BR|-26.177|-50.390
Canoas, BR|-29.918|-51.184
Cangucu, BR|-31.395|-52.676
Canela, BR|-29.356|-50.814
Candido Mota, BR|-22.746|-50.387
Candelaria, BR|-29.669|-52.789
Candeias, BR|-12.668|-38.551
Canavieiras, BR|-15.675|-38.947
Canarana, BR|-11.685|-41.769
Joao Dourado, BR|-11.345|-41.663
Campo Verde, BR|-20.417|-54.067
Campos Novos, BR|-27.402|-51.225
Campos Gerais, BR|-21.235|-45.759
Campos do Jordao, BR|-22.739|-45.591
Campos Belos, BR|-13.037|-46.772
Campos dos Goytacazes, BR|-21.752|-41.330
Quedas do Iguacu, BR|-25.453|-52.905
Campo Mourao, BR|-24.043|-52.379
Campo Magro, BR|-25.369|-49.451
Campo Limpo, BR|-23.636|-46.766
Campo Limpo Paulista, BR|-23.206|-46.784
Campo Largo, BR|-25.460|-49.530
Campo Grande, BR|-20.443|-54.646
Campo Formoso, BR|-10.508|-40.321
Campo do Brito, BR|-10.733|-37.493
Campo Bom, BR|-29.679|-51.053
Campo Belo, BR|-20.897|-45.277
Campina Verde, BR|-19.538|-49.488
Campinas, BR|-22.906|-47.061
Campina Grande do Sul, BR|-25.306|-49.055
Campestre, BR|-21.711|-46.246
Campanha, BR|-21.836|-45.401
Cambui, BR|-22.612|-46.057
Cambuci, BR|-21.575|-41.911
Camboriu, BR|-27.025|-48.654
Cambe, BR|-23.276|-51.278
Cambara, BR|-23.046|-50.074
Camaqua, BR|-30.851|-51.812
Camanducaia, BR|-22.755|-46.145
Camamu, BR|-13.947|-39.103
Camacari, BR|-12.697|-38.324
Camacan, BR|-15.419|-39.496
Caldas Novas, BR|-17.744|-48.628
Cajuru, BR|-21.275|-47.304
Cajati, BR|-24.736|-48.123
Cajamar, BR|-23.356|-46.877
Cairu, BR|-13.487|-39.044
Caieiras, BR|-23.364|-46.741
Caiaponia, BR|-16.957|-51.810
Cafelandia, BR|-24.618|-53.320
Cafelandia, BR|-21.802|-49.610
Cafarnaum, BR|-11.694|-41.468
Caetite, BR|-14.069|-42.475
Caete, BR|-19.880|-43.670
Cacule, BR|-14.503|-42.222
Caconde, BR|-21.529|-46.644
Cachoeiro de Itapemirim, BR|-20.849|-41.113
Cachoeirinha, BR|-29.951|-51.094
Cachoeiras de Macacu, BR|-22.462|-42.653
Cachoeira Paulista, BR|-22.665|-45.009
Cachoeira do Sul, BR|-30.039|-52.894
Cachoeira, BR|-12.601|-38.966
Caceres, BR|-16.071|-57.679
Cacapava do Sul, BR|-30.514|-53.485
Cacapava, BR|-23.101|-45.707
Cacador, BR|-26.775|-51.015
Cabreuva, BR|-23.308|-47.133
Cabo Frio, BR|-22.887|-42.026
Governador Mangabeira, BR|-12.600|-39.042
Cabaceiras do Paraguacu, BR|-12.536|-39.191
Butia, BR|-30.120|-51.962
Buritizeiro, BR|-17.351|-44.962
Buritis, BR|-15.618|-46.423
Buritirama, BR|-10.708|-43.631
Buritama, BR|-21.066|-50.147
Buri, BR|-23.797|-48.593
Boquim, BR|-11.147|-37.621
Buerarema, BR|-14.959|-39.300
Brusque, BR|-27.098|-48.913
Brumado, BR|-14.204|-41.665
Brumadinho, BR|-20.143|-44.200
Brotas, BR|-22.284|-48.127
Brodowski, BR|-20.991|-47.659
Brazlandia, BR|-15.679|-48.197
Brasilia de Minas, BR|-16.206|-44.433
Brasilia, BR|-15.780|-47.930
Bras, BR|-23.550|-46.617
Braganca Paulista, BR|-22.953|-46.544
Braco do Norte, BR|-28.275|-49.166
Botucatu, BR|-22.886|-48.445
Holambra, BR|-22.633|-47.056
Borda da Mata, BR|-22.274|-46.165
Boquira, BR|-12.823|-42.731
Bonito, BR|-21.121|-56.482
Bonito, BR|-11.969|-41.266
Bom Sucesso, BR|-21.033|-44.758
Bom Retiro, BR|-23.525|-46.639
Bom Jesus dos Perdoes, BR|-23.135|-46.465
Bom Jesus do Itabapoana, BR|-21.134|-41.680
Bom Jesus da Lapa, BR|-13.255|-43.418
Bom Jesus de Goias, BR|-18.220|-49.730
Bom Jardim, BR|-22.152|-42.419
Bom Despacho, BR|-19.736|-45.252
Boituva, BR|-23.283|-47.672
Bocaiuva, BR|-17.108|-43.815
Boa Esperanca, BR|-21.090|-45.566
Blumenau, BR|-26.919|-49.066
Bituruna, BR|-26.161|-51.553
Biritinga, BR|-11.617|-38.800
Biritiba Mirim, BR|-23.573|-46.039
Birigui, BR|-21.289|-50.340
Biguacu, BR|-27.494|-48.656
Betim, BR|-19.968|-44.198
Bertioga, BR|-23.854|-46.139
Bento Goncalves, BR|-29.171|-51.519
Belo Oriente, BR|-19.220|-42.484
Belo Horizonte, BR|-19.921|-43.938
Belo Campo, BR|-15.038|-41.260
Belmonte, BR|-15.861|-38.880
Belford Roxo, BR|-22.764|-43.399
Bela Vista do Paraiso, BR|-22.997|-51.191
Bela Vista de Goias, BR|-16.973|-48.953
Bela Vista, BR|-22.108|-56.533
Bebedouro, BR|-20.949|-48.479
Bauru, BR|-22.315|-49.061
Batatais, BR|-20.891|-47.585
Bataguassu, BR|-21.714|-52.422
Bastos, BR|-21.922|-50.734
Barueri, BR|-23.511|-46.876
Barroso, BR|-21.187|-43.976
Barrocas, BR|-11.528|-39.076
Barrinha, BR|-21.194|-48.164
Barretos, BR|-20.557|-48.568
Barreiro do Jaiba, BR|-15.615|-43.592
Barreiras, BR|-12.153|-44.990
Barra Velha, BR|-26.632|-48.685
Barra Mansa, BR|-22.544|-44.171
Barra dos Coqueiros, BR|-10.909|-37.039
Barra do Pirai, BR|-22.470|-43.826
Barra do Garcas, BR|-15.890|-52.257
Barra do Bugres, BR|-15.072|-57.181
Barra de Sao Francisco, BR|-18.755|-40.891
Barra da Estiva, BR|-13.626|-41.327
Barra do Choca, BR|-14.881|-40.579
Barra Bonita, BR|-22.495|-48.558
Barra, BR|-11.089|-43.142
Bariri, BR|-22.074|-48.740
Barbacena, BR|-21.226|-43.774
Barao de Cocais, BR|-19.946|-43.487
Bandeirantes, BR|-23.110|-50.367
Bambui, BR|-20.006|-45.977
Balneario Rincao, BR|-28.832|-49.237
Balneario Camboriu, BR|-26.991|-48.635
Baixo Guandu, BR|-19.519|-41.016
Baixa Grande, BR|-11.960|-40.168
Bage, BR|-31.331|-54.107
Baependi, BR|-21.959|-44.890
Bady Bassitt, BR|-20.918|-49.445
Avare, BR|-23.099|-48.926
Atibaia, BR|-23.117|-46.550
Astorga, BR|-23.233|-51.666
Assis, BR|-22.662|-50.412
Aruja, BR|-23.396|-46.321
Artur Nogueira, BR|-22.573|-47.172
Arroio Grande, BR|-32.237|-53.087
Balneario Arroio do Silva, BR|-28.987|-49.417
Arroio do Meio, BR|-29.401|-51.945
Arraial do Cabo, BR|-22.966|-42.028
Armacao dos Buzios, BR|-22.747|-41.882
Arinos, BR|-15.917|-46.106
Areia Branca, BR|-10.758|-37.315
Arcos, BR|-20.282|-45.539
Araxa, BR|-19.593|-46.941
Araucaria, BR|-25.593|-49.410
Araruama, BR|-22.873|-42.343
Araras, BR|-22.357|-47.384
Araraquara, BR|-21.794|-48.176
Ararangua, BR|-28.936|-49.495
Araquari, BR|-26.370|-48.722
Arapoti, BR|-24.158|-49.827
Arapongas, BR|-23.419|-51.424
Araguari, BR|-18.647|-48.187
Aragarcas, BR|-15.898|-52.251
Aracuai, BR|-16.850|-42.070
Aracruz, BR|-19.820|-40.273
Aracoiaba da Serra, BR|-23.505|-47.614
Araci, BR|-11.333|-38.967
Aracatuba, BR|-21.209|-50.433
Aracariguama, BR|-23.439|-47.061
Aracaju, BR|-10.911|-37.072
Aquidauana, BR|-20.471|-55.787
Aquidaba, BR|-10.281|-37.019
Apucarana, BR|-23.551|-51.461
Apora, BR|-11.660|-38.081
Apiai, BR|-24.509|-48.843
Aparecida do Taboado, BR|-20.087|-51.094
Aparecida, BR|-22.847|-45.230
Antonina, BR|-25.429|-48.712
Anicuns, BR|-16.461|-49.962
Angra dos Reis, BR|-23.007|-44.318
Angatuba, BR|-23.490|-48.413
Andradina, BR|-20.896|-51.379
Andradas, BR|-22.068|-46.569
Andorinha, BR|-10.345|-39.836
Andira, BR|-23.051|-50.229
Anchieta, BR|-20.806|-40.646
Anastacio, BR|-20.484|-55.807
Anapolis, BR|-16.327|-48.953
Anage, BR|-14.612|-41.136
Ampere, BR|-25.915|-53.473
Amparo, BR|-22.701|-46.764
Americo Brasiliense, BR|-21.724|-48.102
Americana, BR|-22.739|-47.331
America Dourada, BR|-11.455|-41.436
Amargosa, BR|-13.030|-39.605
Amambai, BR|-23.104|-55.226
Alvinopolis, BR|-20.107|-43.049
Alvares Machado, BR|-22.079|-51.472
Altonia, BR|-23.874|-53.902
Alto Araguaia, BR|-17.315|-53.215
Altinopolis, BR|-21.026|-47.374
Alpinopolis, BR|-20.864|-46.388
Almirante Tamandare, BR|-25.325|-49.310
Almenara, BR|-16.184|-40.694
Presidente Tancredo Neves, BR|-13.453|-39.421
Alfenas, BR|-21.429|-45.947
Alem Paraiba, BR|-21.888|-42.704
Alegrete, BR|-29.783|-55.792
Alegre, BR|-20.764|-41.533
Alcobaca, BR|-17.519|-39.196
Alagoinhas, BR|-12.136|-38.419
Aimores, BR|-19.496|-41.064
Agudos, BR|-22.469|-48.987
Agudo, BR|-29.645|-53.240
Aguas Formosas, BR|-17.082|-40.936
Aguas de Lindoia, BR|-22.476|-46.633
Agua Rasa, BR|-20.433|-45.167
Aguai, BR|-22.059|-46.979
Agua Clara, BR|-20.448|-52.878
Afonso Claudio, BR|-20.074|-41.124
Adustina, BR|-10.533|-38.100
Adamantina, BR|-21.685|-51.072
Acajutiba, BR|-11.662|-38.017
Abelardo Luz, BR|-26.565|-52.328
Abaete, BR|-19.160|-45.446
Cordovil, BR|-22.825|-43.304
Leblon, BR|-22.984|-43.223
Botafogo, BR|-22.951|-43.182
Copacabana, BR|-22.969|-43.186
Guaiba, BR|-30.114|-51.325
Comodoro, BR|-13.663|-59.786
Palmas, BR|-10.167|-48.328
Acari, BR|-22.825|-43.341
Bombinhas, BR|-27.152|-48.489
Pontal do Parana, BR|-25.674|-48.511
Paraiso do Tocantins, BR|-10.176|-48.867
Universidade Rural, BR|-22.766|-43.691
Uarini, BR|-2.990|-65.108
Tonantins, BR|-2.873|-67.802
Tefe, BR|-3.368|-64.721
Marechal Thaumaturgo, BR|-8.941|-72.792
Tarauaca, BR|-8.161|-70.766
Tapaua, BR|-5.628|-63.183
Tabatinga, BR|-4.231|-69.939
Sena Madureira, BR|-9.063|-68.672
Sao Paulo de Olivenca, BR|-3.378|-68.873
Sao Gabriel da Cachoeira, BR|-0.118|-67.085
Santo Antonio do Ica, BR|-3.102|-67.940
Santa Isabel do Rio Negro, BR|-0.414|-65.019
Rio Branco, BR|-9.975|-67.810
Porto Velho, BR|-8.762|-63.904
Porto Acre, BR|-9.588|-67.532
Pauini, BR|-7.714|-66.976
Novo Aripuana, BR|-5.121|-60.380
Novo Airao, BR|-2.621|-60.944
Manicore, BR|-5.809|-61.300
Mancio Lima, BR|-7.614|-72.896
Manaus, BR|-3.102|-60.025
Manacapuru, BR|-3.300|-60.621
Labrea, BR|-7.264|-64.796
Jurua, BR|-3.481|-66.069
Guajara, BR|-7.546|-72.584
Ipixuna, BR|-7.051|-71.695
Humaita, BR|-7.517|-63.031
Fonte Boa, BR|-2.514|-66.092
Feijo, BR|-8.165|-70.355
Eirunepe, BR|-6.660|-69.874
Cruzeiro do Sul, BR|-7.628|-72.678
Codajas, BR|-3.837|-62.057
Coari, BR|-4.085|-63.141
Carauari, BR|-4.883|-66.896
Caracarai, BR|1.816|-61.128
Canutama, BR|-6.534|-64.383
Boca do Acre, BR|-8.752|-67.398
Boa Vista, BR|2.820|-60.673
Beruri, BR|-3.898|-61.373
Benjamin Constant, BR|-4.376|-70.032
Barcelos, BR|-0.974|-62.927
Atalaia do Norte, BR|-4.367|-70.192
Ariquemes, BR|-9.913|-63.041
Anori, BR|-3.773|-61.644
Alvaraes, BR|-3.221|-64.804
Iranduba, BR|-3.285|-60.186
Presidente Figueiredo, BR|-2.034|-60.025
Careiro, BR|-3.768|-60.369
Manaquiri, BR|-3.428|-60.459
Xapuri, BR|-10.652|-68.504
Vilhena, BR|-12.741|-60.146
Senador Guiomard, BR|-10.150|-67.737
Presidente Medici, BR|-11.175|-61.901
Rolim de Moura do Guapore, BR|-13.083|-62.277
Placido de Castro, BR|-10.335|-67.186
Pimenta Bueno, BR|-11.672|-61.194
Ouro Preto do Oeste, BR|-10.748|-62.216
Ji Parana, BR|-10.885|-61.952
Jaru, BR|-10.439|-62.466
Guajara Mirim, BR|-10.784|-65.336
Espigao dOeste, BR|-11.525|-61.013
Cacoal, BR|-11.439|-61.447
Brasileia, BR|-11.016|-68.748
Abadia de Goias, BR|-16.757|-49.438
Acailandia, BR|-4.947|-47.505
Acreuna, BR|-17.396|-50.377
Agua Azul do Norte, BR|-6.791|-50.467
Agua Boa, BR|-14.050|-52.159
Aguas Lindas de Goias, BR|-15.762|-48.282
Aldeias Altas, BR|-4.628|-43.471
Alexania, BR|-16.082|-48.507
Alta Floresta dOeste, BR|-11.968|-61.954
Alto Alegre, BR|2.896|-61.498
Alto Alegre do Maranhao, BR|-4.213|-44.446
Alto Alegre do Pindare, BR|-3.671|-45.847
Alto Paraiso, BR|-9.723|-63.310
Aluminio, BR|-23.535|-47.262
Anapu, BR|-3.472|-51.198
Aparecida de Goiania, BR|-16.823|-49.244
Apui, BR|-7.197|-59.891
Arame, BR|-4.886|-46.005
Aripuana, BR|-10.176|-59.449
Assis Chateaubriand, BR|-24.420|-53.521
Aurora do Para, BR|-2.134|-47.559
Bacabeira, BR|-2.971|-44.316
Balneario Gaivota, BR|-29.157|-49.579
Banabuiu, BR|-5.310|-38.921
Bom Jesus das Selvas, BR|-4.484|-46.853
Bom Jesus do Tocantins, BR|-5.051|-48.609
Breu Branco, BR|-4.001|-49.507
Buritis, BR|-10.212|-63.829
Cachoeira do Piria, BR|-1.760|-46.545
Campinas, BR|-27.594|-48.607
Campo Novo do Parecis, BR|-13.675|-57.892
Campo Verde, BR|-15.547|-55.169
Canaa dos Carajas, BR|-6.524|-49.852
Canarana, BR|-13.552|-52.268
Candeias do Jamari, BR|-8.810|-63.696
Candido Sales, BR|-15.505|-41.239
Canta, BR|2.610|-60.597
Capivari de Baixo, BR|-28.445|-48.958
Cerejeiras, BR|-13.189|-60.812
Chapadao do Sul, BR|-18.794|-52.623
Cocalzinho de Goias, BR|-15.794|-48.776
Colider, BR|-10.818|-55.451
Colniza, BR|-9.409|-59.025
Colorado do Oeste, BR|-13.117|-60.542
Concordia do Para, BR|-2.002|-47.950
Confresa, BR|-10.644|-51.569
Coronel Joao Sa, BR|-10.284|-37.926
Costa Rica, BR|-18.544|-53.129
Cumaru do Norte, BR|-7.825|-50.773
Curionopolis, BR|-6.102|-49.598
Dom Eliseu, BR|-4.285|-47.505
Dormentes, BR|-8.447|-40.771
Eldorado do Sul, BR|-30.084|-51.616
Eldorado dos Carajas, BR|-6.104|-49.355
Epitaciolandia, BR|-11.029|-68.741
Ermelino Matarazzo, BR|-23.495|-46.474
Estrela de Alagoas, BR|-9.390|-36.760
Fatima do Sul, BR|-22.374|-54.514
Fazenda Rio Grande, BR|-25.657|-49.308
Floresta do Araguaia, BR|-7.554|-49.712
Fraiburgo, BR|-27.026|-50.921
Garrafao do Norte, BR|-1.934|-47.053
Goianesia do Para, BR|-3.842|-49.097
Governador Celso Ramos, BR|-27.315|-48.559
Governador Nunes Freire, BR|-2.126|-45.885
Guabiruba, BR|-27.086|-48.968
Herval dOeste, BR|-27.194|-51.495
Imbe, BR|-29.975|-50.128
Indiara, BR|-17.138|-49.988
Ipixuna do Para, BR|-2.558|-47.495
Itabela, BR|-16.575|-39.553
Itaim Paulista, BR|-23.503|-46.386
Itaobim, BR|-16.562|-41.503
Itaquirai, BR|-23.474|-54.185
Itinga do Maranhao, BR|-4.450|-47.526
Jaboatao dos Guararapes, BR|-8.113|-35.015
Jaiba, BR|-15.338|-43.674
Jenipapo dos Vieiras, BR|-5.371|-45.636
Jijoca de Jericoacoara, BR|-2.895|-40.449
Juara, BR|-11.255|-57.520
Juina, BR|-11.420|-58.755
Lambari dOeste, BR|-15.323|-58.004
Laranjal do Jari, BR|-0.826|-52.506
Lauro de Freitas, BR|-12.894|-38.327
Machadinho dOeste, BR|-9.444|-61.981
Mae do Rio, BR|-2.046|-47.551
Maraa, BR|-1.853|-65.574
Maranhaozinho, BR|-2.243|-45.857
Mario Campos, BR|-20.056|-44.188
Marituba, BR|-1.355|-48.342
Matoes do Norte, BR|-3.632|-44.556
Matupa, BR|-10.169|-54.934
Medicilandia, BR|-3.446|-52.889
Minacu, BR|-13.533|-48.220
Monte Negro, BR|-10.294|-63.325
Mucajai, BR|2.440|-60.911
Mojui dos Campos, BR|-2.683|-54.643
Nova Alvorada do Sul, BR|-21.466|-54.384
Nova Andradina, BR|-22.233|-53.343
Nova Esperanca do Piria, BR|-2.268|-46.968
Nova Ipixuna, BR|-4.921|-49.077
Nova Mamore, BR|-10.402|-65.327
Nova Mutum, BR|-13.829|-56.082
Novo Gama, BR|-16.059|-48.039
Novo Progresso, BR|-7.148|-55.381
Novo Repartimento, BR|-4.331|-49.796
Ourilandia do Norte, BR|-6.755|-51.084
Pacaja, BR|-3.838|-50.638
Pacaraima, BR|4.431|-61.146
Paco do Lumiar, BR|-2.532|-44.108
Palmeirandia, BR|-2.645|-44.895
Paranatinga, BR|-14.432|-54.051
Parauapebas, BR|-6.067|-49.902
Pedra Branca do Amapari, BR|0.778|-51.944
Pedra Preta, BR|-16.623|-54.474
Pedro Canario, BR|-18.030|-40.151
Pedro do Rosario, BR|-2.972|-45.351
Peixoto de Azevedo, BR|-10.223|-54.980
Petrolandia, BR|-8.979|-38.219
Pinhais, BR|-25.445|-49.193
Pinheiros, BR|-18.370|-40.213
Placas, BR|-3.868|-54.220
Planalto, BR|-14.670|-40.471
Potim, BR|-22.843|-45.251
Presidente Sarney, BR|-2.591|-45.364
Querencia, BR|-12.597|-52.200
Quitandinha, BR|-25.872|-49.498
Raposa, BR|-2.423|-44.103
Redencao, BR|-8.029|-50.031
Santo Anastacio, BR|-21.976|-51.651
Rio Maria, BR|-7.311|-50.048
Rio Preto da Eva, BR|-2.698|-59.702
Rolim de Moura, BR|-11.804|-61.803
Rondon do Para, BR|-4.776|-48.067
Rorainopolis, BR|0.946|-60.418
Rosana, BR|-22.580|-53.059
Ruropolis, BR|-4.096|-54.910
Salto do Lontra, BR|-25.784|-53.309
Santa Barbara do Para, BR|-1.224|-48.294
Santa Luzia, BR|-3.963|-45.658
Santa Luzia do Para, BR|-1.524|-46.898
Santa Maria de Jetiba, BR|-20.027|-40.743
Santa Terezinha de Itaipu, BR|-25.440|-54.402
Santana do Araguaia, BR|-9.335|-50.350
Santo Antonio do Descoberto, BR|-15.940|-48.255
Sao Domingos do Araguaia, BR|-5.538|-48.733
Sao Felix do Coribe, BR|-13.401|-44.195
Sao Francisco de Itabapoana, BR|-21.302|-40.961
Sao Francisco do Guapore, BR|-12.052|-63.568
Sao Gabriel do Oeste, BR|-19.395|-54.566
Sao Joao do Soter, BR|-5.114|-43.810
Sao Jose dos Quatro Marcos, BR|-15.621|-58.176
Sao Luis Gonzaga do Maranhao, BR|-4.379|-44.671
Sao Mateus, BR|-23.606|-46.479
Sao Miguel do Guapore, BR|-11.694|-62.711
Sapopemba, BR|-23.596|-46.525
Sento Se, BR|-9.746|-41.885
Simoes Filho, BR|-12.784|-38.404
Sinop, BR|-11.864|-55.502
Sitio Novo, BR|-5.878|-46.699
Sooretama, BR|-19.197|-40.098
Sorriso, BR|-12.545|-55.711
Souto Soares, BR|-12.089|-41.638
Tailandia, BR|-2.947|-48.953
Tangara da Serra, BR|-14.619|-57.486
Teixeira de Freitas, BR|-17.535|-39.742
Trairao, BR|-4.574|-55.944
Tres Marias, BR|-18.206|-45.242
Trizidela do Vale, BR|-4.572|-44.621
Tucuma, BR|-6.747|-51.161
Ubirata, BR|-24.545|-52.988
Ulianopolis, BR|-3.742|-47.495
Uruara, BR|-3.717|-53.737
Valparaiso de Goias, BR|-16.066|-47.979
Vargem Grande Paulista, BR|-23.603|-47.026
Vila Rica, BR|-10.012|-51.116
Vitoria do Xingu, BR|-2.880|-52.010
Xangri-la, BR|-29.801|-50.044
Xinguara, BR|-7.098|-49.944
Ze Doca, BR|-3.275|-45.658
Terra Roxa, BR|-24.157|-54.097
Taguatinga, BR|-15.833|-48.055
Barra da Tijuca, BR|-22.998|-43.365
Tatuape, BR|-23.537|-46.567
Consolacao, BR|-23.552|-46.657
Rocinha, BR|-22.989|-43.249
Vidigal, BR|-22.995|-43.240
Estacio, BR|-22.918|-43.204
Catete, BR|-22.925|-43.181
Pirituba, BR|-23.490|-46.732
Limao, BR|-23.493|-46.669
Vila Galvao, BR|-23.472|-46.579
Jardim Paulista, BR|-23.567|-46.664
Santa Teresa, BR|-22.918|-43.188
Trindade, BR|-27.586|-48.523
Freguesia do Ribeirao da Ilha, BR|-27.718|-48.563
Olho dAgua das Cunhas, BR|-4.139|-45.119
Teotonio Vilela, BR|-9.910|-36.356
Mirassol dOeste, BR|-15.676|-58.090
Brasilandia de Minas, BR|-17.010|-46.009
Santana, BR|-23.490|-46.639
Governador Edison Lobao, BR|-5.745|-47.364
Brasil Novo, BR|-3.307|-52.539
Por do Sol, BR|-15.855|-48.124
Itaim Bibi, BR|-23.586|-46.682
Vicente Pires, BR|-15.810|-48.031
Moema, BR|-23.595|-46.664
Livramento de Nossa Senhora, BR|-13.641|-41.843
Planaltina, BR|-15.618|-47.649
Luis Eduardo Magalhaes, BR|-12.091|-45.785
Sapezal, BR|-13.542|-58.820
Grajau, BR|-23.770|-46.671
Artur Alvim, BR|-23.540|-46.486
Anhanguera, BR|-23.431|-46.793
Cidade Dutra, BR|-23.726|-46.702
Capao Redondo, BR|-23.669|-46.781
Casa Verde, BR|-23.501|-46.657
Iguatemi, BR|-23.613|-46.427
Sao Lucas, BR|-23.595|-46.544
Socorro, BR|-23.685|-46.714
Rio Pequeno, BR|-23.571|-46.759
Carrao, BR|-23.551|-46.538
Agua Rasa, BR|-23.567|-46.572
Alto De Pinheiros, BR|-23.548|-46.712
Cidade Lider, BR|-23.562|-46.491
Aricanduva, BR|-23.574|-46.516
Jacana, BR|-23.460|-46.575
Jaguara, BR|-23.511|-46.747
Lajeado, BR|-23.534|-46.409
Jabaquara, BR|-23.651|-46.646
Jose Bonifacio, BR|-23.567|-46.433
Cidade Ademar, BR|-23.674|-46.657
Barra Funda, BR|-23.521|-46.674
Belem, BR|-23.538|-46.595
Brasilandia, BR|-23.449|-46.688
Butanta, BR|-23.570|-46.726
Campo Grande, BR|-23.675|-46.688
Cangaiba, BR|-23.497|-46.520
Cambuci, BR|-23.564|-46.617
Campo Belo, BR|-23.628|-46.668
Cursino, BR|-23.631|-46.621
Mooca, BR|-23.561|-46.596
Vila Prudente, BR|-23.593|-46.573
Morumbi, BR|-23.596|-46.708
Pedreira, BR|-23.707|-46.650
Mandaqui, BR|-23.459|-46.641
Cachoeirinha, BR|-23.454|-46.662
Jardim Angela, BR|-23.716|-46.769
Pari, BR|-23.527|-46.618
Vila Formosa, BR|-23.568|-46.546
Vila Guilherme, BR|-23.509|-46.606
Vila Jacui, BR|-23.503|-46.462
Vila Matilde, BR|-23.539|-46.518
Vila Medeiros, BR|-23.489|-46.578
Santa Cecilia, BR|-23.532|-46.653
Parque Do Carmo, BR|-23.576|-46.463
Perdizes, BR|-23.539|-46.681
Ponte Rasa, BR|-23.516|-46.494
Raposo Tavares, BR|-23.592|-46.786
Sao Domingos, BR|-23.493|-46.748
Se, BR|-23.548|-46.631
Vila Leopoldina, BR|-23.529|-46.734
Jaguare, BR|-23.544|-46.749
Cidade Tiradentes, BR|-23.585|-46.401
Bela Vista, BR|-23.561|-46.648
Jardim Helena, BR|-23.484|-46.413
Jardim Sao Luis, BR|-23.681|-46.739
Republica, BR|-23.545|-46.641
Sacoma, BR|-23.631|-46.598
Sao Rafael, BR|-23.628|-46.454
Vila Andrade, BR|-23.626|-46.728
Vila Curuca, BR|-23.510|-46.416
Sao Pedro, BR|-22.423|-42.966
Bosque Saude, BR|-23.609|-46.623
Bairro da Penha, BR|-23.368|-46.311
Bairro Parque Nossa Senhora do Carmo, BR|-23.406|-46.316
Sudoeste/Octagonal, BR|-15.802|-47.927
Lago Sul, BR|-15.846|-47.884
Itapoa, BR|-15.749|-47.769
Lago Norte, BR|-15.739|-47.857
Jardim Botanico, BR|-15.865|-47.815
Sobradinho II, BR|-15.634|-47.835
Santa Maria, BR|-16.031|-48.029
Riacho Fundo II, BR|-15.898|-48.047
Riacho Fundo, BR|-15.884|-48.016
Samambaia, BR|-15.882|-48.104
Aguas Claras, BR|-15.840|-48.027
Setor Complementar de Industria e Abastecimento, BR|-15.782|-47.988
Park Way, BR|-15.909|-47.941
Cruzeiro, BR|-15.791|-47.937
Apicum-Acu, BR|-1.528|-45.079
Centro Novo do Maranhao, BR|-2.141|-46.124
Turilandia, BR|-2.220|-45.306
Bom Jardim, BR|-3.543|-45.609
Santa Luzia do Parua, BR|-2.544|-45.775
Buriticupu, BR|-4.321|-46.455
Tapurah, BR|-12.737|-56.514
Guaranta do Norte, BR|-9.951|-54.908
Campinapolis, BR|-14.541|-52.795
Brasnorte, BR|-12.120|-58.003
Cidade Ocidental, BR|-16.110|-47.933
Sao Jose da Lapa, BR|-19.700|-43.960
Sao Sebastiao, BR|-15.903|-47.776
Recanto das Emas, BR|-15.909|-48.064
Serra do Ramalho, BR|-13.542|-43.580
Plano Piloto, BR|-15.794|-47.883
Nassau, BS|25.058|-77.343
Lucaya, BS|26.533|-78.667
Killarney, BS|25.050|-77.417
Freeport, BS|26.533|-78.700
Thimphu, BT|27.466|89.642
Punakha, BT|27.591|89.877
Phuntsholing, BT|26.852|89.388
Tsirang, BT|27.022|90.123
Tonota, BW|-21.442|27.462
Tlokweng, BW|-24.669|25.971
Thamaga, BW|-24.670|25.540
Serowe, BW|-22.388|26.711
Selebi-Phikwe, BW|-21.979|27.843
Ramotswa, BW|-24.872|25.870
Palapye, BW|-22.546|27.125
Mosopa, BW|-24.772|25.422
Molepolole, BW|-24.407|25.495
Mogoditshane, BW|-24.627|25.866
Mochudi, BW|-24.417|26.150
Maun, BW|-19.983|23.417
Mahalapye, BW|-23.104|26.814
Lobatse, BW|-25.224|25.677
Letlhakane, BW|-21.415|25.593
Kanye, BW|-24.967|25.333
Janeng, BW|-25.417|25.550
Ghanzi, BW|-21.698|21.646
Gaborone, BW|-24.655|25.909
Gabane, BW|-24.667|25.782
Francistown, BW|-21.170|27.508
Bobonong, BW|-21.966|28.436
Mmopone, BW|-24.567|25.874
Tutume, BW|-20.494|27.035
Jwaneng, BW|-24.602|24.728
Horad Zhodzina, BY|54.099|28.333
Zhlobin, BY|52.893|30.024
Zytkavicy, BY|52.217|27.856
Zaslawye, BY|54.011|27.270
Vitebsk, BY|55.190|30.205
Vileyka, BY|54.491|26.911
Vaukavysk, BY|53.156|24.451
Svetlogorsk, BY|52.633|29.739
Stowbtsy, BY|53.480|26.735
Smarhon, BY|54.480|26.396
Smaliavicy, BY|54.025|28.089
Slutsk, BY|53.015|27.542
Slonim, BY|53.088|25.317
Shchuchyn, BY|53.601|24.747
Soligorsk, BY|52.790|27.536
Rahachow, BY|53.093|30.049
Rechytsa, BY|52.362|30.392
Pruzhany, BY|52.555|24.455
Polotsk, BY|55.488|28.786
Pinsk, BY|52.122|26.067
Pastavy, BY|55.117|26.833
Astraviec, BY|54.614|25.955
Osipovichi, BY|53.306|28.629
Orsha, BY|54.514|30.404
Nesvizh, BY|53.222|26.677
Novopolotsk, BY|55.526|28.593
Novogrudok, BY|53.594|25.819
Minsk, BY|53.900|27.567
Mazyr, BY|52.042|29.216
Marina Gorka, BY|53.509|28.147
Maladziecna, BY|54.317|26.854
Mahilyow, BY|53.909|30.340
Lyepyel, BY|54.881|28.699
Luninyets, BY|52.249|26.801
Logoysk, BY|54.206|27.851
Lida, BY|53.883|25.300
Krychaw, BY|53.719|31.714
Kalodzishchy, BY|53.944|27.782
Kobryn, BY|52.212|24.356
Kalinkovichi, BY|52.132|29.326
Ivatsevichi, BY|52.708|25.335
Ivanovo, BY|52.147|25.532
Hrodna, BY|53.676|23.829
Horki, BY|54.286|30.986
Homyel, BY|52.434|30.975
Hlybokaye, BY|55.139|27.691
Dzyarzhynsk, BY|53.685|27.132
Dobrush, BY|52.415|31.314
Bykhov, BY|53.521|30.231
Byaroza, BY|52.531|24.978
Brest, BY|52.109|23.717
Barysaw, BY|54.228|28.505
Baranovichi, BY|53.133|26.008
Bobruysk, BY|53.147|29.205
Oshmyany, BY|54.418|25.937
Fanipol, BY|53.750|27.333
San Pedro, BZ|17.916|-87.966
San Ignacio, BZ|17.159|-89.070
Orange Walk, BZ|18.081|-88.563
Belmopan, BZ|17.254|-88.764
Belize City, BZ|17.500|-88.198
Abbotsford, CA|49.058|-122.253
Agincourt North, CA|43.804|-79.275
Ahuntsic-Cartierville, CA|45.567|-73.667
Airdrie, CA|51.300|-114.035
Ajax, CA|43.850|-79.033
Alliston, CA|44.150|-79.866
Alma, CA|48.550|-71.649
Alta Vista, CA|45.386|-75.658
Amos, CA|48.567|-78.116
Arbutus Ridge, CA|49.250|-123.169
Armdale, CA|44.636|-63.626
Aurora, CA|44.000|-79.466
Baie-Comeau, CA|49.217|-68.149
Barrie, CA|44.400|-79.666
Bayview Village, CA|43.776|-79.380
Beaconsfield, CA|45.433|-73.866
Bedford, CA|44.726|-63.667
Belleville, CA|44.167|-77.383
Beloeil, CA|45.568|-73.206
Bendale, CA|43.767|-79.253
Blainville, CA|45.667|-73.882
Boisbriand, CA|45.617|-73.832
Bolton, CA|43.880|-79.738
Boucherville, CA|45.591|-73.436
Bowmanville, CA|43.917|-78.683
Bracebridge, CA|45.033|-79.316
Brampton, CA|43.683|-79.766
Brandon, CA|49.847|-99.953
Brant, CA|43.133|-80.350
Brantford, CA|43.133|-80.266
Bridlewood, CA|45.285|-75.857
Brighouse-City Centre, CA|49.167|-123.133
Broadmoor, CA|49.150|-123.133
Brocklehurst, CA|50.708|-120.413
Brockville, CA|44.591|-75.687
Brooklin, CA|43.958|-78.960
Brossard, CA|45.450|-73.466
Burlington, CA|43.386|-79.837
Burnaby, CA|49.266|-122.953
Caledon, CA|43.865|-79.993
Calgary, CA|51.050|-114.085
Cambridge, CA|43.360|-80.313
Campbell River, CA|50.016|-125.245
Camrose, CA|53.017|-112.835
Candiac, CA|45.383|-73.516
Cariboo, CA|49.250|-122.883
Cartierville, CA|45.531|-73.704
Central Saanich, CA|48.566|-123.419
Centretown, CA|45.415|-75.696
Chambly, CA|45.450|-73.282
Charlottetown, CA|46.235|-63.126
Chateauguay, CA|45.383|-73.749
Chatham, CA|42.412|-82.185
Chestermere, CA|51.033|-113.819
Chicoutimi, CA|48.420|-71.064
Chilliwack, CA|49.166|-121.953
Chomedey, CA|45.533|-73.750
Clarence-Rockland, CA|45.550|-75.291
Cliffcrest, CA|43.722|-79.231
Cloverdale, CA|49.108|-122.728
Cobourg, CA|43.960|-78.165
Cochrane, CA|51.183|-114.469
Collingwood, CA|44.483|-80.216
Colwood, CA|48.433|-123.486
Conception Bay South, CA|47.500|-52.998
Coquitlam, CA|49.285|-122.782
Corner Brook, CA|48.950|-57.952
Cornwall, CA|45.018|-74.728
Cote-Saint-Luc, CA|45.465|-73.666
Courtenay, CA|49.687|-124.994
Coventry Hills, CA|51.169|-114.059
Cranbrook, CA|49.500|-115.769
Dartmouth, CA|44.671|-63.577
Delta, CA|49.089|-123.053
Deux-Montagnes, CA|45.535|-73.902
Dieppe, CA|46.078|-64.687
Dollard-Des Ormeaux, CA|45.495|-73.824
Dorset Park, CA|43.754|-79.282
Dorval, CA|45.447|-73.753
Drummondville, CA|45.883|-72.482
Duncan, CA|48.783|-123.703
Duvernay, CA|45.583|-73.667
East Gwillimbury, CA|44.101|-79.438
Edgemont, CA|51.126|-114.149
Edmonton, CA|53.550|-113.469
Humbermede, CA|43.752|-79.544
Esquimalt, CA|48.436|-123.412
Etobicoke, CA|43.644|-79.570
Evergreen, CA|50.929|-114.100
Fleetwood, CA|49.167|-122.800
Flemingdon Park, CA|43.718|-79.332
Forest Heights, CA|43.419|-80.523
Fort Erie, CA|42.900|-78.933
Fort McMurray, CA|56.727|-111.381
Fort St. John, CA|56.250|-120.853
Fraser Heights, CA|49.200|-122.783
Fredericton, CA|45.945|-66.666
Gatineau, CA|45.477|-75.702
Georgetown, CA|43.650|-79.916
Glace Bay, CA|46.197|-59.957
Gloucester, CA|45.350|-75.633
Gordon Head, CA|48.483|-123.317
Granby, CA|45.400|-72.732
Grande Prairie, CA|55.167|-118.803
Greater Sudbury, CA|46.490|-80.990
Grandview-Woodlands, CA|49.277|-123.071
Greater Napanee, CA|44.250|-76.949
Greenfield Park, CA|45.486|-73.462
Grimsby, CA|43.200|-79.566
Guelph, CA|43.546|-80.256
Guildford, CA|49.192|-122.800
Halton Hills, CA|43.640|-79.931
Hamilton, CA|43.250|-79.850
Haney, CA|49.217|-122.600
Hastings-Sunrise, CA|49.283|-123.033
Henry Farm, CA|43.770|-79.352
Hespeler, CA|43.433|-80.316
Hillcrest Village, CA|43.805|-79.354
Huntsville, CA|45.333|-79.216
Innisfil, CA|44.300|-79.650
Joliette, CA|46.016|-73.424
Kamloops, CA|50.666|-120.319
Kanata, CA|45.300|-75.916
Kelowna, CA|49.883|-119.486
Kennedy Park, CA|43.723|-79.261
Kenora, CA|49.767|-94.490
Kensington-Cedar Cottage, CA|49.250|-123.067
Keswick, CA|44.250|-79.466
Killarney, CA|49.226|-123.043
Kingston, CA|44.230|-76.481
Kingsville, CA|42.100|-82.733
Kirkland, CA|45.450|-73.866
Kitchener, CA|43.425|-80.511
Kitsilano, CA|49.267|-123.167
Lafleche, CA|45.500|-73.466
Langford, CA|48.450|-123.503
Langley, CA|49.101|-122.659
La Prairie, CA|45.417|-73.499
LaSalle, CA|42.245|-83.061
LAssomption, CA|45.823|-73.429
Laval, CA|45.570|-73.692
Laval-des-Rapides, CA|45.556|-73.700
Leamington, CA|42.050|-82.600
Leduc, CA|53.267|-113.552
Les Coteaux, CA|45.283|-74.233
Lethbridge, CA|49.700|-112.819
Lindsay, CA|44.350|-78.733
Lloydminster, CA|53.272|-110.023
London, CA|42.983|-81.233
Longueuil, CA|45.515|-73.468
Lower Lonsdale, CA|49.314|-123.073
Lutes Mountain, CA|46.146|-64.908
Magog, CA|45.267|-72.149
Maillardville, CA|49.238|-122.867
Malvern, CA|43.809|-79.223
Maple Ridge, CA|49.219|-122.602
Markham, CA|43.867|-79.266
Mascouche, CA|45.750|-73.600
McKenzie Towne, CA|50.913|-113.967
Medicine Hat, CA|50.039|-110.677
Metrotown, CA|49.225|-123.000
Midland, CA|44.750|-79.883
Milliken, CA|43.825|-79.299
Milton, CA|43.517|-79.883
Mimico, CA|43.616|-79.513
Mirabel, CA|45.650|-74.083
Miramichi, CA|47.029|-65.502
Mission, CA|49.133|-122.303
Mississauga, CA|43.579|-79.658
Moncton, CA|46.095|-64.796
Montreal, CA|45.509|-73.588
Mont-Royal, CA|45.517|-73.649
Mont-Saint-Hilaire, CA|45.565|-73.187
Moose Jaw, CA|50.400|-105.534
Mount Pearl, CA|47.517|-52.781
Mount Pleasant, CA|49.267|-123.100
Nanaimo, CA|49.166|-123.940
Nepean, CA|45.336|-75.722
New Glasgow, CA|45.583|-62.649
Newmarket, CA|44.050|-79.466
Newton, CA|49.133|-122.850
New Westminster, CA|49.207|-122.911
Niagara Falls, CA|43.100|-79.066
Niagara-on-the-Lake, CA|43.257|-79.085
Norfolk County, CA|42.833|-80.383
North Battleford, CA|52.780|-108.297
North Bay, CA|46.317|-79.466
North Cowichan, CA|48.841|-123.686
North Delta, CA|49.167|-122.917
North Vancouver, CA|49.316|-123.069
Notre-Dame-de-Grace, CA|45.477|-73.614
Oak Bay, CA|48.450|-123.303
Oakville, CA|43.450|-79.683
Oakwood Village, CA|43.683|-79.438
Okanagan Mission, CA|49.817|-119.483
Okotoks, CA|50.729|-113.983
Wihkwentowin, CA|53.543|-113.522
Orangeville, CA|43.917|-80.100
Orillia, CA|44.609|-79.421
Oshawa, CA|43.900|-78.850
Ottawa, CA|45.411|-75.698
Ottawa South, CA|45.392|-75.687
Owen Sound, CA|44.567|-80.943
Panorama Hills, CA|51.153|-114.081
Paradise, CA|47.529|-52.881
Penticton, CA|49.481|-119.586
Petawawa, CA|45.895|-77.280
Peterborough, CA|44.300|-78.316
Pickering, CA|43.900|-79.133
Pierrefonds, CA|45.460|-73.893
Pitt Meadows, CA|49.221|-122.690
Pointe-Claire, CA|45.449|-73.817
Port Alberni, CA|49.241|-124.803
Port Colborne, CA|42.900|-79.233
Port Coquitlam, CA|49.266|-122.769
Port Moody, CA|49.281|-122.825
Prince Albert, CA|53.200|-105.768
Prince Edward, CA|44.000|-77.249
Prince George, CA|53.917|-122.753
Quinte West, CA|44.107|-77.570
Quispamsis, CA|45.421|-65.951
Red Deer, CA|52.267|-113.802
Regina, CA|50.450|-104.618
Renfrew-Collingwood, CA|49.245|-123.038
Repentigny, CA|45.742|-73.450
Richmond, CA|49.170|-123.137
Richmond Hill, CA|43.871|-79.437
Riverview, CA|46.055|-64.816
Rock Forest, CA|45.357|-71.997
Rouge, CA|43.804|-79.166
Rouyn-Noranda, CA|48.237|-79.023
Rutland, CA|49.900|-119.386
Saanich, CA|48.550|-123.369
Saddle Ridge, CA|51.133|-113.947
Saguenay, CA|48.417|-71.066
Saint-Basile-le-Grand, CA|45.533|-73.282
Saint-Bruno-de-Montarville, CA|45.533|-73.349
Saint-Charles-Borromee, CA|46.050|-73.466
Saint-Constant, CA|45.367|-73.566
Sainte-Catherine, CA|45.400|-73.582
Sainte-Catherine, CA|46.318|-72.566
Sainte-Julie, CA|45.583|-73.332
Sainte-Therese, CA|45.639|-73.828
Saint-Eustache, CA|45.565|-73.906
Saint-Hubert, CA|45.500|-73.416
Saint-Hyacinthe, CA|45.631|-72.957
Saint-Jean-sur-Richelieu, CA|45.307|-73.263
Saint-Jerome, CA|45.780|-74.004
Saint John, CA|45.271|-66.056
Saint John West, CA|45.259|-66.078
Saint-Laurent, CA|45.500|-73.666
Saint-Lazare, CA|45.400|-74.133
Saint-Leonard, CA|45.588|-73.595
Saint-Lin-Laurentides, CA|45.850|-73.766
Saint-Louis-de-Terrebonne, CA|45.702|-73.787
Saint-Michel, CA|45.568|-73.622
Saint-Vincent-de-Paul, CA|45.617|-73.649
Salaberry-de-Valleyfield, CA|45.250|-74.133
Salmon Arm, CA|50.700|-119.269
Sarnia, CA|42.979|-82.404
Saskatoon, CA|52.132|-106.669
Sault Ste. Marie, CA|46.517|-84.333
Scarborough Village, CA|43.739|-79.221
Seafair, CA|49.150|-123.183
Sept-Iles, CA|50.200|-66.382
Shawinigan, CA|46.567|-72.749
Sherbrooke, CA|45.400|-71.899
Sherwood Park, CA|53.517|-113.319
Sooke, CA|48.375|-123.728
Sorel-Tracy, CA|46.042|-73.114
South Surrey, CA|49.050|-122.792
Spruce Grove, CA|53.533|-113.919
Squamish, CA|49.699|-123.156
St. Albert, CA|53.633|-113.635
St. Catharines, CA|43.171|-79.243
Steeles, CA|43.812|-79.331
Steinbach, CA|49.526|-96.685
Stittsville, CA|45.250|-75.916
Stoney Creek, CA|43.217|-79.766
Stony Plain, CA|53.533|-114.002
Stouffville, CA|43.967|-79.250
Stratford, CA|43.367|-80.950
Strathroy, CA|42.955|-81.622
Strawberry Hill, CA|49.133|-122.883
St. Thomas, CA|42.774|-81.180
Surrey, CA|49.106|-122.825
Swift Current, CA|50.283|-107.801
Sylvan Lake, CA|52.311|-114.084
Tam OShanter-Sullivan, CA|43.780|-79.295
Taradale, CA|51.118|-113.937
Tecumseh, CA|42.316|-82.884
Templeton-Est, CA|45.494|-75.588
Terrace, CA|54.516|-128.603
Terrebonne, CA|45.700|-73.647
The Beaches, CA|43.674|-79.295
Thornhill, CA|43.815|-79.424
Thorold, CA|43.117|-79.200
Thunder Bay, CA|48.382|-89.250
Tillsonburg, CA|42.860|-80.726
Timmins, CA|48.467|-81.333
Toronto, CA|43.706|-79.399
Trois-Rivieres, CA|46.345|-72.548
Tsawwassen, CA|49.017|-123.083
Tuscany, CA|51.124|-114.245
Uxbridge, CA|44.100|-79.116
Val-des-Arbres, CA|45.598|-73.675
Val-dOr, CA|48.097|-77.797
Vancouver, CA|49.250|-123.119
Vanier, CA|45.440|-75.665
Varennes, CA|45.683|-73.432
Vaudreuil-Dorion, CA|45.400|-74.033
Vaughan, CA|43.836|-79.498
Vedder Crossing, CA|49.100|-121.967
Verdun, CA|45.460|-73.571
Vernon, CA|50.267|-119.273
Victoria, CA|48.436|-123.352
Victoria-Fraserview, CA|49.217|-123.067
Victoriaville, CA|46.050|-71.966
Wasaga Beach, CA|44.517|-80.016
Waterdown, CA|43.333|-79.883
Waterloo, CA|43.467|-80.516
Welland, CA|42.983|-79.250
West End, CA|49.283|-123.133
West Hill, CA|43.767|-79.180
Westmount, CA|45.483|-73.599
Weston, CA|43.704|-79.515
Whalley, CA|49.179|-122.867
Whitby, CA|43.883|-78.933
Whitchurch-Stouffville, CA|44.000|-79.316
Whitehorse, CA|60.716|-135.054
White Rock, CA|49.020|-122.795
Windsor, CA|42.300|-83.017
Winnipeg, CA|49.884|-97.147
Woburn, CA|43.767|-79.228
Woodlawn, CA|44.677|-63.527
Woodstock, CA|43.133|-80.750
Yellowknife, CA|62.454|-114.372
Yorkton, CA|51.217|-102.468
Halifax, CA|44.643|-63.577
St. Johns, CA|47.565|-52.709
Beauport, CA|46.859|-71.192
Charlesbourg, CA|46.899|-71.305
Sainte-Foy, CA|46.781|-71.292
Quebec, CA|46.812|-71.215
Levis, CA|46.803|-71.178
Rimouski, CA|48.449|-68.524
Riviere-du-Loup, CA|47.827|-69.542
Sydney, CA|46.135|-60.183
Aylmer, CA|45.400|-75.806
LAncienne-Lorette, CA|46.794|-71.352
Edmundston, CA|47.374|-68.325
Saint-Georges, CA|46.114|-70.665
La Baie, CA|48.340|-70.889
Hull, CA|45.428|-75.711
Buckingham, CA|45.586|-75.421
Thetford-Mines, CA|46.094|-71.305
Cole Harbour, CA|44.672|-63.475
West Kelowna, CA|49.862|-119.583
Jonquiere, CA|48.416|-71.249
Saint-Augustin-de-Desmaures, CA|46.741|-71.451
Ladner, CA|49.089|-123.082
Steveston, CA|49.127|-123.181
Walnut Grove, CA|49.165|-122.640
Willoughby, CA|49.126|-122.680
Evanston, CA|51.164|-114.123
Moss Park, CA|43.655|-79.372
High Park North, CA|43.656|-79.475
Cranston, CA|50.889|-113.981
Auburn Bay, CA|50.888|-113.959
Beltline, CA|51.040|-114.071
Little Portugal, CA|43.647|-79.430
Niagara, CA|43.645|-79.407
Trinity-Bellwoods, CA|43.648|-79.408
Morningside, CA|43.787|-79.206
Eglinton East, CA|43.739|-79.246
Pleasant View, CA|43.786|-79.335
Fergus, CA|43.706|-80.378
Ancaster, CA|43.218|-79.987
West Vancouver, CA|49.329|-123.160
Orleans, CA|45.457|-75.504
Willowdale, CA|43.767|-79.399
Lower Sackville, CA|44.776|-63.679
La Haute-Saint-Charles, CA|46.890|-71.372
Neufchatel-Est-Lebourgneuf, CA|46.854|-71.342
Downtown Vancouver, CA|49.283|-123.119
Chinatown, CA|49.280|-123.106
Fallingbrook, CA|45.476|-75.484
Lake Country, CA|50.009|-119.397
Valley East, CA|46.645|-80.997
Downtown Halifax, CA|44.648|-63.578
York University Heights, CA|43.766|-79.489
Parkwoods-Donalda, CA|43.755|-79.330
South Parkdale, CA|43.637|-79.439
South Riverdale, CA|43.649|-79.336
North St.James Town, CA|43.670|-79.375
Waterfront Communities-The Island, CA|43.634|-79.377
West Humber-Clairville, CA|43.716|-79.596
Banbury-Don Mills, CA|43.738|-79.350
Birchcliffe-Cliffside, CA|43.695|-79.265
Islington-City Centre West, CA|43.633|-79.543
Mount Pleasant West, CA|43.704|-79.393
Eringate-Centennial-West Deane, CA|43.658|-79.580
Dovercourt-Wallace Emerson-Junction, CA|43.666|-79.439
Edenbridge-Humber Valley, CA|43.671|-79.522
Newtonbrook East, CA|43.792|-79.406
Newtonbrook West, CA|43.786|-79.431
LAmoreaux, CA|43.796|-79.314
Taylor-Massey, CA|43.695|-79.296
Lansing-Westgate, CA|43.754|-79.425
Lawrence Park South, CA|43.717|-79.406
Leaside-Bennington, CA|43.704|-79.366
Mount Olive-Silverstone-Jamestown, CA|43.747|-79.587
Mount Pleasant East, CA|43.705|-79.385
Willowdale West, CA|43.771|-79.428
Black Creek, CA|43.765|-79.522
Rockcliffe-Smythe, CA|43.675|-79.494
Rosedale-Moore Park, CA|43.683|-79.380
Stonegate-Queensway, CA|43.636|-79.501
Danforth East York, CA|43.689|-79.331
St. Andrew-Windfields, CA|43.756|-79.379
Annex, CA|43.672|-79.404
Thorncliffe Park, CA|43.708|-79.350
Victoria Village, CA|43.728|-79.315
Wexford/Maryvale, CA|43.749|-79.299
Westminster-Branson, CA|43.779|-79.452
Willowdale East, CA|43.771|-79.401
Willowridge-Martingrove-Richview, CA|43.684|-79.554
Church-Yonge Corridor, CA|43.660|-79.379
Brookhaven-Amesbury, CA|43.701|-79.486
OConnor-Parkview, CA|43.707|-79.312
Kensington-Chinatown, CA|43.654|-79.397
Bay Street Corridor, CA|43.658|-79.386
Agincourt South-Malvern West, CA|43.789|-79.266
East End-Danforth, CA|43.684|-79.299
Englemount-Lawrence, CA|43.720|-79.437
Bedford Park-Nortown, CA|43.731|-79.420
Bathurst Manor, CA|43.765|-79.456
Clanton Park, CA|43.742|-79.446
Clairlea-Birchmount, CA|43.714|-79.281
Don Valley Village, CA|43.783|-79.354
Downsview-Roding-CFB, CA|43.733|-79.490
Glenfield-Jane Heights, CA|43.746|-79.513
High Park-Swansea, CA|43.645|-79.468
Kingsview Village-The Westway, CA|43.699|-79.548
LIle-Bizard-Sainte-Genevieve, CA|45.494|-73.896
Ville-Emard, CA|45.450|-73.602
Snowdon, CA|45.486|-73.631
Saint-Henri, CA|45.468|-73.601
Mile End, CA|45.524|-73.596
Parc-Extension, CA|45.530|-73.632
Outremont, CA|45.516|-73.609
Desmarchais-Crawford, CA|45.446|-73.582
Ile-des-Soeurs, CA|45.460|-73.548
Fairview, CA|49.263|-123.132
Dunbar-Southlands, CA|49.242|-123.188
Marpole, CA|49.214|-123.130
Sunset, CA|49.221|-123.095
Riley Park, CA|49.243|-123.093
Edmonds, CA|49.214|-122.940
Blundell, CA|49.155|-123.157
Surrey City Centre, CA|49.185|-122.847
Westwood Plateau, CA|49.305|-122.793
Victoria-Downtown, CA|48.428|-123.361
Carey, CA|48.472|-123.395
Lougheed, CA|49.248|-122.892
Harewood, CA|49.147|-123.947
Central Lonsdale, CA|49.326|-123.072
Townline, CA|49.062|-122.360
Chilliwack-Downtown, CA|49.164|-121.959
South Granville, CA|49.260|-123.139
Downtown Eastside, CA|49.282|-123.094
University Endowment Lands, CA|49.264|-123.239
Maywood, CA|49.222|-123.006
East Hastings, CA|49.272|-123.062
Central Coquitlam, CA|49.260|-122.838
Coquitlam Town Centre, CA|49.277|-122.797
Coquitlam West, CA|49.257|-122.879
Renfrew Heights, CA|49.254|-123.032
Le Plateau-Mont-Royal, CA|45.528|-73.581
Ville-Marie, CA|45.499|-73.570
Le Sud-Ouest, CA|45.472|-73.590
Mercier-Hochelaga-Maisonneuve, CA|45.572|-73.546
Montreal-Nord, CA|45.602|-73.631
Pierrefonds-Roxboro, CA|45.502|-73.842
Riviere-des-Prairies-Pointe-aux-Trembles, CA|45.641|-73.585
Rosemont-La Petite-Patrie, CA|45.537|-73.607
Villeray-Saint-Michel-Parc-Extension, CA|45.559|-73.605
Le Vieux-Longueuil, CA|45.537|-73.508
Halifax South End, CA|44.629|-63.577
Halifax West End, CA|44.649|-63.619
Mt Pleasant, CA|49.262|-123.100
Vanier, CA|43.427|-80.451
Christopher-Champlain, CA|43.347|-80.302
Fiddlesticks, CA|43.395|-80.287
La Cite-Limoilou, CA|46.829|-71.226
Les Rivieres, CA|46.818|-71.272
Nutana Sector, CA|52.100|-106.637
Core Neighbourhoods, CA|52.130|-106.672
Lakewood, CA|52.108|-106.590
University Heights, CA|52.144|-106.579
Confederation, CA|52.139|-106.704
Lawson, CA|52.164|-106.639
Stonebridge, CA|52.085|-106.623
Arcola East, CA|50.433|-104.536
Dewdney East, CA|50.454|-104.547
Fredericton Northside, CA|45.976|-66.641
Clayton Park West, CA|44.658|-63.669
Fort Garry South, CA|49.792|-97.164
St. James-Assiniboia East, CA|49.890|-97.227
Centre City, CA|51.045|-114.074
Sainte-Foy-Sillery-Cap-Rouge, CA|46.758|-71.349
Cap-Rouge, CA|46.748|-71.352
West Island, CC|-12.157|96.823
Yangambi, CD|0.768|24.440
Watsa, CD|3.037|29.536
Wamba, CD|2.148|27.995
Uvira, CD|-3.395|29.138
Tshikapa, CD|-6.416|20.800
Sake, CD|-1.574|29.043
Rutshuru, CD|-1.187|29.447
Pweto, CD|-8.466|28.901
Pepa, CD|-7.698|29.777
Nyunzu, CD|-5.956|28.016
Mwene-Ditu, CD|-7.009|23.453
Mweka, CD|-4.852|21.559
Mulongo, CD|-7.835|26.999
Mangbwalu, CD|1.945|30.039
Baudhuinville, CD|-7.084|29.737
Miabi, CD|-6.221|23.393
Mbuji-Mayi, CD|-6.136|23.590
Manono, CD|-7.299|27.399
Malemba-Nkulu, CD|-8.045|26.796
Lusambo, CD|-4.975|23.444
Luputa, CD|-7.162|23.701
Lukula, CD|-3.869|23.883
Luebo, CD|-5.352|21.422
Lubero, CD|-0.158|29.239
Lubao, CD|-5.388|25.749
Lodja, CD|-3.521|23.601
Lisala, CD|2.151|21.517
Kongolo, CD|-5.385|27.000
Kisangani, CD|0.515|25.191
Kirumba, CD|-1.091|29.293
Kipamba, CD|-8.206|26.420
Kindu, CD|-2.944|25.922
Kayna, CD|-0.609|29.172
Katwa, CD|0.089|29.309
Katanda, CD|-0.825|29.365
Kasongo, CD|-4.427|26.667
Kanyobagonga, CD|-0.700|29.172
Kanyama, CD|-7.517|24.174
Kananga, CD|-5.896|22.417
Kampene, CD|-3.597|26.667
Kamina, CD|-8.735|24.998
Kalima, CD|-5.485|28.216
Kalemie, CD|-5.947|29.195
Kabinda, CD|-6.138|24.482
Kabeya-Kamwanga, CD|-5.999|23.254
Kabare, CD|-2.497|28.791
Kabalo, CD|-6.053|26.914
Isiro, CD|2.774|27.616
Ilebo, CD|-4.331|20.586
Goma, CD|-1.674|29.228
Gbadolite, CD|4.279|21.003
Gandajika, CD|-6.745|23.953
Djugu, CD|1.919|30.503
Demba, CD|-5.496|22.270
Butembo, CD|0.142|29.291
Buta, CD|2.786|24.730
Businga, CD|3.339|20.886
Bunia, CD|1.559|30.252
Bumba, CD|2.188|22.468
Bukavu, CD|-2.491|28.843
Bukama, CD|-9.204|25.855
Bondo, CD|3.815|23.687
Boende, CD|-0.282|20.881
Binga, CD|2.374|20.498
Beni, CD|0.491|29.473
Basoko, CD|1.239|23.616
Bakwa, CD|4.126|27.395
Babamba, CD|0.183|27.483
Aru, CD|2.862|30.841
Aketi, CD|2.739|23.783
Tshilenge, CD|-10.967|22.900
Mokambo, CD|-12.428|28.347
Malemba, CD|-10.378|24.545
Lubumbashi, CD|-11.661|27.479
Likasi, CD|-10.983|26.738
Kolwezi, CD|-10.715|25.467
Kipushi, CD|-11.761|27.251
Kambove, CD|-10.874|26.597
Fungurume, CD|-10.618|26.321
Zongo, CD|4.343|18.594
Tshela, CD|-4.997|12.948
Nioki, CD|-2.720|17.690
Mushie, CD|-3.017|16.922
Moanda, CD|-5.928|12.371
Mbanza-Ngungu, CD|-5.258|14.858
Mbandaka, CD|0.049|18.260
Matadi, CD|-5.839|13.463
Masi-Manimba, CD|-4.775|17.891
Mangai, CD|-4.023|19.534
Libenge, CD|3.653|18.636
Kutu, CD|-2.725|18.148
Kinshasa, CD|-4.328|15.314
Kimpese, CD|-5.561|14.432
Kikwit, CD|-5.041|18.816
Kenge, CD|-5.765|13.657
Kasongo-Lunda, CD|-6.478|16.817
Kasangulu, CD|-4.583|15.166
Inongo, CD|-1.927|18.288
Inkisi, CD|-5.131|15.054
Idiofa, CD|-4.966|19.592
Gemena, CD|3.257|19.772
Dungu, CD|-3.624|18.849
Dibaya-Lubwe, CD|-4.159|19.862
Bulungu, CD|-4.544|18.604
Boma, CD|-5.851|13.054
Bolobo, CD|-2.158|16.232
Bolenge, CD|0.000|18.217
Basankusu, CD|1.221|19.802
Bandundu Province, CD|-3.317|17.381
Masina, CD|-4.384|15.391
Hyosha, CD|0.698|29.519
Mwene, CD|-9.817|22.870
Kituku, CD|-7.582|30.206
Mangina, CD|0.604|29.310
Zemio, CF|5.031|25.136
Ndele, CF|8.411|20.647
Ippy, CF|6.268|21.225
Bria, CF|6.542|21.986
Bangassou, CF|4.741|22.818
Bambari, CF|5.768|20.676
Alindao, CF|5.027|21.209
Yaloke, CF|5.320|17.101
Sibut, CF|5.718|19.074
Paoua, CF|7.243|16.441
Nola, CF|3.525|16.046
Mbaiki, CF|3.868|17.989
Kouango, CF|4.993|19.962
Kaga-Bandoro, CF|6.990|19.187
Kabo, CF|7.699|18.629
Dekoa, CF|6.322|19.079
Carnot, CF|4.943|15.877
Bozoum, CF|6.319|16.380
Bouca, CF|6.507|18.277
Bouar, CF|5.934|15.596
Bossembele, CF|5.267|17.650
Bossangoa, CF|6.493|17.455
Bocaranga, CF|6.985|15.641
Bobangui, CF|4.050|18.117
Boali, CF|4.800|18.127
Bimbo, CF|4.257|18.416
Berberati, CF|4.261|15.792
Begoua, CF|4.454|18.535
Batangafo, CF|7.301|18.283
Baoro, CF|5.667|15.967
Bangui, CF|4.361|18.555
Baboua, CF|5.796|14.828
Abba, CF|5.334|15.152
Sibiti, CG|-3.682|13.350
Pointe-Noire, CG|-4.776|11.864
Owando, CG|-0.482|15.900
Ouesso, CG|1.614|16.052
Mossendjo, CG|-2.950|12.704
Mossaka, CG|-1.220|16.799
Mouyondzi, CG|-3.994|13.927
Makoua, CG|0.007|15.633
Loutete, CG|-4.296|13.851
Loudima, CG|-4.116|13.068
Dolisie, CG|-4.198|12.667
Loandjili, CG|-4.756|11.858
Bouansa, CG|-4.219|13.762
Kayes, CG|-4.205|13.286
Impfondo, CG|1.618|18.060
Gamboma, CG|-1.876|15.864
Djambala, CG|-2.545|14.753
Brazzaville, CG|-4.266|15.283
Betou, CG|3.055|18.517
Mindouli, CG|3.103|18.511
Pokola, CG|1.405|16.318
Oyo, CG|-1.165|15.970
Nkayi, CG|-4.184|13.286
Zuerich, CH|47.367|8.550
Zug, CH|47.172|8.517
Yverdon-les-Bains, CH|46.779|6.641
Winterthur, CH|47.506|8.724
Wil, CH|47.462|9.046
Wetzikon, CH|47.326|8.798
Wettingen, CH|47.466|8.327
Vevey, CH|46.463|6.843
Vernier, CH|46.217|6.085
Uster, CH|47.347|8.721
Thun, CH|46.751|7.622
Steffisburg, CH|46.778|7.632
Solothurn, CH|47.208|7.537
Sitten, CH|46.227|7.356
Sierre, CH|46.292|7.536
Zuerich (Kreis 11) / Seebach, CH|47.422|8.548
Schwyz, CH|47.021|8.654
Schaffhausen, CH|47.697|8.635
Sankt Gallen, CH|47.424|9.375
Renens, CH|46.540|6.588
Rapperswil, CH|47.226|8.822
Pully, CH|46.510|6.662
Opfikon, CH|47.432|8.576
Onex, CH|46.184|6.102
Olten, CH|47.350|7.903
Zuerich (Kreis 11) / Oerlikon, CH|47.408|8.543
Nyon, CH|46.383|6.240
Neuchatel, CH|46.992|6.931
Muttenz, CH|47.523|7.645
Morges, CH|46.511|6.499
Montreux, CH|46.433|6.911
Monthey, CH|46.255|6.954
Meyrin, CH|46.234|6.080
Martigny-Ville, CH|46.103|7.072
Luzern, CH|47.050|8.306
Lugano, CH|46.010|8.960
Locarno, CH|46.171|8.800
Littau, CH|47.050|8.263
Lausanne, CH|46.516|6.633
La Chaux-de-Fonds, CH|47.100|6.826
Kriens, CH|47.031|8.285
Kreuzlingen, CH|47.651|9.175
Koeniz, CH|46.924|7.415
Kloten, CH|47.452|8.585
Jona, CH|47.230|8.839
Horgen, CH|47.260|8.598
Zuerich (Kreis 10) / Hoengg, CH|47.403|8.497
Herisau, CH|47.386|9.279
Grenchen, CH|47.192|7.396
Gossau, CH|47.416|9.255
Geneva, CH|46.202|6.146
Fribourg, CH|46.802|7.151
Frauenfeld, CH|47.558|8.899
Emmen, CH|47.078|8.273
Einsiedeln, CH|47.128|8.747
Dubendorf, CH|47.397|8.619
Dietikon, CH|47.402|8.400
Chur, CH|46.850|9.533
Cham, CH|47.182|8.464
Carouge, CH|46.181|6.139
Burgdorf, CH|47.059|7.628
Bulle, CH|46.618|7.057
Buelach, CH|47.522|8.540
Biel/Bienne, CH|47.137|7.246
Bern, CH|46.948|7.447
Bellinzona, CH|46.193|9.017
Basel, CH|47.558|7.573
Baden, CH|47.473|8.306
Baar, CH|47.196|8.530
Zuerich (Kreis 4) / Aussersihl, CH|47.378|8.521
Allschwil, CH|47.551|7.536
Adliswil, CH|47.310|8.525
Aarau, CH|47.393|8.044
Riehen, CH|47.579|7.647
Zuerich (Kreis 10) / Wipkingen, CH|47.395|8.525
Zuerich (Kreis 11) / Affoltern, CH|47.418|8.512
Zuerich (Kreis 2) / Wollishofen, CH|47.340|8.531
Zuerich (Kreis 3) / Sihlfeld, CH|47.374|8.512
Zuerich (Kreis 6) / Unterstrass, CH|47.395|8.537
Zuerich (Kreis 9) / Albisrieden, CH|47.374|8.490
Zuerich (Kreis 9) / Altstetten, CH|47.389|8.485
Stadt Winterthur (Kreis 1), CH|47.495|8.720
Zuerich (Kreis 12), CH|47.404|8.576
Seen (Kreis 3), CH|47.476|8.770
Zuerich (Kreis 3), CH|47.358|8.503
Zuerich (Kreis 11), CH|47.423|8.522
Zuerich (Kreis 9), CH|47.382|8.480
Oberwinterthur (Kreis 2), CH|47.517|8.769
Zuerich (Kreis 10), CH|47.408|8.501
Zuerich (Kreis 2), CH|47.338|8.521
Zuerich (Kreis 8), CH|47.355|8.561
Zuerich (Kreis 7), CH|47.373|8.580
Zuerich (Kreis 6), CH|47.392|8.544
Lancy, CH|46.190|6.114
Reinach, CH|47.497|7.592
Zuenoula, CI|7.430|-6.051
Zoukougbeu, CI|6.762|-6.864
Zouan-Hounien, CI|6.919|-8.207
Zou, CI|6.976|-7.798
Zaliohouan, CI|6.795|-6.236
Zaibo, CI|6.989|-6.667
Zagne, CI|6.210|-7.483
Yamoussoukro, CI|6.821|-5.277
Yabayo, CI|5.939|-6.598
Vavoua, CI|7.382|-6.478
Toumodi, CI|6.558|-5.018
Touba, CI|8.283|-7.683
Tortiya, CI|8.768|-5.686
Tengrela, CI|10.481|-6.407
Tiebissou, CI|7.158|-5.225
Tiassale, CI|5.898|-4.823
Tanda, CI|7.803|-3.168
Tafire, CI|9.069|-5.164
Tabou, CI|4.423|-7.353
Sinfra, CI|6.621|-5.911
Sassandra, CI|4.954|-6.085
Saioua, CI|6.485|-6.278
San-Pedro, CI|4.749|-6.636
Sakassou, CI|7.455|-5.293
Sahoua, CI|5.062|-6.260
Rubino, CI|6.070|-4.311
Petit Grabo, CI|5.269|-7.314
Petitgoa I, CI|6.120|-6.713
Pelezi, CI|7.282|-6.814
Para, CI|5.520|-7.328
Oupoyo, CI|5.561|-6.590
Oume, CI|6.383|-5.418
Ouangolodougou, CI|9.968|-5.149
Okrouyo, CI|5.764|-6.408
Okromodou, CI|5.351|-5.676
Odienne, CI|9.505|-7.564
Nielle, CI|10.198|-5.623
Niapidou, CI|5.348|-6.056
Niakaramandougou, CI|8.658|-5.291
Niable, CI|6.661|-3.270
Ndouci, CI|5.864|-4.761
Nambingue, CI|10.050|-5.338
Moussadougou, CI|6.154|-5.693
Mignoure, CI|7.487|-6.788
MBengue, CI|10.002|-5.900
MBatto, CI|6.472|-4.358
MBahiakro, CI|7.457|-4.340
Mankono, CI|8.059|-6.190
Man, CI|7.413|-7.554
Aboisso Comoe, CI|5.735|-3.403
Mahapleu, CI|7.225|-7.931
Mafere, CI|5.415|-3.030
Mabehiri, CI|5.667|-6.417
Luenoufla, CI|7.072|-6.241
Logouale, CI|7.108|-7.552
Lobakuya, CI|5.091|-6.344
Lakota, CI|5.848|-5.682
Koumassi, CI|5.297|-3.968
Kouibly, CI|7.256|-7.235
Kaouara, CI|10.091|-5.195
Korhogo, CI|9.458|-5.630
Kong, CI|9.149|-4.610
Konefla, CI|6.652|-5.605
Kolia, CI|9.765|-6.464
Ahigbe Koffikro, CI|5.408|-3.380
Katiola, CI|8.137|-5.101
Kahin, CI|6.914|-7.631
Issia, CI|6.492|-6.586
Hire, CI|6.189|-5.295
Guiglo, CI|6.544|-7.494
Guiberoua, CI|6.239|-6.171
Guezon, CI|6.742|-7.117
Guezon, CI|6.567|-7.702
Gueyo, CI|5.688|-6.071
Guessabo, CI|6.737|-6.955
Guepaouo, CI|6.473|-5.706
Grand-Lahou, CI|5.138|-5.021
Grand-Bassam, CI|5.212|-3.739
Affery, CI|6.320|-3.952
Goya, CI|6.565|-7.427
Gonate, CI|6.904|-6.243
Gohouo, CI|7.054|-7.440
Gadouan, CI|6.656|-6.166
Gbabam, CI|5.467|-5.587
Gaoulou, CI|5.033|-6.151
Gagnoa, CI|6.132|-5.951
Ferkessedougou, CI|9.593|-5.194
Fengolo, CI|6.786|-7.393
Ebilassokro, CI|6.379|-3.347
Dianra, CI|8.943|-6.255
Duekoue, CI|6.742|-7.349
Doukouya, CI|6.426|-5.559
Doropo, CI|9.810|-3.346
Divo, CI|5.837|-5.357
Diourouzon, CI|6.889|-7.520
Dignago, CI|6.292|-6.279
Dimbokro, CI|6.647|-4.705
Dikodougou, CI|9.068|-5.772
Diegonefla, CI|6.289|-5.574
Diawala, CI|10.107|-5.473
Daoukro, CI|7.059|-3.963
Danane, CI|7.260|-8.155
Daloa, CI|6.877|-6.450
Dagbao I, CI|5.560|-6.021
Dabou, CI|5.326|-4.377
Dabakala, CI|8.363|-4.429
Buyo, CI|6.275|-6.997
Boundiali, CI|9.522|-6.487
Bouna, CI|9.269|-2.995
Bouake, CI|7.694|-5.030
Bouafle, CI|6.990|-5.744
Bonoufla, CI|7.129|-6.474
Bonoua, CI|5.272|-3.596
Bongouanou, CI|6.652|-4.204
Bondoukou, CI|8.040|-2.800
Boboniessoko, CI|6.966|-6.657
Blolequin, CI|6.569|-8.003
Bingerville, CI|5.356|-3.885
Bieby, CI|6.079|-3.635
Bianouan, CI|6.012|-3.190
Biankouma, CI|7.739|-7.614
Beoumi, CI|7.674|-5.581
Bediala, CI|7.160|-6.306
Becedi-Brignan, CI|5.909|-4.013
Bayota, CI|6.465|-5.954
Gbapleu, CI|6.480|-7.165
Baoutifla, CI|7.234|-6.475
Bangolo, CI|7.012|-7.486
Bangolo Tahouake, CI|7.041|-7.168
Balakouya, CI|5.208|-6.352
Baibli, CI|7.176|-7.297
Bahe-Blaon, CI|6.671|-7.343
Azaguie, CI|5.630|-4.082
Arrah, CI|6.673|-3.969
Anyama, CI|5.495|-4.052
Ande, CI|6.782|-4.085
Akoupe, CI|6.384|-3.888
Agnibilekrou, CI|7.131|-3.204
Agboville, CI|5.928|-4.213
Adzope, CI|6.107|-3.862
Adiake, CI|5.286|-3.304
Aboisso, CI|5.468|-3.207
Abobo, CI|5.416|-4.016
Abidjan, CI|5.354|-4.002
Abengourou, CI|6.730|-3.496
Marcory, CI|5.312|-3.994
Eremankono, CI|5.928|-5.023
Ahouanou, CI|5.506|-4.859
Seguela, CI|7.961|-6.673
Soubre, CI|5.784|-6.594
Borotou-Koro, CI|8.491|-7.179
Diehiba, CI|6.902|-7.414
Kranzadougou, CI|6.485|-7.201
Nizahon II, CI|6.372|-7.399
Zeaglo, CI|6.563|-7.817
Aboka, CI|6.539|-6.816
Bonon, CI|6.927|-6.049
Belleville, CI|6.180|-6.905
Grand-Zattry, CI|6.116|-6.536
Loboville, CI|6.137|-6.841
Nzianouan, CI|6.012|-4.821
Meagui, CI|5.412|-6.560
Ancien-Prozi, CI|7.669|-6.969
Blenimeouin, CI|7.133|-7.183
Djapadji, CI|5.291|-6.820
Fronan, CI|8.215|-5.125
Gabiadji, CI|5.023|-6.562
Galebre, CI|6.006|-6.294
Gligbeuadji, CI|5.200|-6.700
Ogoudou, CI|5.897|-5.158
Touih, CI|5.256|-6.532
Dagadji, CI|5.126|-6.815
Gnatroa, CI|5.923|-6.150
Watte, CI|4.935|-6.778
Touagui, CI|5.431|-6.559
Gnago, CI|5.240|-5.795
Gnepasso, CI|4.982|-7.060
Gagny, CI|5.049|-6.745
Gbolouville, CI|5.794|-4.661
Vrouo, CI|7.696|-6.554
Bognonzra, CI|6.943|-5.967
Belleville, CI|6.873|-6.848
Flakiedougou, CI|8.483|-3.127
Avarua, CK|-21.207|-159.775
Vina del Mar, CL|-33.025|-71.552
Villarrica, CL|-39.286|-72.228
Villa Alemana, CL|-33.048|-71.373
Vilcun, CL|-38.669|-72.226
Vicuna, CL|-30.035|-70.713
Victoria, CL|-38.233|-72.333
Valparaiso, CL|-33.036|-71.630
Vallenar, CL|-28.576|-70.759
Valdivia, CL|-39.814|-73.246
Traiguen, CL|-38.250|-72.670
Tome, CL|-36.618|-72.956
Tocopilla, CL|-22.092|-70.198
Teodoro Schmidt, CL|-38.994|-73.089
Temuco, CL|-38.736|-72.597
Talcahuano, CL|-36.725|-73.117
Talca, CL|-35.423|-71.650
Talagante, CL|-33.664|-70.927
San Vicente de Tagua Tagua, CL|-34.439|-71.078
San Vicente, CL|-34.433|-71.083
Santiago, CL|-33.457|-70.648
Santa Cruz, CL|-34.639|-71.366
San Javier, CL|-35.595|-71.729
San Felipe, CL|-32.750|-70.726
San Esteban, CL|-32.799|-70.581
San Clemente, CL|-35.538|-71.487
San Carlos, CL|-36.425|-71.958
San Bernardo, CL|-33.592|-70.700
San Antonio, CL|-33.595|-71.607
Sagrada Familia, CL|-34.999|-71.384
Rio Bueno, CL|-40.335|-72.956
Rengo, CL|-34.406|-70.858
Renca, CL|-33.402|-70.706
Rancagua, CL|-34.169|-70.741
Quintero, CL|-32.786|-71.532
Quilpue, CL|-33.048|-71.442
Quillota, CL|-32.883|-71.249
Quillon, CL|-36.746|-72.475
Quilicura, CL|-33.368|-70.714
Putaendo, CL|-32.626|-70.718
Purranque, CL|-40.913|-73.159
Punta Arenas, CL|-53.163|-70.909
Puerto Varas, CL|-41.319|-72.985
Quellon, CL|-43.118|-73.617
Puerto Natales, CL|-51.730|-72.506
Puerto Montt, CL|-41.469|-72.942
Puerto Aysen, CL|-45.403|-72.692
Puente Alto, CL|-33.612|-70.576
Pucon, CL|-39.282|-71.954
Pozo Almonte, CL|-20.256|-69.786
Placilla, CL|-33.114|-71.568
Pitrufquen, CL|-38.986|-72.637
Penco, CL|-36.741|-72.995
Penalolen, CL|-33.468|-70.534
Penaflor, CL|-33.606|-70.876
Parral, CL|-36.143|-71.826
Panguipulli, CL|-39.644|-72.333
Paine, CL|-33.808|-70.741
Paillaco, CL|-40.068|-72.879
Padre Las Casas, CL|-38.761|-72.598
Padre Hurtado, CL|-33.568|-70.806
Ovalle, CL|-30.601|-71.199
Osorno, CL|-40.574|-73.133
Nunoa, CL|-33.447|-70.583
Nueva Imperial, CL|-38.745|-72.950
Nacimiento, CL|-37.503|-72.673
Mulchen, CL|-37.719|-72.241
Molina, CL|-35.114|-71.282
Melipilla, CL|-33.689|-71.215
Maullin, CL|-41.618|-73.598
Maipu, CL|-33.514|-70.765
Machali, CL|-34.181|-70.649
Lota, CL|-37.090|-73.158
Los Vilos, CL|-31.913|-71.500
Los Angeles, CL|-37.470|-72.354
Los Andes, CL|-32.834|-70.598
Los Alamos, CL|-37.628|-73.460
Longavi, CL|-35.965|-71.684
Loncoche, CL|-39.367|-72.631
Llanquihue, CL|-41.256|-73.006
Llaillay, CL|-32.840|-70.956
Linares, CL|-35.847|-71.593
Limache, CL|-33.013|-71.261
Lebu, CL|-37.608|-73.654
Lautaro, CL|-38.531|-72.437
La Union, CL|-40.293|-73.082
La Serena, CL|-29.906|-71.250
Lampa, CL|-33.286|-70.876
La Ligua, CL|-32.452|-71.231
La Cruz, CL|-32.827|-71.226
La Calera, CL|-32.787|-71.198
Labranza, CL|-38.765|-72.753
Iquique, CL|-20.213|-70.150
Illapel, CL|-31.633|-71.170
Hualpen, CL|-36.789|-73.102
Hacienda La Calera, CL|-32.783|-71.217
Hualqui, CL|-36.973|-72.936
Graneros, CL|-34.069|-70.727
Frutillar, CL|-41.122|-73.058
Freire, CL|-38.953|-72.627
El Quisco, CL|-33.398|-71.694
El Monte, CL|-33.680|-70.985
Curico, CL|-34.983|-71.239
Curanilahue, CL|-37.478|-73.345
Curacavi, CL|-33.398|-71.127
Cunco, CL|-38.932|-72.032
Coronel, CL|-37.034|-73.140
Coquimbo, CL|-29.953|-71.339
Copiapo, CL|-27.367|-70.332
Constitucion, CL|-35.333|-72.412
Concon, CL|-32.922|-71.516
Concepcion, CL|-36.827|-73.050
Collipulli, CL|-37.955|-72.434
Colina, CL|-33.204|-70.675
Colbun, CL|-35.695|-71.406
Coihueco, CL|-36.628|-71.831
Coyhaique, CL|-45.575|-72.066
Coelemu, CL|-36.487|-72.703
Chimbarongo, CL|-34.712|-71.043
Chillan Viejo, CL|-36.623|-72.132
Chillan, CL|-36.607|-72.103
Chiguayante, CL|-36.926|-73.028
Chicureo, CL|-33.284|-70.653
Cauquenes, CL|-35.967|-72.322
Castro, CL|-42.472|-73.773
Casablanca, CL|-33.317|-71.403
Cartagena, CL|-33.554|-71.608
Carahue, CL|-38.711|-73.161
Canete, CL|-37.801|-73.396
Caldera, CL|-27.068|-70.819
Calbuco, CL|-41.773|-73.130
Calama, CL|-22.457|-68.924
Cabrero, CL|-37.034|-72.405
Cabildo, CL|-32.431|-71.072
Buin, CL|-33.733|-70.743
Batuco, CL|-33.233|-70.809
Arica, CL|-18.476|-70.301
Arauco, CL|-37.246|-73.318
Antofagasta, CL|-23.651|-70.398
Angol, CL|-37.795|-72.716
Ancud, CL|-41.871|-73.816
Alto Hospicio, CL|-20.269|-70.105
Canete, CL|-37.800|-73.383
Las Animas, CL|-39.809|-73.218
San Pedro de la Paz, CL|-36.839|-73.100
La Pintana, CL|-33.583|-70.634
Lo Prado, CL|-33.444|-70.726
Villa Mercedes, CL|-37.404|-71.979
Yokadouma, CM|3.517|15.050
Yaounde, CM|3.867|11.517
Yagoua, CM|10.341|15.233
Wum, CM|6.383|10.067
Touboro, CM|7.771|15.357
Tonga, CM|4.967|10.700
Tombel, CM|4.747|9.671
Tiko, CM|4.075|9.360
Tibati, CM|6.465|12.628
Tchollire, CM|8.402|14.170
Tcheboa, CM|9.029|13.185
Souza Gare, CM|4.234|9.616
Sangmelima, CM|2.933|11.983
Pitoa, CM|9.384|13.502
Penja, CM|4.639|9.680
Oku, CM|6.250|10.433
Okoa, CM|3.983|11.600
Obala, CM|4.167|11.533
Nkoteng, CM|4.517|12.033
Nkongsamba, CM|4.955|9.940
Nkambe, CM|6.633|10.667
Njombe, CM|4.581|9.665
Ngaoundere, CM|7.328|13.585
Nanga Eboko, CM|4.683|12.367
Muyuka, CM|4.290|9.410
Mutengene, CM|4.091|9.314
Mora, CM|11.046|14.140
Mokolo, CM|10.742|13.802
Melong, CM|5.122|9.961
Meiganga, CM|6.517|14.300
Mbouda, CM|5.626|10.254
Mbanga, CM|4.502|9.567
Mbandjok, CM|4.450|11.900
Mbalmayo, CM|3.517|11.500
Maroua, CM|10.591|14.316
Manjo, CM|4.843|9.822
Mamfe, CM|5.751|9.314
Makak, CM|3.550|11.033
Magba, CM|5.950|11.217
Maga, CM|10.843|14.940
Loum, CM|4.718|9.735
Lolodorf, CM|3.233|10.733
Limbe, CM|4.024|9.206
Lagdo, CM|9.058|13.666
Kumbo, CM|6.200|10.667
Kumba, CM|4.636|9.447
Kribi, CM|2.937|9.908
Kousseri, CM|12.077|15.031
Kekem, CM|5.157|10.020
Kaele, CM|10.109|14.451
Guidiguis, CM|10.134|14.707
Guider, CM|9.933|13.947
Garoua Boulai, CM|5.883|14.550
Garoua, CM|9.301|13.398
Fundong, CM|6.280|10.283
Foumbot, CM|5.508|10.633
Foumban, CM|5.727|10.899
Fontem, CM|5.468|9.882
Figuil, CM|9.756|13.965
Eseka, CM|3.650|10.767
Ekondo Titi, CM|4.603|9.040
Edea, CM|3.800|10.133
Ebolowa, CM|2.900|11.150
Dschang, CM|5.444|10.053
Douala, CM|4.048|9.704
Dizangue, CM|3.767|9.983
Buea, CM|4.153|9.242
Bogo, CM|10.734|14.609
Bertoua, CM|4.577|13.685
Belabo, CM|4.933|13.300
Batouri, CM|4.433|14.367
Banyo, CM|6.750|11.817
Bangangte, CM|5.141|10.525
Bandjoun, CM|5.376|10.413
Bamusso, CM|4.459|8.903
Ndop, CM|5.988|10.439
Bamenda, CM|5.960|10.146
Bali, CM|5.887|10.012
Bafut, CM|6.083|10.100
Bafoussam, CM|5.478|10.418
Bafia, CM|4.750|11.233
Bafang, CM|5.157|10.177
Ambam, CM|2.383|11.283
Akonolinga, CM|3.767|12.250
Abong Mbang, CM|3.983|13.183
Ngaoundal, CM|6.500|13.267
Blangwa, CM|12.775|14.553
Zhefang, CN|24.267|98.283
Zhangfeng, CN|24.191|97.802
Zepu, CN|38.189|77.271
Zibihu, CN|26.114|99.953
Yingpan, CN|26.450|99.150
Yengisar, CN|38.926|76.171
Quxu, CN|29.355|90.732
Rikaze, CN|29.250|88.883
Tengyue, CN|24.995|98.513
Jiuquan, CN|39.743|98.517
Gar, CN|32.501|80.098
Shigu, CN|26.869|99.956
Shangyun, CN|23.052|99.828
Shangpa, CN|26.919|98.952
Shache, CN|38.417|77.241
Ruidian, CN|25.532|98.409
Qushi, CN|25.217|98.600
Qiemo, CN|38.134|85.530
Qarek, CN|38.372|76.990
Qamdo, CN|31.130|97.180
Yingjiang, CN|24.710|97.937
Oytograk, CN|36.833|81.933
Nyemo, CN|29.437|90.148
Luobuqiongzi, CN|29.167|89.250
Nagqu, CN|31.477|92.057
Qaraqash, CN|37.272|79.734
Mengmao, CN|24.001|97.865
Menglang, CN|22.562|99.910
Mangshi, CN|24.453|98.570
Mangnai Zhen, CN|38.386|90.156
Lop, CN|37.079|80.182
Longshan, CN|24.601|98.704
Liuku, CN|25.851|98.856
Lhasa, CN|29.650|91.100
Laojunmiao, CN|39.833|97.733
Bonan, CN|25.463|99.528
Langru, CN|36.893|79.621
Maizhokunggar, CN|29.838|91.729
Kokyar, CN|36.819|81.633
Kashgar, CN|39.467|75.987
Kaqun, CN|37.978|76.867
Judian, CN|27.306|99.649
Jinhua, CN|26.538|99.917
Jinding, CN|26.439|99.441
Jietou, CN|25.427|98.653
Jiayuguan, CN|39.811|98.286
Huatugou, CN|38.255|90.868
Houqiao, CN|25.324|98.278
Gujangbagh, CN|37.109|79.934
Yushu, CN|33.001|97.009
Gudong, CN|25.342|98.483
Gengqing, CN|31.817|98.581
Elixku, CN|38.709|77.371
Deqen, CN|29.962|90.719
Dagze, CN|29.673|91.345
Damxung, CN|30.478|91.106
Langgar, CN|36.700|81.500
Bayi, CN|29.658|94.359
Baoshan, CN|25.116|99.164
Artux, CN|39.708|76.180
Layka, CN|37.077|79.732
Saybag, CN|37.150|79.658
Arix, CN|36.755|81.608
Xambabazar, CN|36.886|81.510
Yuli, CN|41.337|86.257
Yanqi, CN|42.063|86.572
Xinyuan, CN|43.426|83.250
Wujiaqu, CN|44.163|87.522
Wensu, CN|41.275|80.236
Wusu, CN|44.431|84.676
UEruemqi, CN|43.801|87.600
Turpan, CN|42.948|89.179
Tacheng, CN|46.745|82.958
Shihezi, CN|44.302|86.037
Sandaohezi, CN|44.326|85.620
Chapchal, CN|43.836|81.148
Luntai, CN|41.780|84.270
Xincheng, CN|41.715|82.932
Korla, CN|41.761|86.152
Qarasu, CN|44.203|80.416
Karamay, CN|45.585|84.887
Jelilyuezi, CN|43.975|81.536
Ghulja, CN|43.915|81.322
Tewulike, CN|42.259|86.857
Hoxtolgay, CN|46.519|86.002
Hejing, CN|42.311|86.391
Hami, CN|42.834|93.506
Fuyun, CN|46.992|89.521
Emin, CN|46.526|83.634
Xininglu, CN|44.340|84.904
Dure, CN|46.512|88.534
Dunhuang, CN|40.167|94.683
Changji, CN|44.008|87.305
Burqin, CN|47.703|86.864
Bohu, CN|41.979|86.632
Beitun, CN|47.352|87.821
Baijiantan, CN|45.693|85.139
Alaer, CN|40.542|81.266
Jinshanlu, CN|47.850|88.133
Aqsu, CN|41.184|80.279
Oymak, CN|47.878|86.990
Kax, CN|43.641|81.870
Baytokay, CN|43.682|81.789
Yengitam, CN|43.746|81.657
Dadamtu, CN|43.980|81.314
Yuqunweng, CN|43.874|81.621
Panjim, CN|44.008|81.425
Liangji, CN|33.964|117.969
Lanshan, CN|33.936|117.725
Qingan, CN|33.969|117.881
Malingshan, CN|34.204|118.356
Chenlou, CN|34.389|118.050
Hegou, CN|34.408|118.122
Gangshang, CN|34.521|118.118
Zouzhuang, CN|34.600|118.050
Tangzhang, CN|34.148|117.254
Hanwang, CN|34.194|117.083
Yitang, CN|34.258|117.889
Xuzhuang, CN|34.296|117.458
Nianzhuang, CN|34.297|117.772
Tashan, CN|34.336|117.567
Zizhuang, CN|34.362|117.488
Liuji, CN|34.358|117.053
Jiangzhuang, CN|34.492|117.397
Daizhuang, CN|34.514|117.853
Zhangzhuang, CN|34.519|117.006
Xinglou, CN|34.567|117.828
Huzhai, CN|34.669|117.008
Heqiao, CN|34.453|116.900
Fanlou, CN|34.481|116.852
Hekou, CN|34.578|116.814
Songlou, CN|34.572|116.602
Sunlou, CN|34.667|116.583
Zhuzhai, CN|34.761|116.814
Zhaozhuang, CN|34.739|116.456
Anguo, CN|34.831|116.819
Shizhai, CN|34.806|116.639
Yaxing, CN|19.448|109.263
Lintan Chengguanzhen, CN|34.689|103.352
Zunyi, CN|27.687|106.907
Zuitai, CN|33.331|105.605
Zoucheng, CN|35.401|116.966
Nima, CN|34.001|102.071
Ziyang Chengguanzhen, CN|32.519|108.532
Ziyang, CN|30.121|104.648
Zitong, CN|30.178|105.830
Zishui, CN|31.413|108.315
Zigong, CN|29.342|104.777
Zhuzhou, CN|27.833|113.150
Zhuyuan, CN|31.302|109.258
Zhuyang, CN|29.064|105.945
Zhuxi, CN|29.536|105.667
Zhutuo, CN|29.018|105.849
Zhuoshui, CN|29.303|108.770
Zhumadian, CN|32.984|114.026
Zhujing, CN|30.901|121.160
Zhujiajiao, CN|31.108|121.057
Zhuji, CN|29.719|120.242
Zhouqu Chengguanzhen, CN|33.784|104.363
Zhucheng, CN|35.995|119.397
Zhuanghe, CN|39.701|122.991
Zhouzhuang, CN|31.118|120.844
Zhouxi, CN|26.483|107.917
Zhoukou, CN|33.633|114.633
Zhoujia, CN|30.419|107.538
Zhoucun, CN|36.817|117.817
Yuxi, CN|24.355|102.542
Baigong Jiedao, CN|30.295|108.034
Zhongzhai, CN|33.191|104.420
Zhongxing, CN|33.704|118.679
Zhongxin, CN|26.617|101.272
Zhongwei, CN|37.511|105.191
Zhongshu, CN|24.517|103.767
Zhonghe, CN|31.177|108.132
Zhonghe, CN|28.450|108.989
Zhongduo, CN|28.847|108.764
Gusong, CN|28.313|105.238
Zhongchao, CN|26.137|109.220
Zhongao, CN|29.765|105.666
Zhigou, CN|35.917|119.217
Zhicheng, CN|31.008|119.909
Zhicheng, CN|30.296|111.505
Zhenzhou, CN|32.280|119.170
Zhenxi, CN|29.899|107.465
Zhenping, CN|33.035|112.228
Zhenjiang, CN|32.211|119.455
Zhaobaoshan, CN|29.970|121.688
Zhengzhou, CN|34.758|113.649
Zhengxing, CN|29.457|106.129
Zhengji, CN|34.437|117.039
Zhengding, CN|38.145|114.566
Zhelou, CN|24.967|105.817
Yongji, CN|34.866|110.440
Xinghua, CN|32.939|119.834
Zhaotong, CN|27.317|103.717
Zhaoqing, CN|23.049|112.461
Zhaogezhuang, CN|39.765|118.412
Zhaodun, CN|34.303|117.857
Zhaoyuan, CN|37.365|120.410
Zhanjiang, CN|21.234|110.387
Zhanhe, CN|26.859|100.914
Zhangzhou, CN|24.513|117.656
Zhangzhai, CN|34.617|116.950
Zhangye, CN|38.934|100.452
Zhangjiachuan, CN|34.988|106.209
Zhangji, CN|34.138|117.376
Zibo, CN|36.791|118.063
Anyang, CN|36.096|114.383
Zhancheng, CN|34.175|117.763
Zhabei, CN|31.259|121.460
Zaozhuang, CN|34.865|117.554
Zaoyang, CN|32.127|112.754
Yuyao, CN|30.050|121.149
Yuzhou, CN|34.155|113.468
Yuxia, CN|34.062|108.629
Yuxi, CN|30.324|105.777
Yushan, CN|29.533|108.425
Kunshan, CN|31.378|120.954
Yunyang, CN|33.447|112.714
Yuntai, CN|30.139|107.205
Yunshan, CN|34.761|105.793
Yunnanyi, CN|25.424|100.689
Yunmeng Chengguanzhen, CN|31.063|113.765
Yunmen, CN|30.083|106.324
Yunjinghong, CN|22.015|100.798
Yunjin, CN|29.082|105.643
Pizhou, CN|34.311|117.950
Yunfu, CN|22.928|112.038
Yuncheng, CN|35.023|110.993
Yulinshi, CN|38.292|109.738
Yulin, CN|22.631|110.147
Wulingyuan, CN|29.349|110.544
Yujia, CN|30.811|107.954
Yuexi, CN|30.911|108.159
Yuepu, CN|31.427|121.421
Yudong, CN|29.385|106.519
Yuci, CN|37.680|112.732
Yucheng, CN|34.929|116.465
Yuanyang, CN|29.666|106.557
Huaiyang, CN|37.761|114.517
Yuanshang, CN|36.768|120.346
Yuanping, CN|38.715|112.757
Qianjiang, CN|30.421|112.892
Heyuan, CN|23.733|114.683
Youxi, CN|29.209|106.144
Youting, CN|29.431|105.738
Youchou, CN|28.963|109.141
Yongzhou, CN|26.424|111.613
Yongxing, CN|34.208|105.329
Yongxing, CN|28.990|106.176
Yongxin, CN|28.967|106.533
Yongqing, CN|34.748|106.127
Yongning, CN|27.833|100.667
Yongjia, CN|29.572|106.001
Yongfeng, CN|27.455|112.169
Yongchuan, CN|29.354|105.894
Yongbei, CN|26.646|100.781
Yongan, CN|31.019|109.459
Yizhuang, CN|34.157|117.594
Yishui, CN|35.785|118.628
Yinma, CN|36.661|119.463
Zhongxiang, CN|31.166|112.583
Yingtan, CN|28.233|117.000
Yingshang Chengguanzhen, CN|32.629|116.270
Yinggen, CN|19.038|109.840
Chengzhong, CN|30.945|113.553
Yinchuan, CN|38.468|106.273
Yima, CN|34.738|111.884
Yigou, CN|35.811|114.317
Qingzhou, CN|36.697|118.480
Yichun, CN|27.833|114.400
Yicheng, CN|31.705|112.256
Yixing, CN|31.361|119.820
Yichang, CN|30.714|111.285
Yibin, CN|28.759|104.640
Yezhou, CN|30.604|109.723
Yeyuan, CN|36.417|118.500
Yatou, CN|37.157|122.438
Yashan, CN|22.198|109.942
Yaowan, CN|34.183|118.067
Yaoji, CN|34.067|117.817
Yanzibu, CN|34.506|117.702
Yanzhou, CN|35.553|116.829
Yantai, CN|37.476|121.441
Yanliang, CN|34.659|109.229
Yanjing, CN|29.945|106.350
Yanjia, CN|29.828|106.997
Yangzhou, CN|32.397|119.436
Yangzhou, CN|33.222|107.543
Yanguan, CN|34.264|105.464
Yangtun, CN|34.883|116.883
Yangshuo, CN|24.781|110.490
Zhangjiagang, CN|31.865|120.539
Yangquan, CN|37.858|113.563
Yangpu, CN|31.262|121.519
Yangliuqing, CN|39.138|117.000
Yangjiaying, CN|39.481|111.693
Yanghe, CN|38.279|106.248
Yanghang, CN|31.370|121.437
Yanggu, CN|36.111|115.775
Yangcun, CN|39.364|117.060
Yancheng, CN|33.358|120.157
Yanan, CN|36.599|109.492
Yajiang, CN|29.455|107.374
Yaan, CN|29.985|102.999
Tongshan, CN|34.180|117.157
Xuyong, CN|28.170|105.435
Xucheng, CN|20.330|110.166
Shangrao, CN|28.452|117.943
Xunyang, CN|32.824|109.365
Xunsi, CN|28.101|104.561
Xunchang, CN|28.454|104.715
Xujiang, CN|26.839|116.320
Xuhui, CN|31.196|121.447
Xuchang, CN|34.032|113.863
Xuantan, CN|29.209|105.570
Xuancheng, CN|30.953|118.755
Xixiang, CN|35.163|112.865
Xixiang, CN|32.987|107.764
Xiuying, CN|20.001|110.294
Xiulin, CN|29.717|112.400
Xiugu, CN|27.911|116.776
Xituo, CN|30.408|108.217
Xiongzhou, CN|25.117|114.300
Huayuan, CN|28.286|117.207
Xinzhou, CN|38.409|112.733
Xinzhou, CN|30.867|114.800
Xinzhou, CN|19.714|109.311
Xinzhi, CN|36.499|111.705
Xinzhai, CN|36.400|118.617
Xinyu, CN|27.804|114.933
Xinye, CN|32.529|112.365
Xinyang, CN|32.123|114.066
Xinxing, CN|36.049|119.541
Xinxiang, CN|35.190|113.802
Xintian, CN|30.699|108.402
Xintai, CN|35.901|117.752
Xinshi, CN|31.047|113.141
Xinqiao, CN|31.065|121.308
Xinmin, CN|30.903|109.467
Xinmiao, CN|29.655|107.050
Xinji, CN|37.926|115.219
Xining, CN|36.626|101.757
Shangmei, CN|27.743|111.296
Xinhe, CN|36.925|119.593
Xingtai, CN|37.062|114.493
Xingren, CN|25.433|105.233
Xinglong, CN|29.889|106.706
Xinglong, CN|30.657|109.446
Xingguo, CN|34.859|105.669
Ankang, CN|32.680|109.017
Wenfeng, CN|31.405|109.235
Xindian, CN|36.797|118.294
Xindian, CN|25.281|101.558
Xindi, CN|29.817|113.467
Feicheng, CN|36.249|116.766
Xincheng, CN|34.674|103.587
Xinshi, CN|29.960|107.104
Xinyi, CN|34.384|118.346
Sanshui, CN|23.155|112.892
Ximeicun, CN|24.988|118.386
Wacheng Neighborhood, CN|33.783|114.517
Xihe, CN|31.686|113.466
Xigang, CN|38.553|106.348
Xiema, CN|29.774|106.369
Xichang, CN|27.896|102.263
Xichang, CN|21.633|108.950
Xiazhuang, CN|36.449|119.836
Xiazhuang, CN|34.916|118.639
Xiazhuang, CN|25.400|100.833
Xiazhen, CN|34.802|117.112
Xiasi, CN|26.517|107.783
Haining, CN|30.536|120.686
Gongyi, CN|34.755|113.011
Xiaoweizhai, CN|26.190|107.513
Xiaoshan, CN|30.167|120.259
Xiaomian, CN|30.123|106.534
Xiaolingwei, CN|32.032|118.854
Jinfeng, CN|28.238|116.601
Xiaogan, CN|30.927|113.922
Xiaochuan, CN|33.681|105.562
Xianyang, CN|34.338|108.703
Xiantao, CN|30.371|113.443
Xianshuigu, CN|38.985|117.383
Xiannue, CN|32.428|119.560
Xianning, CN|29.843|114.322
Xianju, CN|28.855|120.732
Xiangzhou, CN|36.164|119.419
Zhuhai, CN|22.277|113.568
Xiangcheng, CN|25.467|100.562
Wenxing, CN|28.682|112.879
Xiangxiang, CN|27.733|112.533
Xiangtan, CN|27.850|112.900
Xiangshui, CN|30.655|108.193
Xiangyang, CN|32.042|112.145
Xiangcheng, CN|33.854|113.487
Xianfeng, CN|29.210|106.300
Xian, CN|34.258|108.929
Xiamen, CN|24.480|118.082
Xiagezhuang, CN|36.693|120.435
Wuzhou, CN|23.481|111.288
Wuzhong, CN|37.987|106.201
Wuzhen, CN|30.745|120.485
Wuyang, CN|31.992|116.247
Wuxue, CN|29.851|115.552
Wushan, CN|31.077|109.876
Wuxi, CN|31.569|120.289
Wutongshu, CN|38.183|106.283
Wushan, CN|34.721|104.886
Wuqiao, CN|30.780|108.455
Dongyang, CN|29.268|120.225
Wuling, CN|30.506|108.259
Changde, CN|29.032|111.698
Wujing, CN|36.450|118.400
Wujia, CN|29.635|105.391
Wujia, CN|21.767|109.033
Wuhu, CN|31.353|118.429
Wuhan, CN|30.583|114.267
Wuhai, CN|39.684|106.816
Wugang, CN|26.728|110.632
Wudong, CN|30.210|107.341
Wuda, CN|39.499|106.712
Wucheng, CN|29.601|118.175
Wuchang, CN|30.543|114.301
Wenzhou, CN|27.999|120.667
Wenxian Chengguanzhen, CN|32.947|104.681
Wenshang, CN|35.727|116.496
Wenquan, CN|31.359|108.522
Wenling, CN|28.375|121.384
Wenjiang, CN|28.388|104.563
Wenheng, CN|25.667|116.754
Tianfu, CN|37.264|122.052
Wenchang, CN|19.552|110.803
Weituo, CN|30.040|106.147
Weinan, CN|34.504|109.509
Weimiao, CN|34.583|117.067
Weiji, CN|34.033|117.950
Weihai, CN|37.509|122.114
Weifang, CN|36.710|119.102
Wayaobu, CN|37.136|109.660
Wayao, CN|34.383|118.233
Wanxian, CN|30.816|108.374
Wanshun, CN|30.040|106.972
Wanshui, CN|26.735|107.987
Wansheng, CN|28.963|106.928
Wanning, CN|18.799|110.384
Wangwu, CN|19.656|109.291
Wangu, CN|29.682|105.936
Wangpu, CN|35.057|105.436
Wangji, CN|33.983|117.750
Yinzhu, CN|35.879|119.975
Wangfen, CN|36.550|118.383
Waina, CN|33.206|105.050
Wafangdian, CN|39.618|122.008
Tuxiang, CN|30.713|109.156
Tushan, CN|34.221|117.837
Huangshan, CN|29.711|118.312
Loushanguan, CN|28.137|106.822
Tongzhou, CN|39.904|116.662
Tongxi, CN|30.000|106.130
Fuding, CN|27.327|120.214
Tongren, CN|27.717|109.185
Tongling, CN|30.950|117.783
Tongjing, CN|29.857|106.845
Tongchuan, CN|31.094|105.087
Tieqiao, CN|31.040|108.134
Tiefu, CN|34.533|118.033
Tiaoshi, CN|29.277|106.642
Tianzhuang, CN|36.796|119.737
Tianshui, CN|34.580|105.742
Tianpeng, CN|30.987|103.939
Tianliu, CN|37.000|118.783
Tianjin, CN|39.142|117.177
Chengtangcun, CN|35.084|117.191
Taozhuang, CN|34.850|117.333
Taozhou, CN|30.906|119.409
Taoyuan, CN|33.853|117.770
Taoluo, CN|35.274|119.370
Taolin, CN|35.800|119.534
Tantou, CN|26.030|119.597
Tanjia, CN|31.456|108.499
Tangzhai, CN|34.433|116.591
Tangwu, CN|36.447|118.860
Tangshan, CN|39.644|118.183
Tangping, CN|22.032|111.935
Tangjiazhuang, CN|39.743|118.451
Tanghe, CN|32.685|112.832
Tanggu, CN|39.021|117.647
Tangba, CN|30.017|105.797
Taizhou, CN|32.491|119.908
Taiyuan, CN|37.869|112.560
Taixing, CN|32.167|120.014
Taiping, CN|30.262|107.293
Shanghe, CN|30.160|105.934
Taihe, CN|30.099|106.049
Taishan, CN|22.251|112.780
Taicang, CN|31.448|121.094
Taian, CN|36.185|117.120
Taian, CN|30.066|105.809
Suzhou, CN|33.636|116.979
Suyangshan, CN|34.393|117.756
Suqian, CN|33.949|118.296
Suozhen, CN|36.954|118.105
Suizhou, CN|31.711|113.363
Suixi, CN|33.891|116.775
Suicheng, CN|33.896|117.933
Suining, CN|30.508|105.573
Songnan, CN|31.350|121.482
Songjiang, CN|31.034|121.223
Songgang, CN|22.779|113.845
Songcheng, CN|26.882|120.001
Songbai, CN|31.757|110.673
Shangsi, CN|22.156|107.980
Sitou, CN|36.313|118.412
Sishui, CN|35.649|117.276
Simen, CN|34.622|105.013
Puer, CN|22.789|100.975
Dachang Shandao, CN|39.276|122.600
Sihu, CN|34.626|117.971
Shuozhou, CN|39.316|112.422
Shunhe, CN|34.842|116.557
Shuizhai, CN|23.930|115.765
Shuitu, CN|29.782|106.497
Shuikou, CN|25.913|109.314
Shuikou, CN|23.984|115.896
Shuijiang, CN|29.248|107.284
Laixi, CN|36.859|120.527
Shuangshi, CN|29.400|105.838
Shuanglong, CN|29.960|107.204
Shuangjiang, CN|30.218|105.745
Shuangjiang, CN|25.967|108.924
Shuanghe, CN|29.321|105.569
Shuanggou, CN|34.035|117.578
Shouxian, CN|34.846|116.459
Shouguang, CN|36.880|118.737
Huinong, CN|39.233|106.769
Shizilu, CN|35.171|118.829
Shiyan, CN|32.648|110.778
Shiwan, CN|23.001|113.077
Shiwan, CN|21.750|109.200
Shituo, CN|29.716|107.136
Shitanjing, CN|39.234|106.344
Shiquan, CN|33.041|108.236
Shiqiaozi, CN|36.162|119.263
Shiqiao, CN|22.946|113.358
Shiqi, CN|22.517|113.385
Shimen, CN|29.100|106.033
Shima, CN|29.631|105.831
Shima, CN|24.446|117.812
Xianglong, CN|30.261|106.576
Shilong, CN|23.114|113.847
Tongchuanshi, CN|35.075|109.085
Shikang, CN|21.767|109.317
Shijiazhuang, CN|38.041|114.479
Shijiao, CN|28.924|106.756
Shiji, CN|34.200|118.483
Shihui, CN|29.572|108.610
Shidui, CN|36.393|119.309
Shichuan, CN|29.766|106.823
Shibuzi, CN|36.124|119.103
Shetan, CN|29.989|107.615
Shenzhen, CN|22.546|114.068
Yanta, CN|36.241|115.667
Chentuan, CN|35.505|119.267
Shenjiamen, CN|29.958|122.298
Shekou, CN|22.494|113.916
Yunlong, CN|30.523|107.642
Shawan, CN|33.627|104.564
Rensha, CN|30.053|107.594
Shaping, CN|30.475|107.436
Shaping, CN|22.770|112.958
Shaoxing, CN|30.002|120.579
Shaowu, CN|27.341|117.483
Shaoshan, CN|27.917|112.517
Shaoguan, CN|24.800|113.583
Shaodian, CN|34.133|118.433
Shancheng, CN|34.795|116.082
Shanwei, CN|22.782|115.347
Shantou, CN|23.355|116.679
Shanting, CN|35.075|117.458
Shankou, CN|21.600|109.717
Shanji, CN|34.205|117.596
Shangluo, CN|33.867|109.931
Shangqiu, CN|34.414|115.656
Shangkou, CN|36.966|118.883
Shanghuang, CN|31.320|109.484
Shanghai, CN|31.222|121.458
Shajing, CN|22.746|113.819
Shaji, CN|33.900|118.133
Shahecheng, CN|36.938|114.506
Shahe, CN|30.828|108.350
Shagang, CN|21.667|109.033
Sanzhuang, CN|35.503|119.172
Sanya, CN|18.254|109.509
Sanqu, CN|29.642|105.622
Sanming, CN|26.249|117.619
Sanmenxia, CN|34.781|111.193
Sanjiao, CN|29.050|106.736
Sanjiang, CN|28.945|106.711
Sanhui, CN|30.082|106.591
Xiaodu, CN|29.962|105.887
Sanhe, CN|39.980|117.069
Sangzhe, CN|29.278|108.398
Changsha, CN|22.381|112.685
Runan, CN|33.000|114.346
Ruian, CN|27.776|120.659
Tongren, CN|35.515|102.016
Ronglong, CN|29.436|105.449
Rongjiang, CN|26.550|101.250
Fuqing, CN|25.729|119.375
Jieyang, CN|23.542|116.366
Rizhuang, CN|36.951|120.383
Renzhao, CN|36.639|120.204
Renyi, CN|29.507|105.478
Renxian, CN|30.661|107.679
Renqiu, CN|38.709|116.101
Renhe, CN|26.417|101.017
Quzhou, CN|28.959|118.869
Qujing, CN|25.483|103.783
Qufu, CN|35.597|116.991
Quanzhou, CN|24.914|118.586
Wuxi, CN|26.584|111.859
Zhuangyuan, CN|37.306|120.827
Qiuji, CN|33.800|118.000
Qishan, CN|34.633|116.800
Qisha, CN|21.575|108.479
Qiongshan, CN|20.009|110.354
Qionghu, CN|28.841|112.355
Qinzhou, CN|21.982|108.651
Qinnan, CN|33.253|119.913
Qinhuangdao, CN|39.941|119.589
Yizhou, CN|24.500|108.667
Jinjiang, CN|24.820|118.574
Qingshuping, CN|27.381|112.021
Qingshizui, CN|37.467|101.433
Qingshanquan, CN|34.416|117.363
Qingquan, CN|30.451|115.256
Qingpu, CN|31.154|121.114
Qingping, CN|29.977|106.521
Huaian, CN|33.589|119.019
Qingfu, CN|28.437|104.516
Qingdao, CN|36.065|120.380
Qingyuan, CN|23.700|113.033
Qincheng, CN|27.213|116.530
Qina, CN|26.309|100.625
Qishan, CN|29.844|117.719
Hongqiao, CN|26.768|112.108
Qibao, CN|31.153|121.357
Qiaotou, CN|36.935|101.674
Qiaotou, CN|33.108|104.812
Qiaoguan, CN|36.564|118.884
Qianliu, CN|22.900|100.200
Qabqa, CN|36.281|100.613
Puzi, CN|29.633|108.328
Puyang Chengguanzhen, CN|35.706|115.028
Puyang, CN|29.457|119.889
Putuo, CN|31.251|121.390
Putian, CN|25.439|119.010
Puji, CN|36.132|119.721
Puqi, CN|29.717|113.883
Yongning, CN|22.761|108.484
Pulandian, CN|39.395|121.967
Pudong, CN|31.240|121.501
Puan, CN|32.037|105.467
Poyang, CN|28.992|116.668
Pingyin, CN|36.283|116.445
Pingyi, CN|35.501|117.631
Gutao, CN|37.203|112.178
Pingxiang, CN|27.617|113.854
Pingxiang, CN|22.097|106.757
Pingtan, CN|29.846|105.878
Pingshan, CN|22.994|114.713
Pingnan, CN|23.542|110.389
Pingliang, CN|35.539|106.686
Pingli, CN|32.385|109.346
Pingjin, CN|30.612|107.545
Pingdu, CN|36.784|119.946
Pingdingshan, CN|33.731|113.316
Pianjiao, CN|26.017|100.583
Pengze, CN|29.899|116.546
Pengpu, CN|31.285|121.437
Pengcheng, CN|36.431|114.170
Peicheng, CN|34.736|116.925
Picheng, CN|34.467|117.967
Panlong, CN|29.500|105.371
Panghai, CN|26.727|108.064
Panan, CN|34.755|105.112
Paipu, CN|19.640|109.159
Guangan, CN|30.474|106.637
Ningyang, CN|35.764|116.791
Yutan, CN|28.258|112.560
Hanyuan, CN|32.834|106.250
Ninghai, CN|37.384|121.609
Ninghai, CN|29.289|121.425
Ninger, CN|23.041|101.037
Ningbo, CN|29.878|121.549
Nianbo, CN|36.480|102.416
Neijiang, CN|29.584|105.062
Nanzhou, CN|29.364|112.407
Nanzhang Chengguanzhen, CN|31.784|111.828
Nanyang, CN|33.005|112.547
Nanxi, CN|28.842|104.980
Nantou, CN|22.536|113.916
Nantong, CN|32.030|120.875
Nanshu, CN|37.020|120.337
Nanqiao, CN|30.916|121.449
Pucheng, CN|27.923|118.533
Nanping, CN|29.086|106.987
Nanping, CN|26.645|118.174
Nanning, CN|22.817|108.317
Nanma, CN|36.185|118.155
Nanlong, CN|31.353|106.063
Nanjing, CN|32.062|118.778
Nanjian, CN|25.045|100.514
Nanhu, CN|35.488|119.346
Nangong, CN|37.355|115.389
Nanfeng, CN|23.727|111.797
Nanfeng, CN|19.410|109.550
Nandu, CN|22.852|110.823
Nanding, CN|36.748|118.056
Nancun, CN|36.533|120.134
Nanchong, CN|30.795|106.085
Nanchang, CN|28.684|115.853
Nanbin, CN|29.999|108.109
Naliang, CN|21.667|107.867
Nada, CN|19.521|109.579
Muer, CN|29.806|106.644
Mudong, CN|29.573|106.839
Miyang, CN|24.404|103.443
Minhang, CN|31.109|121.375
Mingshui, CN|36.717|117.500
Mingguang, CN|32.780|117.964
Minggang, CN|32.459|114.049
Mingcun, CN|36.754|119.641
Micheng, CN|25.343|100.487
Miaoyu, CN|30.869|109.646
Miaohang, CN|31.325|121.440
Mianyang, CN|31.468|104.682
Mianyang, CN|33.157|106.694
Mentougou, CN|39.938|116.093
Mengyin, CN|35.707|117.926
Mengla, CN|21.462|101.564
Mengcheng Chengguanzhen, CN|33.266|116.566
Menga, CN|22.199|100.417
Meizhou, CN|24.289|116.118
Meishan, CN|30.044|103.837
Wuchuan, CN|21.457|110.766
Meijiang, CN|28.264|109.027
Mawu, CN|29.593|107.313
Mawang, CN|28.893|108.951
Mapo, CN|34.517|117.067
Maoming, CN|21.666|110.914
Maocun, CN|34.377|117.251
Malianzhuang, CN|37.075|120.463
Majie, CN|25.032|102.638
Zhijiang, CN|30.421|111.753
Macheng, CN|31.180|115.022
Maba, CN|24.684|113.598
Maanshan, CN|31.686|118.510
Luzhou, CN|28.890|105.426
Lueshun, CN|38.800|121.267
Lushar, CN|36.484|101.563
Lushan, CN|26.650|107.783
Luoyang, CN|34.673|112.437
Luoyang, CN|24.959|118.683
Luoyang, CN|23.162|114.273
Luorong, CN|24.406|109.609
Luoqi, CN|29.722|106.932
Luoping, CN|31.207|110.087
Luomen, CN|34.754|105.025
Luolong, CN|28.806|104.899
Luojing, CN|31.478|121.339
Luojiang, CN|31.305|104.505
Luohuang, CN|29.347|106.435
Luohe, CN|33.574|114.033
Luodian, CN|31.416|121.334
Luocheng, CN|29.385|104.029
Lulou, CN|34.717|116.767
Lucheng, CN|31.234|117.281
Lueeyang Chengguanzhen, CN|33.332|106.155
Kangding, CN|30.002|101.957
Lubu, CN|23.172|112.283
Luancheng, CN|37.885|114.646
Luan, CN|31.736|116.517
Loudi, CN|27.734|111.994
Longyan, CN|25.075|117.018
Longxing, CN|29.702|106.791
Longtan, CN|29.446|107.102
Longtan, CN|28.757|108.964
Longshui, CN|29.566|105.762
Longshi, CN|30.215|106.457
Longshan, CN|35.032|106.081
Longquan, CN|24.672|102.161
Longmen, CN|30.798|107.687
Longhua, CN|29.210|106.207
Longlin, CN|33.943|105.067
Longgang, CN|37.652|120.331
Longju, CN|30.611|108.635
Longgu, CN|34.903|116.807
Longgang, CN|29.697|105.714
Longgang, CN|22.723|114.263
Longfeng, CN|30.388|109.507
Longe, CN|25.807|109.213
Longchi, CN|28.610|109.049
Longcheng, CN|35.001|105.973
Longchang, CN|26.667|107.917
Licheng, CN|31.428|119.484
Lixin, CN|34.912|105.081
Lixian, CN|34.190|105.172
Liuyin, CN|29.962|106.610
Guankou, CN|28.159|113.627
Liuxin, CN|34.369|117.115
Liutuan, CN|36.933|119.383
Puning, CN|23.311|116.169
Liuquan, CN|34.434|117.298
Lishui, CN|28.460|119.910
Lishi, CN|29.079|106.262
Lintong, CN|34.378|109.209
Liuzhou, CN|24.324|109.407
Linyi, CN|35.063|118.343
Linxia Chengguanzhen, CN|35.600|103.206
Linxi, CN|39.712|118.450
Linshui, CN|36.425|114.205
Linshi, CN|29.667|107.192
Linqu, CN|36.516|118.540
Linqiong, CN|30.416|103.461
Qingnian, CN|36.841|115.711
Linping, CN|30.422|120.297
Linjiang, CN|29.245|105.957
Linjiang, CN|31.100|108.220
Linjiacun, CN|35.994|119.650
Dongta, CN|38.081|106.344
Linghe, CN|36.364|119.077
Lingcheng, CN|33.816|118.114
Beiliu, CN|22.707|110.349
Lingao, CN|19.909|109.687
Linfeng, CN|29.891|107.220
Linfen, CN|36.089|111.519
Lincang, CN|23.880|100.095
Xishan, CN|27.667|113.500
Liji, CN|33.767|117.783
Ligezhuang, CN|36.358|120.143
Lidu, CN|29.739|107.295
Lichuan, CN|30.300|108.850
Licheng, CN|23.295|113.825
Licha, CN|36.057|119.783
Liaolan, CN|36.674|119.875
Liaocheng, CN|36.451|116.002
Lianzhou, CN|24.782|112.371
Hepu, CN|21.659|109.200
Anning, CN|24.923|102.485
Wuwei, CN|37.927|102.632
Liangzhai, CN|34.500|116.750
Liangxiang, CN|39.736|116.133
Liangshui, CN|33.432|104.809
Jiangbei, CN|29.728|106.635
Liancheng, CN|25.718|116.749
Lianjiang, CN|21.647|110.282
Leshan, CN|29.562|103.764
Lengshuitan, CN|26.411|111.596
Lengshuijiang, CN|27.688|111.429
Leiyang, CN|26.402|112.859
Lecheng, CN|25.128|113.350
Laohekou, CN|32.386|111.668
Lanzhou, CN|36.057|103.840
Lanxi, CN|29.216|119.472
Lianyuan, CN|27.688|111.664
Langfang, CN|39.521|116.715
Langao Chengguanzhen, CN|32.300|108.893
Laizhou, CN|37.181|119.942
Laiyang, CN|36.976|120.714
Laiwu, CN|36.193|117.657
Laisu, CN|29.266|105.778
Laibin, CN|23.747|109.222
Labuleng, CN|35.201|102.521
Kunyang, CN|27.666|120.566
Kunming, CN|25.039|102.718
Kuangshi, CN|38.072|114.046
Kongtan, CN|29.144|104.675
Kaiyuan, CN|23.698|103.304
Kaili, CN|26.586|107.980
Kaihua, CN|23.369|104.277
Kaifeng, CN|34.799|114.307
Juye, CN|35.387|116.072
Junlian, CN|28.171|104.512
Juexi, CN|28.924|104.262
Juegang, CN|32.317|121.186
Liulin, CN|34.590|103.504
Jiyuan, CN|35.089|112.588
Jizhou, CN|37.551|115.569
Jiuxian, CN|29.862|106.203
Jiushan, CN|36.196|118.465
Xixiang, CN|22.593|113.889
Jiujiang, CN|29.705|116.002
Jiudian, CN|36.992|120.204
Jishui, CN|33.733|115.400
Jishou, CN|28.319|109.733
Jinzhou, CN|39.100|121.717
Jinxiang, CN|27.433|120.606
Jinshi, CN|29.605|111.870
Jinsha, CN|32.090|121.074
Jinqiao, CN|31.271|121.593
Jinjiang, CN|28.401|116.900
Jinjiang, CN|19.738|110.009
Jinji, CN|23.228|110.826
Jining, CN|35.405|116.581
Jinhua, CN|29.107|119.644
Jingzhou, CN|30.350|112.190
Jingzhi, CN|36.310|119.388
Tianchang, CN|37.998|114.016
Jingui, CN|38.500|106.417
Jingmen, CN|31.034|112.205
Jingling, CN|30.650|113.100
Jingguan, CN|29.895|106.564
Jingdezhen, CN|29.295|117.208
Jingan, CN|31.220|121.416
Jingan, CN|22.211|113.292
Jinchang, CN|38.501|102.194
Jincheng, CN|35.502|112.833
Jinan, CN|36.668|116.997
Jimo, CN|36.390|120.462
Jijiang, CN|29.290|106.250
Jiexiu, CN|37.024|111.912
Jieshou, CN|33.263|115.361
Jieshi, CN|22.810|115.831
Jielong, CN|29.249|106.777
Jiehu, CN|35.543|118.455
Jiazi, CN|22.879|116.073
Jiayue, CN|36.024|119.176
Jiaxing, CN|30.752|120.750
Jiawang, CN|34.433|117.442
Jiasi, CN|29.116|106.447
Jiaozuo, CN|35.239|113.239
Jiaoshi, CN|29.716|107.598
Jiaogong, CN|33.565|104.646
Jiaozhou, CN|36.284|120.003
Ningde, CN|26.662|119.523
Jianshan, CN|31.434|108.895
Jianou, CN|27.041|118.319
Jiangzhuang, CN|36.494|119.794
Jiangyan, CN|32.506|120.143
Jianguang, CN|28.194|115.784
Jiangshan, CN|36.678|120.529
Jiangping, CN|21.600|108.150
Jiangmen, CN|22.583|113.083
Jiangluo, CN|33.901|105.822
Jiangkou, CN|29.240|107.879
Jiangkou, CN|25.487|119.198
Jiangjia, CN|29.393|106.819
Yangjiang, CN|21.856|111.963
Jiangan, CN|28.733|105.068
Jianchang, CN|27.558|116.640
Jian, CN|27.117|114.979
Guangyuan, CN|32.442|105.823
Qionghai, CN|19.242|110.464
Jiading, CN|31.386|121.245
Jiachuan, CN|32.209|106.215
Huzhou, CN|30.870|120.093
Hutang, CN|31.534|119.490
Cixi, CN|30.176|121.246
Huoqiu Chengguanzhen, CN|32.355|116.294
Huolu, CN|29.394|107.873
Humen, CN|22.819|113.673
Huizhou, CN|23.111|114.415
Huixian Chengguanzhen, CN|33.768|106.081
Huilong, CN|31.811|121.655
Huicheng, CN|29.869|118.434
Huicheng, CN|23.038|116.290
Huguo, CN|28.586|105.367
Hufeng, CN|29.715|106.111
Huazhou, CN|21.633|110.583
Huayin, CN|34.565|110.066
Huashan, CN|34.630|116.736
Huankou, CN|34.870|116.670
Huangzhou, CN|30.450|114.800
Huangshi, CN|30.247|115.048
Huangshan, CN|26.826|100.219
Dasha, CN|23.110|113.442
Huangpi, CN|30.885|114.378
Huangmei, CN|30.192|116.025
Huangji, CN|34.433|116.983
Huanghua, CN|35.889|119.458
Huanggang, CN|23.677|117.000
Daxing, CN|39.740|116.327
Huangchuan, CN|32.139|115.043
Xingyi, CN|25.096|104.906
Huaiyuan Chengguanzhen, CN|32.959|117.166
Huainan, CN|32.626|116.997
Huaicheng, CN|23.920|112.176
Huaihua, CN|27.563|110.004
Huaidian, CN|33.433|115.033
Huaibei, CN|33.974|116.792
Huacheng, CN|24.067|115.613
Houzhen, CN|36.991|118.966
Hongzhou, CN|26.126|109.409
Honglu, CN|29.352|105.727
Hongkou, CN|31.250|121.489
Donghe, CN|32.233|106.301
Hongjiang, CN|27.110|109.996
Honghe, CN|36.403|118.918
Hongan, CN|28.502|109.267
Hezuo, CN|34.986|102.909
Heze, CN|35.239|115.474
Hechuan, CN|29.992|106.265
Hetoudian, CN|37.018|120.574
Heshan, CN|28.569|112.347
Hepo, CN|23.431|115.830
Hengyang, CN|26.889|112.619
Hengshui, CN|37.739|115.683
Hengbei, CN|23.880|115.725
Helin, CN|30.581|107.681
Hekou, CN|22.539|104.011
Hejiang, CN|28.812|105.834
Heishui, CN|29.056|108.796
Hefei, CN|31.864|117.281
Hede, CN|33.772|120.262
Hecun, CN|36.533|114.111
Hebian, CN|29.657|106.197
Hebi, CN|35.732|114.286
Heba, CN|33.936|105.216
Haomen, CN|37.376|101.622
Haojiaqiao, CN|38.017|106.283
Hanzhong, CN|33.075|107.022
Hanyuan, CN|34.011|105.292
Hanyin Chengguanzhen, CN|32.891|108.505
Fuan, CN|27.091|119.644
Hanting, CN|36.771|119.211
Hanjia, CN|29.295|108.161
Hangzhou, CN|30.294|120.161
Hangu, CN|39.249|117.789
Hanfeng, CN|31.169|108.403
Changzhi, CN|36.184|113.105
Handan, CN|36.610|114.488
Hanchuan, CN|30.650|113.767
Hancheng, CN|35.460|110.429
Haizhou, CN|34.582|119.129
Haiyang, CN|29.786|118.177
Haitou, CN|19.506|108.951
Jiaojiang, CN|28.698|121.473
Haimen, CN|23.193|116.612
Haikou, CN|24.780|102.575
Haikou, CN|20.034|110.347
Guyuan, CN|36.007|106.281
Guye, CN|39.741|118.451
Guxian, CN|36.734|120.226
Guxi, CN|30.330|105.872
Gupi, CN|34.114|117.883
Guozhen, CN|34.366|107.359
Guofu, CN|28.850|106.601
Gunan, CN|29.023|106.648
Gulin, CN|28.042|105.810
Guli, CN|28.882|120.033
Guiyang, CN|26.583|106.717
Guixi, CN|30.334|107.345
Guiren, CN|33.670|118.189
Guiping, CN|23.395|110.074
Guilin, CN|25.280|110.296
Guigang, CN|23.116|109.595
Gucun, CN|31.349|121.393
Gucheng Chengguanzhen, CN|32.266|111.635
Guanzhuang, CN|36.263|119.194
Guanyin, CN|29.099|104.394
Guanhu, CN|34.425|117.995
Guangzhou, CN|23.117|113.250
Guangtong, CN|25.169|101.749
Guangshun, CN|29.375|105.527
Guangshui, CN|31.620|113.998
Guandu, CN|30.956|109.847
Guandu, CN|30.081|106.429
Gongtan, CN|28.908|108.349
Gongping, CN|31.127|109.197
Gongmen, CN|34.941|106.296
Gongguan, CN|21.800|109.600
Gelan, CN|30.036|107.116
Gejiu, CN|23.361|103.154
Gecheng, CN|31.949|108.661
Gaozuo, CN|33.903|118.040
Gaozhou, CN|21.920|110.857
Gaoyou, CN|32.789|119.442
Gaoping, CN|30.776|106.103
Gaomi, CN|36.383|119.753
Gaoliu, CN|36.800|118.500
Gaoliu, CN|34.317|118.517
Gaojia, CN|30.020|107.860
Gaogu, CN|29.396|108.066
Gaogou, CN|34.017|119.189
Gaoan, CN|30.290|107.462
Ganzhou, CN|25.847|114.933
Gantang, CN|27.438|111.973
Gantang, CN|26.716|109.769
Ganshui, CN|28.742|106.711
Gangu Chengguanzhen, CN|34.736|105.326
Gangtou, CN|34.317|118.207
Fuzhou, CN|27.960|116.333
Fuzhou, CN|26.061|119.306
Fujia, CN|33.819|105.954
Fuyong, CN|22.672|113.815
Fuyang, CN|32.900|115.817
Fuyang, CN|30.053|119.952
Wofo, CN|29.908|105.787
Qingyang, CN|37.496|121.258
Fulu, CN|30.654|107.968
Fuling, CN|29.710|107.394
Fuji, CN|29.148|105.374
Foshan, CN|23.027|113.131
Fenyi, CN|27.811|114.668
Fenshui, CN|30.720|108.083
Fengyi, CN|25.584|100.312
Fengcheng, CN|34.704|116.587
Fengrun, CN|39.827|118.138
Fengkou, CN|30.083|113.333
Fengjia, CN|29.393|108.785
Fenggao, CN|29.427|105.675
Fenggang, CN|27.546|116.215
Feicheng, CN|35.261|117.968
Fangshan, CN|39.687|115.997
Fangcun, CN|34.086|117.474
Fangcheng, CN|33.257|113.001
Ezhou, CN|30.400|114.833
Enshi, CN|30.300|109.483
Encheng, CN|22.187|112.304
Eman, CN|19.857|109.263
Ehen Hudag, CN|39.211|101.669
Duzhou, CN|29.878|107.078
Duyun, CN|26.267|107.517
Dushi, CN|29.150|106.533
Dushan, CN|25.833|107.533
Duobao, CN|30.670|112.690
Dunhou, CN|27.050|114.900
Ducheng, CN|23.242|111.528
Duoba, CN|36.658|101.534
Xinyi, CN|22.373|110.947
Dongying, CN|37.463|118.492
Dongxing, CN|21.550|107.967
Dongxi, CN|28.761|106.661
Dongtai, CN|32.852|120.309
Dongsheng, CN|39.816|109.978
Dongkan, CN|34.000|119.831
Donghai, CN|22.946|115.642
Dongguan, CN|23.018|113.749
Dongdu, CN|35.850|117.700
Dongcun, CN|36.777|121.160
Dongchuan, CN|37.368|101.836
Xinle, CN|38.349|114.685
Dingzhou, CN|38.515|114.987
Dingxi, CN|35.571|104.623
Dingtao, CN|35.074|115.566
Dingshi, CN|28.775|108.546
Dingjia, CN|29.409|106.142
Dezhou, CN|37.447|116.367
Deyang, CN|31.130|104.382
Deqing, CN|30.545|119.960
Dengzhou, CN|37.808|120.759
Dengzhou, CN|32.683|112.089
Songyang, CN|34.455|113.032
Degan, CN|29.278|106.232
Liping, CN|26.231|109.131
Dazhong, CN|33.200|120.458
Zhangjiajie, CN|29.129|110.478
Daye, CN|30.083|114.950
Lijiang, CN|26.869|100.221
Daxing, CN|27.264|100.864
Daxie, CN|30.073|108.110
Dazhou, CN|31.211|107.463
Dawukou, CN|39.042|106.396
Datun, CN|34.809|116.902
Datong, CN|32.621|117.063
Dashun, CN|29.570|107.045
Dashan, CN|23.002|100.115
Fenghua, CN|29.656|121.406
Daotian, CN|36.834|118.898
Daokou, CN|35.569|114.516
Danshui, CN|22.798|114.467
Danjiangkou, CN|32.543|111.509
Gushu, CN|31.561|118.481
Dangjiang, CN|21.650|109.117
Tanchang Chengguanzhen, CN|34.045|104.395
Dancheng, CN|33.644|115.182
Damiao, CN|34.264|117.364
Dalu, CN|29.730|106.218
Daliang, CN|22.841|113.250
Dalian, CN|38.912|121.602
Dali, CN|25.585|100.212
Dajin, CN|31.510|108.446
Dahuangshan, CN|34.293|117.344
Daguan, CN|29.255|106.977
Dafengdong, CN|26.712|107.811
Dachang, CN|31.309|121.415
Dachang, CN|31.269|109.802
Shuren, CN|29.987|107.739
Daan, CN|29.383|106.015
Cuijiaji, CN|36.625|119.713
Cizhu, CN|29.985|106.740
Chuzhou, CN|32.322|118.298
Chuxiong, CN|25.036|101.546
Yangchun, CN|22.167|111.783
Yiwu, CN|29.315|120.077
Chongxing, CN|38.033|106.300
Chongqing, CN|29.560|106.558
Chengqiao, CN|31.631|121.393
Chonglong, CN|29.781|104.852
Chongkan, CN|30.156|105.612
Chongfu, CN|30.531|120.431
Chizhou, CN|30.661|117.478
Chenzhou, CN|25.800|113.033
Chengyang, CN|35.579|118.833
Chengxian Chengguanzhen, CN|33.748|105.733
Chengxi, CN|30.209|107.259
Chengjiang, CN|29.872|106.385
Jiangyin, CN|31.911|120.263
Chenggu, CN|33.149|107.326
Chengdu, CN|30.667|104.067
Chenghua, CN|23.461|116.770
Chefushan, CN|34.475|117.751
Chaozhou, CN|23.654|116.623
Chaotian, CN|32.645|105.885
Chaohu, CN|31.600|117.867
Changzhou, CN|31.774|119.954
Changzhi, CN|35.209|111.739
Changyuan, CN|29.405|105.588
Changyi, CN|36.854|119.391
Changxin, CN|38.675|106.330
Changsha, CN|28.199|112.971
Changqing, CN|36.557|116.727
Changning, CN|31.217|121.421
Changning, CN|28.578|104.921
Changli, CN|39.706|119.160
Changleng, CN|28.700|115.817
Changle, CN|36.706|118.828
Changle, CN|21.833|109.417
Changdian, CN|34.776|116.583
Changcheng, CN|36.091|119.452
Changba, CN|29.335|107.475
Chaigou, CN|36.249|119.624
Chahe, CN|34.533|117.883
Longxing, CN|30.251|105.909
Caoqiao, CN|34.340|118.110
Caohe, CN|30.230|115.433
Weining, CN|26.850|104.233
Cangzhou, CN|38.311|116.853
Caijia, CN|28.909|106.340
Caidian, CN|30.583|114.033
Buhe, CN|30.288|112.230
Bozhou, CN|33.877|115.770
Botou, CN|38.074|116.567
Boshan, CN|36.483|117.833
Baise, CN|23.890|106.627
Biyang, CN|29.929|117.946
Bishan, CN|29.595|106.225
Binzhou, CN|37.367|118.017
Bikou, CN|32.746|105.241
Bijie, CN|27.302|105.286
Bianzhuang, CN|34.849|118.045
Biantang, CN|34.423|117.645
Bengbu, CN|32.941|117.361
Beiwangli, CN|38.621|115.396
Beisu, CN|38.155|114.807
Beimeng, CN|36.604|119.496
Beijing, CN|39.907|116.397
Beihai, CN|21.483|109.115
Beidao, CN|34.569|105.893
Beibei, CN|29.827|106.436
Bayiji, CN|34.267|117.683
Bayan Hot, CN|38.839|105.669
Baiyang, CN|30.816|108.611
Shuanglong, CN|31.195|109.881
Batang, CN|29.835|106.293
Basuo, CN|19.103|108.666
Bashan, CN|27.768|116.050
Barkam, CN|31.901|102.221
Baoying, CN|33.229|119.309
Baocheng, CN|18.640|109.699
Baoshan, CN|31.408|121.490
Shaoyang, CN|27.238|111.462
Langzhong, CN|31.550|105.994
Baoluan, CN|29.764|107.678
Baojia, CN|29.439|108.313
Baoding, CN|38.873|115.462
Banqiao, CN|29.513|105.953
Balu, CN|34.189|117.913
Baizi, CN|30.094|105.713
Baiyin, CN|36.547|104.170
Baixi, CN|28.700|104.549
Baituo, CN|34.851|106.002
Baitu, CN|30.597|108.811
Baitao, CN|29.551|107.487
Baisha, CN|29.062|106.119
Baisha, CN|21.717|109.683
Baimajing, CN|19.712|109.218
Baima, CN|29.396|107.539
Bailin, CN|28.736|106.460
Baihua, CN|29.094|104.609
Baihecun, CN|22.113|107.236
Shangyu, CN|30.016|120.871
Baichihe, CN|36.116|119.533
Bachuan, CN|29.849|106.050
Babu, CN|24.417|111.517
Qilian, CN|38.181|100.240
Aoxi, CN|27.426|115.836
Qingyang, CN|29.527|107.201
Anyuan, CN|34.881|105.276
Shenliu, CN|29.414|112.164
Anwen, CN|29.060|120.438
Anshun, CN|26.250|105.933
Anqiu, CN|36.434|119.192
Anqing, CN|30.514|117.047
Anping, CN|30.964|109.345
Mabai, CN|23.013|104.451
Anlu, CN|31.258|113.678
Anlong, CN|25.100|105.517
Anliu, CN|23.698|115.680
Anju, CN|29.991|106.032
Anjiang, CN|27.319|110.103
Anhua, CN|33.505|105.048
Anfu, CN|29.359|105.467
Naxi, CN|28.774|105.365
Anbu, CN|23.449|116.681
Ahu, CN|34.377|118.603
Zhonghe, CN|19.743|109.345
Jiangyou, CN|31.767|104.717
Suzhou, CN|31.304|120.595
Zhoushan, CN|29.989|122.205
Dacheng, CN|19.509|109.393
Wuduan, CN|34.574|117.095
Guanshan, CN|33.798|117.866
Mudu, CN|31.256|120.519
Songling, CN|31.193|120.718
Luefeng, CN|29.858|105.973
Xinsheng, CN|29.957|105.751
Yongxi, CN|29.739|105.979
Pulue, CN|29.818|106.159
Caijiagang, CN|29.742|106.475
Tieshan, CN|29.689|105.501
Hebao, CN|29.566|105.543
Baoxing, CN|29.622|105.693
Damiao, CN|29.644|106.070
Daxing, CN|29.556|106.160
Jinlong, CN|29.514|106.061
Sanjiao, CN|29.488|105.868
Guangpu, CN|29.336|106.145
Chenshi, CN|29.314|105.993
Qingfeng, CN|29.339|105.827
Wutan, CN|29.257|106.063
Wujian, CN|29.182|105.834
Hegeng, CN|29.137|105.870
Xianlong, CN|29.151|105.784
Jian, CN|29.159|105.747
Kaitang, CN|26.720|108.130
Bibo, CN|26.531|107.631
Jiuchao, CN|26.091|108.765
Zhaoxing, CN|25.911|109.176
Anfu, CN|34.973|105.630
Baijiawan, CN|34.696|105.289
Baliwan, CN|34.848|105.370
Dashi, CN|34.898|105.186
Dazhuang, CN|34.959|105.336
Guochuan, CN|34.684|105.810
Jinshan, CN|34.811|105.434
Jutou, CN|34.821|105.034
Kuanchuan, CN|34.166|105.541
Liuping, CN|34.891|105.719
Qianhu, CN|34.805|105.578
Shiqiao, CN|34.154|105.130
Suhe, CN|34.062|105.222
Wangyao, CN|34.885|105.542
Wangyin, CN|34.834|105.762
Wenquan, CN|34.652|105.054
Xingfeng, CN|34.861|105.838
Xinglong, CN|34.038|105.344
Xinxing, CN|34.776|105.322
Yebao, CN|34.937|105.647
Yongping, CN|34.290|105.272
Zhongshan, CN|34.938|105.877
Shima, CN|28.988|105.924
Banan, CN|29.379|106.540
Nanhai, CN|23.022|113.143
Dianbu, CN|36.702|120.351
Yunshan, CN|36.824|120.226
Nantou, CN|22.722|113.293
Tanzhou, CN|22.255|113.467
Shahe, CN|22.552|113.979
Xiasi, CN|32.290|105.513
Conglin, CN|29.030|106.970
Ciyun, CN|29.075|106.206
Xiaba, CN|29.117|106.510
Anlan, CN|29.247|106.594
Shilong, CN|29.282|106.898
Nanpeng, CN|29.335|106.652
Huimin, CN|29.462|106.705
Ersheng, CN|29.466|106.771
Yufengshan, CN|29.720|106.723
Tongjiaxi, CN|29.685|106.444
Dasheng, CN|29.890|106.897
Taiping, CN|29.904|106.039
Tuchang, CN|29.925|106.491
Honghu, CN|30.000|106.952
Lanyang, CN|19.461|109.660
Guangcun, CN|19.642|109.355
Sandu, CN|19.789|109.215
Mutang, CN|19.808|109.345
Dongcheng, CN|19.709|109.456
Heqing, CN|19.528|109.633
Wuzhishan, CN|18.782|109.501
Shijie, CN|23.095|113.792
Lianghu, CN|29.992|120.898
Zhoucheng, CN|35.912|116.312
Dalianwan, CN|39.029|121.695
Xiaochangshan, CN|39.236|122.724
Wuyishan, CN|27.760|118.031
Leifeng, CN|28.200|112.846
Yueyang, CN|29.375|113.095
Bojia, CN|26.467|111.968
Santangpu, CN|27.406|111.987
Zhaojia, CN|31.081|108.412
Gulu, CN|31.330|109.440
Zouma, CN|30.570|108.438
Yantai, CN|30.147|107.320
Sanmiao, CN|30.238|106.127
Rongxi, CN|28.525|108.880
Longsheng, CN|29.081|106.816
Lixi, CN|28.531|108.611
Hedong, CN|23.920|115.780
Zhenlai, CN|45.850|123.198
Shuangliao, CN|43.511|123.501
Zhaozhou, CN|45.706|125.266
Zhaoyuan, CN|45.520|125.076
Zhaodong, CN|46.052|125.955
Zhangjiakou, CN|40.783|114.871
Zhalantun, CN|48.009|122.737
Yushu, CN|44.828|126.541
Youhao, CN|47.853|128.836
Yingkou, CN|40.665|122.232
Yilan, CN|46.322|129.561
Yichun, CN|47.721|128.875
Yebaishou, CN|41.398|119.641
Yantongshan, CN|43.292|126.009
Yanji, CN|42.888|129.502
Yakeshi, CN|49.283|120.733
Xuanhua, CN|40.612|115.065
Xiuyan, CN|40.293|123.274
Xinqing, CN|48.287|129.523
Xinmin, CN|41.991|122.825
Xinlin, CN|51.667|124.400
Xinglongshan, CN|43.956|125.466
Xingcheng, CN|40.617|120.717
Xilin Hot, CN|43.967|116.033
Xifeng, CN|42.737|124.722
Xiaoshi, CN|41.297|124.121
Wudan, CN|42.934|119.024
Wuchang, CN|44.928|127.160
Wangqing, CN|43.311|129.763
Hepingjie, CN|42.060|126.916
Wangkui, CN|46.832|126.477
Ulanhot, CN|46.083|122.083
Tuqiang, CN|52.900|122.767
Tumen, CN|42.966|129.842
Tongliao, CN|43.612|122.265
Tonghua, CN|41.720|125.926
Tieling, CN|42.293|123.841
Tieli, CN|46.975|128.048
Taonan, CN|45.333|122.785
Tailai, CN|46.390|123.408
Dorbod, CN|46.861|124.442
Tahe, CN|52.321|124.698
Sujiatun, CN|41.659|123.339
Suiling, CN|47.235|127.108
Suihua, CN|46.648|126.967
Suifenhe, CN|44.400|131.148
Songjianghe, CN|42.186|127.479
Siping, CN|43.161|124.378
Shunyi, CN|40.122|116.648
Shulan, CN|44.411|126.948
Shuangyashan, CN|46.677|131.133
Shuangyang, CN|43.523|125.659
Shuangcheng, CN|45.380|126.307
Shiguai, CN|40.706|110.286
Shenyang, CN|41.792|123.433
Shanhecun, CN|45.711|128.580
Shanhaiguan, CN|40.001|119.754
Shangzhi, CN|45.206|128.002
Sanchazi, CN|42.082|126.600
Salaqi, CN|40.541|110.511
Fendou, CN|46.641|124.863
Qitaihe, CN|45.768|130.995
Qiqihar, CN|47.339|123.962
Qinggang, CN|46.698|126.092
Songyuan, CN|45.129|124.828
Pingzhuang, CN|42.037|119.289
Panshi, CN|42.937|126.057
Panshan, CN|41.188|122.049
Nianzishan, CN|47.513|122.888
Nenjiang, CN|49.174|125.220
Nehe, CN|48.479|124.870
Nantai, CN|40.924|122.804
Nanpiao, CN|41.098|120.748
Lianhe, CN|47.133|129.274
Mujiayingzi, CN|42.117|118.783
Mudanjiang, CN|44.548|129.626
Mishan, CN|45.550|131.883
Antu, CN|43.102|128.908
Mingshui, CN|47.179|125.903
Meihekou, CN|42.529|125.679
Manzhouli, CN|49.600|117.433
Longjing, CN|42.771|129.423
Longjiang, CN|47.336|123.196
Longfeng, CN|46.532|125.104
Liuhe, CN|42.285|125.745
Lishu, CN|43.307|124.334
Linxi, CN|43.517|118.033
Linkou, CN|45.276|130.273
Linjiang, CN|41.807|126.908
Lingyuan, CN|41.240|119.401
Lingdong, CN|46.554|131.145
Liaozhong, CN|41.506|122.724
Longshan, CN|42.885|125.137
Liaoyang, CN|41.272|123.173
Lanxi, CN|46.258|126.281
Langxiang, CN|46.950|128.868
Langtoucun, CN|40.041|124.335
Eerguna, CN|50.224|120.171
Kuandian, CN|40.729|124.785
Kaiyuan, CN|42.533|124.040
Kaitong, CN|44.809|123.081
Jixi, CN|45.293|130.962
Jiutai, CN|44.151|125.830
Jiupu, CN|41.067|122.950
Jishu, CN|44.317|126.800
Jinzhou, CN|41.108|121.142
Lianshan, CN|40.764|120.853
Jining, CN|41.028|113.106
Jilin, CN|43.847|126.561
Jidong, CN|45.256|131.116
Jiaohe, CN|43.721|127.335
Jian, CN|41.128|126.195
Jiamusi, CN|46.797|130.311
Jalai Nur, CN|49.450|117.700
Jiagedaqi, CN|50.417|124.117
Hushitai, CN|41.942|123.503
Hunchun, CN|42.867|130.357
Huludao, CN|40.752|120.836
Hulan Ergi, CN|47.204|123.633
Hulan, CN|45.893|126.578
Huinan, CN|42.623|126.261
Huanren, CN|41.265|125.367
Huangnihe, CN|43.558|128.024
Huanan, CN|46.236|130.546
Huadian, CN|42.972|126.741
Honggang, CN|46.397|124.884
Hohhot, CN|40.811|111.652
Hengshan, CN|45.208|130.898
Helong, CN|42.540|128.997
Heishan, CN|41.689|122.113
Heihe, CN|50.244|127.490
Hegang, CN|47.347|130.290
Harbin, CN|45.750|126.650
Hailun, CN|47.447|126.925
Hailin, CN|44.571|129.385
Hailar, CN|49.200|119.700
Haicheng, CN|40.852|122.748
Beining, CN|41.596|121.793
Gongzhuling, CN|43.501|124.820
Gongchangling, CN|41.117|123.450
Genhe, CN|50.783|121.517
Gannan, CN|47.920|123.500
Fuyuan, CN|48.363|134.298
Fuyu, CN|47.795|124.458
Fuyu, CN|45.183|124.817
Fuxin, CN|42.016|121.659
Fushun, CN|41.887|123.944
Jixian, CN|46.726|131.133
Fujin, CN|47.247|132.030
Beichengqu, CN|40.439|113.154
Luobei, CN|47.576|130.813
Fengcheng, CN|40.454|124.072
Fate, CN|44.483|126.500
Erenhot, CN|43.648|111.977
Erdaojiang, CN|41.776|126.032
Dunhua, CN|43.370|128.229
Dongning, CN|44.084|131.118
Dongling, CN|41.814|123.576
Donghe, CN|40.566|110.020
Dongfeng, CN|42.674|125.529
Didao, CN|45.347|130.837
Dehui, CN|44.537|125.694
Datong, CN|40.094|113.291
Dashitou, CN|43.307|128.511
Dashiqiao, CN|40.637|122.503
Daqing, CN|46.583|125.000
Dandong, CN|40.129|124.395
Linghai, CN|41.165|121.367
Dalain Hob, CN|41.965|101.064
Dalai, CN|45.500|124.300
Chifeng, CN|42.268|118.964
Chengzihe, CN|45.336|131.005
Chengde, CN|40.952|117.959
Chaoyang, CN|42.662|126.026
Chaoyang, CN|41.570|120.459
Changtu, CN|42.779|124.095
Changping, CN|40.216|116.235
Changling, CN|44.273|123.976
Changchun, CN|43.880|125.323
Changbai, CN|41.418|128.196
Chaihe, CN|44.760|129.678
Boli, CN|45.753|130.585
Bin Xian, CN|45.743|127.461
Benxi, CN|41.289|123.765
Beipiao, CN|41.792|120.779
Beian, CN|48.267|126.600
Bayan, CN|46.076|127.394
Baotou, CN|40.652|109.844
Baoshan, CN|46.575|131.393
Baoqing, CN|46.325|132.190
Muling, CN|44.916|130.517
Baishishan, CN|43.583|127.567
Baiquan, CN|47.607|126.082
Baicheng, CN|45.618|122.833
Baishan, CN|41.939|126.420
Anshan, CN|41.124|122.990
Anda, CN|46.449|125.302
Oroqen Zizhiqi, CN|50.567|123.717
Aihui, CN|49.979|127.481
Acheng, CN|45.546|126.952
Songlingcun, CN|40.294|118.271
Hondlon, CN|40.648|109.794
Qingshan, CN|40.663|109.882
Shigang, CN|31.136|109.364
Doilungdeqen, CN|29.655|90.992
Ezhou, CN|30.396|114.887
Jinniu, CN|25.801|100.574
Shuifu, CN|28.632|104.408
Shilin, CN|24.819|103.332
Bowangshan, CN|28.308|105.052
Shuanglong, CN|28.452|104.345
Panzhihua, CN|26.585|101.713
Xilinji, CN|52.991|123.235
Maozhou, CN|22.764|113.813
Gongheyong, CN|22.759|113.795
Tantou, CN|22.751|113.835
Sanjianzai, CN|22.729|113.776
Houhai, CN|22.512|113.925
Taifu, CN|28.982|105.637
Zhongshan, CN|22.523|113.379
Gangxia, CN|22.540|114.061
Tongchuan, CN|34.899|108.951
Changshu, CN|31.646|120.742
Shixing, CN|24.948|114.066
Jiashan, CN|30.849|120.926
Fenghuang, CN|27.936|109.600
Baiguan, CN|33.966|104.914
Zhongba, CN|34.035|105.033
Dengbu, CN|28.208|116.817
Baihe, CN|33.870|104.852
Puchi, CN|33.535|104.814
Maying, CN|33.596|104.846
Hanwang, CN|33.343|105.010
Majie, CN|33.459|104.958
Dianga, CN|34.064|103.214
Dongjiang, CN|33.379|104.951
Chengjiao, CN|33.385|104.920
Wuying, CN|35.015|105.899
Lianhua, CN|35.062|105.791
Weidian, CN|35.102|105.566
Shibao, CN|34.108|105.316
Luotang, CN|33.068|105.265
Yulong, CN|33.510|105.181
Paosha, CN|33.724|105.676
Xigaoshan, CN|33.735|105.388
Luoyu, CN|33.841|105.231
Shili, CN|33.952|105.292
Jiangxi, CN|33.999|105.200
Luhe, CN|34.009|105.340
Xiyu, CN|34.052|105.304
Shaoyu, CN|34.064|105.365
Hadapu Zhen, CN|34.231|104.223
Lichuan Zhen, CN|34.248|104.319
Tange, CN|34.628|104.841
Mali, CN|34.665|104.698
Shandan, CN|34.751|104.831
Gaolou, CN|34.761|104.677
Yuanyang, CN|34.788|104.775
Hualin, CN|34.826|104.752
Hezhou, CN|24.404|111.567
Zhu Cheng City, CN|35.995|119.403
Xingqiao, CN|30.399|120.252
Gaojing, CN|31.322|121.475
Changzheng, CN|31.239|121.368
Xiayang, CN|31.150|121.116
Shangri-La, CN|27.825|99.708
Maqin County, CN|34.474|100.245
Wenquan, CN|47.176|119.948
Tongyangdao, CN|41.770|109.970
Xilinhot, CN|43.939|116.070
Lhoka, CN|29.243|91.772
Huajing, CN|31.122|121.449
Huangpu, CN|31.238|121.478
Xili, CN|22.588|113.948
Ulanqab, CN|40.993|113.133
Ordos, CN|39.609|109.782
Daocheng, CN|29.038|100.297
Chengxiang, CN|31.398|109.571
Tangfang, CN|31.393|109.309
Fengling, CN|31.319|109.555
Longjing, CN|31.089|109.887
Baolong, CN|30.942|110.006
Tonggu, CN|30.934|109.731
Sanxi, CN|31.132|110.094
Liangping, CN|31.121|109.969
Longxi, CN|31.302|109.636
Futian, CN|31.222|109.711
Dashu, CN|31.211|109.322
Kangle, CN|31.113|109.430
Fenhe, CN|31.137|109.522
Baidi, CN|31.058|109.591
Caotang, CN|31.090|109.624
Yongle, CN|31.010|109.505
Jiagao, CN|30.889|109.176
Qinglong, CN|30.780|109.256
Wuma, CN|30.854|109.376
Fengping, CN|30.835|109.505
Qinglian, CN|31.191|109.237
Heqian, CN|31.415|108.470
Maliu, CN|31.434|108.245
Heyan, CN|31.356|108.670
Guojia, CN|31.295|108.481
Baihe, CN|31.263|108.464
Dunhao, CN|31.333|108.358
Gaoqiao, CN|31.369|108.242
Yihe, CN|31.157|108.083
Jiulongshan, CN|31.194|108.251
Zhenan, CN|31.152|108.317
Dade, CN|31.213|108.340
Fengle, CN|31.190|108.415
Zhendong, CN|31.185|108.395
Houba, CN|31.205|108.506
Changsha, CN|31.000|108.305
Nanmen, CN|30.962|108.243
Wushan, CN|30.937|107.947
Nanya, CN|31.084|108.087
Zhuxi, CN|31.124|108.291
Taizhou, CN|28.663|121.433
Houshan, CN|30.826|108.029
Lihe, CN|30.816|108.262
Xiongjia, CN|30.902|108.434
Tiancheng, CN|30.868|108.370
Zhoujiaba, CN|30.843|108.366
Taibai, CN|30.825|108.358
Gaoliang, CN|30.824|108.302
Zhonggulou, CN|30.825|108.384
Jiuchi, CN|30.798|108.371
Pailou, CN|30.796|108.386
Chenjiaba, CN|30.808|108.408
Baianba, CN|30.763|108.437
Shuanghekou, CN|30.754|108.370
Zhushan, CN|30.733|108.274
Danzi, CN|30.857|108.006
Changtan, CN|30.739|108.600
Taian, CN|30.796|108.659
Luotian, CN|30.516|108.559
Guocun, CN|30.566|108.169
Longsha, CN|30.640|108.237
Ganning, CN|30.669|108.281
Gaofeng, CN|30.713|108.342
Linxi, CN|30.406|108.350
Xialu, CN|29.942|108.084
Baishi Zhen, CN|30.317|107.882
Caohui, CN|30.397|107.470
Xinmin, CN|30.398|107.389
Changlong, CN|30.306|107.413
Yongan, CN|30.353|107.513
Pushun, CN|30.472|107.603
Gangjia, CN|30.221|107.504
Gaofeng, CN|30.220|107.408
Pingshan, CN|30.097|107.424
Baijia, CN|30.017|107.326
Panlong, CN|30.635|107.850
Yinping, CN|30.542|107.575
Jukui, CN|30.636|107.596
Bishan, CN|30.771|107.457
Huilong, CN|30.530|107.481
Mingda, CN|30.726|107.657
Lirang, CN|30.685|107.631
Hucheng, CN|30.815|107.542
Xinsheng, CN|30.844|107.724
Hexing, CN|30.745|107.820
Baohe, CN|30.061|107.702
Dongjia, CN|30.224|107.706
Shizhi, CN|30.053|107.794
Huwei, CN|29.906|107.639
Sanhe, CN|29.869|107.730
Xingyi, CN|29.956|107.816
Longkong, CN|30.045|107.915
Longhe, CN|29.840|107.985
Qingxichang, CN|28.404|108.904
Pingkai, CN|28.426|108.996
Zhongling, CN|28.297|108.958
Erong, CN|28.571|109.288
Guanzhuang, CN|28.508|109.011
Wanmu, CN|28.633|108.500
Tonggu, CN|28.782|108.683
Apengjiang, CN|29.152|108.743
Qianjiang, CN|29.533|108.775
Zhoubai, CN|29.529|108.823
Dianshui, CN|29.283|108.089
Sanhe, CN|30.037|108.182
Xintian, CN|29.196|108.270
Longshe, CN|29.531|108.211
Lianhu, CN|29.698|108.435
Tongle, CN|29.461|107.197
Zengfu, CN|29.511|106.986
Longqiao, CN|29.710|107.294
Lizhi, CN|29.703|107.395
Nantuo, CN|29.855|107.528
Qingxi, CN|29.797|107.458
Baisheng, CN|29.814|107.393
Yihe, CN|29.737|107.219
Yunji, CN|29.919|107.340
Changshouhu, CN|29.905|107.238
Haitang, CN|30.172|107.230
Shiyan, CN|30.083|107.172
Longhe, CN|30.018|107.180
Fengcheng, CN|29.826|107.060
Jiangnan, CN|29.793|107.037
Bake, CN|29.901|107.023
Dawan, CN|30.020|106.820
Gulu, CN|29.839|106.743
Lijia, CN|29.679|106.493
Shuangfengqiao, CN|29.719|106.627
Huixing, CN|29.684|106.615
Cuiyun, CN|29.688|106.589
Wangjia, CN|29.767|106.698
Tianfu, CN|29.874|106.498
Fuxing, CN|29.819|106.557
Dongyang, CN|29.833|106.451
Longfeng, CN|29.815|106.429
Shuanghuai, CN|30.184|106.556
Shuangfeng, CN|30.023|106.430
Shitan, CN|30.069|106.503
Xiaojia, CN|30.288|106.470
Laitan, CN|30.176|106.486
Qiantang, CN|30.184|106.317
Dashi, CN|30.094|106.222
Gulou, CN|30.176|106.172
Yanwo, CN|30.332|106.074
Erlang, CN|30.363|105.992
Longfeng, CN|30.268|106.023
Longxing, CN|30.192|106.059
Yangcheng, CN|30.000|106.256
Diaoyucheng, CN|29.999|106.266
Nanjin, CN|29.985|106.265
Baoding, CN|29.749|105.758
Zhifeng, CN|29.654|105.784
Shiwan, CN|29.615|105.895
Yulong, CN|29.546|105.810
Shuanglu, CN|29.485|105.763
Tangxiang, CN|29.702|105.724
Guchang, CN|29.487|105.589
Shenglilu, CN|29.350|105.877
Nandajie, CN|29.338|105.892
Shaoyun, CN|29.985|105.984
Qinggang, CN|29.468|106.236
Jianlong, CN|29.359|106.185
Shuangfu, CN|29.414|106.270
Zhiping, CN|29.258|106.359
Wenshan City, CN|23.363|104.250
Tuanbao, CN|30.337|109.135
Bole, CN|44.893|82.070
Liupanshui, CN|26.594|104.833
Huanggang, CN|30.451|114.870
Nanchuan, CN|29.152|107.103
Anwen, CN|28.680|106.757
Datong, CN|28.596|106.667
Guanba, CN|28.802|106.806
Nantong, CN|28.944|106.882
Maliuzui, CN|29.693|106.944
Guolemude, CN|36.429|94.825
Anxiang, CN|38.383|114.540
Mugala, CN|36.855|81.664
Xingning, CN|24.148|115.723
Lingquan, CN|49.405|117.677
Damoujia, CN|36.544|119.813
Bageqi, CN|37.141|79.835
Tawakule, CN|37.759|80.217
Hanairike, CN|37.542|80.117
Yingawati, CN|37.299|79.830
Rizhao, CN|35.414|119.529
Shanwang, CN|36.545|118.711
Puyang, CN|35.756|115.044
Taxkowruek, CN|43.893|81.306
Onyar, CN|43.850|81.783
Mengman, CN|22.322|100.888
Fudong, CN|23.123|100.000
Jianshui, CN|24.277|101.224
Tuantian, CN|24.711|98.653
Zhonghe, CN|25.056|98.400
Liuzhi, CN|26.234|105.426
Taoyuan, CN|26.228|100.560
Wanghong, CN|38.212|106.225
Hongguang Qidui, CN|38.733|106.287
Linhe, CN|38.321|106.368
Sansheng, CN|29.893|106.626
Gongqingcheng, CN|29.249|115.810
Xiping, CN|34.606|105.115
Xuzhou, CN|34.204|117.284
Xichuan, CN|35.031|106.063
Panjin, CN|41.121|122.074
Lianyungang, CN|34.598|119.216
Rugao, CN|32.370|120.576
Jinzhong, CN|37.684|112.755
Baoji, CN|34.368|107.237
Puxi, CN|31.244|121.466
Sino-Singapore Tianjin Eco-city, CN|39.153|117.784
Qipan, CN|34.245|118.221
Huocheng, CN|44.053|80.872
Longnan, CN|33.398|104.917
Bayan Nur, CN|40.741|107.386
Huoshilafu, CN|37.866|76.696
Gulebage, CN|38.413|77.230
Sandaoling Lutiankuang Wuqi Nongchang, CN|43.015|92.883
Siyeke, CN|36.885|81.523
Bazhong, CN|31.869|106.744
Tumxuk, CN|39.870|79.061
Wulong, CN|29.324|107.761
Chongzuo, CN|22.382|107.368
Zhakou, CN|21.707|109.475
Kageleke, CN|37.301|79.601
Fangchenggang, CN|21.769|108.357
Dali Old Town, CN|25.689|100.159
Haidong Zhen, CN|25.710|100.261
Yinqiao Zhen, CN|25.754|100.123
Wanqiao Zhen, CN|25.789|100.123
Yunlong, CN|34.253|117.252
Shuangtang, CN|34.365|118.475
Xindian, CN|34.143|118.335
Xinhe, CN|34.186|117.988
Dapeng, CN|34.284|117.075
Daxu, CN|34.282|117.553
Liguo, CN|34.553|117.333
Jiawang Zhen, CN|34.422|117.468
Dashahe, CN|34.538|116.625
Wanggou, CN|34.671|116.492
Jingan, CN|34.496|116.922
Yingqiu, CN|36.527|118.993
Liushan, CN|36.450|118.760
Yishan, CN|36.221|118.697
Dasheng, CN|36.320|118.855
Huiqu, CN|36.271|119.049
Jinzhongzi, CN|36.335|119.258
Wushan, CN|36.247|118.838
Zheshan, CN|36.149|118.951
Buzhuang, CN|36.912|119.557
Longchi, CN|36.945|119.325
Xiaying, CN|37.042|119.477
Baicheng, CN|36.327|119.779
Jinggou, CN|36.282|119.552
Kanjia, CN|36.372|119.582
Huanglou, CN|36.647|118.606
Yidu, CN|36.771|118.425
Dongxia, CN|36.749|118.583
Heguan, CN|36.890|118.574
Miaozi, CN|36.639|118.231
Mihe, CN|36.621|118.529
Shaozhuang, CN|36.747|118.317
Tanfang, CN|36.700|118.671
Gucheng, CN|36.953|118.762
Hualong, CN|36.946|118.589
Jitai, CN|36.757|118.739
Taitou, CN|37.027|118.634
Yingli, CN|37.065|118.810
Siwei, CN|38.017|114.153
Ligang, CN|38.646|106.430
Lingwu, CN|38.102|106.340
Ningdong, CN|38.161|106.585
Wangyuan, CN|38.384|106.272
Minning, CN|38.249|105.971
Lijun, CN|38.186|106.120
Shizuishan, CN|38.981|106.389
Heshan, CN|35.523|119.510
Xihu, CN|35.449|119.236
Shangchong, CN|26.253|108.658
Sankeshu, CN|26.564|108.066
Hechi, CN|24.693|108.084
Xingdaohu, CN|21.715|109.132
Donghui, CN|22.441|99.800
Fazhanhe, CN|22.334|100.173
Fubang, CN|22.904|99.803
Huimin, CN|22.261|100.083
Mujia, CN|22.991|99.635
Nanling, CN|22.711|99.996
Nuofu, CN|22.220|99.700
Nuozhadu, CN|22.578|100.269
Zhutang, CN|22.715|99.807
Menghuan, CN|24.435|98.584
Fengping, CN|24.397|98.518
Nongzhang, CN|24.616|97.882
Taiping, CN|24.661|97.853
Beihai, CN|25.080|98.577
Hehua, CN|24.970|98.394
Mangbang, CN|24.932|98.670
Mazhan, CN|25.211|98.484
Mingguang, CN|25.493|98.542
Puchuan, CN|24.703|98.570
Wuhe, CN|24.859|98.668
Xinhua, CN|24.753|98.483
Miaojie, CN|25.312|100.280
Yongjian, CN|25.425|100.212
Yousuo, CN|26.025|100.068
Sanchuan, CN|26.750|100.659
Chenghai, CN|26.462|100.679
Shunzhou, CN|26.621|100.554
Jiuhe, CN|26.763|99.992
Xinyingpan, CN|27.168|100.920
Shilongba, CN|26.579|101.363
Hongqiao, CN|27.430|100.797
Wanzhou, CN|30.765|108.396
Zhuyi, CN|31.025|109.386
Yintai, CN|35.115|109.097
Jifeng, CN|33.655|105.658
Changdao, CN|34.205|105.337
Liufeng, CN|34.735|105.386
Xiejiawan, CN|34.812|105.171
Guojia, CN|34.973|105.558
Hongbao, CN|34.752|106.060
Dayang, CN|34.990|106.072
Maguan, CN|35.066|106.033
Muhe, CN|35.023|106.135
Qingyang, CN|35.710|107.645
Quankou, CN|37.352|101.739
Alamaiti, CN|38.582|77.476
Arele, CN|38.380|77.313
Awati, CN|38.608|77.396
Azhatebage, CN|38.659|77.466
Bageawati, CN|38.489|77.540
Baishikante, CN|38.460|77.479
Dunbage, CN|38.857|77.505
Huangdi, CN|38.809|77.449
Kuoshiairike, CN|38.623|77.279
Mixia, CN|38.454|77.249
Paikeqi, CN|38.550|77.208
Tageerqi, CN|38.545|77.257
Tuomuwusitang, CN|38.363|77.232
Wudalike, CN|38.362|77.130
Yigaierqi, CN|38.341|77.469
Yishikuli, CN|38.489|77.201
Bayandai, CN|43.966|81.249
Hudiyuzi, CN|43.926|81.412
Arewusitang, CN|43.798|81.524
Awuliya, CN|43.930|81.693
Daxinganling, CN|52.334|124.712
Samuyuzi, CN|43.719|81.864
Weiwueryuqiwen, CN|43.756|81.861
Arele, CN|36.813|81.667
Jiayi, CN|36.855|81.635
Buzhake, CN|37.066|79.800
Yisilamuawati, CN|37.585|80.184
Akesalayi, CN|37.169|79.690
Jiahanbage, CN|37.197|79.706
Kaersai, CN|37.484|79.596
Kuiya, CN|37.296|79.636
Kuoyiqi, CN|37.355|79.721
Manglai, CN|37.275|79.678
Puqiakeqi, CN|37.317|79.705
Tuohula, CN|37.242|79.693
Tuwaite, CN|37.345|79.768
Wuerqi, CN|37.320|79.559
Yawa, CN|37.412|79.514
Zhawa, CN|37.214|79.629
Dazeshan, CN|36.989|119.922
Dianzi, CN|36.901|119.866
Yanghe, CN|36.138|119.914
Dongwenquan, CN|29.456|106.858
Jieshi, CN|29.390|106.608
Qitang, CN|29.779|106.285
Shuanglonghu, CN|29.716|106.607
Jiaping, CN|28.992|106.348
Xihu, CN|29.100|106.395
Zhongshan, CN|28.855|106.336
Mingshan, CN|29.878|107.699
Caojie, CN|29.998|106.390
Liangping, CN|30.661|107.766
Xinglong, CN|29.169|107.006
Fuhuan, CN|28.834|106.755
Qingnian, CN|28.865|106.838
Shihao, CN|28.541|106.681
Yongcheng, CN|29.021|106.820
Zhuantang, CN|28.896|106.668
Longling County, CN|24.587|98.689
Mianzhu, Deyang, Sichuan, CN|31.338|104.221
Pingwu County, CN|32.407|104.527
Tianjia, CN|30.090|105.857
Changling, CN|30.768|108.484
Weixinghu, CN|29.244|105.880
Zhuhai, CN|29.369|105.883
Hulunbuir, CN|49.211|119.756
Shajing Residential District, CN|22.732|113.812
Shajing Town, CN|22.738|113.808
Baoan, CN|22.552|113.883
Shenzhen City Centre, CN|22.536|114.077
Lequn, CN|22.578|113.874
Baoan Centre, CN|22.580|113.916
Guanlong, CN|22.588|113.944
Shenzhenwan, CN|22.487|113.940
Shawei, CN|22.520|114.034
Zhuzilin, CN|22.538|114.015
Wushipai, CN|22.524|113.910
Luohu District, CN|22.547|114.131
Mengzi, CN|23.368|103.382
Lushui, CN|25.823|98.859
Lueliang, CN|37.519|111.144
Nyingchi, CN|29.649|94.355
Lhuenzhub, CN|29.893|91.262
Chengguan Qu, CN|29.638|91.044
Nossa Senhora de Fatima, CN|22.208|113.548
Santo Antonio, CN|22.202|113.544
Sao Lazaro, CN|22.200|113.549
Sao Lourenco, CN|22.189|113.535
Yumen, CN|40.291|97.045
Huyanghe, CN|44.698|84.834
Tianducheng, CN|30.389|120.243
Jinshan, CN|30.836|121.294
Fengxiang, CN|30.858|121.468
Chongming, CN|31.619|121.696
Panlongcheng Jingji Kaifaqu, CN|30.693|114.271
Zipaquira, CO|5.022|-74.005
Zarzal, CO|4.396|-76.071
Zaragoza, CO|7.490|-74.869
Yumbo, CO|3.582|-76.491
Yopal, CO|5.336|-72.394
Yondo, CO|7.006|-73.910
Yarumal, CO|6.963|-75.417
Villeta, CO|5.009|-74.472
Villavicencio, CO|4.132|-73.626
Villa del Rosario, CO|7.834|-72.474
Villanueva, CO|10.608|-72.979
Villanueva, CO|5.283|-71.967
Villamaria, CO|5.045|-75.512
Velez, CO|6.013|-73.674
Valledupar, CO|10.465|-73.253
Urrao, CO|6.317|-76.134
Villa de San Diego de Ubate, CO|5.309|-73.816
Turbo, CO|8.093|-76.728
Turbaco, CO|10.329|-75.411
Tuquerres, CO|1.086|-77.619
Tunja, CO|5.545|-73.358
Tumaco, CO|1.791|-78.793
Tulua, CO|4.085|-76.195
Tolu Viejo, CO|9.451|-75.439
Santiago de Tolu, CO|9.524|-75.581
Tocancipa, CO|4.965|-73.913
Timbiqui, CO|2.772|-77.665
Tierralta, CO|8.174|-76.059
Tauramena, CO|5.018|-72.747
Tarqui, CO|2.112|-75.824
Tame, CO|6.461|-71.736
Tado, CO|5.264|-76.562
Supia, CO|5.452|-75.651
Sucre, CO|8.811|-74.721
Suarez, CO|2.954|-76.696
Sonson, CO|5.711|-75.311
Soledad, CO|10.918|-74.765
Sogamoso, CO|5.714|-72.934
Socorro, CO|6.468|-73.260
Soacha, CO|4.579|-74.217
Sitionuevo, CO|10.777|-74.720
Sincelejo, CO|9.305|-75.391
San Luis de Since, CO|9.244|-75.147
Simiti, CO|7.958|-73.944
Silvania, CO|4.404|-74.387
Sibate, CO|4.492|-74.260
Sevilla, CO|4.265|-75.932
Segovia, CO|7.080|-74.699
San Vicente, CO|6.285|-75.334
Santuario, CO|6.138|-75.264
Santo Tomas, CO|10.758|-74.755
Santa Rosa de Osos, CO|6.647|-75.460
Santa Rosa de Cabal, CO|4.869|-75.622
Santa Rosa, CO|10.445|-75.370
Santander de Quilichao, CO|3.010|-76.485
Santa Marta, CO|11.239|-74.194
Santa Lucia, CO|10.324|-74.960
San Pedro de Uraba, CO|8.275|-76.376
San Pablo, CO|10.052|-75.268
San Onofre, CO|9.736|-75.526
San Martin, CO|3.696|-73.700
San Marcos, CO|8.660|-75.128
San Lorenzo, CO|1.503|-77.215
San Juan Nepomuceno, CO|9.952|-75.082
San Juan de Uraba, CO|8.759|-76.530
San Juan del Cesar, CO|10.771|-73.003
San Jacinto, CO|9.828|-75.122
San Gil, CO|6.560|-73.136
San Estanislao, CO|10.398|-75.151
San Diego, CO|10.334|-73.180
San Carlos, CO|8.796|-75.699
San Benito Abad, CO|8.929|-75.027
San Antero, CO|9.374|-75.759
San Andres, CO|12.579|-81.700
Sampues, CO|9.184|-75.382
Samaniego, CO|1.338|-77.596
Salgar, CO|5.965|-75.965
Salamina, CO|5.407|-75.487
Sahagun, CO|8.946|-75.443
Sabaneta, CO|6.152|-75.617
Sabanalarga, CO|10.631|-74.922
Sabanagrande, CO|10.791|-74.761
Sabana de Torres, CO|7.391|-73.496
Rovira, CO|4.239|-75.240
Roldanillo, CO|4.414|-76.153
Rivera, CO|2.777|-75.256
Riosucio, CO|5.421|-75.703
Rionegro, CO|6.155|-75.374
Riohacha, CO|11.544|-72.907
Rioblanco, CO|3.530|-75.645
Retiro, CO|6.059|-75.503
Restrepo, CO|4.258|-73.561
Repelon, CO|10.495|-75.124
Quinchia, CO|5.339|-75.730
Quimbaya, CO|4.624|-75.763
Quibdo, CO|5.692|-76.658
Purificacion, CO|3.859|-74.931
Pupiales, CO|0.871|-77.640
Puerto Wilches, CO|7.348|-73.896
Puerto Triunfo, CO|5.873|-74.641
Puerto Tejada, CO|3.232|-76.418
Puerto Santander, CO|8.364|-72.406
Puerto Salgar, CO|5.463|-74.654
Puerto Rico, CO|1.910|-75.159
Puerto Lopez, CO|4.099|-72.956
Puerto Leguizamo, CO|-0.193|-74.782
Puerto Colombia, CO|10.988|-74.955
Puerto Carreno, CO|6.190|-67.484
Puerto Boyaca, CO|5.976|-74.585
Puerto Berrio, CO|6.492|-74.403
Puerto Asis, CO|0.505|-76.496
Puebloviejo, CO|10.994|-74.284
Pradera, CO|3.420|-76.242
Popayan, CO|2.438|-76.613
Ponedera, CO|10.643|-74.754
Polonuevo, CO|10.777|-74.853
Planeta Rica, CO|8.412|-75.585
Planadas, CO|3.197|-75.645
Pizarro, CO|4.955|-77.364
Pivijay, CO|10.462|-74.616
Pitalito, CO|1.854|-76.051
Pinillos, CO|8.919|-74.468
Piedecuesta, CO|6.988|-73.050
Pereira, CO|4.814|-75.695
Paz de Ariporo, CO|5.881|-71.892
Payande, CO|4.298|-75.097
Patia, CO|2.069|-77.053
Pasto, CO|1.215|-77.278
Pamplona, CO|7.376|-72.648
Palmira, CO|3.535|-76.298
Palmar de Varela, CO|10.741|-74.754
Pailitas, CO|8.957|-73.624
Belalcazar, CO|2.646|-75.973
Padua, CO|5.134|-75.140
Pacho, CO|5.133|-74.160
Ocana, CO|8.238|-73.356
Nueva Granada, CO|9.802|-74.393
Neiva, CO|2.930|-75.280
Neira, CO|5.166|-75.520
Nechi, CO|8.094|-74.776
Natagaima, CO|3.621|-75.094
Mosquera, CO|4.706|-74.230
Morales, CO|8.276|-73.868
Monteria, CO|8.751|-75.878
Montenegro, CO|4.566|-75.750
Montelibano, CO|7.979|-75.420
Moniquira, CO|5.876|-73.573
Mompos, CO|9.242|-74.427
Momil, CO|9.238|-75.675
Mocoa, CO|1.153|-76.652
Mitu, CO|1.257|-70.236
Miranda, CO|3.250|-76.228
Melgar, CO|4.205|-74.641
Medellin, CO|6.245|-75.572
Marsella, CO|4.937|-75.738
San Sebastian de Mariquita, CO|5.199|-74.893
Marinilla, CO|6.174|-75.336
Maria la Baja, CO|9.983|-75.302
Manzanares, CO|5.254|-75.154
Manizales, CO|5.067|-75.507
Manati, CO|10.446|-74.959
Malambo, CO|10.860|-74.774
Malaga, CO|6.699|-72.732
Maicao, CO|11.378|-72.240
Mahates, CO|10.233|-75.190
Magangue, CO|9.242|-74.755
Madrid, CO|4.732|-74.264
Luruaco, CO|10.617|-75.151
Los Patios, CO|7.838|-72.504
Lorica, CO|9.236|-75.814
Libano, CO|4.922|-75.062
Leticia, CO|-4.211|-69.939
Lerida, CO|4.862|-74.910
La Virginia, CO|4.900|-75.883
La Union, CO|5.974|-75.362
La Union, CO|4.533|-76.103
La Union, CO|1.605|-77.132
La Tebaida, CO|4.452|-75.787
La Plata, CO|2.393|-75.892
La Mesa, CO|5.267|-73.917
La Jagua de Ibirico, CO|9.562|-73.334
La Estrella, CO|6.158|-75.643
La Dorada, CO|5.448|-74.663
La Ceja, CO|6.031|-75.433
Juan de Acosta, CO|10.829|-75.033
Jamundi, CO|3.262|-76.540
Ituango, CO|7.171|-75.764
Itaguei, CO|6.185|-75.599
Ipiales, CO|0.825|-77.640
Ibague, CO|4.436|-75.203
Honda, CO|5.209|-74.736
Hatonuevo, CO|11.069|-72.767
Guamo, CO|4.031|-74.970
Guamal, CO|9.143|-74.224
Guaduas, CO|5.067|-74.595
Guadalupe, CO|2.025|-75.756
Guacari, CO|3.764|-76.332
Granada, CO|3.546|-73.707
Giron, CO|7.068|-73.170
Girardot City, CO|4.301|-74.808
Gigante, CO|2.387|-75.547
Garzon, CO|2.196|-75.628
Galeras, CO|9.161|-75.048
Galapa, CO|10.897|-74.886
Fusagasuga, CO|4.336|-74.364
Funza, CO|4.716|-74.212
Fundacion, CO|10.521|-74.185
Frontino, CO|6.771|-76.133
Fresno, CO|5.153|-75.036
Fonseca, CO|10.886|-72.849
Floridablanca, CO|7.062|-73.086
Florida, CO|3.324|-76.234
Florencia, CO|1.615|-75.604
Flandes, CO|4.290|-74.816
Facatativa, CO|4.814|-74.355
Espinal, CO|4.149|-74.884
Envigado, CO|6.176|-75.592
El Zulia, CO|7.932|-72.601
El Reten, CO|10.611|-74.268
El Doncello, CO|1.678|-75.285
El Copey, CO|10.150|-73.961
El Charco, CO|2.481|-78.110
El Cerrito, CO|3.685|-76.312
El Carmen de Bolivar, CO|9.717|-75.120
El Carmen de Chucuri, CO|6.697|-73.511
El Banco, CO|9.001|-73.976
El Bagre, CO|7.603|-74.810
Duitama, CO|5.824|-73.034
Dosquebradas, CO|4.837|-75.669
Darien, CO|3.931|-76.485
Dabeiba, CO|7.000|-76.269
Curumani, CO|9.200|-73.543
Cumaribo, CO|4.446|-69.799
Cucuta, CO|7.907|-72.505
Cotorra, CO|9.039|-75.790
Cota, CO|4.809|-74.098
Corozal, CO|9.318|-75.293
Corinto, CO|3.173|-76.263
Copacabana, CO|6.346|-75.509
Concordia, CO|6.046|-75.907
Circasia, CO|4.619|-75.636
Cimitarra, CO|6.314|-73.950
Cienaga de Oro, CO|8.874|-75.620
Cienaga, CO|11.007|-74.248
Chivolo, CO|10.025|-74.623
Chiriguana, CO|9.362|-73.603
Chiquinquira, CO|5.616|-73.817
Chinu, CO|9.106|-75.398
Chinchina, CO|4.983|-75.605
Chimichagua, CO|9.258|-73.812
Chigorodo, CO|7.666|-76.681
Chia, CO|4.859|-74.059
Chaparral, CO|3.724|-75.484
Cerete, CO|8.885|-75.791
Caucasia, CO|7.987|-75.193
Cartago, CO|4.745|-75.912
Cartagena, CO|10.398|-75.493
Carmen de Viboral, CO|6.082|-75.335
Candelaria, CO|10.459|-74.880
Candelaria, CO|3.408|-76.348
Campo de la Cruz, CO|10.378|-74.884
Campoalegre, CO|2.685|-75.323
Cali, CO|3.431|-76.520
Caldas, CO|6.091|-75.636
Calarca, CO|4.529|-75.640
Cajica, CO|4.919|-74.028
Caicedonia, CO|4.333|-75.826
Guadalajara de Buga, CO|3.901|-76.298
Buesaco, CO|1.384|-77.156
Buenaventura, CO|3.880|-77.031
Buenaventura, CO|3.583|-77.000
Bucaramanga, CO|7.125|-73.119
Bosconia, CO|9.971|-73.888
Bogota, CO|4.610|-74.082
Betulia, CO|6.113|-75.984
Bello, CO|6.337|-75.558
Belen de Umbria, CO|5.202|-75.868
Becerril, CO|9.704|-73.279
Barranquilla, CO|10.969|-74.781
Barrancas, CO|10.957|-72.795
Barrancabermeja, CO|7.065|-73.855
Barbosa, CO|6.438|-75.331
Barbosa, CO|5.932|-73.615
Baranoa, CO|10.794|-74.916
Balboa, CO|2.042|-77.216
Ayapel, CO|8.314|-75.140
Astrea, CO|9.498|-73.976
Armenia, CO|4.537|-75.673
Arjona, CO|10.254|-75.344
Ariguani, CO|10.250|-74.000
Arauca, CO|7.085|-70.759
Aracataca, CO|10.592|-74.190
Apartado, CO|7.883|-76.626
Santa Fe de Antioquia, CO|6.557|-75.828
Anserma, CO|5.333|-75.791
Andes, CO|5.656|-75.880
Andalucia, CO|4.170|-76.167
Anaime, CO|4.396|-75.445
Albania, CO|11.161|-72.592
Aguazul, CO|5.173|-72.547
Aguadas, CO|5.612|-75.456
Aguachica, CO|8.308|-73.617
Acacias, CO|3.987|-73.758
Abejorral, CO|5.789|-75.427
Morales, CO|2.754|-76.628
Villa Rica, CO|2.514|-76.849
Fredonia, CO|5.926|-75.671
Bosconia, CO|4.856|-73.982
Carepa, CO|7.758|-76.653
Ciudad Bolivar, CO|5.854|-76.025
Tiquisio, CO|8.557|-74.264
Agustin Codazzi, CO|10.037|-73.236
San Martin, CO|8.002|-73.511
Isnos, CO|1.936|-76.241
Plato, CO|9.790|-74.782
San Jose del Guaviare, CO|2.568|-72.640
Orito, CO|0.667|-76.873
Kennedy, CO|4.617|-74.146
Piendamo, CO|2.639|-76.531
Turrialba, CR|9.904|-83.684
Tejar, CR|9.743|-84.232
Siquirres, CR|10.097|-83.507
San Vicente, CR|9.962|-84.049
San Rafael Arriba, CR|9.876|-84.075
San Rafael Abajo, CR|9.831|-84.290
San Rafael, CR|9.928|-84.135
San Pedro, CR|9.928|-84.051
San Pablo, CR|9.996|-84.097
San Miguel, CR|9.871|-84.061
San Juan de Dios, CR|9.878|-84.084
San Juan, CR|9.962|-84.079
San Jose, CR|10.952|-85.136
San Jose, CR|9.934|-84.085
San Isidro, CR|9.367|-83.697
San Francisco, CR|9.994|-84.127
San Felipe, CR|9.904|-84.106
San Diego, CR|9.900|-84.002
Quesada, CR|10.327|-84.432
Purral, CR|9.957|-84.032
Puntarenas, CR|9.977|-84.838
Limon, CR|9.991|-83.036
Patarra, CR|9.881|-84.036
Paraiso, CR|9.838|-83.867
Nicoya, CR|10.150|-85.451
Mercedes Norte, CR|10.006|-84.130
Liberia, CR|10.635|-85.438
Ipis, CR|9.965|-84.018
Heredia, CR|9.999|-84.116
Guapiles, CR|10.217|-83.785
Guadalupe, CR|9.948|-84.057
Esparza, CR|9.992|-84.666
Curridabat, CR|9.914|-84.036
Colima, CR|9.955|-84.082
Chacarita, CR|9.984|-84.779
Cartago, CR|9.864|-83.919
Canas, CR|10.431|-85.098
Calle Blancos, CR|9.945|-84.067
Aserri, CR|9.861|-84.093
Alajuela, CR|10.017|-84.213
San Vicente de Moravia, CR|9.962|-84.049
Yara, CU|20.274|-76.952
Yaguajay, CU|22.327|-79.237
Vinales, CU|22.619|-83.707
Vibora Park, CU|23.081|-82.354
Vertientes, CU|21.259|-78.149
Venezuela, CU|21.738|-78.793
Vedado del Cotorro, CU|23.050|-82.250
Vedado, CU|23.138|-82.393
Varadero, CU|23.157|-81.244
San German, CU|20.600|-76.135
Union de Reyes, CU|22.795|-81.537
Trinidad, CU|21.800|-79.983
Sibanicu, CU|21.236|-77.526
Santo Domingo, CU|22.587|-80.243
Santiago de las Vegas, CU|22.970|-82.387
Santiago de Cuba, CU|20.023|-75.822
Santa Cruz del Sur, CU|20.715|-77.996
Santa Cruz del Norte, CU|23.154|-81.923
Santa Clara, CU|22.407|-79.966
San Miguel del Padron, CU|23.095|-82.327
San Luis, CU|20.188|-75.850
San Jose de las Lajas, CU|22.961|-82.152
Sancti Spiritus, CU|21.934|-79.440
San Cristobal, CU|22.717|-83.056
San Antonio de los Banos, CU|22.889|-82.506
Sagua la Grande, CU|22.806|-80.074
Sagua de Tanamo, CU|20.583|-75.241
Rodas, CU|22.342|-80.556
Rio Guayabal de Yateras, CU|20.367|-75.017
Rio Cauto, CU|20.560|-76.917
Remedios, CU|22.495|-79.545
Regla, CU|23.126|-82.331
Ranchuelo, CU|22.373|-80.150
Puerto Padre, CU|21.196|-76.604
Primero de Enero, CU|21.945|-78.429
Placetas, CU|22.314|-79.654
Pinar del Rio, CU|22.416|-83.697
Pilon, CU|19.906|-77.322
Perico, CU|22.769|-81.018
Pedro Betancourt, CU|22.728|-81.289
Palmira, CU|22.242|-80.392
Palma Soriano, CU|20.211|-75.994
Nuevitas, CU|21.544|-77.265
Nueva Gerona, CU|21.888|-82.807
Niquero, CU|20.046|-77.580
Naranjito, CU|23.079|-82.377
Moron, CU|22.109|-78.627
Moa, CU|20.658|-74.951
Minas de Matahambre, CU|22.587|-83.946
Minas, CU|21.488|-77.609
Media Luna, CU|20.142|-77.436
Matanzas, CU|23.044|-81.583
Mariel, CU|22.990|-82.754
Marianao, CU|23.074|-82.430
Manzanillo, CU|20.342|-77.119
Mantilla, CU|23.068|-82.341
Manicaragua, CU|22.150|-79.979
Maisi, CU|20.247|-74.152
Madruga, CU|22.910|-81.857
Los Palacios, CU|22.588|-83.248
Limonar, CU|22.950|-81.411
Vibora, CU|23.094|-82.372
Las Tunas, CU|20.961|-76.952
La Sierpe, CU|21.772|-79.268
La Salud, CU|22.874|-82.420
Lajas, CU|22.414|-80.294
Havana, CU|23.133|-82.383
Jovellanos, CU|22.805|-81.192
Jobabo, CU|20.969|-76.299
Jobabo, CU|20.910|-77.285
Jiguani, CU|20.368|-76.429
Jesus Menendez, CU|21.162|-76.478
Jatibonico, CU|21.943|-79.167
Jaruco, CU|23.044|-82.009
Jagueey Grande, CU|22.526|-81.129
Holguin, CU|20.887|-76.263
Guisa, CU|20.256|-76.539
Gueira de Melena, CU|22.797|-82.507
Gueines, CU|22.838|-82.027
Guantanamo, CU|20.144|-75.209
Guane, CU|22.204|-84.088
Guanajay, CU|22.926|-82.687
Guanabacoa, CU|23.125|-82.301
Guaimaro, CU|21.054|-77.349
Gibara, CU|21.110|-76.130
Fontanar, CU|23.024|-82.408
Fomento, CU|22.103|-79.720
Florida, CU|21.526|-78.226
Florencia, CU|22.146|-78.972
Esmeralda, CU|21.852|-78.117
Encrucijada, CU|22.618|-79.865
Cumanayagua, CU|22.152|-80.204
Cueto, CU|20.649|-75.930
Cruces, CU|22.343|-80.271
Corralillo, CU|22.982|-80.585
Contramaestre, CU|20.299|-76.245
Consolacion del Sur, CU|22.505|-83.513
Condado, CU|21.876|-79.840
Colon, CU|22.721|-80.904
Colombia, CU|20.986|-77.426
Cojimar, CU|23.165|-82.301
Ciro Redondo, CU|22.019|-78.704
Cifuentes, CU|22.649|-80.049
Cienfuegos, CU|22.147|-80.448
Ciego de Avila, CU|21.842|-78.760
Chambas, CU|22.193|-78.914
Cerro, CU|23.108|-82.384
Cauto Cristo, CU|20.557|-76.473
Cardenas, CU|23.036|-81.206
Campechuela, CU|20.233|-77.279
Camajuani, CU|22.483|-79.750
Camagueey, CU|21.381|-77.917
Calimete, CU|22.534|-80.911
Caibarien, CU|22.520|-79.466
Cacocum, CU|20.737|-76.326
Cabaiguan, CU|22.078|-79.496
Bejucal, CU|22.928|-82.389
Bayamo, CU|20.374|-76.643
Bauta, CU|22.982|-82.548
Bartolome Maso, CU|20.167|-76.944
Baragua, CU|21.682|-78.626
Baracoa, CU|20.348|-74.497
Banes, CU|20.961|-75.723
Balcon de la Lisa, CU|23.053|-82.448
Bahia Honda, CU|22.903|-83.160
Artemisa, CU|22.814|-82.758
Arroyo Naranjo, CU|23.038|-82.377
Amancio, CU|20.829|-77.579
Alquizar, CU|22.805|-82.584
Almendares, CU|23.110|-82.423
Alamar, CU|23.158|-82.278
Aguada de Pasajeros, CU|22.385|-80.848
Abreus, CU|22.278|-80.569
Ciudad Camilo Cienfuegos, CU|23.161|-82.328
Centro Habana, CU|23.135|-82.369
La Habana Vieja, CU|23.130|-82.353
Jimaguayu, CU|21.242|-77.826
Boyeros, CU|23.007|-82.402
Diez de Octubre, CU|23.088|-82.360
Plaza de la Revolucion, CU|23.119|-82.392
Praia, CV|14.932|-23.513
Mindelo, CV|16.890|-24.980
Assomada, CV|15.100|-23.683
Espargos, CV|16.755|-22.945
Willemstad, CW|12.122|-68.886
Bandariba, CW|12.093|-68.831
Flying Fish Cove, CX|-10.422|105.679
Protaras, CY|35.013|34.058
Germasogeia, CY|34.721|33.084
Strovolos, CY|35.149|33.334
Paphos, CY|34.777|32.425
Nicosia, CY|35.173|33.354
Morfou, CY|35.199|32.993
Limassol, CY|34.684|33.038
Larnaca, CY|34.922|33.628
Kyrenia, CY|35.336|33.317
Kato Polemidia, CY|34.697|32.993
Kato Lakatameia, CY|35.118|33.325
Famagusta, CY|35.125|33.941
Aglantzia, CY|35.154|33.396
Egkomi, CY|35.163|33.883
Aradippou, CY|34.948|33.588
Dvur Kralove nad Labem, CZ|50.432|15.814
Znojmo, CZ|48.855|16.049
Zlin, CZ|49.226|17.671
Zizkov, CZ|50.083|14.450
Zidenice, CZ|49.197|16.647
Zgar nad Sazavou, CZ|49.563|15.939
Zatec, CZ|50.327|13.546
Zabovresky, CZ|49.214|16.573
Zabehlice, CZ|50.057|14.504
Vysocany, CZ|50.109|14.517
Vyskov, CZ|49.277|16.999
Vsetin, CZ|49.339|17.996
Vrsovice, CZ|50.067|14.460
Valasske Mezirici, CZ|49.472|17.971
Usti nad Labem, CZ|50.661|14.032
Uhersky Brod, CZ|49.025|17.647
Uherske Hradiste, CZ|49.070|17.460
Trutnov, CZ|50.561|15.913
Trinec, CZ|49.678|18.671
Trebic, CZ|49.215|15.882
Teplice, CZ|50.640|13.825
Tabor, CZ|49.414|14.658
Svitavy, CZ|49.756|16.468
Sumperk, CZ|49.965|16.971
Strizkov, CZ|50.127|14.494
Strakonice, CZ|49.261|13.902
Stodulky, CZ|50.050|14.317
Stary Bohumin, CZ|49.917|18.336
Stare Strasnice, CZ|50.076|14.510
Sokolov, CZ|50.181|12.640
Smichov, CZ|50.072|14.404
Slany, CZ|50.230|14.087
Roznov pod Radhostem, CZ|49.459|18.143
Ricany, CZ|49.992|14.654
Repy, CZ|50.071|14.301
Rakovnik, CZ|50.104|13.733
Prostejov, CZ|49.472|17.112
Prosek, CZ|50.119|14.499
Pribram, CZ|49.690|14.010
Prerov, CZ|49.455|17.451
Prague, CZ|50.088|14.421
Podebrady, CZ|50.142|15.119
Pilsen, CZ|49.747|13.378
Pisek, CZ|49.309|14.148
Pelhrimov, CZ|49.431|15.223
Pardubice, CZ|50.041|15.777
Otrokovice, CZ|49.209|17.539
Ostrov, CZ|50.306|12.939
Ostrava, CZ|49.835|18.282
Orlova, CZ|49.845|18.430
Opava, CZ|49.939|17.903
Olomouc, CZ|49.596|17.252
Nymburk, CZ|50.186|15.042
Nusle, CZ|50.065|14.440
Novy Jicin, CZ|49.594|18.010
Nove Mesto, CZ|50.078|14.421
Neratovice, CZ|50.259|14.518
Nachod, CZ|50.417|16.163
Most, CZ|50.503|13.636
Modrany, CZ|50.011|14.410
Mlada Boleslav, CZ|50.411|14.903
Michle, CZ|50.048|14.462
Melnik, CZ|50.350|14.474
Louny, CZ|50.357|13.797
Litvinov, CZ|50.604|13.618
Litomerice, CZ|50.533|14.132
Lisen, CZ|49.207|16.695
Liberec, CZ|50.767|15.056
Liben, CZ|50.108|14.475
Letnany, CZ|50.133|14.517
Kutna Hora, CZ|49.948|15.268
Kromeriz, CZ|49.298|17.393
Krnov, CZ|50.090|17.704
Krc, CZ|50.042|14.446
Kralupy nad Vltavou, CZ|50.241|14.311
Kralovske Vinohrady, CZ|50.074|14.444
Kralovo Pole, CZ|49.225|16.590
Kosire, CZ|50.067|14.363
Koprivnice, CZ|49.599|18.145
Kolin, CZ|50.028|15.200
Kobylisy, CZ|50.124|14.452
Klatovy, CZ|49.396|13.295
Kladno, CZ|50.147|14.103
Karvina, CZ|49.854|18.542
Karlovy Vary, CZ|50.233|12.871
Kadan, CZ|50.383|13.267
Jirkov, CZ|50.500|13.448
Jindrichuv Hradec, CZ|49.144|15.003
Jihlava, CZ|49.396|15.591
Jicin, CZ|50.437|15.352
Jablonec nad Nisou, CZ|50.724|15.171
Hranice, CZ|49.548|17.735
Hradec Kralove, CZ|50.209|15.833
Hostivar, CZ|50.049|14.524
Horni Mecholupy, CZ|50.050|14.567
Holesovice, CZ|50.105|14.449
Hodonin, CZ|48.849|17.132
Hlubocepy, CZ|50.044|14.402
Havlickuv Brod, CZ|49.607|15.579
Havirov, CZ|49.780|18.437
Haje, CZ|50.036|14.527
Frydek-Mistek, CZ|49.683|18.350
Dejvice, CZ|50.101|14.391
Decin, CZ|50.782|14.215
Chrudim, CZ|49.951|15.796
Chomutov, CZ|50.460|13.418
Chodov, CZ|50.037|14.504
Cheb, CZ|50.080|12.374
Cesky Tesin, CZ|49.746|18.626
Ceske Budejovice, CZ|48.974|14.474
Ceska Lipa, CZ|50.686|14.538
Bystrc, CZ|49.226|16.530
Brno, CZ|49.195|16.608
Breclav, CZ|48.759|16.882
Branik, CZ|50.035|14.415
Brandys nad Labem-Stara Boleslav, CZ|50.187|14.663
Bohumin, CZ|49.904|18.358
Bohnice, CZ|50.133|14.417
Blansko, CZ|49.363|16.644
Beroun, CZ|49.964|14.072
Benesov, CZ|49.782|14.687
Cerny Most, CZ|50.105|14.580
Brno stred, CZ|49.193|16.607
Zwickau, DE|50.727|12.488
Zweibruecken, DE|49.247|7.370
Zuelpich, DE|50.694|6.654
Zossen, DE|52.216|13.449
Zittau, DE|50.898|14.808
Zirndorf, DE|49.442|10.954
Zerbst, DE|51.966|12.085
Zeitz, DE|51.050|12.137
Zehlendorf, DE|52.433|13.250
Xanten, DE|51.659|6.453
Wurzen, DE|51.371|12.739
Wuerzburg, DE|49.794|9.951
Wuerselen, DE|50.818|6.135
Wuppertal, DE|51.256|7.148
Wunstorf, DE|52.424|9.438
Wuelfrath, DE|51.282|7.038
Woerth am Rhein, DE|49.049|8.260
Worms, DE|49.633|8.359
Wolfsburg, DE|52.424|10.776
Wolfratshausen, DE|47.913|11.422
Wolfenbuettel, DE|52.164|10.541
Wolfen, DE|51.661|12.269
Witzenhausen, DE|51.341|9.855
Wittstock, DE|53.161|12.483
Wittmund, DE|53.577|7.776
Wittlich, DE|49.986|6.893
Wittenberge, DE|53.000|11.749
Wittenau, DE|52.593|13.321
Witten, DE|51.444|7.353
Wismar, DE|53.892|11.456
Wipperfuerth, DE|51.116|7.399
Winterhude, DE|53.594|10.011
Winsen, DE|53.358|10.212
Winnenden, DE|48.876|9.398
Wilnsdorf, DE|50.817|8.100
Wilmersdorf, DE|52.483|13.317
Willich, DE|51.264|6.547
Wilhelmstadt, DE|52.524|13.189
Wilhelmshaven, DE|53.548|8.104
Wilhelmsburg, DE|53.493|10.014
Wildeshausen, DE|52.894|8.434
Wiesloch, DE|49.295|8.698
Wiesbaden, DE|50.086|8.244
Wiehl, DE|50.950|7.551
Wickede, DE|51.534|7.616
Wetzlar, DE|50.561|8.505
Wetter, DE|51.387|7.393
Westerstede, DE|53.257|7.927
Westend, DE|52.517|13.276
Wesseling, DE|50.827|6.975
Wesel, DE|51.667|6.620
Petersberg, DE|50.560|9.713
Wertheim, DE|49.759|9.509
Wersten, DE|51.185|6.812
Wernigerode, DE|51.837|10.782
Werne, DE|51.664|7.634
Bochum-Werne, DE|51.488|7.312
Wermelskirchen, DE|51.140|7.216
Werl, DE|51.555|7.914
Werdohl, DE|51.260|7.766
Werder, DE|52.379|12.934
Werdau, DE|50.736|12.375
Wendlingen am Neckar, DE|48.671|9.376
Wendelstein, DE|49.352|11.151
Weiterstadt, DE|49.904|8.589
Weisswasser, DE|51.504|14.640
Weissenfels, DE|51.201|11.968
Weissenburg in Bayern, DE|49.031|10.972
Weinstadt-Endersbach, DE|48.813|9.364
Weinheim, DE|49.549|8.667
Weingarten, DE|47.810|9.639
Weimar, DE|50.980|11.329
Weilheim, DE|47.841|11.155
Weilerswist, DE|50.753|6.846
Weil der Stadt, DE|48.750|8.872
Weil am Rhein, DE|47.593|7.621
Weiden, DE|49.677|12.156
Weissensee, DE|52.556|13.466
Wegberg, DE|51.142|6.284
Weener, DE|53.165|7.350
Wedel, DE|53.584|9.698
Wedding, DE|52.547|13.356
Wattenscheid, DE|51.481|7.143
Wassenberg, DE|51.100|6.155
Warstein, DE|51.445|8.349
Warendorf, DE|51.951|7.988
Waren, DE|53.520|12.681
Wardenburg, DE|53.059|8.197
Warburg, DE|51.490|9.146
Wangen, DE|47.690|9.832
Wandlitz, DE|52.742|13.458
Waltrop, DE|51.621|7.402
Walsrode, DE|52.861|9.593
Wallenhorst, DE|52.350|8.017
Waldshut-Tiengen, DE|47.623|8.217
Waldkraiburg, DE|48.209|12.399
Waldkirch, DE|48.096|7.964
Waldbroel, DE|50.876|7.617
Waiblingen, DE|48.832|9.316
Waghausel, DE|49.250|8.513
Wadgassen, DE|49.267|6.783
Wadern, DE|49.541|6.888
Wachtberg, DE|50.633|7.100
Vreden, DE|52.038|6.828
Volksdorf, DE|53.650|10.184
Voelklingen, DE|49.252|6.859
Voerde, DE|51.597|6.686
Vlotho, DE|52.165|8.860
Vilshofen, DE|48.627|13.192
Villingen-Schwenningen, DE|48.062|8.494
Viersen, DE|51.254|6.394
Viernheim, DE|49.540|8.578
Versmold, DE|52.040|8.153
Verl, DE|51.883|8.517
Verden, DE|52.923|9.238
Velbert, DE|51.335|7.043
Vegesack, DE|53.179|8.622
Vechta, DE|52.731|8.290
Vechelde, DE|52.260|10.365
Vaterstetten, DE|48.105|11.768
Varel, DE|53.397|8.136
Vaihingen an der Enz, DE|48.936|8.960
Uetersen, DE|53.689|9.662
Uslar, DE|51.657|9.635
Unterschleissheim, DE|48.280|11.577
Unterhaching, DE|48.066|11.616
Unterkrozingen, DE|47.919|7.690
Unna, DE|51.538|7.690
Ulm, DE|48.398|9.992
Uerdingen, DE|51.355|6.639
Uelzen, DE|52.964|10.567
Uberlingen, DE|47.770|9.171
UEbach-Palenberg, DE|50.918|6.123
Tuttlingen, DE|47.985|8.818
Tuebingen, DE|48.523|9.052
Trossingen, DE|48.077|8.644
Troisdorf, DE|50.809|7.150
Trier, DE|49.756|6.639
Traunstein, DE|47.868|12.643
Traunreut, DE|47.963|12.592
Torgau, DE|51.560|12.996
Toenisvorst, DE|51.321|6.494
Tettnang, DE|47.669|9.591
Templin, DE|53.119|13.502
Tempelhof, DE|52.467|13.400
Teltow, DE|52.403|13.260
Telgte, DE|51.980|7.783
Tegel, DE|52.576|13.294
Taunusstein, DE|50.150|8.152
Taufkirchen, DE|48.049|11.617
Syke, DE|52.913|8.822
Sundern, DE|51.328|8.004
Sulzbach-Rosenberg, DE|49.501|11.746
Sulzbach, DE|49.299|7.057
Suhl, DE|50.609|10.694
Stuttgart, DE|48.782|9.177
Stuhr, DE|53.033|8.750
Strausberg, DE|52.579|13.887
Straubing, DE|48.881|12.574
Stralsund, DE|54.309|13.082
Straelen, DE|51.442|6.266
Stolberg, DE|50.774|6.226
Stockelsdorf, DE|53.892|10.647
Stockach, DE|47.851|9.009
Stendal, DE|52.606|11.861
Stellingen, DE|53.592|9.929
Steinhagen, DE|52.000|8.400
Steinfurt, DE|52.150|7.337
Steilshoop, DE|53.610|10.059
Steglitz Bezirk, DE|52.456|13.332
Stassfurt, DE|51.852|11.585
Starnberg, DE|48.002|11.344
Stadtlohn, DE|51.994|6.919
Stadthagen, DE|52.323|9.203
Stadtallendorf, DE|50.823|9.013
Hansestadt Stade, DE|53.594|9.473
Staaken, DE|52.537|13.151
Sprockhoevel, DE|51.347|7.243
Springe, DE|52.208|9.554
Speyer, DE|49.321|8.431
Spenge, DE|52.140|8.485
Sonthofen, DE|47.518|10.283
Sonneberg, DE|50.359|11.175
Sondershausen, DE|51.370|10.870
Soemmerda, DE|51.159|11.115
Soltau, DE|52.985|9.840
Solingen, DE|51.173|7.085
Soest, DE|51.576|8.106
Sinzig, DE|50.544|7.246
Sinsheim, DE|49.253|8.879
Singen, DE|47.759|8.840
Sindelfingen, DE|48.700|9.017
Sigmaringen, DE|48.088|9.230
Siegen, DE|50.875|8.024
Siegburg, DE|50.800|7.208
Langenhorn, DE|53.667|10.017
Senftenberg, DE|51.525|14.002
Senden, DE|51.856|7.483
Senden, DE|48.324|10.044
Selm, DE|51.697|7.468
Seligenstadt, DE|50.043|8.974
Selb, DE|50.171|12.131
Sehnde, DE|52.314|9.968
Seevetal, DE|53.400|9.967
Seesen, DE|51.891|10.178
Seelze, DE|52.395|9.595
Schwetzingen, DE|49.382|8.582
Schwerte, DE|51.444|7.567
Schwerin, DE|53.629|11.413
Schwelm, DE|51.286|7.294
Schweinfurt, DE|50.049|10.222
Schwedt (Oder), DE|53.060|14.282
Schwarzenberg, DE|50.538|12.785
Schwanewede, DE|53.224|8.590
Schwandorf in Bayern, DE|49.325|12.110
Schwalmtal, DE|51.217|6.267
Schwalmstadt, DE|50.933|9.217
Schwalbach, DE|49.300|6.817
Schwaebisch Hall, DE|49.111|9.739
Schwaebisch Gmuend, DE|48.799|9.798
Schwabach, DE|49.330|11.023
Schrobenhausen, DE|48.561|11.261
Schramberg, DE|48.224|8.386
Schortens, DE|53.538|7.948
Schorndorf, DE|48.805|9.527
Schopfheim, DE|47.651|7.821
Schoeneberg, DE|52.498|13.344
Schoenebeck, DE|52.017|11.731
Schneverdingen, DE|53.117|9.792
Schnelsen, DE|53.637|9.920
Schneeberg, DE|50.595|12.641
Schmelz, DE|49.433|6.850
Schmargendorf, DE|52.475|13.291
Schmallenberg, DE|51.155|8.285
Schmalkalden, DE|50.721|10.444
Schluechtern, DE|50.349|9.525
Schleswig, DE|54.520|9.568
Schkeuditz, DE|51.397|12.221
Schiffweiler, DE|49.367|7.133
Schifferstadt, DE|49.384|8.377
Scharnhorst, DE|51.549|7.539
Bad Saulgau, DE|48.017|9.501
Sasel, DE|53.654|10.112
Sarstedt, DE|52.235|9.854
Sankt Wendel, DE|49.466|7.168
Sankt Ingbert, DE|49.277|7.117
Sankt Augustin, DE|50.775|7.197
Sangerhausen, DE|51.472|11.295
Hansestadt Salzwedel, DE|52.853|11.153
Salzkotten, DE|51.672|8.601
Salzgitter, DE|52.157|10.415
Saarlouis, DE|49.314|6.752
Saarbruecken, DE|49.233|7.010
Saalfeld, DE|50.648|11.365
Ruesselsheim am Main, DE|49.990|8.423
Rummelsburg, DE|52.501|13.493
Rudow, DE|52.424|13.485
Rudolstadt, DE|50.720|11.340
Rottweil, DE|48.168|8.627
Rottenburg, DE|48.476|8.935
Rotherbaum, DE|53.567|9.981
Roth, DE|49.248|11.091
Rotenburg, DE|53.110|9.404
Rostock, DE|54.089|12.140
Roesrath, DE|50.896|7.182
Rosenheim, DE|47.856|12.122
Ronnenberg, DE|52.319|9.655
Rissen, DE|53.583|9.757
Rinteln, DE|52.186|9.079
Rietberg, DE|51.809|8.428
Riesa, DE|51.308|13.292
Riegelsberg, DE|49.300|6.933
Ribnitz-Damgarten, DE|54.242|12.457
Rheinhausen, DE|51.401|6.712
Rheinfelden, DE|47.560|7.787
Rheine, DE|52.285|7.441
Rheinberg, DE|51.546|6.595
Rheinbach, DE|50.626|6.949
Rhede, DE|51.835|6.696
Rheda-Wiedenbrueck, DE|51.850|8.300
Reutlingen, DE|48.491|9.204
Renningen, DE|48.770|8.939
Rendsburg, DE|54.302|9.672
Remscheid, DE|51.180|7.192
Remagen, DE|50.579|7.227
Reinickendorf, DE|52.564|13.336
Reinheim, DE|49.829|8.836
Reinbek, DE|53.518|10.249
Reichenbach/Vogtland, DE|50.623|12.303
Regensburg, DE|49.015|12.102
Rees, DE|51.763|6.398
Recklinghausen, DE|51.614|7.197
Ravensburg, DE|47.782|9.611
Ratingen, DE|51.297|6.849
Rathenow, DE|52.607|12.337
Ratekau, DE|53.946|10.731
Rastede, DE|53.245|8.197
Rastatt, DE|48.859|8.210
Rahlstedt, DE|53.602|10.157
Rahden, DE|52.434|8.613
Radolfzell, DE|47.742|8.971
Radevormwald, DE|51.202|7.360
Radebeul, DE|51.107|13.660
Radeberg, DE|51.111|13.912
Quickborn, DE|53.728|9.911
Querenburg, DE|51.452|7.266
Quedlinburg, DE|51.788|11.150
Puettlingen, DE|49.285|6.887
Pulheim, DE|51.000|6.806
Puchheim, DE|48.150|11.350
Prenzlauer Berg Bezirk, DE|52.539|13.424
Prenzlau, DE|53.317|13.864
Preetz, DE|54.236|10.279
Potsdam, DE|52.399|13.066
Porz am Rhein, DE|50.886|7.058
Porta Westfalica, DE|52.230|8.916
Poppenbuettel, DE|53.659|10.085
Plettenberg, DE|51.209|7.873
Plauen, DE|50.497|12.138
Pirna, DE|50.958|13.937
Pirmasens, DE|49.201|7.605
Pinneberg, DE|53.659|9.797
Pfungstadt, DE|49.806|8.603
Pfullingen, DE|48.465|9.228
Pforzheim, DE|48.884|8.699
Pfaffenhofen an der Ilm, DE|48.531|11.505
Petershagen, DE|52.375|8.965
Penzberg, DE|47.753|11.377
Peine, DE|52.319|10.235
Passau, DE|48.566|13.431
Pasing, DE|48.141|11.456
Parchim, DE|53.426|11.849
Papenburg, DE|53.078|7.415
Pankow, DE|52.569|13.402
Paderborn, DE|51.719|8.754
Oyten, DE|53.055|9.020
Overath, DE|50.933|7.284
Ottobrunn bei Muenchen, DE|48.065|11.663
Ottensen, DE|53.557|9.918
Othmarschen, DE|53.552|9.886
Osterholz-Scharmbeck, DE|53.227|8.792
Osnabrueck, DE|52.273|8.050
Osdorf, DE|53.580|9.858
Oschersleben, DE|52.030|11.229
Oschatz, DE|51.300|13.110
Oranienburg, DE|52.748|13.252
Opladen, DE|51.069|7.004
Olsberg, DE|51.356|8.489
Olpe, DE|51.029|7.851
Oldenburg, DE|53.140|8.215
Olching, DE|48.200|11.333
Ohringen, DE|49.199|9.507
Ohligs, DE|51.150|7.000
Offenburg, DE|48.474|7.945
Offenbach, DE|50.101|8.766
Oerlinghausen, DE|51.955|8.662
Oer-Erkenschwick, DE|51.642|7.265
Oelde, DE|51.829|8.147
Odenthal, DE|51.033|7.117
Ochtrup, DE|52.208|7.190
Oberursel, DE|50.207|8.577
Obertshausen, DE|50.071|8.851
Oberschoeneweide, DE|52.461|13.521
Ober-Ramstadt, DE|49.831|8.749
Oberkirch, DE|48.532|8.079
Oberhausen, DE|51.478|6.862
Oberasbach, DE|49.423|10.958
Nurtingen, DE|48.626|9.342
Nuremberg, DE|49.454|11.078
Nuembrecht, DE|50.904|7.541
Nottuln, DE|51.933|7.350
Northeim, DE|51.707|10.000
Noerdlingen, DE|48.851|10.489
Nordhorn, DE|52.431|7.068
Nordhausen, DE|51.502|10.796
Norderstedt, DE|53.702|9.993
Nordenham, DE|53.501|8.490
Norden, DE|53.595|7.206
Nippes, DE|50.965|6.953
Niendorf, DE|53.618|9.950
Nienburg, DE|52.644|9.217
Niederschoenhausen, DE|52.585|13.403
Niederkruchten, DE|51.200|6.217
Niederkassel, DE|50.815|7.038
Nieder-Ingelheim, DE|49.978|8.072
Nidderau, DE|50.238|8.867
Nidda, DE|50.413|9.006
Neu Wulmstorf, DE|53.466|9.792
Neuwied, DE|50.434|7.471
Neu-Ulm, DE|48.393|10.011
Neustrelitz, DE|53.360|13.073
Neustadt in Holstein, DE|54.107|10.815
Neustadt an der Weinstrasse, DE|49.350|8.139
Neustadt am Ruebenberge, DE|52.505|9.459
Neue Neustadt, DE|52.150|11.633
Neuss, DE|51.198|6.685
Neusaess, DE|48.392|10.833
Neuruppin, DE|52.928|12.803
Neunkirchen, DE|49.344|7.180
Neumuenster, DE|54.074|9.985
Neumarkt in der Oberpfalz, DE|49.280|11.463
Neukoelln, DE|52.477|13.431
Neu-Isenburg, DE|50.048|8.694
Neugraben-Fischbek, DE|53.466|9.843
Neufahrn bei Freising, DE|48.316|11.663
Neuenhagen, DE|52.530|13.689
Neuburg an der Donau, DE|48.732|11.187
Neubrueck, DE|51.134|6.639
Neubrandenburg, DE|53.557|13.261
Neu-Anspach, DE|50.317|8.500
Nettetal, DE|51.317|6.283
Netphen, DE|50.917|8.100
Neheim, DE|51.450|7.970
Neckarsulm, DE|49.189|9.225
Naumburg, DE|51.150|11.810
Nauen, DE|52.607|12.874
Nagold, DE|48.550|8.724
Munster, DE|52.985|10.090
Muenster, DE|51.962|7.626
Hannoversch Muenden, DE|51.415|9.650
Munich, DE|48.137|11.575
Mullheim, DE|47.808|7.630
Muelheim, DE|51.432|6.880
Muehlheim am Main, DE|50.117|8.833
Stuttgart Muehlhausen, DE|48.842|9.230
Muehlhausen, DE|51.209|10.453
Muehldorf, DE|48.247|12.522
Muehlacker, DE|48.948|8.837
Much, DE|50.904|7.403
Mossingen, DE|48.406|9.054
Mosbach, DE|49.354|9.151
Moosburg, DE|48.471|11.938
Monheim am Rhein, DE|51.092|6.892
Moenchengladbach, DE|51.185|6.442
Moelln, DE|53.621|10.687
Moers, DE|51.453|6.633
Moabit, DE|52.526|13.339
Mittweida, DE|50.986|12.975
Misburg, DE|52.390|9.852
Minden, DE|52.290|8.915
Michelstadt, DE|49.676|9.004
Metzingen, DE|48.537|9.283
Mettmann, DE|51.250|6.975
Meschede, DE|51.350|8.283
Merzig, DE|49.443|6.639
Merseburg, DE|51.355|11.989
Meppen, DE|52.691|7.291
Menden, DE|51.443|7.778
Memmingen, DE|47.984|10.185
Melle, DE|52.202|8.338
Meissen, DE|51.162|13.474
Meiningen, DE|50.568|10.415
Meinerzhagen, DE|51.107|7.648
Meiderich, DE|51.467|6.767
Meerbusch, DE|51.253|6.688
Meerane, DE|50.847|12.465
Meckenheim, DE|50.624|7.029
Mechernich, DE|50.593|6.652
Mayen, DE|50.328|7.223
Marzahn, DE|52.545|13.570
Marsberg, DE|51.462|8.849
Marl, DE|51.657|7.090
Marktredwitz, DE|50.004|12.086
Marktoberdorf, DE|47.780|10.617
Markkleeberg, DE|51.276|12.369
Maerkisches Viertel, DE|52.598|13.358
Marienfelde, DE|52.419|13.367
Mariendorf, DE|52.438|13.381
Marienberg, DE|50.651|13.161
Marburg an der Lahn, DE|50.809|8.771
Marbach am Neckar, DE|48.940|9.260
Mannheim, DE|49.489|8.467
Mainz, DE|49.982|8.280
Maintal, DE|50.150|8.833
Mahlsdorf, DE|52.509|13.614
Magdeburg, DE|52.131|11.632
Luetgendortmund, DE|51.499|7.348
Lusan, DE|50.844|12.065
Lurup, DE|53.593|9.877
Luenen, DE|51.616|7.529
Lueneburg, DE|53.251|10.415
Ludwigshafen am Rhein, DE|49.481|8.446
Ludwigsfelde, DE|52.303|13.254
Ludwigsburg, DE|48.897|9.192
Luedinghausen, DE|51.768|7.444
Luedenscheid, DE|51.220|7.627
Luckenwalde, DE|52.090|13.168
Luebeck, DE|53.869|10.687
Lubnjow, DE|51.862|13.952
Luebbecke, DE|52.307|8.614
Loxstedt, DE|53.471|8.646
Losheim, DE|49.510|6.745
Loschwitz, DE|51.054|13.814
Loerrach, DE|47.615|7.665
Lohr am Main, DE|49.989|9.572
Lohne, DE|52.666|8.238
Loehne, DE|52.188|8.692
Lohmar, DE|50.839|7.214
Loebtau, DE|51.044|13.694
Lobeda, DE|50.896|11.602
Loebau, DE|51.100|14.667
Lippstadt, DE|51.674|8.345
Lingen, DE|52.523|7.326
Lindlar, DE|51.020|7.378
Linden-Nord, DE|52.372|9.707
Linden, DE|52.364|9.712
Lindau, DE|47.546|9.684
Limburg an der Lahn, DE|50.384|8.050
Limbach-Oberfrohna, DE|50.859|12.762
Lilienthal, DE|53.142|8.903
Lichterfelde, DE|52.433|13.308
Lichtenrade, DE|52.398|13.406
Lichtenfels, DE|50.146|11.059
Lichtenberg, DE|52.514|13.500
Leverkusen, DE|51.030|6.984
Leutkirch, DE|47.827|10.021
Leuben, DE|51.011|13.820
Leopoldshohe, DE|52.012|8.698
Leonberg, DE|48.800|9.017
Lennestadt, DE|51.117|8.067
Lengerich, DE|52.187|7.860
Lemgo, DE|52.028|8.899
Leipzig, DE|51.340|12.371
Leinfelden-Echterdingen, DE|48.694|9.168
Leimen, DE|49.347|8.687
Leichlingen, DE|51.106|7.019
Lehrte, DE|52.372|9.979
Leer, DE|53.232|7.461
Lebach, DE|49.411|6.910
Laupheim, DE|48.228|9.879
Lauf an der Pegnitz, DE|49.514|11.282
Lauchhammer, DE|51.488|13.766
Lankwitz, DE|52.436|13.346
Langenhagen, DE|52.442|9.737
Langenfeld, DE|51.108|6.948
Langendreer, DE|51.460|7.326
Langen, DE|53.606|8.595
Langen, DE|49.990|8.669
Landshut, DE|48.530|12.162
Landsberg am Lech, DE|48.048|10.883
Landau in der Pfalz, DE|49.198|8.117
Lampertheim, DE|49.598|8.473
Lahr, DE|48.340|7.869
Lahnstein, DE|50.300|7.617
Lage, DE|51.992|8.793
Laatzen, DE|52.315|9.797
Bad Laasphe, DE|50.931|8.425
Kurten, DE|51.050|7.267
Kuenzelsau, DE|49.282|9.684
Kunzell, DE|50.544|9.718
Kulmbach, DE|50.101|11.450
Kronberg, DE|50.181|8.513
Kronach, DE|50.240|11.333
Kreuztal, DE|50.968|7.988
Kreuzberg, DE|52.500|13.403
Krefeld, DE|51.336|6.554
Koethen, DE|51.752|11.971
Korschenbroich, DE|51.191|6.514
Kornwestheim, DE|48.862|9.186
Korntal, DE|48.832|9.121
Korbach, DE|51.276|8.873
Koepenick, DE|52.446|13.575
Berlin Koepenick, DE|52.443|13.582
Konz, DE|49.700|6.577
Konstanz, DE|47.660|9.176
Koenigs Wusterhausen, DE|52.301|13.633
Koenigswinter, DE|50.677|7.192
Koenigstein im Taunus, DE|50.179|8.471
Koenigslutter am Elm, DE|52.251|10.817
Koenigsbrunn, DE|48.275|10.892
Koeln, DE|50.933|6.950
Kolbermoor, DE|47.850|12.067
Koblenz, DE|50.354|7.579
Klotzsche, DE|51.111|13.769
Klingenstein, DE|48.418|9.908
Kleve, DE|51.788|6.139
Kleinmachnow, DE|52.408|13.225
Kladow, DE|52.454|13.144
Kitzingen, DE|49.740|10.151
Kirchlengern, DE|52.200|8.633
Kirchheim unter Teck, DE|48.647|9.454
Kirchhain, DE|50.827|8.928
Kierspe, DE|51.134|7.591
Kiel, DE|54.321|10.135
Kevelaer, DE|51.582|6.246
Kerpen, DE|50.870|6.697
Kempten (Allgaeu), DE|47.727|10.314
Kempen, DE|51.364|6.419
Kelkheim, DE|50.137|8.450
Kelheim, DE|48.917|11.886
Kehl, DE|48.573|7.815
Kaulsdorf, DE|52.517|13.589
Kaufbeuren, DE|47.882|10.622
Kassel, DE|51.317|9.500
Karow, DE|52.609|13.481
Karlstadt, DE|49.960|9.772
Karlsruhe, DE|49.009|8.404
Karlshorst, DE|52.484|13.532
Karlsfeld, DE|48.227|11.476
Karben, DE|50.230|8.772
Kapellen, DE|51.571|6.367
Kamp-Lintfort, DE|51.505|6.546
Kamenz, DE|51.268|14.094
Kamen, DE|51.592|7.664
Kaltenkirchen, DE|53.832|9.960
Kaiserslautern, DE|49.443|7.772
Kaarst, DE|51.229|6.619
Juelich, DE|50.921|6.363
Juchen, DE|51.100|6.500
Johannisthal, DE|52.447|13.507
Jena, DE|50.929|11.590
Itzehoe, DE|53.921|9.515
Isernhagen Farster Bauerschaft, DE|52.471|9.842
Iserlohn, DE|51.375|7.703
Ingolstadt, DE|48.765|11.424
Ingelheim am Rhein, DE|49.971|8.059
Ilmenau, DE|50.683|10.919
Illingen, DE|49.374|7.048
Illertissen, DE|48.223|10.103
Idstein, DE|50.218|8.267
Idar-Oberstein, DE|49.714|7.308
Ibbenbueren, DE|52.280|7.715
Husum, DE|54.486|9.052
Huerth, DE|50.871|6.868
Huenfeld, DE|50.680|9.767
Hummelsbuettel, DE|53.648|10.041
Humboldtkolonie, DE|50.932|6.995
Hude, DE|53.107|8.468
Hueckeswagen, DE|51.150|7.345
Hueckelhoven, DE|51.056|6.227
Huckarde, DE|51.532|7.415
Hoyerswerda, DE|51.438|14.235
Hoexter, DE|51.775|9.382
Hovelhof, DE|51.817|8.650
Hoerstel, DE|52.298|7.584
Horn, DE|53.554|10.090
Hoerde, DE|51.484|7.500
Horb am Neckar, DE|48.444|8.691
Homburg, DE|49.326|7.339
Holzwickede, DE|51.500|7.633
Holzminden, DE|51.828|9.445
Holzkirchen, DE|47.877|11.702
Hohenstein-Ernstthal, DE|50.801|12.713
Hohen Neuendorf, DE|52.677|13.279
Hofheim am Taunus, DE|50.090|8.449
Hofgeismar, DE|51.496|9.385
Hof, DE|50.313|11.913
Hockenheim, DE|49.323|8.552
Hochheim am Main, DE|50.014|8.352
Hochfeld, DE|51.419|6.755
Hille, DE|52.333|8.750
Hildesheim, DE|52.151|9.951
Hilden, DE|51.168|6.931
Hilchenbach, DE|50.997|8.111
Hiddenhausen, DE|52.167|8.617
Heusweiler, DE|49.336|6.930
Heusenstamm, DE|50.056|8.801
Hettstedt, DE|51.650|11.511
Hessisch Oldendorf, DE|52.173|9.249
Herzogenrath, DE|50.869|6.093
Herzogenaurach, DE|49.568|10.886
Herten, DE|51.596|7.144
Herrenberg, DE|48.595|8.866
Herne, DE|51.539|7.226
Hermsdorf, DE|52.614|13.306
Herford, DE|52.115|8.673
Herdecke, DE|51.400|7.436
Herborn, DE|50.681|8.304
Heppenheim an der Bergstrasse, DE|49.641|8.632
Hennigsdorf, DE|52.636|13.204
Hennef (Sieg), DE|50.776|7.283
Hemmingen, DE|52.314|9.724
Hemer, DE|51.387|7.770
Helmstedt, DE|52.228|11.010
Hellersdorf, DE|52.533|13.609
Heinsberg, DE|51.064|6.100
Heilbad Heiligenstadt, DE|51.378|10.137
Heiligensee, DE|52.614|13.245
Heiligenhaus, DE|51.327|6.971
Heilbronn, DE|49.140|9.221
Heidenheim an der Brenz, DE|48.678|10.152
Heidenau, DE|50.972|13.867
Heidelberg, DE|49.408|8.691
Heide, DE|54.196|9.097
Hechingen, DE|48.351|8.963
Hausbruch, DE|53.474|9.883
Hattingen, DE|51.399|7.186
Hattersheim, DE|50.069|8.486
Hassloch, DE|49.363|8.258
Haselhorst, DE|52.544|13.237
Harvestehude, DE|53.578|9.989
Harsewinkel, DE|51.962|8.228
Harpen, DE|51.498|7.288
Haren, DE|52.793|7.241
Harburg, DE|53.461|9.984
Hannover, DE|52.371|9.733
Hanau am Main, DE|50.134|8.914
Hamminkeln, DE|51.733|6.590
Hamm, DE|53.555|10.057
Hamm, DE|51.680|7.821
Hameln, DE|52.104|9.356
Wandsbek, DE|53.583|10.083
Marienthal, DE|53.567|10.083
Hamburg-Mitte, DE|53.550|10.017
Eimsbuettel, DE|53.574|9.957
Altona, DE|53.550|9.933
Hamburg, DE|53.551|9.993
Halver, DE|51.186|7.498
Haltern am See, DE|51.743|7.182
Halstenbek, DE|53.633|9.839
Halle, DE|52.060|8.361
Halle (Saale), DE|51.482|11.979
Haldensleben I, DE|52.289|11.410
Halberstadt, DE|51.896|11.056
Hakenfelde, DE|52.559|13.208
Haiger, DE|50.742|8.208
Hagen, DE|51.361|7.472
Haar, DE|48.109|11.727
Haan, DE|51.194|7.013
Guetersloh, DE|51.907|8.379
Guestrow, DE|53.797|12.173
Gunzenhausen, DE|49.117|10.760
Guenzburg, DE|48.456|10.277
Gummersbach, DE|51.026|7.565
Guben, DE|51.950|14.706
Gross-Umstadt, DE|49.869|8.932
Grossostheim, DE|49.920|9.076
Gross-Gerau, DE|49.921|8.483
Grossenhain, DE|51.290|13.534
Gronau, DE|52.211|7.022
Grobenzell, DE|48.200|11.367
Grimma, DE|51.234|12.720
Griesheim, DE|49.861|8.572
Grevenbroich, DE|51.091|6.583
Greven, DE|52.094|7.594
Greiz, DE|50.658|12.199
Universitats- und Hansestadt Greifswald, DE|54.089|13.402
Grefrath, DE|51.336|6.341
Goettingen, DE|51.534|9.932
Gotha, DE|50.948|10.702
Goslar, DE|51.904|10.428
Goerlitz, DE|51.155|14.989
Gorbitz, DE|51.045|13.661
Goeppingen, DE|48.704|9.652
Gonsenheim, DE|50.002|8.197
Gohlis, DE|51.366|12.367
Goch, DE|51.679|6.159
Glinde, DE|53.540|10.213
Glauchau, DE|50.820|12.545
Gladbeck, DE|51.571|6.986
Ginsheim-Gustavsburg, DE|49.971|8.345
Gilching, DE|48.108|11.294
Gifhorn, DE|52.479|10.552
Giessen, DE|50.587|8.676
Giengen an der Brenz, DE|48.622|10.243
Gevelsberg, DE|51.320|7.339
Gesundbrunnen, DE|52.550|13.391
Geseke, DE|51.641|8.511
Gescher, DE|51.954|7.005
Gersthofen, DE|48.424|10.873
Germersheim, DE|49.214|8.367
Germering, DE|48.134|11.377
Gerlingen, DE|48.800|9.063
Geretsried, DE|47.858|11.481
Gera, DE|50.880|12.082
Georgsmarienhuette, DE|52.203|8.045
Gelsenkirchen, DE|51.505|7.097
Gelnhausen, DE|50.202|9.187
Geldern, DE|51.519|6.324
Geislingen an der Steige, DE|48.624|9.827
Geilenkirchen, DE|50.967|6.118
Geesthacht, DE|53.437|10.373
Gauting, DE|48.069|11.377
Garmisch-Partenkirchen, DE|47.492|11.096
Garching, DE|48.249|11.651
Garbsen, DE|52.420|9.603
Ganderkesee, DE|53.036|8.545
Gaggenau, DE|48.800|8.333
Fuessen, DE|47.571|10.702
Fuerth, DE|49.476|10.989
Fuerstenwalde, DE|52.361|14.062
Fuerstenfeldbruck, DE|48.179|11.255
Fulda, DE|50.552|9.675
Froendenberg, DE|51.476|7.769
Frohnau, DE|52.633|13.290
Friesoythe, DE|53.020|7.859
Friedrichshain Bezirk, DE|52.516|13.455
Friedrichshagen, DE|52.451|13.625
Friedrichshafen, DE|47.657|9.476
Friedrichsfelde, DE|52.506|13.508
Friedrichsdorf, DE|50.250|8.643
Friedenau, DE|52.471|13.328
Friedberg, DE|50.337|8.756
Friedberg, DE|48.357|10.985
Freudenstadt, DE|48.467|8.414
Freudenberg, DE|50.897|7.874
Freital, DE|51.002|13.649
Freising, DE|48.404|11.749
Freilassing, DE|47.841|12.981
Freiburg, DE|47.996|7.852
Freiberg am Neckar, DE|48.932|9.202
Freiberg, DE|50.911|13.339
Frechen, DE|50.915|6.812
Frankfurt am Main, DE|50.116|8.684
Frankfurt (Oder), DE|52.347|14.551
Frankenthal, DE|49.534|8.354
Frankenberg, DE|51.059|8.801
Forst, DE|51.735|14.640
Forchheim, DE|49.718|11.059
Floersheim, DE|50.013|8.428
Flensburg, DE|54.788|9.437
Fischeln, DE|51.304|6.588
Finsterwalde, DE|51.634|13.707
Stuttgart Feuerbach, DE|48.809|9.157
Fellbach, DE|48.809|9.277
Falkensee, DE|52.560|13.093
Eving, DE|51.552|7.481
Eutin, DE|54.135|10.611
Euskirchen, DE|50.661|6.787
Ettlingen, DE|48.941|8.408
Esslingen, DE|48.740|9.305
Essen, DE|51.457|7.012
Espelkamp, DE|52.381|8.623
Eschweiler, DE|50.819|6.272
Eschwege, DE|51.184|10.053
Eschborn, DE|50.143|8.571
Erwitte, DE|51.613|8.338
Erlangen, DE|49.591|11.008
Erkrath, DE|51.222|6.908
Erkelenz, DE|51.079|6.315
Erfurt, DE|50.977|11.035
Erftstadt, DE|50.815|6.794
Erding, DE|48.306|11.907
Eppingen, DE|49.136|8.912
Eppendorf, DE|53.592|9.988
Eppelborn, DE|49.400|6.967
Ennigerloh, DE|51.838|8.031
Ennepetal, DE|51.298|7.363
Enger, DE|52.141|8.558
Engelskirchen, DE|50.989|7.414
Emsdetten, DE|52.173|7.528
Emmerich, DE|51.839|6.248
Emmendingen, DE|48.121|7.854
Emden, DE|53.366|7.208
Eltville, DE|50.029|8.118
Elsdorf, DE|50.937|6.568
Elmshorn, DE|53.749|9.662
Elmschenhagen, DE|54.289|10.190
Ellwangen, DE|48.962|10.132
Eitorf, DE|50.767|7.450
Eissendorf, DE|53.452|9.951
Eislingen, DE|48.695|9.707
Eisenhuettenstadt, DE|52.150|14.650
Eisenach, DE|50.981|10.315
Einbeck, DE|51.820|9.870
Eilenburg, DE|51.460|12.633
Eilbek, DE|53.568|10.047
Ehingen, DE|48.283|9.727
Eggenstein-Leopoldshafen, DE|49.090|8.399
Edewecht, DE|53.128|7.984
Eckernfoerde, DE|54.469|9.838
Eberswalde, DE|52.835|13.820
Ebersbach an der Fils, DE|48.716|9.524
Eberbach, DE|49.467|8.990
Duesseldorf, DE|51.223|6.779
Dueren, DE|50.804|6.493
Duelmen, DE|51.831|7.281
Duisburg, DE|51.432|6.765
Duderstadt, DE|51.513|10.260
Dresden, DE|51.051|13.738
Drensteinfurt, DE|51.795|7.738
Dreieich, DE|50.020|8.696
Dotzheim, DE|50.074|8.195
Dortmund, DE|51.515|7.466
Dorstfeld, DE|51.501|7.411
Dorsten, DE|51.662|6.965
Dormagen, DE|51.097|6.832
Donauwoerth, DE|48.718|10.779
Donaueschingen, DE|47.955|8.497
Doebeln, DE|51.122|13.110
Ditzingen, DE|48.827|9.067
Dinslaken, DE|51.562|6.743
Dingolfing, DE|48.642|12.493
Dillingen an der Donau, DE|48.582|10.495
Dillingen, DE|49.356|6.728
Dillenburg, DE|50.741|8.287
Dietzenbach, DE|50.010|8.778
Diepholz, DE|52.607|8.370
Dieburg, DE|49.897|8.846
Deutz, DE|50.935|6.975
Detmold, DE|51.939|8.873
Dessau, DE|51.839|12.246
Delmenhorst, DE|53.051|8.631
Delitzsch, DE|51.525|12.343
Delbrueck, DE|51.765|8.562
Deggendorf, DE|48.841|12.961
Datteln, DE|51.656|7.345
Darmstadt, DE|49.872|8.650
Damme, DE|52.521|8.198
Dahlem, DE|52.458|13.287
Dachau, DE|48.260|11.434
Cuxhaven, DE|53.868|8.699
Crimmitschau, DE|50.816|12.390
Crailsheim, DE|49.134|10.072
Cottbus, DE|51.758|14.329
Coswig, DE|51.132|13.583
Coesfeld, DE|51.943|7.168
Coburg, DE|50.259|10.964
Cloppenburg, DE|52.848|8.047
Clausthal-Zellerfeld, DE|51.809|10.338
Chemnitz, DE|50.836|12.929
Charlottenburg, DE|52.517|13.283
Cham, DE|49.226|12.655
Celle, DE|52.623|10.080
Castrop-Rauxel, DE|51.557|7.312
Calw, DE|48.714|8.740
Buxtehude, DE|53.470|9.690
Butzbach, DE|50.434|8.671
Buerstadt, DE|49.643|8.459
Burscheid, DE|51.085|7.114
Burghausen, DE|48.169|12.831
Burgdorf, DE|52.446|10.006
Burg bei Magdeburg, DE|52.272|11.855
Bueren, DE|51.551|8.560
Buende, DE|52.198|8.586
Buehl, DE|48.697|8.135
Buer, DE|51.577|7.052
Buedingen, DE|50.290|9.111
Buckow, DE|52.422|13.436
Bueckeburg, DE|52.261|9.049
Buchholz in der Nordheide, DE|53.330|9.866
Franzoesisch Buchholz, DE|52.602|13.430
Buchen in Odenwald, DE|49.524|9.323
Bruehl, DE|50.829|6.905
Bruggen, DE|51.241|6.184
Bruckmuhl, DE|47.879|11.911
Bruchsal, DE|49.124|8.598
Bruchkoebel, DE|50.179|8.923
Britz, DE|52.443|13.434
Brilon, DE|51.395|8.571
Bretten, DE|49.037|8.707
Bremervoerde, DE|53.485|9.146
Bremerhaven, DE|53.554|8.576
Bremen, DE|53.076|8.807
Braunschweig, DE|52.266|10.527
Brandenburg an der Havel, DE|52.417|12.550
Bramsche, DE|52.408|7.983
Brakel, DE|51.718|9.186
Brake (Unterweser), DE|53.333|8.483
Brackenheim, DE|49.078|9.066
Brackel, DE|51.526|7.544
Bottrop, DE|51.524|6.928
Bothfeld, DE|52.417|9.796
Bornheim, DE|50.763|6.991
Borna, DE|51.124|12.496
Borken, DE|51.844|6.858
Boppard, DE|50.231|7.590
Bonn, DE|50.734|7.095
Bonen, DE|51.600|7.767
Bogenhausen, DE|48.152|11.616
Bockum, DE|51.347|6.616
Bochum, DE|51.482|7.216
Bocholt, DE|51.839|6.615
Boeblingen, DE|48.682|9.012
Bobingen, DE|48.271|10.834
Blomberg, DE|51.943|9.091
Blieskastel, DE|49.237|7.256
Blasewitz, DE|51.053|13.798
Blankenburg, DE|51.790|10.955
Bitterfeld-Wolfen, DE|51.624|12.324
Bingen am Rhein, DE|49.967|7.899
Billstedt, DE|53.550|10.133
Bietigheim-Bissingen, DE|48.944|9.118
Biesdorf, DE|52.509|13.553
Bielefeld, DE|52.033|8.533
Biebrich, DE|50.041|8.249
Biberach an der Riss, DE|48.093|9.791
Bexbach, DE|49.346|7.255
Beverungen, DE|51.668|9.374
Bernburg, DE|51.795|11.740
Bernau bei Berlin, DE|52.680|13.587
Berlin, DE|52.524|13.411
Bergneustadt, DE|51.025|7.656
Bergkamen, DE|51.616|7.645
Bergisch Gladbach, DE|50.986|7.133
Bergheim, DE|50.956|6.640
Bensheim, DE|49.684|8.618
Bendorf, DE|50.423|7.579
Bemerode, DE|52.350|9.833
Bedburg, DE|50.993|6.571
Beckum, DE|51.756|8.041
Beckingen, DE|49.400|6.700
Bayreuth, DE|49.948|11.579
Bautzen, DE|51.180|14.435
Baunatal, DE|51.252|9.407
Baumschulenweg, DE|52.466|13.485
Bassum, DE|52.851|8.728
Bamberg, DE|49.899|10.901
Balingen, DE|48.275|8.855
Baiersbronn, DE|48.503|8.377
Baesweiler, DE|50.910|6.189
Bad Zwischenahn, DE|53.185|8.003
Bad Wildungen, DE|51.120|9.125
Bad Waldsee, DE|47.920|9.755
Bad Vilbel, DE|50.179|8.738
Bad Toelz, DE|47.761|11.559
Bad Soden am Taunus, DE|50.141|8.504
Bad Segeberg, DE|53.938|10.307
Bad Schwartau, DE|53.919|10.697
Bad Salzungen, DE|50.813|10.236
Bad Salzuflen, DE|52.086|8.744
Bad Sackingen, DE|47.554|7.946
Bad Reichenhall, DE|47.729|12.878
Bad Rappenau, DE|49.238|9.102
Bad Pyrmont, DE|51.986|9.252
Bad Oldesloe, DE|53.812|10.374
Bad Oeynhausen, DE|52.207|8.804
Bad Neustadt an der Saale, DE|50.322|10.207
Bad Neuenahr-Ahrweiler, DE|50.543|7.111
Bad Nauheim, DE|50.365|8.739
Bad Muender am Deister, DE|52.196|9.464
Bad Mergentheim, DE|49.492|9.774
Bad Lippspringe, DE|51.783|8.817
Bad Langensalza, DE|51.108|10.646
Bad Kreuznach, DE|49.841|7.867
Bad Kissingen, DE|50.202|10.078
Bad Honnef, DE|50.643|7.228
Bad Homburg vor der Hoehe, DE|50.227|8.618
Bad Hersfeld, DE|50.872|9.709
Bad Harzburg, DE|51.883|10.562
Bad Essen, DE|52.317|8.333
Baden-Baden, DE|48.761|8.240
Bad Duerkheim, DE|49.462|8.172
Bad Driburg, DE|51.733|9.020
Bad Berleburg, DE|51.052|8.392
Bad Bentheim, DE|52.301|7.158
Bad Aibling, DE|47.864|12.011
Backnang, DE|48.947|9.437
Babenhausen, DE|49.965|8.951
Aurich, DE|53.470|7.482
Augsburg, DE|48.372|10.899
Auerbach, DE|50.512|12.401
Aue, DE|50.590|12.707
Attendorn, DE|51.126|7.903
Aschersleben, DE|51.757|11.461
Ascheberg, DE|51.783|7.617
Aschaffenburg, DE|49.977|9.152
Bad Arolsen, DE|51.380|9.014
Arnstadt, DE|50.840|10.952
Arnsberg, DE|51.383|8.083
Arheilgen, DE|49.913|8.657
Apolda, DE|51.026|11.516
Aplerbeck, DE|51.483|7.550
Ansbach, DE|49.305|10.593
Annaberg-Buchholz, DE|50.580|13.006
Angermuende, DE|53.015|13.999
Andernach, DE|50.431|7.404
Amberg, DE|49.443|11.863
Alzey, DE|49.747|8.115
Alzenau in Unterfranken, DE|50.089|9.065
Altglienicke, DE|52.411|13.536
Altenburg, DE|50.988|12.437
Altena, DE|51.295|7.673
Altdorf bei Nuernberg, DE|49.386|11.357
Alsterdorf, DE|53.611|10.013
Alsfeld, DE|50.752|9.271
Alsdorf, DE|50.877|6.164
Alfter, DE|50.733|7.017
Alfeld, DE|51.984|9.820
Albstadt, DE|48.216|9.026
Aichach, DE|48.458|11.134
Ahrensburg, DE|53.677|10.237
Ahlen, DE|51.763|7.889
Ahaus, DE|52.079|7.013
Adlershof, DE|52.435|13.548
Achim, DE|53.014|9.026
Achern, DE|48.631|8.076
Aalen, DE|48.838|10.093
Neukirchen-Vluyn, DE|51.447|6.552
Vellmar, DE|51.358|9.480
Aachen, DE|50.777|6.083
Moerfelden-Walldorf, DE|49.995|8.584
Riedstadt, DE|49.834|8.496
Lauda-Konigshofen, DE|49.565|9.708
Filderstadt, DE|48.657|9.220
Ostfildern, DE|48.727|9.250
Rodgau, DE|50.026|8.886
Gropiusstadt, DE|52.427|13.461
Seeheim-Jugenheim, DE|49.765|8.652
Bonn Hardtberg, DE|50.704|7.054
Charlottenburg-Nord, DE|52.533|13.295
Mitte, DE|52.520|13.405
Rheinstetten, DE|48.968|8.307
Suedstadt, DE|52.360|9.751
Altstadt Sud, DE|50.933|6.960
Altstadt Nord, DE|50.939|6.958
Neuehrenfeld, DE|50.958|6.936
Bilderstoeckchen, DE|50.970|6.930
Stuttgart-Ost, DE|48.784|9.210
St. Pauli, DE|53.557|9.964
Gallus, DE|50.100|8.630
Eidelstedt, DE|53.607|9.905
Eisleben Lutherstadt, DE|51.528|11.548
Halle-Neustadt, DE|51.479|11.916
Bergedorf, DE|53.485|10.229
Spandau, DE|52.551|13.199
Treptow, DE|52.494|13.445
Niederrad, DE|50.083|8.629
Wittenberg, DE|51.866|12.650
AEussere Neustadt, DE|51.069|13.756
Barmbek-Nord, DE|53.605|10.040
Barmbek-Sued, DE|53.580|10.041
Farmsen-Berne, DE|53.606|10.120
Zeulenroda-Triebes, DE|50.650|11.984
Falkenhagener Feld, DE|52.552|13.168
Neu-Hohenschoenhausen, DE|52.567|13.513
Alt-Hohenschoenhausen, DE|52.546|13.501
Fennpfuhl, DE|52.529|13.473
Hamburg-Nord, DE|53.589|9.984
Neustadt/Nord, DE|50.949|6.948
Neustadt/Sued, DE|50.925|6.948
Kalk, DE|50.940|7.006
Rodenkirchen, DE|50.893|6.995
Muelheim, DE|50.966|7.004
Gartenstadt, DE|49.459|8.404
Kroepeliner-Tor-Vorstadt, DE|54.088|12.115
Duesseldorf-Pempelfort, DE|51.238|6.787
Burglesum, DE|53.165|8.689
Nordstadt, DE|52.386|9.716
Eselsberg, DE|48.410|9.951
Altona-Altstadt, DE|53.550|9.947
Altona-Nord, DE|53.563|9.943
Dulsberg, DE|53.584|10.064
Hoheluft-Ost, DE|53.584|9.976
Misburg-Nord, DE|52.397|9.860
Sachsenheim, DE|48.960|9.065
Petershausen-West, DE|47.674|9.178
Kronberg Tal, DE|50.179|8.504
Remseck am Neckar, DE|48.872|9.273
Blankenfelde-Mahlow, DE|52.336|13.413
Tadjoura, DJ|11.788|42.882
Obock, DJ|11.967|43.288
Djibouti, DJ|11.589|43.145
Dikhil, DJ|11.105|42.370
Arta, DJ|11.526|42.852
Ali Sabih, DJ|11.156|42.712
Balbala, DJ|11.562|43.107
Vordingborg, DK|55.008|11.911
Virum, DK|55.795|12.451
Viby, DK|56.123|10.151
Viborg, DK|56.453|9.402
Vejle, DK|55.709|9.536
Vanlose, DK|55.684|12.487
Vallensbaek, DK|55.622|12.385
Valby, DK|55.666|12.514
Tonder, DK|54.933|8.867
Tilst, DK|56.194|10.113
Taastrup, DK|55.650|12.302
Svendborg, DK|55.060|10.607
Stenlose, DK|55.768|12.197
Sonderborg, DK|54.909|9.789
Solrod Strand, DK|55.533|12.222
Slagelse, DK|55.403|11.355
Skive, DK|56.567|9.027
Silkeborg, DK|56.170|9.545
Roskilde, DK|55.642|12.080
Rodovre, DK|55.681|12.454
Ringsted, DK|55.443|11.790
Randers, DK|56.461|10.036
Odense, DK|55.396|10.388
Nykobing Falster, DK|54.769|11.874
Nyborg, DK|55.313|10.790
Naestved, DK|55.230|11.761
Norresundby, DK|57.059|9.923
Middelfart, DK|55.506|9.731
Lillerod, DK|55.875|12.346
Koge, DK|55.458|12.182
Copenhagen, DK|55.676|12.566
Kolding, DK|55.490|9.472
Klinteby Frihed, DK|55.197|11.596
Karlebo, DK|55.919|12.410
Kalundborg, DK|55.680|11.089
Ishoj, DK|55.615|12.352
Hvidovre, DK|55.643|12.477
Horsens, DK|55.861|9.850
Horsholm, DK|55.881|12.501
Holstebro, DK|56.360|8.616
Holbaek, DK|55.718|11.713
Hjorring, DK|57.464|9.982
Hillerod, DK|55.928|12.301
Herning, DK|56.136|8.977
Helsingor, DK|56.036|12.614
Hedensted, DK|55.770|9.701
Hedehusene, DK|55.650|12.198
Haderslev, DK|55.249|9.488
Greve, DK|55.583|12.300
Glostrup, DK|55.667|12.404
Frederikssund, DK|55.840|12.069
Frederikshavn, DK|57.441|10.537
Frederiksberg, DK|55.679|12.535
Fredericia, DK|55.566|9.753
Farum, DK|55.809|12.361
Esbjerg, DK|55.470|8.452
Charlottenlund, DK|55.752|12.575
Brondbyvester, DK|55.645|12.410
Birkerod, DK|55.848|12.428
Ballerup, DK|55.732|12.363
Avedore, DK|55.627|12.456
Arhus, DK|56.157|10.211
Allerod, DK|55.870|12.357
Aalborg, DK|57.048|9.919
Albertslund, DK|55.657|12.364
Aabenraa, DK|55.044|9.417
Indre By, DK|55.678|12.573
Roseau, DM|15.302|-61.388
Villa Francisca, DO|18.483|-69.889
Villa Consuelo, DO|18.483|-69.900
Villa Bisono, DO|19.564|-70.876
Villa Altagracia, DO|18.673|-70.171
Tamboril, DO|19.485|-70.611
Santo Domingo, DO|18.472|-69.892
Santiago de los Caballeros, DO|19.450|-70.691
Santa Cruz de El Seibo, DO|18.765|-69.040
Santa Cruz de Barahona, DO|18.209|-71.101
San Pedro de Macoris, DO|18.454|-69.309
San Juan de la Maguana, DO|18.806|-71.226
San Jose de Ocoa, DO|18.547|-70.507
San Francisco de Macoris, DO|19.294|-70.253
San Fernando de Monte Cristi, DO|19.848|-71.646
Puerto Plata, DO|19.793|-70.688
Salvaleon de Higueey, DO|18.615|-68.708
Salcedo, DO|19.378|-70.417
San Ignacio de Sabaneta, DO|19.478|-71.339
Sabana Grande de Boya, DO|18.945|-69.793
Rio Grande, DO|19.667|-70.767
Quisqueya, DO|18.555|-69.408
Punta Cana, DO|18.582|-68.404
Neiba, DO|18.490|-71.419
Nagua, DO|19.383|-69.847
Monte Plata, DO|18.807|-69.784
Monte Llano, DO|19.735|-70.599
Moca, DO|19.393|-70.523
Mao, DO|19.549|-71.078
Las Matas de Farfan, DO|18.873|-71.517
La Romana, DO|18.423|-68.966
Jarabacoa, DO|19.117|-70.636
Hato Mayor del Rey, DO|18.766|-69.256
Guayacanes, DO|18.425|-69.458
Esperanza, DO|19.585|-70.985
Dajabon, DO|19.548|-71.708
Cristo Rey, DO|18.500|-69.933
Cotui, DO|19.054|-70.151
Constanza, DO|18.909|-70.745
La Vega, DO|19.220|-70.531
Ciudad Nueva, DO|18.467|-69.893
Bonao, DO|18.942|-70.411
Boca Chica, DO|18.450|-69.600
San Cristobal, DO|18.417|-70.107
Bella Vista, DO|18.455|-69.945
Bayaguana, DO|18.750|-69.635
Bani, DO|18.280|-70.332
Bajos de Haina, DO|18.415|-70.033
Azua, DO|18.453|-70.735
Santo Domingo Oeste, DO|18.500|-70.000
Santo Domingo Este, DO|18.485|-69.848
Boumerdas, DZ|36.766|3.477
Zighout Youcef, DZ|36.533|6.712
Zeribet el Oued, DZ|34.683|6.511
Zeralda, DZ|36.712|2.842
Zemoura, DZ|35.723|0.755
Touggourt, DZ|33.111|6.070
Tolga, DZ|34.722|5.378
Tlemcen, DZ|34.878|-1.315
Tizi Rached, DZ|36.672|4.192
Tizi Ouzou, DZ|36.712|4.046
Tizi-n-Tleta, DZ|36.546|4.057
Tizi Gheniff, DZ|36.588|3.774
Tissemsilt, DZ|35.607|1.811
Tirmitine, DZ|36.654|3.981
Tipasa, DZ|36.590|2.449
Tindouf, DZ|27.671|-8.147
Timizart, DZ|36.800|4.267
Timimoun, DZ|29.264|0.236
el hed, DZ|36.650|4.774
Tighenif, DZ|35.417|0.330
Tiaret, DZ|35.371|1.317
Theniet el Had, DZ|35.871|2.028
Thenia, DZ|36.725|3.557
Tenes, DZ|36.511|1.308
Telerghma, DZ|36.117|6.354
Tebessa, DZ|35.404|8.124
Tebesbest, DZ|33.117|6.083
Tazoult-Lambese, DZ|35.482|6.261
Tamanghasset, DZ|22.785|5.523
Tamalous, DZ|36.838|6.640
Taibet, DZ|33.085|6.389
Tadmait, DZ|36.744|3.900
Tadjenanet, DZ|36.121|5.987
Sour el Ghozlane, DZ|36.148|3.691
Souma, DZ|36.518|2.905
Lardjem, DZ|35.749|1.548
Souk Ahras, DZ|36.286|7.951
Sougueur, DZ|35.186|1.496
Skikda, DZ|36.876|6.909
Sig, DZ|35.528|-0.194
Sidi Okba, DZ|34.745|5.898
Sidi Moussa, DZ|36.606|3.088
Sidi Merouane, DZ|36.521|6.261
Sidi Khaled, DZ|34.387|4.988
Sidi ech Chahmi, DZ|35.659|-0.522
Sidi Bel Abbes, DZ|35.190|-0.631
Sidi Amrane, DZ|33.499|6.008
Sidi Akkacha, DZ|36.465|1.303
Sidi Aissa, DZ|35.885|3.772
Sidi Abdelli, DZ|35.069|-1.137
Sfizef, DZ|35.235|-0.244
Setif, DZ|36.191|5.414
Sedrata, DZ|36.129|7.534
Seddouk, DZ|36.547|4.686
Sebdou, DZ|34.637|-1.331
Saoula, DZ|36.705|3.025
Salah Bey, DZ|35.855|5.291
Saida, DZ|34.830|0.152
Rouissat, DZ|31.924|5.350
Rouiba, DZ|36.738|3.281
Rouached, DZ|36.458|6.043
Robbah, DZ|33.280|6.910
Remchi, DZ|35.062|-1.434
Relizane, DZ|35.737|0.556
Reguiba, DZ|33.564|6.703
Reghaia, DZ|36.736|3.340
Reggane, DZ|26.716|0.171
Ras el Oued, DZ|35.944|5.031
Ras el Aioun, DZ|35.674|5.645
Rais Hamidou, DZ|36.817|3.013
Oum el Bouaghi, DZ|35.875|7.114
Ouled Slama Fouaga, DZ|36.548|3.110
Ouled Moussa, DZ|36.684|3.367
Ouled Mimoun, DZ|34.905|-1.034
Ouled Haddaj, DZ|36.715|3.342
Ouled Djellal, DZ|34.430|5.061
Ouenza, DZ|35.953|8.129
Oued Zenati, DZ|36.316|7.164
Oued Sly, DZ|36.101|1.199
Oued Rhiou, DZ|35.961|0.919
Oued Fodda, DZ|36.185|1.533
Oued el Alleug, DZ|36.555|2.790
Oued el Abtal, DZ|35.456|0.688
Ouargla, DZ|31.949|5.325
Oran, DZ|35.699|-0.636
NGaous, DZ|35.555|5.611
Nedroma, DZ|35.014|-1.748
Naciria, DZ|36.746|3.832
MSila, DZ|35.709|4.537
Mouzaia, DZ|36.467|2.690
Mostaganem, DZ|35.931|0.089
Mohammadia, DZ|35.589|0.069
Miliana, DZ|36.306|2.225
Mila, DZ|36.450|6.264
Metlili Chaamba, DZ|32.267|3.633
Messaad, DZ|34.154|3.503
Meskiana, DZ|35.631|7.666
Mers el Kebir, DZ|35.728|-0.708
Merouana, DZ|35.631|5.912
Melouza, DZ|35.980|4.187
Mekla, DZ|36.682|4.264
Mehdia daira de meghila, DZ|35.431|1.757
Megarine, DZ|33.192|6.087
Meftah, DZ|36.620|3.222
Medea, DZ|36.264|2.754
Mecheria, DZ|33.545|-0.281
MDaourouch, DZ|36.078|7.820
Mazouna, DZ|36.122|0.899
Mascara, DZ|35.397|0.140
Mansourah, DZ|36.087|4.452
Mansoura, DZ|34.862|-1.339
Makouda, DZ|36.786|4.063
Maghnia, DZ|34.850|-1.728
LArbaa Nait Irathen, DZ|36.631|4.199
Larbaa, DZ|36.565|3.154
Lakhdaria, DZ|36.565|3.593
Laghouat, DZ|33.800|2.865
Ksar el Boukhari, DZ|35.889|2.749
Ksar Chellala, DZ|35.212|2.319
Kolea, DZ|36.639|2.768
Khenchela, DZ|35.436|7.143
Khemis Miliana, DZ|36.261|2.220
Khemis el Khechna, DZ|36.650|3.331
Kerkera, DZ|36.929|6.586
Kais, DZ|35.495|6.925
Jijel, DZ|36.821|5.764
Djidiouia, DZ|35.930|0.829
Ighram, DZ|36.463|4.505
Hennaya, DZ|34.951|-1.368
Heliopolis, DZ|36.504|7.443
Hassi Messaoud, DZ|31.680|6.073
Assi Bou Nif, DZ|35.692|-0.499
Hassi Bahbah, DZ|35.071|3.030
Hammamet, DZ|35.449|7.952
Hammam Bou Hadjar, DZ|35.379|-0.968
Hamma Bouziane, DZ|36.412|6.596
Hadjout, DZ|36.513|2.414
Guerara, DZ|32.792|4.499
Guemar, DZ|33.485|6.797
Guelma, DZ|36.462|7.426
Grarem, DZ|36.516|6.327
Ghazaouet, DZ|35.096|-1.858
Ghardaia, DZ|32.491|3.673
Gdyel, DZ|35.781|-0.426
Frenda, DZ|35.065|1.049
Freha, DZ|36.752|4.316
Feraoun, DZ|36.560|4.855
Feidh el Botma, DZ|34.500|3.767
Fedj MZala, DZ|36.409|5.945
Es Senia, DZ|35.648|-0.624
En Nedjma, DZ|35.648|-0.570
El Oued, DZ|33.356|6.863
El Milia, DZ|36.755|6.272
El Meghaier, DZ|33.951|5.922
El Malah, DZ|35.391|-1.092
El Kseur, DZ|36.679|4.856
El Khroub, DZ|36.263|6.694
El Kala, DZ|36.896|8.443
El Idrissia, DZ|34.445|2.527
El Hadjira, DZ|32.613|5.513
El Hadjar, DZ|36.804|7.737
El Menia, DZ|30.576|2.884
El Eulma, DZ|36.153|5.690
El Bayadh, DZ|33.683|1.019
El Attaf, DZ|36.224|1.672
Chlef, DZ|36.165|1.335
El Arrouch, DZ|36.653|6.836
El Aouinet, DZ|35.867|7.887
El Amria, DZ|35.524|-1.016
El Affroun, DZ|36.470|2.625
El Achir, DZ|36.064|4.627
El Abiodh Sidi Cheikh, DZ|32.893|0.548
El Abadia, DZ|36.270|1.686
Ech Chettia, DZ|36.196|1.255
Drean, DZ|36.685|7.751
Draa el Mizan, DZ|36.536|3.833
Draa Ben Khedda, DZ|36.734|3.962
Douera, DZ|36.670|2.944
Djelfa, DZ|34.673|3.263
Djamaa, DZ|33.534|5.993
Didouche Mourad, DZ|36.453|6.636
Dellys, DZ|36.917|3.913
Debila, DZ|33.517|6.950
Dar el Beida, DZ|36.713|3.212
Dar Chioukh, DZ|34.896|3.485
Constantine, DZ|36.365|6.615
Chorfa, DZ|36.365|4.326
Chiffa, DZ|36.463|2.739
Chetouane, DZ|34.921|-1.295
Cheria, DZ|35.273|7.752
Cherchell, DZ|36.605|2.191
Cheraga, DZ|36.768|2.959
Chemini, DZ|36.600|4.617
Chellalat el Adhaouara, DZ|35.940|3.416
Chelghoum el Aid, DZ|36.163|6.167
Chebli, DZ|36.577|3.009
Charef, DZ|34.621|2.795
Chabet el Ameur, DZ|36.637|3.695
Brezina, DZ|33.099|1.261
Bou Tlelis, DZ|35.573|-0.900
Bou Saada, DZ|35.209|4.174
Boumahra Ahmed, DZ|36.458|7.514
Boukadir, DZ|36.066|1.126
Bou Ismail, DZ|36.643|2.690
Bouira, DZ|36.375|3.902
Bouinan, DZ|36.532|2.992
Bou Hanifia el Hamamat, DZ|35.315|-0.050
Bou Hadjar, DZ|36.504|8.107
Bougara, DZ|36.542|3.081
Bougaa, DZ|36.333|5.088
Boufarik, DZ|36.574|2.912
Boudouaou, DZ|36.727|3.410
Boudjima, DZ|36.802|4.152
Bou Arfa, DZ|36.463|2.815
Bordj Zemoura, DZ|36.275|4.857
Bordj Menaiel, DZ|36.743|3.717
Bordj Ghdir, DZ|35.901|4.898
Bordj el Kiffan, DZ|36.749|3.192
Bordj el Bahri, DZ|36.791|3.250
Bordj Bou Arreridj, DZ|36.074|4.761
Boghni, DZ|36.542|3.953
Blida, DZ|36.470|2.828
Biskra, DZ|34.850|5.728
Birkhadem, DZ|36.715|3.050
Birine, DZ|35.635|3.225
Bir el Djir, DZ|35.720|-0.545
Bir el Ater, DZ|34.745|8.060
Besbes, DZ|36.702|7.847
Berrouaghia, DZ|36.135|2.911
Berriane, DZ|32.826|3.767
Berrahal, DZ|36.835|7.453
Bensekrane, DZ|35.075|-1.224
Ben Mehidi, DZ|36.770|7.906
Beni Tamou, DZ|36.538|2.822
Beni Saf, DZ|35.301|-1.382
Beni Mester, DZ|34.870|-1.423
Beni Mered, DZ|36.524|2.861
Beni Douala, DZ|36.620|4.083
Beni Amrane, DZ|36.668|3.591
Bejaia, DZ|36.756|5.084
Bechar, DZ|31.617|-2.217
Batna, DZ|35.556|6.174
Barika, DZ|35.389|5.366
Barbacha, DZ|36.567|4.967
Baraki, DZ|36.667|3.096
Bab Ezzouar, DZ|36.726|3.183
Azzaba, DZ|36.739|7.105
Azazga, DZ|36.745|4.372
Arzew, DZ|35.850|-0.318
Arris, DZ|35.259|6.347
Arhribs, DZ|36.794|4.312
Arbatache, DZ|36.638|3.371
Aoulef, DZ|26.967|1.083
Annaba, DZ|36.900|7.767
Ammi Moussa, DZ|35.868|1.111
Amizour, DZ|36.640|4.901
Algiers, DZ|36.732|3.087
Akbou, DZ|36.458|4.535
Ain Touta, DZ|35.377|5.900
Ain Temouchent, DZ|35.297|-1.140
Ain Taya, DZ|36.793|3.287
Ain Smara, DZ|36.267|6.501
Ain Sefra, DZ|32.750|-0.583
Ain Oussera, DZ|35.451|2.906
Ain Oulmene, DZ|35.923|5.296
Ain MLila, DZ|36.037|6.572
Ain Merane, DZ|36.163|0.970
Ain Kercha, DZ|35.925|6.695
Ain Fakroun, DZ|35.971|6.874
Ain el Turk, DZ|35.744|-0.769
Ain el Melh, DZ|34.841|4.164
Ain el Hammam, DZ|36.565|4.306
Ain el Hadjel, DZ|35.670|3.882
Ain el Bya, DZ|35.804|-0.302
Ain el Berd, DZ|35.364|-0.513
Ain el Bell, DZ|34.344|3.225
Ain Deheb, DZ|34.842|1.547
Ain Defla, DZ|36.264|1.968
Ain Bessem, DZ|36.293|3.673
Ain Benian, DZ|36.803|2.922
Ain Beida, DZ|35.796|7.393
Ain Azel, DZ|35.818|5.511
Ain Arnat, DZ|36.187|5.313
Ain Abid, DZ|36.232|6.943
Ahmed Bel Hadj, DZ|36.801|7.608
Aflou, DZ|34.113|2.102
Adrar, DZ|27.874|-0.294
Abou el Hassan, DZ|36.417|1.196
Babor, DZ|36.490|5.539
In Salah, DZ|27.197|2.479
Ali Mendjeli, DZ|36.246|6.567
District of Taher, DZ|36.772|5.898
Collo, DZ|37.006|6.560
Maatkas, DZ|36.605|3.984
Sidi Amar, DZ|36.820|7.716
Zamora, EC|-4.064|-78.951
Yaguachi Nuevo, EC|-2.098|-79.693
Vinces, EC|-1.556|-79.752
Ventanas, EC|-1.443|-79.463
El Empalme, EC|-1.045|-79.638
Valencia, EC|-0.953|-79.355
Tulcan, EC|0.812|-77.717
Tena, EC|-0.996|-77.813
Sucre, EC|-1.280|-80.418
Santo Domingo de los Colorados, EC|-0.254|-79.176
Santa Rosa, EC|-3.456|-79.964
Santa Elena, EC|-2.227|-80.858
San Lorenzo de Esmeraldas, EC|1.286|-78.835
Samborondon, EC|-1.961|-79.726
Salinas, EC|-2.215|-80.952
Rosa Zarate, EC|0.328|-79.474
Riobamba, EC|-1.665|-78.659
Quito, EC|-0.230|-78.525
Quevedo, EC|-1.029|-79.463
Puyo, EC|-1.492|-78.003
Pujili, EC|-0.958|-78.696
Puerto Francisco de Orellana, EC|-0.450|-76.997
Posorja, EC|-2.709|-80.247
Portoviejo, EC|-1.058|-80.451
Pomasqui, EC|-0.054|-78.454
Playas, EC|-2.632|-80.388
Pinas, EC|-3.680|-79.682
Pelileo, EC|-1.331|-78.545
Pedro Carbo, EC|-1.816|-80.234
Pasaje, EC|-3.326|-79.807
Otavalo, EC|0.235|-78.262
Naranjito, EC|-2.171|-79.465
Naranjal, EC|-2.676|-79.617
Montecristi, EC|-1.046|-80.659
Montalvo, EC|-1.790|-79.288
Milagro, EC|-2.134|-79.593
Manta, EC|-0.949|-80.731
Machala, EC|-3.259|-79.959
Machachi, EC|-0.513|-78.571
Macas, EC|-2.307|-78.120
Loja, EC|-3.993|-79.204
La Troncal, EC|-2.425|-79.342
Latacunga, EC|-0.934|-78.615
La Mana, EC|-0.941|-79.227
La Libertad, EC|-2.233|-80.910
Nueva Loja, EC|0.086|-76.895
Jipijapa, EC|-1.348|-80.579
Ibarra, EC|0.349|-78.125
Huaquillas, EC|-3.475|-80.231
Guayaquil, EC|-2.196|-79.886
Guaranda, EC|-1.591|-78.999
Gualaceo, EC|-2.894|-78.779
Guabo, EC|-3.244|-79.829
Esmeraldas, EC|0.959|-79.654
El Triunfo, EC|-1.933|-79.967
Eloy Alfaro, EC|-2.169|-79.840
Daule, EC|-1.860|-79.977
Cuenca, EC|-2.895|-78.996
Chone, EC|-0.699|-80.093
Cayambe, EC|0.041|-78.146
Catamayo, EC|-3.987|-79.358
Cariamanga, EC|-4.328|-79.556
Calceta, EC|-0.846|-80.164
Boca Suno, EC|-0.698|-77.141
Balzar, EC|-1.366|-79.905
Bahia de Caraquez, EC|-0.600|-80.424
Babahoyo, EC|-1.805|-79.525
Azogues, EC|-2.740|-78.846
Atuntaqui, EC|0.328|-78.219
Arenillas, EC|-3.554|-80.067
Ambato, EC|-1.249|-78.617
Viljandi, EE|58.363|25.592
Tartu, EE|58.381|26.725
Tallinn, EE|59.437|24.754
Pirita, EE|59.469|24.838
Paernu, EE|58.386|24.497
Nomme, EE|59.378|24.686
Narva, EE|59.377|28.190
Maardu, EE|59.465|24.982
Lasnamaee, EE|59.434|24.860
Kohtla-Jaerve, EE|59.399|27.273
Mustamaee, EE|59.405|24.681
Kesklinn, EE|59.435|24.757
Haabersti, EE|59.423|24.647
Kristiine, EE|59.415|24.709
Pohja-Tallinn, EE|59.449|24.698
Zefta, EG|30.714|31.244
Zaafarana, EG|29.110|32.660
Tukh, EG|30.355|31.201
Timayy al Imdid, EG|30.944|31.529
Tima, EG|26.908|31.435
Tud, EG|25.583|32.533
Tanta, EG|30.788|31.002
Tamiyah, EG|29.476|30.961
Talkha, EG|31.054|31.378
Tala, EG|30.680|30.944
Tahta, EG|26.769|31.502
Sumusta as Sultani, EG|28.917|30.850
Sumusta al Waqf, EG|28.921|30.854
Sohag, EG|26.557|31.695
Siwah, EG|29.203|25.520
Sirs al Layyanah, EG|30.443|30.970
Sinnuris, EG|29.413|30.866
Sidi Salim, EG|31.271|30.786
Sidi Ghazi, EG|31.211|31.051
Sidi Barani, EG|31.612|25.925
Sidfa, EG|26.966|31.380
Shubrakhit, EG|31.028|30.715
Shubra al Khaymah, EG|30.125|31.251
Shirbin, EG|31.197|31.524
Shibin al Qanatir, EG|30.313|31.320
Shibin al Kawm, EG|30.553|31.009
Sharm el-Sheikh, EG|27.916|34.330
Saqultah, EG|26.658|31.671
San al Hajar al Qibliyah, EG|30.975|31.872
Samannud, EG|30.962|31.241
Samalut, EG|28.312|30.710
Rosetta, EG|31.400|30.417
Ras Gharib, EG|28.358|33.078
Rafah, EG|31.282|34.239
Quwaysina, EG|30.565|31.158
Qutur, EG|30.972|30.956
Qus, EG|25.915|32.763
Qina, EG|26.164|32.727
Qift, EG|25.998|32.818
Qalyub, EG|30.179|31.206
Qillin, EG|31.047|30.855
Qaha, EG|30.280|31.205
Naqadah, EG|25.901|32.724
Nag Hammadi, EG|26.049|32.241
Nabaruh, EG|31.098|31.303
Mutubas, EG|31.294|30.522
Mut, EG|25.487|28.979
Mit Salsil, EG|31.168|31.801
Mit Ghamr, EG|30.715|31.259
Mit Abu Ghalib, EG|31.288|31.677
Minyat an Nasr, EG|31.126|31.643
Minya al Qamh, EG|30.516|31.346
Munuf, EG|30.466|30.932
Munshaat Abu Umar, EG|30.907|32.023
Matay, EG|28.419|30.779
Mashtul as Suq, EG|30.361|31.378
Marsa Matruh, EG|31.353|27.237
Manshiyat al Qanatir, EG|30.185|31.106
Manfalut, EG|27.313|30.970
Mallawi, EG|27.733|30.841
Mahallat Damanah, EG|31.073|31.495
Maghaghah, EG|28.648|30.841
6th of October City, EG|29.817|31.050
Madinat as Sadat, EG|30.367|30.509
Madinat an Nasr, EG|30.067|31.300
Al Ashir min Ramadan, EG|30.296|31.746
Ash Shaykh Zuwayd, EG|31.216|34.111
Kirdasah, EG|30.031|31.111
Kom Ombo, EG|24.477|32.946
Kawm Hamadah, EG|30.761|30.700
Kafr Shukr, EG|30.550|31.244
Kafr Saqr, EG|30.793|31.626
Kafr Sad, EG|31.356|31.685
Kafr az Zayyat, EG|30.825|30.818
As Salahat, EG|31.002|31.626
Kafr ash Shaykh, EG|31.112|30.940
Kafr al Kurdi, EG|31.168|31.765
Kafr al Battikh, EG|31.404|31.738
Kafr ad Dawwar, EG|31.134|30.130
Juhaynah, EG|26.674|31.497
Girga, EG|26.337|31.893
Jarajus, EG|25.872|32.756
`Izbat al Burj, EG|31.508|31.841
Itay al Barud, EG|30.887|30.667
Itsa, EG|29.238|30.789
Esna, EG|25.293|32.554
Ihnasya al Madinah, EG|29.090|30.943
Ihnasiyah, EG|29.093|31.020
Idku, EG|31.307|30.298
Edfu, EG|24.979|32.877
Ibshaway, EG|29.359|30.681
Halwan, EG|29.841|31.301
Hihya, EG|30.671|31.588
Hawsh Isa, EG|30.913|30.290
Hadaiq al Qubbah, EG|30.088|31.284
Fuwwah, EG|31.204|30.549
Farshut, EG|26.055|32.163
Faraskur, EG|31.330|31.715
Faqus, EG|30.728|31.797
Fayid, EG|30.313|32.309
Damietta, EG|31.416|31.813
Diyarb Najm, EG|30.754|31.440
Disuq, EG|31.133|30.648
Dishna, EG|26.122|32.467
Dikirnis, EG|31.089|31.595
Dayrut, EG|27.556|30.811
Dayr Mawas, EG|27.641|30.850
Daraw, EG|24.408|32.923
Damanhur, EG|31.034|30.468
Bush, EG|29.148|31.127
Port Said, EG|31.265|32.302
Safaga, EG|26.749|33.939
Burj al Arab, EG|30.903|29.553
Bulaq Abu al Ila, EG|30.060|31.231
Biyala, EG|31.174|31.222
Birkat as Sab, EG|30.629|31.082
Bilqas, EG|31.215|31.358
Bilbeis, EG|30.420|31.562
Biba, EG|28.924|30.985
Basyun, EG|30.940|30.813
Bani Ubayd, EG|27.952|30.781
Bani Suwayf, EG|29.074|31.098
Bani Mazar, EG|28.495|30.805
Banha, EG|30.460|31.184
Baltim, EG|31.556|31.089
Az Zayniyah Qibli, EG|25.751|32.678
Zagazig, EG|30.588|31.502
Al Ayn as Sukhnah, EG|29.589|32.336
Awsim, EG|30.123|31.136
El-Tor, EG|28.242|33.622
At Tall al Kabir, EG|30.543|31.785
Atfih, EG|29.407|31.253
Assiut, EG|27.181|31.184
Aswan, EG|24.091|32.899
Suez, EG|29.974|32.526
As Sinbillawayn, EG|30.883|31.463
As Sibaiyah, EG|25.194|32.677
As Sarw, EG|31.239|31.654
As Santah, EG|30.746|31.130
As Sallum, EG|31.554|25.158
As Sahil, EG|27.063|31.344
As Saff, EG|29.565|31.281
Ash Shuhada, EG|30.597|30.899
Ashmun, EG|30.297|30.976
Ar Rahmaniyah, EG|31.105|30.641
Ar Radisiyah Qibli, EG|24.907|32.886
Armant, EG|25.620|32.543
Al Wasitah, EG|29.338|31.206
Al Waqf, EG|26.087|32.423
Luxor, EG|25.699|32.642
Al Qusiyah, EG|27.440|30.817
Al Qusayr, EG|26.106|34.277
Al Qurayn, EG|30.616|31.735
Al Qassasin, EG|30.564|31.934
Al Qantarah, EG|30.857|32.312
Al Qanayat, EG|30.619|31.462
Al Qanatir al Khayriyah, EG|30.193|31.137
Cairo, EG|30.063|31.250
Minya, EG|28.092|30.758
Al Matariyah, EG|31.183|32.031
Al Maraghah, EG|26.700|31.605
Al Manzalah, EG|31.158|31.936
Al Mansurah, EG|31.036|31.381
Al Minshah, EG|26.477|31.804
Al Mahmudiyah, EG|31.184|30.524
Al Mahallah al Kubra, EG|30.971|31.167
Al Khusus, EG|30.153|31.315
Al Kharjah, EG|25.451|30.547
Al Khankah, EG|30.210|31.368
Giza, EG|30.009|31.209
Al Jammaliyah, EG|31.181|31.865
Ismailia, EG|30.604|32.272
Alexandria, EG|31.202|29.916
Al Idwah, EG|28.699|30.767
Al Ibrahimiyah, EG|30.719|31.563
Izbat Ali as Sayyid, EG|31.157|30.148
Al Husayniyah, EG|30.862|31.918
Al Hawamidiyah, EG|29.900|31.250
Al Hamul, EG|31.311|31.148
Al Hammam, EG|30.845|29.388
Hurghada, EG|27.257|33.813
Al Ghanayim, EG|26.875|31.330
Al Fayyum, EG|29.310|30.842
Al Fashn, EG|28.823|30.899
Al Burj, EG|31.582|30.981
Al Bayadiyah, EG|25.665|32.635
Al Bawiti, EG|28.348|28.869
Al Basaliyah Bahri, EG|25.150|32.717
Al Balyana, EG|26.236|32.004
Al Bajur, EG|30.430|31.037
Al Badrashayn, EG|29.850|31.267
Al Badari, EG|26.993|31.416
Al Ayyat, EG|29.620|31.258
Arish, EG|31.132|33.798
Akhmim, EG|26.562|31.746
Aga, EG|30.942|31.290
Ad Dilinjat, EG|30.828|30.536
El Dabaa, EG|31.028|28.445
Abu Tisht, EG|26.120|32.095
Abu Tij, EG|27.045|31.318
Abu Suweir-el-Mahatta, EG|30.570|32.115
Abu Qurqas, EG|27.930|30.838
Abu Qir, EG|31.311|30.061
Abu Kabir, EG|30.725|31.671
Abu Hummus, EG|31.093|30.314
Abu Hammad, EG|30.538|31.679
Abu an Numrus, EG|29.950|31.200
Abu al Matamir, EG|30.910|30.174
Abnub, EG|27.269|31.152
Halaib, EG|22.223|36.647
An Nubariyah, EG|30.669|30.074
Awlad Saqr, EG|30.931|31.699
Bir al Abd, EG|31.019|33.010
Al-Manakh, EG|31.268|32.285
Badr, EG|30.136|31.715
Ar Riyad, EG|31.242|30.945
Az Zarqa, EG|31.209|31.635
Dumyat al Jadidah, EG|31.435|31.675
Badr, EG|30.575|30.711
Bani Suwayf al Jadidah, EG|29.033|31.114
As Salihiyah al Jadidah, EG|30.631|31.939
Burj al Arab al Jadidah, EG|30.885|29.577
Madinat Wadi an Natrun, EG|30.377|30.350
An Nasiriyah, EG|27.206|31.196
Dar as Salam, EG|26.278|32.056
Ain Sukhna, EG|29.600|32.317
New Cairo, EG|30.030|31.470
El Shorouk, EG|30.138|31.616
Al Qahirah al Jadidah, EG|30.042|31.444
At Tarif, EG|25.738|32.637
Bur Fuad, EG|31.244|32.320
Al-Ubur, EG|30.229|31.481
Al-Kharijah, EG|25.250|30.550
Al-Minya al-Jadidah, EG|28.086|30.815
An-Najaylah, EG|31.407|26.583
Ar-Rawdah, EG|31.323|31.761
Ash-Shaykh Zayid, EG|30.020|31.000
Yusuf as-Siddiq, EG|29.385|30.557
New Bani Sewif City, EG|29.036|31.118
Ad-Dawahy, EG|31.244|32.277
Az-Zuhur, EG|31.265|32.264
El Marsa, EH|27.096|-13.416
Laayoune, EH|27.142|-13.188
Boujdour, EH|26.131|-14.485
Dakhla, EH|23.685|-15.958
Massawa, ER|15.608|39.475
Keren, ER|15.778|38.451
Himora, ER|14.304|36.606
Barentu, ER|15.106|37.591
Asmara, ER|15.338|38.932
Assab, ER|13.009|42.739
Afabet, ER|16.188|38.687
Mendefera, ER|14.887|38.815
Zubia, ES|37.119|-3.584
Zafra, ES|38.425|-6.417
Yecla, ES|38.614|-1.115
Yaiza, ES|28.957|-13.765
Villena, ES|38.637|-0.866
Villarrobledo, ES|39.270|-2.601
Vila-real, ES|39.938|-0.101
Villanueva de la Serena, ES|38.977|-5.797
Villajoyosa, ES|38.508|-0.233
Vicar, ES|36.832|-2.643
Velez-Malaga, ES|36.781|-4.103
Valencia, ES|39.474|-0.380
Valdepenas, ES|38.762|-3.385
Utrera, ES|37.185|-5.781
Ubrique, ES|36.678|-5.446
Ubeda, ES|38.013|-3.370
Totana, ES|37.769|-1.502
Torrox, ES|36.758|-3.952
Torrevieja, ES|37.979|-0.682
Torre-Pacheco, ES|37.743|-0.954
Torrent, ES|39.437|-0.465
Torremolinos, ES|36.620|-4.500
Torre del Mar, ES|36.742|-4.093
Tomelloso, ES|39.158|-3.022
Tomares, ES|37.373|-6.046
Toledo, ES|39.858|-4.023
Tias, ES|28.961|-13.645
Telde, ES|27.992|-15.419
Teguise, ES|29.060|-13.564
Tarifa, ES|36.014|-5.607
Talavera de la Reina, ES|39.963|-4.831
Tacoronte, ES|28.477|-16.410
Tavernes de la Valldigna, ES|39.072|-0.266
Sueca, ES|39.203|-0.311
Son Rapinya, ES|39.589|2.619
Silla, ES|39.363|-0.412
Sevilla, ES|37.383|-5.973
San Vicent del Raspeig, ES|38.396|-0.525
Santomera, ES|38.061|-1.049
Santa Pola, ES|38.192|-0.566
Santa Lucia, ES|27.912|-15.541
Santafe, ES|37.189|-3.719
Santa Eularia des Riu, ES|38.985|1.534
Santa Cruz de Tenerife, ES|28.468|-16.255
Santa Cruz de la Palma, ES|28.684|-17.764
Santa Brigida, ES|28.032|-15.504
San Roque, ES|36.210|-5.385
San Pedro del Pinatar, ES|37.836|-0.791
San Pedro Alcantara, ES|36.488|-4.991
San Miguel De Abona, ES|28.098|-16.617
Sanlucar de Barrameda, ES|36.778|-6.351
San Juan de Aznalfarache, ES|37.358|-6.037
Sant Joan dAlacant, ES|38.401|-0.436
San Javier, ES|37.806|-0.837
San Isidro, ES|28.076|-16.558
San Fernando, ES|36.476|-6.198
La Laguna, ES|28.485|-16.320
San Bartolome de Tirajana, ES|27.925|-15.573
San Bartolome, ES|29.001|-13.613
Sant Antoni de Portmany, ES|38.981|1.304
Sagunto, ES|39.683|-0.267
Rota, ES|36.624|-6.360
Roquetas de Mar, ES|36.764|-2.615
Ronda, ES|36.742|-5.167
Rojales, ES|38.088|-0.725
Rincon de la Victoria, ES|36.717|-4.276
Ribarroja del Turia, ES|39.546|-0.571
Requena, ES|39.488|-1.100
Realejo Alto, ES|28.376|-16.586
Pucol, ES|39.617|-0.300
Puerto Real, ES|36.528|-6.190
Puertollano, ES|38.687|-4.107
Puerto del Rosario, ES|28.500|-13.863
Puerto de la Cruz, ES|28.417|-16.551
Puente-Genil, ES|37.389|-4.767
La Pobla de Vallbona, ES|39.597|-0.555
Priego de Cordoba, ES|37.438|-4.195
Pozoblanco, ES|38.379|-4.848
Pollenca, ES|39.877|3.016
Pilar de la Horadada, ES|37.866|-0.793
Picassent, ES|39.364|-0.459
Paterna, ES|39.503|-0.441
Palma, ES|39.569|2.650
Palma del Rio, ES|37.700|-5.281
Pajara, ES|28.350|-14.108
Paiporta, ES|39.428|-0.418
Osuna, ES|37.238|-5.103
Orihuela, ES|38.085|-0.944
Ontinyent, ES|38.822|-0.606
Onda, ES|39.965|-0.260
Oliva, ES|38.920|-0.119
Novelda, ES|38.385|-0.768
Nijar, ES|36.967|-2.206
Nerja, ES|36.753|-3.874
Navalmoral de la Mata, ES|39.892|-5.541
Murcia, ES|37.987|-1.130
Mula, ES|38.041|-1.490
Mutxamel, ES|38.416|-0.445
Motril, ES|36.751|-3.518
Moron de la Frontera, ES|37.121|-5.454
Montilla, ES|37.586|-4.638
Montijo, ES|38.908|-6.618
Moncada, ES|39.546|-0.396
Molina de Segura, ES|38.055|-1.208
Moguer, ES|37.276|-6.839
Mogan, ES|27.884|-15.725
Mislata, ES|39.475|-0.418
Mijas, ES|36.596|-4.637
Miguelturra, ES|38.964|-3.890
Merida, ES|38.918|-6.343
Melilla, ES|35.294|-2.938
Mazarron, ES|37.599|-1.315
Maspalomas, ES|27.761|-15.586
Massamagrell, ES|39.567|-0.333
Martos, ES|37.721|-3.973
Marratxi, ES|39.621|2.725
Marchena, ES|37.329|-5.417
Marbella, ES|36.515|-4.886
Maracena, ES|37.208|-3.635
Manzanares, ES|38.999|-3.370
Manises, ES|39.491|-0.463
Manacor, ES|39.570|3.210
Malaga, ES|36.720|-4.420
Mairena del Aljarafe, ES|37.345|-6.064
Mairena del Alcor, ES|37.373|-5.750
Mao, ES|39.889|4.266
Lucena, ES|37.409|-4.485
Los Palacios y Villafranca, ES|37.162|-5.924
Los Llanos de Aridane, ES|28.659|-17.918
Los Barrios, ES|36.185|-5.492
Los Alcazares, ES|37.744|-0.850
Lorca, ES|37.671|-1.702
Lora del Rio, ES|37.659|-5.528
Loja, ES|37.169|-4.151
Llucmajor, ES|39.491|2.891
Lliria, ES|39.629|-0.598
Linares, ES|38.095|-3.636
Lepe, ES|37.255|-7.204
Lebrija, ES|36.921|-6.075
La Union, ES|37.619|-0.878
Las Torres de Cotillas, ES|38.028|-1.242
Las Palmas de Gran Canaria, ES|28.102|-15.416
La Solana, ES|38.944|-3.238
Las Cabezas de San Juan, ES|36.984|-5.939
La Roda, ES|39.207|-2.157
La Rinconada, ES|37.486|-5.981
La Orotava, ES|28.391|-16.523
La Oliva, ES|28.611|-13.929
la Nucia, ES|38.614|-0.127
La Linea de la Concepcion, ES|36.168|-5.348
LEliana, ES|39.567|-0.533
La Carolina, ES|38.276|-3.615
La Algaba, ES|37.463|-6.011
Jumilla, ES|38.479|-1.325
Jerez de la Frontera, ES|36.686|-6.136
Javea, ES|38.783|0.167
Xativa, ES|38.990|-0.519
Jaen, ES|37.769|-3.790
Isla Cristina, ES|37.200|-7.317
Ingenio, ES|27.919|-15.434
Inca, ES|39.721|2.911
Icod de los Vinos, ES|28.372|-16.712
Ibiza, ES|38.909|1.433
Ibi, ES|38.625|-0.572
Huercal-Overa, ES|37.389|-1.943
Huelva, ES|37.266|-6.940
Hellin, ES|38.511|-1.701
Guimar, ES|28.311|-16.413
Guia de Isora, ES|28.212|-16.779
Guardamar del Segura, ES|38.090|-0.656
Guadix, ES|37.299|-3.139
Granadilla de Abona, ES|28.119|-16.576
Granada, ES|37.188|-3.607
Gandia, ES|38.967|-0.183
Galdar, ES|28.147|-15.650
Fuengirola, ES|36.540|-4.625
Felanitx, ES|39.470|3.148
Estepona, ES|36.428|-5.146
El Viso del Alcor, ES|37.391|-5.720
El Puerto de Santa Maria, ES|36.594|-6.233
El Palmar, ES|37.939|-1.161
El Grao, ES|39.974|0.013
El Ejido, ES|36.776|-2.815
Elda, ES|38.478|-0.792
Elche, ES|38.262|-0.701
El Arahal, ES|37.263|-5.545
Ecija, ES|37.542|-5.083
Dos Hermanas, ES|37.283|-5.921
Don Benito, ES|38.956|-5.862
Denia, ES|38.841|0.106
Daimiel, ES|39.070|-3.615
Cullera, ES|39.167|-0.250
Quart de Poblet, ES|39.481|-0.439
Crevillente, ES|38.250|-0.810
Coria del Rio, ES|37.288|-6.054
Cordoba, ES|37.892|-4.773
Conil de la Frontera, ES|36.277|-6.088
Coin, ES|36.659|-4.756
Ciudad Real, ES|38.986|-3.929
Cieza, ES|38.240|-1.420
Xirivella, ES|39.466|-0.426
Chipiona, ES|36.737|-6.437
Chiclana de la Frontera, ES|36.420|-6.144
Cehegin, ES|38.092|-1.798
Catarroja, ES|39.400|-0.400
Castilleja de la Cuesta, ES|37.386|-6.053
Castello de la Plana, ES|39.986|-0.049
Cartaya, ES|37.281|-7.151
Cartama, ES|36.711|-4.633
Cartagena, ES|37.602|-0.984
Carrizal, ES|27.912|-15.406
Carmona, ES|37.471|-5.646
Carlet, ES|39.227|-0.521
Carcaixent, ES|39.122|-0.448
Caravaca, ES|38.106|-1.863
Candelaria, ES|28.355|-16.373
Campo de Criptana, ES|39.405|-3.125
Campina, ES|38.219|-2.981
El Campello, ES|38.429|-0.398
Camas, ES|37.402|-6.033
Calvia, ES|39.566|2.506
Calp, ES|38.645|0.044
Callosa de Segura, ES|38.125|-0.878
Cadiz, ES|36.527|-6.289
Caceres, ES|39.476|-6.372
Cabra, ES|37.472|-4.442
Burriana, ES|39.889|-0.085
Burjassot, ES|39.510|-0.413
Bormujos, ES|37.374|-6.072
Betera, ES|39.591|-0.462
Berja, ES|36.847|-2.950
Benidorm, ES|38.538|-0.131
Benetusser, ES|39.423|-0.397
Benalmadena, ES|36.596|-4.573
Baza, ES|37.491|-2.773
Barrio de Peral, ES|37.625|-0.988
Barbate, ES|36.192|-5.922
Bailen, ES|38.096|-3.778
Baeza, ES|37.994|-3.471
Baena, ES|37.617|-4.322
Badajoz, ES|38.878|-6.971
Ayamonte, ES|37.213|-7.408
Atarfe, ES|37.225|-3.687
Atamaria, ES|37.600|-0.807
Aspe, ES|38.345|-0.767
Arucas, ES|28.120|-15.523
Arroyo de la Miel, ES|36.599|-4.535
Arrecife, ES|28.963|-13.548
Arona, ES|28.100|-16.681
Armilla, ES|37.144|-3.625
Arcos de la Frontera, ES|36.751|-5.811
Archena, ES|38.116|-1.300
Antequera, ES|37.019|-4.561
Andujar, ES|38.039|-4.051
Altea, ES|38.599|-0.052
Almunecar, ES|36.732|-3.692
Almoradi, ES|38.109|-0.792
Almonte, ES|37.265|-6.517
Almeria, ES|36.838|-2.460
Almendralejo, ES|38.683|-6.407
Almassora, ES|39.947|-0.063
Almansa, ES|38.869|-1.097
Aljaraque, ES|37.270|-7.023
Alicante, ES|38.345|-0.481
Alhaurin el Grande, ES|36.643|-4.687
Alhaurin de la Torre, ES|36.664|-4.561
Alhama de Murcia, ES|37.851|-1.425
Algemesi, ES|39.190|-0.436
Algeciras, ES|36.133|-5.451
Alfafar, ES|39.417|-0.383
Aldaia, ES|39.466|-0.460
Alcudia, ES|39.853|3.121
Alcoy, ES|38.705|-0.474
Alzira, ES|39.150|-0.433
Alcazar de San Juan, ES|39.390|-3.208
Alcantarilla, ES|37.969|-1.217
Alcala la Real, ES|37.461|-3.923
Alcala de Guadaira, ES|37.338|-5.840
Alboraya, ES|39.500|-0.350
Albolote, ES|37.231|-3.655
Albal, ES|39.400|-0.417
Albacete, ES|38.994|-1.856
Alaquas, ES|39.456|-0.461
Aguimes, ES|27.905|-15.446
Aguilas, ES|37.406|-1.583
Adra, ES|36.748|-3.021
Adeje, ES|28.123|-16.726
Grao de Murviedro, ES|39.642|-0.239
Zarautz, ES|43.284|-2.170
Zaragoza, ES|41.656|-0.877
Zamora, ES|41.506|-5.745
Viveiro, ES|43.662|-7.593
Gasteiz / Vitoria, ES|42.850|-2.673
Vinaros, ES|40.470|0.476
Villaviciosa de Odon, ES|40.358|-3.904
Villaverde, ES|40.350|-3.700
Villaquilambre, ES|42.647|-5.558
Vilanova i la Geltru, ES|41.224|1.725
Villanueva del Pardillo, ES|40.490|-3.964
Villanueva de la Canada, ES|40.447|-4.004
Vilagarcia de Arousa, ES|42.596|-8.764
Vilafranca del Penedes, ES|41.346|1.697
Vila-seca, ES|41.111|1.148
Vilaseca, ES|42.062|2.255
Viladecans, ES|41.314|2.014
Vigo, ES|42.233|-8.723
Vic, ES|41.930|2.255
Vicalvaro, ES|40.400|-3.600
El Vendrell, ES|41.217|1.533
Valls, ES|41.286|1.250
Vallecas, ES|40.383|-3.617
Valladolid, ES|41.655|-4.724
Valdemoro, ES|40.191|-3.679
Rivas-Vaciamadrid, ES|40.326|-3.511
Utebo, ES|41.708|-0.999
Tui, ES|42.047|-8.644
Tudela, ES|42.062|-1.605
Tortosa, ES|40.812|0.522
Torrelodones, ES|40.577|-3.927
Torrelavega, ES|43.349|-4.048
Torrejon de Ardoz, ES|40.455|-3.470
Torredembarra, ES|41.145|1.399
Tordera, ES|41.699|2.719
Tolosa, ES|43.135|-2.078
Tetuan de las Victorias, ES|40.460|-3.697
Teruel, ES|40.346|-1.106
Teo, ES|42.795|-8.548
Tarrega, ES|41.647|1.140
Terrassa, ES|41.567|2.017
Tarragona, ES|41.119|1.245
Tarancon, ES|40.009|-3.007
Soria, ES|41.764|-2.469
Sitges, ES|41.235|1.812
Sestao, ES|43.310|-3.007
Sesena, ES|40.105|-3.698
Segovia, ES|40.948|-4.118
Cerdanyola del Valles, ES|41.491|2.141
Sant Vicenc dels Horts, ES|41.393|2.007
Barakaldo, ES|43.296|-2.988
Santurtzi, ES|43.328|-3.032
Sants, ES|41.374|2.138
Sant Just Desvern, ES|41.384|2.068
Santiago de Compostela, ES|42.881|-8.546
Santa Perpetua de Mogoda, ES|41.533|2.183
Santander, ES|43.466|-3.805
Barbera del Valles, ES|41.516|2.125
Santa Uxia de Ribeira, ES|42.554|-8.991
Santa Coloma de Gramenet, ES|41.452|2.208
San Sebastian de los Reyes, ES|40.556|-3.627
San Sebastian, ES|43.313|-1.975
Sant Quirze del Valles, ES|41.533|2.083
Sant Pere de Ribes, ES|41.260|1.774
San Martin de la Vega, ES|40.207|-3.571
San Lorenzo de El Escorial, ES|40.591|-4.147
Vilassar de Mar, ES|41.505|2.392
Sant Joan Despi, ES|41.367|2.057
Sanxenxo, ES|42.400|-8.807
San Fernando de Henares, ES|40.424|-3.533
Sant Feliu de Llobregat, ES|41.383|2.050
Sant Feliu de Guixols, ES|41.783|3.033
Sant Cugat del Valles, ES|41.471|2.086
Sant Celoni, ES|41.689|2.490
Sant Carles de la Rapita, ES|40.617|0.600
Sant Boi de Llobregat, ES|41.344|2.037
Sant Andreu, ES|41.435|2.190
San Andres del Rabanedo, ES|42.612|-5.617
Sant Andreu de la Barca, ES|41.447|1.972
Sant Adria de Besos, ES|41.431|2.219
Sama, ES|43.296|-5.684
Salt, ES|41.975|2.793
Salou, ES|41.077|1.142
Salamanca, ES|40.969|-5.664
Sabadell, ES|41.543|2.109
Rubi, ES|41.492|2.033
Roses, ES|42.262|3.177
Ripollet, ES|41.497|2.157
Ribeira, ES|42.738|-8.441
Reus, ES|41.156|1.107
Errenteria, ES|43.312|-1.902
Redondela, ES|42.283|-8.610
Puente de Vallecas, ES|40.394|-3.662
Ponteareas, ES|42.175|-8.504
Premia de Mar, ES|41.492|2.365
Pozuelo de Alarcon, ES|40.433|-3.813
Poio, ES|42.448|-8.686
Portugalete, ES|43.321|-3.021
Porrino, ES|42.162|-8.620
Pontevedra, ES|42.431|-8.644
Ponferrada, ES|42.547|-6.596
Plasencia, ES|40.031|-6.088
Pinto, ES|40.241|-3.700
Pineda de Mar, ES|41.628|2.689
Piera, ES|41.522|1.751
Pena Grande, ES|40.475|-3.722
Valdebernardo, ES|40.401|-3.621
Parla, ES|40.236|-3.768
Parets del Valles, ES|41.575|2.233
Pamplona, ES|42.817|-1.643
Palencia, ES|42.010|-4.524
Palamos, ES|41.848|3.129
Palafrugell, ES|41.917|3.163
Oviedo, ES|43.360|-5.845
Oria, ES|43.255|-2.019
Ourense, ES|42.337|-7.864
Olot, ES|42.181|2.490
Olesa de Montserrat, ES|41.544|1.894
Oleiros, ES|43.333|-8.317
Nigran, ES|42.142|-8.807
Navalcarnero, ES|40.289|-4.012
Naron, ES|43.502|-8.191
Mungia, ES|43.355|-2.845
Mostoles, ES|40.322|-3.865
Moratalaz, ES|40.407|-3.649
Monzon, ES|41.911|0.194
Montornes del Valles, ES|41.542|2.267
Monforte de Lemos, ES|42.522|-7.514
Arrasate / Mondragon, ES|43.064|-2.490
Montcada i Reixac, ES|41.483|2.183
Mollet del Valles, ES|41.540|2.213
Molins de Rei, ES|41.417|2.017
Moana, ES|42.278|-8.739
Miranda de Ebro, ES|42.687|-2.947
Mieres, ES|43.250|-5.767
Mejorada del Campo, ES|40.393|-3.482
Medina del Campo, ES|41.312|-4.914
Mataro, ES|41.542|2.445
El Masnou, ES|41.480|2.319
Martorell, ES|41.474|1.931
Marin, ES|42.391|-8.701
Manresa, ES|41.728|1.824
Manlleu, ES|42.002|2.285
Malgrat de Mar, ES|41.647|2.741
Majadahonda, ES|40.474|-3.872
Madrid, ES|40.416|-3.703
Lugo, ES|43.010|-7.556
Logrono, ES|42.466|-2.451
Lloret de Mar, ES|41.700|2.846
Llodio, ES|43.143|-2.962
Lleida, ES|41.617|0.622
Leon, ES|42.600|-5.570
Leioa, ES|43.327|-2.989
Leganes, ES|40.327|-3.764
Las Rozas de Madrid, ES|40.493|-3.874
Lasarte, ES|43.268|-2.022
La Sagrera, ES|41.423|2.186
Sant Pere, Santa Caterina i La Ribera, ES|41.385|2.182
Prosperidad, ES|40.444|-3.669
La Pineda, ES|41.077|1.179
Lalin, ES|42.661|-8.113
Laguna de Duero, ES|41.582|-4.723
La Felguera, ES|43.307|-5.691
A Estrada, ES|42.689|-8.488
A Coruna, ES|43.371|-8.396
Alameda de Osuna, ES|40.452|-3.587
Irun, ES|43.339|-1.789
Illescas, ES|40.122|-3.847
Igualada, ES|41.581|1.617
Humanes de Madrid, ES|40.250|-3.831
Huesca, ES|42.136|-0.409
LHospitalet de Llobregat, ES|41.360|2.100
Hortaleza, ES|40.474|-3.641
Horta, ES|41.436|2.157
Hernani, ES|43.266|-1.976
Gernika-Lumo, ES|43.317|-2.683
Getxo, ES|43.357|-3.011
Guadalajara, ES|40.629|-3.162
Granollers, ES|41.608|2.288
Gracia, ES|41.402|2.156
Gijon, ES|43.536|-5.662
Getafe, ES|40.306|-3.733
Girona, ES|41.983|2.825
Gava, ES|41.306|2.001
Gamonal, ES|42.357|-3.673
Galdakao, ES|43.231|-2.843
Galapagar, ES|40.578|-4.004
Fuenterrabia, ES|43.369|-1.796
Fuenlabrada, ES|40.284|-3.794
Fuencarral, ES|40.500|-3.683
Figueres, ES|42.266|2.962
Esplugues de Llobregat, ES|41.377|2.088
Esparreguera, ES|41.538|1.870
Ermua, ES|43.187|-2.503
Erandio, ES|43.304|-2.974
Entrevias, ES|40.378|-3.674
El Prat de Llobregat, ES|41.328|2.095
El Goloso, ES|40.553|-3.700
Ferrol, ES|43.485|-8.233
El Escorial, ES|40.583|-4.128
Campamento, ES|40.386|-3.798
El Astillero, ES|43.401|-3.821
el Raval, ES|41.380|2.169
Ejea de los Caballeros, ES|42.126|-1.137
Eibar, ES|43.185|-2.472
Durango, ES|43.171|-2.634
Culleredo, ES|43.288|-8.389
Cuenca, ES|40.067|-2.133
Coslada, ES|40.424|-3.561
Cornella de Llobregat, ES|41.350|2.083
Colmenar Viejo, ES|40.659|-3.768
Collado-Villalba, ES|40.635|-4.005
el Clot, ES|41.410|2.191
Ciudad Lineal, ES|40.445|-3.651
Ciutadella, ES|40.001|3.841
Ciempozuelos, ES|40.159|-3.621
Chamartin, ES|40.462|-3.677
Castro-Urdiales, ES|43.383|-3.220
Castelldefels, ES|41.278|1.970
Castellar del Valles, ES|41.617|2.083
Cardedeu, ES|41.640|2.357
Carballo, ES|43.213|-8.691
Canovelles, ES|41.617|2.283
Canillejas, ES|40.448|-3.608
Canillas, ES|40.464|-3.636
Cangas do Morrazo, ES|42.264|-8.785
Cambrils, ES|41.070|1.059
Cambre, ES|43.294|-8.347
Camargo, ES|43.407|-3.885
Calella, ES|41.614|2.654
Caldes de Montbui, ES|41.633|2.167
Calatayud, ES|41.354|-1.643
Calahorra, ES|42.305|-1.965
Calafell, ES|41.200|1.568
Burlata, ES|42.826|-1.617
Burgos, ES|42.341|-3.702
Boiro, ES|42.647|-8.885
Boadilla del Monte, ES|40.405|-3.878
Blanes, ES|41.674|2.790
Bilbao, ES|43.263|-2.925
Bermeo, ES|43.421|-2.722
Berga, ES|42.104|1.846
Benicassim, ES|40.050|0.067
Benicarlo, ES|40.416|0.427
Benavente, ES|42.002|-5.678
Bejar, ES|40.386|-5.763
la Barceloneta, ES|41.380|2.190
Barcelona, ES|41.389|2.159
Barbastro, ES|42.036|0.127
Baranain, ES|42.806|-1.677
Barajas de Madrid, ES|40.474|-3.578
Banyoles, ES|42.117|2.767
Balaguer, ES|41.791|0.811
Badalona, ES|41.450|2.247
Azuqueca de Henares, ES|40.566|-3.268
Aviles, ES|43.555|-5.925
Avila, ES|40.657|-4.700
Arteixo, ES|43.305|-8.507
Arroyomolinos, ES|40.270|-3.919
Arganda, ES|40.301|-3.437
Arenys de Mar, ES|41.582|2.549
Aravaca, ES|40.458|-3.783
Aranjuez, ES|40.031|-3.602
Aranda de Duero, ES|41.670|-3.689
Amposta, ES|40.710|0.579
Amorebieta, ES|43.217|-2.733
Algorta, ES|43.349|-3.009
Algete, ES|40.597|-3.497
Alcorcon, ES|40.346|-3.825
Alcobendas, ES|40.547|-3.642
Alcaniz, ES|41.050|-0.133
Alcala de Henares, ES|40.482|-3.360
Nou Barris, ES|41.442|2.177
Pinar de Chamartin, ES|40.479|-3.668
Playa del Ingles, ES|27.757|-15.579
Puerto del Carmen, ES|28.923|-13.666
Ceuta, ES|35.889|-5.320
Moncloa-Aravaca, ES|40.435|-3.732
Eixample, ES|41.389|2.162
Les Corts, ES|41.387|2.130
Sarria-Sant Gervasi, ES|41.401|2.139
Horta-Guinardo, ES|41.418|2.168
Sants-Montjuic, ES|41.373|2.155
Sant Marti, ES|41.418|2.199
Ciutat Vella, ES|41.380|2.173
Arganzuela, ES|40.400|-3.696
San Blas-Canillejas, ES|40.439|-3.615
Latina, ES|40.389|-3.746
Usera, ES|40.389|-3.700
Salamanca, ES|40.430|-3.680
Chamberi, ES|40.434|-3.704
Carabanchel, ES|40.391|-3.724
Madrid Centro, ES|40.418|-3.703
Retiro, ES|40.413|-3.683
Barri Gotic, ES|41.384|2.176
Lavapies, ES|40.408|-3.701
Cuatro Caminos, ES|40.447|-3.703
El Viso, ES|40.446|-3.684
Poble Sec, ES|41.375|2.163
Hostafrancs, ES|41.377|2.143
La Bordeta, ES|41.369|2.137
La Bonanova, ES|41.406|2.132
Las Tres Torres, ES|41.400|2.129
el Poblenou, ES|41.404|2.204
El Carmel, ES|41.418|2.159
lAlfas del Pi, ES|38.581|-0.103
Las Gabias, ES|37.135|-3.670
Delicias, ES|41.649|-0.908
Almozara, ES|41.661|-0.902
Montecanal, ES|41.630|-0.939
Oliver-Valdefierro, ES|41.645|-0.933
Santutxu, ES|43.253|-2.916
Fort Pienc, ES|41.395|2.179
Dreta de lEixample, ES|41.396|2.167
Vallcarca, ES|41.412|2.144
Sagrada Familia, ES|41.404|2.173
Sant Marti de Provencals, ES|41.420|2.196
Los Realejos, ES|28.385|-16.583
Pasaia, ES|43.325|-1.927
Basauri, ES|43.240|-2.886
Sant Agusti, ES|39.551|2.597
Llefia, ES|41.438|2.220
Centro, ES|28.127|-15.431
Corvera de Asturias, ES|43.536|-5.889
Tres Cantos, ES|40.601|-3.708
Iturrama, ES|42.808|-1.658
Ermitagana, ES|42.811|-1.664
Primer Ensanche, ES|42.815|-1.649
Segundo Ensanche, ES|42.814|-1.643
Fuencarral-El Pardo, ES|40.498|-3.731
Villa de Vallecas, ES|40.367|-3.601
Natahoyo, ES|43.540|-5.682
Sarria, ES|41.403|2.116
lAntiga Esquerra de lEixample, ES|41.389|2.155
el Baix Guinardo, ES|41.412|2.168
la Prosperitat, ES|41.443|2.182
el Putxet i el Farro, ES|41.407|2.144
Provenals del Poblenou, ES|41.411|2.203
Sant Antoni, ES|41.379|2.159
la Vila de Gracia, ES|41.403|2.157
la Nova Esquerra de lEixample, ES|41.383|2.149
Porta, ES|41.435|2.179
Sants - Badal, ES|41.375|2.128
la Maternitat i Sant Ramon, ES|41.381|2.117
Sant Gervasi - Galvany, ES|41.398|2.143
el Camp den Grassot i Gracia Nova, ES|41.406|2.165
la Marina de Port, ES|41.360|2.140
Vilapicina i la Torre Llobeta, ES|41.429|2.174
el Camp de lArpa del Clot, ES|41.412|2.182
Navas, ES|41.418|2.186
la Guineueta, ES|41.439|2.169
les Roquetes, ES|41.448|2.175
la Verneda i la Pau, ES|41.424|2.203
el Turo de la Peira, ES|41.432|2.169
el Besos i el Maresme, ES|41.413|2.217
el Guinardo, ES|41.419|2.174
Barri de Sant Andreu, ES|41.437|2.190
Barri de les Corts, ES|41.387|2.135
Almendrales, ES|40.384|-3.699
Justicia, ES|40.424|-3.697
Casco Historico de Vallecas, ES|40.349|-3.616
Castellana, ES|40.434|-3.684
Casco Historico de Vicalvaro, ES|40.392|-3.570
Apostol Santiago, ES|40.476|-3.659
Nino Jesus, ES|40.412|-3.673
Lista, ES|40.432|-3.676
Embajadores, ES|40.409|-3.702
Valdezarza, ES|40.465|-3.717
Nueva Espana, ES|40.463|-3.678
Chopera, ES|40.395|-3.699
Ibiza, ES|40.419|-3.674
Puerta del Angel, ES|40.410|-3.732
Recoletos, ES|40.425|-3.686
Gaztambide, ES|40.435|-3.715
Goya, ES|40.425|-3.674
Fuente del Berro, ES|40.425|-3.664
Arapiles, ES|40.434|-3.708
Imperial, ES|40.406|-3.718
Acacias, ES|40.401|-3.707
Palacio, ES|40.415|-3.714
Universidad, ES|40.426|-3.707
Legazpi, ES|40.389|-3.687
Delicias, ES|40.397|-3.690
Palos de Moguer, ES|40.404|-3.695
Pacifico, ES|40.404|-3.679
Adelfas, ES|40.401|-3.671
Estrella, ES|40.414|-3.666
Guindalera, ES|40.436|-3.667
Ciudad Jardin, ES|40.448|-3.673
Hispanoamerica, ES|40.455|-3.677
Berruguete, ES|40.460|-3.705
Castilla, ES|40.474|-3.680
Bellas Vistas, ES|40.452|-3.708
Castillejos, ES|40.460|-3.694
Almenara, ES|40.471|-3.694
Valdeacederas, ES|40.467|-3.704
Trafalgar, ES|40.433|-3.701
Almagro, ES|40.433|-3.694
Rios Rosas, ES|40.442|-3.698
Vallehermoso, ES|40.443|-3.711
Costillares, ES|40.477|-3.669
Argueelles, ES|40.428|-3.718
Pilar, ES|40.477|-3.710
Lucero, ES|40.402|-3.750
Vista Alegre, ES|40.384|-3.746
Comillas, ES|40.394|-3.712
Opanel, ES|40.390|-3.722
La Paz, ES|40.481|-3.697
Pueblo Nuevo, ES|40.426|-3.635
Concepcion, ES|40.439|-3.649
Valverde, ES|40.500|-3.679
Las Aguilas, ES|40.382|-3.771
Puerta Bonita, ES|40.380|-3.739
Carmenes, ES|40.401|-3.736
Aluche, ES|40.392|-3.757
San Isidro, ES|40.397|-3.728
Mirasierra, ES|40.496|-3.720
Ciudad Universitaria, ES|40.456|-3.738
Numancia, ES|40.400|-3.659
Buenavista, ES|40.367|-3.746
Abrantes, ES|40.379|-3.726
Orcasitas, ES|40.369|-3.712
Quintana, ES|40.437|-3.645
Marroquina, ES|40.411|-3.641
San Fermin, ES|40.371|-3.689
Moscardo, ES|40.389|-3.707
Pradolongo, ES|40.378|-3.707
Portazgo, ES|40.391|-3.648
San Diego, ES|40.390|-3.668
Palomeras Bajas, ES|40.385|-3.659
Palomeras Sureste, ES|40.385|-3.637
Media Legua, ES|40.412|-3.657
Fontarron, ES|40.401|-3.647
Vinateros, ES|40.405|-3.642
Ventas, ES|40.422|-3.647
San Pascual, ES|40.443|-3.653
Piovera, ES|40.456|-3.635
Pinar del Rey, ES|40.472|-3.647
San Cristobal, ES|40.341|-3.688
Los Rosales, ES|40.356|-3.689
Los Angeles, ES|40.356|-3.699
Santa Eugenia, ES|40.383|-3.611
Valdefuentes, ES|40.494|-3.636
Butarque, ES|40.337|-3.676
Simancas, ES|40.435|-3.625
Arcos, ES|40.421|-3.618
Rosas, ES|40.428|-3.594
Rejas, ES|40.445|-3.570
Waal, ET|6.887|46.215
Fadhigaradle, ET|6.176|45.299
Ziway, ET|7.933|38.717
Yirga Chefe, ET|6.167|38.200
Yirga Alem, ET|6.750|38.417
Yabelo, ET|4.883|38.083
Wikro, ET|13.795|39.603
Werota, ET|11.917|37.700
Were Ilu, ET|10.590|39.438
Warder, ET|6.974|45.341
Wenji, ET|8.450|39.283
Wendo, ET|6.600|38.417
Wenago, ET|6.317|38.267
Welkite, ET|8.283|37.783
Welenchiti, ET|8.667|39.433
Weldiya, ET|11.828|39.592
Waka, ET|7.067|37.167
Tulu Bolo, ET|8.667|38.217
Tis Isat, ET|11.483|37.583
Tilili, ET|10.850|37.017
Tikil Dingay, ET|12.984|37.044
Tepi, ET|7.200|35.450
Tarcha Sodo, ET|7.151|37.172
Suntu, ET|8.100|36.950
Sire, ET|8.317|39.483
Shone, ET|7.133|37.950
Sheraro, ET|14.401|37.934
Sheno, ET|9.329|39.293
Shashamane, ET|7.200|38.600
Shambu, ET|9.567|37.100
Shakiso, ET|5.765|38.910
Sendafa, ET|9.152|39.023
Sekota, ET|12.631|39.035
Sebeta, ET|8.917|38.617
Sagure, ET|7.750|39.150
Robit, ET|12.017|39.633
Robit, ET|9.995|39.897
Bale Robe, ET|7.123|40.004
Nekemte, ET|9.083|36.550
Nejo, ET|9.500|35.500
Negele, ET|5.317|39.583
Nefas Mewcha, ET|11.733|38.467
Nazret, ET|8.550|39.267
Mota, ET|11.083|37.867
Mojo, ET|8.587|39.121
Mizan Teferi, ET|6.999|35.589
Mile, ET|11.422|40.763
Mieso, ET|9.235|40.756
Metu, ET|8.300|35.583
Metemma, ET|12.955|36.155
Metahara, ET|8.900|39.917
Mertule Maryam, ET|10.833|38.267
Mersa, ET|11.667|39.650
Merawi, ET|11.417|37.167
Mendi, ET|9.800|35.100
Mena, ET|6.417|39.850
Meki, ET|8.150|38.817
Mekele, ET|13.497|39.475
Mehal Meda, ET|10.312|39.659
Maychew, ET|12.787|39.542
Mambuk, ET|11.283|36.217
Maksenyit, ET|12.383|37.550
Lumame, ET|10.250|37.933
Logiya, ET|11.726|40.980
Leku, ET|6.873|38.444
Lalibela, ET|12.032|39.048
Kuyera, ET|7.300|38.650
Korem, ET|12.506|39.523
Kolito, ET|7.317|38.083
Kola Diba, ET|12.424|37.325
Kofele, ET|7.067|38.783
Kibre Mengist, ET|5.883|38.983
Kemise, ET|10.717|39.870
Kombolcha, ET|11.082|39.743
Kele, ET|6.083|38.033
Kebri Dahar, ET|6.740|44.278
Kachisi, ET|9.600|37.833
Jinka, ET|5.650|36.650
Jimma, ET|7.673|36.834
Jijiga, ET|9.350|42.800
Iteya, ET|8.133|39.233
Inticho, ET|14.279|39.150
Inseno, ET|8.067|38.467
Injibara, ET|11.000|36.917
Inda Silase, ET|14.103|38.283
Indabaguna, ET|13.949|38.184
Idaga Hamus, ET|14.187|39.564
Ibnat, ET|12.133|38.050
Huruta, ET|8.150|39.350
Hosaina, ET|7.550|37.854
Hirna, ET|9.217|41.100
Hayk, ET|11.300|39.683
Hartishek, ET|9.157|43.354
Harar, ET|9.314|42.118
Harbu, ET|10.920|39.787
Hagere Hiywet, ET|8.983|37.850
Hadero, ET|7.200|37.667
El Bahay, ET|6.347|45.478
Gurbete, ET|11.356|36.954
Komtikas, ET|6.958|35.557
Gonder, ET|12.600|37.467
Gode, ET|5.951|43.552
Gobesa, ET|7.617|39.500
Goba, ET|7.017|39.983
Waliso, ET|8.534|37.965
Ghinnir, ET|7.140|40.711
Ginchi, ET|9.033|38.150
Gimja Bet Maryam, ET|10.850|36.883
Gimbicho, ET|7.450|37.633
Gimbi, ET|9.170|35.835
Raqo, ET|6.419|45.853
Gidole, ET|5.650|37.367
Gasuba, ET|6.717|37.567
Genet, ET|9.067|38.500
Gelemso, ET|8.817|40.517
Gedo, ET|9.017|37.450
Gedeb, ET|9.572|43.181
Gebre Guracha, ET|9.800|38.400
Gambela, ET|8.250|34.583
Funyan Bira, ET|9.402|42.318
Finote Selam, ET|10.700|37.267
Filakit, ET|11.667|38.800
Fiche, ET|9.800|38.733
Felege Neway, ET|6.300|36.883
Felana, ET|9.465|42.184
Golwayn, ET|6.507|45.835
Durame, ET|7.233|37.883
Dubti, ET|11.733|41.082
Dolo, ET|13.499|39.637
Dodola, ET|6.983|39.183
Dire Dawa, ET|9.593|41.866
Dila, ET|6.417|38.317
Dibate, ET|10.650|36.217
Dessie, ET|11.133|39.633
Dera, ET|8.400|38.850
Dembi Dolo, ET|8.533|34.800
Dembecha, ET|10.550|37.483
Degeh Bur, ET|8.221|43.557
Deder, ET|9.312|41.443
Bishoftu, ET|8.752|38.978
Debre Tabor, ET|11.850|38.017
Debre Markos, ET|10.350|37.733
Debre Birhan, ET|9.680|39.533
Debark, ET|13.156|37.898
Daye, ET|9.883|38.267
Dangila, ET|11.267|36.833
Dabat, ET|12.984|37.765
Ciro, ET|7.833|38.233
Chinahsen, ET|9.506|42.609
Chiko, ET|6.583|38.333
Sifra, ET|11.605|40.017
Chencha, ET|6.250|37.567
Chelenko, ET|9.397|41.561
Butajira, ET|8.117|38.367
Bure, ET|10.700|37.067
Bonga, ET|7.289|36.242
Boditi, ET|6.967|37.867
Bichena, ET|10.450|38.200
Bale Hawassa, ET|6.919|37.529
Bekoji, ET|7.533|39.250
Bedesa, ET|6.833|38.083
Bedesa, ET|8.900|40.783
Bedele, ET|8.456|36.353
Bati, ET|11.192|40.017
Bambesi, ET|9.750|34.733
Bako, ET|5.783|36.567
Bahir Dar, ET|11.594|37.391
Babile, ET|9.226|42.332
Aykel, ET|12.550|37.067
Ayana, ET|9.883|36.617
Awash, ET|8.994|40.166
Awasa, ET|7.062|38.476
Ataye, ET|10.350|39.936
Asosa, ET|10.067|34.533
Asela, ET|7.950|39.133
Asbe Teferi, ET|9.086|40.867
Asaita, ET|11.568|41.439
Asasa, ET|7.100|39.200
Arerti, ET|13.950|40.667
Areka, ET|7.067|37.700
Arba Minch, ET|6.033|37.550
Arabi, ET|9.963|42.493
Ara Ali, ET|5.967|41.033
Amba Giorgis, ET|12.769|37.624
Alem Tena, ET|8.300|38.950
Alem Ketema, ET|10.083|39.033
Alemaya, ET|9.393|42.010
Alamata, ET|12.416|39.560
Aksum, ET|14.121|38.723
Hagere Maryam, ET|5.634|38.236
Agaro, ET|7.850|36.650
Adwa, ET|14.163|38.899
Adis Zemen, ET|12.117|37.783
Adis Kidame, ET|11.083|36.883
Adis Alem, ET|9.033|38.400
Addis Ababa, ET|9.025|38.747
Adigrat, ET|14.277|39.462
Adet, ET|11.267|37.483
Abomsa, ET|9.983|39.983
Abiy Adi, ET|13.561|38.974
Abderafi, ET|13.733|36.450
Abala, ET|14.233|37.000
Qorof, ET|6.582|46.433
Kahandhale, ET|5.753|45.646
Lasoano, ET|6.255|45.385
Neefkuceliye, ET|6.555|45.390
Yamarugley, ET|6.808|46.085
Samara, ET|11.793|41.006
Sodo, ET|6.860|37.762
Kobo, ET|10.028|39.853
Arsi Negele, ET|7.355|38.675
Digih Habar Es, ET|6.443|45.983
Chagni, ET|10.956|36.505
Shendi, ET|10.641|36.947
Burayu, ET|9.035|38.661
Guder, ET|8.971|37.761
May Cadera, ET|14.073|36.568
Mehoni, ET|12.799|39.644
Shinshicho, ET|7.206|37.778
Wonji, ET|8.454|39.218
Worabe, ET|7.853|38.185
Adebaye, ET|14.202|36.760
Damboya, ET|7.348|37.951
Ginja Bet, ET|10.850|36.893
Gutin, ET|9.566|36.636
Kercha, ET|5.780|38.409
Wacha, ET|7.151|35.817
Wegeda, ET|11.216|38.365
Dimtu, ET|6.930|38.125
Badessa, ET|6.877|37.936
Gununo, ET|6.925|37.653
Tebela, ET|6.706|37.770
Shanto, ET|7.024|37.861
Yloejaervi, FI|61.556|23.596
Ylivieska, FI|64.083|24.550
Vuosaari, FI|60.210|25.142
Vihti, FI|60.417|24.320
Varkaus, FI|62.315|27.873
Vantaa, FI|60.294|25.041
Vammala, FI|61.333|22.900
Valkeakoski, FI|61.264|24.031
Vaasa, FI|63.096|21.616
Tuusula, FI|60.404|25.026
Turku, FI|60.451|22.269
Tornio, FI|65.848|24.147
Tampere, FI|61.499|23.787
Taka-Toeoeloe, FI|60.184|24.919
Siilinjaervi, FI|63.083|27.667
Sibbo, FI|60.378|25.269
Seinaejoki, FI|62.794|22.828
Savonlinna, FI|61.870|28.880
Salo, FI|60.383|23.133
Rovaniemi, FI|66.499|25.689
Riihimaeki, FI|60.738|24.777
Rauma, FI|61.127|21.511
Raseborg, FI|59.977|23.440
Raisio, FI|60.486|22.169
Raahe, FI|64.683|24.483
Pori, FI|61.481|21.785
Pitaejaenmaeki, FI|60.223|24.861
Pirkkala, FI|61.461|23.632
Pieksaemaeki, FI|62.300|27.133
Oulunkylae, FI|60.229|24.964
Oulu, FI|65.012|25.468
Orimattila, FI|60.805|25.730
Nurmijaervi, FI|60.464|24.807
Nokia, FI|61.467|23.500
Naantali, FI|60.467|22.024
Munkkiniemi, FI|60.199|24.878
Mikkeli, FI|61.689|27.272
Mellunkylae, FI|60.234|25.099
Matinkylae, FI|60.159|24.742
Maentsaelae, FI|60.633|25.317
Loimaa, FI|60.850|23.056
Lohja, FI|60.249|24.065
Lieto, FI|60.510|22.462
Leppaevaara, FI|60.213|24.813
Lempaeaelae, FI|61.317|23.750
Lauttasaari, FI|60.159|24.868
Laukaa, FI|62.414|25.952
Lappeenranta, FI|61.059|28.189
Lahti, FI|60.983|25.662
Kirkkonummi, FI|60.124|24.439
Kurikka, FI|62.617|22.417
Kuopio, FI|62.892|27.677
Kouvola, FI|60.867|26.700
Kotka, FI|60.466|26.946
Korsholm, FI|63.114|21.682
Kontiolahti, FI|62.760|29.847
Kokkola, FI|63.838|23.131
Klaukkala, FI|60.382|24.751
Kerava, FI|60.403|25.105
Kemi, FI|65.736|24.564
Kauhava, FI|63.103|23.071
Karhula, FI|60.522|26.931
Kangasala, FI|61.464|24.076
Kallio, FI|60.184|24.950
Kajaani, FI|64.227|27.728
Kaarina, FI|60.407|22.369
Kaarela, FI|60.252|24.881
Jyvaeskylae, FI|62.241|25.721
Joensuu, FI|62.601|29.763
Jaervenpaeae, FI|60.474|25.090
Janakkala, FI|60.900|24.600
Jaemsae, FI|61.864|25.190
Jakobstad, FI|63.675|22.703
Imatra, FI|61.172|28.752
Iisalmi, FI|63.559|27.191
Hyvinge, FI|60.633|24.867
Hollola, FI|61.000|25.500
Hervanta, FI|61.448|23.853
Herttoniemi, FI|60.195|25.035
Helsinki, FI|60.170|24.935
Heinola, FI|61.206|26.038
Haukipudas, FI|65.177|25.352
Hamina, FI|60.570|27.198
Haemeenlinna, FI|60.996|24.464
Haaga, FI|60.221|24.898
Forssa, FI|60.815|23.621
Espoo, FI|60.205|24.652
Laajasalo, FI|60.175|25.031
Porvoo, FI|60.392|25.665
Anjala, FI|60.683|26.833
AEaenekoski, FI|62.600|25.733
Viikki, FI|60.222|25.024
Olari, FI|60.172|24.727
Myyrmaeki, FI|60.267|24.847
Suutarila, FI|60.280|25.018
Suurmetsae, FI|60.270|25.054
Pohjois-Hervanta, FI|61.453|23.847
Espoonlahti, FI|60.151|24.653
Vaestaboland, FI|60.300|22.300
Sastamala, FI|61.349|22.909
Vartiokylae, FI|60.218|25.096
East Helsinki, FI|60.210|25.083
Suva, FJ|-18.137|178.425
Sigatoka, FJ|-18.143|177.507
Nadi, FJ|-17.803|177.416
Lautoka, FJ|-17.617|177.450
Lami, FJ|-18.111|178.409
Labasa, FJ|-16.433|179.365
Nasinu, FJ|-18.071|178.513
Stanley, FK|-51.694|-57.857
Palikir, FM|6.925|158.161
Torshavn, FO|62.010|-6.772
Yerres, FR|48.718|2.493
Wittenheim, FR|47.811|7.328
Wattrelos, FR|50.701|3.218
Wasquehal, FR|50.670|3.134
Voiron, FR|45.365|5.586
Vitry-sur-Seine, FR|48.787|2.403
Vitry-le-Francois, FR|48.725|4.584
Vitrolles, FR|43.460|5.249
Vitre, FR|48.123|-1.210
Viry-Chatillon, FR|48.672|2.393
Viroflay, FR|48.801|2.162
Vincennes, FR|48.849|2.438
Villiers-sur-Marne, FR|48.831|2.548
Villiers-le-Bel, FR|49.009|2.398
Villeurbanne, FR|45.766|4.880
Villers-les-Nancy, FR|48.673|6.153
Villepinte, FR|48.962|2.533
Villeparisis, FR|48.942|2.615
Villeneuve-sur-Lot, FR|44.409|0.704
Villeneuve-Saint-Georges, FR|48.732|2.449
Villeneuve-le-Roi, FR|48.737|2.401
Villeneuve-la-Garenne, FR|48.939|2.315
Villenave-dOrnon, FR|44.779|-0.567
Villemomble, FR|48.883|2.500
Villejuif, FR|48.794|2.360
Villefranche-sur-Saone, FR|45.990|4.720
Villefontaine, FR|45.613|5.151
Vigneux-sur-Seine, FR|48.703|2.414
Vierzon, FR|47.222|2.068
Vienne, FR|45.526|4.875
Vichy, FR|46.127|3.426
Vesoul, FR|47.626|6.143
Vertou, FR|47.169|-1.473
Versailles, FR|48.804|2.134
Verrieres-le-Buisson, FR|48.746|2.268
Vernon, FR|49.093|1.463
Verneuil-sur-Seine, FR|48.974|1.965
Verdun, FR|49.160|5.383
Venissieux, FR|45.697|4.886
Vendome, FR|47.793|1.066
Vence, FR|43.723|7.112
Velizy-Villacoublay, FR|48.782|2.194
Vaureal, FR|49.033|2.033
Vaulx-en-Velin, FR|45.787|4.925
Paris 15 Vaugirard, FR|48.841|2.300
Vanves, FR|48.823|2.290
Vannes, FR|47.657|-2.762
Vandoeuvre-les-Nancy, FR|48.661|6.171
Vallauris, FR|43.578|7.055
Valenciennes, FR|50.359|3.525
Valence, FR|44.926|4.910
Tulle, FR|45.266|1.772
Troyes, FR|48.301|4.085
Tremblay-en-France, FR|48.950|2.568
Trappes, FR|48.774|2.018
Tours, FR|47.395|0.704
Tournefeuille, FR|43.589|1.319
Tourlaville, FR|49.638|-1.566
Tourcoing, FR|50.724|3.161
Toulouse, FR|43.604|1.444
Toulon, FR|43.124|5.928
Toul, FR|48.681|5.891
Torcy, FR|48.851|2.651
Thonon-les-Bains, FR|46.370|6.480
Thionville, FR|49.360|6.160
Thiais, FR|48.765|2.396
Tergnier, FR|49.656|3.301
Paris 03 Temple, FR|48.864|2.361
Taverny, FR|49.025|2.217
Tassin-la-Demi-Lune, FR|45.755|4.788
Tarbes, FR|43.234|0.071
Talence, FR|44.808|-0.589
Suresnes, FR|48.871|2.229
Sucy-en-Brie, FR|48.769|2.535
Strasbourg, FR|48.584|7.746
Stains, FR|48.950|2.383
Sotteville-les-Rouen, FR|49.410|1.090
Sorgues, FR|44.010|4.874
Soisy-sous-Montmorency, FR|48.988|2.302
Soissons, FR|49.382|3.324
Six-Fours-les-Plages, FR|43.092|5.825
Sin-le-Noble, FR|50.362|3.131
Seynod, FR|45.885|6.088
Sevres, FR|48.823|2.218
Sevran, FR|48.945|2.527
Sete, FR|43.403|3.693
Sens, FR|48.197|3.283
Senlis, FR|49.207|2.587
Selestat, FR|48.262|7.449
Sedan, FR|49.702|4.940
Schiltigheim, FR|48.607|7.749
Sceaux, FR|48.776|2.290
Savigny-sur-Orge, FR|48.677|2.348
Savigny-le-Temple, FR|48.574|2.583
Saumur, FR|47.259|-0.078
Sartrouville, FR|48.948|2.192
Sarreguemines, FR|49.110|7.067
Sarcelles, FR|48.997|2.378
Saran, FR|47.950|1.876
Sannois, FR|48.967|2.250
Sanary-sur-Mer, FR|43.120|5.802
Salon-de-Provence, FR|43.642|5.095
Sallanches, FR|45.944|6.632
Saint-Sebastien-sur-Loire, FR|47.208|-1.503
Saint-Raphael, FR|43.423|6.774
Saint-Quentin, FR|49.849|3.288
Saint-Priest, FR|45.697|4.944
Saint-Pol-sur-Mer, FR|51.031|2.340
Saint-Pierre-des-Corps, FR|47.386|0.748
Saint-Ouen-lAumone, FR|49.044|2.121
Saint-Ouen, FR|48.907|2.333
Saint-Omer, FR|50.748|2.261
Saint-Nazaire, FR|47.275|-2.218
Saint-Michel-sur-Orge, FR|48.635|2.308
Saint-Medard-en-Jalles, FR|44.895|-0.718
Saint-Maximin-la-Sainte-Baume, FR|43.448|5.861
Saint-Maur-des-Fosses, FR|48.794|2.493
Saint-Martin-dHeres, FR|45.179|5.763
Saint-Mande, FR|48.839|2.416
Saint-Malo, FR|48.647|-2.009
Saint-Loup, FR|43.278|5.431
Saint-Louis, FR|47.592|7.559
Saint-Lo, FR|49.116|-1.090
Saint-Leu-la-Foret, FR|49.017|2.250
Saint-Leu, FR|46.731|4.501
Saint-Laurent-du-Var, FR|43.673|7.190
Saint-Jean-de-la-Ruelle, FR|47.911|1.865
Saint-Jean-de-Braye, FR|47.913|1.977
Saint-Herblain, FR|47.212|-1.651
Saint-Gratien, FR|48.974|2.287
Saint-Germain-en-Laye, FR|48.896|2.090
Saint-Genis-Laval, FR|45.695|4.793
Saint-Fons, FR|45.709|4.853
Saint-Etienne-du-Rouvray, FR|49.378|1.105
Saint-Etienne, FR|45.434|4.390
Saintes, FR|45.747|-0.635
Sainte-Marguerite, FR|43.262|5.401
Sainte-Genevieve-des-Bois, FR|48.647|2.320
Sainte-Foy-les-Lyon, FR|45.734|4.803
Saint-Egreve, FR|45.233|5.682
Saint-Dizier, FR|48.638|4.949
Saint-Die-des-Vosges, FR|48.284|6.949
Saint-Denis, FR|48.936|2.354
Saint-Cyr-sur-Loire, FR|47.400|0.667
Saint-Cyr-lEcole, FR|48.799|2.068
Saint-Cloud, FR|48.846|2.203
Saint-Chamond, FR|45.476|4.513
Saint-Brieuc, FR|48.515|-2.768
Saint-Avold, FR|49.105|6.704
Saint-Avertin, FR|47.364|0.740
Saint-Amand-les-Eaux, FR|50.447|3.431
Rueil-Malmaison, FR|48.877|2.190
Royan, FR|45.628|-1.032
Rouen, FR|49.443|1.099
Roubaix, FR|50.694|3.175
Rosny-sous-Bois, FR|48.870|2.499
Ronchin, FR|50.599|3.091
Romorantin-Lanthenay, FR|47.367|1.750
Romans-sur-Isere, FR|45.050|5.066
Romainville, FR|48.885|2.435
Roissy-en-Brie, FR|48.792|2.647
Rodez, FR|44.353|2.573
Rochefort, FR|45.943|-0.968
Roanne, FR|46.036|4.068
Ris-Orangis, FR|48.651|2.414
Riom, FR|45.894|3.113
Rillieux-la-Pape, FR|45.817|4.900
Reze, FR|47.191|-1.569
Paris 12 Reuilly, FR|48.841|2.388
Rennes, FR|48.111|-1.674
Reims, FR|49.265|4.029
Rambouillet, FR|48.644|1.830
Quimper, FR|47.996|-4.098
Puteaux, FR|48.883|2.239
Port-de-Bouc, FR|43.407|4.981
Paris 11 Popincourt, FR|48.857|2.380
Pontoise, FR|49.050|2.100
Pontivy, FR|48.068|-2.966
Pontarlier, FR|46.903|6.355
Pont-a-Mousson, FR|48.907|6.056
Poitiers, FR|46.583|0.343
Poissy, FR|48.929|2.050
Ploemeur, FR|47.735|-3.430
Plaisir, FR|48.823|1.954
Plaisance-du-Touch, FR|43.566|1.296
Pierrefitte-sur-Seine, FR|48.967|2.361
Pessac, FR|44.806|-0.632
Pertuis, FR|43.694|5.503
Perpignan, FR|42.698|2.895
Perigueux, FR|45.187|0.714
Pau, FR|43.311|-0.356
Paris 16 Passy, FR|48.864|2.277
Paris, FR|48.853|2.349
Pantin, FR|48.894|2.409
Paris 05 Pantheon, FR|48.845|2.347
Pamiers, FR|43.117|1.611
Palaiseau, FR|48.718|2.250
Paris 07 Palais-Bourbon, FR|48.856|2.321
Ozoir-la-Ferriere, FR|48.767|2.669
Oyonnax, FR|46.259|5.657
Outreau, FR|50.705|1.590
Oullins, FR|45.714|4.808
Osny, FR|49.070|2.063
Orvault, FR|47.271|-1.624
Orsay, FR|48.696|2.187
Orly, FR|48.748|2.393
Orleans, FR|47.902|1.904
Orange, FR|44.138|4.810
Paris 09 Opera, FR|48.872|2.340
Olivet, FR|47.862|1.899
Octeville, FR|49.626|-1.643
Paris 14 Observatoire, FR|48.833|2.326
Noyon, FR|49.583|3.000
Noisy-le-Sec, FR|48.891|2.465
Noisy-le-Grand, FR|48.850|2.563
Noisiel, FR|48.849|2.624
Nogent-sur-Oise, FR|49.272|2.471
Nogent-sur-Marne, FR|48.837|2.483
Niort, FR|46.323|-0.459
Nimes, FR|43.837|4.358
Nice, FR|43.703|7.266
Nevers, FR|46.990|3.159
Neuilly-sur-Seine, FR|48.885|2.270
Neuilly-sur-Marne, FR|48.854|2.549
Neuilly-Plaisance, FR|48.863|2.506
Narbonne, FR|43.184|3.001
Nantes, FR|47.217|-1.553
Nanterre, FR|48.892|2.207
Nancy, FR|48.684|6.185
Muret, FR|43.460|1.325
Mulhouse, FR|47.752|7.329
Moulins, FR|46.565|3.332
Mougins, FR|43.601|6.995
Morsang-sur-Orge, FR|48.662|2.353
Morlaix, FR|48.578|-3.828
Mont-Saint-Aignan, FR|49.463|1.094
Montrouge, FR|48.816|2.314
Montreuil, FR|48.864|2.443
Montpellier, FR|43.611|3.876
Montmorency, FR|48.988|2.343
Montlucon, FR|46.340|2.603
Montivilliers, FR|49.545|0.188
Montigny-les-Metz, FR|49.096|6.153
Montigny-les-Cormeilles, FR|48.982|2.200
Montigny-le-Bretonneux, FR|48.766|2.034
Montgeron, FR|48.705|2.450
Montfermeil, FR|48.898|2.579
Montesson, FR|48.909|2.138
Montereau-Fault-Yonne, FR|48.383|2.950
Montelimar, FR|44.555|4.755
Mont-de-Marsan, FR|43.890|-0.497
Montceau-les-Mines, FR|46.667|4.367
Montbrison, FR|45.608|4.065
Montbeliard, FR|47.510|6.798
Montauban, FR|44.018|1.354
Montargis, FR|47.997|2.733
Mons-en-Baroeul, FR|50.633|3.117
Moissy-Cramayel, FR|48.626|2.601
Mitry-Mory, FR|48.983|2.617
Miramas, FR|43.585|5.003
Millau, FR|44.100|3.078
Meyzieu, FR|45.766|5.003
Meylan, FR|45.210|5.778
Meudon, FR|48.814|2.235
Metz, FR|49.119|6.173
Merignac, FR|44.842|-0.645
Menton, FR|43.776|7.504
Paris 20 Menilmontant, FR|48.865|2.398
Melun, FR|48.546|2.654
Meaux, FR|48.960|2.879
Mazargues, FR|43.246|5.398
Mayenne, FR|48.303|-0.614
Maurepas, FR|48.765|1.929
Mauguio, FR|43.617|4.007
Maubeuge, FR|50.279|3.973
Massy, FR|48.727|2.283
Martigues, FR|43.407|5.055
Marseille, FR|43.297|5.381
Marmande, FR|44.504|0.165
Marly-le-Roi, FR|48.867|2.083
Marignane, FR|43.417|5.215
Marcq-en-Baroeul, FR|50.667|3.083
Mantes-la-Ville, FR|48.974|1.703
Mantes-la-Jolie, FR|48.990|1.717
Manosque, FR|43.829|5.787
Mandelieu-la-Napoule, FR|43.546|6.937
Malakoff, FR|48.820|2.300
Maisons-Laffitte, FR|48.953|2.145
Maisons-Alfort, FR|48.812|2.439
Macon, FR|46.314|4.828
Lyon, FR|45.749|4.848
Paris 06 Luxembourg, FR|48.849|2.330
Luneville, FR|48.593|6.494
Lunel, FR|43.678|4.136
Luce, FR|48.437|1.464
Louviers, FR|49.217|1.167
Lourdes, FR|43.095|-0.046
Lormont, FR|44.877|-0.519
Lorient, FR|47.748|-3.372
Loos, FR|50.610|3.019
Lons-le-Saunier, FR|46.675|5.556
Longjumeau, FR|48.693|2.294
Lomme, FR|50.644|2.987
Lognes, FR|48.835|2.630
Livry-Gargan, FR|48.919|2.543
LIsle-sur-la-Sorgue, FR|43.920|5.051
Lisieux, FR|49.147|0.229
Lingolsheim, FR|48.558|7.683
Limoges, FR|45.834|1.248
Limeil-Brevannes, FR|48.745|2.487
Limay, FR|48.996|1.741
Lille, FR|50.634|3.055
Lievin, FR|50.420|2.781
Libourne, FR|44.914|-0.242
LHay-les-Roses, FR|48.779|2.337
Le Vesinet, FR|48.893|2.133
Levallois-Perret, FR|48.894|2.289
Les Sables-dOlonne, FR|46.497|-1.785
Les Pennes-Mirabeau, FR|43.410|5.308
Les Pavillons-sous-Bois, FR|48.907|2.506
Les Olives, FR|43.324|5.458
Les Mureaux, FR|48.992|1.910
Les Lilas, FR|48.880|2.421
Les Herbiers, FR|46.871|-1.016
Les Clayes-sous-Bois, FR|48.822|1.987
Le Puy-en-Velay, FR|45.044|3.885
Le Pre-Saint-Gervais, FR|48.885|2.404
Le Pontet, FR|43.961|4.860
Le Plessis-Trevise, FR|48.811|2.574
Le Plessis-Robinson, FR|48.789|2.271
Le Petit-Quevilly, FR|49.413|1.062
Le Perreux-sur-Marne, FR|48.850|2.500
Le Pecq, FR|48.893|2.104
Lens, FR|50.433|2.828
Le Mee-sur-Seine, FR|48.532|2.628
Le Mans, FR|48.002|0.203
Le Kremlin-Bicetre, FR|48.815|2.361
Le Havre, FR|49.493|0.108
Le Grand-Quevilly, FR|49.401|1.046
Le Creusot, FR|46.807|4.416
Le Chesnay, FR|48.822|2.122
Le Cannet, FR|43.577|7.019
Le Bouscat, FR|44.865|-0.599
Le Blanc-Mesnil, FR|48.939|2.461
Laxou, FR|48.684|6.149
La Valette-du-Var, FR|43.138|5.983
Laval, FR|48.072|-0.770
Lattes, FR|43.568|3.903
La Teste-de-Buch, FR|44.633|-1.145
La Seyne-sur-Mer, FR|43.103|5.878
La Roche-sur-Yon, FR|46.670|-1.428
La Rochelle, FR|46.163|-1.152
La Pomme, FR|43.290|5.442
Laon, FR|49.563|3.627
Lannion, FR|48.733|-3.457
Lanester, FR|47.763|-3.339
Landerneau, FR|48.452|-4.252
Lambersart, FR|50.650|3.033
La Madeleine, FR|50.646|3.076
Lagny-sur-Marne, FR|48.867|2.717
La Garenne-Colombes, FR|48.905|2.247
La Garde, FR|43.125|6.010
La Fleche, FR|47.698|-0.076
La Crau, FR|43.150|6.074
La Courneuve, FR|48.928|2.396
La Ciotat, FR|43.175|5.604
La Chapelle-sur-Erdre, FR|47.300|-1.552
La Celle-Saint-Cloud, FR|48.850|2.145
Juan-les-Pins, FR|43.569|7.113
Jouy-le-Moutier, FR|49.011|2.040
Joue-les-Tours, FR|47.349|0.665
Joinville-le-Pont, FR|48.825|2.475
Ivry-sur-Seine, FR|48.816|2.385
Istres, FR|43.513|4.987
Issy-les-Moulineaux, FR|48.821|2.277
Issoire, FR|45.544|3.249
Illzach, FR|47.774|7.352
Illkirch-Graffenstaden, FR|48.529|7.715
Hyeres, FR|43.120|6.129
Houilles, FR|48.922|2.193
Paris 04 Hotel-de-Ville, FR|48.860|2.351
Herouville-Saint-Clair, FR|49.211|-0.307
Herblay-sur-Seine, FR|48.990|2.170
Henin-Beaumont, FR|50.414|2.965
Hem, FR|50.653|3.187
Hazebrouck, FR|50.724|2.537
Hayange, FR|49.329|6.063
Hautmont, FR|50.251|3.921
Yutz, FR|49.356|6.193
Haubourdin, FR|50.608|2.991
Halluin, FR|50.786|3.126
Haguenau, FR|48.816|7.791
Guyancourt, FR|48.773|2.074
Gujan-Mestras, FR|44.636|-1.068
Gueret, FR|46.172|1.872
Guerande, FR|47.328|-2.429
Grigny, FR|48.654|2.393
Grenoble, FR|45.179|5.715
Grasse, FR|43.658|6.925
Grande-Synthe, FR|51.015|2.300
Gradignan, FR|44.774|-0.614
Goussainville, FR|49.014|2.466
Gonesse, FR|48.987|2.449
Paris 13 Gobelins, FR|48.832|2.356
Givors, FR|45.591|4.769
Gif-sur-Yvette, FR|48.683|2.133
Gien, FR|47.693|2.631
Gentilly, FR|48.813|2.342
Gennevilliers, FR|48.933|2.300
Garges-les-Gonesse, FR|48.968|2.398
Gardanne, FR|43.455|5.469
Garches, FR|48.842|2.182
Gap, FR|44.559|6.079
Gagny, FR|48.883|2.533
Frontignan, FR|43.448|3.755
Fresnes, FR|48.756|2.322
Frejus, FR|43.433|6.736
Franconville, FR|48.983|2.233
Fougeres, FR|48.352|-1.200
Fos-sur-Mer, FR|43.438|4.945
Forbach, FR|49.188|6.893
Fontenay-sous-Bois, FR|48.854|2.483
Fontenay-le-Comte, FR|46.467|-0.806
Fontenay-aux-Roses, FR|48.793|2.293
Fontainebleau, FR|48.409|2.702
Fontaine, FR|45.193|5.688
Floirac, FR|44.831|-0.527
Fleury-les-Aubrais, FR|47.933|1.918
Flers, FR|48.737|-0.575
Firminy, FR|45.390|4.289
Fecamp, FR|49.758|0.375
Faches-Thumesnil, FR|50.583|3.067
Eysines, FR|44.884|-0.651
Evry, FR|48.633|2.440
Evreux, FR|49.024|1.151
Etampes, FR|48.435|2.162
La Baule-Escoublac, FR|47.292|-2.364
Ermont, FR|48.990|2.258
Eragny, FR|49.017|2.100
Equeurdreville-Hainneville, FR|49.649|-1.653
Epinay-sur-Seine, FR|48.953|2.315
Epinal, FR|48.183|6.453
Epernay, FR|49.040|3.959
Paris 10 Entrepot, FR|48.871|2.356
Paris 08 Elysee, FR|48.876|2.318
Elbeuf, FR|49.287|1.003
Elancourt, FR|48.784|1.955
Ecully, FR|45.774|4.778
Echirolles, FR|45.146|5.714
Eaubonne, FR|48.997|2.282
Dunkirk, FR|51.034|2.377
Dreux, FR|48.736|1.366
Draveil, FR|48.685|2.414
Drancy, FR|48.926|2.445
Draguignan, FR|43.537|6.465
Douarnenez, FR|48.095|-4.329
Douai, FR|50.371|3.079
Domont, FR|49.028|2.326
Dole, FR|47.092|5.490
Dijon, FR|47.313|5.014
Digne-les-Bains, FR|44.093|6.232
Dieppe, FR|49.922|1.078
Deuil-la-Barre, FR|48.977|2.327
Denain, FR|50.329|3.394
Decines-Charpieu, FR|45.769|4.959
Dax, FR|43.710|-1.054
Dammarie-les-Lys, FR|48.517|2.650
Cugnaux, FR|43.536|1.344
Croix, FR|50.678|3.149
Creteil, FR|48.793|2.466
Crepy-en-Valois, FR|49.234|2.888
Creil, FR|49.257|2.485
Cran-Gevrier, FR|45.900|6.100
Cournon-dAuvergne, FR|45.741|3.196
Courbevoie, FR|48.897|2.257
Coulommiers, FR|48.815|3.085
Coueron, FR|47.215|-1.725
Coudekerque-Branche, FR|51.023|2.394
Cormeilles-en-Parisis, FR|48.971|2.205
Corbeil-Essonnes, FR|48.606|2.488
Conflans-Sainte-Honorine, FR|49.002|2.097
Concarneau, FR|47.875|-3.919
Compiegne, FR|49.418|2.826
Combs-la-Ville, FR|48.665|2.570
Pontault-Combault, FR|48.798|2.607
Colomiers, FR|43.611|1.335
Colombes, FR|48.919|2.254
Colmar, FR|48.081|7.356
Cognac, FR|45.696|-0.329
Cluses, FR|46.063|6.575
Clichy-sous-Bois, FR|48.910|2.553
Clichy, FR|48.900|2.310
Clermont-Ferrand, FR|45.780|3.087
Clamart, FR|48.803|2.267
Cholet, FR|47.059|-0.880
Choisy-le-Roi, FR|48.768|2.419
Chilly-Mazarin, FR|48.715|2.316
Chevilly-Larue, FR|48.765|2.350
Cherbourg, FR|49.640|-1.616
Chenove, FR|47.293|5.005
Chennevieres-sur-Marne, FR|48.797|2.540
Chelles, FR|48.881|2.593
Chaville, FR|48.806|2.189
Chaumont, FR|48.111|5.141
Chatou, FR|48.890|2.159
Chatillon, FR|48.802|2.293
Chatenay-Malabry, FR|48.765|2.267
Chatellerault, FR|46.817|0.545
Chateau-Thierry, FR|49.046|3.403
Chateauroux, FR|46.812|1.694
Chateaudun, FR|48.071|1.338
Chartres, FR|48.447|1.489
Charleville-Mezieres, FR|49.769|4.725
Charenton-le-Pont, FR|48.822|2.412
Champs-sur-Marne, FR|48.850|2.600
Champigny-sur-Marne, FR|48.816|2.494
Chambery, FR|45.566|5.921
Chamalieres, FR|45.774|3.067
Chalon-sur-Saone, FR|46.781|4.854
Chalons-en-Champagne, FR|48.954|4.367
Challans, FR|46.846|-1.879
Cestas, FR|44.745|-0.682
Cesson-Sevigne, FR|48.121|-1.603
Cergy, FR|49.036|2.076
Cenon, FR|44.856|-0.534
Cavaillon, FR|43.831|5.036
Castres, FR|43.605|2.241
Castelnau-le-Lez, FR|43.636|3.901
Carvin, FR|50.492|2.958
Carrieres-sous-Poissy, FR|48.950|2.041
Carquefou, FR|47.297|-1.492
Carpentras, FR|44.055|5.048
Carcassonne, FR|43.216|2.349
Canteleu, FR|49.441|1.025
Cannes, FR|43.551|7.013
Cambrai, FR|50.176|3.235
Caluire-et-Cuire, FR|45.795|4.846
Calais, FR|50.952|1.856
Cahors, FR|44.449|1.437
Cagnes-sur-Mer, FR|43.664|7.148
Caen, FR|49.186|-0.359
Cachan, FR|48.796|2.337
Paris 19 Buttes-Chaumont, FR|48.882|2.382
Paris 18 Buttes-Montmartre, FR|48.892|2.344
Bry-sur-Marne, FR|48.838|2.525
Brunoy, FR|48.694|2.492
Bruay-la-Buissiere, FR|50.483|2.550
Bron, FR|45.739|4.913
Brive-la-Gaillarde, FR|45.159|1.533
Brignoles, FR|43.406|6.062
Brie-Comte-Robert, FR|48.692|2.611
Bretigny-sur-Orge, FR|48.611|2.306
Brest, FR|48.390|-4.486
Bressuire, FR|46.842|-0.490
Paris 02 Bourse, FR|48.865|2.343
Bourg-les-Valence, FR|44.947|4.895
Bourg-la-Reine, FR|48.779|2.318
Bourges, FR|47.083|2.400
Bourg-en-Bresse, FR|46.206|5.226
Boulogne-sur-Mer, FR|50.725|1.614
Boulogne-Billancourt, FR|48.835|2.241
Bouguenais, FR|47.179|-1.625
Bordeaux, FR|44.841|-0.580
Bonneuil-sur-Marne, FR|48.770|2.479
Bondy, FR|48.902|2.489
Boissy-Saint-Leger, FR|48.751|2.512
Bois-Colombes, FR|48.919|2.275
Bobigny, FR|48.910|2.450
Blois, FR|47.594|1.329
Blanquefort, FR|44.911|-0.638
Blagnac, FR|43.637|1.390
Bischheim, FR|48.616|7.753
Biarritz, FR|43.481|-1.557
Bezons, FR|48.924|2.213
Beziers, FR|43.341|3.214
Bethune, FR|50.530|2.640
Besancon, FR|47.249|6.018
Bergerac, FR|44.852|0.482
Berck, FR|50.400|1.600
Berck-Plage, FR|50.407|1.564
Belfort, FR|47.642|6.854
Begles, FR|44.808|-0.551
Beauvais, FR|49.433|2.083
Beaune, FR|47.024|4.839
Bayonne, FR|43.493|-1.473
Bayeux, FR|49.277|-0.704
Paris 17 Batignolles-Monceau, FR|48.883|2.322
Bastia, FR|42.702|9.451
Bar-le-Duc, FR|48.773|5.161
Balma, FR|43.611|1.499
Bagnols-sur-Ceze, FR|44.163|4.620
Bagnolet, FR|48.867|2.417
Bagneux, FR|48.796|2.308
Avon, FR|48.402|2.720
Avion, FR|50.410|2.831
Avignon, FR|43.948|4.809
Auxerre, FR|47.800|3.570
Autun, FR|46.951|4.299
Aurillac, FR|44.925|2.440
Aulnay-sous-Bois, FR|48.938|2.494
Audincourt, FR|47.483|6.853
Auch, FR|43.646|0.589
Aubervilliers, FR|48.917|2.383
Aubagne, FR|43.293|5.571
Athis-Mons, FR|48.705|2.391
Asnieres-sur-Seine, FR|48.917|2.283
Arras, FR|50.293|2.782
Armentieres, FR|50.686|2.882
Arles, FR|43.677|4.630
Argenteuil, FR|48.948|2.247
Argentan, FR|48.744|-0.020
Arcueil, FR|48.800|2.333
Antony, FR|48.753|2.297
Antibes, FR|43.581|7.125
Annonay, FR|45.240|4.671
Annemasse, FR|46.194|6.238
Annecy-le-Vieux, FR|45.920|6.144
Annecy, FR|45.909|6.126
Angouleme, FR|45.650|0.153
Anglet, FR|43.489|-1.519
Angers, FR|47.472|-0.552
Amiens, FR|49.900|2.300
Allauch, FR|43.336|5.482
Alfortville, FR|48.806|2.420
Ales, FR|44.125|4.081
Alencon, FR|48.435|0.093
Albi, FR|43.930|2.148
Albertville, FR|45.675|6.391
Ajaccio, FR|41.919|8.738
Aix-les-Bains, FR|45.692|5.909
Aix-en-Provence, FR|43.528|5.450
Agen, FR|44.202|0.621
Agde, FR|43.311|3.476
Acheres, FR|48.961|2.069
Abbeville, FR|50.105|1.835
Paris 01 Louvre, FR|48.859|2.342
Villeneuve-dAscq, FR|50.617|3.167
Lyon 02, FR|45.754|4.831
Lyon 03, FR|45.761|4.852
Lyon 04, FR|45.775|4.827
Lyon 05, FR|45.761|4.827
Lyon 06, FR|45.768|4.851
Lyon 07, FR|45.745|4.842
Lyon 08, FR|45.736|4.869
Lyon 09, FR|45.773|4.803
Les Ulis, FR|48.682|2.169
Lyon 01, FR|45.768|4.835
Marseille 01, FR|43.298|5.384
Marseille 02, FR|43.297|5.370
Marseille 03, FR|43.303|5.376
Marseille 04, FR|43.302|5.401
Marseille 05, FR|43.296|5.401
Marseille 06, FR|43.288|5.379
Marseille 07, FR|43.283|5.360
Marseille 08, FR|43.271|5.382
Marseille 10, FR|43.279|5.415
Marseille 09, FR|43.254|5.406
Marseille 11, FR|43.291|5.438
Marseille 12, FR|43.296|5.436
Marseille 13, FR|43.319|5.408
Marseille 14, FR|43.344|5.380
Marseille 15, FR|43.372|5.354
Marseille 16, FR|43.360|5.334
La Defense, FR|48.892|2.239
Saint-Quentin-en-Yvelines, FR|48.772|2.019
Cergy-Pontoise, FR|49.039|2.078
La Blancarde, FR|43.300|5.406
Le Camas, FR|43.295|5.394
Saint-Barthelemy, FR|43.331|5.402
Marne La Vallee, FR|48.836|2.642
Quinze-Vingts, FR|48.847|2.374
Saint-Roch, FR|43.715|7.292
Les Moulins, FR|43.675|7.205
Picpus, FR|48.843|2.400
Paris 10e Arrondissement, FR|48.877|2.359
Hopital Saint-Louis, FR|48.877|2.367
Porte Saint-Denis, FR|48.874|2.352
Porte Saint-Martin, FR|48.872|2.360
Saint-Vincent de Paul, FR|48.881|2.355
Paris 11e Arrondissement, FR|48.858|2.380
Folie Mericourt, FR|48.866|2.371
Roquette, FR|48.858|2.381
Saint-Ambroise, FR|48.862|2.375
Sainte-Marguerite, FR|48.852|2.389
Paris 12e Arrondissement, FR|48.835|2.435
Bel-Air, FR|48.842|2.405
Paris 13e Arrondissement, FR|48.826|2.360
Croulebarbe, FR|48.810|2.354
Gare, FR|48.833|2.375
Maison Blanche, FR|48.826|2.351
Salpetriere, FR|48.837|2.358
Plaine du Var, FR|43.682|7.202
Tchibanga, GA|-2.933|10.982
Port-Gentil, GA|-0.719|8.782
Oyem, GA|1.599|11.579
Oyam, GA|-0.200|10.683
Owendo, GA|0.291|9.505
Ntoum, GA|0.391|9.761
Mouila, GA|-1.868|11.056
Moanda, GA|-1.567|13.199
Makokou, GA|0.574|12.864
Libreville, GA|0.392|9.454
Lambarene, GA|-0.700|10.241
Koulamoutou, GA|-1.137|12.464
Franceville, GA|-1.633|13.584
Bitam, GA|2.076|11.501
Akanda, GA|0.607|9.329
York, GB|53.958|-1.083
Yeovil, GB|50.942|-2.632
Yeadon, GB|53.864|-1.687
Yate, GB|51.541|-2.418
Yarm, GB|54.504|-1.358
Wrexham, GB|53.047|-2.991
Worthing, GB|50.818|-0.375
Worksop, GB|53.302|-1.124
Workington, GB|54.642|-3.544
Worcester Park, GB|51.380|-0.244
Worcester, GB|52.189|-2.220
Wood Green, GB|51.600|-0.117
Woodford Green, GB|51.609|0.023
Wombwell, GB|53.522|-1.397
Wolverhampton, GB|52.585|-2.123
Wokingham, GB|51.411|-0.836
Woking, GB|51.319|-0.559
Witney, GB|51.784|-1.485
Witham, GB|51.800|0.640
Wishaw, GB|55.767|-3.917
Wisbech, GB|52.666|0.159
Winsford, GB|53.191|-2.524
Windsor, GB|51.483|-0.600
Winchester, GB|51.065|-1.319
Wimborne Minster, GB|50.783|-1.983
Wimbledon, GB|51.422|-0.208
Wilmslow, GB|53.328|-2.231
Willesden, GB|51.533|-0.233
Willenhall, GB|52.585|-2.059
Wigston Magna, GB|52.581|-1.092
Wigan, GB|53.543|-2.637
Widnes, GB|53.362|-2.734
Wickford, GB|51.611|0.523
Whitstable, GB|51.361|1.026
Whitley Bay, GB|55.040|-1.447
Whitehaven, GB|54.549|-3.584
Whitefield, GB|53.550|-2.300
Whickham, GB|54.946|-1.676
Weymouth, GB|50.614|-2.460
Weybridge, GB|51.372|-0.460
Weston-super-Mare, GB|51.346|-2.977
West Molesey, GB|51.400|-0.380
City of Westminster, GB|51.498|-0.136
Westhoughton, GB|53.549|-2.525
West Ham, GB|51.533|0.017
Westbury, GB|51.260|-2.188
West Bromwich, GB|52.519|-1.994
West Bridgford, GB|52.930|-1.125
Wembley, GB|51.552|-0.297
Welwyn Garden City, GB|51.802|-0.207
Wellington, GB|52.700|-2.517
Wellingborough, GB|52.303|-0.694
Welling, GB|51.462|0.108
Wednesfield, GB|52.596|-2.085
Wednesbury, GB|52.551|-2.024
Wath upon Dearne, GB|53.503|-1.346
Watford, GB|51.655|-0.396
Waterlooville, GB|50.881|-1.030
Washington, GB|54.900|-1.517
Warwick, GB|52.283|-1.583
Warrington, GB|53.393|-2.580
Warminster, GB|51.204|-2.179
Ware, GB|51.811|-0.029
Walton-on-Thames, GB|51.387|-0.413
Walton-on-the-Naze, GB|51.848|1.267
Walthamstow, GB|51.591|-0.021
Waltham Abbey, GB|51.687|-0.004
Walsall, GB|52.585|-1.984
Wallsend, GB|54.991|-1.534
Wallington, GB|51.364|-0.154
Wallasey, GB|53.423|-3.065
Walkden, GB|53.517|-2.400
Wakefield, GB|53.683|-1.498
Uxbridge, GB|51.549|-0.482
Urmston, GB|53.449|-2.354
Upper Norwood, GB|51.415|-0.093
Uckfield, GB|50.969|0.096
Tynemouth, GB|55.018|-1.426
Tyldesley, GB|53.514|-2.468
Truro, GB|50.265|-5.054
Trowbridge, GB|51.319|-2.209
Totton, GB|50.919|-1.490
Totteridge, GB|51.633|-0.200
Tottenham, GB|51.604|-0.068
Torquay, GB|50.462|-3.525
Tonbridge, GB|51.195|0.274
Tiverton, GB|50.902|-3.492
Tipton, GB|52.530|-2.068
Thorne, GB|53.611|-0.963
Thornaby-on-Tees, GB|54.533|-1.300
Thetford, GB|52.417|0.750
Thatcham, GB|51.404|-1.260
Tewkesbury, GB|51.992|-2.160
Taunton, GB|51.015|-3.103
Tamworth, GB|52.634|-1.696
Tadley, GB|51.350|-1.129
Swinton, GB|53.500|-2.350
Swindon, GB|51.558|-1.781
Swansea, GB|51.621|-3.943
Swanscombe, GB|51.447|0.310
Swanley, GB|51.397|0.173
Swadlincote, GB|52.774|-1.557
Sutton in Ashfield, GB|53.125|-1.261
Sutton Coldfield, GB|52.567|-1.817
Sutton, GB|51.350|-0.200
Sunderland, GB|54.905|-1.382
Sunbury-on-Thames, GB|51.404|-0.418
Sudbury, GB|52.039|0.731
Stroud, GB|51.750|-2.200
Strood, GB|51.393|0.477
Stretford, GB|53.450|-2.317
Streatham, GB|51.429|-0.132
Stratford-upon-Avon, GB|52.192|-1.707
Stratford, GB|51.533|0.000
Stowmarket, GB|52.189|0.998
Stourport-on-Severn, GB|52.340|-2.280
Stourbridge, GB|52.456|-2.143
Stoke-on-Trent, GB|53.004|-2.185
Stockton-on-Tees, GB|54.568|-1.319
Stockport, GB|53.410|-2.158
Stirling, GB|56.119|-3.937
Stevenage, GB|51.902|-0.203
Stepney, GB|51.517|-0.043
Staveley, GB|53.267|-1.350
Stapleford, GB|52.917|-1.267
Stanford-le-Hope, GB|51.523|0.434
Stamford, GB|52.650|-0.483
Stalybridge, GB|53.484|-2.059
Staines, GB|51.431|-0.506
Stafford, GB|52.805|-2.116
Spennymoor, GB|54.699|-1.602
Speke, GB|53.341|-2.841
Spalding, GB|52.787|-0.151
South Shields, GB|54.999|-1.432
Southsea, GB|50.784|-1.091
Southport, GB|53.646|-3.010
South Ockendon, GB|51.508|0.283
South Norwood, GB|51.399|-0.075
South Hayling, GB|50.788|-0.977
Southend-on-Sea, GB|51.538|0.714
South Elmsall, GB|53.597|-1.280
South Benfleet, GB|51.553|0.560
Southampton, GB|50.904|-1.404
Southall, GB|51.509|-0.371
Solihull, GB|52.414|-1.781
Smethwick, GB|52.493|-1.967
Slough, GB|51.509|-0.595
Sleaford, GB|52.998|-0.409
Skelmersdale, GB|53.550|-2.773
Skegness, GB|53.144|0.336
Sittingbourne, GB|51.341|0.733
Shrewsbury, GB|52.710|-2.752
Shoreham-by-Sea, GB|50.834|-0.274
Shipley, GB|53.833|-1.767
Shepherds Bush, GB|51.505|-0.221
Sheffield, GB|53.383|-1.466
Sevenoaks, GB|51.273|0.189
Selby, GB|53.783|-1.067
Seaham, GB|54.839|-1.346
Seaford, GB|50.771|0.103
Scunthorpe, GB|53.579|-0.654
Scarborough, GB|54.280|-0.404
Sandown, GB|50.652|-1.161
Sandhurst, GB|51.347|-0.787
Sandbach, GB|53.145|-2.363
Saltash, GB|50.410|-4.225
Salisbury, GB|51.069|-1.796
Salford, GB|53.488|-2.290
Sale, GB|53.425|-2.324
Saint Peters, GB|51.367|1.417
Saint Neots, GB|52.217|-0.267
Saint Ives, GB|52.333|-0.077
St Helens, GB|53.450|-2.733
St Austell, GB|50.343|-4.774
Saint Andrews, GB|56.339|-2.799
St Albans, GB|51.750|-0.333
Saffron Walden, GB|52.023|0.242
Saddleworth, GB|53.548|-2.005
Ryton, GB|52.617|-2.350
Ryde, GB|50.730|-1.162
Rutherglen, GB|55.829|-4.214
Rushden, GB|52.289|-0.602
Runcorn, GB|53.342|-2.731
Ruislip, GB|51.573|-0.423
Rugeley, GB|52.759|-1.937
Rugby, GB|52.371|-1.264
Royton, GB|53.565|-2.123
Royston, GB|52.048|-0.024
Royal Tunbridge Wells, GB|51.133|0.263
Rottingdean, GB|50.810|-0.059
Rotherham, GB|53.430|-1.357
Romsey, GB|50.989|-1.500
Romford, GB|51.575|0.186
Roehampton, GB|51.452|-0.244
Rochford, GB|51.582|0.707
Rochester, GB|51.388|0.505
Rochdale, GB|53.618|-2.155
Risca, GB|51.608|-3.101
Ripon, GB|54.136|-1.528
Ripley, GB|53.033|-1.400
Rickmansworth, GB|51.639|-0.477
Richmond, GB|51.462|-0.306
Rhyl, GB|53.319|-3.492
Rhosllannerchrugog, GB|53.010|-3.058
Rhondda, GB|51.659|-3.449
Renfrew, GB|55.872|-4.393
Reigate, GB|51.237|-0.206
Redruth, GB|50.233|-5.224
Redhill, GB|51.240|-0.170
Redditch, GB|52.306|-1.946
Redcar, GB|54.617|-1.060
Reading, GB|51.456|-0.971
Rayleigh, GB|51.586|0.605
Rawtenstall, GB|53.701|-2.284
Rawmarsh, GB|53.461|-1.344
Ramsgate, GB|51.336|1.418
Ramsbottom, GB|53.648|-2.317
Putney, GB|51.461|-0.218
Purley, GB|51.337|-0.112
Pudsey, GB|53.795|-1.661
Prestwich, GB|53.533|-2.283
Preston, GB|53.763|-2.705
Prestatyn, GB|53.337|-3.408
Prescot, GB|53.429|-2.800
Poulton-le-Fylde, GB|53.833|-2.983
Potters Bar, GB|51.694|-0.178
Portsmouth, GB|50.799|-1.091
Portslade, GB|50.843|-0.216
Portishead, GB|51.482|-2.770
Porthcawl, GB|51.479|-3.704
Portadown, GB|54.423|-6.444
Poole, GB|50.714|-1.985
Pontypridd, GB|51.602|-3.342
Pontypool, GB|51.701|-3.044
Pontefract, GB|53.691|-1.313
Ponders End, GB|51.645|-0.047
Plymstock, GB|50.360|-4.090
Plymouth, GB|50.372|-4.143
Plumstead, GB|51.483|0.083
Pitsea, GB|51.564|0.509
Pinner, GB|51.594|-0.382
Peterlee, GB|54.760|-1.336
Peterhead, GB|57.505|-1.784
Peterborough, GB|52.574|-0.248
Perth, GB|56.395|-3.431
Penzance, GB|50.119|-5.537
Penrith, GB|54.666|-2.758
Penicuik, GB|55.831|-3.226
Penarth, GB|51.439|-3.173
Palmers Green, GB|51.618|-0.110
Paisley, GB|55.832|-4.433
Paignton, GB|50.436|-3.568
Oxford, GB|51.752|-1.256
Oswestry, GB|52.862|-3.055
Ossett, GB|53.680|-1.580
Orpington, GB|51.375|0.098
Ormskirk, GB|53.567|-2.882
Omagh, GB|54.600|-7.300
Oldham, GB|53.541|-2.118
Oadby, GB|52.606|-1.084
Nuneaton, GB|52.523|-1.465
Notting Hill, GB|51.511|-0.206
Nottingham, GB|52.954|-1.150
Norwich, GB|52.628|1.298
Northwich, GB|53.259|-2.520
North Shields, GB|55.016|-1.449
Northolt, GB|51.549|-0.368
Lancing, GB|50.829|-0.322
Northampton, GB|52.250|-0.883
Northallerton, GB|54.339|-1.432
Norbury, GB|51.417|-0.117
Newtownards, GB|54.592|-5.691
Newtownabbey, GB|54.660|-5.909
Newton Mearns, GB|55.773|-4.333
Newton-le-Willows, GB|53.450|-2.600
Newton Aycliffe, GB|54.618|-1.572
Newton Abbot, GB|50.529|-3.612
Newry, GB|54.178|-6.337
Newquay, GB|50.416|-5.073
Newport Pagnell, GB|52.087|-0.722
Newport, GB|51.588|-2.998
Newport, GB|50.701|-1.291
New Milton, GB|50.756|-1.666
New Mills, GB|53.366|-2.000
Newmarket, GB|52.245|0.404
New Malden, GB|51.401|-0.262
New Cross, GB|51.475|-0.038
Newcastle upon Tyne, GB|54.973|-1.614
Newcastle under Lyme, GB|53.000|-2.233
Newbury, GB|51.401|-1.325
Newburn, GB|54.988|-1.744
Newark on Trent, GB|53.067|-0.817
Nether Edge, GB|53.359|-1.488
Neston, GB|53.283|-3.050
Nelson, GB|53.833|-2.200
Neath, GB|51.663|-3.804
Nantwich, GB|53.069|-2.521
Nailsea, GB|51.432|-2.758
Musselburgh, GB|55.942|-3.050
Mountsorrel, GB|52.717|-1.150
Motherwell, GB|55.789|-3.992
Morley, GB|53.740|-1.599
Moreton, GB|53.400|-3.117
Morecambe, GB|54.068|-2.861
Morden, GB|51.398|-0.198
Mitcham, GB|51.403|-0.168
Mirfield, GB|53.673|-1.696
Milton Keynes, GB|52.042|-0.756
Middleton, GB|53.550|-2.200
Middlesbrough, GB|54.576|-1.235
Mexborough, GB|53.494|-1.292
Merthyr Tydfil, GB|51.748|-3.378
Melton Mowbray, GB|52.766|-0.887
Melksham, GB|51.373|-2.140
Meikle Earnock, GB|55.750|-4.033
Marlow, GB|51.569|-0.774
Market Harborough, GB|52.478|-0.921
Margate, GB|51.381|1.386
March, GB|52.551|0.088
Mansfield Woodhouse, GB|53.165|-1.194
Mansfield, GB|53.133|-1.200
Mangotsfield, GB|51.488|-2.504
Manchester, GB|53.481|-2.237
Maltby, GB|53.417|-1.200
Maldon, GB|51.731|0.675
Maidstone, GB|51.267|0.517
Maidenhead, GB|51.523|-0.720
Maghull, GB|53.516|-2.941
Maesteg, GB|51.609|-3.658
Macclesfield, GB|53.260|-2.126
Luton, GB|51.880|-0.417
Lowestoft, GB|52.475|1.752
Louth, GB|53.367|-0.004
Loughton, GB|52.433|-2.567
Loughborough, GB|52.767|-1.200
Longton, GB|52.983|-2.133
Longfield, GB|51.397|0.302
Long Eaton, GB|52.899|-1.271
Londonderry County Borough, GB|54.997|-7.309
Derry, GB|54.998|-7.309
London, GB|51.509|-0.126
Lofthouse, GB|53.729|-1.497
Llanelli, GB|51.682|-4.162
Llandudno, GB|53.325|-3.831
Livingston, GB|55.903|-3.523
Liversedge, GB|53.705|-1.693
Liverpool, GB|53.411|-2.978
Littlehampton, GB|50.811|-0.541
Litherland, GB|53.470|-2.998
Lisburn, GB|54.523|-6.035
Lincoln, GB|53.227|-0.538
Limehouse, GB|51.514|-0.033
Lichfield, GB|52.682|-1.825
Leyland, GB|53.698|-2.688
Lewes, GB|50.874|0.009
Leighton Buzzard, GB|51.917|-0.658
Leigh, GB|53.496|-2.520
Leicester, GB|52.639|-1.132
Leek, GB|53.104|-2.022
Leeds, GB|53.796|-1.548
Leatherhead, GB|51.297|-0.334
Royal Leamington Spa, GB|52.285|-1.520
Larne, GB|54.850|-5.817
Larkhall, GB|55.733|-3.967
Lancaster, GB|54.046|-2.800
Kirkintilloch, GB|55.939|-4.153
Kirkcaldy, GB|56.117|-3.160
Kirkby in Ashfield, GB|53.100|-1.244
Kirkby, GB|53.481|-2.892
Kippax, GB|53.767|-1.371
Kingswood, GB|51.453|-2.508
Kingswinford, GB|52.498|-2.169
Kingston upon Hull, GB|53.745|-0.335
Kings Lynn, GB|52.752|0.395
Kilwinning, GB|55.653|-4.707
Kilmarnock, GB|55.612|-4.496
Kidsgrove, GB|53.087|-2.238
Kidderminster, GB|52.388|-2.250
Keynsham, GB|51.414|-2.498
Kettering, GB|52.398|-0.726
Kenilworth, GB|52.350|-1.583
Kendal, GB|54.327|-2.748
Kempston, GB|52.116|-0.500
Keighley, GB|53.868|-1.907
Johnstone, GB|55.829|-4.516
Jarrow, GB|54.980|-1.484
Islington, GB|51.536|-0.103
Isleworth, GB|51.475|-0.342
Irvine, GB|55.619|-4.655
Irlam, GB|53.443|-2.423
Ipswich, GB|52.059|1.155
Inverness, GB|57.479|-4.224
Ilkeston, GB|52.971|-1.310
Ilford, GB|51.558|0.073
Hythe, GB|50.860|-1.402
Hyde, GB|53.451|-2.079
Huyton, GB|53.411|-2.839
Huntingdon, GB|52.330|-0.187
Humberstone, GB|52.647|-1.086
Huddersfield, GB|53.649|-1.784
Hucknall, GB|53.033|-1.200
Hoyland Nether, GB|53.500|-1.450
Hove, GB|50.831|-0.167
Hounslow, GB|51.468|-0.361
Houghton-Le-Spring, GB|54.840|-1.464
Horwich, GB|53.601|-2.550
Horsham, GB|51.063|-0.328
Horsforth, GB|53.843|-1.638
Horley, GB|51.174|-0.159
Hook, GB|51.368|-0.306
Hoddesdon, GB|51.761|-0.011
Hitchin, GB|51.949|-0.285
Hindley, GB|53.533|-2.583
Hinckley, GB|52.539|-1.376
High Wycombe, GB|51.629|-0.749
Highbury, GB|51.550|-0.100
High Blantyre, GB|55.784|-4.100
Heysham, GB|54.044|-2.893
Heswall, GB|53.327|-3.096
Heston, GB|51.484|-0.376
Hertford, GB|51.796|-0.079
Herne Bay, GB|51.373|1.129
Hereford, GB|52.057|-2.715
Hemel Hempstead, GB|51.754|-0.450
Heckmondwike, GB|53.706|-1.677
Hebburn, GB|54.973|-1.515
Heanor, GB|53.014|-1.354
Hazel Grove, GB|53.383|-2.117
Haywards Heath, GB|50.998|-0.103
Hayes, GB|51.516|-0.423
Hayes, GB|51.378|0.017
Haydock, GB|53.467|-2.682
Hawarden, GB|53.185|-3.026
Haverhill, GB|52.082|0.439
Havant, GB|50.857|-0.986
Hatfield, GB|51.763|-0.224
Hastings, GB|50.856|0.580
Haslingden, GB|53.703|-2.324
Haslemere, GB|51.090|-0.708
Harwich, GB|51.942|1.284
Hartley, GB|51.387|0.304
Hartlepool, GB|54.686|-1.210
Harrow, GB|51.578|-0.332
Harrogate, GB|53.991|-1.537
Harpenden, GB|51.817|-0.357
Harlow, GB|51.777|0.112
Harlesden, GB|51.538|-0.250
Hanworth, GB|51.433|-0.383
Hampton, GB|51.413|-0.367
Hamilton, GB|55.767|-4.033
Halifax, GB|53.717|-1.850
Halewood, GB|53.360|-2.831
Halesowen, GB|52.449|-2.049
Hale, GB|51.229|-0.789
Hailsham, GB|50.862|0.258
Hadleigh, GB|51.553|0.610
Guiseley, GB|53.876|-1.712
Guisborough, GB|54.535|-1.056
Guildford, GB|51.235|-0.574
Grimsby, GB|53.565|-0.076
Greenwich, GB|51.478|-0.012
Greenock, GB|55.948|-4.761
Greenford, GB|51.529|-0.355
Great Yarmouth, GB|52.608|1.731
Great Wyrley, GB|52.663|-2.011
Great Sankey, GB|53.392|-2.640
Great Malvern, GB|52.112|-2.325
Grays, GB|51.476|0.325
Gravesend, GB|51.442|0.371
Grantham, GB|52.911|-0.642
Grangemouth, GB|56.011|-3.722
Gosport, GB|50.795|-1.129
Gosforth, GB|55.000|-1.617
Gorseinon, GB|51.669|-4.042
Goole, GB|53.703|-0.877
Golborne, GB|53.477|-2.597
Godalming, GB|51.186|-0.615
Gloucester, GB|51.866|-2.243
Glossop, GB|53.443|-1.949
Glenrothes, GB|56.195|-3.173
Glen Parva, GB|52.585|-1.171
Glasgow, GB|55.865|-4.258
Gillingham, GB|51.389|0.549
Gelligaer, GB|51.664|-3.256
Gateshead, GB|54.962|-1.602
Garston, GB|53.333|-2.900
Gainsborough, GB|53.383|-0.767
Fylde, GB|53.833|-2.917
Fulwood, GB|53.350|-1.550
Fulham, GB|51.480|-0.199
Frome, GB|51.228|-2.322
Frinton-on-Sea, GB|51.831|1.244
Friern Barnet, GB|51.613|-0.159
Fort William, GB|56.816|-5.112
Formby, GB|53.558|-3.070
Folkestone, GB|51.082|1.167
Flint, GB|53.245|-3.132
Fleetwood, GB|53.925|-3.011
Fleet, GB|51.283|-0.833
Finchley, GB|51.601|-0.195
Feltham, GB|51.446|-0.414
Felling, GB|54.953|-1.572
Felixstowe, GB|51.964|1.351
Fazakerley, GB|53.461|-2.929
Faversham, GB|51.315|0.889
Farnworth, GB|53.550|-2.400
Farnham, GB|51.214|-0.801
Farnborough, GB|51.294|-0.756
Fareham, GB|50.852|-1.179
Falmouth, GB|50.154|-5.071
Falkirk, GB|56.002|-3.785
Exmouth, GB|50.617|-3.402
Exeter, GB|50.724|-3.528
Evington, GB|52.600|-1.067
Evesham, GB|52.092|-1.949
Esher, GB|51.370|-0.367
Epsom, GB|51.331|-0.270
Enfield Lock, GB|51.671|-0.027
Enfield Town, GB|51.651|-0.085
Emsworth, GB|50.848|-0.937
Ely, GB|52.400|0.262
Eltham, GB|51.451|0.052
Ellesmere Port Town, GB|53.279|-2.901
Elland, GB|53.685|-1.839
Elgin, GB|57.649|-3.318
Egham, GB|51.432|-0.552
Edmonton, GB|51.626|-0.058
Edinburgh, GB|55.952|-3.196
Eccles, GB|53.483|-2.333
Ebbw Vale, GB|51.777|-3.208
Eastwood, GB|53.000|-1.300
Retford, GB|53.322|-0.943
East Molesey, GB|51.399|-0.349
Eastleigh, GB|50.967|-1.350
East Kilbride, GB|55.764|-4.177
East Grinstead, GB|51.124|-0.006
East Dereham, GB|52.683|0.933
Eastbourne, GB|50.769|0.285
Durham, GB|54.777|-1.576
Dunstable, GB|51.886|-0.523
Dunfermline, GB|56.072|-3.459
Dundee, GB|56.469|-2.975
Dumfries, GB|55.070|-3.611
Dumbarton, GB|55.944|-4.571
Dukinfield, GB|53.475|-2.088
Dudley, GB|52.500|-2.083
Droylsden, GB|53.480|-2.145
Dronfield, GB|53.302|-1.475
Droitwich, GB|52.267|-2.150
Dover, GB|51.126|1.313
Dorking, GB|51.232|-0.334
Dorchester, GB|50.717|-2.433
Doncaster, GB|53.523|-1.131
Dinnington, GB|53.367|-1.200
Didcot, GB|51.609|-1.242
Dewsbury, GB|53.691|-1.629
Devizes, GB|51.351|-1.994
Derby, GB|52.923|-1.477
Denton, GB|53.457|-2.118
Deal, GB|51.223|1.403
Daventry, GB|52.257|-1.161
Darwen, GB|53.698|-2.465
Darton, GB|53.587|-1.527
Dartford, GB|51.447|0.214
Darlington, GB|54.524|-1.550
Dalserf, GB|55.733|-3.917
Dagenham, GB|51.550|0.167
Cwmbran, GB|51.654|-3.023
Cumbernauld, GB|55.947|-3.991
Croydon, GB|51.383|-0.100
Crowthorne, GB|51.370|-0.792
Crowborough, GB|51.061|0.163
Cricklewood, GB|51.557|-0.215
Crewe, GB|53.098|-2.442
Crawley, GB|51.113|-0.183
Cramlington, GB|55.087|-1.586
Cowley, GB|51.732|-1.206
Cowes, GB|50.763|-1.298
Coventry, GB|52.407|-1.512
Coulsdon, GB|51.320|-0.141
Corby, GB|52.496|-0.689
Consett, GB|54.854|-1.832
Conisbrough, GB|53.482|-1.232
Congleton, GB|53.163|-2.213
Colwyn Bay, GB|53.295|-3.727
Colne, GB|53.857|-2.169
Coleraine, GB|55.133|-6.667
Colchester, GB|51.889|0.904
Coity, GB|51.522|-3.555
Cobham, GB|51.330|-0.411
Coatbridge, GB|55.862|-4.025
Coalville, GB|52.722|-1.370
Clydebank, GB|55.901|-4.406
Clydach, GB|51.683|-3.900
Clevedon, GB|51.442|-2.858
Cleethorpes, GB|53.560|-0.032
Cleckheaton, GB|53.724|-1.713
Clacton-on-Sea, GB|51.790|1.156
Cirencester, GB|51.719|-1.971
Christchurch, GB|50.736|-1.781
Chorley, GB|53.650|-2.617
Chiswick, GB|51.493|-0.258
Chislehurst, GB|51.417|0.069
Chippenham, GB|51.460|-2.125
Chingford, GB|51.630|0.001
Chichester, GB|50.837|-0.780
Chester-le-Street, GB|54.859|-1.574
Chesterfield, GB|53.250|-1.417
Chester, GB|53.191|-2.892
Chessington, GB|51.362|-0.304
Cheshunt, GB|51.700|-0.030
Chesham, GB|51.700|-0.600
Chertsey, GB|51.388|-0.508
Cheltenham, GB|51.900|-2.080
Chelsea, GB|51.488|-0.169
Chelmsford, GB|51.736|0.470
Cheadle Hulme, GB|53.376|-2.190
Chatham, GB|51.379|0.528
Chapeltown, GB|53.465|-1.472
Chalfont Saint Peter, GB|51.609|-0.556
Catford, GB|51.445|-0.020
Caterham, GB|51.282|-0.079
Castlereagh, GB|54.574|-5.885
Castleford, GB|53.726|-1.363
Carterton, GB|51.759|-1.594
Carshalton, GB|51.368|-0.168
Carrickfergus, GB|54.716|-5.806
Carmarthen, GB|51.856|-4.305
Carlisle, GB|54.895|-2.938
Cardiff, GB|51.480|-3.180
Canterbury, GB|51.279|1.080
Cannock, GB|52.690|-2.031
Cambuslang, GB|55.810|-4.161
Cambridge, GB|52.200|0.117
Camborne, GB|50.213|-5.297
Camberley, GB|51.337|-0.743
Calne, GB|51.439|-2.006
Caerphilly, GB|51.575|-3.218
Buxton, GB|53.257|-1.910
Bushey, GB|51.643|-0.361
Bury St Edmunds, GB|52.246|0.711
Bury, GB|53.600|-2.300
Burton upon Trent, GB|52.807|-1.643
Burntwood, GB|52.681|-1.928
Burnley, GB|53.800|-2.233
Burnham-on-Sea, GB|51.239|-2.998
Burgess Hill, GB|50.958|-0.133
Buckley, GB|53.167|-3.083
Brymbo, GB|53.067|-3.067
Broxburn, GB|55.934|-3.471
Brough, GB|53.729|-0.572
Bromsgrove, GB|52.336|-2.060
Broadstairs, GB|51.358|1.442
Brixham, GB|50.394|-3.516
Briton Ferry, GB|51.631|-3.819
Bristol, GB|51.455|-2.597
Brighton, GB|50.828|-0.139
Brighouse, GB|53.703|-1.784
Brierley Hill, GB|52.482|-2.121
Bridlington, GB|54.083|-0.192
Bridgwater, GB|51.128|-3.004
Bridgend, GB|51.506|-3.577
Brentwood, GB|51.621|0.306
Brent, GB|51.553|-0.302
Bredbury, GB|53.417|-2.117
Braunstone, GB|52.618|-1.179
Bramhall, GB|53.358|-2.165
Braintree, GB|51.878|0.553
Bradford, GB|53.794|-1.752
Bracknell, GB|51.414|-0.751
Bow, GB|51.526|-0.017
Bournemouth, GB|50.720|-1.879
Boston, GB|52.976|-0.027
Borehamwood, GB|51.655|-0.278
Bootle, GB|53.467|-3.017
Bonnyrigg, GB|55.873|-3.105
Bolton, GB|53.583|-2.433
Bognor Regis, GB|50.782|-0.680
Bodmin, GB|50.472|-4.724
Blyth, GB|55.127|-1.509
Bloxwich, GB|52.618|-2.004
Bletchley, GB|51.993|-0.735
Blaydon-on-Tyne, GB|54.965|-1.714
Blackwall, GB|51.510|-0.002
Blackpool, GB|53.817|-3.050
Blackburn, GB|53.750|-2.483
Bishopstoke, GB|50.966|-1.328
Bishops Stortford, GB|51.871|0.159
Bishopbriggs, GB|55.907|-4.219
Bishop Auckland, GB|54.656|-1.677
Birmingham, GB|52.481|-1.900
Birkenhead, GB|53.393|-3.015
Bingley, GB|53.849|-1.839
Billingham, GB|54.589|-1.290
Billericay, GB|51.629|0.420
Biggleswade, GB|52.087|-0.265
Bideford, GB|51.017|-4.208
Biddulph, GB|53.117|-2.176
Bicester, GB|51.900|-1.154
Bexley, GB|51.442|0.149
Bexhill-on-Sea, GB|50.850|0.471
Beverley, GB|53.846|-0.423
Berkhamsted, GB|51.760|-0.565
Bentley, GB|53.533|-1.150
Belper, GB|53.023|-1.481
Bellshill, GB|55.817|-4.017
Belfast, GB|54.597|-5.925
Bedworth, GB|52.479|-1.469
Bedlington, GB|55.131|-1.593
Bedford, GB|52.135|-0.466
Beckenham, GB|51.409|-0.025
Bebington, GB|53.350|-3.017
Bearsden, GB|55.915|-4.333
Batley, GB|53.703|-1.634
Bathgate, GB|55.902|-3.644
Bath, GB|51.375|-2.362
Basingstoke, GB|51.262|-1.087
Basildon, GB|51.568|0.458
Basford, GB|52.967|-1.183
Barry, GB|51.400|-3.284
Barrow in Furness, GB|54.111|-3.228
Barrhead, GB|55.799|-4.393
Barnstaple, GB|51.080|-4.058
Barnsley, GB|53.550|-1.483
Barnet, GB|51.650|-0.200
Barnes, GB|51.474|-0.248
Barking, GB|51.533|0.083
Banstead, GB|51.322|-0.207
Bangor, GB|54.661|-5.668
Bangor, GB|53.228|-4.129
Banbury, GB|52.063|-1.342
Banbridge, GB|54.350|-6.283
Ballymena, GB|54.864|-6.276
Baildon, GB|53.847|-1.788
Ayr, GB|55.463|-4.634
Aylesbury, GB|51.817|-0.815
Atherton, GB|53.524|-2.494
Aston, GB|52.500|-1.883
Ashton-under-Lyne, GB|53.489|-2.099
Ashton in Makerfield, GB|53.483|-2.650
Ashington, GB|55.177|-1.564
Ashford, GB|51.432|-0.458
Ashford, GB|51.146|0.874
Ascot, GB|51.411|-0.675
Arnold, GB|53.000|-1.133
Arbroath, GB|56.563|-2.587
Antrim, GB|54.718|-6.211
Andover, GB|51.211|-1.494
Ampthill, GB|52.027|-0.496
Ammanford, GB|51.793|-3.988
Amersham, GB|51.667|-0.617
Altrincham, GB|53.388|-2.348
Alton, GB|51.149|-0.975
Alloa, GB|56.116|-3.790
Alfreton, GB|53.098|-1.384
Aldridge, GB|52.605|-1.917
Aldershot, GB|51.248|-0.764
Airdrie, GB|55.866|-3.980
Adwick le Street, GB|53.571|-1.185
Acton, GB|51.509|-0.276
Acocks Green, GB|52.450|-1.817
Accrington, GB|53.754|-2.359
Abingdon, GB|51.671|-1.283
Aberystwyth, GB|52.415|-4.083
Aberdeen, GB|57.144|-2.098
Aberdare, GB|51.714|-3.449
Tonypandy, GB|51.622|-3.455
Blackwood, GB|51.668|-3.208
Neston, GB|51.412|-2.201
Camden Town, GB|51.541|-0.143
Telford, GB|52.677|-2.449
Craigavon, GB|54.447|-6.387
Soho, GB|51.514|-0.135
Bayswater, GB|51.511|-0.184
Pimlico, GB|51.489|-0.137
North Watford, GB|51.681|-0.394
Yateley, GB|51.343|-0.830
Bowthorpe, GB|52.639|1.219
Hedge End, GB|50.912|-1.301
Gerrards Cross, GB|51.586|-0.555
Erskine, GB|55.901|-4.450
Hale, GB|53.378|-2.333
Kilburn, GB|51.553|-0.192
Chalk Farm, GB|51.543|-0.150
Amersham on the Hill, GB|51.675|-0.607
Shadwell, GB|51.511|-0.057
Battersea, GB|51.475|-0.155
Tooting, GB|51.425|-0.164
South Croydon, GB|51.362|-0.094
Hornchurch, GB|51.557|0.217
Surbiton, GB|51.391|-0.298
Ewell, GB|51.349|-0.249
Becontree, GB|51.553|0.129
Brixton, GB|51.466|-0.107
Bethnal Green, GB|51.527|-0.061
Failsworth, GB|53.505|-2.166
Radcliffe, GB|53.562|-2.325
Heywood, GB|53.592|-2.219
Old Trafford, GB|53.458|-2.288
Longsight, GB|53.458|-2.201
Heavitree, GB|50.720|-3.496
Ferndown, GB|50.807|-1.900
Canary Wharf, GB|51.505|-0.021
Leytonstone, GB|51.569|0.008
Earl Shilton, GB|52.577|-1.315
Bordon, GB|51.114|-0.862
Lytham St Annes, GB|53.743|-2.997
Hadley Wood, GB|51.667|-0.170
Muswell Hill, GB|51.591|-0.142
Chapel Allerton, GB|53.829|-1.538
Blackheath, GB|51.465|0.008
Kempston Hardwick, GB|52.090|-0.499
Mendip, GB|51.237|-2.627
Manchester City Centre, GB|53.481|-2.246
Lower Earley, GB|51.427|-0.920
Bartley Green, GB|52.435|-1.997
Abbey Wood, GB|51.487|0.107
West Ealing, GB|51.514|-0.323
Golders Green, GB|51.576|-0.200
Canvey Island, GB|51.522|0.581
Earlsfield, GB|51.444|-0.185
Old Swan, GB|53.414|-2.909
Peacehaven, GB|50.793|-0.007
Letchworth Garden City, GB|51.979|-0.227
Peckham, GB|51.474|-0.070
Shirley, GB|52.411|-1.820
Stanley, GB|54.868|-1.698
Rossendale, GB|53.685|-2.277
Thornton-Cleveleys, GB|53.874|-3.022
Deeside, GB|53.201|-3.038
High Peak, GB|53.368|-1.845
Hayling Island, GB|50.784|-0.969
Isle of Lewis, GB|58.219|-6.388
Holloway, GB|51.552|-0.125
Harringay, GB|51.582|-0.100
Canning Town, GB|51.514|0.019
Manor Park, GB|51.549|0.049
Allerton, GB|53.367|-2.894
Chadderton, GB|53.545|-2.140
Thamesmead, GB|51.504|0.120
Brockley, GB|51.464|-0.037
Blantyre, GB|55.796|-4.095
Vale of Leven, GB|55.971|-4.579
Viewpark, GB|55.827|-4.057
Kirkdale, GB|53.433|-2.977
Kensington, GB|53.409|-2.953
Belle Vale, GB|53.392|-2.860
Hunts Cross, GB|53.356|-2.866
Norris Green, GB|53.445|-2.921
Stamford Hill, GB|51.569|-0.073
Burngreave, GB|53.393|-1.458
Archway, GB|51.567|-0.134
Sinfin, GB|52.882|-1.487
Ealing Common, GB|51.507|-0.295
South Ruislip, GB|51.555|-0.409
Wealdstone, GB|51.600|-0.337
East Barnet, GB|51.647|-0.161
Perry Vale, GB|51.436|-0.044
Furzedown, GB|51.425|-0.147
Queenstown, GB|51.478|-0.147
Seven Sisters, GB|51.578|-0.079
Tottenham Hale, GB|51.594|-0.060
Latchmere, GB|51.468|-0.169
Washwood Heath, GB|52.501|-1.827
Nigg, GB|57.116|-2.093
Primrose Place, GB|52.561|-0.109
Saint Georges, GD|12.053|-61.752
Zugdidi, GE|42.508|41.868
Zestaponi, GE|42.108|43.033
Tskhinvali, GE|42.228|43.969
Telavi, GE|41.920|45.470
Tbilisi, GE|41.691|44.834
Sokhumi, GE|43.007|40.989
Samtredia, GE|42.154|42.335
Rustavi, GE|41.563|44.979
Poti, GE|42.143|41.674
Marneuli, GE|41.488|44.798
Kutaisi, GE|42.268|42.695
Kobuleti, GE|41.833|41.778
Khashuri, GE|41.997|43.599
Gori, GE|41.985|44.113
Batumi, GE|41.641|41.631
Akhaltsikhe, GE|41.640|42.986
Stantsiya Novyy Afon, GE|43.081|40.838
Saint-Laurent-du-Maroni, GF|5.502|-54.029
Remire-Montjoly, GF|4.917|-52.267
Matoury, GF|4.849|-52.324
Kourou, GF|5.163|-52.643
Cayenne, GF|4.938|-52.335
Saint Peter Port, GG|49.460|-2.535
Yendi, GH|9.443|-0.010
Yegyi, GH|8.225|-0.649
Winneba, GH|5.351|-0.623
Wankyi, GH|7.739|-2.104
Wa, GH|10.061|-2.502
Twifu Praso, GH|5.614|-1.550
Teshi Old Town, GH|5.584|-0.107
Tepa, GH|7.006|-2.166
Tema, GH|5.670|-0.017
Techiman, GH|7.591|-1.939
Tarkwa, GH|5.304|-1.990
Tamale, GH|9.401|-0.839
Takoradi, GH|4.898|-1.760
Tafo, GH|6.732|-1.614
Swedru, GH|5.537|-0.700
Sunyani, GH|7.340|-2.327
Suhum, GH|6.041|-0.450
Shama Junction, GH|5.018|-1.664
Sekondi-Takoradi, GH|4.927|-1.758
Savelugu, GH|9.624|-0.827
Saltpond, GH|5.209|-1.061
Salaga, GH|8.551|-0.519
Sakumona, GH|5.621|-0.052
Prestea, GH|5.434|-2.143
Kasoa, GH|5.534|-0.417
Akim Oda, GH|5.927|-0.986
Obuase, GH|6.202|-1.668
Nungua, GH|5.601|-0.077
Nsoatre, GH|7.404|-2.466
Nsawam, GH|5.809|-0.350
Nkoranza, GH|7.571|-1.709
New Tafo, GH|6.719|-1.612
Navrongo, GH|10.895|-1.091
Nalerigu, GH|10.527|-0.370
Mim, GH|6.904|-2.561
Mankesim, GH|5.272|-1.015
Mampong, GH|7.063|-1.400
Medina Estates, GH|5.666|-0.163
Kumasi, GH|6.688|-1.624
Kpandu, GH|6.995|0.293
Konongo, GH|6.617|-1.217
Koforidua, GH|6.094|-0.259
Kintampo, GH|8.056|-1.731
Keta, GH|5.918|0.988
Kade, GH|6.094|-0.836
Jirapa, GH|10.537|-2.702
Japekrom, GH|7.576|-2.785
Hohoe, GH|7.152|0.474
Ho, GH|6.601|0.471
Gbawe, GH|5.577|-0.310
Goaso, GH|6.804|-2.517
Foso, GH|5.701|-1.287
Elubo, GH|5.285|-2.767
Elmina, GH|5.085|-1.351
Ejura, GH|7.386|-1.356
Ahwiaa, GH|6.761|-1.594
Dzodze, GH|6.237|0.996
Dunkwa, GH|5.960|-1.778
Dambai, GH|8.066|0.179
Duayaw-Nkwanta, GH|7.175|-2.100
Domaa-Ahenkro, GH|7.274|-2.873
Dome, GH|5.650|-0.236
Damongo, GH|9.083|-1.819
Cape Coast, GH|5.105|-1.247
Buduburam, GH|5.523|-0.477
Bolgatanga, GH|10.786|-0.851
Bimbila, GH|8.855|0.059
Bibiani, GH|6.452|-2.316
Berekum, GH|7.453|-2.584
Bekwai, GH|6.452|-1.579
Begoro, GH|6.387|-0.377
Bechem, GH|7.090|-2.025
Bawku, GH|11.059|-0.242
Esim, GH|4.866|-2.242
Atronie, GH|7.153|-2.405
Atebubu, GH|7.755|-0.981
Ashaiman, GH|5.700|-0.035
Asamankese, GH|5.860|-0.663
Apam, GH|5.285|-0.746
Anyinam, GH|6.382|-0.549
Anloga, GH|5.795|0.897
Amanfrom, GH|5.535|-0.398
Akwatia, GH|6.040|-0.809
Akatsi, GH|6.132|0.799
Agogo, GH|6.800|-1.082
Aflao, GH|6.120|1.190
Atsiaman, GH|5.698|-0.328
Accra, GH|5.556|-0.197
Aburi, GH|5.848|-0.174
Effiduase, GH|6.847|-1.396
Adenta, GH|5.714|-0.154
Osu, GH|5.557|-0.186
Awoshi, GH|5.584|-0.278
New Achimota, GH|5.627|-0.258
Tema New Town, GH|5.654|0.026
Lashibi, GH|5.685|-0.040
Assin Foso, GH|5.700|-1.650
Sekondi, GH|4.934|-1.715
Mandela, GH|5.552|-0.339
Nkawkaw, GH|6.546|-0.763
Taifa, GH|5.658|-0.252
Ahwiaa, GH|6.903|-1.652
Gibraltar, GI|36.145|-5.353
Nuuk, GL|64.183|-51.722
Welingara, GM|13.404|-16.674
Tanji, GM|13.350|-16.789
Sukuta, GM|13.410|-16.708
Soma, GM|13.433|-15.533
Serekunda, GM|13.438|-16.678
Sanyang, GM|13.268|-16.760
Sanchaba, GM|13.422|-16.710
Nema Kunku, GM|13.250|-15.883
Manjai Kunda, GM|13.445|-16.703
Latri Sabiji, GM|13.413|-16.679
Latri Kunda, GM|13.449|-16.685
Lamin, GM|13.352|-16.434
Kunkujang, GM|13.390|-16.673
Kotu, GM|13.459|-16.705
Kanifing, GM|13.446|-16.674
Ibo Town, GM|13.435|-16.676
Gunjur, GM|13.202|-16.734
Farato, GM|13.400|-14.217
Farafenni, GM|13.567|-15.600
Faji Kunda, GM|13.418|-16.667
Dippa Kunda, GM|13.440|-16.687
Busumbala, GM|13.339|-16.688
Bununka Kunda, GM|13.427|-16.685
Brufut, GM|13.389|-16.750
Brikama, GM|13.271|-16.649
Banjul, GM|13.453|-16.578
Bakoti, GM|13.430|-16.698
Bakau, GM|13.478|-16.682
Abuko, GM|13.404|-16.656
Bakau New Town, GM|13.473|-16.685
New Jeshwang, GM|13.447|-16.665
Talinding, GM|13.426|-16.673
Sinchu Alagi, GM|13.375|-16.678
Yende Millimou, GN|8.887|-10.172
Wendou Borou, GN|11.433|-13.883
Tougue, GN|11.445|-11.664
Telimele, GN|10.900|-13.033
Siguiri, GN|11.423|-9.169
Sangaredi, GN|11.100|-13.767
Kamsar, GN|10.650|-14.617
Pita, GN|11.059|-12.395
Nzerekore, GN|7.756|-8.818
Moussadou, GN|8.767|-8.617
Maneah, GN|9.733|-13.417
Mandiana, GN|10.626|-8.694
Mamou, GN|10.375|-12.091
Macenta, GN|8.544|-9.471
Lola, GN|7.800|-8.533
Labe, GN|11.318|-12.283
Kouroussa, GN|10.650|-9.883
Koundara, GN|12.483|-13.300
Koumbia, GN|11.800|-13.500
Kissidougou, GN|9.185|-10.100
Kintinian, GN|11.600|-9.383
Kindia, GN|10.057|-12.866
Kerouane, GN|9.267|-9.017
Kankan, GN|10.385|-9.306
Kamabi, GN|12.400|-13.417
Gueckedou, GN|8.567|-10.134
Fria, GN|10.367|-13.583
Forecariah, GN|9.431|-13.088
Faranah, GN|10.040|-10.743
Dubreka, GN|9.791|-13.523
Douako, GN|9.733|-10.183
Dixinn, GN|9.551|-13.673
Dinguiraye, GN|11.291|-10.712
Dabola, GN|10.743|-11.108
Coyah, GN|9.706|-13.385
Conakry, GN|9.538|-13.677
Camayenne, GN|9.535|-13.688
Boke, GN|10.932|-14.291
Bissikrima, GN|10.850|-10.933
Beyla, GN|8.690|-8.649
Banko, GN|10.717|-10.717
Arfa Moussaia, GN|10.767|-11.367
Albaderia, GN|9.550|-10.100
Donghol-Sigon, GN|11.800|-12.217
Kolente, GN|10.286|-12.437
Kolaboui, GN|10.796|-14.400
Dogomet, GN|10.589|-11.178
Sainte-Rose, GP|16.333|-61.697
Sainte-Anne, GP|16.226|-61.381
Pointe-a-Pitre, GP|16.236|-61.535
Petit-Bourg, GP|16.192|-61.591
Les Abymes, GP|16.273|-61.505
Le Moule, GP|16.332|-61.347
Le Gosier, GP|16.206|-61.493
Capesterre-Belle-Eau, GP|16.045|-61.564
Basse-Terre, GP|15.997|-61.732
Baie-Mahault, GP|16.267|-61.585
Ebebiyin, GQ|2.152|11.330
Malabo, GQ|3.756|8.782
Bata, GQ|1.864|9.766
Anisoc, GQ|1.866|10.769
Aconibe, GQ|1.297|10.937
Ciudad de la Paz, GQ|1.593|10.824
Voula, GR|37.842|23.777
Volos, GR|39.369|22.948
Vyronas, GR|37.961|23.753
Vari, GR|37.833|23.803
Tripoli, GR|37.510|22.379
Trikala, GR|39.555|21.768
Thivai, GR|38.325|23.319
Sparta, GR|37.074|22.430
Salamina, GR|37.964|23.496
Rethymno, GR|35.366|24.482
Preveza, GR|38.956|20.750
Pyrgos, GR|37.675|21.441
Piraeus, GR|37.942|23.646
Petroupolis, GR|38.042|23.685
Peristeri, GR|38.015|23.692
Perama, GR|37.968|23.572
Patra, GR|38.246|21.735
Palaio Faliro, GR|37.928|23.701
Nikaia, GR|37.967|23.650
Nea Smyrni, GR|37.945|23.714
Nea Makri, GR|38.087|23.976
Ilion, GR|38.033|23.700
Nea Ionia, GR|38.036|23.757
Nea Filadelfeia, GR|38.035|23.738
Nea Erythraia, GR|38.093|23.822
Moskhaton, GR|37.948|23.679
Mytilene, GR|39.108|26.555
Melissia, GR|38.050|23.833
Megara, GR|37.995|23.343
Artemida, GR|37.967|23.997
Livadeia, GR|38.436|22.877
Larisa, GR|39.628|22.421
Lamia, GR|38.899|22.433
Metamorfosi, GR|38.066|23.764
Kos, GR|36.893|27.288
Koropi, GR|37.899|23.872
Korinthos, GR|37.940|22.951
Kifisia, GR|38.074|23.811
Cholargos, GR|38.000|23.800
Chios, GR|38.369|26.137
Chania, GR|35.511|24.029
Chalkida, GR|38.464|23.603
Khalandrion, GR|38.024|23.801
Chaidari, GR|38.011|23.666
Keratsini, GR|37.962|23.620
Karditsa, GR|39.365|21.922
Kamateron, GR|38.056|23.705
Kallithea, GR|37.950|23.700
Kalamata, GR|37.039|22.113
Alimos, GR|37.910|23.724
Kaisariani, GR|37.963|23.765
Irakleio, GR|38.053|23.765
Irakleion, GR|35.328|25.143
Ioannina, GR|39.663|20.852
Glyfada, GR|37.863|23.758
Galatsi, GR|38.017|23.750
Fyli, GR|38.102|23.669
Elliniko, GR|37.890|23.744
Elefsina, GR|38.041|23.543
Dhafni, GR|37.950|23.734
Agios Dimitrios, GR|37.933|23.733
Agia Varvara, GR|37.989|23.660
Agia Paraskevi, GR|38.017|23.833
Athens, GR|37.984|23.728
Aspropyrgos, GR|38.061|23.590
Argyroupoli, GR|37.906|23.750
Arta, GR|39.160|20.986
Argos, GR|37.633|22.733
Ano Liosia, GR|38.083|23.700
Marousi, GR|38.050|23.800
Amaliada, GR|37.798|21.351
Acharnes, GR|38.083|23.733
Aigio, GR|38.249|22.082
Aigaleo, GR|37.983|23.683
Agrinio, GR|38.621|21.408
Rhodes, GR|36.436|28.222
Giannitsa, GR|40.792|22.407
Xanthi, GR|41.135|24.888
Veroia, GR|40.524|22.202
Thessaloniki, GR|40.641|22.935
Stavroupoli, GR|40.669|22.938
Sykies, GR|40.649|22.951
Serres, GR|41.085|23.548
Ptolemaida, GR|40.515|21.679
Polichni, GR|40.667|22.949
Pylaia, GR|40.599|22.986
Peraia, GR|40.499|22.926
Panorama, GR|40.588|23.032
Orestiada, GR|41.503|26.530
Oraiokastro, GR|40.731|22.917
Naousa, GR|40.629|22.068
Lagkadas, GR|40.750|23.067
Kozani, GR|40.299|21.790
Komotini, GR|41.118|25.406
Kilkis, GR|40.993|22.874
Chortiatis, GR|40.610|23.100
Chalkidona, GR|40.732|22.600
Kavala, GR|40.940|24.407
Katerini, GR|40.270|22.506
Kalamaria, GR|40.583|22.950
Florina, GR|40.782|21.410
Evosmos, GR|40.671|22.908
Efkarpia, GR|40.688|22.953
Eleftherio - Kordelio, GR|40.664|22.897
Edessa, GR|40.803|22.048
Drama, GR|41.153|24.147
Alexandroupoli, GR|40.850|25.876
Corfu, GR|39.624|19.920
Vrilissia, GR|38.034|23.830
Gerakas, GR|38.023|23.858
Ilioupoli, GR|37.931|23.768
Korydallos, GR|37.985|23.647
Zografos, GR|37.976|23.769
Pefki, GR|38.060|23.793
Agioi Anargyroi, GR|38.030|23.724
Agios Ioannis Rentis, GR|37.965|23.665
Nea Ionia, GR|39.379|22.928
Neapoli, GR|40.653|22.942
Grytviken, GS|-54.281|-36.509
Zaragoza, GT|14.650|-90.890
Zacapa, GT|14.969|-89.527
Yepocapa, GT|14.502|-90.954
Villa Nueva, GT|14.525|-90.585
Villa Canales, GT|14.483|-90.534
Totonicapan, GT|14.912|-91.361
Tecpan Guatemala, GT|14.762|-90.992
Sumpango, GT|14.646|-90.734
Soloma, GT|15.658|-91.430
Solola, GT|14.771|-91.183
Santiago Sacatepequez, GT|14.635|-90.677
Santiago Atitlan, GT|14.638|-91.229
Santa Maria de Jesus, GT|14.495|-90.710
Santa Lucia Cotzumalguapa, GT|14.335|-91.023
Santa Cruz del Quiche, GT|15.030|-91.149
Santa Catarina Pinula, GT|14.570|-90.499
Santa Barbara, GT|14.436|-91.227
San Sebastian, GT|14.562|-91.649
San Pedro Sacatepequez, GT|14.968|-91.762
San Pedro Carcha, GT|15.477|-90.311
San Pedro Ayampuc, GT|14.779|-90.453
San Pablo Jocopilas, GT|14.589|-91.452
San Marcos, GT|14.964|-91.795
San Luis Jilotepeque, GT|14.647|-89.725
San Lucas Sacatepequez, GT|14.611|-90.657
San Juan Sacatepequez, GT|14.719|-90.644
San Jose Pinula, GT|14.546|-90.413
San Francisco Zapotitlan, GT|14.589|-91.521
San Francisco El Alto, GT|14.945|-91.443
San Felipe, GT|14.623|-91.595
San Cristobal Verapaz, GT|15.367|-90.478
San Benito, GT|16.917|-89.919
Sanarate, GT|14.788|-90.199
San Andres Xecul, GT|14.905|-91.483
San Andres Itzapa, GT|14.622|-90.843
Salcaja, GT|14.880|-91.457
Salama, GT|15.102|-90.319
Retalhuleu, GT|14.536|-91.678
Rabinal, GT|15.085|-90.493
Quetzaltenango, GT|14.845|-91.523
Puerto San Jose, GT|13.922|-90.819
Puerto Barrios, GT|15.727|-88.598
Tiquisate, GT|14.284|-91.361
Poptun, GT|16.331|-89.417
Petapa, GT|14.502|-90.562
Patzun, GT|14.682|-91.014
Patzicia, GT|14.632|-90.927
Patulul, GT|14.423|-91.160
Panzos, GT|15.399|-89.641
Palin, GT|14.404|-90.697
Palencia, GT|14.667|-90.357
Ostuncalco, GT|14.869|-91.621
Nuevo San Carlos, GT|14.593|-91.694
Nebaj, GT|15.406|-91.147
Nahuala, GT|14.843|-91.318
Morales, GT|15.472|-88.841
Momostenango, GT|15.044|-91.409
Mixco, GT|14.631|-90.607
Mazatenango, GT|14.534|-91.503
Masagua, GT|14.203|-90.848
Malacatan, GT|14.911|-92.058
Livingston, GT|15.828|-88.750
La Gomera, GT|14.082|-91.054
La Esperanza, GT|14.872|-91.561
Jutiapa, GT|14.285|-89.888
Jocotenango, GT|14.578|-90.738
Jalpatagua, GT|14.137|-90.009
Jalapa, GT|14.635|-89.991
Jacaltenango, GT|15.667|-91.712
Huehuetenango, GT|15.321|-91.470
Guazacapan, GT|14.074|-90.417
Gualan, GT|15.120|-89.357
Fraijanes, GT|14.465|-90.441
Flores, GT|16.923|-89.899
Esquipulas, GT|14.566|-89.352
Escuintla, GT|14.301|-90.788
El Tejar, GT|14.647|-90.791
Guastatoya, GT|14.854|-90.070
El Palmar, GT|14.651|-91.578
El Estor, GT|15.532|-89.331
El Asintal, GT|14.596|-91.727
Cuilapa, GT|14.275|-90.299
Comitancillo, GT|15.089|-91.750
Comalapa, GT|14.741|-90.888
Colomba, GT|14.707|-91.732
Coban, GT|15.470|-90.375
Coatepeque, GT|14.704|-91.864
Ciudad Vieja, GT|14.524|-90.763
Guatemala City, GT|14.641|-90.513
Chisec, GT|15.813|-90.289
Chiquimula, GT|14.801|-89.546
Chinautla, GT|14.703|-90.500
Chimaltenango, GT|14.659|-90.822
Chichicastenango, GT|14.943|-91.111
Chicacao, GT|14.543|-91.326
Cantel, GT|14.812|-91.455
Cabrican, GT|15.075|-91.648
Barberena, GT|14.307|-90.362
Asuncion Mita, GT|14.334|-89.711
Antigua Guatemala, GT|14.556|-90.733
Amatitlan, GT|14.477|-90.635
Alotenango, GT|14.486|-90.804
Tamuning-Tumon-Harmon Village, GU|13.488|144.781
Yigo Village, GU|13.536|144.889
Dededo Village, GU|13.518|144.839
Hagatna, GU|13.476|144.749
Mangilao Village, GU|13.448|144.801
Tamuning, GU|13.488|144.781
Xitole, GW|11.733|-14.817
Reino de Bandim, GW|11.850|-15.600
Reino de Antula, GW|11.900|-15.583
Quelele, GW|11.867|-15.633
Plaque, GW|11.883|-15.617
Gabu, GW|12.280|-14.222
Contumo, GW|11.850|-15.617
Bissau, GW|11.864|-15.598
Bafata, GW|12.166|-14.662
Bairro Militar, GW|11.875|-15.616
Belem, GW|11.853|-15.603
Luanda, GW|11.879|-15.600
Missira, GW|11.861|-15.607
Sintra-Nema, GW|11.862|-15.597
Santa-Luzia, GW|11.888|-15.590
New Amsterdam, GY|6.249|-57.516
Linden, GY|6.008|-58.307
Georgetown, GY|6.804|-58.155
Tsuen Wan, HK|22.371|114.113
Yuen Long San Hui, HK|22.433|114.033
Yuen Long Kau Hui, HK|22.448|114.032
Yuen Long, HK|22.445|114.026
Yeung Uk Tsuen, HK|22.450|114.017
Yau Tong, HK|22.296|114.236
Yau Ma Tei, HK|22.314|114.169
Wong Tai Sin, HK|22.350|114.183
Wo Che, HK|22.390|114.192
Wang Tau Hom, HK|22.340|114.187
Wan Chai, HK|22.281|114.173
Wah Fu, HK|22.255|114.136
Tuen Mun San Hui, HK|22.399|113.976
Tuen Mun, HK|22.392|113.972
Tsz Wan Shan, HK|22.352|114.200
Tsing Yi Town, HK|22.350|114.100
Tsim Sha Tsui, HK|22.300|114.167
Tseung Kwan O, HK|22.328|114.250
To Kwa Wan, HK|22.317|114.191
Tiu Keng Leng, HK|22.299|114.251
Tin Wan, HK|22.251|114.147
Tin Shui Wai, HK|22.457|114.002
Ting Kau, HK|22.370|114.079
Tai Wo Hau, HK|22.367|114.123
Tai Wai, HK|22.373|114.179
Tai Shui Hang, HK|22.406|114.224
Tai Po, HK|22.450|114.169
Tai Mei Tuk, HK|22.474|114.235
Tai Kok Tsui, HK|22.321|114.163
Siu Lek Yuen, HK|22.382|114.213
Shuen Wan, HK|22.468|114.208
Sheung Shui, HK|22.517|114.117
Shek O, HK|22.233|114.251
Shek Lei, HK|22.366|114.140
Shek Kip Mei, HK|22.331|114.168
Sha Tin Wai, HK|22.378|114.198
Sha Tin, HK|22.383|114.183
Sham Tseng, HK|22.367|114.050
Sham Shui Po, HK|22.330|114.159
Sau Mau Ping, HK|22.320|114.235
San Tin, HK|22.372|114.184
San Tin, HK|22.502|114.069
San Po Kong, HK|22.335|114.197
Sai Wan Ho, HK|22.284|114.223
Sai Kung, HK|22.383|114.267
Pok Fu Lam, HK|22.269|114.129
Ping Shan, HK|22.441|114.006
San Tung Chung Hang, HK|22.279|113.943
Mount Davis, HK|22.279|114.118
Mong Kok, HK|22.319|114.171
Mid Levels, HK|22.284|114.150
Ma Tau Wai, HK|22.321|114.187
Ma On Shan, HK|22.406|114.241
Leighton Hill, HK|22.276|114.184
Lam Tin, HK|22.309|114.236
Kwun Tong, HK|22.312|114.222
Kwai Chung, HK|22.368|114.139
Kowloon Tong, HK|22.333|114.180
Kowloon City, HK|22.330|114.192
Kowloon, HK|22.317|114.183
Kennedy Town, HK|22.283|114.130
Kam Tin, HK|22.441|114.060
Hong Lok Yuen, HK|22.463|114.155
Hong Kong, HK|22.278|114.175
Ho Man Tin, HK|22.316|114.182
Aberdeen, HK|22.248|114.153
Ha Tsuen, HK|22.447|113.992
Hang Hau, HK|22.318|114.270
Fo Tan, HK|22.398|114.193
Fanling, HK|22.495|114.139
Discovery Bay, HK|22.300|114.017
Chuk Yuen, HK|22.345|114.193
Cheung Chau, HK|22.211|114.028
Chek Chue, HK|22.218|114.212
Victoria, HK|22.288|114.144
Fortress Hill, HK|22.289|114.194
Jordan, HK|22.305|114.170
Wong Chuk Hang, HK|22.240|114.170
Tai Koo, HK|22.284|114.216
Tung Chung, HK|22.288|113.942
Sung Wong Toi, HK|22.325|114.191
So Uk, HK|22.341|114.157
City One, HK|22.387|114.203
Mei Foo, HK|22.337|114.139
Kadoorie, HK|22.322|114.176
Kai Tak, HK|22.324|114.197
The Peak, HK|22.262|114.156
Lei Tung, HK|22.241|114.158
Pok Hong, HK|22.376|114.196
Shui Chuen O, HK|22.372|114.198
Prince Edward, HK|22.324|114.179
Discovery Park, HK|22.376|114.111
Nam Cheong, HK|22.328|114.154
Olympic, HK|22.319|114.157
Whampoa, HK|22.305|114.190
Laguna City, HK|22.306|114.229
Choi Wan, HK|22.334|114.214
Sun Tin Wai, HK|22.371|114.187
Pat Heung, HK|22.446|114.092
Butterfly, HK|22.376|113.963
Fairview Park, HK|22.467|114.048
Shap Pat Heung, HK|22.425|114.036
South Horizons, HK|22.244|114.148
LOHAS Park, HK|22.293|114.272
Braemar Hill, HK|22.283|114.200
Hok Yuen, HK|22.310|114.188
Laguna Verde, HK|22.307|114.191
Wu Kai Sha, HK|22.430|114.242
Lee On, HK|22.426|114.241
Kam Ying, HK|22.423|114.237
Sam Shing, HK|22.381|113.979
Aldrich Bay, HK|22.282|114.225
City Garden, HK|22.290|114.193
Keng Hau, HK|22.365|114.175
Un Chau Estate, HK|22.336|114.156
Pak Tin Estate, HK|22.337|114.167
Shek Kip Mei Estate, HK|22.334|114.165
Mei Foo Sun Chuen, HK|22.336|114.140
Hoi Lai Estate, HK|22.332|114.147
Fu Cheong Estate, HK|22.329|114.154
So Uk Estate, HK|22.342|114.157
Siu Sai Wan Estate, HK|22.262|114.249
Taikoo Shing, HK|22.286|114.219
Heng Fa Chuen, HK|22.277|114.241
Yiu Tung Estate, HK|22.278|114.223
Lei Tung Estate, HK|22.241|114.155
South Horizons (Estate), HK|22.244|114.146
Whampoa Garden, HK|22.305|114.189
Oi Man Estate, HK|22.312|114.179
Tak Long Estate, HK|22.330|114.203
Chuk Yuen North Estate, HK|22.346|114.192
Tung Tau Estate, HK|22.332|114.193
Choi Hung Estate, HK|22.336|114.206
Choi Wan Estate (I & II), HK|22.333|114.213
Lower Wong Tai Sin Estate (I & II), HK|22.339|114.194
Tsz Ching Estate, HK|22.351|114.201
Wang Tau Hom Estate, HK|22.340|114.187
New Territories, HK|22.424|114.111
Hong Kong Island, HK|22.263|114.184
Kowloon City Centre, HK|22.330|114.189
Kowloon West End, HK|22.328|114.185
Puerto Cortez, HN|15.826|-87.930
Yoro, HN|15.138|-87.128
Yorito, HN|15.067|-87.283
Yamaranguila, HN|14.283|-88.242
Villanueva, HN|15.315|-87.994
Villa de San Antonio, HN|14.326|-87.614
Victoria, HN|14.938|-87.394
Tocoa, HN|15.683|-86.000
Teupasenti, HN|14.217|-86.700
Tela, HN|15.774|-87.467
Tegucigalpa, HN|14.082|-87.207
Sulaco, HN|14.917|-87.267
Sonaguera, HN|15.633|-86.333
Siguatepeque, HN|14.597|-87.831
Saba, HN|15.467|-86.250
Santa Rosa de Copan, HN|14.774|-88.776
Santa Rita, HN|15.200|-87.883
Santa Cruz de Yojoa, HN|14.981|-87.891
Santa Barbara, HN|14.922|-88.238
San Pedro Sula, HN|15.506|-88.026
San Pedro de Copan, HN|14.617|-88.867
San Luis, HN|15.127|-88.439
San Lorenzo, HN|13.424|-87.447
San Juan de Flores, HN|14.267|-87.033
San Jose de Colinas, HN|15.041|-88.302
San Francisco de Yojoa, HN|15.014|-87.972
San Antonio de Cortes, HN|15.116|-88.041
Sabanagrande, HN|13.808|-87.259
Quimistan, HN|15.348|-88.405
Potrerillos, HN|15.230|-87.964
Omoa, HN|15.776|-88.038
Olanchito, HN|15.481|-86.574
Moroceli, HN|14.117|-86.867
Marcovia, HN|13.288|-87.310
Macuelizo, HN|15.313|-88.541
Lepaera, HN|14.779|-88.590
La Paz, HN|14.321|-87.676
Langue, HN|13.621|-87.653
La Lima, HN|15.433|-87.917
La Iguala, HN|14.617|-88.467
La Ceiba, HN|15.760|-86.782
Juticalpa, HN|14.664|-86.222
Iriona, HN|15.968|-85.093
Gualaco, HN|15.025|-86.071
Esquias, HN|14.744|-87.371
Erandique, HN|14.238|-88.464
El Rosario, HN|14.579|-87.727
El Progreso, HN|15.400|-87.800
El Paraiso, HN|13.867|-86.550
El Negrito, HN|15.317|-87.700
Dulce Nombre de Culmi, HN|15.100|-85.533
Danli, HN|14.033|-86.583
Cucuyagua, HN|14.648|-88.874
Corquin, HN|14.567|-88.867
Comayagua, HN|14.456|-87.640
Colomoncagua, HN|13.950|-88.283
Cofradia, HN|15.400|-88.150
Ciudad Choluteca, HN|13.306|-87.179
Choloma, HN|15.614|-87.953
Catacamas, HN|14.851|-85.894
Belen Gualcho, HN|14.483|-88.800
Azacualpa, HN|14.712|-88.090
Atima, HN|14.933|-88.490
Arizona, HN|15.633|-87.317
La Ceiba, HN|15.767|-86.833
Zapresic, HR|45.856|15.808
Zagreb, HR|45.814|15.978
Zadar, HR|44.116|15.225
Vukovar, HR|45.352|19.002
Vinkovci, HR|45.288|18.805
Velika Gorica, HR|45.712|16.076
Varazdin, HR|46.304|16.338
Split, HR|43.509|16.439
Solin, HR|43.543|16.493
Slavonski Brod, HR|45.162|18.016
Pozega, HR|45.340|17.685
Sisak, HR|45.466|16.377
Sibenik, HR|43.734|15.894
Sesvete, HR|45.831|16.116
Samobor, HR|45.803|15.718
Rijeka, HR|45.327|14.442
Pula, HR|44.868|13.848
Osijek, HR|45.551|18.694
Koprivnica, HR|46.164|16.830
Dubrovnik, HR|42.641|18.109
GJakovo, HR|45.308|18.411
Cakovec, HR|46.384|16.434
Bjelovar, HR|45.898|16.851
Karlovac, HR|45.492|15.550
Centar, HR|45.813|15.978
Liberpolis, HR|45.775|18.880
Verrettes, HT|19.050|-72.466
Thomazeau, HT|18.653|-72.094
Terrier Rouge, HT|19.636|-71.955
Saint-Raphael, HT|19.439|-72.199
Saint-Michel de lAtalaye, HT|19.371|-72.335
Saint-Marc, HT|19.111|-72.701
Port-de-Paix, HT|19.940|-72.830
Port-au-Prince, HT|18.543|-72.339
Tigwav, HT|18.431|-72.865
Petionville, HT|18.512|-72.285
Miragoane, HT|18.446|-73.090
Lenbe, HT|19.706|-72.403
Leogane, HT|18.511|-72.633
Kenscoff, HT|18.448|-72.284
Jeremie, HT|18.650|-74.117
Jacmel, HT|18.236|-72.537
Hinche, HT|19.141|-72.012
Gressier, HT|18.541|-72.527
Grand Gosier, HT|18.185|-71.918
Grangwav, HT|18.426|-72.770
Gonaives, HT|19.448|-72.689
Fond Parisien, HT|18.505|-71.981
Dessalines, HT|19.262|-72.516
Desarmes, HT|18.993|-72.391
Delmas, HT|18.545|-72.300
Croix-des-Bouquets, HT|18.577|-72.226
Les Cayes, HT|18.192|-73.749
Cap-Haitien, HT|19.759|-72.198
Arcahaie, HT|18.770|-72.512
Cite Soleil, HT|18.580|-72.338
Ti Port-de-Paix, HT|19.933|-72.833
Carrefour, HT|18.533|-72.400
Ujszeged, HU|46.248|20.166
Torokszentmiklos, HU|47.183|20.417
Tiszaujvaros, HU|47.933|21.083
Szolnok, HU|47.181|20.198
Szentes, HU|46.658|20.261
Szeged, HU|46.253|20.148
Szarvas, HU|46.867|20.550
Satoraljaujhely, HU|48.395|21.659
Puspokladany, HU|47.317|21.117
Ozd, HU|48.217|20.300
Oroshaza, HU|46.567|20.667
Nyiregyhaza, HU|47.955|21.717
Miskolc, HU|48.103|20.778
Mezotur, HU|47.000|20.633
Mezokovesd, HU|47.817|20.583
Mateszalka, HU|47.955|22.323
Mako, HU|46.217|20.483
Kisvarda, HU|48.217|22.083
Kazincbarcika, HU|48.250|20.633
Karcag, HU|47.317|20.933
Hodmezovasarhely, HU|46.417|20.333
Hajduszoboszlo, HU|47.450|21.400
Hajdunanas, HU|47.850|21.433
Hajduboszormeny, HU|47.667|21.517
Gyula, HU|46.650|21.283
Gyomaendrod, HU|46.933|20.833
Eger, HU|47.903|20.373
Diosgyor, HU|48.100|20.683
Debrecen, HU|47.532|21.624
Csongrad, HU|46.713|20.142
Bekescsaba, HU|46.683|21.100
Bekes, HU|46.767|21.133
Balmazujvaros, HU|47.617|21.350
Abony, HU|47.190|20.005
Zuglo, HU|47.518|19.105
Zalaegerszeg, HU|46.837|16.844
Veszprem, HU|47.093|17.911
Veresegyhaz, HU|47.646|19.295
Vecses, HU|47.407|19.286
Varpalota, HU|47.199|18.140
Vac, HU|47.776|19.136
Ujpest, HU|47.569|19.085
Tatabanya, HU|47.592|18.381
Tata, HU|47.653|18.318
Tapolca, HU|46.882|17.441
Szombathely, HU|47.231|16.622
Szigetszentmiklos, HU|47.344|19.043
Szentendre, HU|47.669|19.076
Szekszard, HU|46.347|18.712
Szekesfehervar, HU|47.190|18.410
Szazhalombatta, HU|47.329|18.939
Sopron, HU|47.685|16.590
Siofok, HU|46.904|18.058
Sashalom, HU|47.515|19.171
Sarvar, HU|47.254|16.935
Salgotarjan, HU|48.099|19.803
Rakosszentmihaly, HU|47.525|19.155
Rakospalota, HU|47.565|19.122
Rakoskeresztur, HU|47.473|19.262
Pestlorinc, HU|47.430|19.216
Pesterzsebet, HU|47.433|19.117
Pest, HU|47.500|19.083
Pecs, HU|46.076|18.228
Papa, HU|47.330|17.467
Paks, HU|46.622|18.856
Oroszlany, HU|47.487|18.312
Obuda, HU|47.538|19.039
Naphegy, HU|47.488|19.025
Nagykoroes, HU|47.034|19.779
Nagykanizsa, HU|46.453|16.991
Mosonmagyarovar, HU|47.868|17.270
Monor, HU|47.351|19.447
Mohacs, HU|45.990|18.686
Matyasfoeld, HU|47.509|19.211
Lagymanyos, HU|47.472|19.058
Komlo, HU|46.193|18.265
Komarom, HU|47.743|18.119
Kobanya, HU|47.484|19.139
Kispest, HU|47.452|19.140
Kiskunhalas, HU|46.434|19.485
Kiskunfelegyhaza, HU|46.712|19.845
Kiskoros, HU|46.621|19.285
Keszthely, HU|46.768|17.243
Kelenfoeld, HU|47.466|19.031
Kecskemet, HU|46.906|19.691
Kaposvar, HU|46.367|17.800
Kalocsa, HU|46.530|18.973
Jaszbereny, HU|47.500|19.917
Hatvan, HU|47.667|19.683
Gyor, HU|47.683|17.635
Gyongyos, HU|47.783|19.928
Gyal, HU|47.384|19.221
Godollo, HU|47.597|19.355
God, HU|47.683|19.134
Fot, HU|47.618|19.189
Ferencvaros, HU|47.478|19.091
Esztergom, HU|47.793|18.741
Erzsebetvaros, HU|47.502|19.072
Erd, HU|47.395|18.914
Dunaujvaros, HU|46.965|18.940
Dunakeszi, HU|47.636|19.139
Dunaharaszti, HU|47.355|19.098
Dombovar, HU|46.377|18.137
Dabas, HU|47.186|19.311
Cegled, HU|47.173|19.800
Budapest, HU|47.498|19.040
Budaors, HU|47.462|18.958
Budafok, HU|47.424|19.036
Buda, HU|47.500|19.033
Bekasmegyer, HU|47.600|19.043
Baja, HU|46.183|18.953
Angyalfoeld, HU|47.548|19.080
Ajka, HU|47.102|17.559
Ujpalota, HU|47.537|19.144
Budapest V. keruelet, HU|47.500|19.051
Budapest XII. keruelet, HU|47.492|19.015
Budapest XI. keruelet, HU|47.476|19.036
Budapest VIII. keruelet, HU|47.489|19.070
Budapest VI. keruelet, HU|47.504|19.066
Budapest XIII. keruelet, HU|47.530|19.081
Budapest IV. keruelet, HU|47.562|19.089
Budapest XV. keruelet, HU|47.563|19.117
Budapest XVI. keruelet, HU|47.515|19.170
Budapest XIX. keruelet, HU|47.453|19.149
Budapest XVIII. keruelet, HU|47.444|19.176
Budapest XXIII. keruelet, HU|47.398|19.115
Budapest XXII. keruelet, HU|47.427|19.040
Budapest XXI. keruelet, HU|47.422|19.066
Budapest XX. keruelet, HU|47.437|19.101
Budapest XVII. keruelet, HU|47.480|19.254
Budapest III. keruelet, HU|47.542|19.045
Budapest II. keruelet, HU|47.520|19.022
Budapest I. keruelet, HU|47.497|19.040
Jozsefvaros, HU|47.489|19.073
Csepel-Kiralyerdo, HU|47.403|19.092
Csepel-Csillagtelep, HU|47.409|19.059
Koezepso-Ferencvaros, HU|47.473|19.080
Ohegy, HU|47.478|19.148
Ujlipotvaros, HU|47.516|19.053
Alsorakos, HU|47.528|19.123
Kaposztasmegyer, HU|47.589|19.116
Tongging, ID|2.898|98.523
Teluk Nibung, ID|3.001|99.816
Teluk Dalam, ID|0.573|97.803
Tebingtinggi, ID|3.329|99.162
Tarutung, ID|2.015|98.965
Tanjungtiram, ID|4.061|98.370
Tanjungbalai, ID|2.967|99.800
Sunggal, ID|3.576|98.615
Stabat, ID|3.733|98.450
Singkil, ID|2.287|97.788
Sigli, ID|5.385|95.961
Sidikalang, ID|2.749|98.313
Sibolga, ID|1.740|98.781
Sabang, ID|5.890|95.316
Reuleuet, ID|5.217|96.283
Rantauprapat, ID|2.100|99.833
Percut, ID|3.625|98.864
Perbaungan, ID|3.568|98.956
Pematangsiantar, ID|2.959|99.069
Paropo, ID|2.866|98.521
Pangururan, ID|2.608|98.696
Pangkalan Brandan, ID|4.024|98.278
Padangsidempuan, ID|1.380|99.271
Meulaboh, ID|4.144|96.127
Medan, ID|3.583|98.667
Lhokseumawe, ID|5.180|97.151
Langsa, ID|4.468|97.968
Lahewa, ID|1.394|97.168
Labuhan Deli, ID|3.879|98.633
Kisaran, ID|2.985|99.616
Kabanjahe, ID|3.100|98.491
Gunungsitoli, ID|1.289|97.614
Deli Tua, ID|3.508|98.684
Blangpidie, ID|3.740|96.836
Bireun, ID|5.203|96.701
Binjai, ID|3.600|98.485
Berastagi, ID|3.195|98.509
Belawan, ID|3.776|98.683
Barus, ID|2.011|98.398
Bandar, ID|2.050|99.750
Banda Aceh, ID|5.542|95.333
Yogyakarta, ID|-7.801|110.365
Wonosobo, ID|-7.359|109.903
Wonosari, ID|-7.966|110.604
Wonopringgo, ID|-6.983|109.617
Wongsorejo, ID|-7.991|114.401
Wiradesa, ID|-6.892|109.619
Weru, ID|-6.711|108.504
Weleri, ID|-6.971|110.067
Welahan, ID|-6.800|110.717
Wedi, ID|-7.743|110.579
Watampone, ID|-4.539|120.328
Wangon, ID|-7.516|109.054
Wanaraja, ID|-7.175|107.981
Wamena, ID|-4.096|138.948
Waisai, ID|-0.238|130.507
Waingapu, ID|-9.657|120.264
Utan, ID|-6.177|106.947
Ungaran, ID|-7.140|110.405
Makassar, ID|-5.149|119.432
Ubud, ID|-8.510|115.265
Tulungagung, ID|-8.066|111.903
Tulangan Utara, ID|-7.474|112.650
Tuban, ID|-6.898|112.065
Tual, ID|-5.629|132.752
Trucuk, ID|-7.718|110.659
Trenggalek, ID|-8.076|111.706
Tondano, ID|1.305|124.913
Tomohon, ID|1.317|124.804
Toli-Toli, ID|1.040|120.818
Tobelo, ID|1.728|128.009
Tiom, ID|-3.924|138.455
Timika, ID|-4.614|136.677
Ternate, ID|0.791|127.384
Terbanggi Besar, ID|-4.879|105.218
Teminabuan, ID|-1.442|132.014
Tegal, ID|-6.869|109.140
Tayu, ID|-6.540|111.052
Tasikmalaya, ID|-7.327|108.221
Tarub, ID|-6.933|109.167
Tarakan, ID|3.313|117.592
Tanjung Selor, ID|2.837|117.365
Tanjung Pinang, ID|0.917|104.458
Tanjung Pandan, ID|-2.734|107.635
Bandar Lampung, ID|-5.429|105.261
Tanjung Balai, ID|1.000|103.422
Tanjungagung, ID|-3.937|103.805
Tanjung, ID|-2.171|115.408
Tanggulangin, ID|-7.500|112.700
Tangerang, ID|-6.178|106.630
Taliwang, ID|-8.745|116.853
Tahuna, ID|3.611|125.486
Tabanan, ID|-8.541|115.125
Surakarta, ID|-7.556|110.832
Surabaya, ID|-7.249|112.751
Sungai Raya, ID|0.700|108.900
Sungai Penuh, ID|-2.056|101.391
Sungailiat, ID|-1.854|106.122
Sumenep, ID|-7.012|113.860
Sumedang Utara, ID|-6.850|107.917
Sumedang, ID|-6.859|107.916
Sumberpucung, ID|-8.159|112.483
Sumber, ID|-6.760|108.483
Sumbawa Besar, ID|-8.493|117.420
Sokaraja, ID|-7.458|109.288
Sukabumi, ID|-6.918|106.927
Subang, ID|-6.570|107.757
Srono, ID|-8.400|114.267
Srandakan, ID|-7.939|110.251
Sragen, ID|-7.426|111.022
Sorong, ID|-0.880|131.261
Soreang, ID|-7.033|107.518
Solok, ID|-0.801|100.657
Soko, ID|-7.483|112.427
Sofifi, ID|0.737|127.559
Soe, ID|-9.861|124.284
Sleman, ID|-7.716|110.356
Slawi, ID|-6.982|109.141
Situbondo, ID|-7.706|114.010
Sintang, ID|0.067|111.500
Sinjai, ID|-5.124|120.253
Singosari, ID|-7.892|112.666
Singojuruh, ID|-8.317|114.233
Singkawang, ID|0.909|108.985
Sengkang, ID|-4.128|120.030
Singaraja, ID|-8.112|115.088
Singaparna, ID|-7.351|108.111
Simpang, ID|-1.264|104.097
Sijunjung, ID|-0.701|100.977
Sidoarjo, ID|-7.448|112.718
Sidareja, ID|-7.485|108.792
Sewon, ID|-7.876|110.359
Serpong, ID|-6.317|106.664
Serang, ID|-6.115|106.154
Sepatan, ID|-6.119|106.575
Semarang, ID|-6.993|110.421
Selong, ID|-8.650|116.532
Selogiri, ID|-7.783|110.867
Sawangan, ID|-6.403|106.774
Sangkapura, ID|-5.845|112.652
Sanana, ID|-2.059|125.978
Sampit, ID|-2.531|112.950
Sampang, ID|-7.187|113.239
Samarinda, ID|-0.492|117.146
Salatiga, ID|-7.332|110.493
Ruteng, ID|-8.611|120.464
Rengasdengklok, ID|-6.159|107.298
Rembangan, ID|-6.704|111.342
Rantepao, ID|-2.970|119.898
Ransiki, ID|-1.508|134.171
Rangkasbitung, ID|-6.359|106.249
Randudongkal, ID|-7.098|109.324
Rajapolah, ID|-7.221|108.190
Raha, ID|-4.838|122.721
Purwokerto, ID|-7.421|109.234
Purwodadi, ID|-7.087|110.916
Purwakarta, ID|-6.557|107.443
Purbalingga, ID|-7.388|109.364
Pundong, ID|-7.952|110.349
Probolinggo, ID|-7.754|113.216
Prigen, ID|-7.683|112.617
Praya, ID|-8.705|116.270
Candi Prambanan, ID|-7.750|110.494
Poso, ID|-1.396|120.752
Pontianak, ID|-0.032|109.325
Ponorogo, ID|-7.869|111.462
Polewali, ID|-3.432|119.344
Plumbon, ID|-6.705|108.473
Prabumulih, ID|-3.434|104.231
Pemangkat, ID|1.167|108.967
Pemalang, ID|-6.892|109.383
Pelabuhanratu, ID|-6.987|106.551
Pekanbaru, ID|0.517|101.442
Pekalongan, ID|-6.889|109.675
Pecangaan, ID|-6.698|110.711
Payakumbuh, ID|-0.216|100.633
Pati, ID|-6.756|111.038
Pasuruan, ID|-7.645|112.907
Paseh, ID|-7.068|107.794
Pasarkemis, ID|-6.170|106.530
Parung, ID|-6.421|106.733
Pariaman, ID|-0.619|100.120
Parepare, ID|-4.013|119.626
Pare, ID|-7.768|112.198
Panji, ID|-7.725|114.100
Pangkalpinang, ID|-2.129|106.114
Pangkalanbuun, ID|-2.683|111.626
Pandeglang, ID|-6.308|106.107
Pandaan, ID|-7.653|112.688
Pandak, ID|-7.913|110.294
Panarukan, ID|-7.702|113.918
Pamulang, ID|-6.343|106.738
Pameungpeuk, ID|-7.018|107.604
Pamekasan, ID|-7.157|113.475
Pamanukan, ID|-6.284|107.811
Palu, ID|-0.908|119.871
Palopo, ID|-2.993|120.197
Palimanan, ID|-6.707|108.424
Palembang, ID|-2.917|104.746
Palangkaraya, ID|-2.208|113.917
Pakisaji, ID|-8.066|112.598
Pagar Alam, ID|-4.025|103.247
Padangpanjang, ID|-0.456|100.405
Padang, ID|-0.949|100.354
Paciran, ID|-6.877|112.376
Nunukan, ID|4.138|117.651
Ngunut, ID|-8.106|112.016
Ngoro, ID|-7.684|112.258
Ngawi, ID|-7.404|111.446
Nganjuk, ID|-7.605|111.903
Negara, ID|-8.357|114.617
Namrole, ID|-3.845|126.726
Namlea, ID|-3.262|127.093
Nabire, ID|-3.360|135.501
Muntok, ID|-2.067|105.162
Muntilan, ID|-7.581|110.293
Muncar, ID|-8.433|114.333
Mulia, ID|-3.715|137.985
Muara Teweh, ID|-0.947|114.896
Muara Bungo, ID|-1.490|102.115
Mranggen, ID|-7.027|110.516
Mojokerto, ID|-7.466|112.434
Mojoagung, ID|-7.567|112.350
Mlonggo, ID|-6.533|110.700
Metro, ID|-5.113|105.307
Mertoyudan, ID|-7.520|110.226
Melati, ID|-7.733|110.367
Maumere, ID|-8.620|122.211
Mataram, ID|-8.583|116.117
Masamba, ID|-2.554|120.328
Martapura, ID|-3.411|114.864
Maros, ID|-5.006|119.573
Margasari, ID|-7.095|109.025
Margahayukencana, ID|-6.971|107.567
Manokwari, ID|-0.863|134.064
Manismata, ID|-2.467|111.033
Manggar, ID|-2.883|108.267
Mendaha, ID|-1.016|103.593
Manado, ID|1.482|124.849
Malinau, ID|3.589|116.624
Malang, ID|-7.980|112.630
Majene, ID|-3.540|118.971
Majenang, ID|-7.298|108.764
Majalengka, ID|-6.836|108.228
Magelang, ID|-7.471|110.218
Madiun, ID|-7.630|111.524
Luwuk, ID|-0.952|122.787
Lumajang, ID|-8.133|113.225
Lubuklinggau, ID|-3.295|102.861
Loa Janan, ID|-0.583|117.095
Lewoleba, ID|-8.372|123.418
Lembang, ID|-6.812|107.618
Lebaksiu, ID|-7.050|109.144
Lawang, ID|-7.835|112.695
Lasem, ID|-6.692|111.453
Lamongan, ID|-7.117|112.417
Lahat, ID|-3.785|103.543
Labuan Bajo, ID|-8.496|119.888
Labuan, ID|-6.378|105.830
Kutoarjo, ID|-7.717|109.913
Kuta, ID|-8.723|115.172
Kuningan, ID|-6.976|108.483
Kudus, ID|-6.805|110.841
Kuala Tungkal, ID|-0.816|103.461
Kualakapuas, ID|-3.009|114.388
Kroya, ID|-7.633|109.246
Krian, ID|-7.410|112.579
Kresek, ID|-6.131|106.380
Kraksaan, ID|-7.758|113.396
Kotamobagu, ID|0.742|124.312
Kotabumi, ID|-4.825|104.882
Klungkung, ID|-8.533|115.400
Klaten, ID|-7.706|110.606
Klangenan, ID|-6.709|108.440
Ketanggungan, ID|-6.938|108.891
Kertosono, ID|-7.583|112.100
Kepanjen, ID|-8.130|112.573
Kendari, ID|-3.978|122.515
Kencong, ID|-8.283|113.367
Kefamenanu, ID|-9.447|124.478
Kedungwuni, ID|-6.970|109.648
Kedungwaru, ID|-8.067|111.917
Kediri, ID|-7.817|112.017
Kebonarun, ID|-7.700|110.563
Kebomas, ID|-7.167|112.633
Kawasi, ID|-1.591|127.407
Kawalu, ID|-7.382|108.208
Katobu, ID|-4.830|122.726
Karawang, ID|-6.305|107.320
Karangsembung, ID|-6.849|108.642
Amlapura, ID|-8.450|115.617
Karanganom, ID|-7.649|110.625
Karangampel, ID|-6.462|108.452
Kamal, ID|-7.168|112.719
Kalianget, ID|-7.054|113.942
Kalabahi, ID|-8.215|124.546
Juwana, ID|-6.715|111.151
Jombang, ID|-7.546|112.233
Jogonalan, ID|-7.704|110.536
Jepara, ID|-6.592|110.671
Jember, ID|-8.172|113.700
Jekulo, ID|-6.806|110.926
Jatiwangi, ID|-6.734|108.263
Jatiroto, ID|-7.883|111.117
Jatibarang, ID|-6.475|108.315
Jaten, ID|-7.577|110.897
Jambi City, ID|-1.600|103.617
Jakarta, ID|-6.215|106.845
Indramayu, ID|-6.326|108.320
Indralaya, ID|-3.252|104.676
Grogol, ID|-7.601|110.819
Gresik, ID|-7.154|112.656
Gorontalo, ID|0.537|123.062
Gongdanglegi Kulon, ID|-8.175|112.636
Gombong, ID|-7.607|109.514
Godean, ID|-7.770|110.294
Genteng, ID|-8.367|114.150
Gedangan, ID|-7.391|112.727
Gebog, ID|-6.735|110.844
Garut, ID|-7.245|107.921
Gampengrejo, ID|-7.764|112.035
Gambiran Satu, ID|-8.394|114.146
Galesong, ID|-5.317|119.366
Fakfak, ID|-2.925|132.298
Ende, ID|-8.843|121.662
Dumai, ID|1.667|101.443
Dukuhturi, ID|-6.900|109.083
Driyorejo, ID|-7.366|112.622
Dompu, ID|-8.537|118.463
Dobo, ID|-5.761|134.234
Diwek, ID|-7.579|112.231
Depok, ID|-7.763|110.432
Depok, ID|-6.400|106.819
Denpasar, ID|-8.650|115.217
Demak, ID|-6.891|110.640
Delanggu, ID|-7.617|110.683
Daruba, ID|2.050|128.294
Dampit, ID|-8.212|112.749
Curup, ID|-3.470|102.521
Curug, ID|-6.266|106.556
Comal, ID|-6.905|109.535
Colomadu, ID|-7.533|110.750
Citeureup, ID|-6.486|106.882
Cirebon, ID|-6.706|108.557
Ciputat, ID|-6.237|106.696
Cimahi, ID|-6.872|107.543
Cileunyi, ID|-6.939|107.753
Cileungsir, ID|-6.395|106.959
Cilegon, ID|-6.014|106.054
Cilacap, ID|-7.726|109.009
Cikarang, ID|-6.261|107.153
Cikampek, ID|-6.420|107.456
Cicurug, ID|-6.781|106.782
Cibinong, ID|-6.482|106.854
Cianjur, ID|-6.822|107.139
Ciamis, ID|-7.326|108.353
Cepu, ID|-7.147|111.591
Ceper, ID|-7.674|110.679
Caringin, ID|-6.706|106.821
Ciampea, ID|-6.555|106.701
Bungku, ID|-2.547|121.972
Bulakamba, ID|-6.875|108.956
Bukittinggi, ID|-0.309|100.371
Buduran, ID|-7.428|112.723
Buaran, ID|-7.050|109.550
Boyolangu, ID|-8.118|111.894
Boyolali, ID|-7.533|110.596
Bontang, ID|0.132|117.485
Bondowoso, ID|-7.913|113.821
Bojonegoro, ID|-7.150|111.882
Bogor, ID|-6.594|106.789
Blora, ID|-6.970|111.419
Blitar, ID|-8.098|112.168
Bitung, ID|1.441|125.128
Bintuni, ID|-2.110|133.525
Bima, ID|-8.460|118.727
Biak, ID|-1.177|136.082
Besuki, ID|-7.734|113.698
Benoa, ID|-8.755|115.218
Bengkulu, ID|-3.800|102.266
Bengkayang, ID|0.832|109.436
Bekasi, ID|-6.235|106.990
Baubau, ID|-5.463|122.602
Baturaja, ID|-4.129|104.167
Baturaden, ID|-7.300|109.217
Batu, ID|-7.870|112.528
Batang, ID|-6.485|110.708
Barabai, ID|-2.583|115.383
Banyuwangi, ID|-8.232|114.358
Banyumas, ID|-7.514|109.294
Bantul, ID|-7.888|110.329
Banjarmasin, ID|-3.320|114.591
Banjarbaru, ID|-3.441|114.837
Banjaran, ID|-7.045|107.588
Banjar, ID|-8.190|114.968
Banjar, ID|-7.196|107.431
Bangkalan, ID|-7.045|112.735
Bangil, ID|-7.599|112.819
Bandung, ID|-6.922|107.607
Bambanglipuro, ID|-7.950|110.283
Balung, ID|-7.733|113.917
Balikpapan, ID|-1.268|116.829
Balapulang, ID|-7.049|109.101
Balai Pungut, ID|1.059|101.291
Baki, ID|-7.613|110.784
Baekrajan, ID|-6.767|110.854
Babat, ID|-7.113|112.164
Atambua, ID|-9.106|124.892
Astanajapura, ID|-6.802|108.631
Arjawinangun, ID|-6.645|108.410
Amuntai, ID|-2.418|115.249
Ambon, ID|-3.696|128.183
Ambarawa, ID|-7.263|110.397
Amahai, ID|-3.340|128.920
Airmadidi, ID|1.428|124.978
Agats, ID|-5.545|138.135
Adiwerna, ID|-6.938|109.132
Padalarang, ID|-6.838|107.473
Ciranjang-hilir, ID|-6.820|107.257
Leuwiliang, ID|-7.117|107.502
Cikupa, ID|-6.236|106.508
Teluknaga, ID|-6.099|106.638
Karangnongko, ID|-7.796|110.587
Gamping Lor, ID|-7.796|110.326
Kasihan, ID|-7.827|110.329
Ngemplak, ID|-7.550|110.716
Kartasura, ID|-7.552|110.738
Gatak, ID|-7.591|110.704
Kupang, ID|-10.171|123.607
Sentani, ID|-2.569|140.513
Merauke, ID|-8.500|140.406
Jayapura, ID|-2.534|140.718
Abepura, ID|-2.596|140.632
Batam, ID|1.149|104.025
Subulussalam, ID|2.662|97.883
Seririt, ID|-8.193|114.939
Bedugul, ID|-8.450|115.593
Sukawati, ID|-8.491|115.046
Tambolaka, ID|-9.428|119.238
Tuban, ID|-8.743|115.172
Batubulan, ID|-8.624|115.262
Pekan Bahapal, ID|3.113|99.174
South Tangerang, ID|-6.289|106.718
Masohi, ID|-3.298|128.969
Amlapura city, ID|-8.449|115.606
Kota Sambas, ID|1.363|109.301
Dalung, ID|-8.626|115.170
Nusantara, ID|-0.973|116.709
Wexford, IE|52.334|-6.457
Waterford, IE|52.258|-7.112
Tullamore, IE|53.274|-7.489
Tralee, IE|52.270|-9.703
Tallaght, IE|53.286|-6.373
Swords, IE|53.460|-6.218
Sligo, IE|54.270|-8.469
Rathfarnham, IE|53.301|-6.283
Portlaoise, IE|53.034|-7.300
Droichead Nua, IE|53.182|-6.797
Navan, IE|53.653|-6.681
Naas, IE|53.216|-6.667
An Muileann gCearr, IE|53.525|-7.338
Maynooth, IE|53.385|-6.594
Malahide, IE|53.451|-6.154
Lucan, IE|53.357|-6.449
Limerick, IE|52.665|-8.623
Letterkenny, IE|54.950|-7.733
Leixlip, IE|53.366|-6.496
Kilkenny, IE|52.654|-7.252
Greystones, IE|53.141|-6.063
Galway, IE|53.272|-9.051
Finglas, IE|53.389|-6.297
Ennis, IE|52.844|-8.986
Dun Laoghaire, IE|53.294|-6.136
Dundalk, IE|54.000|-6.417
Dublin, IE|53.333|-6.249
Drogheda, IE|53.719|-6.348
Douglas, IE|51.874|-8.435
Cork, IE|51.898|-8.471
Cluain Meala, IE|52.355|-7.704
Celbridge, IE|53.342|-6.544
Carrigaline, IE|51.812|-8.399
Carlow, IE|52.841|-6.926
Bray, IE|53.203|-6.098
Blanchardstown, IE|53.388|-6.376
Ballincollig, IE|51.883|-8.583
Balbriggan, IE|53.608|-6.183
Athlone, IE|53.423|-7.937
Sandyford, IE|53.275|-6.225
Templeogue, IE|53.295|-6.309
Donaghmede, IE|53.398|-6.162
South Dublin, IE|53.290|-6.342
Jerusalem, IL|31.769|35.216
Giv`at Hananya, IL|31.767|35.233
Modiin Makkabbim Reut, IL|31.894|35.015
Zikhron Yaaqov, IL|32.569|34.954
Safed, IL|32.965|35.496
Yoqneam Illit, IL|32.647|35.092
Yirka, IL|32.954|35.212
Yehud, IL|32.033|34.891
Yavne, IL|31.878|34.740
Jaffa, IL|32.050|34.752
Yafa, IL|32.689|35.278
Umm el Fahm, IL|32.518|35.154
Tirat Karmel, IL|32.760|34.969
Tiberias, IL|32.794|35.532
Tel Aviv, IL|32.081|34.781
maalot Tarshiha, IL|33.017|35.267
Tamra, IL|32.853|35.199
Shefaram, IL|32.806|35.169
Sderot, IL|31.525|34.597
Sakhnin, IL|32.865|35.298
Rosh HaAyin, IL|32.095|34.954
Rishon LeTsiyyon, IL|31.971|34.789
Rehovot, IL|31.894|34.812
Ramla, IL|31.926|34.864
Ramat HaSharon, IL|32.146|34.839
Ramat Gan, IL|32.082|34.811
Raanana, IL|32.184|34.874
Qiryat Yam, IL|32.850|35.070
Qiryat Tivon, IL|32.712|35.125
QiryatShmona, IL|33.212|35.570
QiryatMotsqin, IL|32.837|35.078
Qiryat Malakhi, IL|31.729|34.746
Qiryat HaYovel, IL|31.767|35.167
Kiryat Gat, IL|31.610|34.764
Qiryat Bialik, IL|32.828|35.086
Qiryat Ata, IL|32.811|35.113
Qalansuwa, IL|32.285|34.981
Petah Tiqva, IL|32.089|34.887
Pardes Hanna Karkur, IL|32.474|34.978
Or Yehuda, IL|32.029|34.858
Or Akiva, IL|32.506|34.921
Ofaqim, IL|31.314|34.620
Netivot, IL|31.423|34.589
Netanya, IL|32.333|34.859
Ness Ziona, IL|31.929|34.799
Nesher, IL|32.766|35.044
Nazerat Illit, IL|32.708|35.325
Nazareth, IL|32.701|35.297
Nahariyya, IL|33.009|35.098
Migdal HaEmeq, IL|32.678|35.242
MevasseretTsiyyon, IL|31.802|35.151
Majd el Kurum, IL|32.921|35.254
Maghar, IL|32.889|35.408
Lod, IL|31.947|34.890
KfarYona, IL|32.315|34.936
Kfar Saba, IL|32.175|34.907
Karmiel, IL|32.910|35.298
Kafr Qasim, IL|32.114|34.976
Kafr Qari, IL|32.505|35.052
Kafr Manda, IL|32.811|35.261
Kafr Kanna, IL|32.747|35.342
Judeida Makr, IL|32.928|35.157
Holon, IL|32.010|34.779
Hod HaSharon, IL|32.159|34.893
Herzliya, IL|32.166|34.825
Haifa, IL|32.813|34.999
Hadera, IL|32.442|34.904
Givat Shmuel, IL|32.078|34.849
Givatayim, IL|32.072|34.813
Gedera, IL|31.815|34.780
Gan Yavne, IL|31.787|34.707
Ganei Tikva, IL|32.060|34.873
Et Tira, IL|32.234|34.950
Et Taiyiba, IL|32.266|35.009
Ar Rayna, IL|32.722|35.316
Eilat, IL|29.558|34.948
Dimona, IL|31.071|35.033
Daliyat al Karmel, IL|32.694|35.047
Binyamina-Giv`at `Ada, IL|32.523|34.945
Bet Shemesh, IL|31.731|34.993
Bet Shean, IL|32.497|35.496
Bnei Brak, IL|32.081|34.834
Beer Yaaqov, IL|31.939|34.837
Beersheba, IL|31.252|34.791
Bat Yam, IL|32.024|34.752
Baqa el Gharbiya, IL|32.421|35.043
Ashkelon, IL|31.669|34.571
Ashdod, IL|31.792|34.650
`Ara-`Ar`ara, IL|32.496|35.093
Arad, IL|31.259|35.213
Acre, IL|32.928|35.076
Afula, IL|32.609|35.289
West Jerusalem, IL|31.782|35.220
Rahat, IL|31.395|34.757
Modiin Ilit, IL|31.932|35.044
Ariel, IL|32.106|35.184
Tel Sheva, IL|31.249|34.860
Arara BaNegev, IL|31.160|35.023
Hura, IL|31.301|34.936
Kuseifa, IL|31.245|35.093
Shoham, IL|31.999|34.946
Elad, IL|32.051|34.957
Yehud-Monosson, IL|32.028|34.880
Kadima Zoran, IL|32.278|34.919
Kiryat Ono, IL|32.061|34.856
Binyamina-Givat Ada, IL|32.518|34.954
Douglas, IM|54.150|-4.483
Punch, IN|33.770|74.093
Kilakarai, IN|9.232|78.785
Zunheboto, IN|25.967|94.517
Zamania, IN|25.420|83.558
Zaidpur, IN|26.831|81.329
Zahirabad, IN|17.681|77.607
Yeola, IN|20.042|74.489
Yellapur, IN|14.964|74.709
Yellandu, IN|17.591|80.321
Yelahanka, IN|13.101|77.596
Yavatmal, IN|20.393|78.132
Yaval, IN|21.168|75.698
Yanam, IN|16.733|82.214
Yamuna Nagar, IN|30.128|77.284
Yadgir, IN|16.770|77.138
Wokha, IN|26.097|94.258
Weir, IN|27.019|77.176
Wellington, IN|11.366|76.784
Wazirganj, IN|28.211|79.057
Washim, IN|20.111|77.133
Warud, IN|21.471|78.270
Warora, IN|20.229|79.003
Waris Aliganj, IN|25.017|85.640
Wardha, IN|20.739|78.598
Waraseoni, IN|21.762|80.043
Warangal, IN|18.000|79.583
Wanparti, IN|16.367|78.069
Wankaner, IN|22.612|70.944
Wani, IN|20.055|78.953
Waluj Buzurg, IN|19.796|75.226
Walajapet, IN|12.925|79.366
Wai, IN|17.953|73.891
Wadi, IN|17.052|76.990
Wadgaon, IN|16.836|74.313
Vypin, IN|9.967|76.250
Vyara, IN|21.111|73.394
Vuyyuru, IN|16.363|80.844
Vrindavan, IN|27.581|77.697
Vriddhachalam, IN|11.518|79.324
Vizianagaram, IN|18.117|83.411
Vittal, IN|12.763|75.099
Vite, IN|17.273|74.538
Visnagar, IN|23.699|72.552
Visharam, IN|12.918|79.278
Visakhapatnam, IN|17.680|83.202
Visavadar, IN|21.340|70.750
Virudunagar, IN|9.585|77.958
Vadakku Viravanallur, IN|8.698|77.519
Virajpet, IN|12.196|75.805
Virar, IN|19.456|72.811
Viramgam, IN|23.126|72.050
Vinukonda, IN|16.053|79.740
Villupuram, IN|11.940|79.492
Villianur, IN|11.914|79.756
Vilattikulam, IN|9.132|78.166
Vikramasingapuram, IN|8.715|77.390
Vikarabad, IN|17.338|77.904
Vijayawada, IN|16.507|80.647
Vijapur, IN|23.562|72.748
Vidisha, IN|23.526|77.811
Vettur, IN|8.717|76.726
Vettavalam, IN|12.108|79.245
Vettaikkaranpudur, IN|10.562|76.913
Vetapalem, IN|15.785|80.307
Veraval, IN|20.908|70.368
Vepagunta, IN|17.778|83.216
Venkatagiri, IN|13.960|79.580
Vemalwada, IN|18.465|78.869
Velur, IN|11.108|78.001
Vellore, IN|12.918|79.133
Vellakkovil, IN|10.946|77.712
Vejalpur, IN|22.690|73.563
Vedaraniyam, IN|10.372|79.851
Vayalar, IN|9.712|76.339
Vattalkundu, IN|10.161|77.759
Vasudevanallur, IN|9.242|77.412
Vasind, IN|19.408|73.263
Vasco da Gama, IN|15.396|73.816
Vaso, IN|22.661|72.755
Varkala, IN|8.733|76.717
Varangaon, IN|21.018|75.910
Varanasi, IN|25.317|83.010
Vaniyambadi, IN|12.682|78.620
Vandavasi, IN|12.504|79.606
Vandalur, IN|12.892|80.081
Valsad, IN|20.610|72.934
Valparai, IN|10.327|76.951
Vallam, IN|10.720|79.060
Vallabh Vidyanagar, IN|22.533|72.900
Valavanur, IN|11.921|79.582
Valabhipur, IN|21.889|71.879
Vaikam, IN|9.749|76.396
Vaijapur, IN|19.927|74.728
Vagholi, IN|18.582|73.983
Vaghodia, IN|22.305|73.400
Vadodara, IN|22.299|73.208
Vadnagar, IN|23.786|72.639
Vadlapudi, IN|14.311|79.804
Vadipatti, IN|10.085|77.961
Vadasinor, IN|22.957|73.335
Vadamadurai, IN|10.441|78.098
Vadali, IN|23.942|73.038
Vadakku Valliyur, IN|8.383|77.612
Vadakancheri, IN|10.660|76.247
Vada, IN|19.653|73.148
Uttiramerur, IN|12.614|79.757
Uttarkashi, IN|30.730|78.443
Uttangarai, IN|12.267|78.538
Uttamapalaiyam, IN|9.807|77.327
Utraula, IN|27.319|82.419
Utnur, IN|19.368|78.776
Usilampatti, IN|9.969|77.786
Usehat, IN|27.798|79.238
Urun-Islampur, IN|17.050|74.267
Urmar, IN|31.681|75.635
Uravakonda, IN|14.943|77.255
Uran, IN|18.878|72.939
Upleta, IN|21.740|70.283
Uppal Kalan, IN|17.406|78.559
Unnao, IN|26.547|80.488
Unjha, IN|23.804|72.391
Unhel, IN|23.338|75.559
Unchahra, IN|24.383|80.781
Unchagao, IN|16.697|74.273
Una, IN|31.465|76.269
Una, IN|20.823|71.038
Un, IN|29.585|77.255
Un, IN|23.887|71.770
Umreth, IN|22.699|73.116
Umred, IN|20.854|79.325
Umarkot, IN|19.665|82.206
Umarkhed, IN|19.601|77.689
Umaria, IN|23.525|80.837
Umargam, IN|20.197|72.750
Umarga, IN|17.838|76.623
Uluberiya, IN|22.476|88.099
Ullal, IN|12.806|74.861
Ulhasnagar, IN|19.217|73.150
Ukhrul, IN|25.120|94.364
Ujjain, IN|23.182|75.776
Ujhani, IN|28.003|79.008
Udumalaippettai, IN|10.588|77.248
Udupi, IN|13.335|74.746
Udhampur, IN|32.924|75.136
Udgir, IN|18.393|77.118
Udangudi, IN|8.429|78.030
Udalguri, IN|26.754|92.102
Udaipura, IN|23.074|78.511
Udaipur, IN|27.723|75.472
Udaipur, IN|24.586|73.713
Udaipur, IN|23.533|91.483
Ooty, IN|11.413|76.695
Bara Uchana, IN|29.467|76.178
Ubaidullahganj, IN|22.998|77.586
Tyagadurgam, IN|11.741|79.077
Turaiyur, IN|11.150|78.599
Tura, IN|25.514|90.202
Tuni, IN|17.359|82.546
Tundla, IN|27.215|78.237
Tumsar, IN|21.383|79.733
Tumkur, IN|13.341|77.102
Tulsipur, IN|27.534|82.417
Tuljapur, IN|18.008|76.070
Tufanganj, IN|26.317|89.665
Tuensang, IN|26.267|94.824
Tudiyalur, IN|11.082|76.945
Thiruvananthapuram, IN|8.486|76.949
Trittala, IN|10.803|76.129
Tripunittura, IN|9.943|76.333
Thrissur, IN|10.517|76.217
Tral, IN|33.927|75.116
Tosham, IN|28.870|75.916
Tonk, IN|26.166|75.788
Tondi, IN|9.742|79.018
Tohana, IN|29.713|75.904
Todaraisingh, IN|26.024|75.482
Todabhim, IN|26.917|76.817
Tittagudi, IN|11.407|79.122
Titlagarh, IN|20.290|83.152
Titagarh, IN|22.743|88.373
Tisaiyanvilai, IN|8.337|77.868
Tiruvottiyur, IN|13.158|80.302
Cheyyar, IN|12.661|79.543
Tiruvannamalai, IN|12.227|79.075
Tiruvankod, IN|8.245|77.301
Tiruvallur, IN|13.144|79.909
Tiruvalla, IN|9.382|76.575
Thiruthuraipoondi, IN|10.528|79.633
Thiruthani, IN|13.176|79.616
Tiruttangal, IN|9.483|77.833
Tirurangadi, IN|11.043|75.923
Tirur, IN|10.914|75.921
Tiruppuvanam, IN|9.826|78.258
Tiruppur, IN|11.115|77.355
Tirupattur, IN|12.492|78.568
Tirupparangunram, IN|9.882|78.073
Tirupati, IN|13.636|79.420
Tirunelveli, IN|8.727|77.684
Tirumangalam, IN|9.823|77.984
Tirumala, IN|13.683|79.350
Tirukkoyilur, IN|11.966|79.203
Tirukkalikkunram, IN|12.608|80.055
Tiruchengode, IN|11.380|77.894
Tiruchirappalli, IN|10.816|78.697
Tiruchchendur, IN|8.497|78.119
Tirthahalli, IN|13.688|75.245
Tirawari, IN|29.801|76.928
Tiptur, IN|13.256|76.478
Tinsukia, IN|27.489|95.360
Tinnanur, IN|13.114|80.027
Tindivanam, IN|12.234|79.656
Timurni, IN|22.371|77.227
Tilhar, IN|27.963|79.738
Tikkotti, IN|11.483|75.617
Tikamgarh, IN|24.743|78.831
Tijara, IN|27.934|76.855
Thoubal, IN|24.639|93.996
Thiruvarur, IN|10.773|79.637
Thiruvaiyaru, IN|10.884|79.104
Thasra, IN|22.798|73.212
Tharad, IN|24.396|71.626
Thara, IN|23.973|71.819
Thanjavur, IN|10.785|79.139
Thanesar, IN|29.973|76.832
Thane, IN|19.197|72.964
Thandla, IN|23.010|74.577
Thana Bhawan, IN|29.586|77.418
Than, IN|22.574|71.199
Thakurganj, IN|26.427|88.131
Thakurdwara, IN|29.192|78.861
Tezu, IN|27.913|96.129
Tezpur, IN|26.633|92.800
Tevaram, IN|9.897|77.281
Terdal, IN|16.494|75.047
Teonthar, IN|24.982|81.642
Thenkasi, IN|8.960|77.315
Teni, IN|10.011|77.478
Thenali, IN|16.243|80.640
Tellicherry, IN|11.748|75.493
Telhara, IN|21.027|76.839
Tekkali, IN|18.606|84.235
Tekkalakote, IN|15.534|76.877
Tekari, IN|24.943|84.843
Tehri, IN|30.391|78.480
Teghra, IN|25.490|85.940
Tasgaon, IN|17.037|74.602
Tarn Taran, IN|31.452|74.928
Tarikere, IN|13.710|75.814
Tharangambadi, IN|11.028|79.854
Taranagar, IN|28.669|75.032
Tarana, IN|23.334|76.043
Taramangalam, IN|11.694|77.970
Tarakeswar, IN|22.886|88.014
Taoru, IN|28.212|76.950
Tanuku, IN|16.754|81.681
Tandur, IN|17.248|77.577
Tanda, IN|28.976|78.942
Tanda, IN|26.550|82.658
Tanakpur, IN|29.074|80.111
Tammampatti, IN|11.441|78.489
Tamluk, IN|22.301|87.926
Tamenglong, IN|25.016|93.485
Tambaram, IN|12.925|80.127
Talwara, IN|31.938|75.887
Talwandi Sabo, IN|29.984|75.082
Talwandi Bhai, IN|30.856|74.930
Taloda, IN|21.561|74.212
Taliparamba, IN|12.042|75.359
Talikota, IN|16.473|76.311
Taleigao, IN|15.469|73.833
Talegaon Dabhade, IN|18.735|73.676
Talcher, IN|20.949|85.234
Talakkad, IN|10.885|75.931
Talaja, IN|21.353|72.035
Taki, IN|22.589|88.933
Takhatpur, IN|22.129|81.870
Takhatgarh, IN|25.322|73.005
Tajpur, IN|29.162|78.485
Tadpatri, IN|14.908|78.010
Tadepalligudem, IN|16.815|81.527
Tadepalle, IN|16.483|80.600
Sutrapara, IN|20.844|70.483
Susner, IN|23.947|76.088
Suriapet, IN|17.141|79.620
Surianwan, IN|25.464|82.419
Surendranagar, IN|22.727|71.649
Suratgarh, IN|29.322|73.900
Surat, IN|21.196|72.830
Surandai, IN|8.976|77.419
Surajpur, IN|23.213|82.868
Surajgarh, IN|28.310|75.733
Supaul, IN|26.115|86.595
Sunel, IN|24.371|75.957
Sundarnagar, IN|31.535|76.905
Sundergarh, IN|22.117|84.033
Sunam, IN|30.129|75.799
Sumbal, IN|34.231|74.647
Sullya, IN|12.561|75.387
Suluru, IN|13.700|80.017
Sulur, IN|11.024|77.126
Sultanpur, IN|31.215|75.196
Sultanpur, IN|26.258|82.073
Suket, IN|24.646|76.042
Sujangarh, IN|27.700|74.467
Suar, IN|29.028|79.057
Srivilliputhur, IN|9.513|77.634
Srivardhan, IN|18.046|73.016
Srivaikuntam, IN|8.629|77.913
Srisailain, IN|16.072|78.868
Sriramnagar, IN|17.267|78.255
Sriperumbudur, IN|12.968|79.942
Srinivaspur, IN|13.339|78.212
Srinagar, IN|34.086|74.806
Srinagar, IN|30.222|78.783
Sri Madhopur, IN|27.466|75.597
Karanpur, IN|29.840|73.455
Srikakulam, IN|18.299|83.898
Sri Dungargarh, IN|28.096|74.009
Soygaon, IN|20.596|75.618
Soron, IN|27.891|78.746
Soro, IN|21.279|86.688
Sorada, IN|19.761|84.430
Sopur, IN|34.287|74.472
Sonkach, IN|22.972|76.347
Sonipat, IN|28.995|77.019
Songadh, IN|21.170|73.564
Sonepur, IN|20.833|83.917
Sonpet, IN|19.026|76.474
Rajpur Sonarpur, IN|22.438|88.432
Sonari, IN|27.025|95.016
Sonamukhi, IN|23.305|87.413
Sompeta, IN|18.944|84.584
Someshwar, IN|13.491|75.066
Solan, IN|30.909|77.109
Sojitra, IN|22.539|72.720
Sojat, IN|25.925|73.666
Sohna, IN|28.247|77.065
Sohagpur, IN|22.701|78.195
Siwana, IN|25.652|72.422
Siwan, IN|26.221|84.356
Sivakasi, IN|9.450|77.798
Sivagiri, IN|11.120|77.788
Sivagiri, IN|9.345|77.429
Sivaganga, IN|9.847|78.484
Siuri, IN|23.908|87.528
Sitarganj, IN|28.929|79.704
Sitapur, IN|27.562|80.683
Sitamarhi, IN|26.594|85.491
Siswa Bazar, IN|27.147|83.758
Sisauli, IN|29.414|77.469
Sirur, IN|18.828|74.375
Sirumugai, IN|11.321|77.005
Siruguppa, IN|15.630|76.892
Sirsilla, IN|18.389|78.810
Sirsi, IN|28.639|78.643
Sirsi, IN|14.621|74.836
Sirsaganj, IN|27.057|78.687
Sirsa, IN|29.535|75.029
Sironj, IN|24.103|77.691
Sirohi, IN|24.888|72.848
Sir Muttra, IN|26.515|77.372
Sirkazhi, IN|11.237|79.736
Sirhind, IN|30.643|76.384
Siralkoppa, IN|14.381|75.250
Sira, IN|13.742|76.904
Sinnar, IN|19.845|73.999
Singur, IN|22.809|88.229
Singarayakonda, IN|15.230|80.028
Singanallur, IN|10.999|77.032
Sindkhed Raja, IN|19.954|76.126
Sindhnur, IN|15.770|76.756
Sindgi, IN|16.919|76.234
Shimla, IN|31.104|77.167
Simga, IN|21.628|81.704
Simdega, IN|22.615|84.502
Silvassa, IN|20.274|72.997
Silvani, IN|23.303|78.441
Sillod, IN|20.303|75.653
Silchar, IN|24.827|92.798
Silao, IN|25.084|85.428
Sikar, IN|27.612|75.140
Sikandra Rao, IN|27.689|78.380
Sikandarpur, IN|26.043|84.053
Sikandarabad, IN|28.452|77.700
Sikka, IN|22.432|69.842
Sijua, IN|23.776|86.330
Sihora, IN|23.487|80.104
Sihor, IN|21.711|71.962
Sidlaghatta, IN|13.389|77.864
Sidhi, IN|24.404|81.880
Sidhauli, IN|27.282|80.835
Siddipet, IN|18.105|78.849
Siddhapur, IN|23.918|72.372
Sibsagar, IN|26.984|94.638
Shyamnagar, IN|22.833|88.367
Shopian, IN|33.717|74.834
Shujalpur, IN|23.407|76.710
Shrirangapattana, IN|12.423|76.684
Shrirampur, IN|22.753|88.342
Shrigonda, IN|18.615|74.699
Shorapur, IN|16.521|76.757
Shoranur, IN|10.762|76.271
Sholinghur, IN|13.118|79.420
Sholapur, IN|17.672|75.910
Shivpuri, IN|25.424|77.662
Shishgarh, IN|28.729|79.315
Shirpur, IN|21.348|74.880
Shirhatti, IN|15.234|75.580
Shirdi, IN|19.766|74.477
Shivamogga, IN|13.932|75.568
Shillong, IN|25.569|91.883
Siliguri, IN|26.710|88.429
Shikohabad, IN|27.108|78.587
Shikarpur, IN|28.281|78.014
Shikaripura, IN|14.270|75.356
Shiggaon, IN|14.991|75.225
Shertallai, IN|9.686|76.340
Sherkot, IN|29.327|78.574
Sherghati, IN|24.559|84.792
Sheopur, IN|25.665|76.696
Sheohar, IN|26.514|85.293
Sheoganj, IN|25.139|73.068
Shenkottai, IN|8.977|77.246
Shehera, IN|22.951|73.631
Shegaon, IN|20.793|76.699
Shantipur, IN|23.247|88.433
Shamsabad, IN|27.537|79.438
Shamsabad, IN|27.017|78.124
Shamli, IN|29.450|77.310
Shamgarh, IN|24.188|75.639
Shajapur, IN|23.426|76.278
Sheikhpura, IN|25.140|85.841
Shahpura, IN|27.391|75.960
Shahpura, IN|25.621|74.925
Shahpur, IN|29.350|77.552
Shahpur, IN|25.603|84.404
Shahpur, IN|21.237|76.226
Shahpur, IN|16.696|76.842
Shahjanpur, IN|27.882|79.909
Shahi, IN|28.550|79.318
Shahgarh, IN|24.314|79.118
Shahganj, IN|26.050|82.684
Shahdol, IN|23.294|81.362
Shahada, IN|21.545|74.471
Shahabad, IN|30.168|76.870
Shahabad, IN|28.567|79.010
Shahabad, IN|27.643|79.940
Shahabad, IN|17.131|76.944
Siwani, IN|28.909|75.615
Settur, IN|9.406|77.478
Serchhip, IN|23.293|92.847
Sedam, IN|17.179|77.290
Seoni Malwa, IN|22.450|77.466
Seoni Chhapara, IN|22.394|79.542
Seoni, IN|22.085|79.550
Seondha, IN|26.154|78.781
Seohara, IN|29.209|78.588
Shendurjana, IN|21.525|78.284
Sendhwa, IN|21.686|75.096
Sendamangalam, IN|11.281|78.234
Sehore, IN|23.200|77.083
Secunderabad, IN|17.504|78.543
Sayla, IN|22.549|71.483
Sawai Madhopur, IN|26.023|76.344
Savli, IN|22.562|73.223
Savda, IN|21.151|75.889
Savanur, IN|14.973|75.337
Savantvadi, IN|15.904|73.822
Sausar, IN|21.656|78.797
Saundatti, IN|15.766|75.118
Sathyamangalam, IN|11.505|77.238
Sattur, IN|9.356|77.925
Sattenapalle, IN|16.394|80.152
Satna, IN|24.577|80.827
Satara, IN|17.686|73.993
Satana, IN|20.595|74.203
Sasvad, IN|18.344|74.031
Sasaram, IN|24.949|84.016
Sawar, IN|25.756|75.223
Sarkhej, IN|22.983|72.502
Sardulgarh, IN|29.692|75.236
Sardhana, IN|29.146|77.614
Sardarshahr, IN|28.441|74.491
Sarauli, IN|28.494|79.092
Sarangpur, IN|23.567|76.473
Saraipali, IN|21.315|83.006
Sarai Mir, IN|26.027|82.918
Sarai Akil, IN|25.379|81.510
Saoner, IN|21.385|78.922
Sanwer, IN|22.974|75.827
Sankrail, IN|22.550|88.225
Sankeshwar, IN|16.256|74.482
Sankarankovil, IN|9.170|77.541
Sangrur, IN|30.245|75.845
Sangola, IN|17.439|75.194
Sangod, IN|24.927|76.286
Sangli, IN|16.854|74.564
Sangaria, IN|29.799|74.467
Sangareddi, IN|17.625|78.087
Sangamner, IN|19.568|74.212
Sandur, IN|15.086|76.547
Sandila, IN|27.070|80.515
Sandi, IN|27.289|79.952
Sancoale, IN|15.378|73.904
Sanchor, IN|24.754|71.773
Sanawad, IN|22.174|76.070
Sanaur, IN|30.302|76.458
Sanand, IN|22.992|72.382
Samthar, IN|25.843|78.907
Samrala, IN|30.836|76.193
Sampla, IN|28.777|76.772
Samdari, IN|25.813|72.579
Samburvadakara, IN|8.999|77.388
Sambhar, IN|26.908|75.191
Sambhal, IN|28.585|78.570
Sambalpur, IN|21.465|83.976
Samba, IN|32.562|75.120
Samastipur, IN|25.862|85.780
Samana, IN|30.154|76.199
Samalkot, IN|17.057|82.176
Samalkha, IN|29.236|77.013
Samalka, IN|28.535|77.091
Salur, IN|18.517|83.205
Salumbar, IN|24.135|74.044
Salem, IN|11.654|78.155
Salaya, IN|22.310|69.604
Sakti, IN|22.027|82.961
Sakri, IN|20.991|74.315
Sakleshpur, IN|12.941|75.785
Saint Thomas Mount, IN|13.003|80.196
Sainthia, IN|23.948|87.680
Selu, IN|19.455|76.441
Saiha, IN|22.492|92.981
Saidpur, IN|25.537|83.224
Sahibganj, IN|26.308|84.927
Sahibganj, IN|25.244|87.635
Sahawar, IN|27.796|78.834
Sahaswan, IN|28.072|78.751
Sahaspur, IN|29.121|78.623
Saharsa, IN|25.875|86.596
Saharanpur, IN|29.968|77.545
Sagwara, IN|23.680|74.020
Sagauli, IN|26.764|84.743
Saugor, IN|23.839|78.739
Sagar, IN|14.165|75.029
Safipur, IN|26.738|80.344
Safidon, IN|29.406|76.670
Sadri, IN|25.186|73.453
Sadasivpet, IN|17.619|77.953
Sadalgi, IN|16.559|74.532
Sadabad, IN|27.438|78.038
Sachin, IN|21.087|72.882
Sabalgarh, IN|26.249|77.408
Rusera, IN|25.754|86.026
Rura, IN|26.490|79.901
Ropar, IN|30.969|76.527
Rudarpur, IN|26.445|83.613
Roorkee, IN|29.866|77.891
Ron, IN|15.699|75.734
Rohtak, IN|28.894|76.589
Roha, IN|18.437|73.120
Robertsonpet, IN|12.956|78.275
Robertsganj, IN|24.689|83.068
Risod, IN|19.977|76.788
Rishra, IN|22.724|88.346
Rishikesh, IN|30.108|78.293
Reengus, IN|27.364|75.568
Richha, IN|28.695|79.523
Rewari, IN|28.199|76.618
Rewa, IN|24.533|81.292
Revelganj, IN|25.790|84.636
Repalle, IN|16.018|80.830
Reoti, IN|25.851|84.378
Renukut, IN|24.216|83.036
Renigunta, IN|13.651|79.513
Remuna, IN|21.528|86.872
Rehli, IN|23.637|79.063
Razam, IN|18.449|83.660
Raybag, IN|16.492|74.774
Rayagada, IN|19.171|83.414
Rayadrug, IN|14.700|76.852
Rayachoti, IN|14.057|78.751
Raya, IN|27.556|77.790
Raxaul, IN|26.980|84.851
Rawatsar, IN|29.267|74.403
Rawatbhata, IN|24.930|75.592
Raver, IN|21.248|76.035
Rourkela, IN|22.225|84.864
Ratu, IN|23.420|85.215
Ratnagiri, IN|16.992|73.310
Ratlam, IN|23.330|75.040
Ratia, IN|29.690|75.577
Rath, IN|25.595|79.567
Ratanpur, IN|22.287|82.168
Ratangarh, IN|28.081|74.619
Rasra, IN|25.858|83.855
Rasipuram, IN|11.460|78.186
Rasapudipalem, IN|17.733|83.316
Rapar, IN|23.573|70.647
Ranpur, IN|22.352|71.712
Ranipur, IN|25.250|79.062
Ranipet, IN|12.925|79.333
Ranikhet, IN|29.641|79.432
Raniganj, IN|23.616|87.131
Ranebennur, IN|14.622|75.630
Rania, IN|29.525|74.837
Rangia, IN|26.449|91.614
Rangapara, IN|26.838|92.669
Ranchi, IN|23.343|85.309
Ranavav, IN|21.687|69.745
Ranaghat, IN|23.176|88.567
Ramtek, IN|21.396|79.327
Rampur Hat, IN|24.177|87.783
Rampura, IN|30.256|75.241
Rampura, IN|24.467|75.440
Rampur, IN|29.806|77.453
Rampur, IN|28.810|79.027
Rampur, IN|21.074|84.341
Ramnagar, IN|29.392|79.128
Ramnagar, IN|27.164|84.323
Ramnagar, IN|25.269|83.030
Ramjibanpur, IN|22.828|87.609
Ramgundam, IN|18.801|79.452
Ramgarh, IN|28.171|74.980
Ramgarh, IN|27.251|75.179
Ramgarh, IN|23.630|85.522
Ramganj Mandi, IN|24.646|75.943
Rameswaram, IN|9.289|79.313
Ramdurg, IN|15.946|75.298
Ramapuram, IN|13.101|79.184
Ramanathapuram, IN|9.372|78.831
Closepet, IN|12.722|77.281
Ramachandrapuram, IN|16.836|82.029
Rajura, IN|19.779|79.365
Rajula, IN|21.039|71.443
Rajsamand, IN|25.071|73.880
Rajpura, IN|30.479|76.593
Alirajpur, IN|22.304|74.356
Rajpur, IN|21.940|75.136
Rajpipla, IN|21.867|73.500
Raj-Nandgaon, IN|21.097|81.029
Rajmahal, IN|25.053|87.830
Rajkot, IN|22.292|70.793
Rajgurunagar, IN|18.867|73.900
Rajgir, IN|25.028|85.421
Rajgarh, IN|28.642|75.386
Rajgarh, IN|27.237|76.622
Rajgarh, IN|24.008|76.733
Rajgarh, IN|22.678|74.945
Rajaori, IN|33.375|74.309
Rajauli, IN|24.645|85.500
Rajapalayam, IN|9.453|77.553
Razampeta, IN|14.195|79.159
Rajaldesar, IN|28.028|74.474
Rajakhera, IN|26.898|78.171
Rajamahendravaram, IN|17.005|81.778
Raisinghnagar, IN|29.536|73.449
Raisen, IN|23.330|77.781
Raipur, IN|30.311|78.090
Raipur, IN|26.043|74.024
Raipur, IN|21.233|81.633
Raikot, IN|30.650|75.600
Raigarh, IN|21.898|83.397
Raiganj, IN|25.613|88.124
Raichur, IN|16.205|77.356
Rahuri, IN|19.391|74.650
Rahon, IN|31.053|76.119
Rahimatpur, IN|17.592|74.200
Rahatgarh, IN|23.790|78.395
Rahata, IN|19.717|74.481
Raghunathpur, IN|23.539|86.674
Raghogarh, IN|24.443|77.198
Rafiganj, IN|24.818|84.634
Raebareli, IN|26.231|81.233
Radhanpur, IN|23.832|71.605
Rabkavi, IN|16.476|75.111
Kollam, IN|8.881|76.585
Koyilandy, IN|11.438|75.693
Kasba, IN|25.856|87.538
Qadian, IN|31.822|75.377
Puttur, IN|13.442|79.553
Puttur, IN|12.760|75.202
Pushkar, IN|26.490|74.552
Pusad, IN|19.913|77.578
Purwa, IN|26.458|80.774
Purushottampur, IN|19.520|84.885
Puruliya, IN|23.331|86.363
Purnia, IN|25.779|87.474
Purna, IN|19.182|77.026
Puri, IN|19.798|85.825
Puranpur, IN|28.513|80.148
Puraini, IN|25.143|86.980
Pupri, IN|26.471|85.703
Punjai Puliyampatti, IN|11.352|77.167
Punganuru, IN|13.367|78.572
Pune, IN|18.520|73.855
Pundri, IN|29.761|76.560
Punasa, IN|22.235|76.393
Punalur, IN|9.020|76.923
Punahana, IN|27.864|77.204
Pulwama, IN|33.874|74.900
Puliyankudi, IN|9.175|77.398
Pulivendla, IN|14.421|78.225
Pulgaon, IN|20.722|78.321
Pukhrayan, IN|26.224|79.837
Pugalur, IN|11.074|78.021
Pudunagaram, IN|10.680|76.684
Pudukkottai, IN|10.381|78.821
Proddatur, IN|14.750|78.548
Pratapgarh, IN|24.032|74.782
Pottanur, IN|11.110|77.989
Port Blair, IN|11.666|92.746
Porsa, IN|26.674|78.371
Porbandar, IN|21.642|69.609
Poonamalle, IN|13.049|80.115
Ponnuru, IN|16.065|80.552
Ponneri, IN|13.339|80.195
Ponnani, IN|10.767|75.925
Puducherry, IN|11.934|79.830
Ponda, IN|15.403|74.015
Polur, IN|12.512|79.124
Pollachi, IN|10.658|77.008
Polavaram, IN|17.248|81.644
Polasara, IN|19.694|84.814
Pokaran, IN|26.920|71.916
Podili, IN|15.606|79.615
Pithoragarh, IN|29.583|80.209
Pithapuram, IN|17.117|82.253
Pirthipur, IN|25.208|78.752
Piro, IN|25.332|84.405
Piriyapatna, IN|12.335|76.101
Piravam, IN|9.867|76.500
Pipri, IN|19.794|75.535
Pipraich, IN|26.827|83.526
Pipili, IN|20.114|85.831
Piparia, IN|22.757|78.355
Pipar, IN|26.384|73.544
Pinjaur, IN|30.799|76.918
Pindwara, IN|24.797|73.055
Pinahat, IN|26.885|78.376
Pimpri, IN|18.623|73.807
Pilkhua, IN|28.713|77.656
Pilibhit, IN|28.631|79.804
Pilibangan, IN|29.450|74.101
Pileru, IN|13.656|78.939
Pilani, IN|28.367|75.604
Pihani, IN|27.620|80.203
Piduguralla, IN|16.479|79.886
Pichor, IN|25.176|78.189
Phulpur, IN|25.549|82.090
Phulera, IN|26.874|75.242
Phulbani, IN|20.481|84.231
Phirangipuram, IN|16.291|80.262
Phillaur, IN|31.019|75.791
Phek, IN|25.667|94.500
Phaphund, IN|26.599|79.464
Phaltan, IN|17.991|74.432
Phalodi, IN|27.131|72.368
Phalauda, IN|29.188|77.830
Phagwara, IN|31.225|75.774
Petlawad, IN|23.011|74.798
Petlad, IN|22.477|72.800
Pethapur, IN|23.263|72.674
Perundurai, IN|11.276|77.588
Perumpavur, IN|10.115|76.476
Periyanayakkanpalaiyam, IN|11.153|76.952
Periyakulam, IN|10.123|77.544
Perintalmanna, IN|10.977|76.225
Peravurani, IN|10.290|79.202
Peranampattu, IN|12.934|78.719
Perambalur, IN|11.233|78.883
Penukonda, IN|14.083|77.595
Penugonda, IN|16.654|81.746
Pennagaram, IN|12.134|77.895
Pennadam, IN|11.404|79.242
Pen, IN|18.737|73.096
Pehowa, IN|29.979|76.582
Peddapuram, IN|17.077|82.138
Peddapalli, IN|18.614|79.374
Peddanayakkanpalaiyam, IN|11.651|78.509
Pedana, IN|16.256|81.144
Payyanur, IN|12.094|75.202
Pawayan, IN|28.066|80.103
Pavugada, IN|14.100|77.280
Pauri, IN|30.153|78.777
Pawni, IN|20.792|79.636
Patur, IN|20.461|76.937
Pattukkottai, IN|10.424|79.319
Pattiyurgramam, IN|9.177|76.501
Patti, IN|31.281|74.858
Pattan, IN|34.161|74.556
Pattambi, IN|10.800|76.184
Patratu, IN|23.665|85.304
Patnagarh, IN|20.708|83.133
Patna, IN|25.594|85.136
Patiala, IN|30.336|76.392
Pathri, IN|19.259|76.434
Patharia, IN|23.899|79.194
Pathardih, IN|23.666|86.432
Pathardi, IN|19.173|75.174
Pathankot, IN|32.275|75.653
Pathanamthitta, IN|9.267|76.783
Pathalgaon, IN|22.557|83.464
Pataudi, IN|28.325|76.779
Patancheru, IN|17.533|78.264
Patan, IN|23.851|72.130
Patamundai, IN|20.578|86.561
Pasighat, IN|28.066|95.327
Pasan, IN|22.844|82.198
Parvatsar, IN|26.886|74.766
Parvatipuram, IN|18.784|83.426
Parur, IN|10.148|76.230
Partur, IN|19.599|76.215
Parola, IN|20.881|75.119
Parli Vaijnath, IN|18.851|76.532
Pariyapuram, IN|11.017|75.867
Parichhatgarh, IN|28.978|77.934
Pardi, IN|20.509|72.946
Parbhani, IN|19.269|76.771
Paravur Tekkumbhagam, IN|8.795|76.668
Parassala, IN|8.339|77.154
Parasia, IN|22.191|78.759
Paramagudi, IN|9.546|78.591
Paralakhemundi, IN|18.776|84.095
Paradip Garh, IN|20.316|86.609
Pappinissheri, IN|11.957|75.340
Papanasam, IN|10.927|79.271
Paonta Sahib, IN|30.437|77.625
Panvel, IN|18.989|73.110
Panth Piplia, IN|24.195|75.006
Panruti, IN|11.777|79.553
Panna, IN|24.721|80.188
Ponmana, IN|9.008|76.520
Panipat, IN|29.387|76.968
Panihati, IN|22.691|88.374
Pandua, IN|23.075|88.286
Pandhurna, IN|21.596|78.526
Pandharpur, IN|17.679|75.331
Pandharkawada, IN|20.021|78.546
French Rocks, IN|12.501|76.674
Pandaria, IN|22.225|81.410
Panjim, IN|15.496|73.826
Panakkudi, IN|8.322|77.577
Panagar, IN|23.285|79.995
Pamuru, IN|15.096|79.412
Pampur, IN|34.015|74.919
Pamban, IN|9.279|79.211
Palwal, IN|28.145|77.325
Paloncha, IN|17.602|80.705
Palani, IN|10.450|77.521
Palmaner, IN|13.200|78.747
Pallippatti, IN|11.940|78.402
Pallikonda, IN|12.905|78.943
Pallavaram, IN|12.968|80.150
Pallappatti, IN|10.721|77.880
Palladam, IN|10.992|77.286
Palkonda, IN|18.604|83.756
Palitana, IN|21.525|71.823
Palia Kalan, IN|28.432|80.581
Pali, IN|25.773|73.323
Pali, IN|23.365|81.044
Palakkad, IN|10.773|76.654
Palghar, IN|19.697|72.765
Palera, IN|25.020|79.228
Palasa, IN|18.773|84.410
Palanpur, IN|24.171|72.438
Palakollu, IN|16.517|81.730
Palakkodu, IN|12.307|78.070
Pakur, IN|24.639|87.842
Pakala, IN|13.449|79.115
Paithan, IN|19.475|75.386
Pahasu, IN|28.172|78.064
Padrauna, IN|26.904|83.981
Padra, IN|22.240|73.085
Padmapur, IN|21.000|83.067
Padmanabhapuram, IN|8.245|77.326
Padiyanallur, IN|13.200|80.176
Padampur, IN|29.709|73.625
Padampur, IN|20.999|83.063
Padam, IN|33.467|76.885
Pachperwa, IN|27.512|82.643
Pachora, IN|20.667|75.353
Pachor, IN|23.710|76.734
Ottapalam, IN|10.774|76.378
Dharashiv, IN|18.182|76.039
Orai, IN|25.990|79.453
Ongole, IN|15.504|80.045
Omalur, IN|11.741|78.046
Okha, IN|22.468|69.070
Ozar, IN|20.095|73.928
Od, IN|22.621|73.117
Obra, IN|24.419|82.988
Nuzvid, IN|16.789|80.846
Nurpur, IN|29.150|78.408
Nuh, IN|28.103|77.001
Nowrangapur, IN|19.231|82.548
Nagaon, IN|26.350|92.667
Nowgong, IN|25.061|79.441
North Lakhimpur, IN|27.235|94.104
North Guwahati, IN|26.197|91.720
Nongstoin, IN|25.517|91.265
Nongpoh, IN|25.902|91.877
Nokha, IN|27.562|73.471
Nohar, IN|29.183|74.771
Noamundi, IN|22.161|85.504
Nizamabad, IN|18.672|78.099
Nisang, IN|29.692|76.755
Nirmali, IN|26.314|86.585
Nirmal, IN|19.097|78.344
Nipani, IN|16.399|74.383
Neem ka Thana, IN|27.740|75.787
Nimbahera, IN|24.622|74.680
Nimaparha, IN|20.058|86.004
Nimaj, IN|26.150|74.001
Nilokheri, IN|29.837|76.932
Nileshwar, IN|12.260|75.135
Nilanga, IN|18.117|76.753
Nilambur, IN|11.273|76.226
Nilakottai, IN|10.165|77.850
Nilagiri, IN|21.462|86.768
Nihtaur, IN|29.324|78.387
Nidadavole, IN|16.906|81.672
Nichlaul, IN|27.312|83.725
Ngur, IN|23.538|93.373
Neyyattinkara, IN|8.399|77.086
Neyveli, IN|11.609|79.499
New Delhi, IN|28.621|77.215
Neral, IN|19.025|73.317
Ner, IN|20.490|77.866
Nepanagar, IN|21.454|76.393
Nellore, IN|14.450|79.987
Nellimarla, IN|18.156|83.447
Nellikkuppam, IN|11.776|79.670
Nelamangala, IN|13.100|77.394
Nedumangad, IN|8.603|77.001
Nazareth, IN|8.561|77.972
Nayudupet, IN|13.907|79.895
Nayagarh, IN|20.129|85.096
Nawanshahr, IN|31.125|76.116
Nawapara, IN|20.972|81.859
Nawalgarh, IN|27.852|75.274
Niwai, IN|26.361|75.918
Nawada, IN|24.887|85.544
Nawabganj, IN|28.541|79.635
Nawabganj, IN|26.931|81.198
Nawabganj, IN|26.864|82.141
Nawa, IN|27.020|75.002
Navsari, IN|20.942|72.925
Navapur, IN|21.162|73.794
Navalgund, IN|15.559|75.353
Navadwip, IN|23.407|88.369
Nautanwa, IN|27.428|83.418
Naugachhia, IN|25.388|87.099
Naubatpur, IN|25.499|84.961
Natham, IN|10.228|78.230
Nathdwara, IN|24.938|73.824
Nateputa, IN|17.899|74.752
Nasrullahganj, IN|22.684|77.271
Nasriganj, IN|25.051|84.328
Naspur, IN|18.846|79.462
Nasirabad, IN|26.305|74.734
Nashik, IN|19.997|73.791
Narwar, IN|25.644|77.913
Narwana, IN|29.599|76.119
Narsipatnam, IN|17.667|82.612
Narsinghgarh, IN|23.708|77.093
Narsimhapur, IN|22.949|79.184
Narsampet, IN|17.928|79.892
Naroli, IN|20.274|72.942
Narnaund, IN|29.220|76.143
Narnaul, IN|28.044|76.108
Narkher, IN|21.472|78.534
Narkatiaganj, IN|27.104|84.462
Nargund, IN|15.723|75.387
Narela, IN|28.853|77.093
Naregal, IN|15.573|75.808
Narayanpet, IN|16.748|77.495
Narayankher, IN|18.034|77.773
Naraingarh, IN|30.478|77.128
Naravarikuppam, IN|13.191|80.185
Naraura, IN|28.201|78.387
Narauli, IN|28.485|78.715
Narasaraopet, IN|16.235|80.049
Narasapur, IN|16.434|81.698
Narasannapeta, IN|18.414|84.045
Narakal, IN|10.038|76.222
Narainpur, IN|19.718|81.244
Naraini, IN|25.190|80.475
Naraina, IN|26.791|75.206
Napasar, IN|27.961|73.559
Nanpara, IN|27.865|81.500
Nanjangud, IN|12.118|76.684
Nangloi Jat, IN|28.680|77.068
Nangal, IN|31.390|76.376
Nandyal, IN|15.478|78.484
Nandurbar, IN|21.367|74.241
Nandura, IN|20.834|76.459
Nandikotkur, IN|15.857|78.266
Nandigama, IN|16.772|80.286
Nandgaon, IN|20.307|74.655
Nanded, IN|19.160|77.315
Nanauta, IN|29.712|77.417
Namrup, IN|27.194|95.319
Nambiyur, IN|11.358|77.321
Namakkal, IN|11.221|78.165
Namagiripettai, IN|11.455|78.268
Nal Khera, IN|23.836|76.243
Nalhati, IN|24.297|87.829
Nalgonda, IN|17.054|79.267
Naldurg, IN|17.817|76.282
Nalbari, IN|26.439|91.440
Nakur, IN|29.920|77.304
Naksalbari, IN|26.683|88.220
Nakrekal, IN|17.163|79.428
Nakodar, IN|31.126|75.475
Najibabad, IN|29.612|78.343
Najafgarh, IN|28.609|76.980
Nainwa, IN|25.771|75.850
Nainpur, IN|22.430|80.106
Naini Tal, IN|29.397|79.447
Naihati, IN|22.894|88.415
Nahorkatiya, IN|27.286|95.328
Nahan, IN|30.560|77.294
Nagpur, IN|21.146|79.085
Nagod, IN|24.569|80.588
Nagina, IN|29.444|78.436
Nagercoil, IN|8.179|77.432
Nagda, IN|23.458|75.418
Nagaur, IN|27.202|73.734
Nagar Karnul, IN|16.482|78.325
Nagari, IN|13.321|79.586
Nagar, IN|27.424|77.099
Nagapattinam, IN|10.764|79.843
Nagamangala, IN|12.819|76.755
Nagalapuram, IN|13.388|79.796
Naduvannur, IN|11.488|75.775
Nadiad, IN|22.694|72.862
Nadbai, IN|27.223|77.196
Nadapuram, IN|11.685|75.655
Nabinagar, IN|24.607|84.126
Nabha, IN|30.376|76.153
Mysuru, IN|12.298|76.639
Muzaffarpur, IN|26.123|85.391
Muzaffarnagar, IN|29.471|77.703
Muvattupula, IN|9.985|76.577
Muthupet, IN|10.395|79.494
Mussoorie, IN|30.455|78.071
Musiri, IN|10.953|78.444
Mushabani, IN|22.511|86.457
Murwara, IN|23.838|80.394
Murtajapur, IN|20.733|77.367
Murshidabad, IN|24.184|88.272
Murliganj, IN|25.897|86.996
Morinda, IN|30.790|76.499
Murbad, IN|19.254|73.390
Muradnagar, IN|28.781|77.499
Munnar, IN|10.088|77.062
Munger, IN|25.375|86.475
Mungeli, IN|22.066|81.685
Mungaoli, IN|24.408|78.096
Mundwa, IN|27.063|73.823
Mundra, IN|22.839|69.722
Mundgod, IN|14.971|75.037
Mundargi, IN|15.207|75.884
Multai, IN|21.775|78.258
Mulki, IN|13.091|74.794
Mulgund, IN|15.281|75.521
Mulbagal, IN|13.164|78.393
Muluppilagadu, IN|11.798|75.451
Mulanur, IN|10.794|77.712
Mul, IN|20.070|79.678
Muktsar, IN|30.474|74.517
Mukher, IN|18.706|77.368
Mukerian, IN|31.954|75.617
Muhammadabad, IN|27.309|79.433
Muhammadabad, IN|26.034|83.381
Muhammadabad, IN|25.619|83.756
Pandit Deen Dayal Upadhyaya Nagar, IN|25.283|83.120
Mudkhed, IN|19.157|77.503
Mudhol, IN|16.334|75.283
Mudgal, IN|16.012|76.442
Muddebihal, IN|16.338|76.132
Mudbidri, IN|13.067|74.995
Mubarakpur, IN|26.089|83.291
Mothihari, IN|26.649|84.917
Morwa, IN|22.905|73.839
Morsi, IN|21.340|78.013
Morena, IN|26.499|77.995
Morvi, IN|22.817|70.838
Morar, IN|26.226|78.225
Moram, IN|17.788|76.471
Moradabad, IN|28.839|78.777
Mon, IN|26.736|95.058
Mokokchung, IN|26.325|94.518
Mokameh, IN|25.397|85.922
Moirang, IN|24.497|93.778
Moga, IN|30.814|75.169
Modasa, IN|23.463|73.299
Misrikh, IN|27.431|80.532
Mirzapur, IN|25.145|82.565
Miryalaguda, IN|16.872|79.562
Mirganj, IN|28.540|79.208
Miranpur Katra, IN|28.030|79.668
Miranpur, IN|29.290|77.949
Minjur, IN|13.280|80.258
Milak, IN|28.610|79.170
Mihona, IN|26.284|78.980
Mhow, IN|22.559|75.765
Mhaswad, IN|17.634|74.788
Mettur, IN|11.788|77.801
Mettupalayam, IN|11.300|76.935
Merta, IN|26.649|74.034
Mennanyam, IN|11.558|75.760
Mendarda, IN|21.321|70.441
Memari, IN|23.176|88.097
Melur, IN|10.032|78.339
Mehsi, IN|26.356|85.093
Mehndawal, IN|26.976|83.110
Mehkar, IN|20.151|76.568
Meerut, IN|28.980|77.706
Medinipur, IN|22.421|87.323
Medchal, IN|17.630|78.481
Medak, IN|18.045|78.261
Mayiladuthurai, IN|11.104|79.655
Mayang Imphal, IN|24.610|93.889
Mayabandar, IN|12.910|92.903
Mawana, IN|29.103|77.922
Mavoor, IN|11.267|75.917
Mavelikara, IN|9.259|76.556
Maur, IN|30.083|75.250
Mauganj, IN|24.667|81.873
Maudaha, IN|25.683|80.114
Mau Aimma, IN|25.695|81.923
Mau, IN|26.266|78.671
Mau, IN|25.942|83.561
Mattigiri, IN|12.698|77.808
Mattanur, IN|11.930|75.572
Mathura, IN|27.503|77.672
Matabhanga, IN|26.342|89.216
Masaurhi Buzurg, IN|25.354|85.032
Mormugao, IN|15.389|73.815
Markapur, IN|15.735|79.268
Mariani, IN|26.657|94.315
Mariahu, IN|25.604|82.604
Marhaura, IN|25.973|84.868
Margherita, IN|27.285|95.668
Marakkanam, IN|12.192|79.942
Marayur, IN|10.276|77.162
Marahra, IN|27.737|78.569
Mapusa, IN|15.592|73.809
Manwath, IN|19.301|76.497
Manvi, IN|15.991|77.050
Manthani, IN|18.651|79.665
Mansa, IN|29.988|75.402
Mansa, IN|23.426|72.657
Manoharpur, IN|27.298|75.950
Mannargudi, IN|10.666|79.451
Mannarakkat, IN|10.992|76.464
Manmad, IN|20.253|74.438
Mankachar, IN|25.533|89.864
Majalgaon, IN|19.155|76.210
Manjhanpur, IN|25.530|81.376
Manjeri, IN|11.120|76.120
Manipal, IN|13.350|74.783
Mani Majra, IN|30.714|76.838
Manihari, IN|25.339|87.620
Maniar, IN|25.985|84.172
Mangrul Pir, IN|20.314|77.342
Mangrol, IN|25.331|76.510
Mangrol, IN|21.123|70.115
Manglaur, IN|29.791|77.878
Mangalvedha, IN|17.510|75.447
Mangaluru, IN|12.917|74.856
Mangaldai, IN|26.442|92.030
Mangalagiri, IN|16.431|80.568
Maner, IN|25.646|84.873
Mandya, IN|12.522|76.897
Mandvi, IN|22.833|69.352
Mandvi, IN|21.255|73.304
Mandsaur, IN|24.072|75.070
Mandla, IN|22.599|80.371
Mandi Dabwali, IN|29.966|74.700
Mandi, IN|31.712|76.933
Mandawar, IN|29.487|78.127
Mandawa, IN|28.055|75.148
Mandapeta, IN|16.863|81.929
Mandapam, IN|9.276|79.124
Mandalgarh, IN|25.194|75.072
Mandal, IN|25.441|74.570
Mancherial, IN|18.871|79.429
Manchar, IN|19.004|73.943
Manawar, IN|22.236|75.089
Manavadar, IN|21.498|70.138
Manasa, IN|24.478|75.141
Manapparai, IN|10.608|78.426
Manamadurai, IN|9.673|78.471
Manali, IN|13.167|80.267
Mahabalipuram, IN|12.621|80.193
Malvan, IN|16.060|73.463
Malur, IN|13.003|77.938
Malpura, IN|26.284|75.365
Malpe, IN|13.350|74.704
Mallasamudram, IN|11.493|78.031
Malkapur, IN|20.886|76.199
Malakanagiri, IN|18.364|81.888
Maliya, IN|23.093|70.759
Malihabad, IN|26.922|80.711
Maler Kotla, IN|30.531|75.879
Malegaon, IN|20.550|74.535
Malavalli, IN|12.386|77.060
Malout, IN|30.211|74.482
Malappuram, IN|11.042|76.082
Mukandgarh, IN|27.952|75.224
Makum, IN|27.487|95.436
Maksi, IN|23.260|76.146
Makrana, IN|27.044|74.724
Majhiaon Kalan, IN|24.324|83.816
Mairwa, IN|26.232|84.163
Mainpuri, IN|27.229|79.029
Mainaguri, IN|26.563|88.820
Maihar, IN|24.266|80.761
Mahwa, IN|27.046|76.932
Mahuva, IN|21.090|71.769
Mahudha, IN|22.821|72.940
Maholi, IN|27.664|80.474
Mahoba, IN|25.291|79.875
Mahmudabad, IN|27.292|81.118
Mahishadal, IN|22.186|87.981
Mahgawan, IN|26.495|78.616
Maheshwar, IN|22.176|75.587
Mahesana, IN|23.599|72.385
Mahendragarh, IN|28.269|76.153
Mahemdavad, IN|22.824|72.756
Mahe, IN|11.702|75.535
Mahbubnagar, IN|16.744|77.986
Mahbubabad, IN|17.597|80.002
Mahasamund, IN|21.107|82.095
Maharaganj, IN|27.145|83.562
Maharajgani, IN|26.110|84.504
Maham, IN|28.969|76.295
Mahalingpur, IN|16.389|75.109
Mahad, IN|18.083|73.417
Maghar, IN|26.756|83.128
Magadi, IN|12.957|77.224
Madurantakam, IN|12.512|79.885
Madurai, IN|9.919|78.120
Madukkur, IN|10.481|79.399
Madukkarai, IN|10.906|76.963
Chennai, IN|13.088|80.278
Madikeri, IN|12.426|75.738
Madhyamgram, IN|22.689|88.446
Madhupur, IN|24.274|86.639
Madhugiri, IN|13.660|77.212
Madhubani, IN|26.354|86.072
Madhuban, IN|26.439|85.136
Madhepura, IN|25.921|86.793
Madgaon, IN|15.275|73.958
Maddur, IN|12.583|77.043
Madattukkulam, IN|10.559|77.366
Madanapalle, IN|13.550|78.503
Machilipatnam, IN|16.187|81.139
Machhlishahr, IN|25.686|82.411
Machhiwara, IN|30.916|76.200
Macherla, IN|16.476|79.435
Lunglei, IN|22.892|92.742
Lunavada, IN|23.128|73.610
Ludhiana, IN|30.912|75.854
Lucknow, IN|26.839|80.923
Luckeesarai, IN|25.177|86.095
Losal, IN|27.400|74.917
Lormi, IN|22.274|81.702
Loni, IN|28.751|77.290
Lonavla, IN|18.753|73.406
Lonar, IN|19.985|76.520
Lonand, IN|18.040|74.187
Lohardaga, IN|23.433|84.680
Lohara, IN|20.390|78.090
Lingsugur, IN|16.159|76.522
Limbdi, IN|22.565|71.811
Leteri, IN|24.060|77.409
Leh, IN|34.165|77.584
Lawngtlai, IN|22.533|92.899
Loha, IN|18.945|77.116
Lawar Khas, IN|29.111|77.778
Lauri, IN|25.140|80.001
Laungowal, IN|30.194|75.681
Latur, IN|18.397|76.568
Lathi, IN|21.723|71.388
Latehar, IN|23.744|84.500
Lasalgaon, IN|20.143|74.239
Lar, IN|26.204|83.969
Lalsot, IN|26.560|76.329
Lalpur, IN|22.191|69.964
Lalitpur, IN|24.690|78.419
Lalgudi, IN|10.874|78.819
Lalgola, IN|24.422|88.252
Lalganj, IN|25.932|81.705
Lalganj, IN|25.869|85.174
Lakshmeshwar, IN|15.127|75.469
Laksar, IN|29.759|78.041
Lakhyabad, IN|23.667|86.667
Lakhnadon, IN|22.600|79.601
Lakhipur, IN|26.030|90.306
Lakhimpur, IN|27.948|80.779
Lakheri, IN|25.672|76.177
Laharpur, IN|27.708|80.903
Lahar, IN|26.194|78.941
Ladwa, IN|29.994|77.046
Ladnun, IN|27.653|74.400
Laxmangarh, IN|27.823|75.028
Kuzhithurai, IN|8.318|77.192
Kuttuparamba, IN|11.828|75.566
Kuttippuram, IN|10.842|76.031
Koothanallur, IN|10.720|79.516
Kuttampuzha, IN|10.150|76.735
Kuthalam, IN|11.074|79.562
Kutiyana, IN|21.624|69.985
Kutiatodu, IN|9.800|76.333
Kushtagi, IN|15.756|76.191
Kushalnagar, IN|12.458|75.959
Kurnool, IN|15.829|78.036
Kurinjippadi, IN|11.550|79.591
Kurduvadi, IN|18.093|75.416
Kurandvad, IN|16.683|74.589
Kurali, IN|30.834|76.577
Kuppam, IN|12.749|78.342
Kunnamkulam, IN|10.647|76.067
Kunnamangalam, IN|11.305|75.878
Kunigal, IN|13.023|77.025
Kundla, IN|21.342|71.306
Kundgol, IN|15.256|75.247
Kundarkhi, IN|28.683|78.786
Kunda, IN|25.717|81.514
Kumta, IN|14.429|74.419
Kumher, IN|27.317|77.371
Kumhari, IN|21.267|81.517
Kumbhraj, IN|24.373|77.048
Kumbakonam, IN|10.962|79.391
Kulu, IN|31.958|77.108
Kulti, IN|23.732|86.844
Kulpahar, IN|25.320|79.639
Kulittalai, IN|10.935|78.413
Kulgam, IN|33.645|75.019
Kulasegaram, IN|8.363|77.298
Kukshi, IN|22.207|74.758
Kukatpally, IN|17.485|78.414
Kuju, IN|23.725|85.510
Kudligi, IN|14.905|76.385
Kudal, IN|16.011|73.689
Kudachi, IN|16.628|74.854
Kuchera, IN|26.987|73.971
Kuchaman, IN|27.147|74.857
Rairangpur, IN|22.267|86.174
Krishnarajpet, IN|12.666|76.488
Krishnarajasagara, IN|12.440|76.383
Krishnanagar, IN|23.406|88.491
Krishnagiri, IN|12.519|78.214
Kozhikode, IN|11.248|75.780
Koynanagar, IN|17.400|73.767
Kovvur, IN|17.016|81.729
Kovur, IN|14.501|79.985
Kovilpatti, IN|9.172|77.870
Kotturu, IN|14.824|76.220
Kottayam, IN|11.825|75.548
Kottayam, IN|9.587|76.521
Kottarakara, IN|9.004|76.774
Kottakkal, IN|11.001|76.006
Kottagudem, IN|17.551|80.618
Kotputli, IN|27.702|76.199
Kotma, IN|23.204|81.979
Kot Kapura, IN|30.581|74.826
Kotharia, IN|22.234|70.819
Kothakota, IN|16.380|77.940
Kotdwara, IN|29.746|78.522
Kotaparh, IN|19.143|82.325
Kotamangalam, IN|10.064|76.628
Kotagiri, IN|11.421|76.860
Kota, IN|25.183|75.839
Kota, IN|22.295|82.024
Kosigi, IN|15.855|77.245
Kosi, IN|27.794|77.437
Kosamba, IN|21.462|72.958
Korwai, IN|24.118|78.040
Koregaon, IN|18.646|74.059
Koregaon, IN|17.699|74.163
Korba, IN|22.346|82.696
Koratla, IN|18.822|78.712
Koratagere, IN|13.522|77.237
Koraput, IN|18.812|82.710
Koppal, IN|15.345|76.155
Kopargaon, IN|19.882|74.476
Kopaganj, IN|26.019|83.566
Konnur, IN|16.201|74.749
Konnagar, IN|22.705|88.344
Kondotty, IN|11.142|75.966
Kondapalle, IN|16.620|80.542
Kondagaon, IN|19.591|81.664
Konch, IN|25.995|79.151
Konarka, IN|19.890|86.098
Kombai, IN|9.847|77.296
Kolasib, IN|24.224|92.679
Kollegal, IN|12.154|77.111
Kolhapur, IN|16.696|74.232
Kolaras, IN|25.219|77.612
Kolar, IN|13.138|78.130
Colachel, IN|8.179|77.258
Kokrajhar, IN|26.401|90.273
Kohima, IN|25.675|94.111
Koelwar, IN|25.581|84.798
Kodungallur, IN|10.233|76.195
Kodoli, IN|16.876|74.191
Kodinar, IN|20.794|70.702
Kodarma, IN|24.468|85.594
Kodar, IN|16.998|79.966
Kodaikanal, IN|10.239|77.489
Kuchinda, IN|21.744|84.348
Koch Bihar, IN|26.325|89.445
Koath, IN|25.326|84.260
Kizhake Chalakudi, IN|10.301|76.338
Kithor, IN|28.867|77.939
Kishtwar, IN|33.313|75.767
Renwal, IN|27.158|75.358
Kishangarh, IN|26.590|74.854
Kishanganj, IN|26.102|87.955
Kiratpur, IN|29.507|78.206
Kiraoli, IN|27.138|77.785
Ulundurpet, IN|11.691|79.287
Kinwat, IN|19.626|78.199
Kichha, IN|28.912|79.520
Khutar, IN|28.203|80.270
Khusropur, IN|25.482|85.385
Khurja, IN|28.254|77.855
Khordha, IN|20.183|85.616
Khurai, IN|24.044|78.330
Khunti, IN|23.076|85.278
Khuldabad, IN|20.007|75.192
Khowai, IN|24.080|91.600
Khopoli, IN|18.786|73.346
Khirkiya, IN|22.167|76.861
Khilchipur, IN|24.039|76.578
Khetri, IN|28.001|75.786
Khetia, IN|21.671|74.585
Kheri, IN|27.904|80.798
Kheralu, IN|23.885|72.619
Khekra, IN|28.866|77.284
Khedbrahma, IN|24.030|73.046
Kheda, IN|22.752|72.685
Khed, IN|17.719|73.397
Khatra, IN|22.976|86.855
Khatima, IN|28.921|79.971
Khategaon, IN|22.596|76.913
Khatauli, IN|29.278|77.733
Kharupatia, IN|26.518|92.147
Kharsia, IN|21.990|83.105
Kharkhauda, IN|28.879|76.911
Kharhial, IN|20.288|82.761
Khargone, IN|21.823|75.614
Khardah, IN|22.719|88.378
Kharar, IN|30.746|76.647
Kharakvasla, IN|18.440|73.775
Kharagpur, IN|25.124|86.556
Kharagpur, IN|22.340|87.325
Khapa, IN|21.422|78.982
Khanna, IN|30.705|76.222
Khaniadhana, IN|25.030|78.127
Khandwa, IN|21.824|76.351
Khandela, IN|27.605|75.502
Khanapur, IN|15.640|74.508
Khammam, IN|17.248|80.144
Khamgaon, IN|20.707|76.568
Khambhat, IN|22.317|72.619
Khambhaliya, IN|22.207|69.650
Khamaria, IN|23.226|79.880
Khalilabad, IN|26.773|83.072
Khali Kachigam, IN|20.383|72.867
Khalari, IN|23.651|85.007
Khajuraho Group of Monuments, IN|24.848|79.934
Khairagarh, IN|26.944|77.818
Khairagarh, IN|21.419|80.979
Khairabad, IN|27.527|80.755
Khair, IN|27.942|77.842
Khagaul, IN|25.579|85.046
Khagaria, IN|25.502|86.467
Khadki, IN|18.564|73.852
Khada, IN|27.183|83.883
Khachrod, IN|23.423|75.282
Kaithoon, IN|25.124|75.972
Kesinga, IN|20.188|83.219
Keshorai Patan, IN|25.293|75.939
Keshod, IN|21.303|70.249
Kesariya, IN|26.350|84.871
Kerur, IN|16.014|75.546
Keonjhargarh, IN|21.632|85.597
Kendraparha, IN|20.502|86.422
Kenda, IN|23.196|86.515
Kemri, IN|28.807|79.205
Kekri, IN|25.971|75.150
Kayamkulam, IN|9.182|76.501
Kayalpattinam, IN|8.571|78.120
Kawardha, IN|22.009|81.231
Kaveripatnam, IN|12.422|78.219
Kavali, IN|14.916|79.994
Kattivakkam, IN|13.217|80.317
Kattanam, IN|9.176|76.563
Katras, IN|23.798|86.298
Katpadi, IN|12.970|79.146
Katoya, IN|23.646|88.133
Katol, IN|21.274|78.586
Katihar, IN|25.539|87.570
Kathua, IN|32.369|75.525
Kathor, IN|21.289|72.941
Kathlal, IN|22.898|72.993
Katghora, IN|22.502|82.543
Katangi, IN|23.441|79.796
Katangi, IN|21.774|79.805
Kasrawad, IN|22.127|75.611
Kasibugga, IN|18.759|84.416
Kashipur, IN|29.214|78.957
Kasganj, IN|27.809|78.646
Kasaragod, IN|12.498|74.990
Kasara, IN|19.645|73.474
Chitrakoot Dham, IN|25.215|80.916
Karwar, IN|14.814|74.130
Karur, IN|10.958|78.081
Karungappalli, IN|9.104|76.537
Karumattampatti, IN|11.109|77.182
Kartarpur, IN|31.443|75.498
Kurseong, IN|26.883|88.277
Karol Bagh, IN|28.651|77.191
Karnal, IN|29.692|76.984
Karmala, IN|18.408|75.194
Karkala, IN|13.214|74.992
Karjat, IN|18.911|73.324
Kariapatti, IN|9.675|78.100
Karimnagar, IN|18.439|79.129
Karimganj, IN|24.869|92.355
Karhal, IN|27.001|78.939
Kargil, IN|34.558|76.126
Karera, IN|25.458|78.136
Kareli, IN|22.915|79.064
Karauli, IN|26.498|77.028
Karanjia, IN|21.763|85.973
Karanja, IN|20.483|77.489
Karamsad, IN|22.542|72.904
Karamadai, IN|11.241|76.960
Karaikkudi, IN|10.066|78.768
Karaikal, IN|10.917|79.833
Karad, IN|17.289|74.182
Kapurthala Town, IN|31.380|75.381
Kapren, IN|25.405|76.074
Kapasan, IN|24.889|74.317
Kapadvanj, IN|23.023|73.071
Kanth, IN|29.059|78.630
Kantai, IN|26.214|85.297
Kantabanji, IN|20.467|82.920
Kant, IN|27.810|79.792
Kanpur, IN|26.465|80.350
Kannod, IN|22.668|76.743
Kanniyakumari, IN|8.090|77.538
Kannauj, IN|27.055|79.919
Kanhangad, IN|12.308|75.106
Kannad, IN|20.257|75.138
Kanker, IN|20.272|81.492
Kanke, IN|23.435|85.321
Kankauli, IN|16.266|73.712
Kanigiri, IN|15.406|79.507
Kangayam, IN|11.006|77.561
Kandukur, IN|15.215|79.904
Kandla, IN|23.033|70.217
Kandi, IN|23.959|88.040
Kandhla, IN|29.321|77.271
Kandahar, IN|18.873|77.192
Kanchipuram, IN|12.835|79.700
Kanakapura, IN|12.547|77.420
Kamthi, IN|21.216|79.197
Kampli, IN|15.406|76.600
Cumbum, IN|9.736|77.285
Kamarhati, IN|22.671|88.375
Kamareddi, IN|18.320|78.342
Kaman, IN|27.658|77.269
Kamalganj, IN|27.262|79.631
Kamakhyanagar, IN|20.934|85.545
Kalyani, IN|22.976|88.434
Kalyan, IN|19.244|73.136
Kalwakurti, IN|16.664|78.491
Kalugumalai, IN|9.149|77.706
Kalpi, IN|26.117|79.733
Kalpatta, IN|11.609|76.083
Kalol, IN|23.247|72.495
Kalol, IN|22.608|73.463
Kalna, IN|23.219|88.363
Kalmeshwar, IN|21.232|78.920
Kallidaikurichi, IN|8.686|77.466
Kallakkurichchi, IN|11.740|78.959
Kalka, IN|30.840|76.941
Kaliyaganj, IN|25.634|88.327
Kalimpong, IN|27.035|88.631
Kalghatgi, IN|15.183|74.971
Kalavad, IN|22.208|70.383
Kalanwali, IN|29.836|74.972
Kalanaur, IN|28.828|76.395
Kalamnuri, IN|19.674|77.311
Kalamb, IN|19.044|73.956
Kallam, IN|18.575|76.022
Kalakkadu, IN|8.514|77.549
Kalayat, IN|29.677|76.256
Kakrala, IN|27.893|79.195
Kakori, IN|26.868|80.786
Kakinada, IN|16.960|82.238
Kakdwip, IN|21.879|88.191
Kakching, IN|24.498|93.981
Kaithal, IN|29.802|76.400
Kairana, IN|29.395|77.205
Kaimori, IN|23.385|79.744
Kaimganj, IN|27.554|79.335
Kailashahar, IN|24.332|92.004
Kailaras, IN|26.305|77.616
Kaikalur, IN|16.552|81.214
Kaij, IN|18.714|76.067
Kagal, IN|16.577|74.315
Kadur, IN|13.553|76.012
Kadod, IN|21.217|73.220
Kadiri, IN|14.112|78.160
Kadikkad, IN|10.671|75.980
Kadi, IN|23.299|72.334
Kadayanallur, IN|9.073|77.342
Kanchrapara, IN|22.960|88.428
Kachhwa, IN|25.206|82.714
Kabrai, IN|25.403|80.000
Junnar, IN|19.208|73.875
Junagarh, IN|19.860|82.934
Junagadh, IN|21.520|70.460
Jhumri Telaiya, IN|24.435|85.530
Jalandhar, IN|31.326|75.579
Shadipur Julana, IN|29.124|76.405
Jugsalai, IN|22.777|86.184
Jowai, IN|25.436|92.191
Jorhat, IN|26.758|94.203
Jora, IN|26.342|77.809
Jalarpet, IN|12.570|78.573
Jogipet, IN|17.836|78.068
Jogbani, IN|26.399|87.265
Jodiya Bandar, IN|22.717|70.283
Jodhpur, IN|26.268|73.006
Jodhpur, IN|21.902|70.033
Jintur, IN|19.612|76.687
Jining, IN|28.216|94.854
Jind, IN|29.316|76.315
Jigani, IN|12.786|77.639
Jhusi, IN|25.437|81.906
Jhunjhunun, IN|28.126|75.398
Jhinjhana, IN|29.521|77.225
Jhinjhak, IN|26.561|79.734
Jharsuguda, IN|21.855|84.007
Jharia, IN|23.741|86.415
Jhargram, IN|22.454|86.995
Jhansi, IN|25.459|78.580
Jhanjharpur, IN|26.265|86.280
Jhalu, IN|29.336|78.226
Jhalrapatan, IN|24.542|76.172
Jhalod, IN|23.101|74.155
Jhalida, IN|23.365|85.976
Jhalawar, IN|24.596|76.165
Jhajjar, IN|28.606|76.656
Jhajha, IN|24.771|86.379
Jhabua, IN|22.768|74.591
Jewar, IN|28.122|77.557
Jevargi, IN|17.014|76.773
Jetpur, IN|21.755|70.623
Jeypore, IN|18.856|82.572
Jainagar, IN|26.590|86.138
Jaynagar Majilpur, IN|22.175|88.420
Jayamkondacholapuram, IN|11.213|79.364
Jawad, IN|24.599|74.863
Jaunpur, IN|25.754|82.687
Jatara, IN|25.010|79.049
Jatani, IN|20.160|85.707
Jaswantnagar, IN|26.883|78.903
Jaspur, IN|29.279|78.828
Jasidih, IN|24.514|86.646
Jashpur Nagar, IN|22.888|84.139
Jasdan, IN|22.037|71.208
Jarwal, IN|27.163|81.542
Jaora, IN|23.638|75.127
Jansath, IN|29.325|77.850
Janjgir, IN|22.009|82.578
Jangipur, IN|24.470|88.077
Jangaon, IN|17.726|79.152
Jandiala Guru, IN|31.562|75.028
Jandiala, IN|31.159|75.618
Jamuria, IN|23.705|87.079
Jamul, IN|21.250|81.400
Jamui, IN|24.926|86.225
Jamtara, IN|23.963|86.803
Jamshedpur, IN|22.803|86.185
Jamner, IN|20.809|75.778
Jamnagar, IN|22.473|70.067
Jammu, IN|32.735|74.862
Jammalamadugu, IN|14.847|78.383
Jamkhed, IN|18.735|75.313
Jamkhandi, IN|16.505|75.291
Jambusar, IN|22.052|72.801
Gogri Jamalpur, IN|25.411|86.659
Jamalpur, IN|25.313|86.489
Jamai, IN|22.196|78.592
Jamadoba, IN|23.717|86.400
Jalpaiguri, IN|26.517|88.733
Jalor, IN|25.346|72.616
Jalna, IN|19.841|75.886
Jalgaon Jamod, IN|21.052|76.535
Jalgaon, IN|21.003|75.566
Jaleshwar, IN|21.802|87.222
Jalesar, IN|27.473|78.303
Jalaun, IN|26.145|79.337
Jalalpur, IN|26.312|82.739
Jalalpore, IN|20.949|72.898
Jalali, IN|27.867|78.253
Jalalabad, IN|30.606|74.257
Jalalabad, IN|29.619|77.439
Jalalabad, IN|27.726|79.655
Jalakandapuram, IN|11.698|77.873
Jajpur, IN|20.849|86.337
Jaito, IN|30.451|74.892
Jaitaran, IN|26.204|73.937
Jaisingpur, IN|16.776|74.554
Jaisalmer, IN|26.918|70.904
Jais, IN|26.265|81.549
Jaipur, IN|26.920|75.788
Jahazpur, IN|25.620|75.276
Jahangirabad, IN|28.405|78.106
Jahanabad, IN|25.214|84.987
Jagtial, IN|18.795|78.917
Jagraon, IN|30.788|75.474
Jaggayyapeta, IN|16.894|80.098
Jagdispur, IN|25.468|84.419
Jagdishpur, IN|26.750|80.545
Jagdalpur, IN|19.081|82.021
Jagatsinghapur, IN|20.256|86.171
Jagalur, IN|14.520|76.339
Jagadhri, IN|30.167|77.304
Jafarabad, IN|20.866|71.366
Jadcherla, IN|16.774|78.137
Jabalpur, IN|23.167|79.950
Etmadpur, IN|27.235|78.198
Itarsi, IN|22.615|77.762
Itanagar, IN|27.087|93.610
Islampur, IN|26.265|88.190
Islampur, IN|25.141|85.206
Islamnagar, IN|28.329|78.725
Irugur, IN|11.018|77.063
Irinjalakuda, IN|10.342|76.211
Iringal, IN|11.559|75.617
Malda, IN|25.004|88.146
Indri, IN|29.880|77.060
Indore, IN|22.718|75.833
Indi, IN|17.177|75.953
Indergarh, IN|26.935|79.671
Indargarh, IN|25.911|78.562
Indapur, IN|18.300|73.250
Indapur, IN|18.115|75.029
Imphal, IN|24.808|93.944
Ilkal, IN|15.959|76.114
Ilaiyankudi, IN|9.625|78.624
Igatpuri, IN|19.695|73.563
Idar, IN|23.841|73.001
Idappadi, IN|11.586|77.839
Ichhawar, IN|23.028|77.017
Ichchapuram, IN|19.114|84.687
Ichalkaranji, IN|16.691|74.461
Hyderabad, IN|17.384|78.456
Hadagalli, IN|15.020|75.932
Hatti, IN|16.198|76.660
Husainabad, IN|24.528|84.000
Hunsur, IN|12.304|76.293
Hungund, IN|16.062|76.059
Hukeri, IN|16.231|74.602
Hugli, IN|22.909|88.397
Hubballi, IN|15.348|75.134
Howli, IN|26.422|90.980
Hosur, IN|12.736|77.833
Hosapete, IN|15.270|76.387
Hoskote, IN|13.071|77.798
Hoshiarpur, IN|31.537|75.913
Narmadapuram, IN|22.747|77.727
Hosadurga, IN|13.796|76.284
Honnali, IN|14.240|75.645
Honnavar, IN|14.281|74.445
Homnabad, IN|17.771|77.125
Holenarasipura, IN|12.786|76.243
Holalkere, IN|14.043|76.185
Hojai, IN|26.003|92.856
Hodal, IN|27.892|77.367
Hisua, IN|24.834|85.417
Hisar, IN|29.154|75.723
Hiriyur, IN|13.945|76.617
Hirekerur, IN|14.455|75.395
Hirakud, IN|21.525|83.873
Hinjilicut, IN|19.482|84.745
Hingoli, IN|19.715|77.142
Hinganghat, IN|20.549|78.840
Hindupur, IN|13.828|77.491
Hindoria, IN|23.903|79.569
Hindaun, IN|26.734|77.035
Himatnagar, IN|23.599|72.966
Hilsa, IN|25.316|85.282
Hazaribagh, IN|23.992|85.362
Haveri, IN|14.794|75.404
Hatta, IN|24.134|79.601
Hat Piplia, IN|22.769|76.300
Hathras, IN|27.596|78.052
Hastinapur, IN|29.160|78.008
Hassan, IN|13.007|76.096
Hasimara, IN|26.747|89.354
Hasanpur, IN|28.722|78.284
Harur, IN|12.053|78.480
Harsud, IN|22.099|76.734
Harpanahalli, IN|14.788|75.989
Harpalpur, IN|25.288|79.333
Haripad, IN|9.284|76.455
Harij, IN|23.694|71.907
Harihar, IN|14.513|75.807
Haridwar, IN|29.948|78.160
Hardoi, IN|27.395|80.132
Harda, IN|22.344|77.095
Hapur, IN|28.730|77.781
Howrah, IN|22.577|88.319
Hanumangarh, IN|29.582|74.329
Hansi, IN|29.102|75.963
Hangal, IN|14.765|75.125
Handia, IN|25.364|82.187
Hamirpur, IN|31.684|76.525
Hamirpur, IN|25.955|80.148
Halvad, IN|23.015|71.180
Halol, IN|22.503|73.472
Haliyal, IN|15.329|74.756
Halisahar, IN|22.932|88.419
Haldwani, IN|29.223|79.529
Haldaur, IN|29.290|78.284
Hajo, IN|26.245|91.525
Hajipur, IN|25.685|85.210
Hailakandi, IN|24.684|92.561
Haflong, IN|25.165|93.017
Hadgaon, IN|19.496|77.659
Habra, IN|22.842|88.656
Gyanpur, IN|25.333|82.466
Gwalior, IN|26.230|78.173
Guskhara, IN|23.493|87.735
Guruvayur, IN|10.594|76.041
Guru Har Sahai, IN|30.709|74.404
Gursarai, IN|25.617|79.181
Gursahaiganj, IN|27.115|79.732
Gurmatkal, IN|16.868|77.391
Gurugram, IN|28.460|77.026
Gurdaspur, IN|32.039|75.403
Gunupur, IN|19.080|83.809
Guntur, IN|16.300|80.457
Guntakal, IN|15.171|77.362
Gunnaur, IN|28.240|78.440
Gundlupet, IN|11.810|76.690
Guna, IN|24.647|77.311
Gummidipundi, IN|13.408|80.109
Gumla, IN|23.043|84.544
Gumia, IN|23.797|85.825
Guledagudda, IN|16.050|75.790
Kalaburagi, IN|17.336|76.838
Gulaothi, IN|28.589|77.793
Gulabpura, IN|25.904|74.660
Guduvancheri, IN|12.845|80.061
Gudur, IN|14.151|79.852
Gudiyatham, IN|12.946|78.874
Gudivada, IN|16.435|80.996
Gudalur, IN|11.521|76.481
Gudalur, IN|9.678|77.250
Gubbi, IN|13.312|76.941
Goyerkata, IN|26.700|89.026
Govardhan, IN|27.497|77.463
Gotan, IN|26.656|73.737
Gormi, IN|26.600|78.512
Gorantla, IN|13.984|77.772
Gorakhpur, IN|26.766|83.369
Gorai, IN|19.250|72.783
Gobichettipalayam, IN|11.455|77.442
Gopalganj, IN|26.467|84.440
Gooty, IN|15.118|77.638
Gondia, IN|21.460|80.192
Gondal, IN|21.961|70.803
Gonda City, IN|27.132|81.953
Gomoh, IN|23.874|86.152
Gola Gokarannath, IN|28.078|80.471
Golaghat, IN|26.512|93.960
Gokavaram, IN|17.258|81.850
Gokarna, IN|14.550|74.317
Gokak, IN|16.169|74.824
Gohana, IN|29.138|76.702
Gohad, IN|26.433|78.442
Godhra, IN|22.775|73.615
Godda, IN|24.827|87.213
Gobindpur, IN|22.634|86.072
Gobardanga, IN|22.877|88.755
Goalpara, IN|26.177|90.626
Giridih, IN|24.186|86.309
Gingee, IN|12.253|79.417
Giddarbaha, IN|30.200|74.666
Giddalur, IN|15.374|78.926
Ghugus, IN|19.938|79.112
Ghoti Budrukh, IN|19.716|73.628
Ghosi, IN|26.106|83.539
Ghogardiha, IN|26.280|86.470
Ghazipur, IN|25.583|83.585
Ghaziabad, IN|28.665|77.439
Ghatsila, IN|22.585|86.477
Ghatanji, IN|20.142|78.313
Ghatampur, IN|26.153|80.168
Ghatal, IN|22.662|87.734
Gharaunda, IN|29.537|76.971
Gairtganj, IN|23.410|78.221
Gevrai, IN|19.264|75.750
Gaya, IN|24.797|85.004
Gauripur, IN|26.083|89.961
Gauriganj, IN|26.208|81.693
Gauribidanur, IN|13.611|77.517
Gaurela, IN|22.754|81.901
Guwahati, IN|26.184|91.746
Garhwa, IN|24.160|83.808
Garot, IN|24.323|75.652
Gariadhar, IN|21.539|71.577
Garhshankar, IN|31.215|76.141
Garhmuktesar, IN|28.787|78.102
Garhchiroli, IN|20.181|80.005
Garhakota, IN|23.779|79.143
Gannavaram, IN|16.541|80.802
Gangtok, IN|27.326|88.612
Gangolli, IN|13.650|74.671
Gangoh, IN|29.780|77.263
Gangavati, IN|15.431|76.529
Gangarampur, IN|25.401|88.530
Gangapur, IN|26.472|76.717
Gangapur, IN|25.220|74.260
Gangapur, IN|19.697|75.010
Sri Ganganagar, IN|29.920|73.875
Gangakher, IN|18.970|76.749
Gandhinagar, IN|23.217|72.683
Gandhidham, IN|23.083|70.133
Gandevi, IN|20.812|72.998
Ganderbal, IN|34.226|74.775
Gajwel, IN|17.848|78.683
Gajraula, IN|28.846|78.240
Gajendragarh, IN|15.736|75.970
Gadwal, IN|16.235|77.796
Gadhinglaj, IN|16.223|74.350
Gadhada, IN|21.970|71.578
Gadarwara, IN|22.924|78.785
Gadag, IN|15.430|75.630
Fort Gloster, IN|22.504|88.183
Forbesganj, IN|26.303|87.266
Firozpur Jhirka, IN|27.789|76.945
Firozpur, IN|30.926|74.613
Firozabad, IN|27.151|78.398
Ferokh, IN|11.180|75.841
Fazilka, IN|30.402|74.028
Fatwa, IN|25.510|85.305
Fatehpur Sikri, IN|27.094|77.660
Fatehpur, IN|27.995|74.956
Fatehpur, IN|27.173|81.211
Fatehpur, IN|25.928|80.813
Fatehgarh Churian, IN|31.864|74.957
Fatehganj West, IN|28.466|79.307
Fatehabad, IN|29.515|75.456
Fatehabad, IN|27.026|78.303
Farrukhnagar, IN|17.078|78.203
Farrukhabad, IN|27.391|79.579
Faridpur, IN|28.210|79.541
Faridkot, IN|30.674|74.756
Faridabad, IN|28.411|77.313
Farakka, IN|24.817|87.900
Falakata, IN|26.520|89.204
Faizpur, IN|21.168|75.860
Fyzabad, IN|26.775|82.150
Ettumanur, IN|9.669|76.559
Etawah, IN|26.776|79.021
Etah, IN|27.559|78.657
Erraguntla, IN|14.639|78.540
Erode, IN|11.343|77.727
Erattupetta, IN|9.687|76.779
Erandol, IN|20.922|75.326
Emmiganur, IN|15.772|77.483
Eluru, IN|16.713|81.104
Elur, IN|10.067|76.283
Elumalai, IN|9.865|77.699
Ellenabad, IN|29.453|74.661
Elamanchili, IN|17.549|82.857
Egra, IN|21.899|87.538
Edappal, IN|10.783|76.008
Dwarka, IN|22.239|68.968
Durgapur, IN|23.516|87.308
Durgapur, IN|20.005|79.303
Durg, IN|21.191|81.276
Dungarpur, IN|23.843|73.715
Ganj Dundwara, IN|27.733|78.941
Dumraon, IN|25.553|84.151
Dumra, IN|26.567|85.520
Dumka, IN|24.268|87.249
Dum Duma, IN|27.569|95.557
Dam Dam, IN|22.633|88.423
Duliajan, IN|27.360|95.318
Dugda, IN|23.745|86.172
Dubrajpur, IN|23.790|87.376
Dornakal, IN|17.445|80.149
Doraha, IN|30.800|76.024
Dongargarh, IN|21.189|80.755
Dondaicha, IN|21.324|74.568
Domchanch, IN|24.475|85.692
Dombivali, IN|19.217|73.083
Doddaballapura, IN|13.295|77.538
Doda, IN|33.149|75.547
Diu, IN|20.714|70.982
Deesa, IN|24.256|72.179
Dirba, IN|30.072|75.996
Diphu, IN|25.843|93.431
Dinhata, IN|26.135|89.461
Dindori, IN|22.941|81.080
Dindigul, IN|10.369|77.980
Dinanagar, IN|32.137|75.473
Dimapur, IN|25.912|93.722
Digras, IN|20.104|77.718
Deglur, IN|18.548|77.577
Diglipur, IN|13.267|93.000
Dighwara, IN|25.744|85.010
Digboi, IN|27.393|95.618
Dig, IN|27.472|77.326
Didwana, IN|27.401|74.575
Bicholim, IN|15.593|73.946
Dibrugarh, IN|27.480|94.908
Dibai, IN|28.208|78.262
Diamond Harbour, IN|22.193|88.190
Dhuri, IN|30.368|75.868
Dhupgari, IN|26.589|89.007
Dhulian, IN|24.681|87.954
Dhule, IN|20.901|74.777
Dhubri, IN|26.019|89.986
Dhrol, IN|22.567|70.418
Dhrangadhra, IN|22.992|71.468
Dhoraji, IN|21.734|70.450
Dhone, IN|15.395|77.871
Dholka, IN|22.727|72.441
Dhing, IN|26.468|92.473
Dhenkanal, IN|20.657|85.597
Dhekiajuli, IN|26.704|92.478
Dhaurahra, IN|27.998|81.090
Dhaulpur, IN|26.693|77.880
Dharur, IN|18.820|76.109
Dharuhera, IN|28.206|76.797
Dharni, IN|21.553|76.890
Dharamsala, IN|32.220|76.320
Dharmkot, IN|30.946|75.232
Dharmavaram, IN|14.414|77.720
Dharmapuri, IN|12.128|78.158
Dharmanagar, IN|24.367|92.167
Dharmadam, IN|11.775|75.465
Dharmabad, IN|18.891|77.849
Dhariwal, IN|31.956|75.324
Dhari, IN|21.329|71.026
Dharavi, IN|19.050|72.867
Dharapuram, IN|10.738|77.532
Dharangaon, IN|21.012|75.274
Dharampuri, IN|22.150|75.344
Dharampur, IN|20.537|73.174
Dhar, IN|22.594|75.298
Dhanera, IN|24.510|72.023
Dhandhuka, IN|22.382|71.987
Dhanbad, IN|23.798|86.430
Dhanaura, IN|28.959|78.256
Dhanaula, IN|30.282|75.573
Dhamtari, IN|20.707|81.549
Dhampur, IN|29.309|78.511
Dhamnod, IN|22.209|75.471
Dhaka, IN|26.675|85.167
Dewas, IN|22.966|76.055
Deoli, IN|25.757|75.380
Devgarh, IN|25.525|73.908
Devgadh Bariya, IN|22.705|73.909
Devarkonda, IN|16.692|78.921
Devanahalli, IN|13.247|77.712
Devakottai, IN|9.947|78.823
Devadanapatti, IN|10.147|77.644
Deulgaon Raja, IN|20.018|76.038
Deshnoke, IN|27.798|73.343
Dergaon, IN|26.700|93.967
Dera Mandi, IN|28.436|77.176
Depalpur, IN|22.851|75.542
Deori Khas, IN|23.390|79.016
Deoria, IN|26.502|83.779
Deoranian, IN|28.630|79.476
Deoli, IN|20.649|78.480
Deolali, IN|19.944|73.834
Deolali, IN|19.474|74.621
Deoghar, IN|24.490|86.699
Deogarh, IN|21.538|84.733
Deoband, IN|29.695|77.680
Denkanikota, IN|12.530|77.789
Delhi Cantonment, IN|28.600|77.133
Delhi, IN|28.652|77.231
Dehradun, IN|30.324|78.034
Davorlim, IN|15.272|73.992
Davangere, IN|14.467|75.927
Dausa, IN|26.890|76.336
Daund, IN|18.465|74.584
Daudnagar, IN|25.035|84.401
Dattapur, IN|20.781|78.141
Datia, IN|25.673|78.459
Dataganj, IN|28.025|79.408
Dasuya, IN|31.817|75.653
Dasna, IN|28.677|77.523
Daryapur, IN|20.925|77.326
Darwha, IN|20.310|77.773
Darsi, IN|15.770|79.679
Darjiling, IN|27.033|88.267
Darbhanga, IN|26.152|85.897
Dapoli, IN|17.759|73.188
Danta, IN|27.296|75.187
Dandeli, IN|15.267|74.617
Dinapore, IN|25.637|85.048
Damoh, IN|23.833|79.442
Damnagar, IN|21.692|71.517
Daman, IN|20.414|72.832
Medininagar, IN|24.040|84.066
Dalsingh Sarai, IN|25.668|85.836
Dalkola, IN|25.876|87.840
Dakor, IN|22.753|73.150
Dohad, IN|22.833|74.260
Dahegam, IN|23.169|72.822
Dahanu, IN|19.968|72.713
Dadri, IN|28.553|77.554
Dabwali, IN|29.949|74.738
Dabra, IN|25.886|78.332
Daboh, IN|26.002|78.877
Dabhoi, IN|22.183|73.433
Dabhel, IN|20.410|72.883
Cuttack, IN|20.465|85.879
Curti, IN|15.417|74.017
Curchorem, IN|15.263|74.109
Cuncolim, IN|15.177|73.994
Cumbum, IN|15.582|79.111
Kadapa, IN|14.480|78.823
Cuddalore, IN|11.756|79.767
Coonoor, IN|11.350|76.794
Kundapura, IN|13.631|74.690
Colonelganj, IN|27.134|81.699
Colgong, IN|25.263|87.233
Calangute, IN|15.544|73.755
Coimbatore, IN|11.006|76.966
Kochi, IN|9.940|76.260
Clement Town, IN|30.264|78.009
Churu, IN|28.304|74.967
Churachandpur, IN|24.334|93.670
Chunar, IN|25.128|82.882
Chotila, IN|22.423|71.196
Chorwad, IN|21.029|70.233
Chopda, IN|21.246|75.299
Sholavandan, IN|10.022|77.961
Chodavaram, IN|17.829|82.935
Rampachodavaram, IN|17.441|81.776
Chittur, IN|10.700|76.747
Chittoor, IN|13.211|79.096
Chittorgarh, IN|24.890|74.624
Chittaranjan, IN|23.857|86.903
Chitradurga, IN|14.223|76.400
Chitarpur, IN|23.573|85.654
Chitapur, IN|17.124|77.082
Chidawa, IN|28.239|75.640
Chirala, IN|15.824|80.352
Chipurupalle, IN|18.311|83.568
Chiplun, IN|17.533|73.509
Chintamani, IN|13.401|78.052
Chinnur, IN|18.858|79.796
Chinna Salem, IN|11.634|78.874
Chinnamanur, IN|9.840|77.381
Chincholi, IN|17.465|77.419
Chillupar, IN|26.282|83.506
Chilakalurupet, IN|16.090|80.167
Chikodi, IN|16.429|74.586
Chiknayakanhalli, IN|13.416|76.621
Chikmagalur, IN|13.322|75.774
Chikhli, IN|20.350|76.258
Chik Ballapur, IN|13.435|77.728
Chika, IN|30.049|76.343
Chidambaram, IN|11.399|79.691
Chicholi, IN|21.469|79.702
Chhoti Sadri, IN|24.381|74.701
Chhota Udepur, IN|22.304|74.016
Chhindwara, IN|22.057|78.940
Chhibramau, IN|27.149|79.501
Chhatarpur, IN|28.498|77.183
Chhatarpur, IN|24.918|79.589
Chhatapur, IN|26.220|87.005
Chhata, IN|27.724|77.508
Chharra, IN|27.925|78.401
Chhaprauli, IN|29.210|77.175
Chapra, IN|25.780|84.747
Chhapar, IN|27.819|74.439
Chhanera, IN|21.961|76.695
Chhala, IN|23.308|72.774
Chhabra, IN|24.665|76.844
Chettipalaiyam, IN|10.912|77.037
Chetput, IN|12.464|79.348
Chetput, IN|13.070|80.241
Cheranmahadevi, IN|8.675|77.570
Chennimalai, IN|11.164|77.604
Chengannur, IN|9.316|76.615
Chengam, IN|12.309|78.791
Chengalpattu, IN|12.692|79.977
Chavara, IN|8.967|76.542
Chetwayi, IN|10.529|76.048
Chaumu, IN|27.170|75.722
Chaksu, IN|26.605|75.948
Chhatrapur, IN|19.356|84.984
Chatra, IN|24.206|84.871
Chas, IN|23.636|86.167
Charthawal, IN|29.547|77.594
Charkhi Dadri, IN|28.592|76.272
Charkhari, IN|25.403|79.749
Chapar, IN|26.273|90.446
Channarayapatna, IN|12.906|76.388
Channapatna, IN|12.651|77.207
Channagiri, IN|14.024|75.926
Changanacheri, IN|9.442|76.536
Chandor, IN|20.331|74.245
Chandur Bazar, IN|21.239|77.747
Chandur, IN|20.814|77.980
Chandur, IN|19.734|79.172
Chanda, IN|19.951|79.295
Chandrakona, IN|22.733|87.517
Chandpur, IN|29.135|78.272
Chandigarh, IN|30.736|76.788
Chandia, IN|23.656|80.709
Chanderi, IN|24.713|78.138
Chanduasi, IN|28.452|78.783
Chandauli, IN|25.258|83.268
Chandannagar, IN|22.862|88.368
Chanasma, IN|23.715|72.113
Chamrajnagar, IN|11.923|76.939
Champa, IN|22.035|82.642
Chamba, IN|32.555|76.126
Challapalle, IN|16.118|80.931
Challakere, IN|14.318|76.652
Chalisgaon, IN|20.458|75.016
Chalala, IN|21.411|71.166
Chakulia, IN|22.483|86.718
Chakradharpur, IN|22.676|85.629
Chaklasi, IN|22.653|72.945
Chakia, IN|26.416|85.047
Chakan, IN|18.761|73.864
Chaibasa, IN|22.550|85.802
Chachaura, IN|24.176|77.000
Canning, IN|22.314|88.665
Kannur, IN|11.868|75.358
Kolkata, IN|22.563|88.363
Byadgi, IN|14.673|75.487
Buxar, IN|25.575|83.980
Burla, IN|21.510|83.873
Burhar, IN|23.215|81.532
Burhanpur, IN|21.309|76.230
Bundu, IN|23.161|85.590
Bundi, IN|25.439|75.637
Buldana, IN|20.529|76.185
Bulandshahr, IN|28.404|77.858
Buguda, IN|19.808|84.791
Budhlada, IN|29.928|75.562
Budhana, IN|29.288|77.475
Budaun, IN|28.038|79.127
Bramhapuri, IN|20.611|79.861
Brajarajnagar, IN|21.817|83.917
Brahmapur, IN|19.312|84.793
Botad, IN|22.169|71.667
Borsad, IN|22.408|72.898
Borivli, IN|19.235|72.860
Borawar, IN|27.024|74.676
Bongaigaon, IN|26.477|90.558
Mumbai, IN|19.073|72.883
Bolpur, IN|23.663|87.697
Bokaro, IN|23.669|86.152
Bokajan, IN|26.021|93.779
Boisar, IN|19.804|72.756
Bodinayakkanur, IN|10.012|77.350
Bodh Gaya, IN|24.698|84.987
Bodhan, IN|18.662|77.886
Bobbili, IN|18.574|83.359
Biswan, IN|27.496|80.996
Bissau, IN|28.247|75.077
Bishrampur, IN|24.253|83.925
Bishnupur, IN|23.074|87.320
Bisauli, IN|28.308|78.937
Bisalpur, IN|28.293|79.805
Bisalgarh, IN|23.676|91.283
Birur, IN|13.597|75.972
Birpur, IN|26.508|87.012
Birmitrapur, IN|22.400|84.767
Beed, IN|18.989|75.756
Binika, IN|21.026|83.812
Bindki, IN|26.036|80.576
Etawa, IN|24.184|78.203
Bilthra, IN|26.127|83.891
Bilsi, IN|28.129|78.911
Bilsanda, IN|28.243|79.951
Bilimora, IN|20.770|72.961
Bilhaur, IN|26.843|80.064
Bilgram, IN|27.175|80.032
Bilgi, IN|16.347|75.618
Bilaspur, IN|28.887|79.270
Bilaspur, IN|22.080|82.155
Bilasipara, IN|26.233|90.234
Bilari, IN|28.621|78.804
Bilara, IN|26.181|73.706
Bikramganj, IN|25.211|84.255
Bikram, IN|25.447|84.863
Bikaner, IN|28.018|73.315
Bijnor, IN|29.373|78.136
Bijbehara, IN|33.794|75.107
Bijawar, IN|24.624|79.490
Bijapur, IN|18.794|80.816
Vijayapura, IN|16.824|75.715
Bijaipur, IN|26.051|77.371
Bijaynagar, IN|25.930|74.649
Bihta, IN|25.559|84.871
Bihar Sharif, IN|25.201|85.524
Bihariganj, IN|25.734|86.988
Bidhuna, IN|26.802|79.508
Bidasar, IN|27.836|74.318
Bidar, IN|17.908|77.515
Biaora, IN|23.921|76.911
Kil Bhuvanagiri, IN|11.442|79.648
Boothapandi, IN|8.266|77.446
Bhusawal, IN|21.044|75.785
Bhundsi, IN|28.351|77.061
Bhoom, IN|18.459|75.659
Bhuj, IN|23.254|69.669
Bhudgaon, IN|16.907|74.600
Bhubaneswar, IN|20.272|85.834
Bhuban, IN|20.882|85.833
Bhor, IN|18.149|73.843
Bhopal, IN|23.255|77.403
Bhongir, IN|17.515|78.886
Bhongaon, IN|27.255|79.181
Bhokardan, IN|20.258|75.770
Bhokar, IN|19.219|77.670
Bhogpur, IN|31.554|75.643
Bhiwani, IN|28.793|76.140
Bhiwandi, IN|19.300|73.059
Bhitarwar, IN|25.792|78.111
Bhinmal, IN|24.999|72.271
Bhinga, IN|27.703|81.934
Bhindar, IN|24.502|74.186
Bhind, IN|26.567|78.787
Bhimunipatnam, IN|17.890|83.452
Bhimavaram, IN|16.541|81.523
Bhilwara, IN|25.347|74.641
Bhiloda, IN|23.768|73.247
Bhilai, IN|21.209|81.428
Bhikkiwind Uttar, IN|31.349|74.703
Bhikhi, IN|30.059|75.535
Bhikangaon, IN|21.868|75.964
Bhetia, IN|22.793|86.141
Bhelai, IN|22.309|82.610
Bhayavadar, IN|21.855|70.248
Bhayandar, IN|19.302|72.851
Bhawanipatna, IN|19.907|83.167
Bhawanigarh, IN|30.267|76.039
Bhawani Mandi, IN|24.416|75.836
Bhavnagar, IN|21.763|72.153
Bhavani, IN|11.446|77.682
Bhattiprolu, IN|16.103|80.781
Bhatpara, IN|22.866|88.401
Bhatkal, IN|13.985|74.555
Bathinda, IN|30.207|74.939
Bhatapara, IN|21.735|81.947
Bhusawar, IN|27.039|77.048
Bharwari, IN|25.561|81.492
Bharuch, IN|21.695|72.981
Bharthana, IN|26.752|79.222
Bharatpur, IN|27.217|77.490
Bhanvad, IN|21.931|69.781
Bhanpuri, IN|21.092|80.932
Bhanpura, IN|24.513|75.747
Bhanjanagar, IN|19.927|84.582
Bhander, IN|25.736|78.746
Bhandara, IN|21.168|79.649
Bhalki, IN|18.043|77.206
Bhaisa, IN|19.113|77.963
Bhainsdehi, IN|21.645|77.630
Bhagalpur, IN|25.244|86.972
Bhadreswar, IN|22.824|88.338
Bhadravati, IN|13.848|75.705
Bhadrak, IN|21.054|86.516
Bhadrachalam, IN|17.668|80.889
Bhadra, IN|29.103|75.171
Bhadohi, IN|25.395|82.570
Bhadgaon, IN|20.669|75.229
Bhadaur, IN|30.477|75.330
Bhadasar, IN|28.315|74.290
Bhachau, IN|23.299|70.343
Bhabhua, IN|25.040|83.607
Bhabhar, IN|24.072|71.597
Beypore, IN|11.172|75.806
Bewar, IN|27.219|79.298
Betul, IN|21.901|77.902
Bettiah, IN|26.802|84.503
Betma, IN|22.687|75.615
Betamcherla, IN|15.451|78.148
Beri Khas, IN|28.701|76.577
Berasia, IN|23.631|77.434
Beohari, IN|24.024|81.378
Bemetara, IN|21.716|81.534
Belur, IN|13.166|75.865
Belsand, IN|26.444|85.401
Belonia, IN|23.252|91.454
Ballari, IN|15.142|76.924
Belagavi, IN|15.852|74.504
Beldanga, IN|23.934|88.260
Bela, IN|25.921|81.996
Behror, IN|27.888|76.281
Behat, IN|30.172|77.614
Begusarai, IN|25.419|86.134
Begun, IN|24.983|75.000
Begamganj, IN|23.599|78.341
Bedi, IN|22.501|70.044
Beawar, IN|26.101|74.320
Bazpur, IN|29.153|79.108
Bayana, IN|26.908|77.290
Bayad, IN|23.223|73.215
Bawani Khera, IN|28.949|76.031
Bawana, IN|28.798|77.034
Bawal, IN|28.072|76.583
Baud, IN|20.838|84.326
Batala, IN|31.809|75.203
Baswa, IN|27.150|76.583
Basudebpur, IN|21.120|86.729
Basti, IN|26.788|82.716
Basoda, IN|23.852|77.937
Basni, IN|27.172|73.645
Basmat, IN|19.329|77.157
Basirhat City, IN|22.661|88.855
Basi, IN|30.689|76.401
Basi, IN|30.588|76.845
Basi, IN|26.831|76.049
Basavana Bagevadi, IN|16.573|75.973
Basavakalyan, IN|17.874|76.950
Barwani, IN|22.032|74.900
Barwala, IN|29.367|75.908
Barwah, IN|22.254|76.039
Baruni, IN|25.475|85.968
Baruipur, IN|22.365|88.433
Barshi, IN|18.235|75.693
Barpeta, IN|26.323|91.006
Barpali, IN|21.190|83.587
Baroda, IN|25.500|76.650
Chhipa Barod, IN|24.624|76.708
Barnala, IN|30.375|75.549
Barnagar, IN|23.049|75.378
Barmer, IN|25.746|71.392
Barki Saria, IN|24.176|85.889
Barka Kana, IN|23.621|85.467
Barjala, IN|23.618|91.356
Bari Sadri, IN|24.413|74.473
Baripada, IN|21.935|86.729
Bari, IN|26.647|77.616
Barhiya, IN|25.288|86.021
Barh, IN|25.483|85.709
Bargur, IN|12.543|78.357
Bargi, IN|22.991|79.876
Bargarh, IN|21.333|83.619
Bareli, IN|23.004|78.230
Bareja, IN|22.849|72.591
Bareilly, IN|28.367|79.432
Bardoli, IN|21.123|73.112
Barddhaman, IN|23.256|87.857
Bar Bigha, IN|25.219|85.733
Baraut, IN|29.102|77.263
Barauli, IN|26.381|84.586
Barasat, IN|22.722|88.482
Baranagar, IN|22.641|88.377
Baran, IN|25.100|76.517
Baramula, IN|34.209|74.343
Baramati, IN|18.152|74.578
Barakpur, IN|22.766|88.363
Bapatla, IN|15.904|80.467
Baonli, IN|26.326|76.228
Baola, IN|22.828|72.364
Banur, IN|30.554|76.719
Bantval, IN|12.890|75.035
Bantva, IN|21.488|70.076
Banswara, IN|23.541|74.442
Banswada, IN|18.377|77.880
Bansi, IN|27.177|82.934
Bansdih, IN|25.884|84.218
Bansbaria, IN|22.954|88.401
Bannur, IN|12.333|76.862
Banmankhi, IN|25.889|87.194
Bankura, IN|23.232|87.072
Banki, IN|20.379|85.530
Bankapur, IN|14.923|75.262
Banka, IN|24.881|86.923
Bangarmau, IN|26.891|80.211
Bangarapet, IN|12.991|78.178
Bangaon, IN|25.867|86.512
Bangaon, IN|23.046|88.831
Banganapalle, IN|15.318|78.227
Bengaluru, IN|12.972|77.594
Banga, IN|31.189|75.995
Bandipura, IN|34.417|74.643
Bandikui, IN|27.051|76.573
Banda, IN|25.478|80.335
Banda, IN|24.045|78.961
Banat, IN|29.464|77.355
Banapur, IN|19.779|85.170
Bamor Kalan, IN|24.893|78.151
Bamaur, IN|26.339|78.101
Balussheri, IN|11.447|75.829
Balurghat, IN|25.221|88.777
Balugaon, IN|20.178|85.113
Balugan, IN|19.733|85.217
Balrampur, IN|27.429|82.185
Balotra, IN|25.832|72.240
Baloda Bazar, IN|21.657|82.161
Balod, IN|20.731|81.206
Bali, IN|22.649|88.341
Ballia, IN|25.421|86.314
Ballarpur, IN|19.847|79.346
Baliguda, IN|20.200|83.909
Bali, IN|25.197|73.291
Balasore, IN|21.493|86.933
Balarampur, IN|23.097|86.223
Balapur, IN|20.666|76.774
Balangir, IN|20.704|83.490
Balaghat, IN|21.816|80.188
Balachor, IN|31.061|76.302
Bakhtiyarpur, IN|25.462|85.532
Bakhri, IN|25.599|86.261
Budge Budge, IN|22.483|88.182
Viratnagar, IN|27.435|76.183
Bairagnia, IN|26.741|85.273
Byndoor, IN|13.867|74.633
Bail-Hongal, IN|15.814|74.859
Baikunthpur, IN|23.262|82.561
Baihar, IN|22.101|80.550
Baidyabati, IN|22.785|88.326
Bahraigh, IN|27.574|81.595
Bahjoi, IN|28.395|78.627
Baheri, IN|28.774|79.497
Baharampur, IN|24.105|88.252
Bahadurgarh, IN|28.693|76.936
Bahadurganj, IN|26.262|87.824
Bah, IN|26.869|78.594
Bagula, IN|23.337|88.641
Baghpat, IN|28.945|77.219
Bagdogra, IN|26.699|88.312
Bagha Purana, IN|30.688|75.098
Bagepalli, IN|13.783|77.797
Bagbahra, IN|21.046|82.386
Bagasra, IN|21.487|70.955
Bagar, IN|28.188|75.500
Bagalkot, IN|16.187|75.696
Bagaha, IN|27.099|84.090
Bagaha, IN|24.529|85.060
Badvel, IN|14.745|79.063
Baduria, IN|22.744|88.787
Badshahpur, IN|28.393|77.049
Badnawar, IN|23.022|75.233
Badlapur, IN|19.155|73.266
Badgam, IN|34.015|74.721
Badami, IN|15.915|75.677
Badagara, IN|11.598|75.581
Bada Barabil, IN|22.112|85.387
Bachhraon, IN|28.927|78.235
Babrala, IN|28.264|78.406
Babra, IN|21.846|71.305
Babina, IN|25.239|78.470
Baberu, IN|25.547|80.704
Babai, IN|22.703|77.935
Azamgarh, IN|26.068|83.184
Ayyampettai, IN|10.901|79.180
Ayodhya, IN|26.799|82.205
Ayakudi, IN|10.450|77.552
Avanigadda, IN|16.021|80.918
Avinashi, IN|11.193|77.269
Avadi, IN|13.115|80.110
Ausa, IN|18.247|76.499
Aurangabad, IN|24.752|84.374
Aurangabad, IN|19.878|75.342
Auraiya, IN|26.465|79.509
Aurad, IN|18.254|77.418
Attur, IN|11.594|78.601
Attingal, IN|8.696|76.815
Attili, IN|16.700|81.600
Attibele, IN|12.778|77.773
Atrauli, IN|28.030|78.286
Atmakur, IN|15.881|78.587
Adirampattinam, IN|10.341|79.379
Athani, IN|16.726|75.064
Athagarh, IN|20.520|85.630
Atarra, IN|25.286|80.572
Asind, IN|25.734|74.333
Asika, IN|19.611|84.660
Asifabad, IN|19.359|79.284
Ashta, IN|23.018|76.722
Ashta, IN|16.949|74.409
Ashoknagar, IN|24.576|77.731
Asansol, IN|23.683|86.983
Asandh, IN|29.521|76.606
Arwal, IN|25.243|84.666
Arvi, IN|20.996|78.229
Aruppukkottai, IN|9.510|78.096
Arumuganeri, IN|8.569|78.091
Arukutti, IN|9.867|76.350
Arsikere, IN|13.314|76.257
Aron, IN|24.381|77.417
Arkalgud, IN|12.762|76.060
Ariyalur, IN|11.138|79.076
Arcot, IN|12.906|79.319
Araria, IN|26.149|87.513
Arantangi, IN|10.172|78.991
Arni, IN|12.668|79.285
Arangaon, IN|19.027|74.715
Arang, IN|21.196|81.969
Aramboli, IN|8.250|77.522
Arambagh, IN|22.883|87.783
Arakkonam, IN|13.084|79.671
Arrah, IN|25.556|84.663
Aonla, IN|28.274|79.165
Anupshahr, IN|28.357|78.269
Anuppur, IN|23.103|81.691
Anupgarh, IN|29.191|73.209
Anta, IN|25.150|76.300
Anshing, IN|20.041|77.315
Annur, IN|11.236|77.105
Annigeri, IN|15.425|75.433
Annamalainagar, IN|11.400|79.733
Ankola, IN|14.660|74.305
Ankleshwar, IN|21.632|72.990
Anjar, IN|23.113|70.027
Anjangaon, IN|21.165|77.309
Anjad, IN|22.042|75.055
Angul, IN|20.841|85.102
Angamali, IN|10.191|76.388
Anekal, IN|12.711|77.696
Andol, IN|17.815|78.077
Anthiyur, IN|11.575|77.590
Andippatti, IN|9.998|77.621
Anantnag, IN|33.731|75.154
Anantapur, IN|14.678|77.608
Anandpur, IN|31.239|76.503
Anandpur, IN|21.214|86.125
Anand, IN|22.553|72.955
Anakapalle, IN|17.691|83.004
Anaimalai, IN|10.583|76.934
Amur, IN|18.793|78.277
Amudalavalasa, IN|18.410|83.903
Amta, IN|22.583|88.010
Amroli, IN|21.251|72.839
Amroha, IN|28.903|78.470
Amritsar, IN|31.622|74.875
Amreli, IN|21.600|71.212
Amravati, IN|20.933|77.750
Amod, IN|21.993|72.870
Amli, IN|20.283|73.017
Amlagora, IN|22.846|87.336
Amla, IN|21.925|78.128
Amingarh, IN|16.057|75.948
Amet, IN|25.306|73.926
Ambur, IN|12.792|78.716
Ambikapur, IN|23.119|83.195
Ambattur, IN|13.098|80.162
Ambasamudram, IN|8.711|77.452
Ambasa, IN|23.936|91.854
Ambala, IN|30.361|76.798
Ambajogai, IN|18.733|76.386
Ambah, IN|26.704|78.227
Ambad, IN|19.613|75.789
Amarpur, IN|25.040|86.902
Amarpatan, IN|24.314|80.977
Ambarnath, IN|19.200|73.167
Amalner, IN|21.040|75.059
Amalapuram, IN|16.579|82.006
Alwaye, IN|10.106|76.355
Alwar, IN|27.562|76.625
Alot, IN|23.763|75.557
Along, IN|28.170|94.801
Alnavar, IN|15.427|74.741
Almora, IN|29.597|79.659
Allinagaram, IN|10.027|77.478
Alappuzha, IN|9.490|76.326
Prayagraj, IN|25.445|81.843
Alipur Duar, IN|26.483|89.523
Alipur, IN|28.799|77.133
Aligarh, IN|27.881|78.075
Aliganj, IN|27.494|79.171
Alibag, IN|18.648|72.876
Alattur, IN|10.650|76.533
Alangulam, IN|8.864|77.499
Alangayam, IN|12.622|78.752
Alandur, IN|13.002|80.206
Alandi, IN|18.678|73.899
Aland, IN|17.564|76.569
Akot, IN|21.096|77.059
Akola, IN|20.710|76.998
Akluj, IN|17.892|75.021
Aklera, IN|24.413|76.567
Akividu, IN|16.582|81.381
Akhnur, IN|32.895|74.735
Akbarpur, IN|26.430|82.534
Akbarpur, IN|26.384|79.949
Akaltara, IN|22.025|82.426
Akalkot, IN|17.525|76.206
Ajara, IN|16.116|74.211
Ajnala, IN|31.845|74.763
Ajmer, IN|26.452|74.639
Ajaigarh, IN|24.899|80.259
Aizawl, IN|23.729|92.718
Ahwa, IN|20.757|73.686
Ahraura, IN|25.016|83.033
Ahor, IN|25.369|72.780
Ahmadpur, IN|18.706|76.937
Ahilyanagar, IN|19.095|74.738
Ahmedabad, IN|23.026|72.587
Agra, IN|27.183|78.017
Agartala, IN|23.836|91.279
Agar, IN|23.712|76.016
Afzalpur, IN|17.200|76.360
Afzalgarh, IN|29.394|78.674
Adur, IN|9.156|76.732
Adra, IN|23.497|86.684
Adoni, IN|15.628|77.275
Adilabad, IN|19.672|78.536
Addanki, IN|15.811|79.973
Achhnera, IN|27.178|77.757
Achhibal, IN|33.684|75.218
Achalpur, IN|21.257|77.510
Abu Road, IN|24.480|72.782
Abu, IN|24.594|72.718
Abohar, IN|30.145|74.196
Abhayapuri, IN|26.323|90.685
Dalli Rajhara, IN|20.586|81.075
Contai, IN|21.780|87.749
Haldia, IN|22.060|88.110
Srirampur, IN|22.948|88.020
Dumjor, IN|22.620|88.246
Bankra, IN|22.603|88.278
Chakapara, IN|22.632|88.349
Mahiari, IN|22.588|88.235
Dhulagari, IN|22.582|88.171
Panchla, IN|22.537|88.138
Pujali, IN|22.468|88.145
Maheshtala, IN|22.509|88.253
Monoharpur, IN|22.108|88.079
Badamibagh, IN|34.074|74.853
Soyibug, IN|34.077|74.706
Brahmanan di Bari, IN|32.644|74.911
Kheri Nangal, IN|29.354|76.977
Jharoda Kalan, IN|28.653|76.952
Roshanpura, IN|28.601|76.989
Dindarpur, IN|28.598|76.992
Singapur, IN|17.470|78.126
Nagavaram, IN|17.489|78.602
Jiladiguda, IN|17.332|78.526
Yamjal, IN|17.269|78.577
Ghatkesar, IN|17.451|78.684
Kompalli, IN|17.545|78.488
Vijayapura, IN|13.297|77.802
Adampur, IN|31.432|75.715
Mullanwala, IN|31.062|74.823
Chanaje, IN|18.861|72.953
Madhavaram, IN|13.148|80.231
Maduraivayal, IN|13.063|80.172
Porur, IN|13.036|80.158
Mugalivakkam, IN|13.021|80.165
Virugambakkam, IN|13.046|80.191
Madipakkam, IN|12.962|80.199
Ullagaram, IN|12.979|80.197
Perungudi, IN|12.961|80.241
Kotivakkam, IN|12.970|80.258
Rajakilpakkam, IN|12.919|80.170
Meddappakkam, IN|12.917|80.194
Kullattur, IN|12.942|80.195
Kavanur, IN|12.996|80.075
Kallamchavadi, IN|12.953|80.131
Unamaucheri, IN|12.861|80.107
Perunkalattu, IN|12.918|80.082
Madambakkam, IN|12.852|80.047
Nalambur, IN|13.087|80.170
Nerkunram, IN|13.062|80.209
Kaikalapettai, IN|13.022|80.121
Viraraghavapuram, IN|13.073|80.108
Reddipalaiyam, IN|13.108|80.121
Vengattur, IN|13.100|79.932
Tirumeshi, IN|13.053|80.060
Powai, IN|19.116|72.905
Navi Mumbai, IN|19.037|73.016
Chockli, IN|11.727|75.555
Panoor, IN|11.759|75.578
Panchkula, IN|30.695|76.850
Sholinganallur, IN|12.890|80.231
koppana Agrahara, IN|12.855|77.667
Hebbagodi, IN|12.826|77.681
Bommasandra Industrial Area, IN|12.818|77.684
Murudeshwara, IN|14.094|74.484
Shivaji Nagar, IN|18.530|73.853
Greater Noida, IN|28.496|77.536
Zerakpur, IN|30.656|76.821
Bina, IN|24.172|78.188
Mohali, IN|30.680|76.722
Pithampur, IN|22.602|75.696
Barbil, IN|22.102|85.378
Airoli, IN|19.151|72.996
Aluva, IN|10.108|76.352
Kotkapura, IN|30.582|74.833
Muvattupuzha, IN|9.980|76.574
Perumbavoor, IN|10.107|76.474
Vapi, IN|20.372|72.905
Baddi, IN|30.958|76.791
Noida, IN|28.580|77.330
Bhiwadi, IN|28.210|76.861
Mandideep, IN|23.082|77.533
Singrauli, IN|24.200|82.675
Birpara, IN|26.704|89.145
Jaigaon, IN|26.848|89.376
Akkarampalle, IN|13.650|79.420
Bellampalli, IN|19.056|79.493
Chemmumiahpet, IN|14.463|78.812
Gaddi Annaram, IN|17.367|78.524
Dasnapur, IN|19.654|78.512
Kanuru, IN|16.286|81.255
Lal Bahadur Nagar, IN|17.348|78.558
Madhira, IN|16.923|80.363
Malkajgiri, IN|17.448|78.526
Mandamarri, IN|18.965|79.475
Chinnachowk, IN|14.475|78.835
Kyathampalle, IN|19.668|78.529
Gajuwaka, IN|17.700|83.217
Katheru, IN|17.038|81.776
Metpalle, IN|18.847|78.626
Manuguru, IN|17.930|80.827
Kalyandurg, IN|14.545|77.106
Payakaraopeta, IN|17.368|82.568
Ponnur, IN|16.071|80.549
Quthbullapur, IN|17.501|78.458
Ramanayyapeta, IN|16.945|82.239
Palwancha, IN|17.582|80.677
Barpeta Road, IN|26.503|90.969
Sathupalli, IN|17.250|80.869
Yanamalakuduru, IN|16.485|80.667
Morigaon, IN|26.249|92.348
Naharlagun, IN|27.105|93.695
Serilingampalle, IN|17.493|78.302
Silapathar, IN|27.594|94.724
Lumding Railway Colony, IN|25.749|93.170
Aistala, IN|23.180|88.580
Ashoknagar Kalyangarh, IN|22.864|88.637
Bahula, IN|23.652|87.165
Thanneermukkom, IN|9.663|76.381
Aymanam, IN|9.607|76.501
Bhawanipur, IN|26.454|87.027
Bakhtiarpur, IN|25.456|85.533
Pimpri-Chinchwad, IN|18.619|73.804
Zira, IN|30.969|74.991
Longowal, IN|30.198|75.682
Adampur, IN|29.280|75.468
Shamshabad, IN|17.252|78.418
Thottada, IN|11.839|75.421
Williamnagar, IN|25.495|90.617
Nongthymmai, IN|25.564|91.906
Kumbalangy, IN|9.880|76.284
Devadurga, IN|16.423|76.936
Patran, IN|29.958|76.049
Kharghar, IN|19.050|73.070
Chendamangalam, IN|10.163|76.235
Singampunari, IN|10.186|78.415
Mannachanallur, IN|10.910|78.699
Thuraiyur, IN|11.148|78.599
Pallipalayam, IN|11.365|77.762
Kumarapalayam, IN|11.445|77.711
Parangipettai, IN|11.491|79.761
Virudhachalam, IN|11.515|79.328
Kattumannarkoil, IN|11.276|79.558
Oddanchathiram, IN|10.480|77.750$towns$, E'\n') as line) t;
