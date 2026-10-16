-- Towns, part 2 of 2 (see 20261018000000_towns.sql).

insert into public.towns (label, location)
select parts[1],
       extensions.ST_SetSRID(extensions.ST_MakePoint(parts[3]::float8, parts[2]::float8), 4326)::extensions.geography
from (select string_to_array(line, '|') as parts
      from regexp_split_to_table($towns$Udaipurwati, IN|27.730|75.472
Sumerpur, IN|25.154|73.082
Karingal, IN|8.236|77.243
Arumanai, IN|8.367|77.243
Kottur, IN|10.536|76.980
Sankagiri, IN|11.476|77.866
Electronic City Phase I, IN|12.855|77.663
Ramagundam, IN|18.755|79.474
Shella, IN|25.179|91.640
Hanumana, IN|24.779|82.096
Mirganj, IN|26.373|84.335
Sultanganj, IN|25.238|86.736
Modinagar, IN|28.831|77.573
Bagru, IN|26.811|75.547
Nimach, IN|24.459|74.866
Kamatgi, IN|16.078|75.813
Azhikkod, IN|11.920|75.335
Kamalapuram, IN|15.304|76.476
Nannambra, IN|10.992|75.908
Vellalur, IN|10.977|77.026
Thimiri, IN|12.828|79.308
Tadikombu, IN|10.439|77.955
Mechcheri, IN|11.834|77.944
Vaniyamkulam, IN|10.783|76.334
Mehidpur, IN|23.489|75.658
Khoni, IN|19.317|73.060
Karjan, IN|22.047|73.118
Cherpulassery, IN|10.877|76.309
Biswanath Chariali, IN|26.726|93.147
Jalandhar Cantonment, IN|31.294|75.620
Kagaznagar, IN|19.332|79.466
Prantij, IN|23.436|72.845
Kirandul, IN|18.636|81.258
Nedumbassery, IN|10.156|76.402
Ganaur, IN|29.130|77.018
Thoothukudi, IN|8.767|78.134
Shiraguppi, IN|16.619|74.709
Gadag-Betageri, IN|15.417|75.617
Rabkavi-Banhatti, IN|16.470|75.120
Rudrapur, IN|28.980|79.400
Bada Malhera, IN|24.564|79.307
Laitumkhrah, IN|25.571|91.898
Kurwai, IN|24.117|78.038
Jirapur, IN|24.021|76.376
Budhni, IN|22.787|77.681
Badi, IN|23.037|78.084
Areraj, IN|26.550|84.680
Sunabeda, IN|18.728|82.829
Rajgangpur, IN|22.200|84.583
Lateri, IN|24.061|77.410
V.S.K.Valasai (Dindigul-Dist.), IN|10.315|78.151
Dhamanagar, IN|20.917|86.450
Barbigha, IN|25.217|85.733
Joda, IN|22.017|85.422
Kadodara, IN|21.162|72.962
Thodupuzha, IN|9.894|76.722
Maithon, IN|23.780|86.810
Neelankarai, IN|12.950|80.259
Injambakkam, IN|12.916|80.249
Palavakkam, IN|12.954|80.257
Srikalahasti, IN|13.755|79.701
Nambol, IN|24.696|93.820
Shahbazpur, IN|26.305|87.289
Heli Mandi, IN|28.345|76.757
Manesar, IN|28.353|76.940
Pammal, IN|12.975|80.135
Anakaputhur, IN|12.983|80.126
Valasaravakkam, IN|13.044|80.173
Maduravoyal, IN|13.068|80.163
Meenambakkam, IN|12.985|80.175
Pallikaranai, IN|12.938|80.215
Ganguwa, IN|29.113|75.696
Gulgam, IN|34.550|74.217
Kopawor, IN|34.529|74.264
Barara, IN|30.215|77.040
Khairtal, IN|27.804|76.639
Kansapur, IN|30.145|77.266
Sisauli, IN|30.143|77.260
Kherli, IN|27.274|76.986
Asara, IN|29.247|77.309
Sarni, IN|22.103|78.172
Chandameta, IN|22.191|78.730
Wanadongri, IN|21.094|78.973
Nildoh, IN|21.111|78.989
Vadgaon, IN|20.376|78.113
Umarsera, IN|20.371|78.123
Belpahar, IN|21.822|83.846
Bhauri, IN|24.661|72.914
Mahna, IN|30.228|74.994
Raman, IN|29.950|74.979
Bhuwana, IN|24.621|73.708
Satalkheri, IN|24.652|75.998
Tapa, IN|30.298|75.369
Mullanpur, IN|30.855|75.661
Pehladpur Bangar, IN|28.751|77.081
Siraspur, IN|28.758|77.131
Kundli, IN|28.869|77.121
Kadipur, IN|28.774|77.163
Libaspur, IN|28.751|77.146
Burari, IN|28.756|77.199
Gil, IN|30.847|75.864
Sanehwal, IN|30.841|75.985
Karala, IN|28.735|77.035
Auhammadpur Majri, IN|28.729|77.038
Rani Khera, IN|28.706|77.026
Begampur, IN|28.727|77.067
Puth Kalan, IN|28.712|77.079
Kamaruddinnagar, IN|28.677|77.054
Mundka, IN|28.680|77.030
Bakarwala, IN|28.668|77.020
Nilithi, IN|28.652|77.056
Baprola, IN|28.641|77.014
Hashtsal, IN|28.634|77.058
Rijokri, IN|28.514|77.115
Kapas Herd, IN|28.526|77.084
Malakpur Kohi Rangpur, IN|28.540|77.121
Kirari Sulemannagar, IN|28.697|77.065
Sahibabad Daulotpur, IN|28.747|77.115
Mukandpur, IN|28.739|77.183
Bhalswa Jahangirpur, IN|28.736|77.167
Muradabad Pahari, IN|28.565|77.151
Deoli, IN|28.503|77.231
Tighri, IN|28.512|77.241
Saiyad-ul-ajaib, IN|28.519|77.204
Sadatpur Gujran, IN|28.728|77.248
Jharoda Mazra Burari, IN|28.730|77.209
Karawalnagar, IN|28.727|77.270
Mustafabad, IN|28.720|77.268
Jiwanpur, IN|28.714|77.285
Gokalpur, IN|28.703|77.290
Mandoli, IN|28.703|77.310
Babarpur, IN|28.687|77.286
Jafarabad, IN|28.679|77.271
Chilla Soroda Bangar, IN|28.596|77.302
Dalupura, IN|28.606|77.319
Ali, IN|28.516|77.310
Molarband, IN|28.503|77.314
Jaitpur, IN|28.506|77.330
Kondli, IN|28.612|77.327
Gharroli, IN|28.617|77.332
Tilpat, IN|28.465|77.333
Mithepur, IN|28.497|77.319
Choudwar, IN|20.539|85.915
Goniana Mandi, IN|30.317|74.913
Singanuram, IN|18.822|79.502
Bada, IN|26.065|75.022
Sarwar, IN|26.243|75.129
Ettumanoor, IN|9.670|76.570
Benipur, IN|26.055|86.146
Rosera, IN|25.755|86.032
Sonepur, IN|25.696|85.167
Mahnar Bazar, IN|25.610|85.481
Jora Khurd, IN|26.489|77.976
Gothara, IN|28.066|75.818
Lalru, IN|30.492|76.799
Kardhan, IN|30.318|76.866
Bablai, IN|30.357|76.879
Ahiwara, IN|21.358|81.418
Birgaon, IN|21.308|81.628
Pipri, IN|20.786|78.594
Borgaon, IN|20.723|78.604
Sindi, IN|20.742|78.587
Chicholi, IN|21.266|79.116
Mahadula, IN|21.253|79.081
Kanhan, IN|21.229|79.240
Yerkhera, IN|21.216|79.185
Narsala, IN|21.090|79.136
Hudkeshwar Buzurg, IN|21.082|79.127
Wari, IN|21.153|79.008
Vijayapuri North, IN|16.585|79.320
Maharajpur, IN|25.019|79.732
Umbri, IN|20.714|77.026
Desaiganj, IN|20.624|79.965
Ramachandrapuran, IN|17.513|78.289
Aminpur, IN|17.524|78.323
Bolarum, IN|17.556|78.348
Baspalli, IN|17.539|78.364
Raniganj, IN|17.428|78.494
Nivari, IN|25.349|78.800
Badepalli, IN|16.755|78.144
Achampet, IN|16.398|78.638
Torur, IN|17.584|79.659
Rajakheri, IN|23.859|78.785
Makronia, IN|23.848|78.799
Damua, IN|22.193|78.467
Gotegaon, IN|23.029|79.482
Kaimur, IN|24.054|80.614
Ugrakheri, IN|29.378|77.009
Tikri Kalan, IN|28.684|76.970
Nangli Sakrawat, IN|28.622|76.992
Tirora, IN|21.404|79.926
Jajmau, IN|26.430|80.409
Kumbalam, IN|9.906|76.311
Aroor, IN|9.869|76.305
Kadakkavoor, IN|8.679|76.767
Kalavoor, IN|9.570|76.328
Kalamassery, IN|10.061|76.326
Bunjwah, IN|33.146|75.948
Sujanpur, IN|32.316|75.607
Jugial, IN|32.368|75.678
Mamun, IN|32.282|75.698
Dyane, IN|20.567|74.528
Soyagaon, IN|20.552|74.507
Bangarda, IN|22.759|75.795
Bangarda Chhota, IN|22.744|75.814
Bank, IN|22.703|75.804
Ravu, IN|22.637|75.815
Palda, IN|22.680|75.894
Husainpur, IN|31.312|75.322
Bodri, IN|22.023|82.114
Sirgitti, IN|22.047|82.149
Lingiadih, IN|22.077|82.176
Tifra, IN|22.063|82.131
Deori, IN|22.099|82.266
Naila, IN|22.021|82.567
Goraya, IN|31.124|75.772
Gobindgarh, IN|30.671|76.302
Balaungi, IN|30.731|76.694
Pudupattanam, IN|12.509|80.150
Sarapaka, IN|17.691|80.870
Sadpalli, IN|17.210|80.836
Chandili, IN|19.247|83.406
Ibrahimpatnam, IN|16.583|80.514
Ramavarappadu, IN|16.521|80.681
Kanuru, IN|16.499|80.691
Poranki, IN|16.478|80.708
Tadigadapa, IN|16.471|80.697
Bacheli, IN|18.684|81.269
Cherthala, IN|9.684|76.336
Cheppad, IN|9.235|76.473
Keru, IN|26.192|73.044
Sangaria, IN|26.189|73.026
Falna, IN|25.267|73.239
Akalkuva, IN|21.554|74.019
Makhdumpur, IN|25.066|84.972
Madhurampur Dehri, IN|24.969|84.196
Nokha, IN|25.105|84.116
Bela, IN|25.557|84.431
Kotekara, IN|12.793|74.872
Someshvara, IN|12.804|74.865
Koipadi, IN|12.593|74.963
Kudlu, IN|12.530|74.979
Kakkalapalle, IN|14.642|77.567
Somandepalle, IN|14.008|77.608
Ramanattukara, IN|11.178|75.869
Chengala, IN|12.498|75.050
Ajanur, IN|12.336|75.093
Trikarpur North, IN|12.146|75.175
Trikarpur South, IN|12.116|75.185
Madayi, IN|12.034|75.238
Kunnimangalam, IN|12.074|75.241
Molakalumuru, IN|14.718|76.747
Bhadauni, IN|24.875|85.534
Satyamangala, IN|13.019|76.124
Pariyaram, IN|12.059|75.325
Bihat, IN|25.425|86.021
Hutagalli, IN|12.342|76.586
Hinakallu, IN|12.330|76.602
Cherukunnu, IN|11.996|75.287
Kannapuram, IN|11.984|75.304
Pallikunnu, IN|11.890|75.357
Chirakkal, IN|11.913|75.361
Kalliyassheri, IN|11.975|75.365
Puzhathi, IN|11.901|75.389
Kolaccheri, IN|11.976|75.417
Elayavur, IN|11.889|75.412
Pinarayi, IN|11.805|75.481
Chalakilakakara, IN|11.854|75.439
Iriveri, IN|11.856|75.474
Chelora, IN|11.895|75.440
Kudali, IN|11.920|75.472
Munderi, IN|11.930|75.445
Saknepalli, IN|18.929|79.457
Keevallur, IN|11.897|75.531
Patuvilayi, IN|11.866|75.523
Patiriyat, IN|11.849|75.515
Eruvatti, IN|11.806|75.530
Katirur, IN|11.785|75.530
Erannoli, IN|11.769|75.518
Pattyam, IN|11.793|75.564
Mokeri, IN|11.778|75.573
Kolavallur, IN|11.751|75.620
Maniyur, IN|11.552|75.650
Chorod, IN|11.628|75.591
Edaccheri, IN|11.682|75.625
Eramala, IN|11.686|75.591
Azhiyur, IN|11.693|75.560
Tuneri, IN|11.697|75.635
Panniyannur, IN|11.749|75.576
Chekkiad, IN|11.717|75.642
Ayancheri, IN|11.626|75.674
Eravattur, IN|11.580|75.738
Kunnummal, IN|11.683|75.711
Chemancheri, IN|11.405|75.724
Kizhariyur, IN|11.498|75.681
Nangli, IN|31.686|74.887
Ulliyeri, IN|11.452|75.767
Icchannur, IN|11.361|75.778
Talakkolattur, IN|11.354|75.758
Nanminda, IN|11.423|75.823
Kuruvattur, IN|11.336|75.835
Perumanna, IN|11.253|75.891
Kuttikkattur, IN|11.263|75.880
Puvatuparamba, IN|11.271|75.889
Pulakkod, IN|11.310|75.950
Tennala, IN|10.993|75.935
Ponmundam, IN|10.954|75.947
Cheriyamundam, IN|10.948|75.956
Triprangod, IN|10.842|75.949
Tanalur, IN|10.952|75.910
Edakkazhiyur, IN|10.623|75.997
Punnayur, IN|10.652|75.995
Marancheri, IN|10.741|75.971
Machai, IN|15.793|74.484
Piranvadi, IN|15.802|74.480
Kurikuppi, IN|15.218|76.649
Thirunavaya, IN|10.875|75.985
Nohsa, IN|25.565|85.056
Kandari, IN|21.061|75.810
Bodupal, IN|17.419|78.584
Pirzadaguda, IN|17.395|78.590
Meerpet, IN|17.321|78.530
Chautapal, IN|17.258|78.898
Moreh, IN|24.251|94.301
Kakkanad, IN|10.016|76.342
Abrama, IN|20.859|72.906
Phusro, IN|23.756|86.005
Alangad, IN|10.102|76.291
Andipalayam, IN|11.092|77.312
Anklav, IN|22.377|73.001
Bagbera, IN|22.759|86.190
Barauni, IN|25.471|85.976
Boriavi, IN|22.611|72.933
Kanjari, IN|22.612|72.921
Vadakkanandal, IN|11.782|78.835
Tangla, IN|26.657|91.914
Talod, IN|23.351|72.950
Sithurajapuram, IN|9.421|77.787
Shrirampur, IN|19.622|74.657
Savarkundla, IN|21.337|71.303
Resubelpara, IN|25.904|90.607
Rangat, IN|12.506|92.915
Rampura Phul, IN|30.276|75.243
Puthencruz, IN|9.977|76.410
Peruvallur, IN|11.105|75.933
Patdi, IN|23.196|71.792
Paravai, IN|9.965|78.067
Paranda, IN|18.263|75.463
Nedumpana, IN|8.908|76.693
Chandrapura, IN|23.749|86.120
Chinnalapatti, IN|10.285|77.923
Chirkunda, IN|23.748|86.788
Mulavukad, IN|10.014|76.263
Edavilangu, IN|10.240|76.171
Elamkunnapuzha, IN|10.027|76.222
Jalda, IN|22.187|84.844
Jamjodhpur, IN|21.902|70.036
Malkapur, IN|17.262|74.176
Karthikappally, IN|9.257|76.449
Kondalampatti, IN|11.635|78.124
Koothappar, IN|10.797|78.792
Koovappady, IN|10.155|76.485
Madhapar, IN|23.238|69.699
Manendragarh, IN|23.213|82.202
Maradu, IN|9.937|76.324
Marthandam, IN|8.308|77.221
Moonak, IN|29.825|75.891
Moothakunnam, IN|10.190|76.201
Vadavalli, IN|11.025|76.897
Villukuri, IN|8.223|77.373
Vilankurichi, IN|11.071|77.017
Ayyalur, IN|10.482|78.156
Chalthan, IN|21.154|72.961
Iroopara, IN|8.607|76.915
Kidarakulam, IN|8.567|76.991
Narasimhanaickenpalayam, IN|11.117|76.936
Mamidalapadu, IN|15.854|78.015
Gopavaram, IN|14.784|78.573
Jujuvadi, IN|12.768|77.792
Mukondapalli, IN|12.751|77.802
Avalepalli, IN|12.771|77.859
Kadiganpalli, IN|12.523|78.209
Lakkanahalli, IN|12.112|78.154
Pachchal, IN|12.511|78.555
Kondasamudram, IN|12.946|78.879
Podaturpet, IN|13.282|79.485
Vinnamala, IN|13.907|79.909
Vengikkal, IN|12.264|79.067
Puliyankannu, IN|12.939|79.308
Sevilimedu, IN|12.808|79.686
Nattappettai, IN|12.819|79.749
Kottaikadu, IN|12.256|79.982
Kizhuparamba, IN|11.253|76.024
Peringottupulam, IN|11.027|76.099
Kodur, IN|11.015|76.070
Devarshola, IN|11.544|76.440
Tondalam, IN|11.501|76.350
Kollivayal, IN|11.500|76.482
Kerkandi, IN|11.368|76.746
Virakeralam, IN|11.008|76.913
Idaiyarpalaiyam, IN|11.039|76.924
Chinnavadampatti, IN|11.061|76.984
Vellakkinar, IN|11.074|76.957
Rakkiyapalaiyam, IN|11.106|76.943
Kattipparutti, IN|10.874|76.053
Naduvattam, IN|10.880|76.002
Kaladi, IN|10.819|76.006
Irimbiliyam, IN|10.862|76.092
Muthutala, IN|10.835|76.160
Alankod, IN|10.746|76.035
Vadakkekkad, IN|10.664|76.003
Karakkad, IN|10.588|76.039
Kadamakudi, IN|10.064|76.246
Kottuvalli, IN|10.111|76.246
Vadakakarai, IN|10.166|76.202
Puthenvelikara, IN|10.185|76.245
Puthur, IN|10.487|76.279
Marattakara, IN|10.473|76.256
Amballur, IN|10.434|76.263
Namminikara, IN|10.432|76.254
Kallur Vadakummuri, IN|10.253|76.328
Koratti, IN|10.266|76.348
Karumalur, IN|10.133|76.280
Alengad, IN|10.119|76.302
Kadungalur, IN|10.095|76.321
Cheranellur, IN|10.054|76.290
Edattala, IN|10.056|76.385
Chengamanad, IN|10.154|76.342
Kallur Tekkumuri, IN|10.240|76.324
Marturu, IN|10.172|76.426
Chelamartam, IN|10.137|76.457
Vazhakulam, IN|10.094|76.420
Kunnatnad, IN|10.043|76.424
Vengola Kizhakkumbagam, IN|10.064|76.476
Pirayiri, IN|10.765|76.632
Ambikapuram, IN|10.794|76.653
Puthuppariyaram, IN|10.813|76.629
Marutharod, IN|10.775|76.699
Uttukuli, IN|10.652|76.978
Meppadam, IN|9.324|76.493
Kumarapuram, IN|9.271|76.433
Vakkam, IN|8.684|76.768
Kilattingal, IN|8.693|76.793
Vellur, IN|8.626|76.831
Vettanad, IN|8.606|76.942
Vattiyurkavu, IN|8.525|76.989
Srvanampatti, IN|11.076|77.004
Kalappatti, IN|11.079|77.037
Samalapuram, IN|11.072|77.198
Iramallur, IN|10.062|76.572
Pudusseri, IN|10.758|76.786
Kurichchi, IN|10.961|76.974
Kuniyamuttur, IN|10.964|76.953
Ramachettipalaiyam, IN|10.958|76.920
Kokotamangalam South, IN|9.679|76.359
Chengalam, IN|9.597|76.468
Mannanchori, IN|9.572|76.352
Srikandamangalam, IN|9.659|76.363
Bharanikavu Tekku, IN|9.185|76.561
Krishnapuram, IN|9.152|76.523
Ochira, IN|9.135|76.512
Kulasekarapuram, IN|9.091|76.530
Adanattutekkumuri Kizhakku, IN|9.079|76.514
Ayanavelikulangara Vadakku, IN|9.043|76.523
Kalleribhagam, IN|9.054|76.558
Panayattur Vadakkumbhagam, IN|8.955|76.618
Karuva, IN|8.950|76.599
Perunad, IN|8.949|76.643
Tirkadavur, IN|8.924|76.591
Kottangara, IN|8.924|76.647
Mayyanad, IN|8.837|76.645
Trikonavattam, IN|8.890|76.666
Adichanallur, IN|8.880|76.716
Talattala, IN|8.874|76.672
Minad, IN|8.850|76.695
Puttankulam, IN|8.814|76.718
Edavai, IN|8.764|76.688
Kumarapalaiyam, IN|11.502|77.256
Palangarai, IN|11.198|77.306
Tirumuruganpundi, IN|11.165|77.308
Velampalaiyam, IN|11.138|77.311
Chettipalaiyam, IN|11.167|77.335
Boyampalaiyam, IN|11.149|77.354
Nerupperichchal, IN|11.161|77.374
Mangalam, IN|11.101|77.271
Murugampalaiyam, IN|11.081|77.324
Mannarai, IN|11.117|77.373
Muttanampalaiyam, IN|11.085|77.397
Karaippudur, IN|11.057|77.306
Virapandi, IN|11.062|77.351
Nallur, IN|11.100|77.391
Jambai, IN|11.468|77.643
Pudur, IN|11.436|77.676
Tattankuttai, IN|11.435|77.724
Salangaippalaiyam, IN|11.426|77.571
Suryampalaiyam, IN|11.404|77.712
Periya Semur, IN|11.361|77.690
Brahmana Periya Agraharam, IN|11.369|77.706
Virappanchathiram, IN|11.353|77.713
Kasipalaiyam, IN|11.320|77.710
Surampatti, IN|11.327|77.711
Karumandi Chellipalaiyam, IN|11.302|77.586
Tindal, IN|11.317|77.674
Cheruthazham, IN|12.081|75.263
Idangansalai, IN|11.627|77.989
Virnur, IN|11.844|77.847
Pottaneri Nallakavundanpatti, IN|11.804|77.857
Elandakuttai, IN|11.406|77.775
Alampalaiyam, IN|11.364|77.768
Kannampalaiyam, IN|10.995|77.099
Suleswaranpatti, IN|10.639|77.008
Sundakkampalaiyam, IN|10.567|77.214
Periyakottai, IN|10.591|77.280
Darasuram, IN|10.950|79.356
Tirunageswaram, IN|10.965|79.429
Nanjikkottai, IN|10.729|79.142
Churi, IN|23.655|85.013
Saunda, IN|23.665|85.327
Sirka, IN|23.646|85.433
Kedia, IN|23.795|85.587
Karo, IN|23.785|85.978
Bermo, IN|23.788|85.935
Saram, IN|23.763|85.830
Kathhara, IN|23.764|85.885
Jaridih, IN|23.766|85.939
Kappiyara, IN|8.247|77.262
Kadayal, IN|8.408|77.266
Triparappu, IN|8.395|77.266
Tiruvattar, IN|8.331|77.267
Kattatturai, IN|8.285|77.276
Valvachatottam, IN|8.280|77.256
Mulakumud, IN|8.268|77.286
Verukulambu, IN|8.295|77.294
Ponmana, IN|8.355|77.328
Nallavila, IN|8.205|77.344
Alur, IN|8.193|77.364
Acharipallam Vaniyakudi, IN|8.174|77.385
Dharmapuram, IN|8.120|77.389
Naranammalpuram, IN|8.760|77.740
Pattamadai, IN|8.673|77.584
Eruvadi, IN|8.444|77.604
Chinna Andankovil, IN|10.951|78.068
Tandoni, IN|10.926|78.094
Senapparetti, IN|10.963|78.113
Palaiyam, IN|10.726|78.135
Silappadi, IN|10.394|78.008
Kulattuppalaiyam, IN|10.761|77.584
Sivagirippatti, IN|10.450|77.530
Bhikshandarkovil, IN|10.883|78.705
Nangavaram, IN|10.869|78.539
Pappakurichchi, IN|10.814|78.748
Tuvagudi, IN|10.747|78.821
Sankarapatti, IN|10.048|78.747
Ellakkudi, IN|10.806|78.750
Tiruverumbur, IN|10.794|78.769
Navalpattu, IN|10.751|78.776
Tiruppalai, IN|9.978|78.133
Ottakkadai, IN|9.958|78.189
Melmadai, IN|9.926|78.150
Anuppanadi, IN|9.904|78.143
Vandiyur, IN|9.909|78.161
Pudukkottai, IN|9.937|78.053
Vilangudi, IN|9.946|78.094
Anaiyur, IN|9.962|78.112
Nayanakulam, IN|9.961|78.137
Kannanendal, IN|9.965|78.142
Avaniyapuram, IN|9.882|78.113
Palaiyampatti, IN|9.539|78.098
Attimarappatti, IN|8.740|78.105
Muttayyapuram, IN|8.750|78.131
Agaram, IN|10.443|77.948
Chettinayakkanpatti, IN|10.394|77.975
Salamedu, IN|11.909|79.492
Kammivapettai, IN|11.753|79.746
Lalpettai, IN|11.301|79.556
Gundupalaiyam, IN|11.941|79.803
Ariyankuppam, IN|11.895|79.807
Manaveli, IN|11.891|79.810
Kottaikuppam, IN|11.961|79.839
Chokkanathapuram, IN|9.992|77.357
Kamayakkavundanpatti, IN|9.739|77.320
Settiyarpatti, IN|9.393|77.493
Vadakarai Kil Pidagai, IN|9.040|77.274
Ayikudi, IN|9.003|77.345
Kannankurichchi, IN|11.697|78.179
Periyapatti, IN|11.205|78.151
Narasingapuram, IN|11.604|78.578
Kushinagar, IN|26.741|83.887
Rohini, IN|28.743|77.068
Mulugu, IN|18.191|79.943
Kallakurichi, IN|11.734|78.959
Alang, IN|21.399|72.175
Amaravati, IN|16.514|80.516
Shrivardhan, IN|18.053|73.001
Chirmiri, IN|23.191|82.353
Paramathi Velur, IN|11.192|77.956
Kanayannur, IN|9.967|76.267
Shahuwadi, IN|16.910|73.947
Maval, IN|18.755|73.444
Lalganj, IN|25.799|82.998
Sadulshahar, IN|29.909|74.176
Lehragaga, IN|29.943|75.801
Santrampur, IN|23.190|73.895
Chanpatia, IN|26.944|84.538
Bhadravati, IN|20.100|79.114
Kavisuryanagar, IN|19.581|84.760
Talala, IN|21.055|70.529
Nowrozabad, IN|23.352|80.981
Pakridayal, IN|26.563|85.045
Motipur, IN|26.253|85.161
Vazhapadi, IN|11.655|78.401
Dooru Verinag, IN|33.559|75.232
Chunchupally, IN|17.523|80.604
Yadagirigutta, IN|17.589|78.943
Bhupalpally, IN|18.429|79.864
Byasanagar, IN|20.956|86.126
Nalco, IN|20.865|85.183
Mawlai-Mawiong, IN|25.623|91.882
Teliamura, IN|23.842|91.630
Kanchanpur, IN|24.036|92.200
Keirao Bitra, IN|24.711|93.975
Chumukedima, IN|25.825|93.776
Lanka, IN|25.929|92.949
Kiphire, IN|25.868|94.786
Seppa, IN|27.362|93.040
Thaikkattussery, IN|9.771|76.344
Pallipuram, IN|9.755|76.357
Mudalgi, IN|16.337|74.968
Chitaguppa, IN|17.697|77.215
Kim, IN|21.401|72.927
Sayan, IN|21.320|72.882
Morampudi, IN|16.980|81.837
Hukumpeta, IN|16.989|81.802
Nadim Tiruvuru, IN|17.112|80.609
Sriramnagar, IN|18.283|83.534
Mangalam, IN|13.658|79.463
Rameswaram, IN|14.740|78.543
L.A.Sagaram, IN|13.903|79.891
Srisailam Project RFC Township, IN|16.073|78.874
Tiruchanur, IN|13.607|79.449
Suryaraopeta, IN|17.000|82.223
Avilala, IN|13.611|79.421
Kanigiri U, IN|15.406|79.507
Tirupati NMA, IN|13.632|79.486
Dowleswaram, IN|16.948|81.780
Jaggaiahpet, IN|16.892|80.096
Niz-Hajo, IN|26.249|91.524
Jagiroad, IN|26.120|92.198
Titabor Town, IN|26.592|94.194
Duliajan Oil Town, IN|27.358|95.314
Kataiya, IN|26.568|84.083
Dinapur Cantonment, IN|25.636|85.020
Banmankhi Bazar, IN|25.888|87.194
Phulwari Sharif, IN|25.578|85.072
Dinapur Nizamat, IN|25.638|85.051
Khongapani, IN|23.191|82.163
Shivpur Charcha, IN|23.329|82.528
Tilda Newra, IN|21.553|81.802
Bhilai Charoda, IN|21.223|81.456
Sultan Pur, IN|28.496|77.161
Neb Sarai, IN|28.508|77.201
Kusum Pur, IN|28.555|77.157
Bhati, IN|28.430|77.226
Mir Pur Turk, IN|28.705|77.264
Raja Pur Khurd, IN|28.635|77.033
Dayal Pur, IN|28.718|77.265
Shafi Pur Ranhola, IN|28.657|77.040
Aya Nagar, IN|28.472|77.133
Gharonda Neemka Bangar, IN|28.616|77.288
Kamal Pur Majra Burari, IN|28.747|77.193
Nithari, IN|28.705|77.053
Taj Pul, IN|28.495|77.306
Ziauddin Pur, IN|28.709|77.277
Pul Pehlad, IN|28.499|77.291
Khajoori Khas, IN|28.710|77.259
Sultan Pur Majra, IN|28.690|77.076
Chimbel, IN|15.493|73.875
Penha de Franca, IN|15.517|73.835
Sarigam INA, IN|20.288|72.850
Sanjan, IN|20.192|72.818
Baben, IN|21.137|73.096
Kabilpor, IN|20.951|72.958
Trajpar, IN|22.816|70.867
Sarangpore, IN|21.636|73.048
Andada, IN|21.656|73.022
Khapat, IN|21.654|69.613
Undera, IN|22.348|73.133
Ambaji, IN|24.332|72.846
Barwala, IN|22.220|72.068
Chanod, IN|20.347|72.928
Solsumba, IN|20.157|72.789
Chhiri, IN|20.378|72.941
Raval, IN|21.919|69.482
Bholav, IN|21.720|73.011
Anklesvar INA, IN|21.617|73.028
Gadkhol, IN|21.644|73.012
Jhadeshwar, IN|21.714|73.032
Kansad, IN|21.075|72.879
Tarsadi, IN|21.470|72.952
Vapi INA, IN|20.360|72.931
Bopal, IN|23.033|72.467
Chhaya, IN|21.629|69.634
Vijalpor, IN|20.922|72.909
Palwal Rural, IN|28.146|77.351
Panipat Taraf Rajputan, IN|29.361|76.943
Panipat Taraf Ansar, IN|29.412|76.955
Panipat Taraf Makhdum Zadgan, IN|29.416|76.988
Ambala Sadar, IN|30.335|76.863
Raurkela Industrial Township, IN|22.200|84.862
R.S. Pora, IN|32.606|74.733
Raipur Domana, IN|32.798|74.783
Jammu Cantonment, IN|32.704|74.861
Basukinath, IN|24.394|87.086
Jadugora, IN|22.654|86.356
Gadhra, IN|22.747|86.245
Ghorabandha, IN|22.772|86.271
Sarjamda, IN|22.748|86.226
Siuliban, IN|23.749|86.785
Haludbani, IN|22.751|86.210
Chhota Gobindpur, IN|22.746|86.259
Kopali, IN|22.837|86.192
Mango, IN|22.828|86.216
Saligram, IN|13.499|74.709
Shaktinagar, IN|16.365|77.359
Panangad, IN|10.273|76.175
Karamuck, IN|10.484|76.104
Thekkumkara, IN|10.282|76.213
Pappinivattom, IN|10.294|76.158
Kanhirode, IN|11.918|75.465
Kandamkunnu, IN|11.869|75.581
Chevvoor, IN|10.459|76.209
Chendrappini, IN|10.356|76.128
Porathissery, IN|10.376|76.201
Peralassery, IN|11.832|75.483
Ongallur-I, IN|10.803|76.219
Varam, IN|11.900|75.413
Manalur, IN|10.493|76.103
Kattur, IN|10.373|76.167
Palayad, IN|11.551|75.629
Mangattidam, IN|11.843|75.544
Kurumathur, IN|12.040|75.411
Kadachira, IN|11.837|75.449
Ezhome, IN|12.030|75.282
Kanjiramkulam, IN|8.360|77.053
Kandalloor, IN|9.176|76.471
Pudussery West, IN|10.788|76.728
Killannur, IN|10.599|76.218
Puthuppally, IN|9.558|76.575
Koduvayur, IN|10.687|76.659
Muthukulam, IN|9.217|76.459
Perinjanam, IN|10.313|76.148
Kottappally, IN|11.613|75.661
Kodamthuruth, IN|9.801|76.302
Paippad, IN|9.425|76.585
Karuvanthuruthy, IN|11.172|75.823
Palai, IN|9.713|76.683
Ariyallur, IN|11.083|75.849
Ancharakandy, IN|11.884|75.485
Thiruvankulam, IN|9.947|76.367
Marampilly, IN|10.114|76.442
Kannamangalam, IN|11.075|75.985
Sreekaryam, IN|8.549|76.917
Pantheeramkavu, IN|11.231|75.852
Thazhecode, IN|11.323|75.976
Talikkulam, IN|10.440|76.095
Mulamthuruthy, IN|9.900|76.387
Muhamma, IN|9.609|76.361
Thodiyoor, IN|9.078|76.578
Ongallur-II, IN|10.790|76.219
Varappuzha, IN|10.076|76.272
Azhoor, IN|8.644|76.799
Pathirappally, IN|9.535|76.322
Ezhupunna, IN|9.821|76.300
Atholi, IN|11.389|75.760
Uliyazhathura, IN|8.582|76.922
Urakam, IN|11.051|75.988
Vijayapuram, IN|9.591|76.561
Cherukavu, IN|11.173|75.909
Vadanappally, IN|10.469|76.081
Kizhuvalam-Koonthalloor, IN|8.663|76.810
Vilavoorkkal, IN|8.481|77.022
Thenhippalam, IN|11.132|75.882
Elampalloor, IN|8.956|76.674
Chelambra, IN|11.151|75.872
Villiappally, IN|11.625|75.629
Kaipamangalam, IN|10.335|76.139
Venganoor, IN|8.396|77.003
Neduva, IN|11.057|75.867
Vilappil, IN|8.522|77.040
Parappur, IN|11.012|75.995
Vazhayur, IN|11.217|75.900
Malayinkeezhu, IN|8.490|77.037
Nattakam, IN|9.545|76.514
Othukkungal, IN|11.028|76.029
Manakunnam, IN|9.886|76.373
Peringathur, IN|11.714|75.586
Kulathummal, IN|8.507|77.081
Athiyannur, IN|8.393|77.064
Kalliyoor, IN|8.431|77.013
Kudappanakkunnu, IN|8.551|76.961
Abdu Rahiman Nagar, IN|11.070|75.939
Perumbaikad, IN|9.618|76.531
Kakkodi, IN|11.320|75.801
Choornikkara, IN|10.088|76.341
Panachikkad, IN|9.530|76.541
Olavanna, IN|11.218|75.832
Pallikal, IN|11.137|75.926
Komalapuram, IN|9.542|76.342
Vengara, IN|11.051|75.978
Vazhakkala, IN|10.012|76.326
Pallichal, IN|8.450|77.026
Moonniyur, IN|11.060|75.903
Cheruvannur, IN|11.190|75.828
Bangawan, IN|23.193|82.127
Pasan, IN|23.165|81.929
Amlai, IN|23.198|81.581
Bijuri, IN|23.252|82.117
Malajkhand, IN|22.052|80.716
Dhanpuri, IN|23.185|81.555
Kolar, IN|23.165|77.419
Kalher, IN|19.247|73.015
Aurangabad Cantonment, IN|19.876|75.292
Pasthal, IN|19.820|72.730
Jalochi, IN|18.157|74.607
Korochi, IN|16.719|74.445
Ghulewadi, IN|19.603|74.194
Pachgaon, IN|16.660|74.227
Godoli, IN|17.672|74.013
Kodoli, IN|17.670|74.035
Hupari, IN|16.617|74.404
Mharal Bk, IN|19.246|73.177
Walwadi, IN|20.921|74.761
Khaira, IN|19.787|72.762
Kabnur, IN|16.702|74.440
Ranjangaon S, IN|19.844|75.215
Dehu Road, IN|18.682|73.732
Wadgaon Kolhati, IN|19.843|75.236
Samurou, IN|24.701|93.903
Kuda, IN|25.891|93.739
Ghantapada, IN|20.935|85.188
Dera Colliery Township, IN|20.953|85.172
Lochapada, IN|19.329|84.801
Khariar Road, IN|20.899|82.509
Kurumbapet, IN|11.940|79.771
Bareta, IN|29.864|75.696
Ahmedgarh, IN|30.677|75.826
Naya Gaon, IN|30.775|76.793
Ajeetgarh, IN|27.419|75.821
Vidyavihar, IN|28.368|75.584
Merta Road, IN|26.723|73.918
Nandri, IN|26.312|73.101
Fatehnagar, IN|24.815|74.095
Thorapadi, IN|12.892|79.124
Kangeyanallur, IN|12.951|79.151
Neelagiri, IN|10.759|79.093
Vathirairuppu, IN|9.635|77.639
Keezhkulam, IN|8.231|77.186
Kothanallur, IN|8.279|77.310
Adiyanuthu, IN|10.331|77.981
Nalloor, IN|8.306|77.224
Inam Maniyachi, IN|9.171|77.851
Palugal, IN|8.354|77.186
Palappallam, IN|8.209|77.248
Mamsapuram, IN|9.500|77.588
Kallukuttam, IN|8.189|77.288
Jalladiampet, IN|12.920|80.208
Ammainaickanur, IN|10.167|77.913
Methukummal, IN|8.307|77.152
Kalinjur, IN|12.953|79.134
Sankaraperi, IN|8.839|78.105
Reethapuram, IN|8.184|77.248
Polichalur, IN|12.989|80.142
Palavansathu, IN|12.893|79.134
Kilapavoor, IN|8.909|77.431
Painkulam, IN|8.260|77.174
Unnamalaikadai, IN|8.300|77.241
Pacode, IN|8.335|77.214
Ezhudesam, IN|8.265|77.142
Edaicode, IN|8.383|77.198
Viswanatham, IN|9.430|77.800
Balakrishnapuram, IN|10.359|78.003
Mathur, IN|13.171|80.248
Allapuram, IN|12.895|79.128
Puzhal, IN|13.165|80.204
Kollancode, IN|8.289|77.108
Mappilaiurani, IN|8.836|78.135
Milavittan, IN|8.819|78.091
Ramapuram, IN|13.032|80.182
Maraimalainagar, IN|12.798|80.025
Jawaharnagar, IN|17.510|78.566
Khanapuram Haveli, IN|17.262|80.168
Taranagar, IN|23.969|91.371
Madhuban, IN|23.782|91.286
Dukli, IN|23.798|91.296
Charipara, IN|23.809|91.248
Kanpur Cantonment, IN|26.459|80.375
Nani Daman, IN|20.414|72.832
Zaxo, IQ|37.149|42.686
Umm Qasr, IQ|30.036|47.920
Tuz Khurmatu, IQ|34.888|44.633
Tikrit, IQ|34.616|43.679
Tazah Khurmatu, IQ|35.302|44.326
Tallkayf, IQ|36.491|43.121
Sumayl, IQ|36.858|42.848
Sinah, IQ|36.809|43.039
Ash Sharqat, IQ|35.517|43.228
Shaqlawah, IQ|36.404|44.326
Samarra, IQ|34.196|43.886
Pirmam, IQ|36.385|44.197
Safwan, IQ|30.116|47.716
Saddat al Hindiyah, IQ|32.716|44.279
Ruwandiz, IQ|36.611|44.522
Ranyah, IQ|36.255|44.882
Al Qaim, IQ|34.393|40.989
Habhab, IQ|33.784|44.507
Al-Hamdaniya, IQ|36.271|43.378
Qalat Sukkar, IQ|31.863|46.073
Qalat Salih, IQ|31.528|47.294
Qeladize, IQ|36.183|45.130
Mandali, IQ|33.748|45.555
Koysinceq, IQ|36.083|44.629
Kifri, IQ|34.690|44.961
Khanaqin, IQ|34.348|45.391
Kirkuk, IQ|35.468|44.392
Karbala, IQ|32.616|44.025
Kelar, IQ|34.628|45.319
Erbil, IQ|36.191|44.009
Hit, IQ|33.637|42.828
Harir, IQ|36.551|44.353
Halabja, IQ|35.178|45.986
Hadithah, IQ|34.137|42.377
Xebat, IQ|36.278|43.671
Soran, IQ|36.656|44.542
Dihok, IQ|36.866|42.988
Jamjamal, IQ|35.534|44.834
Bayji, IQ|34.929|43.489
Batifa, IQ|37.175|43.012
Baqubah, IQ|33.754|44.605
Baynjiwayn, IQ|35.621|45.949
Balad, IQ|34.015|44.146
Baharkah, IQ|36.316|44.035
Baghdad, IQ|33.341|44.401
Az Zubayr, IQ|30.392|47.702
As Suwayrah, IQ|32.926|44.776
Sulaymaniyah, IQ|35.565|45.433
As Samawah, IQ|31.332|45.294
Nahiyat ash Shinafiyah, IQ|31.584|44.647
Ash Shatrah, IQ|31.409|46.173
Ash Shamiyah, IQ|31.963|44.601
Ar Rutbah, IQ|33.037|40.286
Ar Rumaythah, IQ|31.528|45.204
Ramadi, IQ|33.421|43.308
Aqrah, IQ|36.760|43.894
An Numaniyah, IQ|32.556|45.413
Nasiriyah, IQ|31.058|46.257
Najaf, IQ|32.026|44.346
Anat al Qadimah, IQ|34.469|41.942
Al Qurnah, IQ|31.015|47.434
Al-Qasim, IQ|32.298|44.683
Al-Musayab, IQ|32.779|44.290
Al Mishkhab, IQ|31.804|44.489
Al Miqdadiyah, IQ|33.979|44.937
Al Mawsil al Jadidah, IQ|36.333|43.106
Mosul, IQ|36.335|43.119
Al Mahmudiyah, IQ|33.062|44.366
Al Mahawil, IQ|32.661|44.409
Al Madinah, IQ|30.963|47.270
Al-Kut, IQ|32.513|45.818
Kufa, IQ|32.051|44.440
Khalis, IQ|33.808|44.533
Nahiyat al Iskandariyah, IQ|32.887|44.346
Ali al Gharbi, IQ|32.462|46.688
Al Hindiyah, IQ|32.542|44.225
Al Hillah, IQ|32.464|44.420
Al Hayy, IQ|32.174|46.043
Al Harithah, IQ|30.585|47.761
Nahiyat Ghammas, IQ|31.743|44.620
Nahiyat al Fuhud, IQ|30.970|46.723
Al Faw, IQ|29.974|48.473
Al Fallujah, IQ|33.349|43.786
Basrah, IQ|30.509|47.780
Al Aziziyah, IQ|32.909|45.064
Al Amarah, IQ|31.836|47.145
Afak, IQ|32.064|45.247
Ad Dujayl, IQ|33.847|44.234
Al Diwaniyah, IQ|31.993|44.926
Abu Ghurayb, IQ|33.306|44.185
Derbendixan, IQ|35.112|45.687
Abu Gharaq, IQ|32.527|44.344
Akra, IQ|36.734|43.880
Khasnahzan, IQ|36.201|44.142
Khalifan, IQ|36.609|44.405
Hajiawa, IQ|36.236|44.795
Sinjar, IQ|36.321|41.877
Anah, IQ|34.369|41.982
Al-Alam, IQ|34.709|43.695
Sadr City, IQ|33.389|44.458
Dereluk Devera Niheliya, IQ|37.056|43.652
Simele, IQ|36.858|42.850
Shurash, IQ|35.516|44.843
Abu al-Kahsib, IQ|30.443|47.878
Sheladiz, IQ|37.033|43.776
Shahrak-e Qods, IR|35.759|51.376
Lavasan, IR|35.822|51.644
Alvand, IR|36.189|50.064
Zir Ab, IR|36.180|52.973
Bostanabad, IR|37.846|46.835
Nurabad, IR|34.073|47.972
Javanrud, IR|34.807|46.491
Istgah-e Rah Ahan-e Garmsar, IR|35.235|52.309
Qarchak, IR|35.429|51.578
Salehieh, IR|35.505|51.191
Golestan, IR|35.518|51.182
Shahre Jadide Andisheh, IR|35.680|51.019
Morteza Gerd, IR|35.602|51.350
Ferdowsiyeh, IR|35.601|51.065
Hadishahr, IR|38.848|45.662
Gomishan, IR|37.072|54.077
Khorramdarreh, IR|36.208|49.195
Padegan-e Manjil, IR|36.742|49.416
Malekabad, IR|35.816|50.823
Kamalshahr, IR|35.862|50.874
Shahrak-e Mohandesi-ye Zerai, IR|35.772|50.956
Chaharbagh, IR|35.839|50.848
Eyn-e Do, IR|31.346|48.601
Ab Pakhsh, IR|29.359|51.074
Kavar, IR|29.205|52.690
Shahrak-e Taleqani, IR|30.835|50.199
Abadeh, IR|28.832|53.173
Yasuj, IR|30.668|51.588
Ashkezar, IR|31.997|54.209
Azadshahr, IR|37.086|55.172
Zarqan, IR|29.772|52.719
Zarand, IR|30.813|56.564
Zanjan, IR|36.676|48.496
Yazd, IR|31.897|54.367
Veys, IR|31.486|48.875
Varamin, IR|35.324|51.646
Tuyserkan, IR|34.551|48.444
Torqabeh, IR|36.310|59.373
Torbat-e Heydariyeh, IR|35.274|59.219
Tonekabon, IR|36.816|50.874
Tehran, IR|35.694|51.422
Hashtpar, IR|37.797|48.905
Takestan, IR|36.071|49.696
Takab, IR|36.401|47.113
Tajrish, IR|35.804|51.426
Taft, IR|31.744|54.203
Tafresh, IR|34.693|50.016
Tabriz, IR|38.080|46.292
Tabas, IR|33.596|56.924
Surian, IR|30.455|53.651
Nur, IR|36.572|52.015
Sowmeeh Sara, IR|37.301|49.315
Sonqor, IR|34.782|47.599
Eqbaliyeh, IR|36.231|49.925
Sirjan, IR|29.451|55.681
Siahkal, IR|37.153|49.871
Shushtar, IR|32.050|48.848
Shush, IR|32.194|48.244
Shirvan, IR|37.397|57.930
Shiraz, IR|29.610|52.531
Sharifabad, IR|36.212|50.150
Shal, IR|35.898|49.769
Shahr-e Kord, IR|32.326|50.857
Shahr-e Babak, IR|30.116|55.119
Shadegan, IR|30.649|48.665
Shabestar, IR|38.180|45.703
Seyah Cheshmeh, IR|39.065|44.384
Semnan, IR|35.577|53.392
Semirom, IR|31.417|51.567
Saveh, IR|35.021|50.357
Sarvestan, IR|29.273|53.220
Sari, IR|36.563|53.060
Sardrud, IR|38.026|46.148
Sardasht, IR|36.155|45.479
Sarab, IR|37.941|47.537
Saqqez, IR|36.250|46.273
Sanandaj, IR|35.315|46.999
Salmas, IR|38.197|44.765
Ramsar, IR|36.918|50.648
Shahin Dezh, IR|36.679|46.567
Saidabad, IR|35.668|51.186
Sahneh, IR|34.481|47.691
Katalem va Sadat Shahr, IR|36.889|50.696
Sabzevar, IR|36.213|57.682
Saadat Shahr, IR|30.079|53.135
Rudsar, IR|37.137|50.292
Rudehen, IR|35.733|51.906
Robat Karim, IR|35.485|51.083
Rezvanshahr, IR|37.549|49.137
Ravar, IR|31.266|56.805
Ravansar, IR|34.715|46.653
Rasht, IR|37.276|49.589
Ramshir, IR|30.893|49.408
Ramhormoz, IR|31.280|49.604
Rafsanjan, IR|30.407|55.994
Quchan, IR|37.106|58.510
Qorveh, IR|35.166|47.806
Qom, IR|34.640|50.876
Qir, IR|28.483|53.035
Qidar, IR|36.115|48.591
Qeshm, IR|26.949|56.269
Qazvin, IR|36.269|50.004
Qasr-e Shirin, IR|34.516|45.579
Qarah Zia od Din, IR|38.892|45.026
Qods, IR|35.721|51.109
Rudan, IR|27.442|57.192
Farrokh Shahr, IR|32.272|50.980
Qaen, IR|33.727|59.184
Qaem Shahr, IR|36.467|52.868
Sarpol-e Zahab, IR|34.461|45.863
Poldokhtar, IR|33.152|47.710
Poldasht, IR|39.348|45.071
Pishva, IR|35.308|51.727
Piranshahr, IR|36.701|45.141
Paveh, IR|35.043|46.356
Parsabad, IR|39.648|47.917
Osku, IR|37.915|46.123
Oshnaviyeh, IR|37.040|45.098
Orumiyeh, IR|37.553|45.076
Omidiyeh, IR|30.763|49.702
Nurabad, IR|30.114|51.522
Nowshahr, IR|36.649|51.496
Neyshabur, IR|36.213|58.796
Neyriz, IR|29.199|54.328
Neka, IR|36.651|53.299
Nazarabad, IR|35.954|50.606
Natanz, IR|33.511|51.918
Nasirshahr, IR|35.492|51.138
Naqadeh, IR|36.955|45.388
Nakhl-e Taqi, IR|27.498|52.587
Najafshahr, IR|29.386|55.718
Nain, IR|32.860|53.087
Nahavand, IR|34.191|48.374
Meshkin Dasht, IR|35.750|50.944
Minudasht, IR|37.230|55.372
Minab, IR|27.131|57.087
Mianeh, IR|37.421|47.715
Miandoab, IR|36.967|46.110
Meybod, IR|32.250|54.017
Meshgin Shahr, IR|38.399|47.682
Mahriz, IR|31.584|54.443
Masjed Soleyman, IR|31.936|49.304
Bardsir, IR|29.923|56.574
Mashhad, IR|36.298|59.606
Marvdasht, IR|29.874|52.803
Marivan, IR|35.518|46.183
Mahdasht, IR|35.728|50.813
Marand, IR|38.433|45.775
Maragheh, IR|37.392|46.239
Maragheh, IR|35.829|59.633
Manujan, IR|27.399|57.497
Manjil, IR|36.744|49.401
Malekan, IR|37.143|46.103
Malayer, IR|34.302|48.822
Malard, IR|35.666|50.977
Maku, IR|39.290|44.460
Maku, IR|27.849|52.423
Mahmudabad, IR|36.632|52.263
Mahmudabad Nemuneh, IR|36.290|49.901
Mahan, IR|30.059|57.292
Mahallat, IR|33.911|50.453
Mahabad, IR|36.763|45.722
Madavan, IR|30.715|51.541
Lordegan, IR|31.513|50.827
Likak, IR|30.895|50.093
Lar, IR|27.683|54.342
Langarud, IR|37.195|50.153
Lamerd, IR|27.334|53.179
Lali, IR|32.330|49.093
Lahijan, IR|37.204|50.009
Kut-e Abdollah, IR|31.239|48.656
Kuhdasht, IR|33.533|47.610
Kord Kuy, IR|36.793|54.112
Kish, IR|26.558|54.019
Khuy, IR|38.550|44.952
Khurmuj, IR|28.654|51.380
Khansar, IR|33.221|50.315
Khosrowshahr, IR|37.950|46.053
Khorramshahr, IR|30.441|48.184
Khorramabad, IR|33.488|48.356
Khonj, IR|27.891|53.434
Khomeyn, IR|33.639|50.080
Khomam, IR|37.390|49.658
Kherameh, IR|29.499|53.312
Bandar-e Khamir, IR|26.952|55.585
Khalkhal, IR|37.618|48.529
Kermanshah, IR|34.314|47.065
Kerman, IR|30.283|57.079
Kazerun, IR|29.619|51.654
Simin Shahr, IR|37.014|54.230
Kashmar, IR|35.238|58.466
Kashan, IR|33.982|51.428
Karaj, IR|35.833|50.992
Karahrud, IR|34.061|49.645
Kangavar, IR|34.504|47.965
Bandar-e Kangan, IR|27.834|52.063
Kamyaran, IR|34.795|46.937
Kalaleh, IR|37.379|55.493
Kahrizak, IR|35.346|51.844
Kabudarahang, IR|35.209|48.723
Eyvan, IR|33.827|46.310
Juybar, IR|36.641|52.912
Jask, IR|25.645|57.776
Jam, IR|27.830|52.325
Jajarm, IR|36.950|56.380
Jahrom, IR|28.500|53.560
Izeh, IR|31.830|49.868
Ilam, IR|33.637|46.423
Hoveyzeh, IR|31.462|48.074
Hendijan, IR|30.236|49.712
Hashtgerd, IR|35.962|50.680
Hasanabad, IR|35.367|51.235
Harsin, IR|34.272|47.586
Hamidiyeh, IR|31.483|48.433
Hamadan, IR|34.799|48.515
Hajjiabad, IR|28.357|54.423
Hajjiabad, IR|28.309|55.902
Haftkel, IR|31.447|49.530
Hafshejan, IR|32.227|50.793
Gorgan, IR|36.843|54.444
Gonbad-e Kavus, IR|37.250|55.167
Gonabad, IR|34.353|58.684
Golpayegan, IR|33.454|50.288
Gerash, IR|27.670|54.136
Parsian, IR|27.208|53.036
Gotvand, IR|32.246|48.813
Garmsar, IR|35.218|52.341
Germi, IR|39.022|48.080
Bandar-e Genaveh, IR|29.579|50.517
Galugah, IR|36.727|53.809
Galikesh, IR|37.273|55.434
Fuman, IR|37.224|49.312
Firuzkuh, IR|35.757|52.771
Firuzabad, IR|28.845|52.572
Ferunabad, IR|35.516|51.623
Fereydun Kenar, IR|36.685|52.519
Ferdows, IR|34.019|58.172
Fazelabad, IR|36.898|54.750
Fasa, IR|28.938|53.648
Farsan, IR|32.257|50.561
Farrashband, IR|28.860|52.095
Evaz, IR|27.762|54.004
Estahban, IR|29.127|54.042
Eslamabad-e Gharb, IR|34.109|46.530
Eshtehard, IR|35.725|50.366
Esfarayen, IR|37.076|57.510
Eqlid, IR|30.899|52.697
Shahrud, IR|36.418|54.976
Dorud, IR|33.492|49.062
Dogonbadan, IR|30.359|50.798
Divandarreh, IR|35.914|47.024
Dezful, IR|32.381|48.406
Bandar-e Deyr, IR|27.840|51.938
Delijan, IR|33.990|50.684
Dehloran, IR|32.694|47.268
Dehdasht, IR|30.793|50.565
Safashahr, IR|30.613|53.195
Dehaqan, IR|31.940|51.647
Susangerd, IR|31.564|48.190
Darreh Shahr, IR|33.144|47.380
Dargaz, IR|37.444|59.108
Daran, IR|32.987|50.411
Darab, IR|28.752|54.541
Damghan, IR|36.168|54.343
Damavand, IR|35.718|52.070
Choghadak, IR|28.986|51.036
Chenaran, IR|36.645|59.121
Charam, IR|30.756|50.745
Chalus, IR|36.655|51.420
Chahar Dangeh, IR|35.603|51.310
Bushehr, IR|28.969|50.837
Bumahen, IR|35.730|51.869
Bukan, IR|36.521|46.209
Buin Zahra, IR|35.767|50.058
Borujerd, IR|33.897|48.752
Borujen, IR|31.965|51.287
Borazjan, IR|29.270|51.219
Bojnurd, IR|37.475|57.329
Birjand, IR|32.866|59.221
Bijar, IR|35.867|47.605
Bonab, IR|37.340|46.056
Behshahr, IR|36.692|53.553
Behbahan, IR|30.596|50.242
Masal, IR|37.363|49.133
Bardaskan, IR|35.262|57.971
Baravat, IR|29.066|58.405
Baneh, IR|35.998|45.885
Bandar-e Torkaman, IR|36.901|54.072
Bandar-e Mahshahr, IR|30.557|49.189
Bandar-e Lengeh, IR|26.562|54.884
Bandar-e Kong, IR|26.598|54.937
Bandar-e Gaz, IR|36.774|53.948
Bandar-e Deylam, IR|30.054|50.159
Bandar-e Anzali, IR|37.473|49.458
Bandar Abbas, IR|27.186|56.281
Bam, IR|29.106|58.357
Bahar, IR|34.907|48.441
Bagh-e Malek, IR|31.524|49.886
Baft, IR|29.233|56.602
Bafq, IR|31.604|55.402
Babolsar, IR|36.699|52.650
Babol, IR|36.551|52.679
Azna, IR|33.609|48.931
Azna, IR|33.456|49.456
Hashtrud, IR|37.478|47.051
Shazand, IR|33.931|49.406
Astara, IR|38.431|48.870
Astaneh-ye Ashrafiyeh, IR|37.263|49.943
Ashkhaneh, IR|37.562|56.921
Asadabad, IR|34.782|48.120
Arsanjan, IR|29.912|53.309
Ardestan, IR|33.379|52.370
Ardakan, IR|32.310|54.017
Ardabil, IR|38.250|48.293
Aran Bidgol, IR|34.058|51.483
Arak, IR|34.095|49.698
Andimeshk, IR|32.462|48.354
Anbarabad, IR|28.476|57.848
Anar, IR|30.871|55.270
Amol, IR|36.470|52.351
Amlash, IR|37.097|50.187
Amir Kola, IR|36.597|52.666
Shahriar, IR|35.659|51.058
Aligudarz, IR|33.404|49.692
Ali Abad-e Katul, IR|36.910|54.867
Aleshtar, IR|33.864|48.263
Ajab Shir, IR|37.478|45.894
Ahvaz, IR|31.319|48.684
Ahram, IR|28.883|51.275
Ahar, IR|38.477|47.070
Aghajari, IR|30.701|49.831
Abyek, IR|36.067|50.550
Abyek, IR|36.040|50.531
Abhar, IR|36.147|49.218
Abdanan, IR|32.993|47.420
Abarkuh, IR|31.129|53.282
Abadeh, IR|31.161|52.651
Abadan, IR|30.339|48.304
Mohammad Shahr, IR|35.763|50.917
Garmdarreh, IR|35.748|51.069
Baqershahr, IR|35.532|51.405
Qiamdasht, IR|35.524|51.651
Showt, IR|39.219|44.770
Pasargad, IR|30.202|53.180
Vahidiyeh, IR|35.714|51.471
Nasir Abaad, IR|35.610|51.161
Shahedshahr, IR|35.573|51.085
Ovrin, IR|35.548|51.128
Eqbaliyeh, IR|35.302|51.536
Shahin Shahr, IR|32.858|51.553
Zarrin Shahr, IR|32.391|51.377
Varnamkhvast, IR|32.356|51.379
Tiran, IR|32.703|51.154
Sedeh Lanjan, IR|32.379|51.316
Rehnan, IR|32.683|51.602
Shahreza, IR|32.009|51.864
Goldasht, IR|32.628|51.439
Qahderijan, IR|32.577|51.454
Najafabad, IR|32.635|51.365
Mobarakeh, IR|32.346|51.502
Khowrzuq, IR|32.778|51.647
Khomeyni Shahr, IR|32.686|51.536
Kelishad va Sudarjan, IR|32.551|51.528
Gaz-e Borkhar, IR|32.805|51.621
Fulad Shahr, IR|32.487|51.397
Falavarjan, IR|32.555|51.510
Isfahan, IR|32.652|51.675
Dowlatabad, IR|32.800|51.696
Dizicheh, IR|32.388|51.510
Dastgerd, IR|32.802|51.664
Dorcheh Piaz, IR|32.615|51.556
Chamgordan, IR|32.393|51.339
Baharestan, IR|32.488|51.773
Abrisham, IR|32.556|51.573
Eslamshahr, IR|35.552|51.235
Zabol, IR|31.031|61.495
Zahedan, IR|29.496|60.863
Torbat-e Jam, IR|35.244|60.623
Taybad, IR|34.740|60.776
Saravan, IR|27.371|62.331
Sarakhs, IR|36.545|61.158
Qasr-e Qand, IR|26.248|60.752
Pishin, IR|26.079|61.754
Nikshahr, IR|26.226|60.214
Nehbandan, IR|31.542|60.036
Konarak, IR|25.360|60.400
Khvaf, IR|34.572|60.144
Khash, IR|28.221|61.216
Jalq, IR|27.603|62.710
Iranshahr, IR|27.202|60.685
Chabahar, IR|25.292|60.643
Chamran, IR|30.708|49.163
Sheyban, IR|31.408|48.795
Shahr-e Sadra, IR|29.800|52.502
Fardis, IR|35.755|50.997
Mamuniyeh, IR|35.305|50.499
Parand, IR|35.472|50.975
Bidestan, IR|36.231|50.124
Mohammadiyeh, IR|36.224|50.182
Shahrak-e Pardisan, IR|34.557|50.802
Sabbashahr, IR|35.580|51.114
Nasim Shahr, IR|35.565|51.163
Pardis, IR|35.747|51.812
Ilkhchi, IR|37.937|45.979
Azarshahr, IR|37.759|45.978
Mahajeran, IR|34.050|49.435
Kashan, IR|34.002|51.439
Jiroft, IR|28.678|57.741
Kahnuj, IR|27.940|57.700
Golbahar, IR|36.570|59.190
Mahdishahr, IR|35.711|53.354
Aq Qala, IR|37.014|54.455
Qaemiyeh, IR|29.852|51.588
Mojtame-e Maskuni-ye Namju, IR|35.472|51.724
Shahrak-e Alain, IR|35.582|51.456
Vahidiyeh, IR|35.607|51.035
Khabarabad, IR|35.543|51.148
Bandar-e Emam Khomeyni, IR|30.437|49.103
Ali Shahr, IR|28.931|51.066
Mehestan, IR|35.989|50.745
Pakdasht, IR|35.479|51.683
Boshruyeh, IR|33.868|57.429
Andisheh, IR|35.747|51.277
Kahrizak, IR|35.517|51.361
Nasimshahr, IR|35.565|51.158
Baghestan, IR|35.647|51.134
Sahand, IR|37.951|46.110
Safadasht, IR|35.692|50.848
Gorji-ye Sofla, IR|36.356|59.660
Akureyri, IS|65.684|-18.088
Reykjavik, IS|64.135|-21.895
Kopavogur, IS|64.112|-21.913
Keflavik, IS|64.005|-22.562
Hafnarfjoerdur, IS|64.067|-21.938
Reykjanesbaer, IS|63.998|-22.561
Vittoria, IT|36.952|14.528
Villabate, IT|38.078|13.443
Vibo Valentia, IT|38.676|16.101
Trapani, IT|38.018|12.536
Termini Imerese, IT|37.982|13.697
Siracusa, IT|37.075|15.287
Sinnai, IT|39.303|9.203
Siderno, IT|38.270|16.296
Sestu, IT|39.298|9.092
Selargius, IT|39.258|9.163
Scordia, IT|37.295|14.841
Scicli, IT|36.790|14.703
Sciacca, IT|37.507|13.084
San Giovanni la Punta, IT|37.577|15.094
San Giovanni in Fiore, IT|39.254|16.697
San Cataldo, IT|37.484|13.985
Sambiase, IT|38.967|16.283
Rossano Stazione, IT|39.599|16.635
Rosolini, IT|36.821|14.951
Ribera, IT|37.498|13.267
Reggio Calabria, IT|38.110|15.661
Ragusa, IT|36.926|14.724
Quattromiglia, IT|39.345|16.238
Quartu SantElena, IT|39.229|9.250
Pozzallo, IT|36.730|14.847
Porto Empedocle, IT|37.289|13.525
Piazza Armerina, IT|37.384|14.369
Paterno, IT|37.567|14.903
Partinico, IT|38.047|13.118
Palmi, IT|38.359|15.852
Palma di Montechiaro, IT|37.191|13.766
Palermo, IT|38.117|13.364
Palagonia, IT|37.330|14.745
Pachino, IT|36.715|15.090
Oristano, IT|39.904|8.593
Noto, IT|36.892|15.070
Niscemi, IT|37.146|14.394
Nicastro, IT|38.971|16.313
Monserrato, IT|39.256|9.144
Monreale, IT|38.081|13.289
Modica, IT|36.859|14.760
Misterbianco, IT|37.518|15.009
Misilmeri, IT|38.032|13.448
Milazzo, IT|38.220|15.240
Messina, IT|38.194|15.553
Mazara del Vallo, IT|37.655|12.590
Mascalucia, IT|37.575|15.050
Marsala, IT|37.799|12.437
Licata, IT|37.103|13.940
Lentini, IT|37.286|14.997
Iglesias, IT|39.309|8.537
Gioia Tauro, IT|38.425|15.898
Giarre, IT|37.724|15.182
Gela, IT|37.074|14.240
Floridia, IT|37.083|15.153
Favara, IT|37.318|13.662
Enna, IT|37.566|14.274
Crotone, IT|39.081|17.128
Cosenza, IT|39.299|16.253
Comiso, IT|36.949|14.607
Catanzaro, IT|38.882|16.601
Catania, IT|37.492|15.070
Castrovillari, IT|39.816|16.202
Castelvetrano, IT|37.681|12.792
Casarano, IT|40.011|18.162
Carini, IT|38.132|13.183
Carbonia, IT|39.165|8.521
Canicatti, IT|37.358|13.848
Caltanissetta, IT|37.490|14.062
Caltagirone, IT|37.238|14.516
Cagliari, IT|39.231|9.119
Bronte, IT|37.789|14.834
Biancavilla, IT|37.644|14.867
Belpasso, IT|37.592|14.980
Barcellona Pozzo di Gotto, IT|38.148|15.215
Bagheria, IT|38.079|13.512
Avola, IT|36.908|15.139
Augusta, IT|37.241|15.221
Assemini, IT|39.291|8.999
Alcamo, IT|37.978|12.965
Agrigento, IT|37.311|13.577
Adrano, IT|37.664|14.833
Acireale, IT|37.609|15.166
Aci Catena, IT|37.606|15.142
Aci Castello, IT|37.556|15.145
Zola Predosa, IT|44.490|11.218
Vomero, IT|40.843|14.231
Voghera, IT|44.992|9.012
Vittorio Veneto, IT|45.980|12.301
Viterbo, IT|42.419|12.106
Vimodrone, IT|45.515|9.288
Vimercate, IT|45.615|9.368
Lancenigo-Villorba, IT|45.713|12.257
Villaricca, IT|40.920|14.193
Villafranca di Verona, IT|45.354|10.845
Vignola, IT|44.484|11.011
Vigevano, IT|45.314|8.854
Vicenza, IT|45.547|11.547
Viareggio, IT|43.867|10.250
Viadana, IT|44.936|10.519
Verona, IT|45.439|10.994
Vercelli, IT|45.322|8.420
Ventimiglia, IT|43.790|7.609
Venice, IT|45.437|12.333
Venaria Reale, IT|45.126|7.631
Velletri, IT|41.686|12.778
Vasto, IT|42.111|14.706
Varese, IT|45.821|8.825
Vanchiglia, IT|45.071|7.704
Valenzano, IT|41.044|16.885
Valenza, IT|45.012|8.644
Valdagno, IT|45.645|11.299
Udine, IT|46.069|13.237
Triggiano, IT|41.065|16.925
Trieste, IT|45.650|13.777
Trezzano sul Naviglio, IT|45.422|9.063
Treviso, IT|45.667|12.242
Treviglio, IT|45.521|9.591
Trentola-Ducenta, IT|40.975|14.175
Trento, IT|46.068|11.121
Trecate, IT|45.434|8.736
Trani, IT|41.277|16.410
Tradate, IT|45.708|8.908
Tortona, IT|44.898|8.864
Torremaggiore, IT|41.689|15.294
Torre del Greco, IT|40.789|14.368
Torre Annunziata, IT|40.753|14.453
Turin, IT|45.070|7.687
Tolentino, IT|43.209|13.285
Todi, IT|42.779|12.412
Tivoli, IT|41.960|12.802
Thiene, IT|45.709|11.480
Terzigno, IT|40.804|14.493
Terracina, IT|41.292|13.244
Terni, IT|42.563|12.643
Termoli, IT|42.000|14.994
Terlizzi, IT|41.129|16.545
Teramo, IT|42.661|13.699
Taranto, IT|40.464|17.247
Suzzara, IT|44.992|10.744
Sulmona, IT|42.049|13.926
Spoleto, IT|42.741|12.739
Sora, IT|41.718|13.614
Sondrio, IT|46.169|9.871
Somma Vesuviana, IT|40.873|14.439
Soccavo, IT|40.846|14.193
Siena, IT|43.318|11.331
Sezze, IT|41.500|13.062
Seveso, IT|45.647|9.143
Settimo Torinese, IT|45.139|7.770
Sestri Levante, IT|44.273|9.397
Sesto San Giovanni, IT|45.533|9.226
Sesto Fiorentino, IT|43.832|11.199
Seriate, IT|45.685|9.725
Seregno, IT|45.650|9.205
Senigallia, IT|43.716|13.209
Senago, IT|45.576|9.126
Segrate, IT|45.492|9.298
Secondigliano, IT|40.900|14.267
Schio, IT|45.713|11.357
Scandicci, IT|43.754|11.188
Scandiano, IT|44.598|10.696
Scafati, IT|40.760|14.537
Savona, IT|44.309|8.477
Savigliano, IT|44.648|7.657
Sava, IT|40.402|17.553
Sassuolo, IT|44.543|10.785
Sassari, IT|40.726|8.556
Sarzana, IT|44.112|9.962
Saronno, IT|45.625|9.035
Sarno, IT|40.807|14.622
San Vito dei Normanni, IT|40.656|17.708
Santeramo in Colle, IT|40.792|16.759
SantAntonio Abate, IT|40.722|14.540
SantAntimo, IT|40.942|14.235
SantAnastasia, IT|40.868|14.402
Santa Maria Capua Vetere, IT|41.082|14.253
San Severo, IT|41.686|15.381
San Sebastiano, IT|45.652|10.257
San Salvo, IT|42.044|14.733
Sanremo, IT|43.817|7.777
Borgo San Paolo, IT|45.060|7.645
San Nicandro Garganico, IT|41.838|15.565
San Miniato, IT|43.680|10.850
San Miniato Basso, IT|43.693|10.841
San Mauro Torinese, IT|45.104|7.768
San Lazzaro, IT|44.471|11.409
San Giuseppe Vesuviano, IT|40.836|14.505
San Giuliano Milanese, IT|45.394|9.291
San Giovanni Valdarno, IT|43.568|11.530
San Giovanni Rotondo, IT|41.706|15.728
San Giovanni Lupatoto, IT|45.382|11.045
San Giovanni in Persiceto, IT|44.638|11.184
San Giovanni a Teduccio, IT|40.838|14.306
San Giorgio a Cremano, IT|40.833|14.342
San Donato Milanese, IT|45.410|9.268
San Dona di Piave, IT|45.630|12.568
San Bonifacio, IT|45.396|11.274
San Benedetto del Tronto, IT|42.957|13.877
Saluzzo, IT|44.647|7.493
Salsomaggiore Terme, IT|44.816|9.986
Salerno, IT|40.675|14.793
Sacile, IT|45.954|12.503
Sabaudia, IT|41.300|13.028
Ruvo di Puglia, IT|41.118|16.484
Rutigliano, IT|41.010|17.006
Rozzano, IT|45.382|9.156
Rovigo, IT|45.070|11.790
Rovereto, IT|45.890|11.041
Rosignano Solvay-Castiglioncello, IT|43.389|10.436
Rosignano Marittimo, IT|43.407|10.472
Roseto degli Abruzzi, IT|42.672|14.015
Romano di Lombardia, IT|45.521|9.754
Rome, IT|41.892|12.511
Rocca di Papa, IT|41.766|12.702
Rivoli, IT|45.071|7.515
Riva del Garda, IT|45.886|10.841
Rimini, IT|44.058|12.565
Rieti, IT|42.405|12.857
Riccione, IT|43.999|12.657
Rho, IT|45.532|9.040
Reggio nellEmilia, IT|44.698|10.631
Ravenna, IT|44.413|12.201
Rapallo, IT|44.350|9.228
Quarto Oggiaro, IT|45.513|9.143
Qualiano, IT|40.919|14.154
Putignano, IT|40.851|17.122
Prato, IT|43.880|11.097
Pozzuoli, IT|40.844|14.095
Potenza, IT|40.642|15.808
Posillipo, IT|40.813|14.200
Porto Torres, IT|40.834|8.405
Porto SantElpidio, IT|43.253|13.760
Porto San Giorgio, IT|43.178|13.794
Portogruaro, IT|45.781|12.841
Civitanova Marche, IT|43.305|13.721
Portici, IT|40.816|14.337
Pordenone, IT|45.957|12.661
Ponticelli, IT|40.854|14.330
Pontedera, IT|43.661|10.631
Pompei, IT|40.746|14.497
Pomigliano dArco, IT|40.910|14.383
Pomezia, IT|41.669|12.501
Poggioreale, IT|40.865|14.289
Poggiomarino, IT|40.801|14.541
Poggibonsi, IT|43.471|11.148
Pistoia, IT|43.931|10.924
Piscinola, IT|40.893|14.234
Pisa, IT|43.709|10.404
Piossasco, IT|44.988|7.460
Piombino, IT|42.926|10.526
Pioltello, IT|45.501|9.331
Pinerolo, IT|44.885|7.331
Pietrasanta, IT|43.960|10.228
Pianura, IT|40.859|14.173
Piacenza, IT|45.052|9.693
Pescara, IT|42.458|14.203
Pesaro, IT|43.909|12.916
Perugia, IT|43.112|12.389
Pavia, IT|45.192|9.159
Parma, IT|44.799|10.326
Parabiago, IT|45.560|8.945
Palo del Colle, IT|41.056|16.703
Palazzolo sullOglio, IT|45.597|9.887
Palagiano, IT|40.578|17.038
Pagani, IT|40.742|14.614
Padua, IT|45.408|11.886
Paderno Dugnano, IT|45.569|9.165
Ottaviano, IT|40.852|14.478
Ostuni, IT|40.729|17.577
Osimo, IT|43.485|13.482
Orta Nova, IT|41.329|15.710
Orbassano, IT|45.005|7.538
Olbia, IT|40.923|9.498
Oderzo, IT|45.781|12.494
Nuoro, IT|40.320|9.326
Novi Ligure, IT|44.762|8.787
Novate Milanese, IT|45.531|9.140
Novara, IT|45.447|8.621
Nova Milanese, IT|45.589|9.198
Nola, IT|40.926|14.528
Noicattaro, IT|41.034|16.990
Noci, IT|40.794|17.127
Nocera Superiore, IT|40.742|14.674
Nocera Inferiore, IT|40.745|14.645
Nichelino, IT|45.000|7.653
Nettuno, IT|41.458|12.664
Nerviano, IT|45.553|8.979
Nardo, IT|40.180|18.032
Naples, IT|40.852|14.268
Mugnano di Napoli, IT|40.909|14.210
Muggio, IT|45.589|9.228
Monza, IT|45.580|9.272
Montichiari, IT|45.413|10.398
Montevarchi, IT|43.525|11.572
Montesilvano, IT|42.511|14.145
Monterotondo, IT|42.052|12.620
Montemurlo, IT|43.927|11.037
Montecchio Maggiore-Alte Ceccato, IT|45.504|11.412
Montecatini-Terme, IT|43.882|10.772
Montebelluna, IT|45.775|12.049
Monselice, IT|45.239|11.750
Monopoli, IT|40.949|17.297
Monfalcone, IT|45.805|13.533
Mondragone, IT|41.114|13.892
Mondovi, IT|44.396|7.818
Moncalieri, IT|44.999|7.682
Molfetta, IT|41.200|16.599
Mola di Bari, IT|41.060|17.090
Mogliano Veneto, IT|45.556|12.243
Modugno, IT|41.084|16.783
Modena, IT|44.648|10.925
Mirano, IT|45.495|12.108
Mirandola, IT|44.885|11.069
Mira Taglio, IT|45.435|12.129
Minturno, IT|41.263|13.746
Nizza Millefonti, IT|45.027|7.665
Milan, IT|45.464|9.190
Miano, IT|40.888|14.253
Mestre, IT|45.492|12.245
Mesagne, IT|40.559|17.808
Merano, IT|46.668|11.160
Mentana, IT|42.035|12.644
Melzo, IT|45.498|9.420
Melito di Napoli, IT|40.919|14.231
Melegnano, IT|45.358|9.324
Meda, IT|45.661|9.153
Matera, IT|40.666|16.605
Massarosa, IT|43.866|10.345
Massafra, IT|40.586|17.116
Massa, IT|44.035|10.139
Martina Franca, IT|40.704|17.338
Marino, IT|41.770|12.659
Marina di Massa, IT|44.004|10.107
Marina di Carrara, IT|44.038|10.041
Marigliano, IT|40.925|14.456
Mariano Comense, IT|45.697|9.182
Marghera, IT|45.451|12.224
Marcianise, IT|41.031|14.299
Marano di Napoli, IT|40.897|14.188
Mantua, IT|45.160|10.798
Manfredonia, IT|41.631|15.919
Manduria, IT|40.399|17.637
Malnate, IT|45.794|8.881
Magenta, IT|45.465|8.885
Maddaloni, IT|41.036|14.382
Macerata, IT|43.298|13.453
Lugo, IT|44.421|11.911
Lucera, IT|41.505|15.339
Lucca, IT|43.844|10.504
Lodi, IT|45.310|9.501
Livorno, IT|43.544|10.326
Lissone, IT|45.612|9.240
Lingotto, IT|45.033|7.650
Limbiate, IT|45.600|9.125
Lido di Ostia, IT|41.732|12.277
Lido, IT|45.410|12.366
Legnano, IT|45.598|8.915
Legnago, IT|45.194|11.302
Lecco, IT|45.856|9.397
Lecce, IT|40.355|18.172
Latina, IT|41.466|12.904
La Spezia, IT|44.103|9.824
LAquila, IT|42.351|13.400
Lanciano, IT|42.227|14.390
Lainate, IT|45.572|9.027
Ladispoli, IT|41.951|12.075
Ivrea, IT|45.467|7.876
Isernia, IT|41.596|14.234
Ischia Porto, IT|40.739|13.951
Ischia, IT|40.738|13.949
Pallanza-Intra-Suna, IT|45.938|8.571
Imperia, IT|43.889|8.039
Imola, IT|44.359|11.713
Jesi, IT|43.521|13.244
Guidonia, IT|41.992|12.719
Grumo Nevano, IT|40.936|14.260
Grugliasco, IT|45.065|7.580
Grottaglie, IT|40.537|17.437
Grottaferrata, IT|41.787|12.671
Grosseto, IT|42.763|11.109
Gravina in Puglia, IT|40.817|16.419
Gragnano, IT|40.689|14.520
Gorizia, IT|45.941|13.622
Gorgonzola, IT|45.531|9.405
Giussano, IT|45.700|9.209
Giulianova, IT|42.754|13.966
Giugliano in Campania, IT|40.928|14.202
Giovinazzo, IT|41.185|16.671
Gioia del Colle, IT|40.800|16.923
Ginosa, IT|40.577|16.757
Ghedi, IT|45.402|10.277
Genzano di Roma, IT|41.707|12.689
Genoa, IT|44.405|8.944
Garbagnate Milanese, IT|45.574|9.075
Gallipoli, IT|40.056|17.991
Galliate, IT|45.479|8.698
Gallarate, IT|45.660|8.792
Galatina, IT|40.174|18.170
Gaeta, IT|41.214|13.571
Fuorigrotta, IT|40.833|14.200
Frosinone, IT|41.640|13.341
Frattaminore, IT|40.956|14.272
Frattamaggiore, IT|40.941|14.276
Frascati, IT|41.809|12.679
Francavilla Fontana, IT|40.531|17.585
Francavilla al Mare, IT|42.422|14.282
Fossano, IT|44.551|7.719
Fornacelle, IT|43.924|11.035
Formigine, IT|44.573|10.847
Formia, IT|41.256|13.609
Forli, IT|44.222|12.041
Forio, IT|40.738|13.860
Fondi, IT|41.358|13.427
Follonica, IT|42.928|10.765
Foligno, IT|42.955|12.703
Foggia, IT|41.458|15.552
Fiumicino, IT|41.771|12.237
Florence, IT|43.779|11.246
Fiorano, IT|44.539|10.812
Fidenza, IT|44.867|10.060
Ferrara, IT|44.838|11.621
Fermo, IT|43.163|13.723
Fasano, IT|40.836|17.360
Fano, IT|43.841|13.017
Falconara Marittima, IT|43.626|13.400
Faenza, IT|44.290|11.879
Fabriano, IT|43.339|12.903
Este, IT|45.223|11.664
Ercolano, IT|40.808|14.350
Erba, IT|45.809|9.226
Empoli, IT|43.718|10.948
Eboli, IT|40.617|15.057
Domodossola, IT|46.117|8.293
Desio, IT|45.618|9.202
Desenzano del Garda, IT|45.471|10.536
Dalmine, IT|45.649|9.606
Cusano, IT|45.552|9.184
Cuneo, IT|44.391|7.548
Cremona, IT|45.133|10.021
Crema, IT|45.363|9.682
Corsico, IT|45.431|9.111
Correggio, IT|44.767|10.783
Cornaredo, IT|45.501|9.027
Cormano, IT|45.549|9.160
Cordenons, IT|45.984|12.700
Corato, IT|41.152|16.411
Copertino, IT|40.268|18.054
Conversano, IT|40.968|17.113
Conegliano, IT|45.888|12.302
Como, IT|45.808|9.083
Cologno Monzese, IT|45.530|9.278
Collegno, IT|45.079|7.567
Colleferro, IT|41.727|13.005
Colle di Val dElsa, IT|43.421|11.127
Civitavecchia, IT|42.093|11.797
Citta di Castello, IT|43.466|12.238
Cisterna di Latina, IT|41.591|12.828
Cirie, IT|45.235|7.601
Cinisello Balsamo, IT|45.558|9.215
Ciampino, IT|41.801|12.602
Chivasso, IT|45.191|7.890
Chioggia, IT|45.219|12.278
Chieti, IT|42.348|14.165
Chieri, IT|45.011|7.821
Chiavari, IT|44.318|9.322
Chiari, IT|45.538|9.927
Cesenatico, IT|44.200|12.399
Cesena, IT|44.139|12.243
Cesano Maderno, IT|45.629|9.152
Cervia, IT|44.262|12.348
Cerveteri, IT|41.991|12.091
Cernusco sul Naviglio, IT|45.525|9.333
Cerignola, IT|41.265|15.896
Cercola, IT|40.860|14.357
Cento, IT|44.731|11.287
Ceglie Messapica, IT|40.646|17.517
Cecina, IT|43.306|10.517
Cava De Tirreni, IT|40.700|14.708
Cattolica, IT|43.962|12.736
Castiglione delle Stiviere, IT|45.390|10.486
Castel Volturno, IT|41.033|13.944
Castel Maggiore, IT|44.577|11.361
Castellammare di Stabia, IT|40.702|14.487
Castelfranco Veneto, IT|45.671|11.928
Castelfranco Emilia, IT|44.594|11.050
Cassino, IT|41.486|13.828
Cassano dAdda, IT|45.526|9.515
Casoria, IT|40.908|14.293
Caserta, IT|41.073|14.332
Cascina, IT|43.676|10.555
Casamassima, IT|40.957|16.921
Casalnuovo di Napoli, IT|40.910|14.342
Casale Monferrato, IT|45.133|8.453
Casalecchio di Reno, IT|44.476|11.275
Casal di Principe, IT|41.010|14.130
Carugate, IT|45.550|9.340
Carrara, IT|44.079|10.098
Carpi, IT|44.782|10.878
Carmagnola, IT|44.850|7.720
Cardito, IT|40.946|14.295
Carbonara di Bari, IT|41.067|16.867
Carate Brianza, IT|45.676|9.237
Capua, IT|41.105|14.213
Capannori, IT|43.842|10.573
Cantu, IT|45.741|9.131
Canosa di Puglia, IT|41.220|16.068
Campobasso, IT|41.559|14.667
Campi Bisenzio, IT|43.825|11.130
Camaiore, IT|43.943|10.298
Caivano, IT|40.958|14.306
Busto Arsizio, IT|45.611|8.849
Bussolengo, IT|45.469|10.854
Brusciano, IT|40.922|14.424
Brugherio, IT|45.553|9.299
Brindisi, IT|40.632|17.936
Bresso, IT|45.538|9.189
Bressanone, IT|46.715|11.656
Brescia, IT|45.536|10.215
Bra, IT|44.698|7.851
Bovisio-Masciago, IT|45.610|9.153
Boscoreale, IT|40.773|14.481
Borgomanero, IT|45.699|8.462
Bolzano, IT|46.491|11.340
Bologna, IT|44.494|11.339
Bollate, IT|45.546|9.121
Bitonto, IT|41.110|16.691
Bisceglie, IT|41.243|16.501
Biella, IT|45.563|8.058
Bergamo, IT|45.696|9.667
Benevento, IT|41.131|14.778
Belluno, IT|46.143|12.216
Battipaglia, IT|40.609|14.982
Bastia umbra, IT|43.064|12.546
Bassano del Grappa, IT|45.767|11.727
Barra, IT|40.843|14.318
Barletta, IT|41.314|16.282
Bari, IT|41.121|16.870
Bareggio, IT|45.479|8.998
Bagnoli, IT|40.813|14.168
Bacoli, IT|40.797|14.073
Avezzano, IT|42.029|13.426
Aversa, IT|40.973|14.207
Avellino, IT|40.915|14.791
Asti, IT|44.902|8.208
Ascoli Piceno, IT|42.854|13.574
Arzignano, IT|45.520|11.334
Arzano, IT|40.910|14.265
Ariccia, IT|41.721|12.672
Arezzo, IT|43.463|11.881
Arese, IT|45.550|9.077
Ardea, IT|41.607|12.542
Arcore, IT|45.627|9.325
Aprilia, IT|41.595|12.654
Aosta, IT|45.738|7.317
Anzio, IT|41.453|12.622
Angri, IT|40.738|14.571
Andria, IT|41.231|16.298
Ancona, IT|43.607|13.510
Altamura, IT|40.827|16.550
Alpignano, IT|45.093|7.524
Alghero, IT|40.560|8.320
Alessandria, IT|44.909|8.610
Albignasego, IT|45.347|11.868
Albenga, IT|44.050|8.218
Albano Laziale, IT|41.727|12.659
Alba, IT|44.700|8.035
Agropoli, IT|40.349|14.991
Afragola, IT|40.923|14.309
Adelfia, IT|41.003|16.872
Acqui Terme, IT|44.676|8.469
Acquaviva delle Fonti, IT|40.897|16.843
Acilia-Castel Fusano-Ostia Antica, IT|41.763|12.331
Acerra, IT|40.945|14.371
Abbiategrasso, IT|45.398|8.917
Abano Terme, IT|45.358|11.787
Spinea-Orgnano, IT|45.491|12.155
Verbania, IT|45.921|8.552
Lumezzane, IT|45.648|10.265
Guidonia Montecelio, IT|41.994|12.722
Lamezia Terme, IT|38.963|16.309
Caronno Pertusella, IT|45.598|9.046
Cassano Magnago, IT|45.672|8.827
San Felice A Cancello, IT|41.017|14.487
San Nicola la Strada, IT|41.052|14.333
Quarto, IT|40.878|14.144
Orta di Atella, IT|40.964|14.269
Casavatore, IT|40.899|14.277
Volla, IT|40.874|14.341
Gravina di Catania, IT|37.561|15.063
Cesano Boscone, IT|45.442|9.094
Tor Lupara, IT|41.998|12.618
Esquilino, IT|41.899|12.514
Torvaianica, IT|41.621|12.462
Quartiere Otto, IT|45.486|9.139
Infernetto, IT|41.735|12.362
Casal Palocco, IT|41.748|12.347
Lavinio, IT|41.504|12.590
Bellaria-Igea Marina, IT|44.143|12.472
Villanova, IT|41.964|12.756
Marina di Ardea-Tor San Lorenzo, IT|41.554|12.541
San Paolo, IT|41.125|16.793
Monterusciello, IT|40.869|14.083
Romano Banco, IT|45.423|9.107
Casa Santa, IT|38.025|12.548
Arpino, IT|40.889|14.320
Paolo VI, IT|40.522|17.274
Corigliano Scalo, IT|39.627|16.514
Eppan, IT|46.459|11.257
Stella, IT|40.860|14.252
San Carlo AllArena, IT|40.865|14.263
Spinaceto, IT|41.779|12.442
Crocetta, IT|45.058|7.666
Santa Rita, IT|45.046|7.645
Mirafiori Sud, IT|45.021|7.623
Cenisia, IT|45.069|7.651
Pozzo Strada, IT|45.068|7.625
San Donato, IT|45.082|7.665
Parella, IT|45.080|7.626
Madonna di Campagna, IT|45.103|7.664
Lucento, IT|45.106|7.656
Barriera di Milano, IT|45.092|7.694
Aurora, IT|45.081|7.687
San Salvario, IT|45.053|7.680
Mirafiori Nord, IT|45.042|7.628
Filadelfia, IT|45.024|7.644
Brera, IT|45.472|9.188
Adriano, IT|45.513|9.249
Chinatown, IT|45.482|9.175
Barriera di Lanzo, IT|45.110|7.651
Porta Palazzo, IT|45.077|7.684
Malafede, IT|41.775|12.377
Campo di Marte, IT|43.777|11.277
Chiaia, IT|40.833|14.227
Chiaiano, IT|40.881|14.208
Vicaria, IT|40.862|14.273
San Ferdinando, IT|40.833|14.248
Pendino, IT|40.847|14.263
Arenella, IT|40.857|14.223
Avvocata, IT|40.854|14.243
Montecalvario, IT|40.844|14.246
Scampia, IT|40.903|14.237
San Pietro a Patierno, IT|40.886|14.290
San Lorenzo, IT|40.857|14.265
Monte Rosello, IT|40.735|8.568
Arcella, IT|45.422|11.888
Casal de Pazzi, IT|41.929|12.566
Giardinetti-Tor Vergata, IT|41.853|12.619
Casal Bertone, IT|41.898|12.534
Vanchiglietta, IT|45.074|7.718
Circoiscrizione I, IT|45.066|7.687
Circoiscrizione II, IT|45.050|7.641
Circoiscrizione III, IT|45.063|7.631
Circoiscrizione IV, IT|45.081|7.632
Circoiscrizione V, IT|45.101|7.655
Circoiscrizione VI, IT|45.102|7.700
Circoiscrizione VII, IT|45.078|7.697
Circoiscrizione VIII, IT|45.038|7.672
Polo Nord, IT|45.055|7.649
Centro, IT|45.071|7.684
Chieti Scalo, IT|42.359|14.139
Saint Helier, JE|49.188|-2.105
Spanish Town, JM|17.991|-76.957
Savanna-la-Mar, JM|18.219|-78.133
Portmore, JM|17.971|-76.887
Old Harbour, JM|17.941|-77.109
Ocho Rios, JM|18.408|-77.103
New Kingston, JM|18.007|-76.783
Montego Bay, JM|18.471|-77.919
May Pen, JM|17.965|-77.245
Mandeville, JM|18.042|-77.507
Linstead, JM|18.137|-77.032
Kingston, JM|17.997|-76.794
Half Way Tree, JM|18.012|-76.799
Barrett Town, JM|18.515|-77.802
Wadi as Sir, JO|31.954|35.818
Umm as Summaq, JO|31.885|35.854
Sahab, JO|31.870|36.005
Mahis, JO|31.986|35.770
Madaba, JO|31.716|35.794
Maan, JO|30.196|35.734
Kurayyimah, JO|32.276|35.599
Khuraybat as Suq, JO|31.879|35.921
Hayy Khilda, JO|31.992|35.840
Judita, JO|32.408|35.708
Jarash, JO|32.281|35.899
`Izra, JO|31.159|35.693
Irbid, JO|32.556|35.850
Zarqa, JO|32.073|36.088
Aydun, JO|32.505|35.858
At Tafilah, JO|30.838|35.604
As Salt, JO|32.039|35.727
Safi, JO|31.036|35.465
Ar Ramtha, JO|32.559|36.008
`Anjarah, JO|32.307|35.754
Amman, JO|31.955|35.945
Hayy al Quwaysimah, JO|31.910|35.950
Mafraq, JO|32.343|36.208
Qir Moav, JO|31.182|35.700
Al Jubayhah, JO|32.011|35.898
Al Fuhays, JO|32.005|35.781
Aqaba, JO|29.527|35.008
Ajlun, JO|32.333|35.753
Karak City, JO|31.164|35.762
Russeifa, JO|32.018|36.046
Az Zulayl, JO|32.121|36.280
Rukban, JO|33.314|38.703
Suwaylih, JO|32.022|35.844
Marj Al Hamam, JO|31.903|35.846
Shingu, JP|33.733|135.983
Atsugi, JP|35.443|139.369
Akashi, JP|34.655|135.007
Zushi, JP|35.295|139.578
Zentsujicho, JP|34.227|133.778
Zama, JP|35.488|139.391
Gero, JP|35.800|137.233
Yukuhashi, JP|33.729|130.983
Yuki, JP|36.300|139.883
Yugawara, JP|35.150|139.067
Yotsutsuji, JP|35.533|135.100
Yoshikawa, JP|35.892|139.842
Yoshii, JP|36.250|138.983
Yoshida-kasugacho, JP|37.683|138.883
Yorii, JP|36.116|139.194
Yono, JP|35.883|139.633
Yonago, JP|35.433|133.333
Yonabaru, JP|26.204|127.753
Yokota, JP|35.750|139.383
Yokosuka, JP|35.284|139.667
Yokohama, JP|35.433|139.650
Yokkaichi, JP|34.967|136.617
Yokkaichi, JP|33.535|131.328
Youkaichi, JP|35.116|136.198
Yawata, JP|34.870|135.703
Honmachi, JP|32.504|130.600
Yatsuomachi-higashikumisaka, JP|36.567|137.133
Yasugicho, JP|35.421|133.242
Yashiro, JP|34.917|134.967
Yashio, JP|35.823|139.839
Yao, JP|34.617|135.600
Yanai, JP|33.967|132.117
Yanagawa, JP|33.167|130.400
Yamato-Takada, JP|34.517|135.750
Yamashita, JP|33.566|133.703
Yamazakicho-nakabirose, JP|35.000|134.550
Yamaguchi, JP|34.183|131.467
Yamaga, JP|33.017|130.689
Tosayamadacho-nakano, JP|33.600|133.683
Yaizu, JP|34.869|138.320
Yaita, JP|36.800|139.933
Yae, JP|34.683|132.533
Yabu, JP|35.403|134.771
Yabase, JP|35.500|133.683
Wakimachi, JP|34.067|134.150
Wajima, JP|37.405|136.899
Wadayama, JP|35.317|134.867
Uwa, JP|33.365|132.513
Utsunomiya, JP|36.567|139.883
Uto, JP|32.683|130.667
Utazu, JP|34.300|133.817
Usuki, JP|33.123|131.804
Ushibukamachi, JP|32.201|130.022
Ushitsu, JP|37.308|137.152
Ureshinomachi-shimojuku, JP|33.114|130.003
Urayasu, JP|35.659|139.901
Uozu, JP|36.800|137.400
Umi, JP|33.568|130.510
Umeki, JP|31.667|130.383
Ujiie, JP|36.683|139.967
Uji, JP|34.890|135.803
Uenohara, JP|35.617|139.117
Ueno-ebisumachi, JP|34.759|136.131
Uekimachi-mono, JP|32.900|130.689
Ueda, JP|36.403|138.282
Ube, JP|33.943|131.251
Tsuyama, JP|35.052|133.999
Tsushima, JP|35.167|136.717
Tsurusaki, JP|33.245|131.692
Tsuruoka, JP|38.722|139.822
Tsurugi-asahimachi, JP|36.450|136.633
Tsuruga, JP|35.653|136.063
Tsuruda, JP|31.950|130.483
Tsuma, JP|32.100|131.400
Tsukumiura, JP|33.075|131.869
Minakami, JP|36.688|138.986
Tsukawaki, JP|33.277|131.156
Tsuiki, JP|33.673|131.038
Tsuha, JP|26.658|128.094
Tsubata, JP|36.670|136.740
Tsubame, JP|37.664|138.925
Tsu, JP|34.733|136.517
Toyota, JP|35.083|137.150
Toyosu, JP|35.651|139.792
Toyoshina, JP|36.300|137.901
Toyooka, JP|35.540|134.820
Toyonaka, JP|34.782|135.469
Toyokawa, JP|34.817|137.400
Toyohashi, JP|34.767|137.383
Toyohama, JP|34.709|136.934
Toyoda, JP|35.017|136.667
Toyama, JP|36.700|137.217
Tottori-shi, JP|35.500|134.233
Tosu, JP|33.367|130.517
Tondabayashicho, JP|34.501|135.602
Tomioka, JP|36.254|138.898
Tomigusuku, JP|26.186|127.682
Tokyo, JP|35.690|139.692
Tokuyama, JP|34.050|131.817
Tokushima, JP|34.067|134.567
Tokorozawa, JP|35.799|139.469
Tokoname, JP|34.883|136.850
Toki, JP|35.350|137.183
Tokamachi, JP|37.133|138.767
Togitsu, JP|32.833|129.850
Tochio-honcho, JP|37.476|138.995
Tochigi, JP|36.383|139.733
Toba, JP|34.483|136.842
Tenri, JP|34.583|135.833
Tenno, JP|39.900|139.967
Tawaramoto, JP|34.554|135.793
Tatsuno, JP|35.984|137.997
Tatsunocho-tominaga, JP|34.864|134.552
Tateyama, JP|34.983|139.867
Tatebayashi, JP|36.250|139.533
Tarumizu, JP|31.483|130.700
Tarui, JP|35.367|136.533
Tanushimarumachi-toyoki, JP|33.350|130.683
Tanuma, JP|36.367|139.583
Nishi-Tokyo-shi, JP|35.725|139.538
Tanashicho, JP|35.729|139.538
Tanabe, JP|34.822|135.766
Tanabe, JP|33.733|135.367
Tamaru, JP|34.483|136.633
Tamano, JP|34.517|133.946
Tamana, JP|32.947|130.574
Tamamura, JP|36.300|139.117
Takinomiya, JP|34.246|133.923
Taketoyo, JP|34.850|136.917
Takeo, JP|33.190|130.021
Takehara, JP|34.338|132.917
Takefu, JP|35.904|136.167
Takedamachi, JP|32.967|131.400
Takayama, JP|36.133|137.250
Takatsuki, JP|34.848|135.617
Takasaki, JP|36.333|139.017
Takarazuka, JP|34.799|135.357
Takaoka, JP|36.750|137.017
Takanawa, JP|35.632|139.734
Takanabe, JP|32.133|131.500
Takamatsu, JP|34.333|134.050
Takaishi, JP|34.517|135.433
Takahashi, JP|34.783|133.617
Takahama, JP|34.917|136.983
Takada, JP|35.300|136.567
Bungo-Takada-shi, JP|33.557|131.445
Takabo, JP|34.128|134.534
Tajimi, JP|35.317|137.133
Tahara, JP|34.668|137.267
Tagawa, JP|33.633|130.800
Tadotsu, JP|34.275|133.750
Tadaoka-higashi, JP|34.487|135.399
Tachiarai, JP|33.400|130.617
Suzuka, JP|34.883|136.583
Suzaka, JP|36.650|138.317
Suwa, JP|36.038|138.113
Susaki, JP|33.395|133.291
Sumoto, JP|34.343|134.889
Sumiyoshi, JP|34.750|138.250
Sumida, JP|35.733|139.821
Sukumo, JP|32.933|132.733
Suita, JP|34.761|135.516
Suibara, JP|37.846|139.230
Sugito, JP|36.031|139.726
Sueyoshicho-ninokata, JP|31.650|131.017
Soka, JP|35.836|139.800
Soja, JP|34.675|133.751
Sobue, JP|35.250|136.717
Shuzenji, JP|34.970|138.922
Shobu, JP|36.067|139.600
Shobara, JP|34.850|133.017
Shizuoka, JP|34.983|138.383
Shirone, JP|37.764|139.022
Shiraoka, JP|36.018|139.660
Shirahamacho-usazakiminami, JP|34.783|134.717
Shirahama, JP|33.683|135.350
Shiozawa, JP|37.038|138.849
Shiojiri, JP|36.100|137.967
Shinshiro, JP|34.900|137.500
Shinichi, JP|34.555|133.273
Shingu, JP|33.714|130.431
Shinagawa, JP|33.636|133.006
Shimo-tsuma, JP|36.183|139.967
Shimosuwa, JP|36.071|138.082
Shimonoseki, JP|33.955|130.937
Shimodate, JP|36.300|139.983
Shimoda, JP|34.677|138.945
Shimoda, JP|32.946|132.986
Shimobuchi, JP|34.386|135.787
Minato, JP|34.215|135.150
Nishishinminato, JP|36.780|137.076
Shimada, JP|34.817|138.183
Shimabara, JP|32.783|130.367
Shima, JP|34.333|136.833
Shiki, JP|35.833|139.583
Shido, JP|34.323|134.173
Shibushi, JP|31.476|131.101
Shibukawa, JP|36.483|139.000
Shibata, JP|37.950|139.333
Settsu, JP|34.778|135.595
Seto, JP|35.233|137.100
Setakamachi-takayanagi, JP|33.149|130.465
Sendai, JP|31.817|130.300
Sekimachi, JP|35.483|136.917
Sayo, JP|35.003|134.359
Satte, JP|36.073|139.726
Sashiki, JP|32.302|130.504
Sasebo, JP|33.168|129.725
Sasayama, JP|35.067|135.217
Sasaguri, JP|33.616|130.551
Sano, JP|36.317|139.583
Sanjo, JP|37.617|138.950
Sandacho, JP|34.884|135.227
Sakurai, JP|34.500|135.850
Saku, JP|36.217|138.483
Sakata, JP|38.917|139.855
Sakaki, JP|36.467|138.183
Sakaiminato, JP|35.538|133.231
Sakaidecho, JP|34.323|133.836
Sakai-nakajima, JP|36.267|139.250
Sakai, JP|36.100|139.800
Sakai, JP|34.582|135.467
Sakado, JP|35.957|139.389
Saiku, JP|34.533|136.633
Saiki, JP|32.950|131.900
Sagara, JP|34.685|138.205
Saga, JP|33.233|130.300
Sabae, JP|35.946|136.185
Ryuo, JP|35.650|138.500
Ryotsu-minato, JP|38.078|138.439
Ozu, JP|32.880|130.872
Oyama, JP|36.300|139.800
Oyama, JP|35.357|138.998
Oyama, JP|34.604|138.217
Owase, JP|34.067|136.200
Otsuki, JP|35.619|138.974
Otsu, JP|35.000|135.867
Otake, JP|34.208|132.221
Ota, JP|36.300|139.367
Oshima, JP|36.987|136.772
Osaka, JP|34.694|135.501
Onomichi, JP|34.417|133.200
Onoda, JP|34.001|131.184
Ono, JP|35.981|136.487
Ono, JP|34.850|134.933
Ono-hara, JP|34.283|132.267
Omuta, JP|33.033|130.450
Omura, JP|32.921|129.954
Ome, JP|35.784|139.243
Omamacho-omama, JP|36.432|139.275
Omachi, JP|36.500|137.867
Okuchi-shinohara, JP|32.068|130.624
Okubo-naka, JP|34.404|135.341
Okegawa, JP|36.000|139.557
Okazaki, JP|34.950|137.167
Okayama, JP|34.650|133.933
Okaya, JP|36.057|138.045
Okawa, JP|33.206|130.375
Ojiya, JP|37.300|138.800
Oji, JP|35.757|139.737
Oita, JP|33.233|131.600
Oiso, JP|35.316|139.316
Oi, JP|35.851|139.520
Ogori-shimogo, JP|34.100|131.400
Ogikubo, JP|35.698|139.624
Ogawamachi, JP|36.053|139.266
Ogawa, JP|34.967|136.967
Ogaki, JP|35.350|136.617
Odawara, JP|35.256|139.160
Odacho-oda, JP|35.190|132.508
Obu, JP|35.018|136.949
Obita, JP|32.817|129.883
Obama, JP|35.496|135.746
Nyuzen, JP|36.937|137.501
Numazu, JP|35.100|138.867
Numata, JP|36.633|139.050
Higashinozoe, JP|34.718|134.882
Nonoichi, JP|36.533|136.617
Nogata, JP|33.741|130.723
Noda, JP|35.949|139.868
Oyanomachi-noboritate, JP|32.596|130.434
Nobeoka, JP|32.583|131.667
Nishiwaki, JP|34.984|134.974
Nishitawara, JP|34.956|134.768
Nishio, JP|34.867|137.050
Nishinoomote, JP|30.733|131.000
Nishinomiya, JP|34.716|135.332
Nishinippori, JP|35.733|139.770
Nishihara, JP|26.254|127.744
Nishiarai, JP|35.785|139.779
Nirasaki, JP|35.700|138.450
Ninomiya, JP|35.301|139.256
Nikko, JP|36.750|139.617
Niitsu-honcho, JP|37.800|139.122
Niimi, JP|34.983|133.467
Niihama, JP|33.960|133.305
Niigata, JP|37.923|139.041
Nichinan, JP|31.600|131.367
Naze, JP|28.367|129.483
Narutocho-mitsuishi, JP|34.199|134.609
Nara-shi, JP|34.685|135.805
Nanao, JP|37.048|136.968
Namerikawa, JP|36.760|137.362
Nakatsugawa, JP|35.483|137.500
Nakatsu, JP|33.598|131.188
Nakanojo, JP|36.587|138.841
Nakano, JP|36.750|138.367
Nakamura, JP|32.983|132.933
Nakama, JP|33.817|130.710
Naha, JP|26.213|127.679
Nagoya, JP|35.181|136.906
Nago, JP|26.615|127.985
Nagasu, JP|32.933|130.443
Nagasaki, JP|32.750|129.883
Nagareyama, JP|35.856|139.903
Nagaoka, JP|37.450|138.850
Nagano, JP|36.650|138.183
Nagahama, JP|35.383|136.267
Nabari, JP|34.617|136.083
Musashino, JP|35.706|139.559
Muroto-misakicho, JP|33.287|134.168
Muramatsu, JP|37.693|139.171
Murakami, JP|38.233|139.483
Muko, JP|34.965|135.704
Mukai-awagasaki, JP|36.632|136.637
Muikamachi, JP|37.067|138.883
Morowa, JP|35.100|137.067
Morohongo, JP|35.936|139.304
Moriyama, JP|35.067|135.983
Moriguchi, JP|34.733|135.567
Mori, JP|34.833|137.933
Mizunami, JP|35.367|137.250
Miyoshi, JP|34.800|132.850
Miyazu, JP|35.536|135.199
Miyazaki, JP|31.917|131.417
Miyakonojo, JP|31.733|131.067
Miyata, JP|33.708|130.653
Mitsuke, JP|37.533|138.933
Mitsukaido, JP|36.017|139.983
Mitake, JP|35.417|137.133
Mishima, JP|35.117|138.917
Minoh, JP|34.827|135.471
Mino, JP|35.533|136.917
Minamirinkan, JP|35.495|139.443
Minami-aoyama, JP|35.665|139.715
Minamata, JP|32.217|130.400
Minakuchicho-matoba, JP|34.967|136.167
Mikuriya, JP|35.512|133.497
Mikuni, JP|36.215|136.148
Miki, JP|34.800|134.983
Mihara, JP|34.400|133.083
Mifune, JP|32.717|130.822
Mie, JP|32.967|131.583
Mibu, JP|36.417|139.800
Menuma, JP|36.222|139.382
Matsuzaki, JP|35.467|133.900
Matsuto, JP|36.517|136.567
Matsumoto, JP|36.233|137.967
Matsue, JP|35.483|133.050
Matsudo, JP|35.780|139.901
Matsubase, JP|32.650|130.667
Matsubara, JP|34.567|135.550
Masuda, JP|34.667|131.850
Maruoka, JP|36.153|136.270
Kamimaruko, JP|36.319|138.273
Marugame, JP|34.283|133.783
Makurazaki, JP|31.267|130.317
Maki, JP|37.750|138.883
Maizuru, JP|35.450|135.333
Maibara, JP|35.317|136.283
Maebashi, JP|36.400|139.083
Maebaru-chuo, JP|33.559|130.201
Machida, JP|35.540|139.451
Kyoto, JP|35.021|135.754
Kushimoto, JP|33.468|135.779
Kushikino, JP|31.717|130.267
Kusatsu, JP|35.017|135.967
Kurume, JP|33.317|130.517
Kurono, JP|35.467|136.633
Kuroda, JP|35.350|136.783
Kurihashi, JP|36.133|139.700
Kurihama, JP|35.228|139.702
Kure, JP|34.232|132.567
Kurayoshi, JP|35.433|133.817
Kurashiki, JP|34.583|133.767
Kumamoto, JP|32.806|130.692
Kumagaya, JP|36.135|139.390
Kukichuo, JP|36.067|139.675
Kudamatsu, JP|34.010|131.866
Kozan, JP|34.583|133.050
Kozakai-cho, JP|34.800|137.359
Kotari, JP|34.921|135.705
Koshigaya, JP|35.890|139.789
Konosu, JP|36.069|139.517
Konan, JP|35.332|136.870
Komoro, JP|36.317|138.433
Komono, JP|35.000|136.517
Komatsushimacho, JP|34.000|134.583
Komatsu, JP|36.403|136.451
Komaki, JP|35.283|136.917
Komagome, JP|35.739|139.741
Kokubunji, JP|35.702|139.476
Kokubu-matsuki, JP|31.733|130.767
Koge, JP|35.410|134.255
Koga, JP|36.183|139.717
Koga, JP|33.733|130.467
Kofu, JP|35.667|138.567
Kodamacho-kodamaminami, JP|36.185|139.132
Kochi, JP|33.550|133.533
Kobe, JP|34.691|135.183
Kobayashi, JP|31.983|130.983
Kiyosu, JP|35.217|136.833
Kitsuki, JP|33.420|131.618
Kitakyushu, JP|33.852|130.850
Kitakata, JP|37.650|139.867
Kitahama, JP|35.167|135.917
Kitagata, JP|35.433|136.683
Kishiwada, JP|34.467|135.367
Kishaba, JP|26.303|127.794
Kisarazu, JP|35.383|139.933
Kisai, JP|36.100|139.583
Kiryu, JP|36.400|139.333
Kinoshita, JP|35.901|137.988
Kikuchi, JP|32.983|130.817
Kazo, JP|36.117|139.600
Kawasaki, JP|35.521|139.717
Kawasaki, JP|33.600|130.815
Kawanishi, JP|34.817|135.417
Kawaminami, JP|32.183|131.517
Kawaguchi, JP|35.805|139.711
Kawagoe, JP|35.909|139.485
Katsuyama, JP|36.062|136.501
Kasumi, JP|35.633|134.633
Kasukabe, JP|35.983|139.750
Kasugai, JP|35.248|136.972
Kashiwazaki, JP|37.367|138.550
Kashiwara, JP|34.450|135.767
Kashiwa, JP|35.862|139.977
Kashima, JP|33.106|130.091
Kashihara-shi, JP|34.509|135.793
Kashihara, JP|34.583|135.617
Kaseda-shirakame, JP|31.417|130.317
Kasaoka, JP|34.506|133.504
Kasamatsucho, JP|35.367|136.767
Karuizawa, JP|36.350|138.633
Kariya, JP|34.983|136.983
Karatsu, JP|33.443|129.970
Kanzakimachi-kanzaki, JP|33.309|130.374
Kanuma, JP|36.550|139.733
Kanoya, JP|31.383|130.850
Kanonjicho, JP|34.128|133.646
Kannabecho-yahiro, JP|34.558|133.418
Kanie, JP|35.133|136.800
Kanekomachi, JP|36.411|138.996
Kanegusuku, JP|26.197|127.726
Kanda, JP|33.783|130.983
Kanazawa, JP|36.600|136.617
Kanaya, JP|34.820|138.128
Kanamachi, JP|35.765|139.867
Kamojimacho-jogejima, JP|34.068|134.350
Kamogatacho-kamogata, JP|34.537|133.590
Kamo, JP|37.664|139.035
Kamirenjaku, JP|35.694|139.555
Kaminokawa, JP|36.433|139.917
Kamikoizumi, JP|36.264|139.429
Kamiichi, JP|36.700|137.367
Kamigori, JP|34.875|134.362
Kameyama, JP|34.850|136.450
Kameoka, JP|35.000|135.583
Kameda-honcho, JP|37.872|139.110
Kamata, JP|35.563|139.721
Kamakura, JP|35.311|139.547
Kakogawacho-honmachi, JP|34.769|134.829
Kakegawa, JP|34.767|138.017
Kakamigahara, JP|35.417|136.867
Kajiya, JP|35.067|134.917
Kashima-shi, JP|35.965|140.645
Kajiki, JP|31.733|130.667
Kaizuka, JP|34.450|135.350
Kaitaichi, JP|34.367|132.533
Kainan, JP|34.152|135.214
Kagoshima, JP|31.567|130.550
Kadoma, JP|34.738|135.574
Kadogawa, JP|32.471|131.655
Izumo, JP|35.367|132.767
Izumisano, JP|34.417|135.317
Izumiotsu, JP|34.500|135.400
Izumi, JP|34.483|135.433
Izumi, JP|32.083|130.367
Iwatsuki, JP|35.965|139.696
Iwata, JP|34.700|137.850
Iwakura, JP|35.283|136.867
Iwakuni, JP|34.163|132.220
Iwai, JP|36.050|139.900
Iwai, JP|35.750|139.233
Iwade, JP|34.250|135.317
Itsukaichi, JP|35.725|139.218
Itoman, JP|26.126|127.669
Itoigawa, JP|37.033|137.850
Ito, JP|34.967|139.083
Itami, JP|34.784|135.401
Itabashi, JP|35.749|139.715
Isogo, JP|35.408|139.619
Ishiki, JP|34.800|137.017
Ishikawa, JP|26.423|127.821
Ishii, JP|34.068|134.442
Ishige, JP|36.117|139.967
Ishigami, JP|36.250|139.150
Ishigaki, JP|24.345|124.157
Isesaki, JP|36.317|139.200
Isehara, JP|35.399|139.310
Ise, JP|34.483|136.700
Isawa, JP|35.650|138.633
Isahaya, JP|32.841|130.043
Inuyama, JP|35.380|136.943
Ino, JP|33.550|133.433
Innoshima, JP|34.283|133.183
Inazawa, JP|35.250|136.783
Ina, JP|35.828|137.954
Imaricho-ko, JP|33.274|129.879
Imaichi, JP|36.717|139.683
Ikoma, JP|34.683|135.700
Ikeno, JP|35.433|136.583
Ikeda, JP|34.822|135.430
Ikedacho, JP|34.028|133.806
Ikaruga, JP|34.835|134.578
Ijuin, JP|31.617|130.400
Iizuka, JP|33.637|130.687
Iiyama, JP|36.850|138.367
Iida, JP|35.520|137.821
Igusa, JP|35.967|139.467
Ichinomiya, JP|35.300|136.800
Ibusuki, JP|31.233|130.650
Ibi, JP|35.483|136.567
Ibaraki, JP|34.816|135.568
Ibara, JP|34.600|133.467
Hotaka, JP|36.340|137.883
Hoshakuji, JP|36.633|139.983
Horyuji, JP|34.612|135.738
Honjo, JP|36.238|139.190
Honjo, JP|31.983|131.333
Hondomachi-hondo, JP|32.460|130.167
Hofu, JP|34.050|131.567
Hitoyoshi, JP|32.217|130.750
Hitoto, JP|36.986|136.903
Hita, JP|33.321|130.941
Hisai-motomachi, JP|34.667|136.467
Hiroshima, JP|34.400|132.450
Hiratsuka, JP|35.328|139.337
Hiratacho, JP|35.433|132.817
Hirara, JP|24.804|125.302
Hirakata, JP|34.814|135.649
Hirado, JP|33.369|129.552
Hino, JP|35.673|139.400
Hino, JP|35.000|136.250
Himimachi, JP|36.856|136.988
Himeji, JP|34.817|134.700
Hikone, JP|35.250|136.250
Hiji, JP|33.371|131.530
Higashiosaka, JP|34.667|135.583
Okubo, JP|35.703|139.704
Hekinan, JP|34.883|136.983
Hayashino, JP|35.000|134.150
Hayama, JP|35.277|139.577
Hatsukaichi, JP|34.350|132.333
Hatogaya-honcho, JP|35.833|139.743
Hashimoto, JP|34.317|135.617
Hanyu, JP|36.167|139.533
Hanno, JP|35.852|139.318
Handa, JP|34.883|136.933
Hamanoichi, JP|31.717|130.733
Hamamatsu, JP|34.700|137.733
Hamakita, JP|34.800|137.783
Hamada, JP|34.883|132.083
Hakui, JP|36.883|136.783
Hakonegasaki, JP|35.769|139.351
Haibara-akanedai, JP|34.533|135.950
Hagi, JP|34.400|131.417
Katsuren-haebaru, JP|26.333|127.874
Hadano, JP|35.371|139.224
Hachioji, JP|35.656|139.324
Omihachiman, JP|35.129|136.098
Gyoda, JP|36.141|139.460
Gushikawa, JP|26.359|127.867
Gotsucho, JP|35.009|132.226
Gotemba, JP|35.319|138.943
Higashigotanda, JP|35.625|139.728
Gosen, JP|37.733|139.167
Gose, JP|34.450|135.733
Gojo, JP|34.350|135.700
Gohyakkoku, JP|36.664|137.317
Godo, JP|35.417|136.600
Gobo, JP|33.882|135.170
Gion, JP|34.433|132.467
Ginowan, JP|26.263|127.761
Gifu, JP|35.423|136.760
Gamagori, JP|34.833|137.233
Futtsu, JP|35.311|139.819
Furukawa, JP|36.233|137.183
Honcho, JP|35.701|139.986
Fukuyama, JP|34.483|133.367
Fukuroi, JP|34.750|137.917
Fukura, JP|34.258|134.715
Fukuoka, JP|33.600|130.417
Fukumitsu, JP|36.558|136.869
Nishifukuma, JP|33.766|130.475
Fukui-shi, JP|36.064|136.223
Fukuecho, JP|32.697|128.846
Fukuchiyama, JP|35.300|135.117
Fukiage-fujimi, JP|36.100|139.450
Fukayacho, JP|36.200|139.283
Toyo, JP|35.670|139.815
Fujisawa, JP|35.349|139.477
Fujioka, JP|36.250|139.650
Fujioka, JP|36.246|139.072
Fujinomiya, JP|35.217|138.617
Fujieda, JP|34.867|138.267
Fuji, JP|35.167|138.683
Fuchucho, JP|34.574|133.235
Enzan, JP|35.700|138.733
Echigawa, JP|35.167|136.200
Denenchofu, JP|35.595|139.665
Daito, JP|34.714|135.620
Chofu, JP|35.659|139.548
Chiryu, JP|35.000|137.033
Chino, JP|35.994|138.154
Chikushino-shi, JP|33.496|130.516
Chigasaki, JP|35.336|139.404
Chichibu, JP|35.990|139.076
Chatan, JP|26.309|127.770
Beppu, JP|33.279|131.498
Bange, JP|37.564|139.822
Ayabe, JP|35.300|135.250
Awara, JP|36.223|136.192
Atami, JP|35.088|139.053
Asso, JP|33.700|135.417
Ashiya, JP|34.728|135.303
Ashikaga, JP|36.333|139.450
Asakusa, JP|35.717|139.796
Asagaya-minami, JP|35.702|139.637
Arita, JP|33.183|129.900
Arai, JP|37.001|138.226
Arai, JP|34.683|137.567
Aoto, JP|35.750|139.854
Annaka, JP|36.330|138.896
Anjo, JP|34.958|137.081
Anan, JP|33.917|134.650
Anamizu, JP|37.233|136.900
Amagi, JP|33.418|130.654
Amagasaki, JP|34.717|135.417
Akune, JP|32.017|130.200
Kariya, JP|34.751|134.387
Aki, JP|33.500|133.900
Akasaka, JP|35.671|139.734
Akaike, JP|33.692|130.765
Aioi, JP|34.804|134.468
Aihara, JP|35.600|139.317
Ageo, JP|35.971|139.614
Okinawa, JP|26.336|127.801
Kushima, JP|31.486|131.242
Kamigoto, JP|32.983|129.083
Hikari, JP|33.955|131.950
Nagato, JP|34.383|131.200
Hasuda, JP|35.971|139.649
Kamifukuoka, JP|35.873|139.514
Sayama, JP|35.853|139.412
Fussa, JP|35.737|139.324
Minawa, JP|35.523|139.319
Nihammatsu, JP|35.373|139.392
Kamioi, JP|35.320|139.158
Asaka, JP|35.805|139.602
Wako, JP|35.789|139.623
Shimotoda, JP|35.815|139.685
Kimitsu, JP|35.350|139.870
Miura, JP|35.140|139.619
Wakayama, JP|34.233|135.167
Iyo, JP|33.751|132.701
Uwajima, JP|33.224|132.560
Saijo, JP|33.917|133.183
Ozu, JP|33.500|132.550
Matsuyama, JP|33.839|132.766
Masaki-cho, JP|33.788|132.711
Kawanoecho, JP|34.017|133.578
Imabari, JP|34.070|133.000
Hojo, JP|33.977|132.778
Mishohirajo, JP|32.964|132.566
Haramachi, JP|33.770|132.790
Yuzawa, JP|39.167|140.500
Yotsukaido, JP|35.650|140.167
Yoshioka, JP|38.441|140.876
Yonezawa, JP|37.910|140.117
Yokote, JP|39.317|140.550
Yokoshiba, JP|35.650|140.483
Yokaichiba, JP|35.700|140.550
Yanagawamachi-saiwaicho, JP|37.850|140.600
Yamoto, JP|38.427|141.215
Yamagata, JP|38.233|140.367
Yamada, JP|39.467|141.950
Yachimata, JP|35.650|140.317
Yachi, JP|38.422|140.308
Yabuki, JP|37.200|140.317
Watari, JP|38.035|140.851
Wakuya, JP|38.545|141.135
Ushiku, JP|35.967|140.133
Tsukuba, JP|36.083|140.117
Toride, JP|35.900|140.083
Tono, JP|39.317|141.533
Tomobe, JP|36.350|140.300
Tomiya, JP|38.393|140.886
Togane, JP|35.550|140.367
Tendo, JP|38.354|140.370
Takahata, JP|38.002|140.191
Takahagi, JP|36.717|140.717
Tagajo-shi, JP|38.300|141.000
Sukagawa, JP|37.283|140.383
Shobudahama, JP|38.284|141.062
Shizukuishi, JP|39.694|140.984
Shisui, JP|35.717|140.267
Shiroishi, JP|38.003|140.618
Shiroi, JP|35.800|140.067
Shiogama, JP|38.317|141.033
Shinjo, JP|38.759|140.301
Sendai, JP|38.267|140.867
Sawara, JP|35.883|140.500
Sakura, JP|35.717|140.233
Sagae, JP|38.373|140.273
Ryugasaki, JP|35.900|140.183
Ryogoku, JP|35.717|140.367
Rokugo, JP|39.417|140.550
Rifu, JP|38.331|140.977
Otawara, JP|36.867|140.033
Omiya, JP|36.550|140.417
Omigawa, JP|35.850|140.617
Omagari, JP|39.450|140.483
Okunoya, JP|36.283|140.417
Okawara, JP|38.050|140.734
Ohara, JP|35.248|140.393
Ogawa, JP|36.750|140.133
Ofunato, JP|39.072|141.717
Obanazawa, JP|38.603|140.402
Oarai, JP|36.314|140.584
Oami, JP|35.517|140.317
Nihommatsu, JP|37.583|140.433
Natori-shi, JP|38.167|140.883
Naruto, JP|35.600|140.417
Narita, JP|35.783|140.317
Namie, JP|37.483|141.000
Naka-niida, JP|38.569|140.854
Naka, JP|36.050|140.167
Nagai, JP|38.104|140.035
Murata, JP|38.119|140.724
Motomiya, JP|37.514|140.401
Moriya, JP|35.933|140.000
Morioka, JP|39.700|141.150
Mooka, JP|36.433|140.017
Mobara, JP|35.426|140.296
Mizusawa, JP|39.133|141.133
Miyako, JP|39.647|141.941
Mito, JP|36.350|140.450
Miharu, JP|37.433|140.483
Matsushima, JP|38.374|141.061
Mashiko, JP|36.467|140.100
Makuhari, JP|35.650|140.050
Makabe, JP|36.267|140.100
Kuroiso, JP|36.967|140.050
Kumakura, JP|37.153|140.168
Koriyama, JP|37.400|140.383
Kogota-ekimae, JP|38.533|141.067
Kogota, JP|38.550|141.050
Kitakami, JP|39.283|141.117
Kitaibaraki, JP|36.787|140.749
Kesennuma, JP|38.901|141.577
Kamogawa, JP|35.097|140.100
Katsuura, JP|35.146|140.315
Katsuta, JP|36.383|140.533
Katori-shi, JP|35.898|140.499
Kasama, JP|36.383|140.267
Karasuyama, JP|36.650|140.150
Kanegasaki, JP|39.200|141.117
Kaminoyama, JP|38.154|140.274
Kamaishi, JP|39.277|141.868
Kakuda, JP|37.975|140.772
Iwase, JP|36.350|140.100
Iwanuma, JP|38.105|140.859
Iwaki, JP|37.050|140.883
Itako, JP|35.933|140.550
Ishitsuka, JP|36.483|140.383
Ishioka, JP|36.183|140.267
Ishinomaki, JP|38.417|141.300
Ishikawa, JP|37.150|140.450
Inada, JP|36.433|140.517
Ichinoseki, JP|38.917|141.133
Ichihara, JP|35.517|140.083
Hokota, JP|36.150|140.517
Hobaramachi, JP|37.817|140.550
Hizume, JP|39.550|141.167
Hitachi, JP|36.600|140.650
Higashine, JP|38.439|140.401
Hasaki, JP|35.733|140.833
Hanamaki, JP|39.383|141.117
Furukawa, JP|38.572|140.956
Funehikimachi-funehiki, JP|37.447|140.577
Funaishikawa, JP|36.467|140.567
Fukushima, JP|37.750|140.467
Fukawa, JP|35.850|140.150
Fujishiro, JP|35.917|140.117
Edosaki, JP|35.950|140.317
Date, JP|37.817|140.500
Daigo, JP|36.767|140.350
Choshi, JP|35.733|140.833
Chiba, JP|35.600|140.117
Asahi, JP|35.717|140.650
Ami, JP|36.033|140.200
Akita, JP|39.717|140.117
Ajiki, JP|35.833|140.233
Abiko, JP|35.867|140.017
Motomachi, JP|43.826|144.096
Yakumo, JP|42.254|140.269
Wakkanai, JP|45.409|141.674
Tomakomai, JP|42.637|141.603
Tobetsu, JP|43.217|141.517
Mutsu, JP|41.289|141.217
Takikawa, JP|43.553|141.906
Takanosu, JP|40.223|140.366
Sunagawa, JP|43.486|141.906
Shizunai-furukawacho, JP|42.334|142.367
Shiraoi, JP|42.550|141.350
Shimo-furano, JP|43.350|142.383
Minamishibetsucho, JP|44.154|142.373
Shibetsu, JP|43.659|145.132
Sarubetsu, JP|42.872|143.338
Sapporo, JP|43.067|141.350
Rumoi, JP|43.934|141.643
Otofuke, JP|42.992|143.200
Otaru, JP|43.189|141.002
Ono, JP|40.285|141.629
Odate, JP|40.272|140.558
Obihiro, JP|42.917|143.204
Noshiro, JP|40.208|140.027
Noboribetsu, JP|42.452|141.179
Nemuro, JP|43.324|145.575
Nayoro, JP|44.351|142.458
Honcho, JP|41.894|140.694
Namioka, JP|40.711|140.590
Nakashibetsu, JP|43.548|144.972
Muroran, JP|42.317|140.988
Moritake, JP|40.097|140.077
Mombetsu, JP|44.352|143.352
Misawa, JP|40.687|141.390
Yoichi, JP|43.204|140.770
Memuro-minami, JP|42.907|143.036
Makubetsu, JP|45.371|141.821
Kutchan, JP|42.901|140.741
Kushiro, JP|42.975|144.375
Kuroishi, JP|40.646|140.584
Kuji, JP|40.188|141.769
Shimokizukuri, JP|40.816|140.375
Kitami, JP|43.803|143.891
Kamiiso, JP|41.820|140.645
Iwamizawa, JP|43.200|141.760
Ishikari, JP|43.240|141.354
Hitokawame, JP|40.636|141.445
Kitahiroshima, JP|42.976|141.567
Hirosaki, JP|40.593|140.472
Hanawa, JP|40.184|140.787
Hakodate, JP|41.776|140.737
Hachinohe, JP|40.500|141.500
Furano, JP|43.350|142.383
Fukagawa, JP|43.708|142.039
Engaru, JP|44.048|143.545
Ebetsu, JP|43.108|141.551
Date, JP|42.468|140.868
Chitose, JP|42.819|141.652
Bibai, JP|43.325|141.859
Ashibetsu, JP|43.510|142.186
Asahikawa, JP|43.771|142.365
Aomori, JP|40.817|140.733
Abashiri, JP|44.021|144.270
Goshogawara, JP|40.804|140.441
Aso, JP|32.937|131.080
Kachidoki, JP|35.658|139.775
Nanto-shi, JP|36.569|136.912
Kawage, JP|34.804|136.546
Neyagawa, JP|34.766|135.628
Owariasahi, JP|35.208|137.030
Hitachi-Naka, JP|36.397|140.535
Chikusei, JP|36.316|139.982
Kasumigaura, JP|36.153|140.246
Tsuchiura, JP|36.090|140.210
Tsukubamirai, JP|35.984|140.009
Omitama, JP|36.254|140.380
Hitachiomiya, JP|36.564|140.403
Kamisu, JP|35.897|140.667
Namegata, JP|36.007|140.496
Sakuragawa, JP|36.251|140.116
Bando, JP|36.070|139.867
Hitachi-ota, JP|36.551|140.528
Inashiki, JP|35.956|140.324
Shintomi, JP|32.063|131.487
Azumino, JP|36.288|137.887
Chikuma, JP|36.527|138.089
Murayama, JP|38.470|140.414
Minamiashigara, JP|35.319|139.110
Ritto, JP|35.027|136.000
Takashima, JP|35.413|136.016
Koka, JP|34.980|136.158
Katsuragi, JP|34.486|135.697
Kashiba, JP|34.535|135.709
Ouda-yamaguchi, JP|34.459|135.954
Nanto, JP|36.513|136.894
Oyabe, JP|36.667|136.850
Imizu, JP|36.768|137.126
Kurobe-shi, JP|36.901|137.450
Ebina, JP|35.381|139.397
Tama, JP|35.644|139.468
Musashimurayama, JP|35.742|139.426
Akishima, JP|35.721|139.380
Higashiyamato, JP|35.763|139.446
Misato, Saitama, JP|35.844|139.883
Niiza, JP|35.821|139.558
Tonami, JP|36.620|136.943
Kahoku, JP|36.758|136.712
Kaga, JP|36.300|136.333
Nomimachi, JP|36.410|136.485
Matsuura, JP|33.341|129.695
Onojo, JP|33.536|130.479
Kasuga, JP|33.526|130.461
Aizu-Wakamatsu, JP|37.491|139.945
Minami-Soma, JP|37.629|140.979
Urasoe, JP|26.259|127.730
Uruma, JP|26.376|127.859
Joso, JP|36.036|139.961
Midori, JP|36.445|139.284
Miyakojima, JP|24.790|125.311
Fujimino, JP|35.902|139.525
Hidaka, JP|35.917|139.362
Higashi-Matsuyama, JP|36.033|139.417
Iruma, JP|35.818|139.368
Kitamoto, JP|36.033|139.538
Tsurugashima, JP|35.960|139.403
Sosa, JP|35.715|140.553
Sanmu, JP|35.628|140.418
Soma, JP|37.793|140.929
Tamura, JP|37.431|140.603
Kinokawa, JP|34.270|135.410
Kumano, JP|33.904|136.122
Inabe, JP|35.113|136.572
Nasushiobara, JP|36.977|140.066
Shimotsuke, JP|36.413|139.866
Nasukarasuyama, JP|36.652|140.161
Tomi, JP|36.356|138.361
Komagane, JP|35.717|137.937
Inzai, JP|35.835|140.164
Isumi, JP|35.230|140.405
Yachiyo, JP|35.735|140.124
Oshu, JP|39.139|141.168
Rikuzen-Takata, JP|39.020|141.654
Hachimantai, JP|39.900|141.130
Ninohe, JP|40.291|141.313
Osaki, JP|38.589|140.973
Higashimatsushima, JP|38.409|141.179
Kurihara, JP|38.750|141.000
Izunokuni, JP|35.039|138.951
Izu, JP|34.972|138.946
Kikugawa, JP|34.703|138.120
Kosai, JP|34.701|137.523
Susono, JP|35.174|138.907
Omaezaki, JP|34.599|138.219
Nikaho, JP|39.271|139.939
Daisen, JP|39.441|140.490
Oga, JP|39.871|139.849
Yurihonjo, JP|39.389|140.058
Katagami, JP|39.879|139.998
Kita-Akita, JP|40.200|140.394
Tsugaru, JP|40.804|140.403
Hirakawa, JP|40.587|140.571
Towada, JP|40.620|141.211
Kitanagoya, JP|35.247|136.878
Nisshin, JP|35.137|137.052
Toyoake, JP|35.038|136.999
Chita, JP|35.003|136.864
Aisai, JP|35.163|136.732
Yamagata, JP|35.476|136.772
Hashima, JP|35.329|136.681
Kaizu, JP|35.202|136.635
Kani, JP|35.404|137.056
Minokamo, JP|35.482|137.022
Motosu, JP|35.484|136.674
Gujo, JP|35.737|136.959
Ena, JP|35.447|137.383
Nanjo, JP|26.144|127.767
Nakagusuku, JP|26.250|127.783
Yaese, JP|26.127|127.743
Joetsu, JP|37.148|138.236
Minamiuonuma, JP|37.083|138.874
Myoko, JP|37.025|138.256
Sado, JP|38.025|138.359
Tainai, JP|38.065|139.406
Uonuma, JP|37.245|138.962
Fujiidera, JP|34.568|135.597
Habikino, JP|34.553|135.591
Hannan, JP|34.333|135.250
Kawachi-Nagano, JP|34.441|135.583
Sayama, JP|34.517|135.563
Sennan, JP|34.348|135.268
Shijonawate, JP|34.733|135.683
Hokuto, JP|41.816|140.635
Saitama, JP|35.908|139.657
Higashimurayama, JP|35.755|139.469
Fujikawaguchiko, JP|35.489|138.688
Yawatahama, JP|33.457|132.433
Kirishima, JP|31.741|130.763
Amami, JP|28.377|129.494
Arashiyama, JP|35.015|135.678
Dazaifu, JP|33.513|130.524
Amakusa, JP|32.459|130.193
Aizu-misato Machi, JP|37.409|139.813
Ikebukuro, JP|35.737|139.707
Kamigyo-ku, JP|35.030|135.757
Buzen, JP|33.612|131.130
Miyako, JP|33.699|130.920
Hakuromachi, JP|40.524|141.306
Toyota, JP|40.748|141.249
Katsushika, JP|35.733|139.850
Kita, JP|35.753|139.733
Ota, JP|35.561|139.716
Nanaku, JP|40.401|141.273
Shinden, JP|36.000|139.625
Washinomiya, JP|36.099|139.660
Sashiogi, JP|35.914|139.580
Nukui, JP|35.740|139.631
Sakai, JP|35.706|139.544
Oizumi-gakuencho, JP|35.765|139.589
Oizumimachi, JP|35.765|139.602
Hikarigaoka, JP|35.757|139.627
Sakuradai, JP|35.744|139.661
Sekimachi-minami, JP|35.721|139.581
Akatsuka, JP|35.777|139.644
Narimasu, JP|35.784|139.632
Takashimadaira, JP|35.786|139.661
Hasune, JP|35.783|139.676
Ukima, JP|35.791|139.698
Toshima, JP|35.761|139.745
Nagasaki, JP|35.730|139.689
Sugamo, JP|35.735|139.733
Yotsuya, JP|35.690|139.716
Saginomiya, JP|35.724|139.637
Sasazuka, JP|35.676|139.667
Kamiigusa, JP|35.723|139.606
Shimoigusa, JP|35.721|139.622
Eifuku, JP|35.675|139.640
Wakabayashi, JP|35.646|139.659
Yoga, JP|35.625|139.639
Nakanobu, JP|35.605|139.710
Ebara, JP|35.613|139.703
Ikegami, JP|35.577|139.705
Noborito, JP|35.622|139.561
Aobadai, JP|35.547|139.517
Mochibaru, JP|31.755|131.130
Maruobara, JP|34.739|138.143
Nakano, JP|35.704|139.669
Yamaguma, JP|33.421|130.614
Owa, JP|36.199|139.495
Ogura, JP|36.457|138.995
Yamata, JP|36.082|139.372
Ogushi, JP|36.022|139.466
Yakami, JP|34.139|134.502
Hiragi, JP|34.271|134.131
Yono, JP|34.922|135.495
Kano, JP|34.493|135.639
Kimokawa, JP|34.880|135.367
Itogawa, JP|34.026|135.253
Hikiso, JP|34.544|135.738
Kanmaki, JP|34.564|135.706
Takatsukadai, JP|34.583|135.726
Tatsuno-kita, JP|34.597|135.693
Fuki, JP|34.630|135.696
Sugai, JP|34.755|135.797
Sayama, JP|34.875|135.750
Iijima, JP|36.090|136.360
Katanawa, JP|33.521|130.424
Higashigo, JP|33.191|130.138
Ishinari, JP|33.362|130.405
Nakatsukuma, JP|33.324|130.442
Sonobe, JP|33.424|130.499
Sue, JP|33.591|130.504
Wakasugi, JP|33.609|130.526
Minamichita, JP|34.676|137.005
Yurigaoka, JP|33.847|130.630
Koga, JP|33.864|130.687
Miyaodai, JP|33.847|130.713
Inokura, JP|33.801|130.684
Kami, JP|33.529|130.765
Kanaishima, JP|35.344|139.117
Fujiyoshida, JP|35.440|138.796
Shonai, JP|38.848|139.903
Tsushima, JP|34.206|129.291
Nakatogari, JP|35.135|138.903
Fushimi, JP|35.114|138.897
Kamizawa, JP|35.102|138.954
Nasu, JP|37.042|140.094
Yomitan, JP|26.402|127.745
Azamino, JP|35.570|139.545
Minami-oi, JP|35.593|139.734
Togoshi, JP|35.611|139.717
Shimoochiai, JP|35.720|139.702
Otsuka, JP|35.724|139.729
Igusa, JP|35.727|139.618
Asagayakita, JP|35.711|139.637
Yoyogi, JP|35.679|139.691
Ebisu, JP|35.646|139.715
Inokashira, JP|35.693|139.583
Funabori, JP|35.682|139.866
Ichinoe, JP|35.691|139.883
Hirai, JP|35.708|139.843
Horikiri, JP|35.746|139.827
Minaminagareyama, JP|35.840|139.899
Ojima, JP|35.689|139.833
Arakawa, JP|35.738|139.780
Machiya, JP|35.748|139.781
Sendagi, JP|35.728|139.760
Matsubushi, JP|35.919|139.811
Toneri, JP|35.811|139.771
Ogi, JP|35.767|139.771
Takenotsuka, JP|35.794|139.796
Aoi, JP|35.774|139.817
Adachi, JP|35.763|139.808
Kamiya, JP|35.770|139.731
Miyoshidai, JP|35.833|139.544
Sugita, JP|35.376|139.617
Edogawe, JP|35.692|139.873
Eniwa, JP|42.894|141.576
Shimada, JP|32.757|130.790
Okino, JP|32.870|130.792
Minami-Alps, JP|35.616|138.463
Koto, JP|32.779|130.745
Arao, JP|32.979|130.446
Miyota, JP|36.337|138.513
Ukiha, JP|33.356|130.750
Iga, JP|34.758|136.135
Kuwana, JP|35.052|136.670
Matsusaka, JP|34.579|136.537
Hokuto, JP|35.835|138.396
Himi, JP|36.847|136.984
Takizawa, JP|39.803|141.135
Toon, JP|33.794|132.890
Yasu, JP|35.101|136.018
Yame, JP|33.228|130.649
Yamatokoriyama, JP|34.607|135.770
Yamato, JP|35.473|139.451
Yamanashi, JP|35.672|138.698
Taku, JP|33.277|130.109
Takasago, JP|34.763|134.792
Tachikawa, JP|35.709|139.419
Saito, JP|32.082|131.400
Sagamihara, JP|35.567|139.242
Ogori, JP|33.387|130.549
Ogi, JP|33.280|130.195
Nagakute, JP|35.173|137.057
Munakata, JP|33.796|130.559
Mitoyo, JP|34.211|133.675
Kunitachi, JP|35.683|139.438
Kizugawa, JP|34.737|135.840
Katano, JP|34.793|135.686
Hyuga, JP|32.423|131.641
Sakai, JP|36.147|136.194
Higashihiroshima, JP|34.409|132.737
Higashikurume, JP|35.752|139.512
Hamura, JP|35.762|139.320
Fuchu, JP|35.675|139.482
Chikugo, JP|33.205|130.492
Ayase, JP|35.435|139.426
Arida, JP|34.081|135.119
Aira, JP|31.774|130.592
Ama, JP|35.183|136.800
Kodaira, JP|35.726|139.485
Nanyo, JP|38.043|140.113
Kato, JP|34.924|135.026
Mine, JP|34.187|131.216
Hida, JP|36.245|137.173
Kiyose, JP|35.780|139.530
Joyo, JP|34.844|135.806
Yatomi, JP|35.105|136.734
Tome, JP|38.709|141.156
Kamagaya, JP|35.770|140.002
Ebino, JP|32.048|130.844
Isa, JP|32.067|130.612
Bizen, JP|34.787|134.235
Etajima, JP|34.239|132.480
Tatsuno, JP|34.832|134.543
Iki, JP|33.783|129.721
Tosa, JP|33.505|133.445
Tsuru, JP|35.547|138.910
Nankoku, JP|33.569|133.649
Aki-takata, JP|34.674|132.682
Awa, JP|34.092|134.285
Kai, JP|35.685|138.510
Sakura, JP|36.721|139.988
Awaji, JP|34.478|134.931
Warabi, JP|35.822|139.685
Miyoshi, JP|35.090|137.090
Itoshima, JP|33.542|130.184
Yufu, JP|33.196|131.378
Akiruno, JP|35.729|139.232
Shikokuchuo, JP|33.975|133.549
Narashino, JP|35.682|140.042
Minamiboso, JP|35.031|139.927
Oamishirasato, JP|35.512|140.353
Sodegaura, JP|35.414|140.021
Echizen, JP|35.886|136.171
Miyama, JP|33.121|130.500
Miyawaka, JP|33.717|130.641
Shirakawa, JP|37.120|140.262
Mizuho, JP|35.394|136.669
Shibetsu, JP|44.171|142.395
Kasai, JP|34.926|134.845
Minamiawaji, JP|34.274|134.775
Shiso, JP|34.981|134.564
Tanba, JP|35.160|135.039
Tokai, JP|35.023|136.909
Higashikagawa, JP|34.210|134.337
Minamikyushu, JP|31.347|130.456
Minamisatsuma, JP|31.390|130.283
Soo, JP|31.646|130.991
Koshi, JP|32.893|130.776
Uki, JP|32.622|130.662
Kyotanabe, JP|34.804|135.767
Kyotango, JP|35.606|135.044
Nantan, JP|35.110|135.492
Goto, JP|32.684|128.807
Minamishimabara, JP|32.673|130.267
Saikai, JP|32.984|129.681
Unzen, JP|32.771|130.248
Akaiwa, JP|34.810|134.022
Maniwa, JP|35.106|133.720
Setouchi, JP|34.659|134.142
Konan, JP|34.999|136.097
Mima, JP|34.055|134.140
Yoshinogawa, JP|34.039|134.292
Inagi, JP|35.633|139.500
Koganei, JP|35.700|139.511
Komae, JP|35.634|139.575
Sanyoonoda, JP|34.032|131.160
Shunan, JP|34.081|131.826
Chuo, JP|35.595|138.503
Fuefuki, JP|35.635|138.639
Koshu, JP|35.724|138.771
Unnan, JP|35.243|132.900
Kunisaki, JP|33.555|131.728
Ichikikushikino, JP|31.729|130.293
Asakuchi, JP|34.535|133.603
Fukutsu, JP|33.783|130.491
Asakura, JP|33.414|130.719
Semboku, JP|39.709|140.747
Chiyoda, JP|35.684|139.751
Tokai, JP|36.474|140.564
Nogi, JP|36.228|139.734
Haruta, JP|35.142|136.812
Agui, JP|34.935|136.913
Kaminoma, JP|34.808|136.864
Minase, JP|34.877|135.665
Oyamazaki, JP|34.894|135.685
Oji, JP|34.599|135.702
Nakaiburi, JP|34.303|135.533
Shioiri, JP|34.156|133.851
Uchiko, JP|33.550|132.647
Setagaya, JP|35.642|139.647
Shinjuku, JP|35.691|139.709
Akihabara, JP|35.698|139.773
Taito, JP|35.707|139.779
Meguro, JP|35.632|139.702
Bunkyo, JP|35.533|139.422
Shibuya, JP|35.659|139.707
Miyashiro, JP|36.022|139.730
Shime, JP|33.587|130.487
Suginami, JP|36.201|140.284
Ichikawa, JP|35.734|139.906
Agano, JP|37.836|139.223
Ranzan, JP|36.055|139.315
Toyoyama, JP|35.250|136.912
Oguchi, JP|35.341|136.911
Fuso, JP|35.358|136.910
Kota, JP|34.875|137.171
Oharu, JP|35.175|136.820
Hirokawa, JP|33.243|130.552
Ginan, JP|35.388|136.785
Kumano, JP|34.333|132.570
Fuchu, JP|34.388|132.510
Inami, JP|34.748|134.913
Tamba-Sasayama, JP|35.073|135.218
Tamba, JP|35.175|135.031
Yachiyo, JP|36.182|139.891
Yahaba, JP|39.611|141.147
Toin, JP|35.095|136.601
Minamiminowa, JP|35.873|137.975
Showa, JP|35.628|138.535
Minamiarupusu, JP|35.609|138.465
Akitsu, JP|35.774|139.491
Chuo, JP|35.670|139.775
Minato City, JP|35.658|139.751
Wote, KE|-1.781|37.629
Webuye, KE|0.600|34.771
Watamu, KE|-3.353|40.021
Wanguru, KE|-0.684|37.357
Wajir, KE|1.747|40.057
Voi, KE|-3.396|38.556
Ukunda, KE|-4.293|39.564
Thika, KE|-1.033|37.069
Tetu, KE|-0.434|36.917
Taveta, KE|-3.399|37.683
Ruiru, KE|-1.147|36.961
Rongo, KE|-0.757|34.598
Rongai, KE|-0.173|35.863
Ramu, KE|3.931|41.223
Pumwani, KE|-1.283|36.847
Oyugis, KE|-0.510|34.731
Ogembo, KE|-0.801|34.726
Nyeri, KE|-0.420|36.948
Nyamira, KE|-0.563|34.936
Nyahururu, KE|0.038|36.363
Njoro, KE|-0.330|35.944
Ngong, KE|-1.353|36.670
Narok, KE|-1.081|35.871
Nanyuki, KE|0.006|37.074
Nakuru, KE|-0.307|36.072
Naivasha, KE|-0.714|36.433
Nairobi, KE|-1.283|36.817
Mwingi, KE|-0.936|38.060
Mwala, KE|-1.353|37.455
Muranga, KE|-0.721|37.153
Mumias, KE|0.335|34.488
Muhoroni, KE|-0.158|35.196
Moyale, KE|3.527|39.056
Mombasa, KE|-4.055|39.664
Molo, KE|-0.248|35.732
Migori, KE|-1.063|34.473
Meru, KE|0.046|37.656
Mbale, KE|0.082|34.721
Mazeras, KE|-3.964|39.550
Maua, KE|0.233|37.941
Matuga, KE|-4.168|39.571
Masalani, KE|-1.694|40.170
Marsabit, KE|2.335|37.991
Mariakani, KE|-3.863|39.475
Maralal, KE|1.097|36.698
Mandera, KE|3.937|41.857
Malindi, KE|-3.218|40.117
Malaba, KE|0.635|34.282
Makutano, KE|1.259|35.096
Makueni Boma, KE|-1.804|37.624
Makindu, KE|-2.278|37.819
Machakos, KE|-1.522|37.265
Lugulu, KE|0.393|34.304
Lodwar, KE|3.120|35.596
Limuru, KE|-1.114|36.642
Ongata Rongai, KE|-1.395|36.764
Lamu, KE|-2.272|40.902
Kitui, KE|-1.367|38.011
Kitale, KE|1.016|35.006
Kisumu, KE|-0.102|34.762
Kisii, KE|-0.682|34.767
Kiserian, KE|-1.427|36.687
Kinoi, KE|-1.656|37.375
Kihancha, KE|-1.193|34.620
Kiminini, KE|0.893|34.925
Kimilili, KE|0.788|34.716
Kilifi, KE|-3.630|39.850
Kikuyu, KE|-1.246|36.663
Kiambu, KE|-1.171|36.836
Khwisero, KE|0.171|34.595
Kerugoya, KE|-0.499|37.280
Kericho, KE|-0.368|35.283
Karuri, KE|-1.176|36.756
Karuri, KE|-0.700|37.183
Karatina, KE|-0.484|37.127
Kapsabet, KE|0.204|35.105
Kapenguria, KE|1.239|35.112
Kakuma, KE|3.714|34.857
Kakamega, KE|0.284|34.752
Kajiado, KE|-1.852|36.777
Kabarnet, KE|0.492|35.743
Jomvu, KE|-3.986|39.608
Iten, KE|0.670|35.508
Isiolo, KE|0.355|37.582
Isebania, KE|-1.225|34.464
Homa Bay, KE|-0.527|34.457
Hola, KE|-1.483|40.033
Mois Bridge, KE|0.872|35.122
Habaswein, KE|1.017|39.491
Githunguri, KE|-1.058|36.776
Gilgil, KE|-0.504|36.318
Upper Gilgil, KE|-0.212|36.272
Garissa, KE|-0.453|39.646
Garba Tula, KE|0.534|38.519
Embu, KE|-0.540|37.457
Emali, KE|-2.080|37.472
El Wak, KE|2.809|40.929
Eldoret, KE|0.520|35.270
Eldama Ravine, KE|0.052|35.727
Elburgon, KE|-0.300|35.809
Chuka, KE|-0.333|37.646
Busia, KE|0.460|34.112
Bungoma, KE|0.564|34.561
Bondo, KE|-0.096|34.273
Awendo, KE|-0.907|34.529
Athi River, KE|-1.456|36.978
Siaya, KE|0.061|34.288
Takaba, KE|3.355|40.223
Ol Kalou, KE|-0.271|36.379
Kitengela, KE|-1.476|36.961
Juja, KE|-1.101|37.013
Langata, KE|-1.367|36.733
Imara Daima Estate, KE|-1.323|36.880
Mlolongo, KE|-1.396|36.940
Lafey, KE|3.151|41.186
Mtwapa, KE|-3.939|39.749
Awendo, KE|-0.500|34.400
Maai Mahiu, KE|-0.989|36.585
Mairo Inya, KE|0.025|36.409
Kenol, KE|-0.937|37.123
Githunguri, KE|-1.300|36.990
Mai, KE|-0.982|36.586
Thomas Magena home, KE|-0.770|34.751
Suluktu, KG|39.937|69.568
Razzakov, KG|39.839|69.528
Balykchy, KG|42.460|76.187
Kojomkul, KG|42.874|74.441
Tokmok, KG|42.842|75.301
Tash-Kumyr, KG|41.346|72.217
Talas, KG|42.523|72.242
Suzak, KG|40.898|72.905
Kyzyl-Suu, KG|42.342|78.006
Uzgen, KG|40.770|73.301
Osh, KG|40.528|72.799
Naryn, KG|41.428|75.996
Massy, KG|41.060|72.633
Lebedinovka, KG|42.885|74.678
Kyzyl-Kyya, KG|40.257|72.128
Kochkor-Ata, KG|41.037|72.483
Kara Suu, KG|40.705|72.867
Karakol, KG|42.490|78.392
Kara-Kul, KG|41.628|72.670
Kara-Balta, KG|42.814|73.848
Kant, KG|42.891|74.851
Manas, KG|40.945|72.993
Ivanovka, KG|42.888|75.085
Iradan, KG|40.267|72.100
Nookat, KG|40.266|72.618
Bishkek, KG|42.870|74.590
Belovodskoye, KG|42.829|74.108
Bazar-Korgon, KG|41.038|72.746
Batken, KG|40.060|70.819
Ala-Buka, KG|41.410|71.486
Toktogul, KG|41.874|72.942
Kara-Kulja, KG|40.632|73.592
Phnom Penh, KH|11.562|104.916
Ta Khmau, KH|11.483|104.950
Takeo, KH|10.991|104.785
Svay Rieng, KH|11.088|105.799
Suong, KH|11.912|105.658
Stung Treng, KH|13.526|105.968
Snuol, KH|12.072|106.421
Sisophon, KH|13.586|102.974
Siem Reap, KH|13.362|103.861
Prey Veng, KH|11.487|105.325
Pursat, KH|12.539|103.919
Phumi Youl Toung, KH|11.282|104.738
Yeang, KH|13.550|103.609
Phumi Veal Tonsay, KH|11.696|104.581
Phumi Veal Sre, KH|10.981|104.778
Phumi Tnaot, KH|12.947|104.569
Samraong, KH|14.182|103.518
Preaek Prasab, KH|12.354|106.036
Kandoeng, KH|11.292|104.841
Bavet, KH|11.063|106.136
Phum Anlung Vil, KH|13.083|103.235
Phumi Ampil Leu, KH|12.009|105.434
Tbeng Meanchey, KH|13.807|104.980
Paoy Paet, KH|13.658|102.564
Pailin, KH|12.849|102.609
Memot, KH|11.829|106.182
Lumphat, KH|13.491|106.980
Kep, KH|10.483|104.317
Koh Kong, KH|11.615|102.984
Kratie, KH|12.488|106.019
Dar, KH|11.789|106.093
Dangkao, KH|11.509|104.891
Kampot, KH|10.610|104.181
Kampong Thom, KH|12.711|104.889
Kampong Speu, KH|11.453|104.521
Sihanoukville, KH|10.609|103.530
Kampong Chhnang, KH|12.250|104.667
Kampong Cham, KH|11.993|105.463
Banlung, KH|13.739|106.987
Battambang, KH|13.103|103.198
Anlong Veaeng, KH|14.232|104.081
Angk Tasaom, KH|11.013|104.673
Smach Mean Chey, KH|11.547|103.036
Ou Bei Choan, KH|13.774|102.737
Chrang Chamreh Muoy, KH|11.630|104.885
Boeng Kak Pir, KH|11.573|104.890
Tarawa, KI|1.328|172.977
Moutsamoudou, KM|-12.167|44.399
Moroni, KM|-11.702|43.255
Fomboni, KM|-12.288|43.743
Basseterre, KN|17.296|-62.725
Yonan-up, KP|37.909|126.161
Wonsan, KP|39.153|127.444
Unchon-up, KP|38.566|125.427
Ullyul, KP|38.514|125.190
Tongchon-up, KP|38.954|127.892
Tokchon, KP|39.753|126.258
Taetan-up, KP|38.088|125.298
Sungho 1-tong, KP|38.991|125.978
Sunchon, KP|39.432|125.933
Sunan, KP|39.203|125.693
Songnim-ni, KP|38.763|125.641
Songhwa, KP|38.360|125.137
Sinwon-up, KP|38.235|125.762
Sil-li, KP|39.495|125.474
Sinmak, KP|38.417|126.233
Sinchon-up, KP|38.353|125.484
Sinanju, KP|39.598|125.610
Sariwon-si, KP|38.507|125.756
Samho-rodongjagu, KP|39.947|127.871
Samchon, KP|38.359|125.326
Pyongyang, KP|39.034|125.754
Pyongsong, KP|39.246|125.872
Pongchon-up, KP|38.124|126.205
Paechon-up, KP|37.993|126.301
Ongjin, KP|37.935|125.362
Nampo, KP|38.737|125.408
Mangyongdae-ri, KP|38.992|125.659
Kwail-up, KP|38.446|125.019
Kusong-si, KP|39.980|125.253
Kujang-up, KP|39.867|126.030
Kowon-up, KP|39.438|127.243
Kosan, KP|38.856|127.418
Kangson, KP|38.936|125.581
Kangnyong, KP|37.907|125.510
Kangdong-up, KP|39.142|126.096
Kaesong, KP|37.971|126.554
Kaechon, KP|39.701|125.893
Hwangju-up, KP|38.670|125.776
Hungnam, KP|39.842|127.632
Hukkyo-ri, KP|38.799|125.792
Hoeyang, KP|38.710|127.598
Hamhung, KP|39.918|127.536
Haeju, KP|38.041|125.715
Chunghwa, KP|38.864|125.800
Chongju-si, KP|39.693|125.214
Chongdan-up, KP|37.970|125.938
Changyon, KP|38.251|125.096
Chaeryong-up, KP|38.399|125.616
Chaeryong-ni, KP|38.736|125.231
Ayang-ni, KP|38.247|125.795
Anju, KP|39.618|125.665
Anbyon-up, KP|39.042|127.524
Anak, KP|38.511|125.494
Chosal-li, KP|39.403|125.509
Paekak, KP|39.463|125.606
Yuktae-dong, KP|40.025|128.160
Yonsa-up, KP|41.908|129.011
Undok, KP|42.519|130.335
Uiju, KP|40.199|124.532
Songwon, KP|40.377|125.879
Sonbong, KP|42.351|130.383
Sinuiju, KP|40.101|124.398
Sinpo, KP|40.040|128.194
Sijung, KP|41.079|126.375
Samjiyon-up, KP|41.804|128.319
Sakchu-up, KP|40.389|125.047
Puryong-up, KP|42.062|129.705
Yonggwang-up, KP|40.018|127.455
Orang, KP|41.448|129.656
Onsong, KP|42.957|129.993
Ranam, KP|41.714|129.684
Namyang-nodongjagu, KP|42.954|129.857
Namyang, KP|42.950|129.856
Rajin, KP|42.256|130.283
Songwon-up, KP|40.373|126.308
Hwasong, KP|41.256|129.493
Myongchon, KP|41.071|129.429
Musan-up, KP|42.226|129.208
Manpo, KP|41.155|126.289
Kyongsong, KP|41.588|129.606
Kopung, KP|40.604|125.947
Kilju, KP|40.964|129.328
Kapsan-up, KP|41.090|128.293
Kanggye, KP|40.969|126.585
Iwon-up, KP|40.323|128.655
Hyesan-dong, KP|41.395|128.187
Hyesan, KP|41.402|128.178
Hwadae, KP|40.838|129.497
Hongwon, KP|40.025|127.956
Hoeryong, KP|42.441|129.746
Chunggang, KP|41.777|126.874
Chongjin, KP|41.796|129.776
Changam-chon, KP|40.606|128.782
Aoji-ri, KP|42.522|130.396
Myonggan-dong, KP|41.137|129.495
Yochim-dong, KP|40.362|126.659
Unggi, KP|42.342|130.411
Heunghae, KR|36.109|129.345
Yeonil, KR|36.004|129.319
Neietsu, KR|37.184|128.468
Yeongju, KR|36.822|128.631
Yeonggwang, KR|35.278|126.512
Yeongdong, KR|36.175|127.776
Eisen, KR|35.968|128.931
Yeoju, KR|37.296|127.634
Yesan, KR|36.678|126.843
Yecheon, KR|36.657|128.455
Yangsan, KR|35.342|129.034
Yangpyong, KR|37.490|127.491
Yangju, KR|37.833|127.062
Yanggu, KR|38.106|127.989
Wonju, KR|37.351|127.945
Tallang-dong, KR|33.490|126.475
Wanju, KR|35.845|127.148
Waegwan, KR|35.993|128.398
Ulsan, KR|35.537|129.317
Uijeongbu-si, KR|37.742|127.047
Tangjin, KR|36.894|126.630
Damyang, KR|35.319|126.984
Taesal-li, KR|36.971|126.454
Daejeon, KR|36.349|127.385
Daegu, KR|35.870|128.591
Boryeong, KR|36.349|126.598
Taebaek, KR|37.176|128.989
Suwon, KR|37.291|127.009
Suncheon, KR|34.950|127.488
Seoul, KR|37.566|126.978
Seosan, KR|36.782|126.452
Jenzan, KR|36.241|128.298
Seonghwan, KR|36.916|127.131
Sokcho, KR|38.207|128.592
Siheungdong, KR|37.452|126.911
Sangju, KR|36.415|128.161
Santyoku, KR|37.441|129.171
Pyeongtaek, KR|36.995|127.089
Buyeo, KR|36.275|126.909
Busan, KR|35.102|129.030
Bucheon-si, KR|37.499|126.783
Buan, KR|35.728|126.732
Beolgyo, KR|34.849|127.341
Pohang, KR|36.029|129.365
Osan, KR|37.152|127.071
Asan, KR|36.784|127.004
Okcheon, KR|36.301|127.568
Kosong, KR|38.379|128.468
Nonsan, KR|36.204|127.085
Nangen, KR|35.410|127.386
Namsa, KR|35.933|127.050
Naju, KR|35.029|126.718
Munsan, KR|37.859|126.785
Mungyeong, KR|36.595|128.199
Paju, KR|37.761|126.773
Muan, KR|34.990|126.479
Mokpo, KR|34.813|126.392
Miryang, KR|35.493|128.749
Masan, KR|35.127|126.831
Gyeongsan-si, KR|35.823|128.738
Gyeongju, KR|35.843|129.212
Kwangyang, KR|34.975|127.589
Gwangju, KR|37.410|127.257
Gwangju, KR|35.155|126.916
Kurye, KR|35.209|127.464
Guri-si, KR|37.599|127.139
Kunwi, KR|36.235|128.573
Gunsan, KR|35.979|126.711
Gunpo, KR|37.367|126.947
Kinzan, KR|36.103|127.489
Gumi, KR|36.114|128.336
Goyang-si, KR|37.656|126.835
Goseong, KR|34.976|128.324
Gongju, KR|36.456|127.125
Kyosai, KR|34.850|128.589
Koesan, KR|36.811|127.795
Kochang, KR|35.433|126.700
Gimpo-si, KR|37.624|126.714
Kimje, KR|35.802|126.889
Kimhae, KR|35.234|128.881
Gimcheon, KR|36.122|128.120
Gijang, KR|35.244|129.214
Gapyeong, KR|37.831|127.511
Gangneung, KR|37.753|128.872
Ganghwa-gun, KR|37.747|126.486
Iksan, KR|35.944|126.954
Incheon, KR|37.456|126.705
Imsil, KR|35.613|127.279
Icheon-si, KR|37.279|127.442
Hwasun, KR|35.061|126.987
Hwaseong-si, KR|37.207|126.817
Hwacheon, KR|38.107|127.706
Hongseong, KR|36.601|126.665
Hongchon, KR|37.692|127.886
Hayang, KR|35.913|128.820
Haenam, KR|34.571|126.599
Jungpyong, KR|36.785|127.582
Tongyeong, KR|34.850|128.428
Chungju, KR|36.977|127.929
Chuncheon, KR|37.875|127.734
Jumunjin, KR|37.891|128.826
Cheorwon, KR|38.209|127.218
Jeonju, KR|35.822|127.149
Cheongsong gun, KR|36.434|129.057
Cheongju-si, KR|36.637|127.490
Cheonan, KR|36.806|127.152
Chinju, KR|35.193|128.085
Chinchon, KR|36.857|127.443
Jinan-gun, KR|35.792|127.425
Jeju City, KR|33.510|126.522
Changwon, KR|35.228|128.681
Changsu, KR|35.648|127.515
Jangseong, KR|35.298|126.784
Jangheung, KR|34.682|126.907
Ara-dong, KR|33.469|126.528
Anyang-si, KR|37.392|126.927
Anseong, KR|37.011|127.270
Ansan-si, KR|37.324|126.822
Andong, KR|36.566|128.723
Gaigeturi, KR|33.464|126.318
Sinhyeon, KR|34.883|128.627
Yeosu, KR|34.761|127.662
Gwangyang, KR|34.941|127.696
Yonmu, KR|36.129|127.100
Donghae City, KR|37.544|129.107
Pubal, KR|37.292|127.508
Seongnam-si, KR|37.439|127.138
Hanam, KR|37.540|127.206
Hwado, KR|37.653|127.308
Namyangju, KR|37.637|127.214
Ungsang, KR|35.406|129.169
Wabu, KR|37.590|127.220
Naeso, KR|35.250|128.520
Hwawon, KR|35.802|128.501
Gwangmyeong, KR|37.477|126.866
Seodong, KR|33.484|126.493
Ido-dong, KR|33.498|126.527
Ora-dong, KR|33.482|126.506
Sinan, KR|34.826|126.109
Uiwang, KR|37.365|126.948
Seogwipo, KR|33.253|126.562
Changnyeong, KR|35.541|128.495
Geoje, KR|34.814|128.706
Sejong, KR|36.592|127.292
Boseong, KR|34.771|127.080
Jeongeup, KR|35.600|126.917
Yeongam, KR|34.801|126.697
Hadong, KR|35.068|127.751
Janub as Surrah, KW|29.269|47.978
Hawalli, KW|29.333|48.029
Bayan, KW|29.303|48.049
As Salimiyah, KW|29.334|48.076
Ar Rumaythiyah, KW|29.312|48.074
Ar Riqqah, KW|29.146|48.095
Al Manqaf, KW|29.096|48.133
Al Mahbulah, KW|29.145|48.130
Kuwait City, KW|29.367|47.974
Al Jahra, KW|29.337|47.658
Al Fahahil, KW|29.082|48.130
Al Fintas, KW|29.174|48.121
Al Farwaniyah, KW|29.277|47.959
Al Ahmadi, KW|29.077|48.084
Ad Dasmah, KW|29.365|48.001
Salwa, KW|29.296|48.079
Ar Rabiyah, KW|29.295|47.933
Sabah as Salim, KW|29.257|48.057
West Bay, KY|19.382|-81.393
George Town, KY|19.287|-81.374
Zhanaozen, KZ|43.341|52.862
Shalqar, KZ|47.832|59.619
Shalkar, KZ|48.033|48.900
Oral, KZ|51.246|51.426
Kandyagash, KZ|49.469|57.419
Mangistau, KZ|43.691|51.322
Qulsary, KZ|46.953|54.020
Khromtau, KZ|50.252|58.436
Karagandy, KZ|49.802|73.102
Embi, KZ|48.830|58.150
Balykshi, KZ|47.067|51.867
Atyrau, KZ|47.105|51.884
Aktobe, KZ|50.280|57.207
Aktau, KZ|43.661|51.174
Aqsay, KZ|51.168|52.998
Altay, KZ|49.736|84.254
Zhosaly, KZ|45.488|64.078
Zhezqazghan, KZ|47.794|67.706
Zhitikara, KZ|52.190|61.199
Zhangatas, KZ|43.563|69.732
Novokazalinsk, KZ|45.848|62.153
Taraz, KZ|42.898|71.373
Zaysan, KZ|47.467|84.871
Zhangaqorghan, KZ|43.907|67.246
Turar Ryskulov, KZ|42.533|70.350
Ushtobe, KZ|45.253|77.983
Turkistan, KZ|43.295|68.257
Temirtau, KZ|50.052|72.955
Tekeli, KZ|44.868|78.728
Tasbuget, KZ|44.770|65.555
Talghar, KZ|43.302|77.238
Taldykorgan, KZ|45.016|78.374
Shymkent, KZ|42.310|69.600
Shu, KZ|43.605|73.762
Shemonaikha, KZ|50.629|81.911
Shelek, KZ|43.596|78.257
Shchuchinsk, KZ|52.936|70.189
Shakhtinsk, KZ|49.707|72.593
Semey, KZ|50.421|80.250
Saryaghash, KZ|41.460|69.168
Sarqant, KZ|45.413|79.917
Saran, KZ|49.802|72.832
Rudnyy, KZ|52.972|63.111
Kyzylorda, KZ|44.853|65.509
Kostanay, KZ|53.214|63.625
Karatau, KZ|43.180|70.459
Konayev, KZ|43.867|77.063
Petropavl, KZ|54.873|69.151
Pavlodar, KZ|52.276|76.969
Zharkent, KZ|44.166|80.007
Ust-Kamenogorsk, KZ|49.971|82.606
Satpayev, KZ|47.904|67.541
Sarykemer, KZ|43.009|71.510
Merke, KZ|42.872|73.196
Maqanshy, KZ|46.782|82.023
Makinsk, KZ|52.633|70.419
Lisakovsk, KZ|52.545|62.499
Baikonur, KZ|45.617|63.317
Ridder, KZ|50.345|83.516
Lenger, KZ|42.182|69.886
Kokshetau, KZ|53.284|69.394
Kentau, KZ|43.517|68.505
Esik, KZ|43.355|77.452
Kalbatau, KZ|49.330|81.573
Aksu, KZ|52.040|76.927
Otegen Batyra, KZ|43.418|77.022
Ekibastuz, KZ|51.724|75.323
Zhetysay, KZ|40.776|68.328
Shiyeli, KZ|44.171|66.734
Shardara, KZ|41.258|67.970
Burunday, KZ|43.356|76.855
Aksu, KZ|42.422|69.827
Balqash, KZ|46.845|74.982
Ayagoz, KZ|47.964|80.434
Atbasar, KZ|51.809|68.358
Arys, KZ|42.430|68.809
Arkalyk, KZ|50.250|66.904
Aral, KZ|46.802|61.663
Astana, KZ|51.180|71.446
Almaty, KZ|43.252|76.912
Akkol, KZ|53.296|69.600
Abay, KZ|49.635|72.865
Abay, KZ|41.347|68.950
Stepnogorsk, KZ|52.351|71.882
Vientiane, LA|17.967|102.600
Xam Nua, LA|20.416|104.045
Savannakhet, LA|16.570|104.762
Pakse, LA|15.120|105.799
Muang Xay, LA|20.692|101.984
Vang Vieng, LA|18.924|102.448
Muang Sing, LA|21.192|101.148
Muang Phonsavan, LA|19.449|103.192
Pakxan, LA|18.394|103.661
Thakhek, LA|17.410|104.831
Luang Prabang, LA|19.893|102.153
Borikhan, LA|18.563|103.727
Ban Xeno, LA|16.676|104.988
Ban Laongam, LA|15.465|106.167
Ban Kengkok, LA|16.444|105.198
Ban Houakhoua, LA|20.247|100.454
Sekong, LA|15.346|106.724
Ban Khoan, LA|20.350|100.090
Zahle, LB|33.847|35.902
Tripoli, LB|34.434|35.844
Tyre, LB|33.273|35.194
Chmistar, LB|33.965|36.017
Sidon, LB|33.558|35.371
Ras Bayrut, LB|33.900|35.483
Jounieh, LB|33.981|35.618
Byblos, LB|34.121|35.648
Aarsal, LB|34.179|36.421
Habbouch, LB|33.408|35.482
Bsharri, LB|34.251|36.011
Beirut, LB|33.893|35.502
Baalbek, LB|34.006|36.218
En Naqoura, LB|33.118|35.140
Nabatiye et Tahta, LB|33.379|35.484
El Hermel, LB|34.394|36.385
Ghazieh, LB|33.517|35.369
Aley, LB|33.805|35.600
Gros Islet, LC|14.067|-60.950
Castries, LC|13.996|-61.006
Vaduz, LI|47.142|9.522
Welisara, LK|7.028|79.901
Weligama, LK|5.975|80.430
Wattala, LK|6.989|79.892
Vavuniya, LK|8.751|80.497
Valvedditturai, LK|9.817|80.167
Vakarai, LK|8.133|81.433
Trincomalee, LK|8.578|81.229
Ratnapura, LK|6.686|80.404
Puttalam, LK|8.036|79.828
Pottuvil, LK|6.876|81.827
Point Pedro, LK|9.817|80.233
Pita Kotte, LK|6.891|79.901
Peliyagoda, LK|6.968|79.884
Panadura, LK|6.713|79.903
Nuwara Eliya, LK|6.971|80.783
Negombo, LK|7.208|79.836
Mulleriyawa, LK|6.933|79.930
Mullaittivu, LK|9.268|80.815
Dehiwala-Mount Lavinia, LK|6.840|79.871
Moratuwa, LK|6.773|79.882
Matara, LK|5.949|80.535
Matale, LK|7.470|80.622
Mannar, LK|8.989|79.878
Maharagama, LK|6.848|79.927
Kurunegala, LK|7.484|80.368
Sri Jayewardenepura Kotte, LK|6.883|79.907
Kotikawatta, LK|6.927|79.909
Kolonnawa, LK|6.933|79.885
Kelaniya, LK|6.955|79.922
Kegalle, LK|7.252|80.344
Katunayaka, LK|7.170|79.888
Kataragama, LK|6.413|81.335
Kandy, LK|7.291|80.634
Kandana, LK|7.048|79.894
Kalutara, LK|6.583|79.959
Kalmunai, LK|7.409|81.835
Jaffna, LK|9.668|80.007
Ja Ela, LK|7.074|79.892
Homagama, LK|6.844|80.002
Hendala, LK|6.991|79.883
Hatton, LK|6.892|80.596
Hanwella Ihala, LK|6.901|80.085
Hambantota, LK|6.124|81.118
Gampola, LK|7.164|80.570
Galle, LK|6.046|80.210
Eravur Town, LK|7.778|81.604
Devinuwara, LK|5.928|80.589
Dambulla, LK|7.860|80.652
Colombo, LK|6.935|79.849
Chilaw, LK|7.576|79.795
Beruwala, LK|6.479|79.983
Bentota, LK|6.426|79.996
Beliatta, LK|6.050|80.733
Batticaloa, LK|7.710|81.692
Battaramulla South, LK|6.896|79.918
Badulla, LK|6.980|81.058
Anuradhapura, LK|8.312|80.413
Ampara, LK|7.298|81.682
Ambalantota, LK|6.120|81.021
Ambalangoda, LK|6.236|80.054
Zwedru, LR|6.068|-8.136
New Yekepa, LR|7.579|-8.538
Voinjama, LR|8.422|-9.748
Tubmanburg, LR|6.871|-10.821
Sanniquellie, LR|7.362|-8.713
Saclepea, LR|6.963|-8.841
Pleebo City, LR|4.590|-7.672
Monrovia, LR|6.301|-10.797
Kakata, LR|6.531|-10.354
Harper, LR|4.378|-7.711
Harbel, LR|6.247|-10.356
Greenville, LR|5.011|-9.039
Gbarnga, LR|6.995|-9.471
Ganta, LR|7.235|-8.984
Foya Kamara, LR|8.360|-10.206
Buchanan, LR|5.877|-10.050
Teyateyaneng, LS|-29.147|27.749
Quthing, LS|-30.400|27.700
Qachas Nek, LS|-30.115|28.689
Mohales Hoek, LS|-30.151|27.477
Maseru, LS|-29.317|27.483
Maputsoe, LS|-28.887|27.899
Mafeteng, LS|-29.823|27.237
Hlotse, LS|-28.872|28.045
Butha-Buthe, LS|-28.767|28.249
Thaba-Tseka, LS|-29.522|28.608
Mabote, LS|-29.279|27.524
Visaginas, LT|55.597|26.440
Vilnius, LT|54.689|25.280
Utena, LT|55.498|25.605
Ukmerge, LT|55.250|24.750
Telsiai, LT|55.981|22.247
Taurage, LT|55.252|22.290
Siauliai, LT|55.933|23.317
Radviliskis, LT|55.817|23.533
Plunge, LT|55.911|21.844
Panevezys, LT|55.732|24.360
Palanga, LT|55.917|21.069
Fabijoniskes, LT|54.733|25.242
Naujoji Vilnia, LT|54.695|25.420
Mazeikiai, LT|56.317|22.333
Marijampole, LT|54.558|23.350
Kretinga, LT|55.889|21.244
Klaipeda, LT|55.707|21.139
Kedainiai, LT|55.288|23.973
Kaunas, LT|54.902|23.909
Jonava, LT|55.080|24.275
Gargzdai, LT|55.710|21.394
Antakalnis, LT|54.708|25.317
Alytus, LT|54.396|24.039
Aleksotas, LT|54.880|23.908
Dainava (Kaunas), LT|54.915|23.968
Naujininkai, LT|54.664|25.284
Karoliniskes, LT|54.690|25.219
Silainiai, LT|54.929|23.886
Eiguliai, LT|54.931|23.932
Pasilaiciai, LT|54.734|25.219
Pilaite, LT|54.700|25.184
Justiniskes, LT|54.717|25.217
Seskine, LT|54.710|25.251
Lazdynai, LT|54.668|25.207
Vilkpede, LT|54.670|25.248
Naujamiestis, LT|54.680|25.269
Luxembourg, LU|49.610|6.133
Esch-sur-Alzette, LU|49.496|5.981
Dudelange, LU|49.481|6.088
Valmiera, LV|57.541|25.428
Ventspils, LV|57.395|21.561
Tukums, LV|56.968|23.156
Salaspils, LV|56.860|24.365
Riga, LV|56.946|24.106
Rezekne, LV|56.510|27.340
Ogre, LV|56.816|24.614
Liepaja, LV|56.505|21.011
Jurmala, LV|56.968|23.770
Jelgava, LV|56.650|23.713
Jekabpils, LV|56.499|25.857
Daugavpils, LV|55.883|26.533
Cesis, LV|57.312|25.275
Marupe, LV|56.905|24.051
Darzciems, LV|56.946|24.175
Tobruk, LY|32.090|23.954
Qaryat Suluq, LY|31.668|20.252
Darnah, LY|32.767|22.637
Benghazi, LY|32.115|20.069
Az Zuwaytinah, LY|30.952|20.120
At Taj, LY|24.205|23.286
Al Qubbah, LY|32.757|22.241
Al Marj, LY|32.493|20.829
Al Jawf, LY|24.199|23.291
Al Bayda, LY|32.763|21.755
Al Abyar, LY|32.190|20.597
Ajdabiya, LY|30.755|20.226
Zuwarah, LY|32.931|12.082
Zliten, LY|32.467|14.569
Yafran, LY|32.063|12.529
Tarhuna, LY|32.435|13.633
Tripoli, LY|32.887|13.187
Tajura, LY|32.882|13.351
Sirte, LY|31.209|16.589
Surman, LY|32.757|12.572
Sabratah, LY|32.793|12.488
Sabha, LY|27.038|14.428
Sidi Bin Zinah, LY|32.887|11.987
Qasr Khiyar, LY|32.697|13.846
Qasr Bin Ghashir, LY|32.683|13.183
Qasr al Qarabulli, LY|32.745|13.715
Nalut, LY|31.868|10.981
Murzuk, LY|25.916|13.918
Mizdah, LY|31.449|12.985
Misratah, LY|32.375|15.093
Al Burayqah, LY|30.406|19.574
Janzur, LY|32.819|13.017
Hun, LY|29.127|15.948
Zawiya, LY|32.752|12.728
Gharyan, LY|32.172|13.020
Brak, LY|27.550|14.271
Bin Jawwad, LY|30.804|18.077
Bani Walid, LY|31.746|13.984
Zintan, LY|31.932|12.253
Az Zawiyah, LY|32.757|12.728
Az Zahra, LY|32.679|12.873
Ubari, LY|26.590|12.775
As Sawani, LY|32.717|13.067
Ar Rayayinah, LY|32.027|12.356
An Nasiriyah, LY|32.633|12.874
Al Ajaylat, LY|32.757|12.376
Al Qawasim, LY|32.184|13.060
Al Khums, LY|32.649|14.262
Al Jumayl, LY|32.853|12.061
Al Jadid, LY|27.050|14.400
Al Hurshah, LY|32.765|12.674
Al Ghurayfah, LY|26.522|13.011
Al Aziziyah, LY|32.532|13.018
Al Asabiah, LY|32.033|12.867
Shahhat, LY|32.804|21.866
Al-Aluas, LY|32.710|13.967
Qarquzah, LY|32.746|12.842
Wadi Utbah, LY|26.095|13.557
Msalatah, LY|32.583|14.036
Smara, MA|26.738|-11.672
Setti Fatma, MA|31.225|-7.678
Zawyat ech Cheikh, MA|32.644|-5.918
Zaio, MA|34.943|-2.733
Zagora, MA|30.332|-5.838
Youssoufia, MA|32.246|-8.529
Tiznit, MA|29.697|-9.732
Tit Mellil, MA|33.558|-7.486
Tirhanimine, MA|35.236|-3.955
Tinghir, MA|31.515|-5.533
Tiflet, MA|33.895|-6.306
Tetouan, MA|35.578|-5.368
Temara, MA|33.929|-6.907
Taza, MA|34.210|-4.010
Tata, MA|29.744|-7.973
Taroudant, MA|30.470|-8.877
Taourirt, MA|34.407|-2.897
Taounate, MA|34.537|-4.640
Tan-Tan, MA|28.438|-11.103
Tangier, MA|35.767|-5.800
Tamallalt, MA|31.819|-7.514
Tahla, MA|34.050|-4.422
Tabount, MA|30.903|-6.916
Souq Larba al Gharb, MA|34.687|-6.003
Souq Sebt Oulad Nemma, MA|32.297|-6.703
Souk et Tnine Jorf el Mellah, MA|34.492|-5.508
Sidi Yahia El Gharb, MA|34.305|-6.304
Sidi Slimane, MA|34.265|-5.926
Sidi Rahal, MA|33.477|-7.936
Sidi Kacem, MA|34.221|-5.708
Sidi Ifni, MA|29.380|-10.173
Bouknadel, MA|34.118|-6.739
Sidi Bennour, MA|32.652|-8.428
Sidi Allal El Bahraoui, MA|34.008|-6.531
Gueznaia, MA|35.702|-5.890
Settat, MA|33.001|-7.617
Selouane, MA|35.073|-2.942
Zeghanghane, MA|35.156|-3.002
Sefrou, MA|33.832|-4.828
Sebt Gzoula, MA|32.108|-9.084
Sale, MA|34.053|-6.798
Safi, MA|32.299|-9.237
Recani, MA|31.283|-4.266
Rich, MA|32.256|-4.502
Ras el Ma, MA|33.974|-5.096
Rabat, MA|34.013|-6.833
Outat Oulad Al Haj, MA|33.345|-3.704
Oulmes, MA|33.426|-6.001
Oulad Teima, MA|30.395|-9.209
Oulad Tayeb, MA|33.946|-4.995
Oulad Barhil, MA|30.640|-8.469
Oulad Ayad, MA|32.200|-6.800
Oujda, MA|34.681|-1.909
Oued Zem, MA|32.863|-6.574
Ouezzane, MA|34.796|-5.578
Ouarzazate, MA|30.919|-6.893
Zawyat an Nwacer, MA|33.380|-7.619
Nador, MA|35.168|-2.934
Al Aaroui, MA|35.011|-3.009
Mohammedia, MA|33.686|-7.383
Missour, MA|33.049|-3.989
Midelt, MA|32.685|-4.745
Midar, MA|34.940|-3.533
Meknes, MA|33.894|-5.547
Mehdya, MA|34.256|-6.673
Mediouna, MA|33.452|-7.520
Mechraa Bel Ksiri, MA|34.574|-5.956
Mdiq, MA|35.683|-5.329
Martil, MA|35.617|-5.275
Marrakesh, MA|31.634|-8.000
Larache, MA|35.193|-6.156
Lalla Mimouna, MA|34.846|-6.066
Ksar El Kebir, MA|35.000|-5.904
Khouribga, MA|32.881|-6.906
Khenifra, MA|32.935|-5.662
Kenitra, MA|34.261|-6.580
Kasba Tadla, MA|32.598|-6.268
Karia Ba Mohamed, MA|34.371|-5.214
Jerada, MA|34.310|-2.160
Mrirt, MA|33.164|-5.567
Inezgane, MA|30.355|-9.536
Imouzzer Kandar, MA|33.729|-5.011
Imi-n-Tanout, MA|31.172|-8.847
Ifrane, MA|33.527|-5.110
Guercif, MA|34.226|-3.354
Guelmim, MA|28.987|-10.057
Goulmima, MA|31.692|-4.953
Fnidek, MA|35.849|-5.357
Al Fqih Ben Calah, MA|32.502|-6.688
New Fes, MA|34.055|-5.007
Fes al Bali, MA|34.070|-4.955
Fes, MA|34.033|-5.000
Essaouira, MA|31.512|-9.770
Arfoud, MA|31.435|-4.233
El Ksiba, MA|32.573|-6.019
El Kelaa des Srarhna, MA|32.051|-7.411
Kelaat Mgouna, MA|31.246|-6.133
El Jadida, MA|33.257|-8.509
El Harhoura, MA|33.945|-6.931
El Hajeb, MA|33.688|-5.371
El Gara, MA|33.277|-7.232
Al Brouj, MA|32.505|-7.192
El Aioun, MA|34.583|-2.506
Imzouren, MA|35.146|-3.851
Driouch, MA|34.977|-3.379
Douar Toulal, MA|33.885|-5.597
Ad Darwa, MA|33.375|-7.536
Demnate, MA|31.734|-7.005
Dar Bouazza, MA|33.515|-7.817
Chichaoua, MA|31.544|-8.763
Echemmaia Est, MA|32.081|-8.625
Chefchaouen, MA|35.169|-5.264
Casablanca, MA|33.588|-7.611
Bouznika, MA|33.789|-7.160
Bouskoura, MA|33.450|-7.652
Boumia, MA|32.724|-5.103
Bou Izakarn, MA|29.177|-9.712
Bouarfa, MA|32.534|-1.962
Bir Jdid, MA|33.374|-7.995
Berkane, MA|34.920|-2.320
Ben Taieb, MA|35.044|-3.454
Benslimane, MA|33.616|-7.122
Ben Jerrar, MA|30.262|-9.504
Beni Mellal, MA|32.337|-6.350
Beni Enzar, MA|35.260|-2.930
Ben Guerir, MA|32.241|-7.954
Ben Ahmed, MA|33.066|-7.242
Berrechid, MA|33.266|-7.588
Azrou, MA|33.434|-5.221
Azilal, MA|31.962|-6.571
Azemmour, MA|33.290|-8.342
Assa, MA|28.610|-9.430
Asni, MA|31.247|-7.979
Asilah, MA|35.465|-6.034
Aourir, MA|30.492|-9.636
Aoulouz, MA|30.673|-8.181
Amizmiz, MA|31.217|-8.232
El Mansouria, MA|33.746|-7.302
Beni Yakhlef, MA|33.684|-7.339
Khemisset, MA|33.824|-6.066
Al Hoceima, MA|35.252|-3.937
Ait Yazza, MA|30.502|-8.799
Ait Ourir, MA|31.565|-7.662
Ain Taoujdat, MA|33.936|-5.213
Ain Harrouda, MA|33.637|-7.450
Ain Beni Mathar, MA|34.010|-2.032
Ain El Aouda, MA|33.803|-6.795
Ahfir, MA|34.954|-2.100
Aguelmous, MA|33.161|-5.846
Agourai, MA|33.630|-5.580
Agadir, MA|30.420|-9.598
Skhirate, MA|33.853|-7.032
Azla, MA|35.553|-5.245
Ribat Al Khayr, MA|33.815|-4.407
Boujniba, MA|32.900|-6.775
Errachidia, MA|31.931|-4.427
Tamesna, MA|33.818|-6.917
Tamansourt, MA|31.755|-8.110
Dakhla, MA|30.411|-9.553
Dchira El Jihadia, MA|30.373|-9.548
Ait Melloul, MA|30.342|-9.504
Tine Biougra, MA|30.209|-9.379
Lqoliaa, MA|30.298|-9.466
Oadar Temsia, MA|30.365|-9.410
My Drarga, MA|30.377|-9.473
Sidi Taibi, MA|34.187|-6.682
Sale Al Jadida, MA|33.997|-6.740
Bni Bouayach, MA|35.105|-3.840
Sabaa Aiyoun, MA|33.903|-5.369
Bejaad, MA|32.771|-6.392
Moulay Ali Cherif, MA|31.282|-4.265
Ouislane, MA|33.914|-5.490
Had Soualem, MA|33.420|-7.852
Lahraouyine, MA|33.541|-7.528
Mechouar-Kasba, MA|31.601|-7.987
Laattaouia, MA|31.835|-7.314
Sidi Slimane Echcharaa, MA|34.908|-2.351
Mers El Kheir, MA|33.863|-6.930
Ain Attig, MA|33.888|-6.968
Souk El Arbaa, MA|34.685|-6.003
Monte-Carlo, MC|43.740|7.427
Monaco, MC|43.737|7.421
Edinet, MD|48.173|27.301
Ungheni, MD|47.210|27.800
Tiraspol, MD|46.843|29.628
Straseni, MD|47.142|28.608
Bilicenii Vechi, MD|47.656|28.047
Soroca, MD|48.157|28.285
Slobozia, MD|46.729|29.704
Ribnita, MD|47.768|29.010
Orhei, MD|47.385|28.825
Hincesti, MD|46.831|28.590
Codru, MD|46.976|28.819
Causeni, MD|46.637|29.411
Floresti, MD|47.892|28.293
Durlesti, MD|47.022|28.763
Dubasari, MD|47.266|29.167
Drochia, MD|48.037|27.812
Comrat, MD|46.295|28.657
Chisinau, MD|47.009|28.859
Ceadir-Lunga, MD|46.062|28.831
Cahul, MD|45.905|28.195
Bender, MD|46.832|29.477
Balti, MD|47.763|27.929
Podgorica, ME|42.441|19.263
Pljevlja, ME|43.357|19.358
Niksic, ME|42.773|18.944
Herceg Novi, ME|42.453|18.538
Cetinje, ME|42.391|18.914
Budva, ME|42.287|18.839
Bijelo Polje, ME|43.038|19.748
Bar, ME|42.094|19.098
Marigot, MF|18.068|-63.083
Toamasina, MG|-18.149|49.402
Vondrozo, MG|-22.817|47.283
Vohipeno, MG|-22.350|47.833
Vohipaho, MG|-23.550|47.500
Vohibinany, MG|-17.350|49.033
Vavatenina, MG|-17.467|49.200
Vatomandry, MG|-19.330|48.978
Vangaindrano, MG|-23.350|47.600
Tsiroanomandidy, MG|-18.770|46.047
Tsiombe, MG|-25.300|45.483
Tsaratanana, MG|-16.797|47.652
Toliara, MG|-23.350|43.667
Tolanaro, MG|-25.032|46.983
Soavinandriana, MG|-19.167|46.733
Soanindrariny, MG|-19.900|47.233
Soanierana Ivongo, MG|-16.917|49.583
Soalala, MG|-16.100|45.317
Sitampiky, MG|-16.667|46.100
Sambava, MG|-14.267|50.167
Sakaraha, MG|-22.900|44.533
Sahavato, MG|-20.600|48.333
Sadabe, MG|-18.633|47.700
Boriziny, MG|-15.550|47.667
Nosy Varika, MG|-20.583|48.533
Morondava, MG|-20.289|44.318
Morombe, MG|-21.745|43.361
Moramanga, MG|-18.949|48.230
Miandrivazo, MG|-19.529|45.456
Miandrarivo, MG|-19.433|46.750
Marovoay, MG|-16.111|46.644
Maromandia, MG|-14.217|48.083
Marolambo, MG|-20.050|48.117
Maroantsetra, MG|-15.435|49.738
Manjakandriana, MG|-18.917|47.800
Mananjary, MG|-21.230|48.342
Mananara, MG|-16.169|49.766
Manakara, MG|-22.149|48.011
Mampikony, MG|-16.092|47.647
Maintirano, MG|-18.064|44.030
Mahanoro, MG|-19.900|48.800
Mahajanga, MG|-15.717|46.317
Maevatanana, MG|-16.950|46.833
Jafaro, MG|-24.917|45.517
Ivohibe, MG|-22.483|46.883
Ivato, MG|-18.800|47.483
Itampolo, MG|-24.683|43.950
Imerintsiatosika, MG|-18.983|47.317
Imerimandroso, MG|-17.433|48.583
Ikongo, MG|-21.883|47.433
Ikalamavony, MG|-21.150|46.583
Ihosy, MG|-22.403|46.126
Iharana, MG|-13.350|50.000
Ifanadiana, MG|-21.300|47.633
Fianarantsoa, MG|-21.453|47.086
Fenoarivo Be, MG|-18.433|46.567
Fenoarivo Atsinanana, MG|-17.381|49.408
Faratsiho, MG|-19.400|46.950
Farafangana, MG|-22.822|47.826
Fandriana, MG|-20.233|47.383
Didy, MG|-18.117|48.533
Betroka, MG|-23.267|46.083
Betioky, MG|-23.721|44.381
Betafo, MG|-19.833|46.850
Beroroha, MG|-21.667|45.167
Belo sur Tsiribihina, MG|-19.698|44.546
Beloha, MG|-25.167|45.050
Bekily, MG|-24.217|45.317
Befandriana, MG|-15.257|48.542
Bealanana, MG|-14.543|48.750
Arivonimamo, MG|-19.017|47.183
Antsohimbondrona, MG|-13.083|48.850
Antsohihy, MG|-14.880|47.988
Antsiranana, MG|-12.317|49.292
Antsirabe, MG|-19.866|47.033
Antsalova, MG|-18.667|44.617
Antanifotsy, MG|-19.650|47.317
Antananarivo, MG|-18.914|47.536
Antalaha, MG|-14.900|50.279
Ankazondandy, MG|-18.700|47.783
Ankazobe, MG|-18.317|47.117
Ankazoabo, MG|-22.283|44.517
Anjozorobe, MG|-18.400|47.867
Hell-Ville, MG|-13.397|48.267
Andilamena, MG|-17.010|48.573
Andapa, MG|-14.650|49.650
Ampasimanolotra, MG|-18.817|49.067
Amparafaravola, MG|-17.588|48.224
Ampanihy, MG|-24.694|44.746
Ampahana, MG|-14.750|50.217
Ambovombe, MG|-25.178|46.087
Ambositra, MG|-20.530|47.243
Ambohitrolomahitsy, MG|-18.700|47.683
Ambohidratrimo, MG|-18.818|47.434
Ambodimanga II, MG|-17.267|49.167
Ambodifotatra, MG|-16.983|49.850
Amboasary, MG|-25.033|46.383
Amboanjo, MG|-22.000|47.850
Ambilobe, MG|-13.200|49.050
Ambatondrazaka, MG|-17.833|48.417
Ambatolampy, MG|-19.383|47.417
Ambatofinandrahana, MG|-20.553|46.804
Ambato Boeny, MG|-16.467|46.717
Ambarakaraka, MG|-13.500|48.867
Ambanja, MG|-13.669|48.453
Ambalavao, MG|-21.833|46.933
Alarobia, MG|-18.967|47.733
Majuro, MH|7.090|171.380
Dalap-Uliga-Dorrit, MH|7.087|171.377
Zelino, MK|41.980|21.064
Vinica, MK|41.881|22.511
Veles, MK|41.717|21.772
Tetovo, MK|42.010|20.971
Tearce, MK|42.076|21.052
Studenicani, MK|41.922|21.535
Strumica, MK|41.438|22.643
Struga, MK|41.178|20.679
Shtip, MK|41.746|22.196
Skopje, MK|41.996|21.431
Saraj, MK|42.000|21.328
Resen, MK|41.090|21.009
Radovis, MK|41.638|22.465
Prilep, MK|41.346|21.554
Ohrid, MK|41.117|20.802
Negotino, MK|41.878|20.884
Negotino, MK|41.485|22.091
Lipkovo, MK|42.157|21.586
Kumanovo, MK|42.133|21.716
Kriva Palanka, MK|42.202|22.334
Kochani, MK|41.916|22.413
Kicevo, MK|41.513|20.959
Kavadarci, MK|41.433|22.012
Kamenjane, MK|41.946|20.929
Gostivar, MK|41.796|20.908
Gevgelija, MK|41.143|22.501
Gjorce Petro, MK|42.008|21.353
Delcevo, MK|41.967|22.769
Debar, MK|41.523|20.522
Brvenica, MK|41.967|20.981
Bogovinje, MK|41.922|20.915
Bitola, MK|41.032|21.336
Suto Orizare, MK|42.040|21.425
Butel, MK|42.031|21.447
Cair, MK|42.015|21.441
Ilinden, MK|41.993|21.581
Kisela Voda, MK|41.949|21.503
Centar Zupa, MK|41.478|20.559
Zegoua, ML|10.488|-5.649
Yorosso, ML|12.358|-4.777
Yanfolila, ML|11.183|-8.150
Toubakoura, ML|13.464|-7.383
Timbuktu, ML|16.773|-3.007
Siribala Coro, ML|14.043|-6.107
Sirakoro Meguetana, ML|12.564|-7.916
Sikasso, ML|11.318|-5.667
Sibi, ML|12.375|-8.335
Segou, ML|13.440|-6.259
San, ML|13.297|-4.896
Sagalo, ML|12.200|-10.700
Nioro, ML|15.231|-9.594
Niono, ML|14.251|-5.987
Nara, ML|15.169|-7.290
Mopti, ML|14.484|-4.183
Markala, ML|13.684|-6.074
Moribabougou, ML|12.687|-7.864
Moninnpebougou, ML|14.151|-5.521
Mahina, ML|13.904|-10.099
Koutiala, ML|12.387|-5.465
Kouri, ML|12.184|-4.803
Koulikoro, ML|12.863|-7.560
Koro, ML|14.064|-3.075
Kolokani, ML|13.574|-8.033
Kita, ML|13.039|-9.488
Kidal, ML|18.443|1.409
Ke-Macina, ML|13.964|-5.358
Kayes, ML|14.448|-11.444
Kati, ML|12.744|-8.073
Kangaba, ML|11.933|-8.417
Kalaban Koro, ML|12.573|-8.029
Kadiolo, ML|10.550|-5.767
Kabala, ML|12.525|-8.039
Goundam, ML|16.415|-3.671
Gao, ML|16.272|-0.045
Pelengana, ML|13.427|-6.222
Finnkolo, ML|11.268|-5.511
Fana, ML|12.779|-6.956
Douentza, ML|15.006|-2.952
Dougabougou, ML|13.820|-6.121
Djenne, ML|13.906|-4.553
Dire, ML|16.257|-3.401
Diourou, ML|13.687|-5.832
Dioila, ML|12.487|-6.803
Diema, ML|14.540|-9.192
Bourem, ML|16.955|-0.349
Bougouni, ML|11.418|-7.483
Bla, ML|12.951|-5.756
Bankass, ML|14.078|-3.516
Bandiagara, ML|14.350|-3.610
Banamba, ML|13.548|-7.448
Bamba, ML|10.383|-7.150
Bamako, ML|12.609|-7.975
Bafoulabe, ML|13.808|-10.833
Anderanboukan, ML|15.428|3.018
Dialakorodji, ML|12.704|-7.965
I-n-Tillit, ML|15.546|-0.461
Massiogo, ML|10.306|-6.110
Sangarebougou, ML|12.706|-7.903
Zigon, MM|18.336|95.621
Zalun, MM|17.479|95.559
Ywar Ma West, MM|16.897|96.092
Ye-u, MM|22.767|95.428
Yesagyo, MM|21.632|95.246
Yenangyaung, MM|20.465|94.871
Yedashe, MM|19.156|96.346
Ye, MM|15.246|97.855
Yawnghwe, MM|20.660|96.934
Nyaungdon, MM|17.045|95.640
Yamethin, MM|20.432|96.139
Wundwin, MM|21.094|96.028
Waw, MM|17.477|96.678
Pangkham, MM|22.179|99.167
Wakema, MM|16.603|95.183
Twante, MM|16.708|95.934
Taungoo, MM|18.943|96.434
Thongwa, MM|16.760|96.525
Thin Gan Kyun Gyi, MM|16.957|96.155
Thayetmyo, MM|19.321|95.183
Thaton, MM|16.919|97.370
Tharyarwady, MM|17.654|95.788
Thanhlyin, MM|16.782|96.247
Thanbyuzayat, MM|15.969|97.727
Thanatpin, MM|17.291|96.575
Dawei, MM|14.082|98.192
Taungup, MM|18.856|94.241
Taunggyi, MM|20.789|97.038
Taungdwingyi, MM|20.006|95.545
Tatkon, MM|24.679|95.074
Tangyan, MM|22.494|98.393
Tamu, MM|24.217|94.312
Kone Ta La Paung, MM|17.008|96.150
Taikkyi, MM|17.314|95.963
Tachilek, MM|20.448|99.881
Thanlyin, MM|16.769|96.245
Sittwe, MM|20.146|92.898
Shwe Lin Ban, MM|16.897|96.068
Shwegyin, MM|17.921|96.877
Shwegu, MM|24.227|96.791
Shwebo, MM|22.569|95.698
Thandwe, MM|18.465|94.366
Sagaing, MM|21.879|95.980
Yangon, MM|16.805|96.156
Pyu, MM|18.481|96.437
Pyinmana, MM|19.738|96.207
Pyay, MM|18.820|95.216
Pyawbwe, MM|20.592|96.052
Pyapon, MM|16.285|95.679
Pekon, MM|19.868|97.007
Bago, MM|17.335|96.481
Pazundaung, MM|16.796|96.175
Paungde, MM|18.492|95.506
Paung, MM|16.618|97.459
Pangtara, MM|20.943|96.663
Panglong, MM|24.101|98.313
Pakokku, MM|21.335|95.084
Hpa-An, MM|16.890|97.635
Nyaung-U, MM|21.201|94.908
Nyaunglebin, MM|17.954|96.722
Nansang, MM|20.892|97.717
Namhkam, MM|23.833|97.680
Mrauk U, MM|20.590|93.191
Myitkyina, MM|25.383|97.396
Myingyan, MM|21.460|95.388
Myawaddy, MM|16.689|98.509
Myaungmya, MM|16.599|94.921
Myanaung, MM|18.287|95.320
Mu-se, MM|23.997|97.901
Mudon, MM|16.256|97.725
Mawlamyinegyunn, MM|16.377|95.265
Mawlamyine, MM|16.491|97.628
Monywa, MM|22.109|95.136
Moeng Yang, MM|21.848|99.677
Mohnyin, MM|24.778|96.369
Mogok, MM|22.918|96.510
Mogaung, MM|25.305|96.935
Mingaladon, MM|16.924|96.098
Minbu, MM|20.181|94.876
Myeik, MM|12.440|98.600
Meiktila, MM|20.878|95.858
Pyin Oo Lwin, MM|22.035|96.457
Mawlaik, MM|23.643|94.405
Maubin, MM|16.731|95.654
Martaban, MM|16.528|97.616
Mandalay, MM|21.975|96.084
Manaung, MM|18.855|93.729
Magway, MM|20.150|94.932
Madaya, MM|22.211|96.104
Loikaw, MM|19.678|97.210
Lewe, MM|19.636|96.110
Letpandan, MM|17.787|95.751
Lawksawk, MM|21.248|96.867
Lashio, MM|22.936|97.750
Lakang, MM|24.661|97.189
Labutta, MM|16.149|94.759
Kyonpyaw, MM|17.301|95.198
Kyeintali, MM|18.006|94.490
Kyauktaw, MM|20.845|92.975
Kyauktan, MM|24.278|95.895
Kyauktan, MM|16.637|96.325
Kyauktaga, MM|17.495|96.978
Kyaukse, MM|21.606|96.135
Kyaukpyu, MM|19.428|93.551
Kyaukpadaung, MM|20.842|95.127
Kyaukme, MM|22.539|97.034
Kyaikto, MM|17.309|97.011
Kyaiklat, MM|16.445|95.724
Kyaikkami, MM|16.077|97.564
Kungyangon, MM|16.443|96.019
Kutkai, MM|23.458|97.938
Keng Tung, MM|21.631|99.927
Kyimyindine, MM|16.809|96.124
Kayan, MM|16.908|96.560
Kawthoung, MM|9.982|98.550
Kawkareik, MM|16.555|98.237
Katha, MM|24.175|96.341
Kanbe, MM|16.707|96.002
Kanbalu, MM|23.203|95.517
Kalemyo, MM|23.190|94.064
Kalaw, MM|20.635|96.565
Insein, MM|16.889|96.103
Ingabu, MM|17.812|95.270
Hsipaw, MM|22.617|97.300
Hpakan, MM|25.614|96.315
Hopin, MM|24.991|96.527
Hmaw Bi, MM|16.636|97.615
Hlegu, MM|17.096|96.221
Hinthada, MM|17.649|95.457
Heho, MM|20.723|96.823
Hakha, MM|22.645|93.611
Gwa, MM|17.594|94.580
Dawbon, MM|16.516|95.603
Daik-u, MM|17.795|96.670
Chauk, MM|20.899|94.818
Buthidaung Town, MM|20.875|92.530
Botataung, MM|16.772|96.173
Bogale, MM|16.294|95.397
Bhamo, MM|24.253|97.234
Pathein, MM|16.779|94.732
Aungban, MM|20.661|96.635
Ann, MM|19.795|94.048
Amarapura, MM|21.907|96.049
Myaydo, MM|19.368|95.215
Ahlone, MM|16.789|96.126
Zee Kone, MM|16.950|96.102
Ah Lel, MM|16.922|96.063
Shan Chaung, MM|16.860|96.090
Oke Kan, MM|16.853|96.066
Nyaung, MM|16.835|96.088
San Chaung, MM|17.095|96.099
Okpo, MM|16.973|96.088
Shwenatha, MM|16.988|96.162
Pawgan, MM|16.908|96.098
Sinngu, MM|16.913|96.097
Setsan, MM|16.810|96.114
Set Ka Lay, MM|16.814|96.114
Myenigon, MM|16.806|96.135
Moeng Yawng, MM|21.179|100.358
Moeng La, MM|21.671|100.013
Nay Pyi Taw, MM|19.745|96.130
Hlaingthaya, MM|16.850|96.067
Danai, MM|26.359|96.720
Payathonzu, MM|15.318|98.388
Laukkai, MM|23.696|98.762
Pauk Kone, MM|16.946|96.146
Min Ga Lar Don Zay, MM|16.923|96.116
Pyan Lel Nay Yar Cha Htar Ye, MM|16.972|96.127
Kan Nar Middle, MM|16.881|96.097
Myo Thit Ka, MM|16.874|96.097
Kyo Kone East, MM|16.886|96.115
Saw Bwar Gyi Kone, MM|16.886|96.128
Taung Thu Kone, MM|16.898|96.110
Ywar Ma East, MM|16.899|96.103
Aung San, MM|16.922|96.097
Da Nyin Kone, MM|16.933|96.093
Sangyoung, MM|16.806|96.134
Mingala Tangnyunt, MM|16.789|96.172
Uliastay, MN|47.742|96.844
Ulaangom, MN|49.981|92.067
OElgii, MN|48.968|89.963
Khovd, MN|48.006|91.642
Altai, MN|46.372|96.258
Ulan Bator, MN|47.908|106.883
Tsetserleg, MN|47.475|101.454
Suehbaatar, MN|50.231|106.208
Undurkhaan, MN|47.319|110.656
Nalayh, MN|47.767|107.283
Moeroen, MN|49.634|100.162
Bogd, MN|44.670|102.175
Erdenet, MN|49.033|104.083
Dzuunmod, MN|47.707|106.953
Dzuunharaa, MN|48.852|106.458
Darhan, MN|49.487|105.923
Dalandzadgad, MN|43.571|104.425
Choibalsan, MN|48.073|114.533
Saynshand, MN|44.882|110.116
Bulgan, MN|48.812|103.535
Bayanhongor, MN|46.194|100.718
Baruun-Urt, MN|46.681|113.279
Arvayheer, MN|46.264|102.775
Zuunmod, MN|47.707|106.953
Taipa, MO|22.156|113.557
Macau, MO|22.201|113.546
Lai Chi Van, MO|22.120|113.551
Luhuan, MO|22.118|113.552
Zhuojiacun, MO|22.161|113.556
Se, MO|22.191|113.547
Saipan, MP|15.212|145.755
Saint-Joseph, MQ|14.671|-61.039
Sainte-Marie, MQ|14.784|-60.992
Le Robert, MQ|14.678|-60.942
Le Lamentin, MQ|14.613|-61.000
Le Francois, MQ|14.615|-60.903
La Trinite, MQ|14.738|-60.963
Fort-de-France, MQ|14.604|-61.074
Ducos, MQ|14.575|-60.975
Zouerat, MR|22.735|-12.471
Tembedgha, MR|16.241|-8.173
Tekane, MR|16.602|-15.349
Selibaby, MR|15.158|-12.184
Rosso, MR|16.514|-15.805
Elghabra, MR|16.647|-12.671
Nouakchott, MR|18.086|-15.979
Nouadhibou, MR|20.942|-17.038
Nema, MR|16.617|-7.256
Magta Lahjar, MR|17.506|-13.093
Kiffa, MR|16.621|-11.402
Kaedi, MR|16.151|-13.506
El Ayoun, MR|15.558|-11.180
Boutilimitt, MR|17.546|-14.698
Bougadoum, MR|15.867|-7.369
Bogue, MR|16.592|-14.263
Ayoun El Atrous, MR|16.661|-9.615
Atar, MR|20.519|-13.046
Aleg, MR|17.053|-13.913
Akjoujt, MR|19.742|-14.385
Ksar, MR|18.099|-15.957
Tintane, MR|16.395|-10.174
Tevragh Zeina, MR|18.099|-15.988
Dar Naim, MR|18.108|-15.927
Guerou, MR|17.078|-12.039
Mbera, MR|15.856|-5.791
Plymouth, MS|16.706|-62.213
Brades, MS|16.792|-62.211
Zabbar, MT|35.877|14.536
Valletta, MT|35.900|14.515
Sliema, MT|35.912|14.502
San Pawl il-Bahar, MT|35.951|14.416
Qormi, MT|35.876|14.472
Mosta, MT|35.909|14.426
Birkirkara, MT|35.897|14.461
Vacoas, MU|-20.298|57.478
Triolet, MU|-20.058|57.550
Saint Pierre, MU|-20.221|57.534
Quatre Bornes, MU|-20.264|57.479
Port Louis, MU|-20.162|57.499
Mahebourg, MU|-20.408|57.700
Goodlands, MU|-20.038|57.651
Curepipe, MU|-20.316|57.526
Centre de Flacq, MU|-20.190|57.714
Bel Air Riviere Seche, MU|-20.258|57.750
Beau Bassin-Rose Hill, MU|-20.233|57.466
Bambous, MU|-20.257|57.406
Baie du Tombeau, MU|-20.119|57.491
Le Hochet, MU|-20.139|57.530
Male, MV|4.175|73.509
Karonga, MW|-9.933|33.933
Chitipa, MW|-9.702|33.270
Zomba, MW|-15.386|35.319
Salima, MW|-13.780|34.459
Rumphi, MW|-11.019|33.857
Ntcheu, MW|-14.820|34.636
Nsanje, MW|-16.920|35.262
Nkhotakota, MW|-12.927|34.296
Nkhata Bay, MW|-11.607|34.291
Mzuzu, MW|-11.466|34.021
Mzimba, MW|-11.900|33.600
Mwanza, MW|-15.603|34.525
Mulanje, MW|-16.032|35.500
Mponela, MW|-13.531|33.739
Monkey Bay, MW|-14.082|34.917
Mchinji, MW|-13.798|32.880
Mangochi, MW|-14.478|35.264
Liwonde, MW|-15.067|35.225
Lilongwe, MW|-13.967|33.787
Kasungu, MW|-13.033|33.483
Dedza, MW|-14.378|34.333
Blantyre, MW|-15.785|35.009
Balaka, MW|-14.979|34.956
San Fernando, MX|24.847|-98.149
Ciudad Valles, MX|21.996|-99.011
Zumpango, MX|19.797|-99.099
Zumpango del Rio, MX|17.654|-99.527
Zaragoza, MX|19.771|-97.555
Zacualtipan, MX|20.645|-98.654
Zacatlan, MX|19.936|-97.961
Zacatepec de Hidalgo, MX|18.653|-99.191
Yecapixtla, MX|18.883|-98.865
Yautepec, MX|18.882|-99.067
Yajalon, MX|17.173|-92.334
Xoxocotla, MX|18.686|-99.246
Xonacatlan, MX|19.405|-99.528
Xochitepec, MX|18.782|-99.231
Xochimilco, MX|19.255|-99.104
Xicotepec de Juarez, MX|20.276|-97.961
Xico, MX|19.422|-97.008
Xico, MX|19.270|-98.951
Santa Ana Xalmimilulco, MX|19.213|-98.382
Alvaro Obregon, MX|19.359|-99.203
Villahermosa, MX|17.986|-92.939
Gustavo Adolfo Madero, MX|19.494|-99.111
Villaflores, MX|16.234|-93.270
Veracruz, MX|19.181|-96.143
Venustiano Carranza, MX|16.339|-92.563
Valle Hermoso, MX|25.673|-97.813
Valladolid, MX|20.688|-88.199
Uman, MX|20.881|-89.748
Tuxtla, MX|16.754|-93.116
Tuxpam de Rodriguez Cano, MX|20.958|-97.408
Tulum, MX|20.212|-87.463
Tultitlan de Mariano Escobedo, MX|19.647|-99.168
Tultepec, MX|19.685|-99.128
Tulancingo, MX|20.081|-98.368
Tula de Allende, MX|20.056|-99.344
Santa Rosa Treinta, MX|18.702|-99.182
San Miguel Topilejo, MX|19.203|-99.142
Toluca, MX|19.288|-99.653
San Bernardino Tlaxcalancingo, MX|19.029|-98.277
Tlaquiltenango, MX|18.633|-99.163
Tlapa de Comonfort, MX|17.546|-98.582
Tlapacoyan, MX|19.963|-97.211
Tlalpan, MX|19.295|-99.162
Tlalnepantla, MX|19.540|-99.195
Tlahuac, MX|19.287|-99.005
Tizimin, MX|21.143|-88.152
Tizayuca, MX|19.842|-98.981
Tixtla de Guerrero, MX|17.567|-99.398
Ticul, MX|20.399|-89.535
Teziutlan, MX|19.817|-97.360
Texcoco de Mora, MX|19.512|-98.883
Tequixquiac, MX|19.909|-99.145
Tequisquiapan, MX|20.523|-99.892
Cuautitlan Izcalli, MX|19.644|-99.216
Tepotzotlan, MX|19.721|-99.224
Tepeji del Rio de Ocampo, MX|19.905|-99.342
Tepeapulco, MX|19.786|-98.553
Tepeaca, MX|18.967|-97.900
Tepatlaxco de Hidalgo, MX|19.081|-97.973
Teopisca, MX|16.541|-92.473
Teoloyucan, MX|19.744|-99.181
Tenosique, MX|17.473|-91.424
Tenango de Arista, MX|19.104|-99.590
Temixco, MX|18.846|-99.224
Teloloapan, MX|18.369|-99.870
Tecax, MX|20.205|-89.285
Tehuacan, MX|18.464|-97.397
Tecamachalco, MX|18.884|-97.733
Teapa, MX|17.556|-92.948
Taxco de Alarcon, MX|18.557|-99.605
Tapachula, MX|14.905|-92.259
Tantoyuca, MX|21.351|-98.226
Tamuin, MX|22.006|-98.780
Tampico, MX|22.285|-97.878
Tamazunchale, MX|21.260|-98.789
Suchiapa, MX|16.625|-93.099
Santo Domingo Tehuantepec, MX|16.325|-95.241
Santiago Tuxtla, MX|18.466|-95.301
Tetla, MX|19.442|-98.103
Pinotepa Nacional, MX|16.340|-98.053
Santiago Tulantepec, MX|20.036|-98.357
Moyotzingo, MX|19.248|-98.405
Santa Maria Chimalhuacan, MX|19.422|-98.950
Santa Maria Atzompa, MX|17.102|-96.777
Heroica Ciudad de Tlaxiaco, MX|17.269|-97.680
Santa Cruz Xoxocotlan, MX|17.030|-96.735
Tecamac, MX|19.713|-98.969
Santa Ana Chiautempan, MX|19.307|-98.188
Zinacatepec, MX|18.335|-97.246
San Salvador El Seco, MX|19.133|-97.642
San Salvador Atenco, MX|19.552|-98.919
San Rafael, MX|19.210|-98.756
San Pablo de las Salinas, MX|19.667|-99.095
San Pablo Autopan, MX|19.356|-99.657
Zinacantepec, MX|19.284|-99.734
San Miguel Coatlinchan, MX|19.450|-98.873
San Miguel Ajusco, MX|19.222|-99.202
San Mateo Atenco, MX|19.268|-99.532
San Martin Texmelucan de Labastida, MX|19.284|-98.439
Teolocholco, MX|19.243|-98.191
San Juan Zitlaltepec, MX|19.812|-99.145
San Juan Ixtayopan, MX|19.232|-98.999
San Juan del Rio, MX|20.389|-99.996
Tuxtepec, MX|18.088|-96.125
San Jeronimo, MX|19.283|-99.593
San Francisco Tlalcilalcalpan, MX|19.295|-99.768
San Francisco Acuautla, MX|19.346|-98.860
Sanctorum, MX|19.099|-98.254
San Cristobal de las Casas, MX|16.730|-92.638
San Andres Tuxtla, MX|18.449|-95.213
Salina Cruz, MX|16.175|-95.194
Rioverde, MX|21.931|-99.995
Ciudad Rio Bravo, MX|25.985|-98.090
Rio Blanco, MX|18.830|-97.156
Reynosa, MX|26.080|-98.285
Reforma, MX|17.859|-93.154
Puerto Escondido, MX|15.863|-97.068
Puente de Ixtla, MX|18.615|-99.318
Puebla, MX|19.048|-98.207
Progreso de Obregon, MX|20.249|-99.190
Progreso, MX|21.282|-89.663
Poza Rica de Hidalgo, MX|20.533|-97.459
Polanco, MX|19.433|-99.199
Playa del Carmen, MX|20.627|-87.080
Pijijiapan, MX|15.686|-93.209
Peto, MX|20.126|-88.923
Perote, MX|19.562|-97.242
Paraiso, MX|18.401|-93.214
Papantla de Olarte, MX|20.447|-97.325
Panuco, MX|22.054|-98.182
Palmarito Tochapan, MX|18.901|-97.638
Palenque, MX|17.509|-91.981
Pachuca de Soto, MX|20.117|-98.733
Ozumba de Alzate, MX|19.037|-98.795
San Pablo Oztotepec, MX|19.187|-99.074
Oxkutzkab, MX|20.307|-89.418
Orizaba, MX|18.852|-97.100
Ometepec, MX|16.686|-98.405
Ocozocoautla de Espinosa, MX|16.761|-93.374
Ocoyoacac, MX|19.271|-99.458
Ocotlan de Morelos, MX|16.792|-96.675
Ocosingo, MX|16.906|-92.093
Oaxaca, MX|17.060|-96.725
Nuevo Laredo, MX|27.476|-99.516
Nogales, MX|18.828|-97.163
Nicolas Romero, MX|19.642|-99.307
Naucalpan de Juarez, MX|19.479|-99.240
Naranjos, MX|21.351|-97.687
Nanchital de Lazaro Cardenas del Rio, MX|18.071|-94.408
Motul, MX|21.096|-89.283
Motozintla, MX|15.366|-92.247
Montemorelos, MX|25.189|-99.829
Santiago Momoxpan, MX|19.074|-98.267
Mixquiahuala de Juarez, MX|20.230|-99.214
Misantla, MX|19.930|-96.852
Miramar, MX|22.361|-97.900
Minatitlan, MX|18.000|-94.557
Milpa Alta, MX|19.193|-99.023
Miahuatlan de Porfirio Diaz, MX|16.329|-96.596
Metepec, MX|19.259|-99.602
Merida, MX|20.967|-89.623
Matias Romero Avendano, MX|16.877|-95.038
Heroica Matamoros, MX|25.880|-97.504
Martinez de la Torre, MX|20.071|-97.061
Mapastepec, MX|15.434|-92.900
Magdalena Contreras, MX|19.332|-99.211
Macuspana, MX|17.761|-92.595
Reyes Acozac, MX|19.776|-98.981
Los Reyes Acaquilpan, MX|19.364|-98.977
Los Reyes de Juarez, MX|18.949|-97.804
Linares, MX|24.858|-99.568
Libres, MX|19.466|-97.687
Lerma de Villada, MX|19.289|-99.512
Lerdo de Tejada, MX|18.629|-95.520
Las Rosas, MX|16.366|-92.371
Las Margaritas, MX|16.313|-91.982
Las Choapas, MX|17.912|-94.096
Magdalena Atlicpac, MX|19.369|-98.949
La Isla, MX|18.600|-96.150
San Antonio de la Cal, MX|17.029|-96.701
Kanasin, MX|20.935|-89.558
Juchitepec, MX|19.101|-98.879
Heroica Ciudad de Juchitan de Zaragoza, MX|16.434|-95.022
Jose Cardel, MX|19.368|-96.370
Jojutla, MX|18.615|-99.180
Jiutepec, MX|18.881|-99.178
Jaltipan de Morelos, MX|17.965|-94.714
Jalpa de Mendez, MX|18.177|-93.064
Xalatlaco, MX|19.183|-99.418
Xalapa de Enriquez, MX|19.531|-96.916
Izucar de Matamoros, MX|18.602|-98.462
Izamal, MX|20.933|-89.019
Ixtepec, MX|16.561|-95.104
Ixtapan de la Sal, MX|18.844|-99.677
Ixtapaluca, MX|19.316|-98.883
Iztapalapa, MX|19.355|-99.062
Ixtaczoquitlan, MX|18.854|-97.062
Iztacalco, MX|19.395|-99.098
Ixmiquilpan, MX|20.484|-99.218
Villa Independencia, MX|20.055|-97.052
Iguala de la Independencia, MX|18.345|-99.538
Hunucma, MX|21.016|-89.877
Huixtla, MX|15.139|-92.463
Ciudad de Huitzuco, MX|18.306|-99.334
Huimanguillo, MX|17.835|-93.389
Huejutla de Reyes, MX|21.140|-98.419
Huejotzingo, MX|19.159|-98.408
Huauchinango, MX|20.174|-98.055
Huatusco, MX|19.149|-96.968
Ciudad de Huajuapan de Leon, MX|17.808|-97.780
Comalapa, MX|15.660|-92.141
Frontera, MX|18.543|-92.645
Fortin de las Flores, MX|18.908|-97.000
Felipe Carrillo Puerto, MX|19.578|-88.045
Escarcega, MX|18.609|-90.745
Emiliano Zapata, MX|18.841|-99.184
Emiliano Zapata, MX|17.741|-91.766
Ciudad Mante, MX|22.743|-98.972
Ecatepec de Morelos, MX|19.605|-99.061
Ebano, MX|22.218|-98.377
Cunduacan, MX|18.066|-93.173
Cuernavaca, MX|18.926|-99.231
Cuautlancingo, MX|19.090|-98.273
Cuautla, MX|18.813|-98.955
Cuautitlan, MX|19.671|-99.180
Cuautepec, MX|20.036|-98.310
Delegacion Cuajimalpa de Morelos, MX|19.369|-99.291
Cozumel, MX|20.500|-86.943
Coyotepec, MX|19.777|-99.213
Coyoacan, MX|19.347|-99.162
Cosoleacaque, MX|17.999|-94.636
Coscomatepec de Bravo, MX|19.073|-97.047
Cosamaloapan, MX|18.368|-95.799
Cordoba, MX|18.884|-96.926
Contla, MX|19.329|-98.166
Comitan, MX|16.240|-92.137
Comalcalco, MX|18.265|-93.224
Coatzintla, MX|20.487|-97.468
Coatzacoalcos, MX|18.149|-94.445
Coatepec, MX|19.452|-96.961
Coacalco, MX|19.629|-99.107
Ciudad Victoria, MX|23.741|-99.144
Ciudad Serdan, MX|18.989|-97.446
Fray Bernardino de Sahagun, MX|19.773|-98.582
Ciudad Nezahualcoyotl, MX|19.401|-99.015
Ciudad Miguel Aleman, MX|26.398|-99.029
Ciudad Mendoza, MX|18.806|-97.179
Ciudad Madero, MX|22.247|-97.837
Ciudad Fernandez, MX|21.940|-100.012
Mexico City, MX|19.428|-99.128
Ciudad del Carmen, MX|18.646|-91.830
Cintalapa de Figueroa, MX|16.684|-93.718
Cholula, MX|19.064|-98.304
Chilpancingo, MX|17.552|-99.501
Chilapa de Alvarez, MX|17.594|-99.177
Chignahuapan, MX|19.839|-98.032
Chiconcuac, MX|19.559|-98.899
Chicoloapan, MX|19.417|-98.902
Chichen-Itza, MX|20.667|-88.567
Chiapa de Corzo, MX|16.707|-93.012
Chetumal, MX|18.520|-88.304
Champoton, MX|19.342|-90.723
Chalco, MX|19.262|-98.898
Cerro Azul, MX|21.192|-97.741
Catemaco, MX|18.421|-95.114
Carlos A. Carrillo, MX|18.375|-95.754
Cardenas, MX|22.001|-99.642
Cardenas, MX|18.001|-93.376
Capulhuac de Mirafuentes, MX|19.194|-99.466
Cancun, MX|21.174|-86.847
Campeche, MX|19.841|-90.517
Calpulalpan, MX|19.589|-98.570
Cadereyta Jimenez, MX|25.591|-100.001
Cadereyta, MX|25.583|-99.983
Cacahoatan, MX|14.992|-92.164
Berriozabal, MX|16.799|-93.272
Banderilla, MX|19.589|-96.937
Azcapotzalco, MX|19.487|-99.186
Ayutla de los Libres, MX|16.965|-99.098
Axochiapan, MX|18.502|-98.753
Atlixco, MX|18.908|-98.436
Atlacomulco de Fabela, MX|19.799|-99.875
Ciudad Lopez Mateos, MX|19.558|-99.257
Apizaco, MX|19.413|-98.144
Apan, MX|19.711|-98.451
Amozoc de Mota, MX|19.046|-98.045
Amecameca, MX|19.124|-98.766
Alvarado, MX|18.771|-95.762
Altotonga, MX|19.766|-97.245
Altepexi, MX|18.370|-97.300
Altamira, MX|22.393|-97.939
Allende, MX|18.154|-94.394
Alamo, MX|20.912|-97.676
Ajalpan, MX|18.379|-97.259
Agua Dulce, MX|18.139|-94.145
Actopan, MX|20.269|-98.942
San Lorenzo Acopilco, MX|19.330|-99.327
Acayucan, MX|17.950|-94.914
Acatzingo, MX|18.982|-97.784
Acatlan de Osorio, MX|18.203|-98.049
Acapulco de Juarez, MX|16.849|-99.909
Acajete, MX|19.112|-97.952
San Antonio Acahualco, MX|19.274|-99.772
Valente Diaz, MX|19.163|-96.216
Santiago Tlacotepec, MX|19.227|-99.671
Tierra Blanca, MX|18.448|-96.359
Playas del Rosario, MX|17.853|-92.932
Rio de Teapa, MX|17.775|-92.902
Huamantla, MX|19.315|-97.925
La Magdalena Tlaltelulco, MX|19.283|-98.196
Zacatelco, MX|19.216|-98.240
Tlaxcala, MX|19.318|-98.238
Papalotla, MX|19.169|-98.204
Villa Vicente Guerrero, MX|19.121|-98.166
Tonala, MX|16.090|-93.755
Arriaga, MX|16.236|-93.900
San Mateo Huitzilzingo, MX|19.229|-98.925
San Martin Cuautlalpan, MX|19.276|-98.832
Tulantongo, MX|19.532|-98.875
Tezoyuca, MX|19.593|-98.911
Tepexpan, MX|19.614|-98.936
Santa Maria Ajoloapan, MX|19.764|-98.959
San Andres Cholula, MX|19.051|-98.295
Alto Lucero, MX|20.954|-97.442
Loma Bonita, MX|18.108|-95.881
Isla, MX|18.028|-95.529
San Andres Cuexcontitlan, MX|19.359|-99.622
San Mateo Otzacatipan, MX|19.333|-99.603
San Pedro Totoltepec, MX|19.311|-99.572
Santa Maria Totoltepec, MX|19.307|-99.593
San Francisco Cuaxusco, MX|19.268|-99.619
Benito Juarez, MX|19.398|-99.158
Venustiano Carranza, MX|19.444|-99.105
Miguel Hidalgo, MX|19.434|-99.200
Cuauhtemoc, MX|19.445|-99.146
Huixquilucan, MX|19.360|-99.350
Melchor Ocampo, MX|19.702|-99.145
Huilango, MX|19.681|-99.256
Santiago Teyahualco, MX|19.660|-99.125
Ojo de Agua, MX|19.680|-99.010
Buenavista, MX|19.608|-99.169
Miguel Aleman (La Doce), MX|28.840|-111.478
Gabriel Leyva Solano, MX|25.662|-108.637
Cihuatlan, MX|19.237|-104.565
Lazaro Cardenas, MX|30.527|-115.931
Santa Isabel, MX|32.631|-115.570
Ciudad Guadalupe Victoria, MX|32.289|-115.103
Zinapecuaro de Figueroa, MX|19.860|-100.827
Ixtapa-Zihuatanejo, MX|17.643|-101.552
Zapotlanejo, MX|20.623|-103.068
Zapotiltic, MX|19.627|-103.418
Zapopan, MX|20.721|-103.387
Zamora de Hidalgo, MX|19.984|-102.286
Zacoalco de Torres, MX|20.226|-103.570
Zacatecas, MX|22.768|-102.581
Zacapu, MX|19.815|-101.792
Yuriria, MX|20.211|-101.132
Yurecuaro, MX|20.340|-102.282
Villa Hidalgo, MX|21.676|-102.588
Villagran, MX|20.514|-100.996
Frontera, MX|26.928|-101.452
El Pueblito, MX|20.540|-100.441
Garcia, MX|25.801|-100.586
Ciudad de Villa de Alvarez, MX|19.267|-103.738
Valle de Santiago, MX|20.391|-101.191
Valle de Bravo, MX|19.195|-100.131
Uruapan, MX|19.417|-102.058
Uriangato, MX|20.142|-101.179
Tuzantla, MX|19.203|-100.567
Tuxpan, MX|21.942|-105.299
Tuxpan, MX|19.556|-103.376
Torreon, MX|25.544|-103.419
Tonala, MX|20.623|-103.242
Tlaquepaque, MX|20.641|-103.293
Tlajomulco de Zuniga, MX|20.474|-103.447
Tijuana, MX|32.503|-117.004
San Francisco Tesistan, MX|20.797|-103.477
Tequila, MX|20.882|-103.836
Tepic, MX|21.507|-104.893
Tepatitlan de Morelos, MX|20.817|-102.763
Tepalcatepec, MX|19.187|-102.847
Teocaltiche, MX|21.434|-102.574
Tejupilco de Hidalgo, MX|18.905|-100.153
Tecpan de Galeana, MX|17.223|-100.630
Tecoman, MX|18.916|-103.877
Tecate, MX|32.566|-116.632
Tangancicuaro de Arista, MX|19.887|-102.207
Tamazula de Gordiano, MX|19.680|-103.251
Tala, MX|20.653|-103.701
Tacambaro de Codallos, MX|19.236|-101.458
Sombrerete, MX|23.631|-103.641
Soledad de Graciano Sanchez, MX|22.189|-100.938
Silao de la Victoria, MX|20.944|-101.427
Sayula, MX|19.884|-103.601
Santiago Papasquiaro, MX|25.044|-105.419
Santiago Ixcuintla, MX|21.811|-105.208
Santiago, MX|25.426|-100.154
Santa Rosa Jauregui, MX|20.742|-100.448
Santa Catarina, MX|25.673|-100.458
Santa Anita, MX|20.550|-103.444
San Sebastian el Grande, MX|20.533|-103.429
San Pedro, MX|25.756|-102.984
San Pedro, MX|25.433|-103.217
San Nicolas de los Garza, MX|25.742|-100.302
San Miguel el Alto, MX|21.031|-102.402
San Miguel de Allende, MX|20.915|-100.744
San Luis Rio Colorado, MX|32.456|-114.770
San Luis Potosi, MX|22.152|-100.971
San Luis de la Paz, MX|21.298|-100.515
Cabo San Lucas, MX|22.891|-109.912
San Juan de los Lagos, MX|21.249|-102.330
San Jose Iturbide, MX|21.000|-100.386
San Jose del Castillo, MX|20.512|-103.237
San Jose del Cabo, MX|23.054|-109.704
San Francisco del Rincon, MX|21.019|-101.858
San Francisco de los Romo, MX|22.072|-102.272
San Felipe, MX|31.025|-114.842
San Felipe, MX|21.479|-101.216
Tlaltenango de Sanchez Roman, MX|21.781|-103.304
San Buenaventura, MX|27.062|-101.549
San Agustin, MX|20.548|-103.467
Salvatierra, MX|20.216|-100.882
Saltillo, MX|25.426|-100.980
Salinas de Hidalgo, MX|22.628|-101.714
Salamanca, MX|20.570|-101.198
Sahuayo de Morelos, MX|20.057|-102.716
Ciudad Sabinas Hidalgo, MX|26.502|-100.181
Sabinas, MX|27.856|-101.117
Rosarito, MX|32.360|-117.046
El Rosario, MX|22.990|-105.854
Romita, MX|20.872|-101.517
Rio Grande, MX|23.827|-103.034
Rincon de Romos, MX|22.229|-102.322
La Joya, MX|32.444|-117.004
Ramos Arizpe, MX|25.539|-100.947
Santiago de Queretaro, MX|20.588|-100.388
Puruandiro, MX|20.089|-101.516
Purisima de Bustos, MX|21.030|-101.878
Purepero de Echaiz, MX|19.910|-102.007
Puerto Vallarta, MX|20.617|-105.230
Puerto Penasco, MX|31.317|-113.538
Piedras Negras, MX|28.700|-100.524
Petatlan, MX|17.538|-101.269
Periban de Ramos, MX|19.520|-102.415
Penjamo, MX|20.431|-101.724
Patzcuaro, MX|19.513|-101.610
Parras de la Fuente, MX|25.442|-102.178
Paracho de Verduzco, MX|19.648|-102.048
Palau, MX|27.892|-101.423
Pabellon de Arteaga, MX|22.148|-102.279
Ojinaga, MX|29.567|-104.545
Ocotlan, MX|20.351|-102.768
Nuevo Mexico, MX|20.756|-103.443
Nuevo Casas Grandes, MX|30.416|-107.912
Nueva Rosita, MX|27.937|-101.217
Nueva Italia de Ruiz, MX|19.025|-102.093
Nochistlan de Mejia, MX|21.364|-102.848
Navolato, MX|24.767|-107.698
Navojoa, MX|27.071|-109.443
Nava, MX|28.421|-100.766
Moroleon, MX|20.130|-101.191
Morelia, MX|19.701|-101.184
Monterrey, MX|25.684|-100.317
Monclova, MX|26.907|-101.421
Mezcales, MX|20.730|-105.283
Mexicali, MX|32.628|-115.454
Pedro Meoqui, MX|28.268|-105.481
Ciudad Melchor Muzquiz, MX|27.879|-101.516
Medina, MX|21.150|-101.623
Mazatlan, MX|23.222|-106.419
Matehuala, MX|23.648|-100.643
Matamoros, MX|25.527|-103.228
Marfil, MX|20.998|-101.285
Maravatio de Ocampo, MX|19.892|-100.442
Manzanillo, MX|19.117|-104.342
Rodolfo Sanchez Taboada, MX|31.723|-116.572
Magdalena de Kino, MX|30.627|-110.962
Magdalena, MX|20.907|-103.977
Madera, MX|29.193|-108.143
Los Reyes de Salgado, MX|19.589|-102.473
Los Mochis, MX|25.791|-108.998
Loreto, MX|22.272|-101.986
Leon de los Aldama, MX|21.122|-101.683
Las Pintas de Arriba, MX|20.576|-103.324
La Piedad de Cabadas, MX|20.341|-102.023
La Paz, MX|24.142|-110.313
La Orilla, MX|17.996|-102.227
Lagos de Moreno, MX|21.359|-101.933
La Cruz, MX|23.921|-106.892
La Barca, MX|20.290|-102.542
Juventino Rosas, MX|20.643|-100.995
Ciudad Benito Juarez, MX|25.647|-100.091
Juan Aldama, MX|24.291|-103.393
Jocotepec, MX|20.286|-103.429
Jiquilpan de Juarez, MX|19.992|-102.718
Jesus Maria, MX|21.961|-102.343
Jerez de Garcia Salinas, MX|22.650|-102.990
Jaral del Progreso, MX|20.372|-101.064
Jamay, MX|20.295|-102.709
Jalostotitlan, MX|21.168|-102.461
Xalisco, MX|21.445|-104.900
Jacona de Plancarte, MX|19.956|-102.306
Ixtlan del Rio, MX|21.035|-104.369
Ixtapa, MX|20.716|-105.205
Irapuato, MX|20.671|-101.356
Huetamo de Nunez, MX|18.626|-100.900
Huatabampo, MX|26.826|-109.642
Hidalgo del Parral, MX|26.930|-105.666
Heroica Zitacuaro, MX|19.437|-100.356
Nogales, MX|31.309|-110.942
Heroica Caborca, MX|30.718|-112.158
Hermosillo, MX|29.089|-110.967
Heroica Guaymas, MX|27.920|-110.899
Guasave, MX|25.568|-108.469
Guanajuato, MX|21.019|-101.259
Guamuchil, MX|25.459|-108.077
Guadalupe Victoria, MX|24.447|-104.123
Guadalupe, MX|25.677|-100.259
Guadalupe, MX|22.747|-102.519
Guadalajara, MX|20.677|-103.347
Gomez Palacio, MX|25.569|-103.500
Vicente Guerrero, MX|23.733|-103.982
Juan Jose Rios, MX|25.757|-108.824
Ciudad General Escobedo, MX|25.797|-100.318
San Pedro Garza Garcia, MX|25.662|-100.403
Fresnillo, MX|23.175|-102.868
Francisco I. Madero, MX|25.773|-103.271
Escuinapa de Hidalgo, MX|22.835|-105.778
Ensenada, MX|31.871|-116.601
Encarnacion de Diaz, MX|21.526|-102.240
Empalme, MX|27.962|-110.814
El Salto, MX|23.778|-105.360
Pueblo Nuevo, MX|23.384|-105.371
El Salto, MX|20.519|-103.182
El Salto, MX|20.333|-104.500
San Jose del Quince, MX|20.542|-103.284
El Grullo, MX|19.807|-104.216
Puebla, MX|32.566|-115.354
Esperanza, MX|27.580|-109.931
Victoria de Durango, MX|24.020|-104.658
Culiacan, MX|24.802|-107.394
Cuauhtemoc, MX|28.406|-106.867
Coyula, MX|20.661|-103.228
Costa Rica, MX|24.591|-107.390
Cortazar, MX|20.483|-100.964
Compostela, MX|21.237|-104.901
Comonfort, MX|20.720|-100.761
Colima, MX|19.245|-103.713
Cocula, MX|20.365|-103.822
Coalcoman de Vazquez Pallares, MX|18.777|-103.160
Ciudad Obregon, MX|27.486|-109.941
Lerdo, MX|25.536|-103.525
Ciudad Juarez, MX|31.720|-106.461
Jose Mariano Jimenez, MX|27.131|-104.924
Ciudad Hidalgo, MX|19.690|-100.555
Ciudad Guzman, MX|19.704|-103.464
Ciudad Delicias, MX|28.190|-105.470
Ciudad Constitucion, MX|25.032|-111.663
Santa Rosalia de Camargo, MX|27.679|-105.172
Anahuac, MX|27.241|-100.133
Ciudad Altamirano, MX|18.357|-100.670
Ciudad Acuna, MX|29.323|-100.952
Cienega de Flores, MX|25.954|-100.166
Chihuahua, MX|28.635|-106.089
Chapala, MX|20.292|-103.190
Celaya, MX|20.522|-100.814
Castanos, MX|26.789|-101.432
Cananea, MX|30.984|-110.298
Calvillo, MX|21.846|-102.719
Victor Rosales, MX|22.949|-102.702
Bucerias, MX|20.758|-105.336
Autlan de Navarro, MX|19.772|-104.366
Atoyac de Alvarez, MX|17.207|-100.433
Atotonilco el Alto, MX|20.551|-102.508
Ciudad de Armeria, MX|18.937|-103.965
Ario de Rosales, MX|19.208|-101.709
Arcelia, MX|18.318|-100.282
Arandas, MX|20.706|-102.345
Ciudad Apodaca, MX|25.781|-100.189
Apatzingan, MX|19.089|-102.357
Apaseo el Grande, MX|20.546|-100.688
Apaseo el Alto, MX|20.456|-100.621
Ameca, MX|20.548|-104.046
Allende, MX|28.341|-100.851
Ciudad de Allende, MX|25.281|-100.019
Juan Aldama, MX|28.838|-105.912
Ahualulco de Mercado, MX|20.701|-103.975
Aguascalientes, MX|21.883|-102.284
Agua Prieta, MX|31.322|-109.543
Acaponeta, MX|22.490|-105.361
Acambaro, MX|20.032|-100.724
Abasolo, MX|20.450|-101.530
Hidalgo, MX|25.972|-100.452
Dolores Hidalgo, MX|21.156|-100.933
Las Guacamayas, MX|18.019|-102.210
Ciudad Lazaro Cardenas, MX|17.963|-102.199
San Jose del Valle, MX|20.764|-105.228
Benito Juarez, MX|19.373|-99.156
Colonia del Valle, MX|19.386|-99.162
Colonia Lindavista, MX|19.492|-99.125
Colonia Nativitas, MX|19.381|-99.137
Las Delicias, MX|32.409|-116.944
Hacienda Santa Fe, MX|20.518|-103.381
Fuentes del Valle, MX|19.633|-99.139
San Salvador Tizatlalli, MX|19.260|-99.591
Jardines de la Silla, MX|25.629|-100.188
San Buenaventura, MX|19.302|-98.863
Santa Teresa, MX|19.845|-99.233
San Jeronimo Cuatro Vientos, MX|19.293|-98.842
San Martin Azcatepec, MX|19.687|-98.973
Fraccionamiento Real Palmas, MX|25.904|-100.160
Porticos de San Antonio, MX|32.443|-117.034
San Isidro, MX|19.340|-98.951
Centro Familiar la Soledad, MX|21.135|-101.750
San Jose Guadalupe Otzacatipan, MX|19.345|-99.592
Las Pintitas, MX|20.564|-103.302
Emiliano Zapata, MX|19.344|-98.975
San Antonio Tecomitl, MX|19.218|-98.988
Licenciado Benito Juarez, MX|24.657|-107.545
Teotihuacan de Arista, MX|19.690|-98.861
Jesus del Monte, MX|19.375|-99.294
San Jorge Pueblo Nuevo, MX|19.254|-99.628
Manuel Ojinaga, MX|29.564|-104.416
Terrazas del Valle, MX|32.487|-116.827
La Ermita, MX|21.152|-101.733
Lomas del Sur, MX|20.492|-103.418
Parque Industrial Ciudad Mitras, MX|25.789|-100.448
Mitras Poniente, MX|25.776|-100.426
Villa del Prado 2da Seccion, MX|32.424|-116.972
Tres de Mayo, MX|18.869|-99.208
Don Antonio, MX|19.874|-98.935
Casa Blanca, MX|19.042|-98.119
La Providencia Siglo XXI, MX|20.064|-98.717
Ampliacion San Mateo, MX|19.616|-99.147
Fraccionamiento Ciudad Olmeca, MX|18.151|-94.552
San Rafael Tlanalapan, MX|19.292|-98.468
Tecamac de Felipe Villanueva, MX|19.713|-98.968
Venceremos, MX|20.551|-100.398
Alborada Jaltenco, MX|19.662|-99.069
Crucecita, MX|15.769|-96.135
San Jose de los Olvera, MX|20.553|-100.415
Colonia del Sol, MX|22.913|-109.927
Tres Valles, MX|18.239|-96.136
Kuah, MY|6.326|99.843
Jerantut, MY|3.936|102.363
Maran, MY|3.586|102.773
Raub, MY|3.790|101.857
Bentung, MY|3.532|101.904
Tanjong Malim, MY|3.681|101.520
Kuala Kubu Baharu, MY|3.564|101.658
Parit Sulung, MY|1.976|102.883
Batu Pahat, MY|1.855|102.933
Parit Raja, MY|1.868|103.112
Simpang Renggam, MY|1.825|103.311
Pekan Nenas, MY|1.510|103.514
Pontian Besar, MY|1.506|103.382
Kampung Pasir Gudang Baru, MY|1.473|103.878
Pasir Gudang, MY|1.462|103.905
Kampung Larkin Lama, MY|1.502|103.744
Kampung Sedenak, MY|1.711|103.528
Kota Tinggi, MY|1.738|103.900
Taman Senai, MY|1.601|103.642
Kulai, MY|1.656|103.603
Skudai, MY|1.537|103.658
Kempas, MY|1.549|103.697
Pelentong, MY|1.524|103.824
Masai, MY|1.491|103.879
Johor Bahru, MY|1.466|103.758
Gelang Patah, MY|1.448|103.587
Pengerang, MY|1.365|104.112
Kluang, MY|2.030|103.317
Yong Peng, MY|2.014|103.066
Mersing, MY|2.431|103.841
Segamat, MY|2.515|102.816
Tangkak, MY|2.267|102.545
Gerisek, MY|2.210|102.710
Pagoh, MY|2.150|102.770
Muar, MY|2.044|102.569
Bakri, MY|2.044|102.653
Labis, MY|2.385|103.021
Kuala Selangor, MY|3.350|101.250
Batang Berjuntai, MY|3.383|101.417
Batu Arang, MY|3.317|101.467
Kapar, MY|3.133|101.383
Shah Alam, MY|3.085|101.533
Klang, MY|3.037|101.443
Cangkat Jong, MY|3.985|101.124
Sungkai, MY|4.000|101.317
Cukai, MY|4.250|103.417
Kuala Lipis, MY|4.184|102.047
Val Dor, MY|5.252|100.490
Papar, MY|5.733|115.933
Kuala Penyu, MY|5.571|115.598
Kota Kinabalu, MY|5.975|116.072
Donggongon, MY|5.907|116.101
Putatan, MY|5.926|116.061
Kinarut, MY|5.823|116.047
Tambunan, MY|5.717|116.400
Ranau, MY|5.954|116.664
Semporna, MY|4.482|118.611
Labuan, MY|5.280|115.248
Sipitang, MY|5.079|115.550
Beaufort, MY|5.347|115.746
Lahad Datu, MY|5.023|118.329
Sandakan, MY|5.840|118.118
Keningau, MY|5.338|116.160
Bandar Nabawan, MY|5.039|116.427
Tawau, MY|4.245|117.891
Dungun, MY|4.775|103.416
Paka, MY|4.637|103.437
Kertih, MY|4.514|103.448
Gerik, MY|5.417|101.133
Lunas, MY|5.431|100.530
Kulim, MY|5.365|100.562
Selama, MY|5.224|100.693
Bandar Baharu, MY|5.134|100.495
Bagan Serai, MY|5.011|100.541
Padang Serai, MY|5.513|100.554
Bedong, MY|5.727|100.509
Kampung Kupang, MY|5.636|100.845
Pulai, MY|5.655|100.895
Kampung Jeli, MY|5.700|101.833
Siburan, MY|1.367|110.400
Tebedu, MY|1.027|110.363
Bau, MY|1.417|110.150
Simpang Empat, MY|4.950|100.633
Kamunting, MY|4.883|100.733
Batu Kurau, MY|4.967|100.800
Taiping, MY|4.850|100.733
Padang Rengas, MY|4.767|100.850
Kuala Kangsar, MY|4.767|100.933
Chemor, MY|4.721|101.119
Ipoh, MY|4.584|101.083
Lahat, MY|4.539|101.037
Gua Musang, MY|4.884|101.969
Kuala Terengganu, MY|5.330|103.141
Marang, MY|5.206|103.206
Kampung Teluk Kemang, MY|2.461|101.860
Tampin, MY|2.470|102.230
Alor Gajah, MY|2.380|102.209
Durian Tunggal, MY|2.312|102.281
Kampung Ayer Keroh, MY|2.265|102.280
Sungai Udang, MY|2.269|102.143
Malacca, MY|2.196|102.240
Merlimau, MY|2.145|102.425
Teluk Panglima Garang, MY|2.908|101.469
Pelabuhan Klang, MY|3.000|101.393
Banting, MY|2.814|101.502
Jenjarum, MY|2.872|101.495
Bangi, MY|2.900|101.783
Semenyih, MY|2.952|101.843
Seremban, MY|2.730|101.938
Port Dickson, MY|2.525|101.797
Sepang, MY|2.693|101.750
Taman Senawang Indah, MY|2.691|101.989
Bahau, MY|2.808|102.405
Kuala Pilah, MY|2.739|102.249
Rembau, MY|2.590|102.091
Batu Anam, MY|2.583|102.711
Rompin, MY|2.708|102.505
Gemas, MY|2.583|102.612
Pekan, MY|3.484|103.400
Mentakab, MY|3.485|102.348
Temerluh, MY|3.451|102.418
Kampung Teluk Air Tawar, MY|5.483|100.383
Batu Feringgi, MY|5.471|100.245
Butterworth, MY|5.399|100.364
Perai, MY|5.383|100.383
Bukit Mertajam, MY|5.363|100.467
Nibong Tebal, MY|5.166|100.478
Parit Buntar, MY|5.127|100.493
Kuala Kurau, MY|5.018|100.428
Tasek Glugor, MY|5.480|100.498
Balik Pulau, MY|5.349|100.239
Bayan Lepas, MY|5.300|100.261
George Town, MY|5.411|100.335
Hulu Yam Lama, MY|3.454|101.641
Serendah, MY|3.365|101.604
Rawang, MY|3.321|101.577
Sungai Buloh, MY|3.210|101.561
Petaling Jaya, MY|3.107|101.607
Kuala Lumpur, MY|3.141|101.687
Setapak, MY|3.207|101.727
Batu Caves, MY|3.238|101.682
Ampang, MY|3.150|101.767
Hulu Langat, MY|3.114|101.814
Hutan Melintang, MY|3.877|100.933
Sungai Besar, MY|3.675|100.987
Kuantan, MY|3.808|103.326
Sungai Siput, MY|4.394|101.195
Batu Gajah, MY|4.469|101.041
Kampar, MY|4.300|101.150
Tapah Road, MY|4.167|101.200
Bidur, MY|4.117|101.283
Mukah, MY|2.894|112.091
Tatau, MY|2.883|112.850
Parit, MY|4.483|100.917
Lumut, MY|4.232|100.630
Sitiawan, MY|4.217|100.700
Teluk Intan, MY|4.022|101.021
Gurun, MY|5.817|100.474
Yan Besar, MY|5.799|100.373
Sungai Petani, MY|5.647|100.488
Kepala Batas, MY|5.517|100.427
Pasir Puteh, MY|5.833|102.400
Tanah Merah, MY|5.800|102.150
Kuala Krai, MY|5.531|102.199
Kuching, MY|1.550|110.333
Simunjan, MY|1.383|110.750
Sri Aman, MY|1.247|111.453
Sarikei, MY|2.117|111.517
Maradong, MY|2.083|111.617
Julau, MY|2.017|111.917
Sibu, MY|2.300|111.817
Pakan, MY|1.883|111.683
Kangar, MY|6.441|100.199
Changloon, MY|6.434|100.431
Jitra, MY|6.268|100.422
Kuala Kedah, MY|6.100|100.300
Alor Setar, MY|6.121|100.360
Tokai, MY|6.029|100.407
Pokok Sena, MY|6.171|100.519
Wakaf Baharu, MY|6.117|102.200
Pasir Mas, MY|6.049|102.140
Kota Bharu, MY|6.124|102.243
Kudat, MY|6.887|116.824
Saratok, MY|1.733|111.333
Daro, MY|2.517|111.430
Engkilili, MY|1.139|111.667
Betong, MY|1.400|111.517
Dalat, MY|2.667|112.083
Kanowit, MY|2.100|112.150
Lundu, MY|1.674|109.852
Kapit, MY|1.995|112.933
Niah, MY|3.862|113.715
Belaga, MY|2.700|113.783
Bintulu, MY|3.167|113.033
Sebauh, MY|3.117|113.267
Lawas, MY|4.860|115.409
Limbang, MY|4.755|115.010
Marudi, MY|4.183|114.317
Beluru, MY|3.983|114.100
Miri, MY|4.399|113.992
Ulu Tiram, MY|1.600|103.817
Ulu Kelang, MY|3.180|101.773
Tanjung Sepat, MY|2.658|101.563
Sungai Lalang, MY|5.700|100.514
Sungai Dua, MY|5.443|100.430
Seri Kembangan, MY|3.033|101.717
Serian, MY|1.167|110.567
Seputeh, MY|3.117|101.683
Sentul, MY|3.183|101.683
Relau, MY|5.331|100.283
Puchong, MY|3.000|101.617
Permatang Kuching, MY|5.463|100.381
Peringat, MY|6.033|102.283
Ladang Seri Kundang, MY|3.286|101.519
Pantai Remis, MY|4.456|100.629
Padang Besar, MY|6.383|100.300
Lukut, MY|2.570|101.833
Kubang Semang, MY|5.404|100.457
Kuang, MY|3.259|101.554
Kuala Ketil, MY|5.600|100.650
Kepong, MY|3.214|101.640
Klebang Besar, MY|2.219|102.200
Kampung Kangkar Teberau, MY|1.532|103.755
Kampung Tanjung Minyak, MY|2.267|102.200
Kampung Tanjung Karang, MY|3.424|101.185
Kampung Sungai Kajang, MY|3.416|101.173
Kampung Sungai Glugur, MY|5.370|100.314
Kampung Sungai Ara, MY|5.327|100.273
Kampung Simpang Renggam, MY|1.828|103.300
Kampong Sidam, MY|5.533|100.567
Kampung Selang, MY|2.350|102.876
Pendang, MY|5.995|100.479
Kampong Pangkal Kalong, MY|5.917|102.217
Kampung Minyak Beku, MY|1.795|102.897
Kampong Masjid Tanah, MY|2.350|102.117
Kampung Machap Baru, MY|2.383|102.331
Kampung Kerubong, MY|2.296|102.254
Kampong Kadok, MY|6.000|102.250
Ijok, MY|3.317|101.400
Kampong Dungun, MY|3.217|101.317
Kampung Cheng, MY|2.264|102.218
Kampung Bukit Baharu, MY|2.215|102.285
Kampung Baru Subang, MY|3.150|101.533
Kampung Baharu Nilai, MY|2.803|101.797
Kampong Baharu Cheras Batu Sebelas, MY|3.050|101.767
Kampung Baru Balakong, MY|3.029|101.747
Kampung Ayer Molek, MY|2.214|102.328
Anak Bukit, MY|6.184|100.378
Jelutong, MY|5.390|100.319
Jawi, MY|5.215|100.492
Cheras, MY|3.108|101.726
Bukit Tengah, MY|5.346|100.439
Bukit Tambun, MY|5.272|100.460
Bukit Rambai, MY|2.259|102.184
Bukit Gambir, MY|2.211|102.655
Kampung Bertam Ulu, MY|2.290|102.193
Bentong Town, MY|3.522|101.909
Kampung Batu Empat, MY|1.776|103.874
Batu Berendam, MY|2.249|102.246
Ayer Itam, MY|5.402|100.278
Kampung Teluk Kumbar, MY|5.289|100.247
Putrajaya, MY|2.935|101.691
Kampung Baru Ulu Melaka, MY|6.352|99.788
Sik, MY|5.833|100.750
Kampung Alor Mengkudu, MY|6.088|100.392
Kampung Hutan Arau, MY|6.429|100.282
Glugor, MY|5.372|100.307
Teloi Kanan, MY|5.717|100.658
Kota Kuala Muda, MY|5.588|100.371
Cyberjaya, MY|2.923|101.657
Bandar Labuan, MY|5.283|115.254
Bercham, MY|4.641|101.139
Kampung Manjoi, MY|4.619|101.069
Kampung Perak, MY|3.868|102.586
Bandar Tenggara, MY|1.870|103.616
Johor Jaya, MY|1.539|103.809
Taman Permas Jaya, MY|1.511|103.820
Kawasan Penempatan Ulu Sungai Benut, MY|1.754|103.280
Kawasan Penempatan Ulu Benut Tiga, MY|1.750|103.277
Kawasan Penempatan Ulu Benut Lima, MY|1.744|103.321
Bandar Tun Razak, MY|2.903|102.888
Sri Petaling, MY|3.069|101.690
Seri Manjung, MY|4.199|100.670
Selayang Baru Utara, MY|3.255|101.667
Taman Seremban Jaya, MY|2.683|101.970
Kawasan Perindustrian Cheng, MY|2.262|102.232
Taman Pelangi, MY|2.428|102.680
Taman Universiti, MY|1.533|103.615
Kampung Jelutong Tengah, MY|1.471|103.567
Subang Jaya, MY|3.044|101.581
Iskandar Puteri, MY|1.393|103.623
Putra Heights, MY|2.994|101.573
Kajang, MY|2.994|101.789
Bukit Bintang, MY|3.147|101.710
Bandar Sunway, MY|3.069|101.607
Bandar Puncak Alam, MY|3.239|101.428
Kota Damansara, MY|3.155|101.580
Damansara Damai, MY|3.199|101.592
Kuala Nerus, MY|5.373|103.021
Bandar Sri Damansara, MY|3.190|101.611
Selangau, MY|2.525|112.325
Taman Petaling, MY|3.199|101.650
Elmina, MY|3.185|101.525
Denai Alam, MY|3.160|101.515
Tropicana Indah, MY|3.142|101.591
Taman Greenwood, MY|3.232|101.705
Taman Melati, MY|3.221|101.723
Ara Damansara, MY|3.119|101.587
Desa Parkcity, MY|3.186|101.629
Kampung Setia, MY|3.242|101.533
Mont Kiara, MY|3.169|101.651
Taman OUG, MY|3.073|101.676
Taman Tun Dr Ismail, MY|3.145|101.626
Bangsar, MY|3.129|101.670
Seremban 2, MY|2.690|101.908
Bukit Indah, MY|1.480|103.660
Wangsa Maju, MY|3.201|101.740
Seminyih, MY|2.948|101.847
Kuchai Lama, MY|3.085|101.691
Bukit Gemuroh, MY|5.298|100.211
Taman Melawati, MY|3.211|101.748
Perling, MY|1.481|103.684
Mukim Pulai, MY|1.533|103.667
Bandar Mahkota Cheras, MY|3.054|101.798
Paya Terubong, MY|5.373|100.280
Bandar Tun Hussein Onn, MY|3.055|101.759
Bukit Beruntung, MY|3.416|101.557
Sibu Jaya, MY|2.240|111.971
Petagas, MY|5.912|116.050
Setia Alam, MY|3.102|101.456
Taman Sri Sinar, MY|3.187|101.651
Bandar Kinrara, MY|3.049|101.642
Bandar Bukit Raja, MY|3.087|101.433
Pandamaran, MY|3.011|101.421
Bandar Sri Sendayan, MY|2.674|101.872
Bandar Country Homes, MY|3.328|101.531
Alam Damai, MY|3.060|101.741
SS2, MY|3.120|101.622
Sungai Jawi, MY|5.198|100.492
Bandar Saujana Utama, MY|3.207|101.477
Bukit Rahman Putra, MY|3.217|101.561
Setia Tropika, MY|1.546|103.718
Bandar Tasik Puteri, MY|3.285|101.474
Desa Petaling, MY|3.084|101.709
Bukit Kerinchi, MY|3.106|101.668
Titiwangsa, MY|3.178|101.703
Horizon Hills, MY|1.458|103.646
Bandar Putra Kulai, MY|1.650|103.627
Taman Scientex, MY|1.512|103.917
Bandar Seri Alam, MY|1.504|103.875
FELDA Chini, MY|3.375|102.943
Bandar Baru Salak Tinggi, MY|2.812|101.736
Bandar Utama, MY|3.148|101.614
Bukit Jalil, MY|3.049|101.680
Taman Desa, MY|3.106|101.687
Xai-Xai, MZ|-25.052|33.644
Gorongosa, MZ|-18.676|34.073
Vilankulo, MZ|-22.000|35.317
Moatize, MZ|-16.115|33.729
Nhamatanda, MZ|-19.269|34.213
Caia, MZ|-17.820|35.344
Mocuba, MZ|-16.837|36.986
Dondo, MZ|-19.609|34.743
Chinde, MZ|-18.581|36.459
Mocimboa da Praia, MZ|-11.352|40.352
Macia, MZ|-25.027|33.099
Maganja, MZ|-17.312|37.508
Ulongue, MZ|-14.723|34.361
Tete, MZ|-16.156|33.587
Songo, MZ|-15.596|32.765
Ressano Garcia, MZ|-25.443|31.995
Quelimane, MZ|-17.879|36.888
Pemba, MZ|-12.974|40.518
Pebane, MZ|-17.264|38.135
Nampula, MZ|-15.116|39.267
Namialo, MZ|-14.921|39.984
Nametil, MZ|-15.720|39.343
Namacurra, MZ|-17.492|37.029
Nacala, MZ|-14.563|40.685
Murrupula, MZ|-15.457|38.677
Mueda, MZ|-11.663|39.551
Mossuril, MZ|-14.968|40.664
Morrumbala, MZ|-17.327|35.584
Montepuez, MZ|-13.126|39.000
Monapo, MZ|-14.917|40.302
Mocimboa, MZ|-11.317|40.350
Mozambique, MZ|-15.035|40.734
Milange, MZ|-16.099|35.770
Micolene, MZ|-16.733|39.233
Maxixe, MZ|-23.860|35.347
Matola, MZ|-25.962|32.459
Massinga, MZ|-23.329|35.381
Marromeu, MZ|-18.291|35.945
Maputo, MZ|-25.966|32.583
Manica, MZ|-18.934|32.876
Manhica, MZ|-25.402|32.807
Mandimba, MZ|-14.352|35.651
Macomia, MZ|-12.247|40.121
Lichinga, MZ|-13.313|35.241
Inhambane, MZ|-23.865|35.383
Gurue, MZ|-15.467|36.978
Gondola, MZ|-19.088|33.649
Cuamba, MZ|-14.803|36.537
Chokwe, MZ|-24.533|32.983
Chiure, MZ|-13.383|39.782
Chimoio, MZ|-19.116|33.483
Chibuto, MZ|-24.687|33.531
Catandica, MZ|-18.058|33.174
Boane, MZ|-26.042|32.330
Beira, MZ|-19.844|34.839
Angoche, MZ|-16.233|39.909
Alto Molocue, MZ|-15.636|37.688
Mutuali, MZ|-14.871|37.004
Iapala, MZ|-15.025|38.042
Machipanda, MZ|-18.986|32.736
Namapa-erati, MZ|-13.713|39.832
Buzi, MZ|-19.864|34.467
Malema, MZ|-14.947|37.416
Messica, MZ|-18.992|33.082
Ribaue, MZ|-14.945|38.324
Xilembene, MZ|-24.689|33.258
Ndiyona, NA|-18.039|20.701
Katima Mulilo, NA|-17.505|24.276
Windhoek, NA|-22.559|17.083
Tsumeb, NA|-19.248|17.713
Swakopmund, NA|-22.678|14.527
Rundu, NA|-17.918|19.773
Rehoboth, NA|-23.317|17.090
Otjiwarongo, NA|-20.464|16.648
Oshakati, NA|-17.788|15.704
Ongwediva, NA|-17.772|15.766
Ondangwa, NA|-17.908|15.980
Okahandja, NA|-21.981|16.903
Luderitz, NA|-26.648|15.154
Keetmanshoop, NA|-26.577|18.134
Katutura, NA|-22.523|17.060
Grootfontein, NA|-19.573|18.100
Gobabis, NA|-22.453|18.972
Walvis Bay, NA|-22.957|14.505
Helao Nafidi, NA|-17.393|15.891
Noumea, NC|-22.274|166.449
Mont-Dore, NC|-22.263|166.566
Dumbea, NC|-22.158|166.457
Birnin Gaoure, NE|13.082|2.911
Birni N Konni, NE|13.796|5.250
Zinder, NE|13.807|8.988
Youri Kourtere, NE|13.334|2.248
Torodi, NE|13.119|1.799
Tillaberi, NE|14.207|1.454
Tibiri, NE|13.563|7.048
Tessaoua, NE|13.757|7.987
Tera, NE|14.008|0.753
Tchin Tabaraden, NE|15.897|5.798
Tanout, NE|14.971|8.888
Tahoua, NE|14.889|5.269
Say, NE|13.101|2.369
Niamey, NE|13.514|2.110
Nguigmi, NE|14.250|13.109
Mirriah, NE|13.707|9.150
Mehana, NE|14.394|1.134
Mayahi, NE|13.955|7.671
Matamey, NE|13.423|8.475
Maradi, NE|13.500|7.102
Maine Soroa, NE|13.211|12.024
Magaria, NE|12.998|8.910
Madarounfa, NE|13.309|7.156
Madaoua, NE|14.073|5.960
Kollo, NE|13.304|2.339
Illela, NE|14.460|5.244
Guidan Roumdji, NE|13.658|6.696
Goure, NE|13.983|10.270
Gazaoua, NE|13.526|7.914
Gaya, NE|11.884|3.449
Filingue, NE|14.352|3.317
Dosso, NE|13.049|3.194
Dogondoutchi, NE|13.640|4.026
Diffa, NE|13.315|12.611
Dakoro, NE|14.511|6.765
Baleyara, NE|13.784|2.952
Ayorou, NE|14.731|0.917
Arlit, NE|18.737|7.385
Alaghsas, NE|17.019|8.017
Aguie, NE|13.506|7.779
Agadez, NE|16.973|7.991
Abalak, NE|15.451|6.279
Kingston, NF|-29.055|167.966
Zuru, NG|11.435|5.235
Zungeru, NG|9.807|6.152
Zaria, NG|11.111|7.723
Yola, NG|9.208|12.481
Yenagoa, NG|4.927|6.268
Wukari, NG|7.871|9.778
Wudil, NG|11.809|8.844
Warri, NG|5.517|5.750
Wamba, NG|8.942|8.603
Uyo, NG|5.051|7.934
Uromi, NG|6.700|6.333
Umuahia, NG|5.525|7.495
Ughelli, NG|5.490|6.004
Ugep, NG|5.809|8.081
Uga, NG|5.936|7.079
Ubiaja, NG|6.656|6.385
Tegina, NG|10.071|6.191
Tambuwal, NG|12.406|4.646
Talata Mafara, NG|12.568|6.062
Takum, NG|7.267|9.983
Surulere, NG|6.502|3.358
Suleja, NG|9.181|7.179
Sokoto, NG|13.063|5.243
Soba, NG|10.981|8.057
Shomolu, NG|6.539|3.374
Saki, NG|8.668|3.394
Shagamu, NG|6.848|3.646
Sapele, NG|5.894|5.677
Rijau, NG|11.104|5.256
Rano, NG|11.557|8.581
Potiskum, NG|11.714|11.081
Port Harcourt, NG|4.777|7.013
Pindiga, NG|9.984|10.952
Patigi, NG|8.729|5.756
Pankshin, NG|9.325|9.435
Ozubulu, NG|5.958|6.853
Oyo, NG|7.854|3.932
Oyan, NG|8.050|4.767
Owo, NG|7.196|5.587
Owerri, NG|5.484|7.033
Otukpa, NG|7.102|7.659
Ota, NG|6.689|3.232
Otan Ayegbaju, NG|7.948|4.788
Osogbo, NG|7.771|4.557
Oshodi, NG|6.555|3.344
Orita-Eruwa, NG|7.556|3.441
Onitsha, NG|6.150|6.786
Ondo, NG|7.093|4.835
Olupona, NG|7.600|4.193
Okuta, NG|9.219|3.201
Okrika, NG|4.742|7.084
Okigwe, NG|5.829|7.351
Okene, NG|7.551|6.236
Oke Mesi, NG|7.817|4.917
Oke Ila, NG|7.950|4.983
Ohafia-Ifigh, NG|5.615|7.812
Ogwashi-Uku, NG|6.178|6.525
Oguta, NG|5.710|6.809
Ogoja, NG|6.658|8.799
Ogbomoso, NG|8.134|4.240
Ogaminana, NG|7.594|6.218
Offa, NG|8.149|4.721
Ode, NG|7.790|5.712
Obudu, NG|6.668|9.165
Obonoma, NG|4.711|6.791
Numan, NG|9.464|12.031
Nsukka, NG|6.858|7.396
Nnewi, NG|6.020|6.917
Nkwerre, NG|5.759|7.104
Nkpor, NG|6.150|6.830
Nguru, NG|12.877|10.455
Nasarawa, NG|8.539|7.708
Nafada, NG|11.096|11.333
Mushin, NG|6.528|3.354
Mubi, NG|10.269|13.267
Moriki, NG|12.874|6.488
Monguno, NG|12.671|13.612
Mokwa, NG|9.295|5.054
Modakeke, NG|7.383|4.260
Minna, NG|9.615|6.548
Marte, NG|12.365|13.829
Malumfashi, NG|11.789|7.621
Makurdi, NG|7.734|8.521
Makoko, NG|6.496|3.388
Maiduguri, NG|11.847|13.157
Magumeri, NG|12.115|12.826
Lokoja, NG|7.797|6.740
Lere, NG|10.386|8.573
Lapai, NG|9.044|6.571
Lalupon, NG|7.468|4.066
Lagos, NG|6.454|3.395
Lafiagi, NG|8.853|5.416
Lafia, NG|8.494|8.515
Kwale, NG|5.708|6.434
Kumo, NG|10.048|11.211
Kumagunnam, NG|13.155|10.635
Kukawa, NG|12.925|13.566
Kuje, NG|8.880|7.228
Kontagora, NG|10.403|5.471
Kiyawa, NG|11.784|9.607
Kisi, NG|9.083|3.852
Keffi, NG|8.847|7.874
Kaura Namoda, NG|12.594|6.586
Katsina-Ala, NG|7.169|9.285
Katsina, NG|12.991|7.602
Kari, NG|11.247|10.561
Kano, NG|12.000|8.517
Kamba, NG|11.852|3.655
Kaiama, NG|9.605|3.941
Kagoro, NG|9.608|8.390
Kafanchan, NG|9.581|8.293
Kaduna, NG|10.526|7.439
Kachia, NG|9.873|7.954
Kabba, NG|7.827|6.075
Jos, NG|9.928|8.892
Jimeta, NG|9.279|12.458
Jega, NG|12.223|4.380
Jebba, NG|9.120|4.824
Jalingo, NG|8.894|11.360
Iyesi, NG|6.661|3.180
Iwo, NG|7.635|4.182
Itu, NG|5.201|7.984
Isieke, NG|6.382|8.037
Iseyin, NG|7.970|3.596
Ise-Ekiti, NG|7.465|5.423
Isanlu-Itedoijowa, NG|8.273|5.835
Irewe, NG|6.417|3.141
Ipoti, NG|7.874|5.077
Iperu, NG|6.910|3.666
Inisa, NG|7.849|4.330
Ilorin, NG|8.497|4.542
Ilobu, NG|7.839|4.487
Illela, NG|13.731|5.298
Ilesa, NG|7.628|4.742
Ilaro, NG|6.889|3.014
Ila Orangun, NG|8.017|4.904
Ikot Ekpene, NG|5.182|7.715
Ikom, NG|5.967|8.706
Ikirun, NG|7.913|4.667
Ikire, NG|7.370|4.186
Ikere-Ekiti, NG|7.497|5.230
Ikeja, NG|6.597|3.342
Ikare, NG|7.526|5.753
River Atuwara, NG|6.682|3.143
Ijoko, NG|6.742|3.262
Ijero-Ekiti, NG|7.815|5.067
Ijebu Ode, NG|6.819|3.917
Ijebu-Jesa, NG|7.683|4.818
Ijebu-Igbo, NG|6.972|3.999
Ihiala, NG|5.855|6.859
Igede-Ekiti, NG|7.668|5.126
Igbo-Ukwu, NG|6.018|7.020
Igbor, NG|7.451|8.608
Igbo-Ora, NG|7.434|3.288
Igboho, NG|8.838|3.756
Igbeti, NG|8.749|4.131
Igbara-Odo, NG|7.503|5.063
Igangan, NG|7.681|3.184
Ifo, NG|6.815|3.195
Ile-Ife, NG|7.482|4.560
Idanre, NG|7.113|5.116
Idah, NG|7.113|6.739
Ibi, NG|8.181|9.744
Ibeto, NG|10.485|5.145
Ibadan, NG|7.378|3.906
Hadejia, NG|12.453|10.041
Gwoza, NG|11.083|13.696
Gwarzo, NG|11.916|7.934
Gwaram, NG|11.277|9.884
Gwadabawa, NG|13.358|5.238
Gusau, NG|12.170|6.664
Gummi, NG|12.145|5.118
Gumel, NG|12.627|9.388
Gombi, NG|10.168|12.737
Gombe, NG|10.290|11.167
Gembu, NG|6.726|11.257
Geidam, NG|12.894|11.926
Gbongan, NG|7.477|4.354
Gboko, NG|7.323|9.001
Gaya, NG|11.861|9.003
Gashua, NG|12.874|11.041
Garko, NG|10.175|11.165
Ganye, NG|8.435|12.051
Gamboru, NG|12.373|14.207
Funtua, NG|11.524|7.312
Fiditi, NG|7.714|3.917
Ezza-Ohu, NG|6.441|8.084
Esuk Oron, NG|4.803|8.253
Eruwa, NG|7.539|3.425
Epe, NG|6.584|3.983
Enugu-Ukwu, NG|6.171|7.005
Enugu-Ezike, NG|6.983|7.455
Enugu, NG|6.441|7.499
Emure-Ekiti, NG|7.436|5.459
Elele, NG|5.101|6.814
Ekpoma, NG|6.743|6.140
Eket, NG|4.642|7.924
Ejigbo, NG|7.903|4.314
Eha Amufu, NG|6.659|7.760
Egbe, NG|8.219|5.508
Efon-Alaaye, NG|7.656|4.922
Effium, NG|6.631|8.058
Ede, NG|7.736|4.435
Ebute Ikorodu, NG|6.601|3.488
Dutsen Wai, NG|10.850|8.199
Dutse, NG|11.756|9.339
Dukku, NG|10.824|10.772
Doma, NG|8.393|8.355
Dikwa, NG|12.036|13.918
Deba, NG|10.212|11.387
Daura, NG|13.033|8.324
Daura, NG|11.554|11.406
Darazo, NG|10.999|10.411
Damboa, NG|11.155|12.756
Damaturu, NG|11.747|11.961
Calabar, NG|4.959|8.327
Burutu, NG|5.353|5.508
Bukuru, NG|9.794|8.864
Buguma, NG|4.736|6.862
Bonny, NG|4.452|7.171
Bode Saadu, NG|8.939|4.782
Biu, NG|10.613|12.195
Birnin Kudu, NG|11.452|9.479
Birnin Kebbi, NG|12.454|4.197
Sofo-Birnin-Gwari, NG|11.015|6.780
Biliri, NG|9.867|11.226
Bida, NG|9.080|6.010
Benin City, NG|6.338|5.626
Bende, NG|5.559|7.634
Beli, NG|7.859|10.972
Bauchi, NG|10.310|9.844
Baro, NG|8.616|6.418
Bama, NG|11.521|13.690
Badagry, NG|6.415|2.881
Babana, NG|10.429|3.815
Azare, NG|11.675|10.191
Awka, NG|6.213|7.072
Awgu, NG|6.073|7.477
Auchi, NG|7.068|6.264
Atani, NG|6.013|6.748
Asaba, NG|6.198|6.732
Argungu, NG|12.745|4.525
Aramoko-Ekiti, NG|7.705|5.041
Apomu, NG|7.352|4.183
Anchau, NG|10.962|8.392
Amaigbo, NG|5.789|7.838
Aliayabiagba, NG|6.450|3.333
Alasia, NG|6.475|3.169
Akwanga, NG|8.911|8.407
Akure, NG|7.253|5.193
Aku, NG|6.709|7.318
Ajaokuta, NG|7.562|6.655
Agulu, NG|6.100|7.061
Agege, NG|6.616|3.333
Agbor, NG|6.254|6.194
Afikpo, NG|5.893|7.935
Ado-Odo, NG|6.595|2.942
Ado-Ekiti, NG|7.623|5.221
Abuja, NG|9.058|7.495
Abeokuta, NG|7.156|3.345
Abakaliki, NG|6.325|8.114
Aba, NG|5.107|7.367
Obalende, NG|6.447|3.415
Ajegunle, NG|6.452|3.331
Alimosho, NG|6.607|3.302
Akowonjo, NG|6.610|3.310
Degema Hulk, NG|4.761|6.750
Lekki, NG|6.446|3.477
Ogbia, NG|4.688|6.315
Chakwama, NG|11.560|9.664
Tipitapa, NI|12.197|-86.097
Somoto, NI|13.484|-86.582
Somotillo, NI|13.044|-86.905
Siuna, NI|13.733|-84.777
San Rafael del Sur, NI|11.849|-86.438
San Marcos, NI|11.909|-86.204
Rivas, NI|11.440|-85.827
Rio Blanco, NI|12.934|-85.224
Rama, NI|12.160|-84.220
Puerto Cabezas, NI|14.035|-83.389
Ocotal, NI|13.632|-86.474
Nueva Guinea, NI|11.688|-84.456
Nandaime, NI|11.757|-86.053
Nagarote, NI|12.266|-86.565
Mateare, NI|12.235|-86.428
Matagalpa, NI|12.928|-85.919
Masaya, NI|11.973|-86.096
Masatepe, NI|11.914|-86.145
Managua, NI|12.133|-86.250
Leon, NI|12.435|-86.879
La Paz Centro, NI|12.340|-86.675
Juigalpa, NI|12.106|-85.365
Jinotepe, NI|11.848|-86.199
Jinotega, NI|13.091|-86.002
Jalapa, NI|13.922|-86.123
Granada, NI|11.931|-85.954
Esteli, NI|13.093|-86.356
El Viejo, NI|12.663|-87.167
El Crucero, NI|11.990|-86.310
Diriamba, NI|11.858|-86.239
Corinto, NI|12.482|-87.173
Chinandega, NI|12.630|-87.131
Chichigalpa, NI|12.570|-87.028
Camoapa, NI|12.384|-85.513
Boaco, NI|12.473|-85.660
Bluefields, NI|12.013|-83.764
Ciudad Sandino, NI|12.159|-86.344
Zwolle, NL|52.513|6.094
Zwijndrecht, NL|51.818|4.633
Zwaag, NL|52.669|5.076
Zutphen, NL|52.138|6.201
Zoetermeer, NL|52.057|4.493
Zevenaar, NL|51.930|6.071
Zeist, NL|52.090|5.233
Zeewolde, NL|52.330|5.542
Zandvoort, NL|52.371|4.533
Zaltbommel, NL|51.810|5.244
Zaanstad, NL|52.453|4.814
Zaandam, NL|52.439|4.826
Woerden, NL|52.085|4.883
Wisch, NL|51.926|6.417
Winterswijk, NL|51.972|6.719
Winschoten, NL|53.144|7.035
Wijk bij Duurstede, NL|51.974|5.342
Wijchen, NL|51.809|5.725
Wierden, NL|52.359|6.593
Weesp, NL|52.307|5.042
Weert, NL|51.252|5.707
Wassenaar, NL|52.146|4.403
Wageningen, NL|51.970|5.667
Waddinxveen, NL|52.045|4.651
Waalwijk, NL|51.682|5.071
Vught, NL|51.653|5.287
Voorschoten, NL|52.127|4.449
Voorburg, NL|52.074|4.360
Volendam, NL|52.495|5.071
Vlissingen, NL|51.443|3.574
Vlaardingen, NL|51.913|4.342
Vianen, NL|51.992|5.092
Venray, NL|51.525|5.975
Venlo, NL|51.370|6.168
Velsen-Zuid, NL|52.460|4.650
Velp, NL|51.995|5.974
Veghel, NL|51.617|5.549
Veenendaal, NL|52.029|5.559
Veendam, NL|53.107|6.879
Valkenswaard, NL|51.351|5.460
Utrecht, NL|52.091|5.122
Urk, NL|52.663|5.601
Uithoorn, NL|52.237|4.826
Uden, NL|51.661|5.619
Tubbergen, NL|52.407|6.785
Tongelre, NL|51.449|5.520
Tilburg, NL|51.556|5.091
Tiel, NL|51.887|5.429
Terneuzen, NL|51.336|3.828
Tegelen, NL|51.344|6.136
Steenwijk, NL|52.788|6.121
Steenbergen, NL|51.584|4.319
Staphorst, NL|52.645|6.211
Stadskanaal, NL|52.989|6.950
Spijkenisse, NL|51.845|4.329
Soest, NL|52.173|5.292
Sneek, NL|53.033|5.659
Sliedrecht, NL|51.821|4.776
Sittard, NL|50.998|5.869
Sint-Oedenrode, NL|51.568|5.460
s-Hertogenbosch, NL|51.699|5.304
s-Gravenzande, NL|52.002|4.165
The Hague, NL|52.077|4.299
Schijndel, NL|51.623|5.432
Schiedam, NL|51.919|4.389
Schiebroek, NL|51.958|4.471
Scheveningen, NL|52.105|4.276
Schagen, NL|52.788|4.799
Sassenheim, NL|52.225|4.522
Rotterdam, NL|51.922|4.479
Roosendaal, NL|51.531|4.465
Roermond, NL|51.194|5.987
Rijswijk, NL|52.036|4.325
Rijssen, NL|52.307|6.518
Rijen, NL|51.591|4.919
Ridderkerk, NL|51.873|4.603
Rhoon, NL|51.858|4.422
Rhenen, NL|51.959|5.568
Raalte, NL|52.386|6.275
Putten, NL|52.259|5.607
Purmerend, NL|52.505|4.960
Pijnacker, NL|52.020|4.429
Papendrecht, NL|51.832|4.688
Oud-Beijerland, NL|51.824|4.412
Oss, NL|51.765|5.518
Oosterhout, NL|51.645|4.860
Ommoord, NL|51.960|4.545
Oldenzaal, NL|52.313|6.929
Oisterwijk, NL|51.579|5.189
Oegstgeest, NL|52.180|4.469
Nunspeet, NL|52.379|5.786
Nuenen, NL|51.470|5.553
Nootdorp, NL|52.045|4.396
Noordwijk-Binnen, NL|52.234|4.445
Nijverdal, NL|52.360|6.468
Nijmegen, NL|51.843|5.853
Nijkerk, NL|52.220|5.486
Nieuw-Vennep, NL|52.264|4.631
Nieuwegein, NL|52.029|5.081
Naarden, NL|52.296|5.162
Naaldwijk, NL|51.994|4.210
Mijdrecht, NL|52.207|4.862
Middelharnis, NL|51.758|4.165
Middelburg, NL|51.500|3.614
Merenwijk, NL|52.177|4.509
Meppel, NL|52.696|6.194
Medemblik, NL|52.772|5.106
Maastricht, NL|50.848|5.689
Maassluis, NL|51.923|4.250
Maarssen, NL|52.139|5.042
Losser, NL|52.261|7.004
Loon op Zand, NL|51.627|5.075
Lisse, NL|52.260|4.557
Lindenholt, NL|51.833|5.793
Lichtenvoorde, NL|51.987|6.567
Leusden, NL|52.133|5.432
Lelystad, NL|52.508|5.475
Leiderdorp, NL|52.158|4.529
Leiden, NL|52.158|4.493
Leeuwarden, NL|53.203|5.810
Leerdam, NL|51.893|5.092
Leek, NL|53.163|6.376
Krommenie, NL|52.499|4.763
Krimpen aan den IJssel, NL|51.917|4.603
Korrewegwijk, NL|53.232|6.568
Kerkrade, NL|50.866|6.062
Katwijk aan Zee, NL|52.203|4.399
Kampen, NL|52.555|5.911
Julianadorp, NL|52.890|4.740
Jordaan, NL|52.374|4.881
IJsselstein, NL|52.020|5.043
IJmuiden, NL|52.460|4.610
Huizen, NL|52.299|5.242
Huissen, NL|51.938|5.933
Hoorn, NL|52.642|5.060
Hoogvliet, NL|51.863|4.362
Hoogezand, NL|53.162|6.761
Hoogeveen, NL|52.722|6.476
Hoofddorp, NL|52.303|4.689
Hoge Vucht, NL|51.608|4.792
Hoensbroek, NL|50.924|5.925
Hilversum, NL|52.223|5.176
Hillegom, NL|52.291|4.583
Hengelo, NL|52.266|6.793
Hendrik-Ido-Ambacht, NL|51.844|4.639
Helmond, NL|51.482|5.661
Hellevoetsluis, NL|51.833|4.133
Heiloo, NL|52.603|4.688
Heerlen, NL|50.884|5.982
Heerhugowaard, NL|52.671|4.849
Heerenveen, NL|52.959|5.919
Heemstede, NL|52.350|4.623
Heemskerk, NL|52.511|4.672
Harlingen, NL|53.175|5.422
Harderwijk, NL|52.342|5.621
Hardenberg, NL|52.576|6.619
Haarlem, NL|52.381|4.637
Haaksbergen, NL|52.157|6.739
Groot IJsselmonde, NL|51.883|4.549
Groningen, NL|53.219|6.567
Groesbeek, NL|51.777|5.936
Gouda, NL|52.017|4.708
Gorinchem, NL|51.837|4.972
Goirle, NL|51.521|5.067
Goes, NL|51.504|3.889
Glanerbrug, NL|52.216|6.971
Gennep, NL|51.698|5.974
Gemert, NL|51.556|5.690
Geleen, NL|50.974|5.829
Geldrop, NL|51.422|5.560
Geldermalsen, NL|51.881|5.289
Geertruidenberg, NL|51.702|4.857
Epe, NL|52.347|5.983
Enschede, NL|52.218|6.896
Enkhuizen, NL|52.703|5.292
Emmen, NL|52.779|6.907
Emmeloord, NL|52.711|5.749
Elst, NL|51.919|5.842
Elburg, NL|52.447|5.843
Eindhoven, NL|51.441|5.478
Eibergen, NL|52.100|6.649
Eersel, NL|51.358|5.318
Ede, NL|52.033|5.658
Duiven, NL|51.947|6.014
Drunen, NL|51.686|5.133
Dronten, NL|52.525|5.718
Driebergen-Rijsenburg, NL|52.053|5.281
Drachten, NL|53.113|6.099
Dordrecht, NL|51.810|4.674
Dongen, NL|51.627|4.939
Doetinchem, NL|51.965|6.289
Diemen, NL|52.340|4.963
Didam, NL|51.941|6.132
Deventer, NL|52.255|6.164
Den Helder, NL|52.960|4.759
De Meern, NL|52.082|5.036
Delfzijl, NL|53.330|6.918
Delft, NL|52.007|4.356
Dalfsen, NL|52.512|6.257
Culemborg, NL|51.955|5.228
Cranendonck, NL|51.304|5.589
Castricum, NL|52.548|4.669
Capelle aan den IJssel, NL|51.929|4.578
Bussum, NL|52.273|5.161
Brunssum, NL|50.947|5.971
Brummen, NL|52.090|6.156
Breda, NL|51.587|4.776
Boxtel, NL|51.591|5.329
Boskoop, NL|52.075|4.656
Borssele, NL|51.423|3.735
Borne, NL|52.301|6.748
Bodegraven, NL|52.083|4.750
Blerick, NL|51.372|6.149
Bilthoven, NL|52.130|5.201
Beverwijk, NL|52.483|4.657
Beuningen, NL|51.861|5.767
Best, NL|51.508|5.390
Bergschenhoek, NL|51.990|4.499
Bergeyk, NL|51.319|5.358
Bergen op Zoom, NL|51.495|4.292
Bergen, NL|52.669|4.704
Benthuizen, NL|52.078|4.544
Bennekom, NL|51.998|5.676
Barneveld, NL|52.140|5.585
Barendrecht, NL|51.857|4.535
Badhoevedorp, NL|52.337|4.785
Baarn, NL|52.212|5.287
Assendelft, NL|52.468|4.743
Assen, NL|52.997|6.562
Arnhem, NL|51.980|5.911
Apeldoorn, NL|52.210|5.969
Amsterdam, NL|52.374|4.890
Amstelveen, NL|52.301|4.864
Amersfoort, NL|52.155|5.388
Alphen aan den Rijn, NL|52.129|4.655
Almere Stad, NL|52.370|5.214
Almelo, NL|52.357|6.662
Alkmaar, NL|52.632|4.749
Alblasserdam, NL|51.866|4.661
Aalten, NL|51.925|6.581
Aalsmeer, NL|52.259|4.760
Amsterdam-Zuidoost, NL|52.307|4.972
Berkel en Rodenrijs, NL|51.993|4.479
Ypenburg, NL|52.041|4.370
Velserbroek, NL|52.433|4.662
Noord, NL|52.391|4.910
Maaspoort, NL|51.726|5.302
Leidsche Rijn, NL|52.095|5.046
Amsterdam Nieuw-West, NL|52.356|4.806
Amsterdam-Oost, NL|52.352|4.934
Amsterdam-Centrum, NL|52.374|4.899
Amsterdam-Zuid, NL|52.347|4.877
Amsterdam-West, NL|52.378|4.866
Alta, NO|69.969|23.272
Trondheim, NO|63.430|10.395
Tromso, NO|69.649|18.955
Tromsdalen, NO|69.650|19.017
Tonsberg, NO|59.268|10.408
Time, NO|58.733|5.700
Stjordalshalsen, NO|63.468|10.926
Stavanger, NO|58.970|5.733
Sola, NO|58.889|5.653
Skien, NO|59.210|9.609
Sarpsborg, NO|59.284|11.110
Sandnes, NO|58.852|5.735
Sandefjord, NO|59.131|10.217
Porsgrunn, NO|59.141|9.656
Oslo, NO|59.913|10.746
Nesttun, NO|60.318|5.353
Moss, NO|59.434|10.658
Molde, NO|62.738|7.159
Mo i Rana, NO|66.313|14.143
Lillestrom, NO|59.956|11.049
Lillehammer, NO|61.115|10.466
Levanger, NO|63.746|11.300
Larvik, NO|59.053|10.035
Kristiansund, NO|63.110|7.728
Kristiansand, NO|58.147|7.996
Kongsberg, NO|59.669|9.650
Horten, NO|59.417|10.483
Haugesund, NO|59.414|5.268
Harstad, NO|68.798|16.542
Hamar, NO|60.794|11.068
Halden, NO|59.125|11.388
Grimstad, NO|58.340|8.593
Gjovik, NO|60.796|10.692
Fredrikstad, NO|59.218|10.930
Drammen, NO|59.744|10.204
Bodo, NO|67.283|14.375
Bergen, NO|60.393|5.324
Asker, NO|59.833|10.437
Asane, NO|60.474|5.325
Arendal, NO|58.462|8.773
Alesund, NO|62.472|6.155
Ytrebygda, NO|60.305|5.282
Walin, NP|27.984|83.759
Tulsipur, NP|28.133|82.298
Tikapur, NP|28.528|81.118
Tansen, NP|27.867|83.546
Siraha, NP|26.654|86.208
Rajbiraj, NP|26.540|86.748
Pokhara, NP|28.267|83.969
Patan, NP|27.677|85.314
Panauti, NP|27.584|85.515
Malangawa, NP|26.856|85.560
Bhimdatta, NP|28.964|80.177
Lahan, NP|26.720|86.483
Kirtipur, NP|27.679|85.276
Khadbari, NP|27.376|87.208
Kathmandu, NP|27.702|85.321
Janakpur, NP|26.729|85.926
Jaleshwar, NP|26.649|85.800
Itahari, NP|26.664|87.274
Ilam, NP|26.909|87.928
Hetauda, NP|27.428|85.032
Gulariya, NP|28.206|81.345
Gaur, NP|26.764|85.277
Dhulikhel, NP|27.622|85.543
Dharan, NP|26.814|87.280
Dhankuta, NP|26.983|87.333
Dhangadhi, NP|28.702|80.590
Darchula, NP|29.830|80.550
Dailekh, NP|28.844|81.710
Amargadhi, NP|29.299|80.583
Chautara, NP|27.776|85.713
Charikot, NP|27.668|86.052
Butwal, NP|27.691|83.453
Birganj, NP|27.017|84.880
Biratnagar, NP|26.455|87.270
Bharatpur, NP|27.680|84.436
Siddharthanagar, NP|27.500|83.450
Bhadrapur, NP|26.544|88.094
Banepa, NP|27.633|85.522
Baglun, NP|28.267|83.600
Birendranagar, NP|28.597|81.617
Dipayal, NP|29.261|80.940
Nepalgunj, NP|28.050|81.617
Panauti, NP|27.585|85.521
Inaruwa, NP|26.607|87.148
Triyuga, NP|26.792|86.699
Madhyapur Thimi, NP|27.681|85.388
Yaren, NR|-0.551|166.925
Alofi, NU|-19.053|-169.920
Wellington, NZ|-41.287|174.776
Whanganui, NZ|-39.933|175.050
Wainuiomata, NZ|-41.267|174.950
Timaru, NZ|-44.397|171.254
Taupo, NZ|-38.683|176.083
Stoke, NZ|-41.317|173.233
Rolleston, NZ|-43.583|172.383
Richmond, NZ|-41.333|173.183
Pukekohe East, NZ|-37.200|174.950
Porirua, NZ|-41.133|174.850
Paraparaumu, NZ|-40.917|175.017
Palmerston North, NZ|-40.356|175.611
North Shore, NZ|-36.800|174.750
New Plymouth, NZ|-39.067|174.083
Nelson, NZ|-41.271|173.284
Napier, NZ|-39.493|176.912
Manukau City, NZ|-36.993|174.880
Mangere, NZ|-36.968|174.799
Lower Hutt, NZ|-41.217|174.917
Karori, NZ|-41.284|174.741
Invercargill, NZ|-46.400|168.350
Hastings, NZ|-39.638|176.849
Hamilton, NZ|-37.783|175.283
Dunedin, NZ|-45.874|170.504
Christchurch, NZ|-43.533|172.633
Avondale, NZ|-36.883|174.700
Auckland, NZ|-36.849|174.763
Levin, NZ|-40.633|175.275
Gisborne, NZ|-38.653|178.004
Masterton, NZ|-40.960|175.657
Tauranga, NZ|-37.686|176.167
Papakura, NZ|-37.065|174.942
Whakatane, NZ|-37.959|176.985
Ashburton, NZ|-43.898|171.730
Rangiora, NZ|-43.304|172.584
Whangarei, NZ|-35.732|174.324
Takanini, NZ|-37.039|174.928
Mangere East, NZ|-36.966|174.824
Papatoetoe, NZ|-36.968|174.840
Otahuhu, NZ|-36.938|174.840
Manurewa, NZ|-37.018|174.880
Otara, NZ|-36.948|174.870
New Lynn, NZ|-36.907|174.687
Epsom, NZ|-36.887|174.771
Mount Eden, NZ|-36.882|174.762
Titirangi, NZ|-36.938|174.656
Remuera, NZ|-36.880|174.798
Massey East, NZ|-36.828|174.620
Te Atatu Peninsula, NZ|-36.841|174.652
Te Atatu South, NZ|-36.865|174.648
Lincoln, NZ|-36.858|174.620
Henderson, NZ|-36.880|174.620
Massey, NZ|-36.838|174.610
Cambridge, NZ|-37.878|175.440
Rotorua, NZ|-38.139|176.245
Blenheim, NZ|-41.516|173.953
Upper Hutt, NZ|-41.138|175.050
Hamilton East, NZ|-37.788|175.290
Sur, OM|22.567|59.529
Sohar, OM|24.347|56.709
Sufalat Samail, OM|23.317|58.017
Shinas, OM|24.743|56.467
Samail, OM|23.298|57.953
Salalah, OM|17.015|54.092
Saham, OM|24.172|56.889
Qurayyat, OM|23.263|58.920
Nizwa, OM|22.933|57.533
Muscat, OM|23.584|58.408
Khasab, OM|26.180|56.248
Izki, OM|22.933|57.767
Ibri, OM|23.226|56.516
Ibra, OM|22.691|58.533
Bidbid, OM|23.408|58.128
Bawshar, OM|23.578|58.400
Barka, OM|23.679|57.886
Bahla, OM|22.979|57.305
Badiyah, OM|22.450|58.800
As Suwayq, OM|23.849|57.439
Seeb, OM|23.670|58.189
Rustaq, OM|23.391|57.424
Liwa, OM|24.531|56.563
Al Khaburah, OM|23.971|57.093
Al Buraymi, OM|24.251|55.793
Adam, OM|22.379|57.527
Yanqul, OM|23.586|56.540
Masirah, OM|20.651|58.873
Veracruz, PA|8.893|-79.623
Tocumen, PA|9.089|-79.383
Santiago de Veraguas, PA|8.100|-80.983
San Miguelito, PA|9.050|-79.471
Sabanitas, PA|9.345|-79.805
Rio Abajo, PA|9.024|-79.494
Penonome, PA|8.519|-80.357
Pedregal, PA|9.066|-79.426
Pedregal, PA|8.377|-82.429
Parque Lefevre, PA|9.023|-79.479
Panama City, PA|8.994|-79.520
Las Cumbres, PA|9.092|-79.539
La Concepcion, PA|8.517|-82.624
La Chorrera, PA|8.878|-79.780
La Cabima, PA|9.118|-79.533
Juan Diaz, PA|9.041|-79.441
El Chorrillo, PA|8.950|-79.547
David, PA|8.427|-82.431
Curundu, PA|8.971|-79.546
Colon, PA|9.360|-79.900
Chilibre, PA|9.154|-79.620
Changuinola, PA|9.430|-82.520
Cativa, PA|9.362|-79.832
Arraijan, PA|8.940|-79.640
Ancon, PA|8.960|-79.551
Alcalde Diaz, PA|9.123|-79.557
Nuevo Belen, PA|9.089|-79.392
Yurimaguas, PE|-5.902|-76.122
Viru, PE|-8.416|-78.752
Uchiza, PE|-8.459|-76.463
Tumbes, PE|-3.556|-80.443
Trujillo, PE|-8.116|-79.030
Tocache, PE|-8.188|-76.520
Tingo Maria, PE|-9.295|-75.996
Tambo Grande, PE|-4.927|-80.345
Talara, PE|-4.577|-81.272
Sullana, PE|-4.904|-80.685
Sechura, PE|-5.557|-80.822
Santiago de Cao, PE|-7.959|-79.239
San Pedro de Lloc, PE|-7.429|-79.504
San Juan, PE|-3.776|-73.281
Sana, PE|-6.919|-79.582
Rioja, PE|-6.057|-77.167
Requena, PE|-5.061|-73.850
Querecotillo, PE|-4.838|-80.646
Pucallpa, PE|-8.379|-74.554
Piura, PE|-5.182|-80.657
Pimentel, PE|-6.837|-79.934
Picsi, PE|-6.718|-79.770
Patapo, PE|-6.733|-79.636
Paita, PE|-5.089|-81.114
Paijan, PE|-7.733|-79.302
Pacasmayo, PE|-7.401|-79.571
Moyobamba, PE|-6.034|-76.974
Monsefu, PE|-6.874|-79.869
Moche, PE|-8.171|-79.009
Marcavelica, PE|-4.878|-80.705
La Union, PE|-5.402|-80.742
Laredo, PE|-8.090|-78.960
La Peca, PE|-5.611|-78.435
Lambayeque, PE|-6.701|-79.906
Juanjui, PE|-7.177|-76.728
Jaen, PE|-5.707|-78.808
Iquitos, PE|-3.748|-73.253
Huaraz, PE|-9.526|-77.529
Huanuco, PE|-9.929|-76.240
Huamachuco, PE|-7.800|-78.067
Guadalupe, PE|-7.250|-79.483
Ferrenafe, PE|-6.639|-79.789
Contamana, PE|-7.333|-75.017
Coishco, PE|-9.023|-78.616
Chulucanas, PE|-5.093|-80.162
Chongoyape, PE|-6.641|-79.389
Chocope, PE|-7.791|-79.222
Chimbote, PE|-9.075|-78.594
Chiclayo, PE|-6.770|-79.855
Chepen, PE|-7.224|-79.425
Chachapoyas, PE|-6.232|-77.869
Catacaos, PE|-5.267|-80.683
Cajamarca, PE|-7.164|-78.500
Bellavista, PE|-7.056|-76.591
Bagua Grande, PE|-5.756|-78.441
Aguaytia, PE|-9.038|-75.509
La Breita, PE|-4.257|-80.886
Zarumilla, PE|-3.503|-80.273
Belen, PE|-3.760|-73.250
Yauri, PE|-14.791|-71.410
Yanacancha, PE|-10.241|-76.646
Tarma, PE|-11.419|-75.690
Tambopata, PE|-12.672|-69.355
Tacna, PE|-18.015|-70.254
Santiago de Surco, PE|-12.136|-77.007
Sicuani, PE|-14.269|-71.226
Satipo, PE|-11.252|-74.639
San Vicente de Canete, PE|-13.076|-76.385
Santa Ana, PE|-12.867|-72.717
San Isidro, PE|-12.097|-77.043
San Clemente, PE|-13.667|-76.150
Quillabamba, PE|-12.863|-72.693
Puno, PE|-15.840|-70.022
Puerto Maldonado, PE|-12.589|-69.199
Pisco, PE|-13.710|-76.205
Paramonga, PE|-10.667|-77.833
Nuevo Imperial, PE|-13.075|-76.317
Nazca, PE|-14.831|-74.939
Moquegua, PE|-17.197|-70.936
Mollendo, PE|-17.023|-72.015
Miraflores, PE|-12.113|-77.033
Minas de Marcona, PE|-15.212|-75.110
Mala, PE|-12.658|-76.631
Lima, PE|-12.043|-77.028
La Oroya, PE|-11.519|-75.899
Junin, PE|-11.159|-75.993
Juliaca, PE|-15.500|-70.133
Villa Poeta Jose Galvez Barrenechea, PE|-12.213|-76.905
Jauja, PE|-11.776|-75.497
Imperial, PE|-13.059|-76.353
Ilo, PE|-17.632|-71.341
Ilave, PE|-16.083|-69.667
Ica, PE|-14.075|-75.734
Huaura, PE|-11.070|-77.599
Huarmey, PE|-10.068|-78.152
Huaral, PE|-11.495|-77.208
Huanta, PE|-12.933|-74.250
Huancayo, PE|-12.069|-75.210
Huancavelica, PE|-12.787|-74.973
Hualmay, PE|-11.096|-77.614
Huacho, PE|-11.117|-77.606
Cusco, PE|-13.532|-71.967
Chosica, PE|-11.943|-76.709
Chincha Alta, PE|-13.410|-76.132
Chaupimarca, PE|-10.407|-76.462
Chancay, PE|-11.571|-77.267
Cerro de Pasco, PE|-10.666|-76.253
Camana, PE|-16.624|-72.711
Callao, PE|-12.052|-77.135
Barranco, PE|-12.143|-77.019
Barranca, PE|-10.750|-77.767
Ayaviri, PE|-14.886|-70.589
Ayacucho, PE|-13.164|-74.223
Atalaya, PE|-10.731|-73.759
Arequipa, PE|-16.399|-71.537
Andahuaylas, PE|-13.656|-73.387
Abancay, PE|-13.634|-72.884
Jacobo Hunter, PE|-16.441|-71.553
San Martin de Pangoa, PE|-11.429|-74.488
La Rinconada, PE|-14.631|-69.446
Santa Anita - Los Ficus, PE|-12.050|-76.973
San Martin, PE|-5.186|-80.669
San Francisco De Borja, PE|-12.089|-76.999
Ciudad Satelite, PE|-16.431|-71.529
Chilca, PE|-12.086|-75.208
San Fernando, PE|-8.398|-74.538
Jesus Maria, PE|-12.070|-77.045
Wanchaq, PE|-13.525|-71.965
Centenario, PE|-9.517|-77.530
Cono Norte, PE|-16.324|-71.582
Carmen De La Legua Reynoso, PE|-12.054|-77.098
La Banda, PE|-6.493|-76.342
Yanacancha, PE|-10.666|-76.255
El Pedregal, PE|-16.363|-72.192
Santa Rosa, PE|-10.919|-74.885
San Antonio, PE|-17.217|-70.926
Selva Alegre, PE|-16.371|-71.527
Santiago, PE|-13.527|-71.984
Brena, PE|-12.056|-77.053
San Miguel, PE|-15.478|-70.125
Punaauia, PF|-17.633|-149.600
Papeete, PF|-17.535|-149.568
Faaa, PF|-17.559|-149.604
Wewak, PG|-3.550|143.632
Port Moresby, PG|-9.477|147.151
Popondetta, PG|-8.765|148.233
Mount Hagen, PG|-5.857|144.231
Mendi, PG|-6.148|143.656
Madang, PG|-5.222|145.787
Lae, PG|-6.723|146.996
Kokopo, PG|-4.343|152.269
Kimbe, PG|-5.551|150.138
Goroka, PG|-6.085|145.387
Daru, PG|-9.078|143.209
Bulolo, PG|-7.204|146.640
Arawa, PG|-6.230|155.566
Zumarraga, PH|11.639|124.842
Zaragoza, PH|15.449|120.796
Zamboanga, PH|6.910|122.074
Wao, PH|7.683|124.667
Virac, PH|13.585|124.237
Vinzons, PH|14.174|122.907
Villasis, PH|15.902|120.588
Vigan, PH|17.575|120.387
Victorias, PH|10.902|123.070
Victoria, PH|14.228|121.329
Victoria, PH|13.177|121.278
Veruela, PH|8.073|125.956
Valenzuela, PH|14.700|120.967
NIA Valencia, PH|7.906|125.094
Urdaneta, PH|15.976|120.571
Ualog, PH|10.574|123.393
Tupi, PH|6.334|124.953
Tunasan, PH|14.379|121.052
Tuguegarao, PH|17.616|121.723
Tubod, PH|8.056|123.790
Trento, PH|8.046|126.064
Toledo, PH|10.377|123.639
Tiwi, PH|13.459|123.680
Tinongan, PH|10.215|123.035
Ternate, PH|14.290|120.717
Teresa, PH|14.561|121.219
Telabastagan, PH|15.119|120.608
Taytay, PH|14.559|121.133
Tayabas, PH|14.026|121.593
Tarlac City, PH|15.480|120.598
Tanza, PH|14.675|120.939
Tanjay, PH|9.516|123.158
Tangub, PH|8.062|123.748
Tandag, PH|9.078|126.199
Tanay, PH|14.497|121.285
Tanauan, PH|14.086|121.150
Tanauan, PH|11.109|125.016
Taloc, PH|10.575|122.895
Talitay, PH|7.033|124.700
Talisay, PH|14.092|121.022
Talisay, PH|10.738|122.967
Talisay, PH|10.245|123.849
Talipapa, PH|14.686|121.027
Talavera, PH|15.588|120.919
Talacogon, PH|8.456|125.784
Magugpo Poblacion, PH|7.447|125.805
Taguig, PH|14.524|121.079
Tagudin, PH|16.936|120.444
Tagoloan, PH|8.540|124.754
Tagbina, PH|8.452|126.171
Tagbilaran City, PH|9.656|123.852
Tagaytay, PH|14.095|120.934
Tagas, PH|13.167|123.717
Tacurong, PH|6.692|124.676
Tacloban, PH|11.243|125.005
Tabaco, PH|13.359|123.734
Taal, PH|13.880|120.923
Surigao, PH|9.789|125.495
Surallah, PH|6.375|124.745
Sumag, PH|10.601|122.919
Sultan sa Barongis, PH|6.800|124.637
Sultan Kudarat, PH|7.229|124.258
Subic, PH|14.879|120.232
Sorsogon, PH|12.974|123.993
Solano, PH|16.519|121.181
Solana, PH|17.653|121.691
Sitangkai, PH|4.661|119.396
Sipalay, PH|9.752|122.404
Siocon, PH|7.706|122.135
Silang, PH|14.216|120.971
Sibulan, PH|9.358|123.285
Sibonga, PH|10.017|123.617
Sasmuan, PH|14.944|120.623
Lake Sebu, PH|6.225|124.710
Sariaya, PH|13.962|121.526
San Vicente, PH|15.292|120.655
Santo Tomas, PH|14.108|121.141
Santol, PH|15.162|120.567
Santiago, PH|16.688|121.549
Santa Rosa, PH|14.312|121.111
Santa Maria, PH|16.952|120.445
Santa Maria, PH|6.554|125.471
Santa Cruz, PH|14.600|120.983
Santa Cruz, PH|15.765|119.909
Santa Cruz, PH|14.913|120.567
Santa Cruz, PH|14.281|121.416
Santa Catalina, PH|9.334|122.864
Santa Barbara, PH|16.001|120.402
Santa Ana, PH|15.095|120.767
San Simon, PH|15.000|120.781
San Pedro, PH|14.360|121.047
San Pascual, PH|13.810|121.022
San Pablo, PH|14.068|121.326
San Nicolas, PH|18.172|120.595
San Narciso, PH|15.014|120.080
San Miguel, PH|15.444|120.599
San Miguel, PH|15.142|120.976
San Mateo, PH|16.882|121.587
San Mateo, PH|14.698|121.124
San Mariano, PH|7.500|126.000
San Marcelino, PH|14.974|120.157
San Luis, PH|15.040|120.788
San Leonardo, PH|15.363|120.964
San Juan, PH|14.600|121.033
San Jose del Monte, PH|14.814|121.045
San Jose, PH|13.350|123.550
San Jose, PH|12.353|121.068
San Jose, PH|10.180|125.568
San Ildefonso, PH|15.081|120.941
San Francisco, PH|15.356|120.840
Aurora, PH|13.348|122.519
San Francisco, PH|8.536|125.950
San Fernando, PH|16.616|120.317
San Fernando, PH|15.034|120.684
San Fernando, PH|10.162|123.708
Sanchez-Mira, PH|18.562|121.232
San Antonio, PH|15.306|120.856
San Antonio, PH|14.947|120.087
Sampaloc, PH|14.540|121.360
Samal, PH|14.768|120.543
Samal, PH|7.074|125.708
Sagay, PH|10.945|123.424
Sablayan, PH|12.835|120.769
Roxas, PH|17.119|121.620
Roxas City, PH|11.585|122.751
Roxas, PH|10.322|119.345
Rosario, PH|13.632|121.221
Rosales, PH|15.894|120.633
Romblon, PH|12.575|122.271
Rizal, PH|15.712|121.106
Recodo, PH|6.952|121.964
Ramos, PH|15.665|120.641
Ramon, PH|16.784|121.535
Quiapo, PH|14.600|120.983
Quezon City, PH|14.649|121.051
Quezon, PH|15.551|120.815
Quezon, PH|7.730|125.099
Putatan, PH|14.399|121.050
Pulupandan, PH|10.518|122.803
Pulong Santa Cruz, PH|14.273|121.076
Pulilan, PH|14.902|120.849
Puerto Princesa, PH|9.739|118.735
Prosperidad, PH|8.580|125.896
Port Area, PH|14.589|120.967
Porac, PH|15.071|120.542
Polomolok, PH|6.222|125.064
Polangui, PH|13.292|123.486
Plaridel, PH|14.887|120.857
Pio, PH|15.047|120.519
Pinamungahan, PH|10.271|123.584
Pinamalayan, PH|13.046|121.462
Pililla, PH|14.485|121.306
Pilar, PH|14.660|120.565
Pila, PH|14.232|121.365
Penaranda, PH|15.351|121.004
Patuto, PH|14.117|120.967
Pateros, PH|14.539|121.073
Passi, PH|11.108|122.642
Pasay, PH|14.537|121.001
Parang, PH|7.370|124.270
Paranaque City, PH|14.482|121.017
Paraiso, PH|10.885|123.363
Papaya, PH|15.320|120.836
Paombong, PH|14.831|120.789
Pantubig, PH|14.968|120.955
Paniqui, PH|15.669|120.581
Pangil, PH|14.403|121.465
Pandi, PH|14.865|120.957
Pandacaqui, PH|15.172|120.655
Panalanoy, PH|11.251|125.006
Panabo, PH|7.308|125.684
Palo, PH|11.158|124.991
Palayan City, PH|15.541|121.085
Pagbilao, PH|13.967|121.698
Pagalungan, PH|7.142|124.381
Pagadian, PH|7.826|123.437
Paete, PH|14.365|121.483
Pacol, PH|10.450|122.817
Paco, PH|14.588|120.993
Ozamiz City, PH|8.148|123.841
Oroquieta, PH|8.486|123.805
Ormoc, PH|11.006|124.608
Orion, PH|14.621|120.582
Orani, PH|14.801|120.537
Olongapo, PH|14.829|120.283
Obando, PH|14.710|120.936
Oas, PH|13.259|123.496
Nunungan, PH|7.824|123.965
Noveleta, PH|14.429|120.880
Novaliches Proper, PH|14.723|121.046
Norzagaray, PH|14.911|121.049
Norala, PH|6.522|124.659
New Corella, PH|7.587|125.824
Navotas, PH|14.667|120.950
Nasugbu, PH|14.067|120.632
Narra, PH|9.269|118.404
Naic, PH|14.318|120.766
Nagcarlan, PH|14.136|121.416
Naga, PH|13.619|123.181
Naga, PH|10.209|123.758
Nabunturan, PH|7.608|125.966
Nabua, PH|13.408|123.372
Muricay, PH|7.827|123.478
Murcia, PH|10.605|123.042
Muntinlupa, PH|14.390|121.047
Munoz, PH|15.716|120.903
Morong, PH|14.679|120.266
Morong, PH|14.518|121.238
Rodriguez, PH|14.760|121.200
Monkayo, PH|7.815|126.054
Molave, PH|8.084|123.491
Minglanilla, PH|10.245|123.796
Midsayap, PH|7.191|124.530
Meycauayan, PH|14.737|120.961
Mexico, PH|15.065|120.720
Mercedes, PH|14.109|123.011
Mendez-Nunez, PH|14.129|120.906
Mauban, PH|14.191|121.731
Mati, PH|6.955|126.217
Masinloc, PH|15.536|119.950
Masbate, PH|12.372|123.625
Masantol, PH|14.896|120.709
Mariveles, PH|14.434|120.486
Marilao, PH|14.758|120.948
Marikina City, PH|14.648|121.113
Mariano, PH|8.833|125.117
Marawi City, PH|8.003|124.284
Maramag, PH|7.763|125.005
Maragondon, PH|14.273|120.738
Mantampay, PH|8.167|124.217
Mansilingan, PH|10.631|122.979
Mansalay, PH|12.520|121.439
Manolo Fortich, PH|8.370|124.864
Manila, PH|14.604|120.982
Manibaug Pasig, PH|15.096|120.564
Mangaldan, PH|16.070|120.403
Mandaue City, PH|10.324|123.922
Mandaluyong City, PH|14.583|121.041
Mankayan, PH|16.863|120.783
Manay, PH|7.215|126.540
Manapla, PH|10.958|123.123
Manaoag, PH|16.044|120.486
Mamburao, PH|13.223|120.596
Mamatid, PH|14.235|121.159
Malvar, PH|14.045|121.159
Maluso, PH|6.543|121.875
Malungun, PH|6.279|125.282
Malolos, PH|14.844|120.810
Malita, PH|6.415|125.612
Malilipot, PH|13.319|123.739
Malaybalay, PH|8.158|125.128
Malapatan, PH|5.969|125.289
Malanday, PH|14.717|120.958
Malanday, PH|14.707|121.131
Malabon, PH|14.673|120.940
Malabanban Norte, PH|13.945|121.431
Makati City, PH|14.550|121.033
Majayjay, PH|14.146|121.473
Mahayag, PH|8.118|123.445
Magsaysay, PH|6.767|125.183
Magarao, PH|13.660|123.187
Maganoy, PH|6.865|124.442
Magalang, PH|15.215|120.660
Maco, PH|7.362|125.855
Mabalacat City, PH|15.223|120.571
Maasin, PH|10.133|124.841
Maao, PH|10.490|122.991
Lupon, PH|6.898|126.010
Lumbang, PH|14.297|121.460
Lucena, PH|13.931|121.617
Lucban, PH|14.114|121.556
Lubao, PH|14.941|120.601
Los Banos, PH|14.170|121.242
Lopez, PH|13.884|122.260
Loma de Gato, PH|14.789|120.999
Loboc, PH|9.638|124.035
Lipa City, PH|13.941|121.163
Lingayen, PH|16.022|120.232
Limay, PH|14.562|120.598
Liloan, PH|10.399|123.999
Lilio, PH|14.131|121.436
Libon, PH|13.300|123.439
Libertad, PH|8.944|125.502
Legaspi, PH|13.141|123.741
Laur, PH|15.586|121.183
La Trinidad, PH|16.455|120.588
Las Pinas, PH|14.451|120.983
Lapu-Lapu City, PH|10.310|123.949
La Paz, PH|15.441|120.729
Laoang, PH|12.570|125.014
Laoag, PH|18.198|120.596
Lambayong, PH|6.519|125.044
Laguilayan, PH|6.672|124.525
Lagawe, PH|16.800|121.119
La Castellana, PH|10.324|123.022
La Carlota, PH|10.424|122.921
Labo, PH|14.153|122.830
Koronadal, PH|6.503|124.847
Kidapawan, PH|7.008|125.089
Kawit, PH|14.444|120.902
Kalibo, PH|11.709|122.365
Kalamansig, PH|6.552|124.051
Kabankalan, PH|9.984|122.814
Kabacan, PH|7.107|124.829
Jose Panganiban, PH|14.291|122.692
Jolo, PH|6.052|121.002
Jetafe, PH|10.147|124.154
Jasaan, PH|8.654|124.756
Jalajala, PH|14.353|121.323
Jagna, PH|9.653|124.370
Jaen, PH|15.328|120.919
Itogon, PH|16.364|120.677
Isulan, PH|6.629|124.605
Isabela, PH|10.205|122.989
City of Isabela, PH|6.704|121.971
Irosin, PH|12.700|124.032
Iriga City, PH|13.432|123.412
Ipil, PH|7.784|122.586
Inopacan, PH|10.500|124.740
Indang, PH|14.195|120.877
Inabanga, PH|10.031|124.067
Imus, PH|14.430|120.937
Impasugong, PH|8.310|125.002
Iloilo, PH|10.697|122.564
Iligan City, PH|8.250|124.400
Iligan, PH|8.229|124.243
Ilagan, PH|17.149|121.889
Iba, PH|15.328|119.978
Hinigaran, PH|10.271|122.851
Hinatuan, PH|8.372|126.334
Himamaylan, PH|10.099|122.871
Hermosa, PH|14.831|120.508
Hagonoy, PH|14.834|120.733
Guyong, PH|14.836|120.978
Gumaca, PH|13.921|122.100
Guiset East, PH|16.067|120.683
Guimba, PH|15.661|120.768
Guihulngan, PH|10.119|123.273
Guiguinto, PH|14.833|120.883
Gubat, PH|12.921|124.123
Goa, PH|13.698|123.489
Glan, PH|5.824|125.203
Gingoog, PH|8.828|125.100
Gerona, PH|15.607|120.598
General Trias, PH|14.387|120.882
General Tinio, PH|15.351|121.048
General Santos, PH|6.113|125.172
General Mamerto Natividad, PH|15.602|121.052
General Emilio Aguinaldo, PH|14.184|120.796
Gapan, PH|15.307|120.946
Estancia, PH|11.455|123.152
Esperanza, PH|11.736|124.042
Escalante, PH|10.840|123.499
Enrique B. Magalona, PH|10.879|122.977
El Nido, PH|11.186|119.396
Dupax del Sur, PH|16.284|121.090
Dupax Del Norte, PH|16.308|121.106
Dumaguete, PH|9.306|123.308
Don Carlos, PH|7.680|125.005
Domalanoan, PH|16.003|120.212
Dologon, PH|7.841|125.044
Dipolog, PH|8.567|123.335
Dinalupihan, PH|14.878|120.452
Dinaig, PH|7.170|124.208
Digos, PH|6.750|125.357
Diadi, PH|16.726|121.359
Del Remedio, PH|14.087|121.312
Del Pilar, PH|15.036|120.699
Davao, PH|7.073|125.613
Dasmarinas, PH|14.329|120.937
Dapitan, PH|8.656|123.423
Danao, PH|10.521|124.027
Danao, PH|9.554|123.756
Dagupan, PH|16.043|120.333
Daet, PH|14.112|122.955
Daanbantayan, PH|11.247|124.015
Cupang, PH|14.434|121.036
Culion, PH|11.890|120.022
Cuenca, PH|13.902|121.052
Cotabato, PH|7.224|124.246
Cordova, PH|10.244|123.942
Consolacion, PH|10.377|123.957
Concepcion, PH|15.325|120.657
Concepcion Ibaba, PH|13.923|121.461
Compostela, PH|10.455|124.011
Compostela, PH|7.673|126.089
Cebu City, PH|10.317|123.891
Cavite City, PH|14.484|120.899
Catbalogan, PH|11.775|124.886
Catarman, PH|12.499|124.638
Catanauan, PH|13.593|122.322
Castillejos, PH|14.934|120.198
Carmona, PH|14.313|121.058
Cogan, PH|10.593|124.018
Carigara, PH|11.298|124.679
Cardona, PH|14.486|121.228
Carcar, PH|10.106|123.640
Capas, PH|15.331|120.590
Canlaon, PH|10.387|123.223
Candelaria, PH|13.931|121.423
Candaba, PH|15.096|120.827
Camiling, PH|15.687|120.413
Calumpit, PH|14.916|120.766
Calumpang, PH|14.623|121.090
Caloocan, PH|14.650|120.968
Calbayog City, PH|12.067|124.596
Calauan, PH|14.150|121.315
Calauag, PH|13.957|122.288
Calatagan, PH|13.832|120.632
Calasiao, PH|16.011|120.360
Calapan, PH|13.412|121.180
Calamba, PH|14.212|121.165
Calaca, PH|13.932|120.813
Calabanga, PH|13.707|123.209
Cainta, PH|14.579|121.122
Mapun, PH|6.975|118.514
Cagayan de Oro, PH|8.482|124.647
Cadiz, PH|10.947|123.288
Cabuyao, PH|14.273|121.126
Cabiao, PH|15.249|120.855
Cabayangan, PH|7.407|125.733
Cabanatuan City, PH|15.486|120.966
Cabagan, PH|17.428|121.770
Cabadbaran, PH|9.123|125.535
Butuan, PH|8.949|125.544
Bustos, PH|14.958|120.918
Boroon, PH|8.183|124.177
Burgos, PH|15.729|120.572
Burauen, PH|10.976|124.893
Bunawan, PH|8.167|125.991
Buluan, PH|6.720|124.802
Bulaon, PH|15.083|120.663
Bulan, PH|12.671|123.875
Bulacan, PH|14.793|120.879
Buhi, PH|13.432|123.517
Bugo, PH|8.508|124.759
Buenavista, PH|8.977|125.409
Budta, PH|7.204|124.440
Brookes Point, PH|8.772|117.837
Botolan, PH|15.290|120.025
Borongan, PH|11.608|125.432
Bontoc, PH|17.087|120.977
Bongao, PH|5.029|119.773
Bongabon, PH|15.632|121.145
Bogo, PH|11.052|124.005
Bocaue, PH|14.798|120.926
Bislig, PH|8.215|126.316
Binonga, PH|10.772|122.982
Binondo, PH|14.603|120.974
Binmaley, PH|16.032|120.269
Binangonan, PH|14.465|121.193
Binan, PH|14.343|121.081
Binalbagan, PH|10.195|122.858
Bignay Uno, PH|13.864|121.488
Upper Bicutan, PH|14.500|121.051
Bel Air, PH|14.559|121.026
Bayugan, PH|8.756|125.767
Bayombong, PH|16.481|121.150
Baybay, PH|10.678|124.801
Bayawan, PH|9.365|122.804
Bayanan, PH|14.408|121.050
Bayambang, PH|15.813|120.456
Bay, PH|14.184|121.286
Bauang, PH|16.531|120.333
Bauan, PH|13.792|121.008
Bato, PH|13.353|123.368
Batangas, PH|13.757|121.058
Batac City, PH|18.055|120.565
Baras, PH|14.517|121.266
Bantayan, PH|11.168|123.722
Bantay, PH|17.585|120.389
Bansalan, PH|6.786|125.213
Bangued, PH|17.608|120.638
Banga, PH|6.424|124.778
Banga, PH|6.424|124.776
Bambang, PH|16.387|121.107
Bamban, PH|15.274|120.567
Balulang, PH|8.445|124.631
Baliuag, PH|14.955|120.897
Balayan, PH|13.937|120.732
Balanga, PH|14.676|120.536
Balamban, PH|10.504|123.716
Balagtas, PH|14.817|120.867
Bais, PH|9.591|123.123
Bah-Bah, PH|8.607|125.914
Baguio, PH|16.416|120.593
Bagong Barrio, PH|14.666|120.993
Bago City, PH|10.533|122.833
Baggabag B, PH|16.506|121.190
Bacoor, PH|14.459|120.939
Bacolod City, PH|10.667|122.950
Baclaran, PH|14.532|120.994
Babo-Pangulo, PH|15.083|120.517
Baao, PH|13.455|123.365
Atimonan, PH|14.003|121.921
Asia, PH|9.551|122.516
Aringay, PH|16.394|120.355
Arayat, PH|15.150|120.770
Aparri, PH|18.357|121.641
Apalit, PH|14.953|120.770
Antipolo, PH|14.626|121.123
Angono, PH|14.527|121.154
Angeles City, PH|15.150|120.583
Angat, PH|14.928|121.030
Amadeo, PH|14.171|120.924
Alicia, PH|16.779|121.697
Aliaga, PH|15.500|120.843
Alaminos, PH|14.064|121.246
Alabel, PH|6.102|125.290
Agoo, PH|16.083|120.100
Aglipay, PH|16.489|121.645
Abuyog, PH|10.747|125.011
Abucay, PH|14.733|120.534
Bagong Pagasa, PH|14.663|121.033
Malingao, PH|7.161|124.475
Jose Rizal, PH|8.877|117.504
Commonwealth, PH|14.697|121.080
Bagong Silangan, PH|14.706|121.108
Pasig City, PH|14.587|121.061
Poblacion, PH|14.379|121.025
Tabuk, PH|17.415|121.442
Pandan, PH|11.745|122.100
Ayala Alabang, PH|14.406|121.022
Banco Filipino Homes, PH|14.434|121.022
Apas, PH|10.341|123.903
General Salipada K. Pendatun, PH|6.826|124.722
Bagong Silang, PH|14.778|121.045
Al-Barka, PH|6.486|122.176
Mandaluyong, PH|14.578|121.035
Sharifabad, PK|33.434|73.363
Chuhar Jamali, PK|24.394|67.993
Rawalakot, PK|33.858|73.760
Pir Jo Goth, PK|27.592|68.618
Khairpur Mirs, PK|27.529|68.759
Zhob, PK|31.341|69.449
Zaida, PK|34.059|72.467
Zahir Pir, PK|28.813|70.523
Zafarwal, PK|32.345|74.900
Yazman, PK|29.121|71.745
Wazirabad, PK|32.443|74.120
Washuk, PK|27.727|64.810
Chak Five Hundred Seventy-five, PK|31.545|73.829
Warah, PK|27.448|67.797
Vihari, PK|30.044|72.356
Utmanzai, PK|34.188|71.763
Uthal, PK|25.807|66.622
Usta Muhammad, PK|28.177|68.044
Umarkot, PK|25.363|69.742
Ubauro, PK|28.164|69.731
Turbat, PK|26.001|63.048
Tordher, PK|33.990|72.286
Topi, PK|34.070|72.621
Toba Tek Singh, PK|30.971|72.483
Thul, PK|28.240|68.775
Thatta, PK|24.747|67.924
Tharu Shah, PK|26.942|68.118
Taunsa, PK|30.704|70.651
Tank, PK|32.217|70.383
Tangi, PK|34.301|71.652
Tando Muhammad Khan, PK|25.124|68.537
Tando Jam, PK|25.428|68.529
Tando Bago, PK|24.789|68.965
Tando Allahyar, PK|25.460|68.717
Tando Adam, PK|25.768|68.662
Tandlianwala, PK|31.034|73.133
Talhar, PK|24.885|68.814
Talamba, PK|30.527|72.241
Talagang, PK|32.928|72.416
Thal, PK|35.478|72.244
Swabi, PK|34.120|72.470
Surkhpur, PK|32.718|74.448
Sukkur, PK|27.703|68.859
Sukheke Mandi, PK|31.865|73.509
Sodhri, PK|32.462|74.182
Skardu, PK|35.298|75.634
Sita Road, PK|27.033|67.850
Sinjhoro, PK|26.030|68.809
Sillanwali, PK|31.825|72.541
Sibi, PK|29.543|67.877
Sialkot, PK|32.493|74.531
Shujaabad, PK|29.881|71.293
Shorkot, PK|31.910|70.878
Shikarpur, PK|27.956|68.638
Shekhupura, PK|31.713|73.986
Sharqpur Sharif, PK|31.461|74.101
Shakargarh, PK|32.264|75.160
Shahr Sultan, PK|29.575|71.022
Shahpur Chakar, PK|26.154|68.650
Shahkot, PK|31.571|73.485
Shahdadpur, PK|25.925|68.623
Shahdad Kot, PK|27.847|67.907
Shabqadar, PK|34.216|71.555
Sehwan, PK|26.425|67.861
Sargodha, PK|32.086|72.674
Sarai Sidhu, PK|30.595|71.970
Sarai Naurang, PK|32.826|70.781
Sarai Alamgir, PK|32.905|73.755
Sangla Hill, PK|31.717|73.383
Sanghar, PK|26.047|68.949
Sambrial, PK|32.478|74.353
Sakrand, PK|26.138|68.274
Sahiwal, PK|31.974|72.331
Sahiwal, PK|30.666|73.102
Saddiqabad, PK|28.309|70.127
Rohri, PK|27.692|68.895
Renala Khurd, PK|30.879|73.599
Rawalpindi, PK|33.597|73.048
Ratodero, PK|27.802|68.289
Ranipur, PK|27.287|68.506
Rajanpur, PK|29.104|70.330
Raja Jang, PK|31.221|74.255
Raiwind, PK|31.249|74.215
Rahim Yar Khan, PK|28.420|70.303
Goth Radhan, PK|27.198|67.953
Rabwah, PK|31.755|72.914
Quetta, PK|30.184|67.001
Qubo Saeed Khan, PK|27.874|67.709
Kambar, PK|27.588|68.001
Qadirpur Ran, PK|30.292|71.672
Qabula, PK|30.178|73.065
Pishin, PK|30.582|66.994
Pir Mahal, PK|30.767|72.435
Pindi Gheb, PK|33.241|72.265
Pindi Bhattian, PK|31.898|73.273
Pind Dadan Khan, PK|32.587|73.045
Phalia, PK|32.431|73.579
Peshawar, PK|34.008|71.578
Pattoki, PK|31.020|73.853
Pasrur, PK|32.263|74.663
Pasni, PK|25.263|63.469
Pano Aqil, PK|27.856|69.111
Pallandri, PK|33.715|73.684
Pakpattan, PK|30.343|73.389
Paharpur, PK|32.105|70.971
Pad Idan, PK|26.775|68.301
Pabbi, PK|34.010|71.794
Okara, PK|30.810|73.452
Nushki, PK|29.552|66.023
Nok Kundi, PK|28.827|62.750
New Mirpur City, PK|33.148|73.752
Nawabshah, PK|26.239|68.404
Naushahro Firoz, PK|26.840|68.123
Naushahra Virkan, PK|31.963|73.971
Naudero, PK|27.667|68.361
Nasirabad, PK|27.381|67.916
Narowal, PK|32.102|74.873
Narang Mandi, PK|31.904|74.516
Naukot, PK|24.858|69.402
Nankana Sahib, PK|31.450|73.707
Muzaffargarh, PK|30.073|71.194
Muzaffarabad, PK|34.370|73.471
Mustafabad, PK|30.892|73.499
Murree, PK|33.908|73.390
Muridke, PK|31.803|74.258
Multan, PK|30.197|71.478
Moro, PK|26.663|68.000
Model Town, PK|31.481|74.326
Mithi, PK|24.737|69.797
Mitha Tiwana, PK|32.245|72.106
Mirpur Mathelo, PK|28.021|69.549
Mirpur Khas, PK|25.528|69.013
Mingora, PK|34.779|72.363
Minchinabad, PK|30.164|73.569
Mianwali, PK|32.578|71.528
Mian Sahib, PK|28.153|68.642
Mian Channun, PK|30.441|72.357
Mehrabpur, PK|28.108|68.026
Mehar, PK|27.180|67.821
Matli, PK|25.043|68.656
Matiari, PK|25.597|68.447
Mastung, PK|29.800|66.846
Mardan, PK|34.198|72.050
Mansehra, PK|34.330|73.197
Manjhand, PK|25.908|68.237
Manhala, PK|31.533|74.550
Mangla, PK|31.893|72.382
Mandi Bahauddin, PK|32.587|73.491
Mananwala, PK|31.588|73.689
Mamu Kanjan, PK|30.830|72.799
Malir Cantonment, PK|24.943|67.206
Malakwal, PK|32.554|73.213
Mailsi, PK|29.801|72.174
Mach, PK|29.864|67.330
Loralai, PK|30.371|68.598
Lodhran, PK|29.534|71.632
Layyah, PK|30.961|70.939
Lawa, PK|32.697|71.933
Larkana, PK|27.559|68.212
Lalian, PK|31.825|72.801
Lala Musa, PK|32.701|73.957
Lakki, PK|32.607|70.912
Lahore, PK|31.558|74.351
Ladhewala Waraich, PK|32.157|74.116
Lachi, PK|33.383|71.337
Kuri Dulal, PK|33.384|73.264
Kunri, PK|25.179|69.566
Kunjah, PK|32.530|73.975
Kundian, PK|32.458|71.479
Kulachi, PK|31.931|70.460
Kot Samaba, PK|28.552|70.468
Kotri, PK|25.366|68.308
Kot Radha Kishan, PK|31.171|74.101
Kot Mumin, PK|32.188|73.030
Kot Malik Barkhurdar, PK|30.204|66.987
Kotli Loharan, PK|32.589|74.495
Kotli, PK|33.518|73.902
Kot Ghulam Muhammad, PK|32.333|74.547
Kot Diji, PK|27.342|68.708
Kot Addu, PK|30.469|70.967
Kohat, PK|33.582|71.449
Khuzdar, PK|27.812|66.611
Khushab, PK|32.297|72.353
Khurarianwala, PK|31.499|73.268
Khewra, PK|32.649|73.011
Kharian, PK|32.816|73.887
Kharan, PK|28.585|65.415
Khanpur, PK|28.647|70.657
Khanpur Mahar, PK|27.841|69.413
Khangarh, PK|29.914|71.161
Khangah Dogran, PK|31.833|73.622
Khalabat, PK|34.060|72.890
Khairpur Nathan Shah, PK|27.091|67.735
Khairpur Tamewah, PK|29.581|72.238
Khairpur, PK|28.064|69.704
Garhi Khairo, PK|28.057|67.979
Kasur, PK|31.119|74.450
Kashmor, PK|28.433|69.584
Karor, PK|31.225|70.952
Karachi, PK|24.861|67.010
Kanganpur, PK|30.765|74.123
Kandiaro, PK|27.059|68.210
Kandhkot, PK|28.246|69.180
Kamra, PK|33.747|73.512
Kamoke, PK|31.975|74.223
Chak One Hundred Twenty Nine Left, PK|30.429|73.045
Kamar Mushani, PK|32.843|71.362
Kamalia, PK|30.727|72.646
Kalur Kot, PK|32.155|71.266
Kallar Kahar, PK|32.780|72.698
Kaleke Mandi, PK|31.976|73.600
Kalat, PK|29.027|66.594
Kalabagh, PK|32.962|71.546
Kahuta, PK|33.592|73.387
Kahror Pakka, PK|29.624|71.914
Kahna Nau, PK|31.367|74.369
Kabirwala, PK|30.405|71.863
Johi, PK|26.692|67.614
Jiwani, PK|25.049|61.746
Chak Jhumra, PK|31.568|73.183
Jhol, PK|25.955|68.889
Jhelum, PK|32.934|73.731
Jhawarian, PK|32.362|72.623
Jhang Sadr, PK|31.270|72.317
Jauharabad, PK|32.290|72.282
Jatoi Shimali, PK|29.518|70.845
Jaranwala, PK|31.333|73.419
Jand, PK|33.433|72.019
Jamrud, PK|34.002|71.380
Jampur, PK|29.642|70.595
Jalalpur Pirwala, PK|29.505|71.222
Jalalpur Jattan, PK|32.641|74.206
Jahanian Shah, PK|31.805|72.277
Jahanian, PK|30.039|71.817
Jahangira, PK|33.964|72.221
Jaglot, PK|35.688|74.624
Jacobabad, PK|28.282|68.438
Islamabad, PK|33.721|73.043
Hyderabad, PK|25.397|68.377
Hujra Shah Muqim, PK|30.742|73.823
Hingorja, PK|27.211|68.416
Hazro City, PK|33.910|72.492
Havelian, PK|34.053|73.160
Haveli Lakha, PK|30.451|73.694
Hasilpur, PK|29.692|72.546
Chak Thirty-one -Eleven Left, PK|30.424|72.697
Harunabad, PK|29.612|73.138
Harnoli, PK|32.279|71.554
Haripur, PK|33.998|72.935
Harappa, PK|30.633|72.870
Hangu, PK|33.532|71.059
Hala, PK|25.815|68.422
Haji Shah, PK|33.877|72.328
Hajira, PK|33.774|73.894
Hafizabad, PK|32.071|73.688
Hadali, PK|32.640|74.569
Gwadar, PK|25.122|62.325
Gujrat, PK|32.574|74.075
Gujranwala, PK|32.156|74.187
Gujar Khan, PK|33.254|73.304
Gojra, PK|31.149|72.683
Gilgit, PK|35.919|74.312
Ghotki, PK|28.004|69.316
Ghauspur, PK|28.139|69.082
Gharo, PK|24.742|67.585
Garh Maharaja, PK|30.834|71.905
Gambat, PK|27.352|68.522
Gadani, PK|25.119|66.732
Fort Abbas, PK|29.193|72.855
Fazilpur, PK|32.176|75.066
Fatehpur, PK|31.178|71.205
Fatehjang, PK|33.565|72.643
Faruka, PK|31.886|72.414
Faqirwali, PK|29.468|73.035
Faisalabad, PK|31.416|73.090
Eminabad, PK|32.042|74.260
Dursh Khela, PK|35.000|72.452
Dunyapur, PK|29.803|71.743
Dunga Bunga, PK|29.750|73.243
Dullewala, PK|31.834|71.436
Dokri, PK|27.374|68.097
Upper Dir, PK|35.207|71.877
Dipalpur, PK|30.670|73.653
Dinga, PK|32.641|73.720
Dijkot, PK|31.217|72.996
Digri, PK|25.157|69.111
Dhoro Naro, PK|25.505|69.571
Dhaunkal, PK|32.406|74.137
Dhanot, PK|29.580|71.752
Dera Ismail Khan, PK|31.831|70.902
Dera Ghazi Khan, PK|30.046|70.640
Dera Bugti, PK|29.036|69.158
Daur, PK|26.455|68.318
Daud Khel, PK|32.875|71.571
Daska Kalan, PK|32.324|74.350
Darya Khan, PK|31.784|71.102
Dajal, PK|29.558|70.376
Dadu, PK|26.730|67.777
Dadhar, PK|29.475|67.652
Chunian, PK|30.966|73.979
Chuhar Kana, PK|31.750|73.800
Chhor, PK|25.513|69.784
Choa Saidan Shah, PK|32.720|72.986
Chitral, PK|35.852|71.786
Chishtian, PK|29.797|72.858
Chiniot, PK|31.721|72.978
Chichawatni, PK|30.530|72.692
Chawinda, PK|32.344|74.705
Charsadda, PK|34.148|71.741
Chaman, PK|30.918|66.453
Chakwal, PK|32.933|72.854
Chak Azam Sahu, PK|30.752|73.028
Chak, PK|27.858|68.834
Burewala, PK|30.167|72.650
Buni, PK|36.273|72.259
Bhopalwala, PK|32.430|74.364
Bhit Shah, PK|25.806|68.491
Bhimber, PK|32.975|74.078
Bhera, PK|32.482|72.909
Bhawana, PK|31.569|72.649
Bhaun, PK|32.860|72.757
Bhan, PK|26.558|67.721
Bhalwal, PK|32.266|72.898
Bhakkar, PK|31.627|71.065
Phool Nagar, PK|31.202|73.949
Bela, PK|26.227|66.312
Bat Khela, PK|34.618|71.972
Battagram, PK|34.677|73.023
Basirpur, PK|30.578|73.839
Bannu, PK|32.985|70.604
Karimabad, PK|36.327|74.661
Bahawalpur, PK|29.398|71.675
Bahawalnagar, PK|29.998|73.253
Bagh, PK|33.981|73.776
Baffa, PK|34.438|73.224
Badin, PK|24.656|68.837
Baddomalhi, PK|31.990|74.664
Attock City, PK|33.767|72.360
Arifwala, PK|30.291|73.066
Amangarh, PK|34.006|71.930
Alipur, PK|33.649|73.178
Alipur, PK|29.382|70.911
Akora Khattak, PK|34.003|72.126
Ahmadpur East, PK|29.143|71.258
Abbottabad, PK|34.146|73.212
Bahawalnagar, PK|30.551|73.391
Kamra, PK|33.855|72.394
Nowshera Cantonment, PK|33.998|71.998
Pakistan Employees Cooperative Housing Society, PK|24.874|67.064
Ahmadpur Sial, PK|30.678|71.743
New Badah, PK|27.342|68.032
Kurkali Sindh Pakistan, PK|25.941|68.818
Musa Banda/Musa khan kallay, PK|34.034|72.482
Khai Gala, PK|33.846|73.827
Islamgarh, PK|33.190|73.838
Dera Murad Jamali, PK|28.547|68.223
Setharja Old, PK|27.213|68.469
Sook Kalan, PK|32.597|74.147
Risalpur Cantonment, PK|34.060|71.993
Malakwal City, PK|32.555|73.212
Karachi University Employees Co-operative Housing Society, PK|24.963|67.119
Oghi, PK|34.498|73.014
Dayal, PK|33.312|73.703
Dhirkot, PK|34.039|73.577
Taftan, PK|28.947|61.587
Nowshera Kalan, PK|34.019|71.974
Daharki, PK|28.054|69.702
Arif Wala, PK|26.325|66.296
Chaksawari, PK|33.264|73.785
Alahabad, PK|30.877|74.055
Wah Cantt, PK|33.771|72.751
Hub, PK|25.026|66.885
Zyrardow, PL|52.049|20.446
Zoliborz, PL|52.269|20.986
Zielonka, PL|52.304|21.160
Zamosc, PL|50.723|23.252
Zambrow, PL|52.986|22.243
Zabki, PL|52.293|21.105
Wyszkow, PL|52.593|21.458
Wolomin, PL|52.340|21.242
Wola, PL|52.235|20.960
Wlochy, PL|52.179|20.946
Wieliczka, PL|49.987|20.065
Wesola, PL|52.255|21.224
Wawer, PL|52.197|21.178
Warsaw, PL|52.230|21.012
Ursus, PL|52.195|20.884
Tomaszow Mazowiecki, PL|51.531|20.009
Tomaszow Lubelski, PL|50.448|23.416
Tarnow, PL|50.014|20.987
Tarnobrzeg, PL|50.573|21.679
Targowek, PL|52.292|21.048
Szczytno, PL|53.563|20.987
Swidnik, PL|51.219|22.696
Suwalki, PL|54.112|22.931
Sulejowek, PL|52.252|21.269
Staszow, PL|50.563|21.166
Starachowice, PL|51.037|21.071
Stalowa Wola, PL|50.583|22.053
Srodmiescie, PL|52.229|21.016
Sokolow Podlaski, PL|52.407|22.253
Sokolka, PL|53.407|23.502
Sochaczew, PL|52.229|20.238
Skierniewice, PL|51.955|20.158
Skarzysko-Kamienna, PL|51.113|20.872
Siemiatycze, PL|52.427|22.862
Siedlce, PL|52.168|22.290
Sanok, PL|49.556|22.206
Sandomierz, PL|50.683|21.749
Rzeszow, PL|50.041|21.999
Ropczyce, PL|50.052|21.609
Rembertow, PL|52.261|21.164
Rawa Mazowiecka, PL|51.764|20.255
Radzyn Podlaski, PL|51.783|22.617
Radom, PL|51.403|21.147
Pultusk, PL|52.703|21.083
Pulawy, PL|51.417|21.969
Przeworsk, PL|50.059|22.494
Przemysl, PL|49.785|22.767
Przasnysz, PL|53.019|20.880
Pruszkow, PL|52.171|20.812
Plonsk, PL|52.623|20.376
Pisz, PL|53.627|21.813
Pionki, PL|51.476|21.450
Piastow, PL|52.184|20.840
Piaseczno, PL|52.081|21.024
Otwock, PL|52.106|21.261
Ostrow Mazowiecka, PL|52.802|21.895
Ostrowiec Swietokrzyski, PL|50.929|21.385
Ostroleka, PL|53.086|21.576
Opoczno, PL|51.376|20.278
Olsztyn, PL|53.784|20.493
Olecko, PL|54.034|22.507
Ochota, PL|52.221|20.985
Nowy Targ, PL|49.478|20.032
Nowy Sacz, PL|49.622|20.697
Nowy Dwor Mazowiecki, PL|52.430|20.717
Nisko, PL|50.520|22.140
Mragowo, PL|53.864|21.305
Mokotow, PL|52.193|21.035
Mlawa, PL|53.113|20.384
Minsk Mazowiecki, PL|52.179|21.573
Milanowek, PL|52.119|20.672
Mielec, PL|50.287|21.424
Miedzyrzec Podlaski, PL|51.986|22.782
Marki, PL|52.321|21.105
Lukow, PL|51.929|22.380
Lublin, PL|51.251|22.570
Lubartow, PL|51.460|22.610
Lomza, PL|53.178|22.059
Lomianki, PL|52.334|20.886
Lidzbark Warminski, PL|54.126|20.580
Legionowo, PL|52.401|20.927
Leczna, PL|51.301|22.881
Lapy, PL|52.991|22.884
Lancut, PL|50.069|22.229
Krosno, PL|49.689|21.771
Krasnystaw, PL|50.985|23.174
Krasnik, PL|50.924|22.227
Kozienice, PL|51.583|21.548
Konstancin-Jeziorna, PL|52.094|21.118
Konskie, PL|51.192|20.406
Kobylka, PL|52.340|21.196
Kielce, PL|50.870|20.628
Ketrzyn, PL|54.077|21.375
Kabaty, PL|52.130|21.081
Jozefow, PL|52.137|21.236
Jedrzejow, PL|50.639|20.305
Jaslo, PL|49.745|21.473
Jaroslaw, PL|50.016|22.678
Hrubieszow, PL|50.805|23.893
Hajnowka, PL|52.743|23.581
Grodzisk Mazowiecki, PL|52.104|20.634
Grajewo, PL|53.647|22.455
Gorlice, PL|49.656|21.160
Gizycko, PL|54.038|21.764
Gierloz, PL|54.081|21.496
Garwolin, PL|51.897|21.615
Elk, PL|53.828|22.365
Dzialdowo, PL|53.240|20.170
Deblin, PL|51.559|21.848
Debica, PL|50.051|21.411
Ciechanow, PL|52.881|20.620
Chelm, PL|51.143|23.472
Busko-Zdroj, PL|50.471|20.719
Brzesko, PL|49.969|20.606
Bochnia, PL|49.969|20.430
Bilgoraj, PL|50.541|22.722
Bienczyce, PL|50.088|20.028
Bielsk Podlaski, PL|52.765|23.186
Bielany, PL|52.292|20.935
Bialystok, PL|53.133|23.164
Bialoleka, PL|52.321|20.972
Biala Podlaska, PL|52.032|23.117
Bemowo, PL|52.255|20.908
Bartoszyce, PL|54.254|20.808
Augustow, PL|53.843|22.980
Zywiec, PL|49.685|19.192
Zory, PL|50.045|18.701
Zlotow, PL|53.363|17.041
Zlotoryja, PL|51.126|15.920
Zielona Gora, PL|51.935|15.506
Zgorzelec, PL|51.149|15.008
Zgierz, PL|51.856|19.406
Zdunska Wola, PL|51.599|18.940
Zawiercie, PL|50.488|19.417
Zary, PL|51.642|15.137
Zakopane, PL|49.299|19.949
Zagan, PL|51.618|15.315
Zabrze, PL|50.325|18.786
Zabkowice Slaskie, PL|50.590|16.812
Wrzeszcz, PL|54.376|18.608
Wrzesnia, PL|52.325|17.565
Wroclaw, PL|51.103|17.030
Wodzislaw Slaski, PL|50.004|18.472
Wloclawek, PL|52.648|19.068
Wielun, PL|51.221|18.570
Wejherowo, PL|54.606|18.236
Walcz, PL|53.278|16.471
Walbrzych, PL|50.771|16.284
Wagrowiec, PL|52.808|17.200
Wadowice, PL|49.883|19.493
Ustron, PL|49.722|18.802
Ustka, PL|54.580|16.862
Tychy, PL|50.137|18.966
Turek, PL|52.015|18.501
Trzebinia, PL|50.159|19.470
Trzcianka, PL|53.041|16.456
Torun, PL|53.014|18.598
Tczew, PL|54.092|18.778
Tarnowskie Gory, PL|50.445|18.861
Szczecinek, PL|53.708|16.699
Szczecin, PL|53.429|14.553
Szamotuly, PL|52.612|16.578
Swinoujscie, PL|53.911|14.247
Swietochlowice, PL|50.296|18.917
Swiebodzin, PL|52.248|15.534
Swiecie, PL|53.410|18.447
Swiebodzice, PL|50.860|16.320
Swidwin, PL|53.775|15.777
Swidnica, PL|50.844|16.489
Swarzedz, PL|52.413|17.085
Sulechow, PL|52.084|15.625
Strzelce Opolskie, PL|50.511|18.301
Strzegom, PL|50.963|16.350
Starogard Gdanski, PL|53.964|18.526
Stargard, PL|53.337|15.050
Sroda Wielkopolska, PL|52.228|17.276
Srem, PL|52.089|17.015
Sosnowiec, PL|50.287|19.104
Sopot, PL|54.442|18.560
Solec Kujawski, PL|53.084|18.226
Slupsk, PL|54.464|17.029
Slubice, PL|52.351|14.561
Skawina, PL|49.975|19.829
Sierpc, PL|52.857|19.669
Sieradz, PL|51.596|18.730
Siemianowice Slaskie, PL|50.327|19.029
Rypin, PL|53.066|19.409
Rydultowy, PL|50.059|18.417
Rybnik, PL|50.097|18.542
Rumia, PL|54.571|18.388
Ruda Slaska, PL|50.258|18.856
Reda, PL|54.605|18.347
Rawicz, PL|51.609|16.859
Radzionkow, PL|50.400|18.902
Radomsko, PL|51.067|19.445
Radlin, PL|50.050|18.476
Raciborz, PL|50.092|18.219
Pyskowice, PL|50.400|18.633
Pszczyna, PL|49.980|18.954
Pruszcz Gdanski, PL|54.262|18.636
Prudnik, PL|50.321|17.575
Poznan, PL|52.407|16.930
Polkowice, PL|51.504|16.073
Police, PL|53.552|14.572
Plock, PL|52.547|19.706
Pleszew, PL|51.896|17.785
Piotrkow Trybunalski, PL|51.405|19.703
Pila, PL|53.151|16.738
Piekary Slaskie, PL|50.380|18.927
Pabianice, PL|51.664|19.355
Ozorkow, PL|51.963|19.291
Oswiecim, PL|50.034|19.210
Ostrow Wielkopolski, PL|51.655|17.807
Ostroda, PL|53.697|19.965
Osowa, PL|54.431|18.467
Orzesze, PL|50.156|18.779
Opole, PL|50.671|17.926
Olkusz, PL|50.281|19.565
Olesnica, PL|51.213|17.390
Olawa, PL|50.947|17.293
Oborniki, PL|52.647|16.814
Nysa, PL|50.474|17.334
Nowy Tomysl, PL|52.319|16.128
Nowogard, PL|53.674|15.116
Nowa Sol, PL|51.803|15.717
Nowa Ruda, PL|50.580|16.502
Namyslow, PL|51.076|17.723
Naklo nad Notecia, PL|53.142|17.602
Myszkow, PL|50.575|19.325
Myslowice, PL|50.207|19.167
Myslenice, PL|49.834|19.938
Mikolow, PL|50.171|18.904
Miedzyrzecz, PL|52.445|15.578
Malbork, PL|54.036|19.027
Lubon, PL|52.347|16.893
Lubliniec, PL|50.669|18.684
Lubin, PL|51.401|16.201
Luban, PL|51.120|15.288
Lowicz, PL|52.107|19.945
Lodz, PL|51.771|19.474
Libiaz, PL|50.104|19.316
Leszno, PL|51.840|16.575
Legnica, PL|51.210|16.162
Ledziny, PL|50.143|19.131
Leczyca, PL|52.060|19.200
Lebork, PL|54.539|17.750
Laziska Gorne, PL|50.150|18.842
Lask, PL|51.591|19.133
Kwidzyn, PL|53.725|18.931
Kutno, PL|52.231|19.364
Krotoszyn, PL|51.699|17.437
Krapkowice, PL|50.475|17.965
Krakow, PL|50.061|19.937
Koszalin, PL|54.194|16.172
Kostrzyn nad Odra, PL|52.587|14.650
Koscierzyna, PL|54.122|17.981
Koscian, PL|52.088|16.649
Konstantynow Lodzki, PL|51.748|19.326
Konin, PL|52.223|18.251
Kolobrzeg, PL|54.176|15.583
Kolo, PL|52.200|18.639
Knurow, PL|50.220|18.651
Kluczbork, PL|50.973|18.218
Klodzko, PL|50.435|16.661
Kety, PL|49.882|19.223
Kedzierzyn-Kozle, PL|50.350|18.226
Katowice, PL|50.260|19.022
Kartuzy, PL|54.334|18.197
Kamienna Gora, PL|50.783|16.030
Kalisz, PL|51.761|18.091
Jelenia Gora, PL|50.900|15.729
Jelcz, PL|51.021|17.321
Jaworzno, PL|50.205|19.275
Jawor, PL|51.051|16.193
Jastrzebie Zdroj, PL|49.955|18.575
Jarocin, PL|51.973|17.503
Inowroclaw, PL|52.799|18.264
Ilawa, PL|53.596|19.568
Gubin, PL|51.950|14.728
Grzegorzki, PL|50.064|19.968
Gryfino, PL|53.252|14.488
Gryfice, PL|53.916|15.200
Grudziadz, PL|53.484|18.754
Gostynin, PL|52.429|19.462
Gostyn, PL|51.882|17.012
Gorzow Wielkopolski, PL|52.734|15.225
Goleniow, PL|53.564|14.829
Gniezno, PL|52.535|17.583
Glucholazy, PL|50.315|17.384
Glowno, PL|51.965|19.716
Glogow, PL|51.664|16.084
Gliwice, PL|50.298|18.677
Gdynia, PL|54.519|18.532
Gdansk, PL|54.352|18.649
Fordon, PL|53.148|18.170
Elblag, PL|54.152|19.409
Dzierzoniow, PL|50.728|16.651
Dabrowa Gornicza, PL|50.334|19.205
Czestochowa, PL|50.796|19.124
Czerwionka-Leszczyny, PL|50.150|18.678
Czeladz, PL|50.315|19.078
Czechowice-Dziedzice, PL|49.913|19.005
Cieszyn, PL|49.751|18.632
Chrzanow, PL|50.135|19.402
Choszczno, PL|53.169|15.421
Chorzow, PL|50.306|18.974
Chojnice, PL|53.696|17.557
Chodziez, PL|52.995|16.920
Chelmza, PL|53.185|18.605
Chelmno, PL|53.349|18.425
Bytow, PL|54.171|17.492
Bytom, PL|50.348|18.933
Bydgoszcz, PL|53.123|18.008
Brzeg, PL|50.861|17.467
Brodnica, PL|53.260|19.397
Braniewo, PL|54.380|19.820
Boleslawiec, PL|51.264|15.570
Boguszow-Gorce, PL|50.755|16.205
Bogatynia, PL|50.907|14.956
Bierun, PL|50.090|19.093
Bielsko-Biala, PL|49.822|19.047
Bielawa, PL|50.691|16.623
Bialogard, PL|54.007|15.988
Belchatow, PL|51.369|19.357
Bedzin, PL|50.326|19.126
Andrychow, PL|49.855|19.338
Aleksandrow Lodzki, PL|51.820|19.304
Ursynow, PL|52.151|21.050
Praga Polnoc, PL|52.254|21.035
Praga Poludnie, PL|52.244|21.085
Jelcz Laskowice, PL|51.021|17.316
Gajowice, PL|51.096|17.002
Gadow-Popowice Poludniowe, PL|51.127|16.970
Pilczyce-Kozanow-Popowice Polnocne, PL|51.131|16.977
Gaj, PL|51.080|17.040
Huby, PL|51.089|17.041
Krzyki-Partynice, PL|51.064|17.002
Osiedle Powstancow Slaskich, PL|51.093|17.021
Przedmiescie Olawskie, PL|51.102|17.048
Karlowice-Rozanka, PL|51.137|17.043
Psie Pole Zawidawie, PL|51.148|17.114
Szczepin, PL|51.116|17.010
Biskupin-Sepolno-Dabie-Bartoszowice, PL|51.108|17.091
Nadodrze, PL|51.125|17.031
Olbin, PL|51.121|17.053
Chelm, PL|54.340|18.619
Piecki-Migowo, PL|54.357|18.582
Przymorze Wielkie, PL|54.412|18.598
Srodmiescie, PL|54.350|18.656
Ujescisko-Lostowice, PL|54.324|18.603
Wrzeszcz Dolny, PL|54.385|18.613
Wrzeszcz Gorny, PL|54.380|18.595
Drzetowo-Grabowo, PL|53.449|14.579
Swierczewo, PL|53.427|14.513
Osiedle Kosmonautow, PL|51.128|16.962
Rejon placu Grunwaldzkiego, PL|51.117|17.061
Rejon ulicy Traugutta, PL|51.102|17.048
Kozanow, PL|51.144|16.969
Rejon placu Swietego Macieja, PL|51.121|17.038
Rozanka-Polanka, PL|51.143|17.020
Orunia Gorna-Gdansk Poludnie, PL|54.325|18.616
Srodmiescie, PL|51.113|17.081
Psie Pole, PL|51.146|17.035
Saint-Pierre, PM|46.779|-56.177
Adamstown, PN|-25.066|-130.101
Aguadilla, PR|18.427|-67.154
Arecibo, PR|18.472|-66.716
Barceloneta, PR|18.451|-66.539
Bayamon, PR|18.399|-66.156
Caguas, PR|18.234|-66.049
Candelaria, PR|18.404|-66.209
Carolina, PR|18.381|-65.957
Catano, PR|18.441|-66.118
Cayey, PR|18.112|-66.166
Fajardo, PR|18.326|-65.652
Guayama, PR|17.984|-66.114
Guaynabo, PR|18.357|-66.111
Humacao, PR|18.150|-65.827
Levittown, PR|18.450|-66.182
Manati, PR|18.427|-66.492
Mayagueez, PR|18.201|-67.140
Ponce, PR|18.010|-66.624
San Juan, PR|18.466|-66.106
Trujillo Alto, PR|18.355|-66.007
Vega Baja, PR|18.444|-66.388
Yauco, PR|18.035|-66.850
Rafah, PS|31.297|34.244
An Nusayrat, PS|31.449|34.392
Khan Yunis, PS|31.340|34.306
Jabalya, PS|31.527|34.483
Gaza, PS|31.502|34.467
Dayr al Balah, PS|31.418|34.349
Bayt Lahya, PS|31.546|34.495
Bayt Hanun, PS|31.535|34.536
Bani Suhayla, PS|31.343|34.323
Al Burayj, PS|31.439|34.403
Abasan al Kabirah, PS|31.319|34.340
Yatta, PS|31.446|35.094
Tulkarm, PS|32.312|35.027
Tubas, PS|32.321|35.370
Surif City, PS|31.651|35.064
Sair, PS|31.579|35.140
Shufat, PS|31.817|35.227
Ramallah, PS|31.900|35.204
Qalqilyah, PS|32.190|34.971
Qabatiyah, PS|32.410|35.281
Nablus, PS|32.221|35.254
Maale Adummim, PS|31.777|35.299
Janin, PS|32.459|35.301
Idhna, PS|31.559|34.974
Halhul, PS|31.580|35.102
Dura, PS|31.508|35.029
Bethlehem, PS|31.705|35.204
Bayt Jala, PS|31.715|35.188
Bayt Hanina, PS|31.830|35.225
Battir, PS|31.700|35.117
Bani Naim, PS|31.516|35.164
Balatah, PS|32.212|35.286
Az Zahiriyah, PS|31.410|34.973
Atarut, PS|31.867|35.217
As Samu, PS|31.397|35.066
Ar Ram wa Dahiyat al Barid, PS|31.849|35.234
Jericho, PS|31.867|35.450
Al Yamun, PS|32.486|35.230
Hebron, PS|31.529|35.094
Al Birah, PS|31.910|35.216
Al Ayzariyah, PS|31.771|35.269
Old City, PS|31.777|35.234
Al Qararah, PS|31.374|34.341
Az Zuwaydah, PS|31.440|34.381
East Jerusalem, PS|31.783|35.234
Vila Franca de Xira, PT|38.955|-8.990
Vialonga, PT|38.872|-9.078
Torres Vedras, PT|39.091|-9.259
Torres Novas, PT|39.476|-8.543
Tomar, PT|39.602|-8.409
Tavira, PT|37.127|-7.649
Sintra, PT|38.801|-9.378
Sesimbra, PT|38.445|-9.101
Setubal, PT|38.524|-8.888
Sete Rios, PT|38.741|-9.161
Sao Martinho, PT|32.645|-16.938
Sao Joao da Talha, PT|38.824|-9.097
Sao Domingos de Rana, PT|38.702|-9.341
Santo Antonio, PT|32.661|-16.935
Santarem, PT|39.234|-8.686
Santa Iria da Azoia, PT|38.841|-9.099
Sacavem, PT|38.792|-9.108
Rio de Mouro, PT|38.766|-9.328
Ramada, PT|38.804|-9.188
Queluz, PT|38.757|-9.255
Quelfes, PT|37.060|-7.822
Quarteira, PT|37.069|-8.101
Povoa de Santa Iria, PT|38.861|-9.065
Porto de Mos, PT|37.085|-8.684
Portimao, PT|37.139|-8.538
Portalegre, PT|39.294|-7.431
Pontinha, PT|38.768|-9.199
Pombal, PT|39.917|-8.628
Pinhal Novo, PT|38.631|-8.914
Piedade, PT|38.670|-9.159
Peniche, PT|39.356|-9.381
Parede, PT|38.693|-9.354
Palmela, PT|38.569|-8.901
Paco de Arcos, PT|38.696|-9.291
Olival, PT|38.771|-9.250
Olivais, PT|38.770|-9.107
Olhao, PT|37.029|-7.841
Oeiras, PT|38.691|-9.311
Odivelas, PT|38.793|-9.184
Moscavide e Portela, PT|38.779|-9.102
Montijo, PT|38.707|-8.974
Monte Estoril, PT|38.706|-9.406
Monsanto, PT|39.462|-8.712
Moita, PT|38.651|-8.990
Massama, PT|38.753|-9.281
Marvila, PT|38.740|-9.102
Marinha Grande, PT|39.748|-8.932
Lumiar, PT|38.775|-9.156
Loures, PT|38.831|-9.168
Loule, PT|37.138|-8.020
Lisbon, PT|38.725|-9.150
Linda-a-Velha, PT|38.714|-9.242
Leiria, PT|39.744|-8.807
Lavradio, PT|38.668|-9.052
Laranjeiro, PT|37.068|-7.808
Laranjeiro, PT|38.656|-9.154
Lagos, PT|37.102|-8.674
Funchal, PT|32.666|-16.925
Faro, PT|37.019|-7.927
Falagueira, PT|38.764|-9.228
Evora, PT|38.566|-7.904
Estoril, PT|38.706|-9.398
Entroncamento, PT|39.467|-8.467
Damaia, PT|38.751|-9.212
Corroios, PT|38.640|-9.151
Charneca de Caparica, PT|38.620|-9.194
Castelo Branco, PT|39.824|-7.491
Cascais, PT|38.697|-9.421
Carnide, PT|38.767|-9.183
Carnaxide, PT|38.727|-9.247
Carcavelos, PT|38.691|-9.322
Caparica, PT|38.662|-9.200
Canico, PT|32.651|-16.837
Campo Grande, PT|38.755|-9.167
Camarate, PT|38.804|-9.128
Camara de Lobos, PT|32.650|-16.977
Caldas da Rainha, PT|39.403|-9.138
Cacem, PT|38.767|-9.298
Buraca, PT|38.733|-9.200
Benfica, PT|38.751|-9.203
Belem, PT|38.699|-9.193
Belas, PT|38.777|-9.264
Beja, PT|38.015|-7.863
Barreiro, PT|38.663|-9.072
Azambuja, PT|39.070|-8.868
Arrentela, PT|38.625|-9.102
Areeiro, PT|38.741|-9.138
Amora, PT|38.630|-9.116
Amadora, PT|38.754|-9.231
Almada, PT|38.679|-9.157
Algueirao, PT|38.798|-9.344
Alges, PT|38.702|-9.229
Alfornelos, PT|38.761|-9.205
Alcobaca, PT|39.552|-8.977
Alcantara, PT|38.701|-9.171
Alcabideche, PT|38.734|-9.409
Albufeira, PT|37.088|-8.250
Viseu, PT|40.662|-7.909
Vila Real, PT|41.300|-7.743
Vilar de Andorinho, PT|41.106|-8.586
Vilar, PT|40.627|-8.632
Vila Nova de Gaia, PT|41.124|-8.612
Vila do Conde, PT|41.353|-8.745
Viana do Castelo, PT|41.693|-8.833
Vermoim, PT|41.243|-8.607
Valongo, PT|41.189|-8.499
Valadares, PT|41.093|-8.632
Trofa, PT|41.337|-8.560
Sequeira, PT|40.554|-7.226
Senhora da Hora, PT|41.186|-8.652
Sao Tiago de Custoias, PT|41.200|-8.633
Sao Pedro da Cova, PT|41.143|-8.500
Sao Paulo de Frades, PT|40.247|-8.394
Sao Martinho do Bispo, PT|40.210|-8.457
Sao Mamede de Infesta, PT|41.192|-8.611
Sao Joao da Madeira, PT|40.901|-8.490
Santo Ovidio, PT|41.114|-8.602
Santo Antonio dos Olivais, PT|40.218|-8.405
Rio Tinto, PT|41.179|-8.560
Ribeira de Frades, PT|40.205|-8.479
Povoa de Varzim, PT|41.383|-8.764
Porto, PT|41.148|-8.611
Ponte de Lima, PT|41.767|-8.584
Pedroso, PT|41.411|-8.749
Paredes, PT|41.205|-8.331
Paranhos, PT|41.173|-8.599
Ovar, PT|40.859|-8.625
Oliveira do Douro, PT|41.125|-8.585
Moncao, PT|42.079|-8.481
Matosinhos, PT|41.182|-8.689
Maia, PT|41.236|-8.620
Lordelo do Ouro, PT|41.151|-8.648
Leca do Bailio, PT|41.212|-8.634
Leca da Palmeira, PT|41.191|-8.700
Ilhavo, PT|40.602|-8.670
Guimaraes, PT|41.444|-8.296
Guarda, PT|40.538|-7.266
Gondomar, PT|41.145|-8.532
Figueira da Foz, PT|40.151|-8.862
Felgueiras, PT|41.368|-8.194
Feira, PT|40.925|-8.543
Fanzeres, PT|41.168|-8.530
Fafe, PT|41.451|-8.173
Esposende, PT|41.536|-8.782
Espinho, PT|41.008|-8.641
Ermesinde, PT|41.217|-8.553
Eiras, PT|40.248|-8.415
Custoias, PT|41.105|-7.321
Covilha, PT|40.281|-7.505
Condeixa-a-Nova, PT|40.113|-8.498
Coimbra, PT|40.207|-8.420
Chaves, PT|41.740|-7.469
Canidelo, PT|41.123|-8.647
Campanha, PT|41.157|-8.575
Cabeceiras de Basto, PT|41.514|-7.989
Braganca, PT|41.807|-6.759
Braga, PT|41.551|-8.423
Bougado, PT|41.340|-8.552
Bomfim, PT|41.154|-8.587
Barcelos, PT|41.532|-8.618
Bairro Novo, PT|41.543|-8.407
Baiao, PT|41.163|-8.035
Baguim do Monte, PT|41.192|-8.541
Aveiro, PT|40.646|-8.646
Arouca, PT|40.931|-8.245
Arcos de Valdevez, PT|41.847|-8.419
Alfena, PT|41.237|-8.525
Aldoar, PT|41.167|-8.669
Aguas Santas, PT|41.210|-8.576
Afurada de Baixo, PT|41.144|-8.646
Quinta Do Conde, PT|38.565|-9.043
Alfragide, PT|38.732|-9.219
Alvalade, PT|38.753|-9.144
Ponta Delgada, PT|37.740|-25.669
Sao Jorge de Arroios, PT|38.729|-9.138
Azeitao, PT|38.519|-9.014
Parque das Nacoes, PT|38.769|-9.096
Cidade Universitaria, PT|38.752|-9.159
Campo De Ourique, PT|38.721|-9.167
Ngerulmud, PW|7.501|134.624
Yby Yau, PY|-22.966|-56.541
Villeta, PY|-25.507|-57.566
Villarrica, PY|-25.749|-56.435
Villa Hayes, PY|-25.093|-57.527
Villa Elisa, PY|-25.368|-57.593
San Lorenzo, PY|-25.340|-57.509
San Juan Bautista, PY|-26.670|-57.141
San Antonio, PY|-25.421|-57.547
Presidente Franco, PY|-25.564|-54.611
Pilar, PY|-26.859|-58.306
Pedro Juan Caballero, PY|-22.549|-55.739
Nemby, PY|-25.395|-57.536
Loma Plata, PY|-22.383|-59.835
Limpio, PY|-25.166|-57.486
Lambare, PY|-25.347|-57.606
Doctor Juan Eulogio Estigarribia, PY|-25.372|-55.705
Itaugua, PY|-25.393|-57.354
Ita, PY|-25.501|-57.367
Fernando de la Mora, PY|-25.339|-57.522
Encarnacion, PY|-27.332|-55.867
Coronel Oviedo, PY|-25.446|-56.439
Concepcion, PY|-23.400|-57.432
Mariano Roque Alonso, PY|-25.208|-57.532
Ciudad del Este, PY|-25.504|-54.651
Capiata, PY|-25.355|-57.445
Caazapa, PY|-26.197|-56.368
Caaguazu, PY|-25.471|-56.016
Caacupe, PY|-25.386|-57.142
Asuncion, PY|-25.286|-57.647
Filadelfia, PY|-22.339|-60.032
Al Unayzah, QA|25.338|51.510
Umm Salal Muhammad, QA|25.415|51.406
Umm Ghuwaylinah, QA|25.587|51.150
Nuayjah, QA|25.246|51.532
Muaydhir Rawdat Rashid, QA|25.262|51.397
Madinat Khalifah, QA|25.320|51.478
Az Zaayin, QA|25.577|51.483
Ar Rayyan, QA|25.292|51.424
Al Wakrah, QA|25.172|51.603
Al Khawr, QA|25.684|51.506
Doha, QA|25.285|51.531
As Sultah al Jadidah, QA|25.260|51.514
Al Mansurah, QA|25.268|51.532
An Najmah, QA|25.267|51.543
Al Hilal al Gharbiyah, QA|25.259|51.531
Al Hilal ash Sharqiyah, QA|25.260|51.546
Al Ghanim, QA|25.280|51.540
As Sadd, QA|25.286|51.501
Umm Lakhba, QA|25.342|51.471
Farij Kulayb, QA|25.313|51.493
Al Matar al Atiq, QA|25.251|51.556
Ath Thumamah Sabah wa Arbaun, QA|25.239|51.563
Ath Thumamah Sittah wa Arbaun, QA|25.234|51.541
Ath Thumamah Khamsun, QA|25.220|51.553
Farij al Amir, QA|25.287|51.471
Lusail, QA|25.418|51.508
Saint-Pierre, RE|-21.339|55.478
Saint-Paul, RE|-21.010|55.271
Saint-Louis, RE|-21.286|55.411
Saint-Leu, RE|-21.171|55.288
Saint-Joseph, RE|-21.378|55.617
Sainte-Suzanne, RE|-20.906|55.608
Sainte-Marie, RE|-20.897|55.551
Saint-Denis, RE|-20.882|55.450
Saint-Benoit, RE|-21.038|55.715
Saint-Andre, RE|-20.963|55.650
Le Tampon, RE|-21.277|55.518
Le Port, RE|-20.938|55.294
La Possession, RE|-20.929|55.335
Piton Saint-Leu, RE|-21.220|55.315
Zimnicea, RO|43.656|25.365
Zarnesti, RO|45.561|25.318
Zalau, RO|47.200|23.050
Vulcan, RO|45.383|23.267
Voluntari, RO|44.490|26.173
Viseu de Sus, RO|47.708|24.430
Vatra Dornei, RO|47.350|25.367
Vaslui, RO|46.633|27.733
Urziceni, RO|44.717|26.633
Turnu Magurele, RO|43.747|24.868
Turda, RO|46.567|23.783
Tulcea, RO|45.179|28.805
Tarnaveni, RO|46.332|24.297
Targu Secuiesc, RO|46.000|26.133
Targu Neamt, RO|47.200|26.367
Targu Mures, RO|46.542|24.557
Targu Jiu, RO|45.050|23.283
Targoviste, RO|44.925|25.457
Timisoara, RO|45.754|21.226
Tecuci, RO|45.850|27.434
Suceava, RO|47.633|26.250
Slatina, RO|44.433|24.367
Simleu Silvaniei, RO|47.233|22.800
Sighetu Marmatiei, RO|47.932|23.886
Sibiu, RO|45.800|24.150
Sfantu Gheorghe, RO|45.867|25.783
Sebes, RO|45.956|23.571
Satu Mare, RO|47.799|22.863
Salonta, RO|46.800|21.650
Sacele, RO|45.617|25.711
Rosiorii de Vede, RO|44.117|24.983
Roman, RO|46.921|26.926
Rasnov, RO|45.583|25.450
Ramnicu Valcea, RO|45.100|24.367
Ramnicu Sarat, RO|45.383|27.050
Resita, RO|45.301|21.889
Reghin-Sat, RO|46.783|24.717
Radauti, RO|47.850|25.917
Popesti-Leordeni, RO|44.383|26.167
Ploiesti, RO|44.950|26.017
Pitesti, RO|44.850|24.867
Piatra Neamt, RO|46.917|26.333
Petrosani, RO|45.417|23.367
Petrila, RO|45.450|23.417
Pantelimon, RO|44.450|26.200
Orastie, RO|45.833|23.200
Oradea, RO|47.046|21.918
Oltenita, RO|44.083|26.633
Odorheiu Secuiesc, RO|46.300|25.300
Ocna Mures, RO|46.383|23.850
Navodari, RO|44.317|28.600
Motru, RO|44.803|22.972
Moreni, RO|44.983|25.644
Moinesti, RO|46.475|26.489
Mizil, RO|45.017|26.450
Miercurea-Ciuc, RO|46.350|25.800
Medias, RO|46.167|24.350
Medgidia, RO|44.250|28.283
Mangalia, RO|43.816|28.577
Lupeni, RO|45.360|23.238
Lugoj, RO|45.689|21.903
Ludus, RO|46.483|24.100
Iasi, RO|47.167|27.600
Husi, RO|46.674|28.059
Hunedoara, RO|45.750|22.900
Gura Humorului, RO|47.550|25.900
Giurgiu, RO|43.887|25.963
Gherla, RO|47.033|23.917
Gheorgheni, RO|46.723|25.601
Galati, RO|45.437|28.050
Gaesti, RO|44.717|25.317
Focsani, RO|45.700|27.183
Filiasi, RO|44.550|23.517
Fetesti-Gara, RO|44.420|27.825
Fetesti, RO|44.383|27.833
Falticeni, RO|47.450|26.300
Fagaras, RO|45.850|24.967
Drobeta-Turnu Severin, RO|44.627|22.653
Dragasani, RO|44.650|24.267
Dorohoi, RO|47.950|26.400
Deva, RO|45.883|22.900
Dej, RO|47.150|23.867
Curtea de Arges, RO|45.134|24.674
Cugir, RO|45.837|23.370
Craiova, RO|44.317|23.800
Corabia, RO|43.775|24.501
Constanta, RO|44.181|28.634
Comanesti, RO|46.421|26.436
Codlea, RO|45.700|25.450
Cluj-Napoca, RO|46.767|23.600
Cisnadie, RO|45.717|24.150
Campulung Moldovenesc, RO|47.533|25.567
Campina, RO|45.126|25.735
Campia Turzii, RO|46.550|23.883
Cernavoda, RO|44.340|28.033
Carei, RO|47.683|22.467
Caransebes, RO|45.417|22.217
Caracal, RO|44.117|24.350
Calafat, RO|43.991|22.933
Buzau, RO|45.150|26.833
Buhusi, RO|46.717|26.700
Buftea, RO|44.561|25.949
Bucharest, RO|44.432|26.106
Breaza, RO|45.183|25.667
Brasov, RO|45.649|25.606
Braila, RO|45.272|27.974
Brad, RO|46.133|22.783
Botosani, RO|47.750|26.667
Borsa, RO|47.655|24.663
Bocsa, RO|45.373|21.709
Blaj, RO|46.175|23.916
Bistrita, RO|47.133|24.500
Barlad, RO|46.232|27.669
Bals, RO|44.350|24.100
Bailesti, RO|44.017|23.350
Baicoi, RO|45.033|25.850
Baia Sprie, RO|47.662|23.692
Baia Mare, RO|47.657|23.568
Bacau, RO|46.567|26.914
Arad, RO|46.183|21.317
Alexandria, RO|43.983|25.333
Alba Iulia, RO|46.067|23.583
Aiud, RO|46.310|23.721
Adjud, RO|46.099|27.181
Pascani, RO|47.247|26.723
Mioveni, RO|44.959|24.942
Sighisoara, RO|46.221|24.793
Slobozia, RO|44.565|27.363
Sector 1, RO|44.492|26.048
Sector 2, RO|44.453|26.133
Sector 3, RO|44.423|26.169
Sector 4, RO|44.376|26.121
Sector 5, RO|44.388|26.071
Sector 6, RO|44.436|26.016
Zrenjanin, RS|45.384|20.382
Zemun, RS|44.846|20.401
Zajecar, RS|43.904|22.264
Vrsac, RS|45.117|21.304
Vranje, RS|42.551|21.900
Trstenik, RS|43.617|21.003
Stara Pazova, RS|44.985|20.161
Sremcica, RS|44.677|20.392
Smederevska Palanka, RS|44.365|20.959
Smederevo, RS|44.664|20.928
Senta, RS|45.928|20.077
Prokuplje, RS|43.234|21.588
Pozarevac, RS|44.621|21.188
Pirot, RS|43.153|22.586
Pancevo, RS|44.872|20.642
Obrenovac, RS|44.655|20.200
Novi Pazar, RS|43.137|20.512
Novi Beograd, RS|44.806|20.424
Nova Pazova, RS|44.944|20.219
Nis, RS|43.325|21.903
Negotin, RS|44.226|22.531
Leskovac, RS|42.998|21.946
Lazarevac, RS|44.385|20.256
Krusevac, RS|43.580|21.334
Kraljevo, RS|43.726|20.689
Kragujevac, RS|44.017|20.917
Kikinda, RS|45.830|20.465
Jagodina, RS|43.977|21.261
Ingija, RS|45.048|20.082
Gornji Milanovac, RS|44.026|20.462
Cuprija, RS|43.928|21.370
Cacak, RS|43.891|20.350
Bor, RS|44.075|22.096
Belgrade, RS|44.804|20.465
Becej, RS|45.616|20.033
Arangelovac, RS|44.307|20.560
Vrbas, RS|45.571|19.641
Valjevo, RS|44.275|19.898
Uzice, RS|43.859|19.849
Subotica, RS|46.100|19.667
Sremska Mitrovica, RS|44.976|19.612
Sombor, RS|45.774|19.112
Sabac, RS|44.747|19.690
Ruma, RS|45.008|19.822
Novi Sad, RS|45.252|19.837
Loznica, RS|44.531|19.243
Futog, RS|45.239|19.714
Backa Topola, RS|45.815|19.632
Backa Palanka, RS|45.250|19.397
Apatin, RS|45.673|18.978
Knjazevac, RS|43.566|22.257
Udomlya, RU|57.876|35.007
Sosnovka, RU|60.017|30.350
Sasovo, RU|54.354|41.920
Zyuzino, RU|55.656|37.568
Zyablikovo, RU|55.617|37.767
Zverevo, RU|48.027|40.123
Zvenigorod, RU|55.734|36.859
Zlatoust, RU|55.172|59.655
Zimovniki, RU|47.146|42.470
Zhulebino, RU|55.700|37.850
Zhukovsky, RU|55.595|38.120
Zhukovka, RU|53.534|33.731
Zhirnovsk, RU|50.979|44.779
Zhigulevsk, RU|53.403|49.511
Zherdevka, RU|51.854|41.455
Zheleznovodsk, RU|44.143|43.005
Zheleznogorsk, RU|52.342|35.359
Zheleznodorozhnyy, RU|55.744|38.017
Zernograd, RU|46.849|40.312
Zelenokumsk, RU|44.410|43.880
Zelenogradsk, RU|54.959|20.477
Zelenograd, RU|55.983|37.181
Zelenodolsk, RU|55.844|48.518
Zelenchukskaya, RU|43.855|41.590
Zavolzhye, RU|56.641|43.394
Zavety Ilicha, RU|56.043|37.852
Zarechnyy, RU|53.204|45.192
Zaraysk, RU|54.763|38.881
Zapolyarnyy, RU|69.426|30.811
Zamoskvorechye, RU|55.733|37.633
Zainsk, RU|55.319|52.069
Yushkovo, RU|55.557|36.972
Yuryev-Polskiy, RU|56.505|39.679
Yoshkar-Ola, RU|56.639|47.891
Yeysk, RU|46.693|38.279
Yessentukskaya, RU|44.026|42.875
Yessentuki, RU|44.048|42.856
Yershov, RU|51.356|48.273
Yemva, RU|62.588|50.863
Yelizavetinskaya, RU|45.046|38.795
Yelets, RU|52.614|38.509
Yelan, RU|50.949|43.737
Yelabuga, RU|55.762|52.044
Yegoryevsk, RU|55.380|39.041
Yegorlykskaya, RU|46.566|40.657
Yefremov, RU|53.138|38.119
Yasnyy, RU|51.035|59.872
Yasnogorsk, RU|54.481|37.698
Yasenevo, RU|55.607|37.520
Yartsevo, RU|55.065|32.697
Yaroslavl, RU|57.630|39.874
Yaransk, RU|57.305|47.874
Yanaul, RU|56.272|54.930
Yagry, RU|64.594|39.810
Yablonovskiy, RU|44.989|38.943
Vyshniy Volochek, RU|57.589|34.569
Vyselki, RU|45.581|39.657
Vyksa, RU|55.321|42.174
Vykhino-Zhulebino, RU|55.702|37.812
Vyborg, RU|60.708|28.753
Vyazniki, RU|56.242|42.149
Vyazma, RU|55.210|34.297
Vyatskiye Polyany, RU|56.229|51.061
Vsevolozhsk, RU|60.015|30.673
Votkinsk, RU|57.049|53.987
Vostryakovo, RU|55.667|37.450
Vostryakovo, RU|55.399|37.808
Voskresensk, RU|55.313|38.691
Voronezh, RU|51.668|39.192
Altufyevskiy, RU|55.883|37.583
Vorobyovo, RU|55.717|37.533
Volzhsky, RU|48.786|44.780
Volzhsk, RU|55.867|48.359
Volsk, RU|52.042|47.383
Volokolamsk, RU|56.034|35.969
Vologda, RU|59.224|39.884
Volkhov, RU|59.923|32.340
Nagornyy, RU|55.650|37.617
Volgorechensk, RU|57.444|41.163
Volgograd, RU|48.714|44.498
Volgodonsk, RU|47.511|42.153
Novovladykino, RU|55.850|37.583
Vladimir, RU|56.139|40.400
Vladikavkaz, RU|43.041|44.670
Vidnoye, RU|55.552|37.709
Vichuga, RU|57.215|41.926
Veshnyaki, RU|55.724|37.820
Vereshchagino, RU|58.078|54.656
Venev, RU|54.351|38.263
Velsk, RU|61.069|42.099
Velikiy Ustyug, RU|60.762|46.314
Velikiye Luki, RU|56.341|30.544
Vatutino, RU|55.884|37.691
Valuyki, RU|50.197|38.117
Valday, RU|57.977|33.252
Vagonoremont, RU|55.900|37.550
Uzlovaya, RU|53.984|38.160
Uvarovo, RU|51.982|42.262
Uva, RU|56.991|52.185
Ust-Labinsk, RU|45.214|39.688
Ust-Katav, RU|54.937|58.176
Ust-Dzheguta, RU|44.083|41.976
Usman, RU|52.045|39.726
Uryupinsk, RU|50.806|42.009
Urus-Martan, RU|43.131|45.538
Uritsk, RU|59.839|30.175
Unecha, RU|52.843|32.688
Ulyanovsk, RU|54.328|48.387
Ukhta, RU|63.569|53.691
Uglich, RU|57.523|38.323
Ufa, RU|54.743|55.968
Uchkeken, RU|43.945|42.517
Uchaly, RU|54.358|59.436
Tyrnyauz, RU|43.383|42.918
Tver, RU|56.858|35.901
Tuymazy, RU|54.606|53.712
Tutayev, RU|57.873|39.530
Tula, RU|54.196|37.618
Tuchkovo, RU|55.601|36.468
Tuapse, RU|44.101|39.083
Tsimlyansk, RU|47.648|42.093
Trubchevsk, RU|52.580|33.766
Troparevo, RU|55.656|37.485
Troitskaya, RU|43.307|44.984
Troitsk, RU|55.485|37.307
Tosno, RU|59.540|30.878
Torzhok, RU|57.044|34.962
Tomilino, RU|55.656|37.947
Tolyatti, RU|53.530|49.346
Timashyovsk, RU|45.617|38.945
Tikhvin, RU|59.639|33.526
Tikhoretsk, RU|45.853|40.119
Teykovo, RU|56.859|40.540
Terek, RU|43.483|44.138
Tyoply Stan, RU|55.620|37.493
Temryuk, RU|45.269|37.398
Tekstilshchiki, RU|55.700|37.743
Tbilisskaya, RU|45.365|40.197
Tambov, RU|52.736|41.441
Agidel, RU|55.909|53.934
Taganrog, RU|47.236|38.905
Taganskiy, RU|55.733|37.667
Syzran, RU|53.158|48.468
Syktyvkar, RU|61.664|50.816
Svobody, RU|44.026|43.050
Sviblovo, RU|55.850|37.633
Svetogorsk, RU|61.112|28.863
Svetlyy, RU|54.675|20.135
Svetlograd, RU|45.327|42.856
Suvorovskaya, RU|44.190|42.660
Suvorov, RU|54.122|36.497
Surovikino, RU|48.610|42.857
Surkhakhi, RU|43.188|44.902
Sukhinichi, RU|54.100|35.343
Stupino, RU|54.897|38.068
Strunino, RU|56.373|38.583
Stroitel, RU|50.788|36.478
Strogino, RU|55.818|37.412
Sterlitamak, RU|53.638|55.953
Stavropol, RU|45.034|41.964
Staryy Oskol, RU|51.303|37.846
Staroshcherbinovskaya, RU|46.630|38.664
Starominskaya, RU|46.531|39.052
Starodub, RU|52.585|32.763
Staraya Russa, RU|57.996|31.360
Staraya Kupavna, RU|55.808|38.181
Staraya Derevnya, RU|59.988|30.243
Sovetsk, RU|57.589|48.955
Sovetsk, RU|55.084|21.879
Sosnovyy Bor, RU|59.900|29.086
Sosnovaya Polyana, RU|59.835|30.147
Sosnogorsk, RU|63.597|53.892
Sortavala, RU|61.712|30.710
Sorochinsk, RU|52.429|53.150
Solntsevo, RU|55.637|37.381
Solnechnogorsk, RU|56.175|36.971
Sol-Iletsk, RU|51.162|54.992
Solikamsk, RU|59.667|56.743
Sokolniki, RU|55.802|37.672
Sokol, RU|55.800|37.517
Sokol, RU|59.462|40.121
Sofrino, RU|56.150|37.933
Sochi, RU|43.597|39.725
Sobinka, RU|55.990|40.021
Smolensk, RU|54.778|32.051
Slobodskoy, RU|58.731|50.171
Slobodka, RU|55.867|37.583
Slavyansk-na-Kubani, RU|45.251|38.121
Slantsy, RU|59.118|28.088
Skopin, RU|53.825|39.553
Skhodnya, RU|55.948|37.298
Sim, RU|54.993|57.698
Sibay, RU|52.718|58.667
Shuya, RU|56.849|41.387
Shushary, RU|59.809|30.382
Shumerlya, RU|55.501|46.413
Mikhaylovsk, RU|45.131|42.027
Shilovo, RU|54.320|40.880
Sheksna, RU|59.210|38.511
Shebekino, RU|50.413|36.925
Shchukino, RU|55.800|37.450
Shchigry, RU|51.876|36.905
Shcherbinka, RU|55.498|37.558
Shchyolkovo, RU|55.925|37.972
Shchekino, RU|54.007|37.506
Shatura, RU|55.573|39.534
Sharya, RU|58.368|45.516
Shali, RU|43.148|45.902
Shakhunya, RU|57.676|46.612
Shakhty, RU|47.719|40.216
Severskaya, RU|44.854|38.679
Severo-Zadonsk, RU|54.035|38.402
Severouralsk, RU|60.153|59.952
Severomorsk, RU|69.069|33.408
Severodvinsk, RU|64.558|39.830
Severnyy, RU|55.936|37.549
Setun, RU|55.717|37.417
Sestroretsk, RU|60.098|29.964
Sertolovo, RU|60.144|30.202
Serpukhov, RU|54.920|37.416
Sergiyev Posad, RU|56.312|38.139
Sergach, RU|55.528|45.457
Serdobsk, RU|52.459|44.217
Semiluki, RU|51.682|39.030
Semikarakorsk, RU|47.517|40.808
Semenovskoye, RU|55.683|37.550
Semenov, RU|56.788|44.496
Seltso, RU|53.368|34.103
Segezha, RU|63.745|34.316
Satka, RU|55.041|59.047
Sarov, RU|54.948|43.315
Saratov, RU|51.540|45.990
Sarapul, RU|56.476|53.798
Saransk, RU|54.185|45.172
Saraktash, RU|51.787|56.360
Saint Petersburg, RU|59.939|30.314
Samara, RU|53.208|50.136
Salsk, RU|46.475|41.542
Salavat, RU|53.383|55.911
Safonovo, RU|55.111|33.237
Rzhev, RU|56.263|34.329
Rybnoye, RU|54.725|39.513
Rybinsk, RU|58.046|38.838
Rybatskoye, RU|59.839|30.499
Ryazhsk, RU|53.706|40.080
Ryazan, RU|54.627|39.704
Ruzayevka, RU|54.060|44.949
Rublevo, RU|55.785|37.355
Rtishchevo, RU|52.260|43.787
Rostov-on-Don, RU|47.220|39.708
Rostov Veliky, RU|57.191|39.413
Rostokino, RU|55.833|37.667
Rossosh, RU|51.121|38.512
Rossosh, RU|50.196|39.566
Roslavl, RU|53.954|32.864
Roshal, RU|55.669|39.875
Rodniki, RU|57.105|41.736
Revda, RU|56.802|59.938
Reutov, RU|55.763|37.863
Razumnoye, RU|50.534|36.685
Rayevskiy, RU|54.064|54.934
Rasskazovo, RU|52.664|41.889
Ramenskoye, RU|55.563|38.242
Ramenki, RU|55.700|37.500
Pyatigorsk, RU|44.050|43.050
Pushkino, RU|55.995|37.829
Pushkin, RU|59.714|30.396
Pushchino, RU|54.834|37.611
Pugachev, RU|52.017|48.799
Pskov, RU|57.819|28.332
Protvino, RU|54.868|37.216
Proletarsk, RU|46.702|41.725
Prokhladnyy, RU|43.757|44.030
Priyutovo, RU|53.900|53.933
Privolzhskiy, RU|51.409|46.048
Privolzhsk, RU|57.384|41.292
Priozersk, RU|61.040|30.139
Primorsko-Akhtarsk, RU|46.048|38.179
Pridonskoy, RU|51.683|39.068
Povorino, RU|51.198|42.246
Kotlovka, RU|55.659|37.604
Annino, RU|55.583|37.600
Polyarnyye Zori, RU|67.366|32.498
Polyarnyy, RU|69.203|33.437
Pokrovskoye-Streshnevo, RU|55.808|37.458
Pokrov, RU|55.918|39.172
Pokhvistnevo, RU|53.652|52.127
Podporozhye, RU|60.910|34.162
Podolsk, RU|55.424|37.555
Pochep, RU|52.933|33.447
Ryazanskiy, RU|55.733|37.767
Plavsk, RU|53.708|37.295
Pikalevo, RU|59.518|34.166
Petushki, RU|55.927|39.461
Petrozavodsk, RU|61.785|34.347
Petrovskaya, RU|55.550|37.783
Petrovsk, RU|52.309|45.390
Petrodvorets, RU|59.896|29.801
Peterhof, RU|59.883|29.900
Pestovo, RU|58.594|35.802
Pervouralsk, RU|56.905|59.944
Perm, RU|58.010|56.250
Pereslavl-Zalesskiy, RU|56.739|38.860
Novo-Peredelkino, RU|55.645|37.336
Penza, RU|53.196|45.011
Pechora, RU|65.147|57.224
Pavlovskiy Posad, RU|55.782|38.650
Pavlovskaya, RU|46.139|39.786
Pavlovsk, RU|59.683|30.435
Pavlovsk, RU|50.454|40.124
Pashkovskiy, RU|45.024|39.104
Pallasovka, RU|50.049|46.886
Ozery, RU|54.860|38.551
Ozerki, RU|60.039|30.311
Otradnyy, RU|53.376|51.345
Otradnoye, RU|55.867|37.600
Otradnoye, RU|59.778|30.818
Otradnaya, RU|44.393|41.519
Ostrov, RU|57.344|28.354
Ostrogozhsk, RU|50.866|39.078
Ostashkov, RU|57.147|33.107
Ostankinskiy, RU|55.830|37.616
Osa, RU|57.284|55.459
Orsk, RU|51.232|58.488
Orlovskiy, RU|46.874|42.052
Orenburg, RU|51.767|55.099
Orel, RU|52.969|36.079
Orekhovo-Zuyevo, RU|55.812|38.992
Orekhovo-Borisovo Severnoye, RU|55.617|37.683
Sunzha, RU|43.321|45.049
Onega, RU|63.906|38.099
Omutninsk, RU|58.670|52.193
Olenegorsk, RU|68.143|33.253
Tsotsin-Yurt, RU|43.242|46.000
Oktyabrsky, RU|54.481|53.471
Oktyabrsk, RU|53.167|48.697
Odintsovo, RU|55.670|37.277
Ocher, RU|57.882|54.718
Ochakovo-Matveyevskoye, RU|55.684|37.447
Obninsk, RU|55.110|36.612
Nytva, RU|57.938|55.341
Nyandoma, RU|61.672|40.212
Nurlat, RU|54.429|50.806
Novy Oskol, RU|50.763|37.864
Novyye Kuzminki, RU|55.700|37.750
Novyye Cheremushki, RU|55.700|37.583
Novozybkov, RU|52.537|31.937
Novovoronezh, RU|51.315|39.219
Novouzensk, RU|50.463|48.142
Novoulyanovsk, RU|54.148|48.386
Novotroitsk, RU|51.201|58.313
Novotitarovskaya, RU|45.238|38.981
Novoshakhtinsk, RU|47.760|39.933
Novorossiysk, RU|44.732|37.762
Novopokrovskaya, RU|45.958|40.698
Novopavlovsk, RU|43.959|43.632
Novomoskovsk, RU|54.011|38.291
Novomichurinsk, RU|54.038|39.748
Novokuzminki, RU|55.717|37.783
Novokuybyshevsk, RU|53.097|49.940
Novokubansk, RU|45.113|41.036
Novokhovrino, RU|55.867|37.500
Novogireyevo, RU|55.755|37.818
Novodvinsk, RU|64.416|40.817
Novocherkassk, RU|47.422|40.094
Novocheboksarsk, RU|56.111|47.478
Novoanninskiy, RU|50.528|42.675
Novoaleksandrovsk, RU|45.497|41.225
Velikiy Novgorod, RU|58.521|31.271
Novaya Usman, RU|51.644|39.411
Novaya Derevnya, RU|59.987|30.287
Noginsk, RU|55.865|38.449
Nizhnyaya Tura, RU|58.624|59.852
Nizhny Tagil, RU|57.919|59.965
Nizhniy Novgorod, RU|56.329|44.002
Nizhniy Lomov, RU|53.530|43.677
Nizhnekamsk, RU|55.638|51.815
Nikulino, RU|55.669|37.466
Nikolskoye, RU|55.683|37.483
Nikolskoye, RU|59.701|30.785
Nikolsk, RU|53.719|46.071
Nikolayevsk, RU|50.028|45.461
Nikel, RU|69.413|30.222
Nezlobnaya, RU|44.118|43.403
Nevinnomyssk, RU|44.633|41.944
Nevel, RU|56.020|29.928
Nesterovskaya, RU|43.239|45.050
Nerekhta, RU|57.458|40.572
Nelidovo, RU|56.228|32.775
Neftekamsk, RU|56.089|54.264
Neftegorsk, RU|52.801|51.166
Nazran, RU|43.226|44.773
Naryan-Mar, RU|67.639|53.004
Nartkala, RU|43.554|43.855
Naro-Fominsk, RU|55.388|36.733
Nalchik, RU|43.498|43.619
Nakhabino, RU|55.849|37.178
Naberezhnyye Chelny, RU|55.737|52.420
Mytishchi, RU|55.911|37.730
Murom, RU|55.569|42.024
Murmansk, RU|68.968|33.099
Mtsensk, RU|53.279|36.580
Mozhga, RU|56.446|52.216
Mozhaysk, RU|55.502|36.027
Mozdok, RU|43.740|44.652
Mostovskoy, RU|44.411|40.793
Moscow, RU|55.752|37.618
Morshansk, RU|53.443|41.811
Morozovsk, RU|48.351|41.829
Monino, RU|55.842|38.194
Monchegorsk, RU|67.940|32.874
Mineralnye Vody, RU|44.210|43.135
Millerovo, RU|48.925|40.400
Mikhaylovka, RU|50.062|43.233
Mikhalkovo, RU|55.683|37.433
Michurinsk, RU|52.908|40.482
Metallostroy, RU|59.801|30.548
Menzelinsk, RU|55.728|53.102
Mendeleyevsk, RU|55.897|52.311
Meleuz, RU|52.965|55.933
Melenki, RU|55.336|41.627
Medvezhyegorsk, RU|62.914|34.459
Medvedovskaya, RU|45.452|39.025
Medvedevo, RU|56.634|47.803
Mednogorsk, RU|51.406|57.588
Maykop, RU|44.608|40.102
Matveyevskoye, RU|55.711|37.475
Marks, RU|51.710|46.746
Marino, RU|55.650|37.717
Manturovo, RU|58.326|44.759
Yaroslavskiy, RU|55.883|37.717
Maloyaroslavets, RU|55.015|36.472
Malgobek, RU|43.511|44.591
Malakhovka, RU|55.648|38.025
Makhachkala, RU|42.978|47.500
Magnitogorsk, RU|53.398|59.007
Lyudinovo, RU|53.866|34.448
Lyublino, RU|55.677|37.760
Lyubertsy, RU|55.677|37.893
Lytkarino, RU|55.577|37.912
Lysva, RU|58.107|57.811
Lyskovo, RU|56.029|45.042
Luzhniki, RU|55.716|37.554
Lukhovitsy, RU|54.977|39.044
Luga, RU|58.739|29.848
Losino-Petrovskiy, RU|55.870|38.193
Lomonosov, RU|59.906|29.773
Lodeynoye Pole, RU|60.726|33.561
Lobnya, RU|56.027|37.468
Livny, RU|52.424|37.600
Liski, RU|50.982|39.504
Lipetsk, RU|52.588|39.552
Likino-Dulevo, RU|55.708|38.954
Likhobory, RU|55.850|37.567
Lianozovo, RU|55.898|37.587
Lgovskiy, RU|51.631|35.278
Komendantsky aerodrom, RU|60.004|30.275
Lermontov, RU|44.107|42.978
Leonovo, RU|55.850|37.650
Leninskiye Gory, RU|55.700|37.567
Leninsk, RU|48.703|45.196
Leninogorsk, RU|54.597|52.451
Tsaritsyno, RU|55.625|37.650
Leningradskaya, RU|46.321|39.386
Yubileyny, RU|55.933|37.833
Lefortovo, RU|55.767|37.700
Lebedyan, RU|53.015|39.145
Lazarevskoye, RU|43.909|39.331
Lakinsk, RU|56.019|39.948
Labinsk, RU|44.636|40.736
Dugulubgey, RU|43.663|43.537
Kuznetsk, RU|53.117|46.600
Kuzminki, RU|55.700|37.800
Kuvandyk, RU|51.485|57.358
Kuskovo, RU|55.738|37.795
Kushva, RU|58.287|59.748
Kushchyovskaya, RU|46.560|39.632
Kusa, RU|55.345|59.440
Kuryanovo, RU|55.656|37.701
Kursk, RU|51.727|36.185
Kurovskoye, RU|55.582|38.920
Kurganinsk, RU|44.884|40.589
Kurchatov, RU|51.654|35.687
Kurchaloy, RU|43.205|46.088
Kupchino, RU|59.859|30.388
Kuntsevo, RU|55.742|37.402
Kungur, RU|57.414|56.972
Kumertau, RU|52.765|55.788
Kulebaki, RU|55.413|42.532
Kukmor, RU|56.186|50.894
Kudymkar, RU|59.015|54.653
Kudrovo, RU|59.903|30.511
Kudepsta, RU|43.495|39.893
Kubinka, RU|55.580|36.704
Kstovo, RU|56.148|44.199
Krymsk, RU|44.926|37.990
Kropotkin, RU|45.437|40.570
Kronstadt, RU|59.992|29.776
Krasnyy Sulin, RU|47.892|40.072
Biryulevo Zapadnoye, RU|55.587|37.646
Krasnoye Selo, RU|59.738|30.089
Krasnovishersk, RU|60.407|57.083
Krasnoufimsk, RU|56.614|57.769
Krasnokamsk, RU|58.079|55.756
Krasnogvardeyskoye, RU|45.845|41.517
Krasnogorsk, RU|55.819|37.330
Krasnodar, RU|45.045|38.982
Krasnoarmeyskaya, RU|45.366|38.212
Krasnoarmeysk, RU|56.100|38.133
Krasnoarmeysk, RU|51.023|45.697
Presnenskiy, RU|55.759|37.558
Kozmodemyansk, RU|56.332|46.561
Kozhukhovo, RU|55.706|37.676
Kozeyevo, RU|55.867|37.617
Kozelsk, RU|54.037|35.771
Kovylkino, RU|54.037|43.919
Kovrov, RU|56.358|41.319
Kovdor, RU|67.566|30.478
Kotovsk, RU|52.590|41.503
Kotovo, RU|50.316|44.810
Kotlas, RU|61.257|46.654
Kotelnikovo, RU|47.630|43.142
Kotelniki, RU|55.654|37.862
Kotelnich, RU|58.303|48.337
Kostroma, RU|57.766|40.928
Kostomuksha, RU|64.571|30.577
Kosaya Gora, RU|54.119|37.545
Koryazhma, RU|61.312|47.148
Korenovsk, RU|45.467|39.449
Konstantinovsk, RU|47.581|41.093
Kondopoga, RU|62.204|34.269
Konakovo, RU|56.702|36.773
Kommunar, RU|59.621|30.390
Kolpino, RU|59.751|30.589
Kolomyagi, RU|60.024|30.285
Kolomna, RU|55.071|38.784
Kolomenskoye, RU|55.667|37.683
Kolchugino, RU|56.304|39.377
Kokhma, RU|56.932|41.095
Klintsy, RU|52.760|32.239
Klin, RU|56.332|36.729
Klimovsk, RU|55.364|37.530
Kizlyar, RU|43.847|46.710
Kizilyurt, RU|43.203|46.866
Kizel, RU|59.047|57.648
Kislovodsk, RU|43.913|42.721
Kirzhach, RU|56.153|38.855
Kirsanov, RU|52.651|42.735
Kirovsk, RU|67.615|33.673
Kirovsk, RU|59.880|30.995
Kirovo-Chepetsk, RU|58.551|50.031
Kirov, RU|58.598|49.658
Kirov, RU|54.069|34.299
Kirishi, RU|59.474|32.040
Kireyevsk, RU|53.930|37.921
Kingisepp, RU|59.376|28.614
Kineshma, RU|57.437|42.128
Kinel-Cherkassy, RU|53.467|51.494
Kinel, RU|53.227|50.626
Kimry, RU|56.875|37.360
Kimovsk, RU|53.973|38.535
Khotkovo, RU|56.257|37.995
Khosta, RU|43.515|39.868
Khoroshevo-Mnevniki, RU|55.784|37.471
Kholmskiy, RU|44.847|38.385
Khimki, RU|55.900|37.428
Khasavyurt, RU|43.249|46.586
Kharabali, RU|47.408|47.254
Khadyzhensk, RU|44.426|39.536
Kazan, RU|55.789|49.122
Katav-Ivanovsk, RU|54.753|58.201
Kastanayevo, RU|55.717|37.500
Kaspiysk, RU|42.882|47.639
Kasimov, RU|54.944|41.403
Kashira, RU|54.848|38.182
Kashin, RU|57.359|37.608
Karachev, RU|53.123|34.985
Karachayevsk, RU|43.772|41.914
Karabulak, RU|43.305|44.899
Karabanovo, RU|56.311|38.703
Kapotnya, RU|55.638|37.793
Kantyshevo, RU|43.228|44.633
Kanevskaya, RU|46.095|38.977
Kandalaksha, RU|67.151|32.413
Kanash, RU|55.510|47.491
Kamyzyak, RU|46.105|48.078
Kamyshin, RU|50.089|45.413
Kamensk-Shakhtinsky, RU|48.318|40.259
Kamenka, RU|53.181|44.049
Kaluga, RU|54.531|36.270
Kalininsk, RU|51.498|44.477
Korolev, RU|55.914|37.826
Kaliningrad, RU|54.706|20.511
Kalach-na-Donu, RU|48.691|43.526
Kalach, RU|50.425|41.016
Kachkanar, RU|58.700|59.484
Kabanovo, RU|55.748|38.935
Izobilnyy, RU|45.367|41.709
Izmaylovo, RU|55.797|37.782
Izhevsk, RU|56.852|53.199
Izberbash, RU|42.567|47.875
Ivanteyevka, RU|55.971|37.921
Ivanovskoye, RU|55.767|37.833
Ivanovo, RU|57.000|40.973
Istra, RU|55.920|36.869
Ishimbay, RU|53.448|56.039
Ipatovo, RU|45.718|42.906
Inza, RU|53.853|46.351
Inozemtsevo, RU|44.093|43.091
Ilskiy, RU|44.842|38.567
Igra, RU|57.555|53.054
Gus-Khrustalnyy, RU|55.612|40.650
Gusev, RU|54.592|22.200
Gulkevichi, RU|45.354|40.695
Gukovo, RU|48.051|39.930
Gudermes, RU|43.351|46.101
Gubkin, RU|51.284|37.535
Gubakha, RU|58.839|57.553
Gryazovets, RU|58.880|40.252
Gryazi, RU|52.495|39.940
Grozny, RU|43.312|45.689
Gribanovskiy, RU|51.450|41.962
Grazhdanka, RU|60.017|30.417
Goryachiy Klyuch, RU|44.634|39.136
Goryachevodskiy, RU|44.024|43.092
Gorodishche, RU|48.803|44.475
Gorodets, RU|56.655|43.473
Gorelovo, RU|59.772|30.135
Golyanovo, RU|55.823|37.813
Golitsyno, RU|55.609|36.982
Glazov, RU|58.140|52.656
Giaginskaya, RU|44.862|40.072
Georgiyevsk, RU|44.149|43.470
Gelendzhik, RU|44.580|38.066
Gay, RU|51.473|58.452
Gavrilov-Yam, RU|57.303|39.853
Gatchina, RU|59.576|30.128
Galich, RU|58.379|42.346
Gagarin, RU|55.553|34.997
Furmanov, RU|57.254|41.111
Fryazino, RU|55.961|38.046
Fryazevo, RU|55.733|38.465
Frolovo, RU|49.769|43.654
Fili, RU|55.745|37.488
Ezhva, RU|61.813|50.728
Engels, RU|51.484|46.105
Enem, RU|44.926|38.906
Elista, RU|46.308|44.255
Elektrougli, RU|55.724|38.209
Elektrostal, RU|55.786|38.457
Elektrogorsk, RU|55.884|38.786
Ekazhevo, RU|43.212|44.823
Dzerzhinskiy, RU|55.629|37.844
Dzerzhinsk, RU|56.244|43.455
Dyurtyuli, RU|55.487|54.862
Dyatkovo, RU|53.598|34.338
Dubovka, RU|49.056|44.829
Dubna, RU|56.740|37.186
Dorogomilovo, RU|55.742|37.547
Donskoye, RU|45.453|41.972
Donskoy, RU|53.968|38.332
Donetsk, RU|48.337|39.952
Domodedovo, RU|55.442|37.754
Dolgoprudnyy, RU|55.950|37.502
Dobryanka, RU|58.465|56.413
Dmitrov, RU|56.345|37.520
Divnoye, RU|45.910|43.349
Dinskaya, RU|45.217|39.226
Dimitrovgrad, RU|54.214|49.618
Desnogorsk, RU|54.151|33.282
Derbent, RU|42.066|48.288
Dedovsk, RU|55.869|37.122
Davydkovo, RU|55.718|37.473
Davlekanovo, RU|54.218|55.031
Dankov, RU|53.250|39.144
Danilov, RU|58.191|40.171
Dagestanskiye Ogni, RU|42.116|48.192
Dachnoye, RU|59.842|30.256
Chusovoy, RU|58.289|57.813
Chudovo, RU|59.122|31.681
Chistopol, RU|55.366|50.644
Chishmy, RU|54.590|55.382
Chernyanka, RU|50.938|37.815
Chernyakhovsk, RU|54.633|21.816
Chernushka, RU|56.507|56.077
Chernogolovka, RU|56.001|38.365
Cherkessk, RU|44.224|42.046
Cherepovets, RU|59.133|37.900
Cheremushki, RU|55.665|37.561
Chekhov, RU|55.146|37.462
Chegem, RU|43.567|43.585
Cheboksary, RU|56.132|47.246
Chaykovskiy, RU|56.763|54.113
Chapayevsk, RU|52.977|49.709
Buzuluk, RU|52.778|52.259
Buynaksk, RU|42.818|47.127
Buy, RU|58.480|41.536
Buturlinovka, RU|50.826|40.598
Buinsk, RU|54.974|48.291
Buguruslan, RU|53.655|52.442
Bugulma, RU|54.538|52.798
Budyonnovsk, RU|44.784|44.166
Bryukhovetskaya, RU|45.800|38.997
Bryansk, RU|53.271|34.321
Bronnitsy, RU|55.421|38.262
Brateyevo, RU|55.638|37.764
Borovichi, RU|58.394|33.919
Borisoglebsk, RU|51.369|42.098
Bor, RU|56.359|44.073
Bolshaya Setun, RU|55.717|37.417
Bologoye, RU|57.886|34.053
Boksitogorsk, RU|59.478|33.850
Boguchar, RU|49.935|40.554
Bogorodskoye, RU|55.814|37.721
Bogorodsk, RU|56.101|43.510
Bogoroditsk, RU|53.772|38.123
Bobrov, RU|51.098|40.030
Blagoveshchensk, RU|55.035|55.977
Blagodarnyy, RU|45.098|43.436
Biryulevo, RU|55.586|37.678
Birsk, RU|55.420|55.542
Bibirevo, RU|55.883|37.600
Bezhetsk, RU|57.784|36.701
Bezenchuk, RU|52.981|49.432
Beslan, RU|43.193|44.533
Berezniki, RU|59.409|56.820
Beloretsk, RU|53.962|58.400
Belorechensk, RU|44.770|39.872
Beloozyorskiy, RU|55.460|38.444
Belgorod, RU|50.603|36.581
Belev, RU|53.812|36.133
Belebey, RU|54.108|54.117
Belaya Kalitva, RU|48.179|40.779
Belaya Glina, RU|46.081|40.874
Baymak, RU|52.592|58.311
Bavly, RU|54.398|53.251
Bataysk, RU|47.137|39.757
Barysh, RU|53.650|47.127
Balezino, RU|57.979|53.014
Balashov, RU|51.551|43.171
Balashikha, RU|55.795|37.948
Balakovo, RU|52.026|47.797
Novaya Balakhna, RU|56.490|43.601
Balabanovo, RU|55.182|36.661
Baksan, RU|43.684|43.535
Bakal, RU|54.942|58.808
Bagayevskaya, RU|47.320|40.385
Babushkin, RU|55.869|37.730
Azov, RU|47.107|39.415
Aznakayevo, RU|54.858|53.080
Avtury, RU|43.163|46.002
Avtovo, RU|59.872|30.266
Atkarsk, RU|51.881|45.006
Astrakhan, RU|46.350|48.041
Asha, RU|55.000|57.255
Arzgir, RU|45.374|44.220
Arzamas, RU|55.396|43.838
Arsk, RU|56.093|49.878
Armavir, RU|44.998|41.115
Arkhangelsk, RU|64.546|40.552
Argun, RU|43.293|45.867
Ardon, RU|43.179|44.295
Apsheronsk, RU|44.460|39.730
Aprelevka, RU|55.552|37.080
Apatity, RU|67.583|33.413
Anna, RU|51.490|40.422
Andreyevskoye, RU|55.555|37.926
Anapa, RU|44.895|37.316
Aminyevo, RU|55.700|37.467
Almetyevsk, RU|54.904|52.318
Aleksin, RU|54.505|37.067
Alekseyevka, RU|55.630|37.800
Alexeyevka, RU|50.631|38.690
Aleksandrovskoye, RU|44.714|43.001
Aleksandrovsk, RU|59.158|57.571
Aleksandrov, RU|56.397|38.714
Alatyr, RU|54.842|46.581
Levoberezhnyy, RU|55.865|37.473
Aksay, RU|47.263|39.869
Akhtyrskiy, RU|44.855|38.303
Akhtubinsk, RU|48.283|46.165
Agryz, RU|56.523|52.994
Afipskiy, RU|44.900|38.843
Adler, RU|43.429|39.924
Achkhoy-Martan, RU|43.192|45.283
Abinsk, RU|44.871|38.158
Abdulino, RU|53.686|53.655
Vasilyevo, RU|55.830|48.717
Rylsk, RU|51.571|34.683
Neftekumsk, RU|44.756|44.992
Alagir, RU|43.043|44.220
Persianovka, RU|47.527|39.419
Annino, RU|55.583|37.262
Drozhzhino, RU|55.524|37.589
Dagomys, RU|43.670|39.669
Gorod Shebekino, RU|50.417|36.917
Pavlovo, RU|55.969|43.091
Belidzhi, RU|41.892|48.412
Lesnoy, RU|58.639|59.790
Trekhgornyy, RU|54.817|58.448
Mirnyy, RU|62.764|40.339
Znamensk, RU|48.584|45.734
Zarechnyy, RU|53.133|46.583
Kochubeyevskoye, RU|44.644|41.845
Vnukovo, RU|55.612|37.296
Moskovskiy, RU|55.599|37.355
Usinsk, RU|66.009|57.531
Obukhovo, RU|59.844|30.451
Staryy Malgobek, RU|43.544|44.596
Zavodoukovsk, RU|56.503|66.547
Zarinsk, RU|53.708|84.943
Zarechnyy, RU|56.811|61.325
Yuzhnyy, RU|53.254|83.694
Yuzhnouralsk, RU|54.448|61.264
Yurga, RU|55.723|84.886
Yeniseysk, RU|58.451|92.172
Yemanzhelinsk, RU|54.755|61.321
Yekaterinburg, RU|56.857|60.615
Yashkino, RU|55.874|85.434
Yarovoye, RU|52.927|78.575
Yalutorovsk, RU|56.653|66.300
Vorkuta, RU|67.509|64.067
Vorgashor, RU|67.584|63.794
Verkhnyaya Salda, RU|58.045|60.551
Verkhnyaya Pyshma, RU|56.970|60.582
Verkhniy Ufaley, RU|56.055|60.226
Uzhur, RU|55.318|89.831
Zelenogorsk, RU|56.109|94.587
Uray, RU|60.130|64.789
Tyumen, RU|57.152|65.527
Turinsk, RU|58.046|63.696
Troitsk, RU|54.092|61.568
Topki, RU|55.277|85.614
Tomsk, RU|56.500|84.982
Toguchin, RU|55.238|84.403
Tobolsk, RU|58.198|68.255
Tayshet, RU|55.933|97.990
Tayga, RU|56.065|85.622
Tavda, RU|58.042|65.272
Tatarsk, RU|55.221|75.982
Tashtagol, RU|52.768|87.888
Tarko-Sale, RU|64.916|77.775
Tara, RU|56.896|74.369
Talnakh, RU|69.487|88.397
Talmenka, RU|53.821|83.571
Talitsa, RU|56.880|60.021
Talitsa, RU|57.011|63.733
Sysert, RU|56.502|60.820
Suzun, RU|53.785|82.316
Surgut, RU|61.258|73.418
Sukhoy Log, RU|56.908|62.034
Strezhevoy, RU|60.733|77.589
Sredneuralsk, RU|56.989|60.467
Sovetskiy, RU|61.361|63.584
Sosnovoborsk, RU|56.122|93.338
Slavgorod, RU|53.000|78.647
Shushenskoye, RU|53.324|91.936
Shumikha, RU|55.229|63.286
Sharypovo, RU|55.540|89.201
Shadrinsk, RU|56.086|63.638
Serov, RU|59.597|60.586
Sayanogorsk, RU|53.100|91.407
Salekhard, RU|66.534|66.610
Rubtsovsk, RU|51.515|81.206
Rezh, RU|57.371|61.404
Reftinskiy, RU|57.090|61.677
Promyshlennaya, RU|54.914|85.640
Prokopyevsk, RU|53.915|86.719
Poykovskiy, RU|61.001|71.892
Polysayevo, RU|54.603|86.276
Polevskoy, RU|56.442|60.188
Plast, RU|54.369|60.814
Osinniki, RU|53.604|87.332
Omsk, RU|54.992|73.369
Ob, RU|54.989|82.713
Nyagan, RU|62.141|65.394
Noyabrsk, RU|63.193|75.437
Novyy Urengoy, RU|66.083|76.633
Novosilikatnyy, RU|53.310|83.624
Novosibirsk, RU|55.023|82.932
Novokuznetsk, RU|53.758|87.136
Novoaltaysk, RU|53.414|83.941
Norilsk, RU|69.353|88.203
Nizhnyaya Salda, RU|58.078|60.720
Nizhnevartovsk, RU|60.934|76.553
Nizhneudinsk, RU|54.907|99.034
Nevyansk, RU|57.492|60.214
Nefteyugansk, RU|61.100|72.603
Nazarovo, RU|56.011|90.417
Nadym, RU|65.533|72.517
Myski, RU|53.716|87.797
Minusinsk, RU|53.701|91.708
Miass, RU|55.046|60.108
Mezhdurechensk, RU|53.690|88.062
Megion, RU|61.034|76.107
Mayma, RU|52.003|85.897
Mariinsk, RU|56.210|87.732
Linevo, RU|54.459|83.376
Lesosibirsk, RU|58.235|92.484
Leninsk-Kuznetsky, RU|54.657|86.174
Labytnangi, RU|66.657|66.418
Kyzyl, RU|51.711|94.438
Kyshtym, RU|55.716|60.551
Kuybyshev, RU|55.448|78.319
Kurtamysh, RU|54.910|64.432
Kurgan, RU|55.449|65.343
Kupino, RU|54.367|77.307
Kulunda, RU|52.565|78.939
Krasnoyarsk, RU|56.037|92.931
Krasnouralsk, RU|58.364|60.041
Krasnoturinsk, RU|59.767|60.209
Krasnoobsk, RU|54.920|82.991
Korkino, RU|54.892|61.392
Kopeysk, RU|55.117|61.618
Yugorsk, RU|61.312|63.331
Kolpashevo, RU|58.320|82.903
Kodinsk, RU|58.606|99.174
Kochenevo, RU|55.014|82.208
Kiselevsk, RU|53.990|86.662
Kirovgrad, RU|57.431|60.062
Khanty-Mansiysk, RU|61.002|69.027
Kemerovo, RU|55.354|86.104
Kedrovka, RU|55.521|86.095
Kayyerkan, RU|69.379|87.744
Kataysk, RU|56.289|62.581
Kasli, RU|55.888|60.755
Kartaly, RU|53.060|60.641
Karpinsk, RU|59.768|60.006
Karasuk, RU|53.740|78.044
Karabash, RU|55.490|60.209
Kansk, RU|56.202|95.718
Kamyshlov, RU|56.847|62.712
Kamensk-Uralskiy, RU|56.406|61.933
Kamen-na-Obi, RU|53.789|81.332
Kaltan, RU|53.528|87.276
Kalachinsk, RU|55.052|74.579
Ivdel, RU|60.691|60.421
Iskitim, RU|54.643|83.304
Isilkul, RU|54.912|71.272
Ishim, RU|56.113|69.487
Irbit, RU|57.669|63.071
Inta, RU|66.032|60.166
Ilanskiy, RU|56.235|96.067
Guryevsk, RU|54.284|85.948
Gornyak, RU|50.995|81.467
Gorno-Altaysk, RU|51.961|85.919
Dudinka, RU|69.406|86.178
Divnogorsk, RU|55.957|92.378
Degtyarsk, RU|56.704|60.088
Chunskiy, RU|56.092|99.636
Chernogorsk, RU|53.829|91.310
Cherepanovo, RU|54.224|83.381
Chelyabinsk, RU|55.161|61.429
Chebarkul, RU|54.978|60.366
Borovskiy, RU|57.041|65.720
Borodino, RU|55.908|94.912
Bolotnoye, RU|55.673|84.395
Bogotol, RU|56.204|89.533
Bogdanovich, RU|56.777|62.051
Biysk, RU|52.534|85.197
Beryozovsky, RU|56.908|60.802
Berezovskiy, RU|55.670|86.275
Berezovka, RU|56.037|93.127
Berdsk, RU|54.754|83.096
Belyy Yar, RU|61.265|73.241
Beloyarskiy, RU|63.712|66.672
Belovo, RU|54.421|86.299
Barnaul, RU|53.362|83.728
Barabinsk, RU|55.351|78.359
Asino, RU|56.999|86.155
Asbest, RU|57.008|61.463
Artemovskiy, RU|57.354|61.871
Aramil, RU|56.698|60.837
Anzhero-Sudzhensk, RU|56.076|86.024
Aleysk, RU|52.496|82.775
Alapayevsk, RU|57.850|61.694
Akademgorodok, RU|54.852|83.106
Achinsk, RU|56.268|90.501
Abaza, RU|52.653|90.095
Abakan, RU|53.715|91.426
Snezhinsk, RU|56.078|60.748
Ozersk, RU|55.756|60.703
Zheleznogorsk, RU|56.251|93.531
Novouralsk, RU|57.255|60.091
Seversk, RU|56.601|84.886
Gubkinskiy, RU|64.434|76.503
Raduzhny, RU|62.096|77.475
Muravlenko, RU|63.790|74.523
Lyantor, RU|61.619|72.155
Zima, RU|53.920|102.044
Zheleznogorsk-Ilimskiy, RU|56.577|104.130
Zeya, RU|53.736|127.256
Yakutsk, RU|62.031|129.723
Vyazemskiy, RU|47.533|134.758
Vrangel, RU|42.730|133.084
Vladivostok, RU|43.106|131.874
Vikhorevka, RU|56.121|101.178
Ust-Kut, RU|56.798|105.787
Ust-Ilimsk, RU|58.001|102.662
Ussuriysk, RU|43.805|131.957
Usolye-Sibirskoye, RU|52.752|103.645
Ulan-Ude, RU|51.826|107.600
Udachny, RU|66.430|112.402
Tynda, RU|55.149|124.737
Tulun, RU|54.568|100.577
Trudovoye, RU|43.303|132.079
Fokino, RU|42.971|132.410
Svobodnyy, RU|51.375|128.140
Spassk-Dalniy, RU|44.601|132.820
Slyudyanka, RU|51.662|103.710
Shimanovsk, RU|52.003|127.676
Shelekhov, RU|52.216|104.099
Severobaykalsk, RU|55.638|109.327
Raychikhinsk, RU|49.796|129.403
Petrovsk-Zabaykalskiy, RU|51.276|108.847
Partizansk, RU|43.120|133.123
Neryungri, RU|56.658|124.725
Nerchinsk, RU|51.980|116.587
Nakhodka, RU|42.844|132.918
Mirny, RU|62.535|113.961
Luchegorsk, RU|46.445|134.293
Lesozavodsk, RU|45.472|133.398
Lensk, RU|60.724|114.934
Kyakhta, RU|50.350|106.451
Krasnokamensk, RU|50.093|118.032
Komsomolsk-on-Amur, RU|50.550|137.010
Khabarovsk, RU|48.462|135.097
Kavalerovo, RU|44.272|135.051
Irkutsk, RU|52.296|104.291
Gusinoozyorsk, RU|51.283|106.500
Dalnerechensk, RU|45.931|133.739
Chita, RU|52.043|113.492
Chigiri, RU|50.336|127.512
Cheremkhovo, RU|53.147|103.082
Borzya, RU|50.391|116.534
Bolsoj Kamen, RU|43.111|132.350
Bodaybo, RU|57.853|114.204
Blagoveshchensk, RU|50.276|127.526
Birobidzhan, RU|48.793|132.920
Bikin, RU|46.813|134.250
Belogorsk, RU|50.912|128.512
Baykalsk, RU|51.515|104.140
Aykhal, RU|65.934|111.483
Artem, RU|43.358|132.191
Arsenyev, RU|44.157|133.273
Angarsk, RU|52.560|103.914
Amursk, RU|50.232|136.897
Aldan, RU|58.612|125.400
Aginskoye, RU|51.108|114.542
Dalnegorsk, RU|44.557|135.621
Bratsk, RU|56.133|101.614
Sayansk, RU|54.113|102.178
Markova, RU|52.207|104.218
Vilyuchinsk, RU|52.932|158.406
Yuzhno-Sakhalinsk, RU|46.954|142.736
Yelizovo, RU|53.189|158.383
Vanino, RU|49.098|140.252
Sovetskaya Gavan, RU|48.972|140.289
Poronaysk, RU|49.220|143.091
Petropavlovsk-Kamchatsky, RU|53.064|158.628
Okha, RU|53.595|142.953
Nikolayevsk-on-Amure, RU|53.147|140.723
Nevelsk, RU|46.680|141.856
Magadan, RU|59.563|150.802
Korsakov, RU|46.634|142.783
Kholmsk, RU|47.046|142.049
Anadyr, RU|64.734|177.510
Baltiysk, RU|54.655|19.909
Isakogorka, RU|64.446|40.653
Krasnoznamensk, RU|55.595|37.052
Chertanovo Yuzhnoye, RU|55.591|37.595
Zagorye, RU|55.577|37.667
Orekhovo-Borisovo, RU|55.613|37.726
Metrogorodok, RU|55.810|37.787
Kogalym, RU|62.265|74.479
Pyt-Yakh, RU|60.750|72.858
Langepas, RU|61.254|75.212
Lesnoy, RU|57.620|63.078
Zarya, RU|55.755|38.096
Raduzhnyy, RU|56.004|40.339
Nizhnesortymskiy, RU|62.440|71.760
Pokachi, RU|61.720|75.368
Izluchinsk, RU|60.979|76.924
Krasnaya Glinka, RU|53.738|52.939
Kurortnyy, RU|60.166|29.908
Chernaya Rechka, RU|59.986|30.303
Untolovo, RU|60.012|30.209
Petrogradka, RU|59.966|30.312
Vasylevsky Ostrov, RU|59.941|30.254
Parnas, RU|60.070|30.349
Kalininskiy, RU|59.997|30.390
Krasnogvargeisky, RU|59.973|30.476
Admiralteisky, RU|59.923|30.300
Krestovskiy ostrov, RU|59.971|30.258
Akademicheskoe, RU|60.014|30.395
Finlyandskiy, RU|59.968|30.364
Centralniy, RU|59.931|30.361
Svetlanovskiy, RU|60.003|30.331
Sampsonievskiy, RU|59.985|30.343
Vostochnoe Degunino, RU|55.880|37.558
Dzerzhinsky, RU|55.627|37.858
Obruchevo, RU|55.659|37.523
Fedorovskiy, RU|61.606|73.714
Mezgore, RU|54.050|57.817
Semender, RU|42.986|47.404
Kisilevsk, RU|53.996|86.648
gorod Solnetchnogorsk, RU|56.186|36.976
Narian-Mar, RU|67.668|53.098
Rwamagana, RW|-1.949|30.435
Musanze, RW|-1.500|29.635
Ruhango, RW|-2.225|29.791
Nyagatare, RW|-1.295|30.323
Muhanga, RW|-2.023|29.707
Mugina, RW|-2.106|29.942
Nzega, RW|-2.479|29.556
Kirimbi, RW|-2.265|29.196
Kigali, RW|-1.950|30.059
Kibuye, RW|-2.060|29.348
Kibungo, RW|-2.160|30.543
Gitarama, RW|-2.074|29.757
Gikongoro, RW|-2.464|29.574
Cyangugu, RW|-2.485|28.907
Shyorongi, RW|-1.854|29.962
Shangi, RW|-2.404|29.006
Ngororero, RW|-1.863|29.625
Ndera, RW|-1.950|30.170
Kirambo, RW|-2.316|29.142
Karengera, RW|-2.517|29.033
Gisenyi, RW|-1.703|29.256
Bushekeri, RW|-2.420|29.091
Byumba, RW|-1.576|30.067
Butare, RW|-2.597|29.739
Busogo, RW|-1.558|29.543
Bugarama, RW|-2.692|29.008
Rangiro, RW|-2.405|29.161
Gitesi, RW|-2.114|29.402
Kora, RW|-1.610|29.445
Mukamira, RW|-1.611|29.497
Mukingo, RW|-1.539|29.556
Kayonza, RW|-1.951|30.520
Macuba, RW|-2.293|29.188
Karambi, RW|-2.317|29.244
Kagano, RW|-2.343|29.091
Nyabitekeli, RW|-2.354|29.030
Cyato, RW|-2.387|29.193
Bushenge, RW|-2.442|28.982
Nyanza, RW|-2.352|29.751
Nyamata, RW|-2.204|30.145
Gihombo, RW|-2.219|29.234
Mahembe, RW|-2.239|29.293
Bugaragara, RW|-1.293|30.408
Kamuhanda / Ruyenzi, RW|-1.966|29.985
Umutara, RW|-1.295|30.323
Yanbu, SA|24.090|38.062
Umluj, SA|25.021|37.269
Turaif, SA|31.673|38.664
Turayf, SA|31.672|38.663
Turabah, SA|21.214|41.633
Tayma, SA|27.622|38.539
Tarut, SA|26.573|50.040
Tabuk, SA|28.400|36.572
Tubarjal, SA|30.500|38.216
Unaizah, SA|26.100|44.000
Sultanah, SA|24.493|39.586
Shaqra, SA|25.240|45.251
Sayhat, SA|26.483|50.048
Samitah, SA|16.596|42.944
Sakakah, SA|29.970|40.206
Safwa, SA|26.650|49.955
Sabya, SA|17.149|42.625
Rumah, SA|25.564|47.164
Ras Tanura, SA|26.707|50.067
Rahimah, SA|26.708|50.062
Rabigh, SA|22.799|39.035
Bishah, SA|20.001|42.605
Najran, SA|17.493|44.128
Makkah, SA|21.427|39.826
Mahd adh Dhahab, SA|23.500|40.884
Layla, SA|22.292|46.724
King Faisal Military City, SA|28.450|45.967
Khulays, SA|22.156|39.320
Khamis Mushait, SA|18.300|42.733
Jizan, SA|16.889|42.551
Jeddah, SA|21.490|39.186
Irqah, SA|24.680|46.611
Haql, SA|29.286|34.947
Hail, SA|27.522|41.691
Hafar Al-Batin, SA|28.433|45.971
Fayfa, SA|17.281|43.137
Duba, SA|27.351|35.690
Damad, SA|17.104|42.782
Buraydah, SA|26.326|43.975
Abqaiq, SA|25.934|49.669
Baqa, SA|27.906|42.389
Baljurashi, SA|19.859|41.557
Badr Hunayn, SA|23.783|38.790
Az Zulfi, SA|26.299|44.815
Dhahran, SA|26.289|50.114
At Taraf, SA|25.362|49.728
Taif, SA|21.270|40.416
Thuqbah, SA|26.260|50.205
As Sulayyil, SA|20.461|45.578
Riyadh, SA|24.688|46.722
Ar Rass, SA|25.869|43.497
Arar, SA|30.975|41.038
An Nimas, SA|19.145|42.120
Qurayyat, SA|31.332|37.343
Inak, SA|26.520|50.027
Al Wajh, SA|26.231|36.465
Uyun al Jiwa, SA|26.498|43.631
Al-`Ula, SA|26.609|37.923
Qaisumah, SA|28.311|46.127
Al Qatif, SA|26.565|50.009
Al Munayzilah, SA|25.383|49.667
Al Mubarraz, SA|25.408|49.590
Al Mithnab, SA|25.860|44.222
Madinah, SA|24.469|39.614
Al Lith, SA|20.148|40.272
Al Khurmah, SA|21.911|42.031
Khobar, SA|26.279|50.208
Al Kharj, SA|24.155|47.335
Al Khafji, SA|28.439|48.491
Al Khabra, SA|26.072|43.625
Al Jumum, SA|21.620|39.697
Al Jubayl, SA|27.017|49.623
Al Hufuf, SA|25.365|49.588
Al Bukayriyah, SA|26.139|43.658
Al Battaliyah, SA|25.433|49.633
Al Bahah, SA|20.013|41.468
Al Awwamiyah, SA|26.591|49.980
Al Aqiq, SA|20.650|41.417
Al Aqiq, SA|20.274|41.664
Afif, SA|23.907|42.917
Ad Diriyah, SA|24.752|46.539
Ad Dilam, SA|23.991|47.162
Ad Dawadimi, SA|24.508|44.392
Dammam, SA|26.434|50.103
Abu Arish, SA|16.969|42.833
Abha, SA|18.216|42.505
Turubah, SA|28.258|42.925
Al Badai al Wusta, SA|25.985|43.737
Thuwal, SA|22.283|39.112
Ash Shafa, SA|21.073|40.318
King Khalid Military City, SA|27.905|45.553
Sabt Alalayah, SA|19.577|41.964
Riyad al Khabra, SA|26.067|43.553
Bariq, SA|18.930|41.930
Sarat Abidah, SA|18.089|43.132
Al Mashiliyah, SA|17.756|44.468
Ranyah, SA|21.250|42.848
Hawtah Bani Tamim, SA|23.496|46.878
Panatina, SB|-9.432|160.006
Nggosi, SB|-9.431|159.921
Honiara, SB|-9.433|159.950
Kolaa, SB|-9.441|159.970
Vura, SB|-9.442|159.989
Malango, SB|-9.425|160.053
Tandai, SB|-9.447|159.945
Victoria, SC|-4.620|55.455
Dongola, SD|19.182|30.477
Zalinjay, SD|12.909|23.471
Wad Medani, SD|14.401|33.520
Wadi Halfa, SD|21.796|31.371
Umm Shawkah, SD|13.317|33.767
Umm Ruwaba, SD|12.906|31.216
Omdurman, SD|15.645|32.478
Tullus, SD|11.090|24.530
Tokar, SD|18.425|37.729
Tandalti, SD|13.017|31.867
Sinkat, SD|18.840|36.835
Singa, SD|13.148|33.931
Shendi, SD|16.692|33.434
Suakin, SD|19.106|37.332
Sennar, SD|13.569|33.567
Rufaa, SD|14.760|33.368
Rahad al Bardi, SD|11.300|23.883
Rabak, SD|13.181|32.740
Nyala, SD|12.049|24.881
Mellit, SD|14.133|25.550
Maiurno, SD|13.417|33.667
Kutum, SD|14.200|24.667
Kosti, SD|13.163|32.663
Kuraymah, SD|18.550|31.850
Kinana, SD|14.036|33.171
Khashm al Qirbah, SD|14.967|35.917
Kassala, SD|15.451|36.400
Kas, SD|12.510|24.285
Kadugli, SD|11.011|29.718
Kabkabiyah, SD|13.650|24.083
Jubayt, SD|18.953|36.834
New Halfa, SD|15.330|35.599
Ghubaysh, SD|12.150|27.350
Doka, SD|13.517|35.767
Dilling, SD|12.050|29.650
Port Sudan, SD|19.617|37.216
Buram, SD|10.858|25.159
Berber, SD|18.022|33.983
Barah, SD|13.700|30.367
Babanusah, SD|11.333|27.800
Atbara, SD|17.702|33.986
As Suki, SD|13.317|33.883
Er Roseires, SD|11.866|34.387
Ar Rahad, SD|12.717|30.650
An Nuhud, SD|12.700|28.433
El Obeid, SD|13.184|30.217
Al Qitena, SD|14.865|32.367
Al Qadarif, SD|14.035|35.383
Al Mijlad, SD|11.033|27.733
Al Manaqil, SD|14.246|32.989
Khartoum North, SD|15.649|32.535
Khartoum, SD|15.552|32.532
El Geneina Fort, SD|13.475|22.457
Al-Junaynah, SD|13.453|22.447
Al Hilaliyya, SD|14.940|33.234
Al Hawatah, SD|13.417|34.633
Al Hasaheisa, SD|14.753|33.298
Al Fulah, SD|11.733|28.358
El Fasher, SD|13.628|25.349
El Bauga, SD|18.262|33.908
Ad Douiem, SD|14.001|32.312
El Daein, SD|11.462|26.126
Ad Dindar, SD|13.200|34.167
Ad-Damir, SD|17.599|33.972
Ad-Damazin, SD|11.789|34.359
Abyei, SD|9.595|28.435
Abu Zabad, SD|12.350|29.250
Abu Jibeha, SD|11.456|31.229
Gereida, SD|11.275|25.140
Al Jazeera Aba, SD|13.319|32.613
Ad-Dindar, SD|13.334|34.093
Al-Fashaqah, SD|14.397|35.867
Al-Faw, SD|14.108|34.092
Al-Qutaynah, SD|14.728|32.269
Ardamata, SD|13.475|22.485
Shiariah, SD|12.439|25.581
Umea, SE|63.828|20.260
Skelleftea, SE|64.751|20.953
Pitea, SE|65.317|21.479
Lulea, SE|65.584|22.155
Kiruna, SE|67.856|20.225
Boden, SE|65.825|21.689
Ystad, SE|55.430|13.820
Visby, SE|57.641|18.296
Vaexjoe, SE|56.878|14.809
Vaestra Froelunda, SE|57.647|11.929
Vaestervik, SE|57.758|16.637
Vaesteras, SE|59.616|16.553
Vasastaden, SE|59.350|18.033
Vaernamo, SE|57.186|14.040
Varberg, SE|57.106|12.251
Vaenersborg, SE|58.381|12.323
Vallentuna, SE|59.534|18.078
Uppsala, SE|59.859|17.639
Upplands Vaesby, SE|59.518|17.911
Uddevalla, SE|58.348|11.942
Tumba, SE|59.199|17.833
Tullinge, SE|59.200|17.900
Trollhaettan, SE|58.284|12.289
Trelleborg, SE|55.375|13.157
Trangsund, SE|59.233|18.133
Taby, SE|59.444|18.069
Sundsvall, SE|62.391|17.306
Sundbyberg, SE|59.361|17.971
Stockholm, SE|59.329|18.069
Staffanstorp, SE|55.643|13.206
Solna, SE|59.360|18.001
Sollentuna, SE|59.428|17.951
Soedertaelje, SE|59.196|17.625
Soedermalm, SE|59.313|18.076
Skoevde, SE|58.391|13.845
Sandviken, SE|60.617|16.767
Rinkeby, SE|59.387|17.928
Rasunda, SE|59.366|17.996
Partille, SE|57.739|12.106
OEstersund, SE|63.179|14.636
OEstermalm, SE|59.339|18.085
Oskarshamn, SE|57.265|16.448
OErnskoeldsvik, SE|63.291|18.715
OErebro, SE|59.274|15.207
Nykoeping, SE|58.753|17.008
Norrtaelje, SE|59.758|18.705
Norrkoeping, SE|58.594|16.183
Naessjoe, SE|57.653|14.697
Nacka, SE|59.311|18.164
Motala, SE|58.537|15.036
Moelnlycke, SE|57.659|12.118
Moelndal, SE|57.655|12.014
Maersta, SE|59.622|17.855
Mariestad, SE|58.710|13.824
Malmoe, SE|55.606|13.001
Lund, SE|55.706|13.193
Ludvika, SE|60.150|15.188
Ljungby, SE|56.833|13.941
Linkoeping, SE|58.411|15.622
Limhamn, SE|55.583|12.950
Lidkoeping, SE|58.505|13.158
Lidingoe, SE|59.367|18.133
Lerum, SE|57.771|12.269
Landskrona, SE|55.871|12.830
Kungsholmen, SE|59.332|18.041
Kungsbacka, SE|57.487|12.076
Kungaelv, SE|57.871|11.981
Kumla, SE|59.128|15.143
Kristinehamn, SE|59.310|14.108
Kristianstad, SE|56.031|14.152
Koeping, SE|59.514|15.993
Kinna, SE|57.507|12.695
Katrineholm, SE|58.996|16.207
Karlstad, SE|59.379|13.504
Karlskrona, SE|56.162|15.587
Karlskoga, SE|59.327|14.524
Karlshamn, SE|56.171|14.862
Kalmar, SE|56.662|16.362
Joenkoeping, SE|57.781|14.156
Jakobsberg, SE|59.423|17.835
Huskvarna, SE|57.786|14.302
Hudiksvall, SE|61.727|17.106
Huddinge, SE|59.237|17.982
Helsingborg, SE|56.047|12.694
Haessleholm, SE|56.159|13.766
Haesselby Villastad, SE|59.380|17.809
Haernoesand, SE|62.632|17.938
Haninge, SE|59.168|18.145
Halmstad, SE|56.674|12.857
Gustavsberg, SE|59.327|18.390
Gothenburg, SE|57.707|11.967
Gaevle, SE|60.675|17.142
Gamla Uppsala, SE|59.898|17.634
Falun, SE|60.604|15.626
Falkoeping, SE|58.173|13.551
Falkenberg, SE|56.906|12.491
Esloev, SE|55.839|13.304
Eskilstuna, SE|59.367|16.508
Enkoeping, SE|59.636|17.078
Danderyd, SE|59.404|18.024
Bromma, SE|59.340|17.940
Borlaenge, SE|60.486|15.437
Boras, SE|57.721|12.940
Boo, SE|59.333|18.283
Bjoerlanda, SE|57.767|11.833
Arsta, SE|59.298|18.051
AEngelholm, SE|56.243|12.862
Alingsas, SE|57.930|12.533
Akersberga, SE|59.479|18.300
Majorna, SE|57.692|11.916
Tensta, SE|59.394|17.901
Yio Chu Kang, SG|1.391|103.851
Yew Tee, SG|1.397|103.747
Ulu Bedok, SG|1.333|103.933
Toa Payoh New Town, SG|1.336|103.850
Tiong Bahru Estate, SG|1.283|103.833
Thomson, SG|1.349|103.844
Tanglin, SG|1.317|103.817
Tampines Estate, SG|1.358|103.940
Sungai Simpang, SG|1.438|103.827
Singapore, SG|1.290|103.850
Serangoon Garden, SG|1.364|103.858
Serangoon, SG|1.363|103.897
Sembawang Estate, SG|1.451|103.829
Punggol, SG|1.414|103.907
Paya Lebar, SG|1.354|103.891
Matilda Estate, SG|1.399|103.903
Marsiling, SG|1.433|103.774
Loyang, SG|1.379|103.972
Keat Hong Village, SG|1.378|103.744
Kampong Pasir Ris, SG|1.378|103.932
Kampong Loyang, SG|1.378|103.959
Kembangan, SG|1.322|103.911
Kallang, SG|1.333|103.867
Hong Kah, SG|1.359|103.723
Geylang, SG|1.320|103.887
Bukit Timah, SG|1.328|103.791
Bukit Merah Estate, SG|1.284|103.823
Brickworks Estate, SG|1.287|103.808
Boon Lay, SG|1.311|103.694
Bishan New Town, SG|1.350|103.849
Bukit Batok New Town, SG|1.359|103.764
Hougang New Town, SG|1.357|103.891
Jurong East, SG|1.329|103.740
Jurong Town, SG|1.334|103.723
Jurong West, SG|1.350|103.723
Kaki Bukit Estate, SG|1.337|103.909
MacPherson, SG|1.327|103.884
Outram Park, SG|1.282|103.838
Serangoon New Town, SG|1.351|103.871
Simei New Town, SG|1.341|103.956
Tampines New Town, SG|1.349|103.950
Yishun New Town, SG|1.433|103.831
Woodlands, SG|1.438|103.789
Kangkar, SG|1.376|103.902
Marine Parade, SG|1.303|103.908
Ang Mo Kio New Town, SG|1.380|103.840
Bukit Panjang New Town, SG|1.380|103.765
Bedok New Town, SG|1.326|103.942
Clementi Housing Estate, SG|1.316|103.765
Pasir Ris New Town, SG|1.372|103.948
Queenstown Estate, SG|1.294|103.802
Telok Blangah, SG|1.275|103.812
Choa Chu Kang New Town, SG|1.383|103.750
Novena, SG|1.317|103.844
Eunos, SG|1.323|103.898
Sengkang New Town, SG|1.392|103.894
Fajar, SG|1.384|103.771
Saujana, SG|1.383|103.768
Bangkit, SG|1.380|103.773
Margaret Drive, SG|1.297|103.808
Jelebu, SG|1.380|103.763
Senja, SG|1.385|103.761
Anak Bukit, SG|1.341|103.773
Peng Siang, SG|1.380|103.741
Teck Whye, SG|1.380|103.752
Jamestown, SH|-15.925|-5.718
Trbovlje, SI|46.154|15.052
Velenje, SI|46.357|15.113
Ptuj, SI|46.420|15.870
Novo Mesto, SI|45.804|15.169
Maribor, SI|46.556|15.646
Ljubljana, SI|46.051|14.505
Kranj, SI|46.239|14.356
Koper, SI|45.548|13.730
Celje, SI|46.231|15.260
Longyearbyen, SJ|78.223|15.647
Vranov nad Toplou, SK|48.888|21.685
Trebisov, SK|48.629|21.720
Stara Lubovna, SK|49.299|20.686
Spisska Nova Ves, SK|48.945|20.562
Snina, SK|48.989|22.151
Roznava, SK|48.660|20.538
Rimavska Sobota, SK|48.383|20.022
Presov, SK|48.999|21.235
Poprad, SK|49.061|20.298
Michalovce, SK|48.754|21.919
Kosice, SK|48.714|21.258
Kezmarok, SK|49.136|20.434
Humenne, SK|48.937|21.916
Bardejov, SK|49.292|21.273
Zvolen, SK|48.574|19.153
Zilina, SK|49.223|18.739
Ziar nad Hronom, SK|48.592|18.850
Vrakuna, SK|48.138|17.209
Trnava, SK|48.378|17.586
Trencin, SK|48.895|18.044
Topolcany, SK|48.564|18.167
Stare Mesto, SK|48.150|17.090
Skalica, SK|48.845|17.226
Sereg, SK|48.291|17.733
Senica, SK|48.679|17.367
Senec, SK|48.220|17.400
Sala, SK|48.151|17.881
Ruzomberok, SK|49.075|19.308
Puchov, SK|49.125|18.326
Prievidza, SK|48.774|18.628
Povazska Bystrica, SK|49.122|18.422
Podunajske Biskupice, SK|48.132|17.210
Piestany, SK|48.595|17.826
Pezinok, SK|48.290|17.267
Petrzalka, SK|48.123|17.129
Partizanske, SK|48.629|18.385
Nove Zamky, SK|47.985|18.162
Nove Mesto nad Vahom, SK|48.758|17.831
Nitra, SK|48.308|18.085
Martin, SK|49.067|18.924
Malacky, SK|48.436|17.022
Lucenec, SK|48.332|19.667
Liptovsky Mikulas, SK|49.081|19.622
Levice, SK|48.216|18.607
Komarno, SK|48.117|18.317
Komarno, SK|47.764|18.123
Karlova Ves, SK|48.153|17.055
Hlohovec, SK|48.432|17.803
Handlova, SK|48.728|18.760
Galanta, SK|48.190|17.727
Dunajska Streda, SK|47.993|17.612
Dubravka, SK|48.189|17.035
Dubnica nad Vahom, SK|48.960|18.166
Dolny Kubin, SK|49.210|19.303
Cadca, SK|49.435|18.789
Brezno, SK|48.804|19.636
Bratislava, SK|48.148|17.107
Banska Bystrica, SK|48.739|19.149
Banovce nad Bebravou, SK|48.721|18.258
Devinska Nova Ves, SK|48.207|16.979
Dlhe diely, SK|48.155|17.046
Waterloo, SL|8.339|-13.071
Segbwema, SL|7.995|-10.950
Port Loko, SL|8.766|-12.787
Njala, SL|8.232|-12.016
Makeni, SL|8.886|-12.044
Lunsar, SL|8.684|-12.535
Koidu, SL|8.644|-10.971
Kenema, SL|7.877|-11.190
Kabala, SL|9.589|-11.553
Freetown, SL|8.487|-13.236
Bumpe, SL|7.892|-11.905
Bo, SL|7.965|-11.738
Goderich, SL|8.428|-13.286
Mile 91, SL|8.466|-12.215
San Marino, SM|43.937|12.446
Ziguinchor, SN|12.568|-16.273
Yoff, SN|14.747|-17.490
Velingara, SN|13.150|-14.117
Touba, SN|14.862|-15.875
Tivaouane, SN|14.952|-16.815
Tiebo, SN|14.633|-16.233
Thiadiaye, SN|14.420|-16.703
Thilogne, SN|15.924|-13.658
Thies Nones, SN|14.783|-16.967
Thies, SN|14.789|-16.926
Tambacounda, SN|13.771|-13.667
Sedhiou, SN|12.708|-15.557
Sebikhotane, SN|14.745|-17.138
Saint-Louis, SN|16.018|-16.490
Rufisque, SN|14.715|-17.273
Richard-Toll, SN|16.462|-15.701
Pout, SN|14.771|-17.061
PoukhamUn, SN|14.358|-16.412
Pikine, SN|14.765|-17.391
Ouro Sogui, SN|15.606|-13.322
Nioro du Rip, SN|13.750|-15.800
Niakoul Rab, SN|14.784|-17.274
Nguekhokh, SN|14.513|-17.004
Ndioum, SN|16.513|-14.647
Ndibene Dahra, SN|15.334|-15.477
KeurMedoune, SN|14.758|-15.904
Mekhe, SN|15.110|-16.622
Medina Gounas, SN|13.136|-13.756
Mbour, SN|14.422|-16.964
Mboro, SN|15.141|-16.887
Mbake, SN|14.790|-15.908
Matam, SN|15.656|-13.255
Louga, SN|15.619|-16.224
Linguere, SN|15.395|-15.119
Koungneul Sosse, SN|13.967|-14.817
Koungheul, SN|13.983|-14.800
Koumpentoum, SN|13.983|-14.567
Kolda, SN|12.894|-14.941
Khombole, SN|14.764|-16.692
Kedougou, SN|12.556|-12.181
Kebemer, SN|15.365|-16.434
Kbombole, SN|14.767|-16.700
Kayar, SN|14.919|-17.120
Kaolack, SN|14.152|-16.073
Kanel, SN|15.492|-13.176
Kahone, SN|14.158|-16.036
Kaffrine, SN|14.106|-15.551
Joal, SN|14.173|-16.849
Guinguineo, SN|14.270|-15.945
Goudomp, SN|12.578|-15.872
Gossas Village, SN|14.484|-16.114
Gandiaye, SN|14.244|-16.272
Fatick, SN|14.332|-16.405
Dougnane, SN|14.959|-16.870
Diourbel, SN|14.648|-16.244
Diaoube, SN|12.917|-14.167
Dara, SN|15.348|-15.480
Dakar, SN|14.694|-17.444
Dagana, SN|16.477|-15.600
Bignona, SN|12.810|-16.226
Bargny Guedj, SN|14.687|-17.228
Bargny, SN|14.697|-17.230
Sali, SN|14.441|-17.019
Bargny Ngoude, SN|14.694|-17.235
Diamniadio, SN|14.721|-17.182
Le Plateau, SN|14.662|-17.440
Guediawaye, SN|14.774|-17.402
Bambey, SN|14.701|-16.459
Ndiareme limamoulaye, SN|14.781|-17.384
Rufisque est, SN|14.716|-17.273
Jaxaay Parcelle Niakoul Rap, SN|14.775|-17.280
Wanlaweyn, SO|2.619|44.894
Tog Wajaale, SO|9.600|43.335
Saylac, SO|11.354|43.473
Ruqi, SO|9.973|43.428
Qoryooley, SO|1.788|44.530
Qandala, SO|11.472|49.873
Mogadishu, SO|2.037|45.344
Marka, SO|1.716|44.772
Luuq, SO|3.803|42.544
Kismayo, SO|-0.358|42.545
Kaambooni, SO|-1.638|41.587
Jilib, SO|0.488|42.785
Jawhar, SO|2.781|45.500
Jamaame, SO|0.070|42.745
Hargeysa, SO|9.560|44.065
Gebiley, SO|9.700|43.624
Garoowe, SO|8.402|48.483
Gaalkacyo, SO|6.770|47.431
Eyl, SO|7.980|49.816
El Dibir, SO|11.767|51.217
Diinsoor, SO|2.409|42.977
Dhamas, SO|3.153|41.336
Ceerigaabo, SO|10.616|47.368
Ceeldheer, SO|3.849|47.181
Cabudwaaq, SO|6.246|46.225
Buurhakaba, SO|2.803|44.078
Buulobarde, SO|3.854|45.567
Burao, SO|9.522|45.534
Buaale, SO|1.083|42.583
Bosaso, SO|11.284|49.182
Borama, SO|9.936|43.183
Berbera, SO|10.440|45.014
Beledweyne, SO|4.736|45.204
Baidoa, SO|3.114|43.650
Baardheere, SO|2.345|42.276
Afgooye, SO|2.138|45.121
Balanbale, SO|5.769|45.763
Laascaanood, SO|8.477|47.360
Saaxo, SO|6.773|46.797
Dhabad, SO|6.432|46.462
Baki, SO|9.892|43.385
Beled Hawo, SO|3.928|41.880
Rainville, SR|5.834|-55.138
Paramaribo, SR|5.866|-55.167
Lelydorp, SR|5.700|-55.233
Flora, SR|5.800|-55.200
Blauwgrond, SR|5.843|-55.119
Munder Buiten, SR|5.841|-55.182
Tammenga, SR|5.829|-55.202
Welgelegen, SR|5.842|-55.219
Beekhuizen, SR|5.806|-55.174
Pontbuiten, SR|5.788|-55.209
Latour, SR|5.797|-55.209
Weg naar Zee, SR|5.871|-55.215
Yei, SS|4.094|30.676
Yambio, SS|4.571|28.394
Winejok, SS|9.012|27.571
Wau, SS|7.701|27.990
Aweil, SS|8.762|27.392
Torit, SS|4.412|32.570
Tonj, SS|7.274|28.677
Rumbek, SS|6.806|29.677
Malakal, SS|9.533|31.660
Leer, SS|8.303|30.141
Kuacjok, SS|8.303|27.980
Kafia Kingi, SS|9.273|24.417
Juba, SS|4.852|31.582
Gogrial, SS|8.533|28.100
Pajok, SS|3.865|32.482
Bor, SS|6.209|31.559
Sao Tome, ST|0.338|6.730
Zacatecoluca, SV|13.509|-88.870
Usulutan, SV|13.345|-88.440
Soyapango, SV|13.710|-89.140
Sonzacate, SV|13.734|-89.715
Sonsonate, SV|13.717|-89.723
Sensuntepeque, SV|13.876|-88.627
San Vicente, SV|13.641|-88.785
Santiago de Maria, SV|13.483|-88.467
Santa Ana, SV|13.988|-89.557
San Salvador, SV|13.689|-89.187
San Rafael Oriente, SV|13.383|-88.350
San Miguel, SV|13.483|-88.182
San Martin, SV|13.783|-88.917
San Marcos, SV|13.661|-89.183
San Francisco, SV|13.694|-88.104
Quezaltepeque, SV|13.831|-89.272
Puerto El Triunfo, SV|13.283|-88.550
Santa Tecla, SV|13.677|-89.283
Metapan, SV|14.333|-89.450
Mejicanos, SV|13.724|-89.188
La Union, SV|13.339|-87.843
La Libertad, SV|13.488|-89.322
Izalco, SV|13.745|-89.673
Ilopango, SV|13.702|-89.109
Delgado, SV|13.722|-89.169
Cuscatancingo, SV|13.727|-89.182
Cojutepeque, SV|13.720|-88.933
Chalchuapa, SV|13.987|-89.681
Chalatenango, SV|14.041|-88.940
Ayutuxtepeque, SV|13.735|-89.202
Apopa, SV|13.807|-89.179
Antiguo Cuscatlan, SV|13.665|-89.253
Ahuachapan, SV|13.924|-89.843
Aguilares, SV|13.957|-89.190
Acajutla, SV|13.593|-89.828
Philipsburg, SX|18.026|-63.046
Zakiyah, SY|33.334|36.159
Yabrud, SY|33.969|36.657
Tayyibat al Imam, SY|35.266|36.712
Tartus, SY|34.889|35.887
Tall Rif`at, SY|36.472|37.095
Tallkalakh, SY|34.668|36.260
Tallbisah, SY|34.841|36.731
Tafas, SY|32.737|36.067
Tadmur, SY|34.562|38.284
Tadif, SY|36.348|37.531
Suran, SY|35.292|36.748
Subaykhan, SY|34.853|40.600
Shaykh Miskin, SY|32.827|36.161
Saraqib, SY|35.864|36.806
Salqin, SY|36.139|36.452
As Salamiyah, SY|35.011|37.053
Sahnaya, SY|33.425|36.226
Safita, SY|34.821|36.118
Qatana, SY|33.438|36.079
Jasim, SY|32.991|36.061
Qarah, SY|34.156|36.743
Kabbasin, SY|36.433|37.569
Nubl, SY|36.379|36.993
Nawa, SY|32.886|36.039
al-Yarmuk, SY|33.470|36.302
Maharda, SY|35.248|36.572
Muadamiyat al-Sham, SY|33.465|36.202
Masyaf, SY|35.065|36.341
Manbij, SY|36.528|37.955
Ma`arratmisrin, SY|36.012|36.672
Khan Shaykhun, SY|35.442|36.651
Kafr Zayta, SY|35.374|36.603
Kafr Takharim, SY|36.117|36.515
Kafranbel, SY|35.614|36.564
Kafr Laha, SY|34.895|36.496
Jisr ash Shughur, SY|35.814|36.320
Jayrud, SY|33.807|36.739
Jaramana, SY|33.486|36.346
Jarabulus, SY|36.818|38.011
Jablah, SY|35.362|35.928
`Irbin, SY|33.537|36.366
Inkhil, SY|33.018|36.128
Idlib, SY|35.931|36.634
Homs, SY|34.724|36.726
Harasta, SY|33.559|36.365
Hamah, SY|35.132|36.758
Halfaya, SY|35.260|36.606
Aleppo, SY|36.201|37.161
Duma, SY|33.572|36.403
Damascus, SY|33.510|36.291
Dayr Hafir, SY|36.157|37.708
Deir ez-Zor, SY|35.336|40.141
Ad Darbasiyah, SY|37.073|40.652
Darayya, SY|33.458|36.233
Dara, SY|32.619|36.102
Dail, SY|32.754|36.131
Burj Islam, SY|35.674|35.803
Binnish, SY|35.957|36.714
Batabo, SY|36.134|36.740
Baniyas, SY|35.182|35.949
Babila, SY|33.471|36.331
Az Zabadani, SY|33.725|36.100
I`zaz, SY|36.587|37.046
Ayn al Arab, SY|36.891|38.353
At Tall, SY|33.610|36.311
Al-Tabqa, SY|35.838|38.548
As-Suwayda, SY|32.709|36.570
As Sanamayn, SY|33.072|36.183
As Safirah, SY|36.077|37.373
Ar Rastan, SY|34.927|36.732
Ar Raqqah, SY|35.953|39.008
An Nabk, SY|34.024|36.728
Amuda, SY|37.104|40.930
Al Qutayfah, SY|33.738|36.601
Al Qusayr, SY|34.508|36.580
Al Qunaytirah, SY|33.126|35.825
Al Qaryatayn, SY|34.230|37.241
Al Qamishli, SY|37.052|41.231
Al Mayadin, SY|35.020|40.452
Al Malikiyah, SY|37.177|42.140
Latakia, SY|35.531|35.791
Al Kiswah, SY|33.358|36.242
Al Hasakah, SY|36.502|40.748
Al Hirak, SY|32.749|36.306
Al Bab, SY|36.371|37.516
`Afrin, SY|36.512|36.870
Ad Dana, SY|36.213|36.770
Albu Kamal, SY|34.452|40.919
Hajin, SY|34.695|40.831
Mbabane, SZ|-26.317|31.133
Manzini, SZ|-26.499|31.380
Lobamba, SZ|-26.467|31.200
Cockburn Town, TC|21.461|-71.142
Providenciales, TC|21.783|-72.252
Iriba, TD|15.117|22.250
Goz Beida, TD|12.226|21.410
Fada, TD|17.192|21.581
Biltine, TD|14.527|20.926
Am Timan, TD|11.043|20.283
Adre, TD|13.466|22.199
Abeche, TD|13.829|20.832
Sarh, TD|9.146|18.383
Pala, TD|9.365|14.907
Umm Hajar, TD|13.295|19.697
NDjamena, TD|12.107|15.044
Moussoro, TD|13.644|16.490
Moundou, TD|8.574|16.077
Mongo, TD|12.185|18.688
Moissala, TD|8.340|17.766
Mboursou Lere, TD|9.764|14.154
Massakory, TD|12.998|15.732
Massaguet, TD|12.476|15.436
Maro, TD|9.223|17.710
Mao, TD|14.123|15.312
Mangalme, TD|12.355|19.614
Mandelia, TD|11.730|15.245
Lere, TD|9.645|14.215
Lai, TD|9.397|16.301
Kyabe, TD|9.451|18.945
Koumra, TD|8.916|17.550
Kelo, TD|9.309|15.807
Guelendeng, TD|10.918|15.550
Gounou Gaya, TD|9.629|15.513
Gore, TD|8.650|16.517
Fianga, TD|9.915|15.140
Faya-Largeau, TD|17.926|19.104
Dourbali, TD|11.806|15.867
Doba, TD|8.664|16.853
Deressia, TD|9.760|16.270
Bousso, TD|10.485|16.711
Bongor, TD|10.281|15.374
Bol, TD|13.467|14.714
Bokoro, TD|12.378|17.059
Bitkine, TD|11.980|18.214
Bere, TD|9.320|16.155
Benoy, TD|8.983|16.320
Bediondo, TD|8.629|17.186
Bebedja, TD|8.676|16.566
Ati, TD|13.214|18.339
Amdjarass, TD|16.067|22.835
Port-aux-Francais, TF|-49.349|70.219
Vogan, TG|6.333|1.533
Tsevie, TG|6.426|1.213
Tchamba, TG|9.033|1.417
Tabligbo, TG|6.583|1.500
Sotouboua, TG|8.563|0.984
Sokode, TG|8.983|1.133
Notse, TG|6.950|1.167
Niamtougou, TG|9.768|1.105
Mango, TG|10.359|0.471
Lome, TG|6.129|1.222
Kpalime, TG|6.900|0.633
Kara, TG|9.551|1.186
Dapaong, TG|10.862|0.208
Sinkasse, TG|11.104|0.009
Bassar, TG|9.250|0.782
Bafilo, TG|9.350|1.267
Badou, TG|7.583|0.600
Atakpame, TG|7.533|1.133
Anie, TG|7.750|1.200
Aneho, TG|6.228|1.592
Ban Talat Yai, TH|7.885|98.400
Ban Talat Nua, TH|7.885|98.386
Sam Roi Yot, TH|12.271|99.872
Phetchaburi, TH|13.112|99.945
Trang, TH|7.556|99.611
Thung Song, TH|8.165|99.680
Thoen, TH|17.613|99.216
Thap Than, TH|15.461|99.892
Tha Muang, TH|13.961|99.641
Tha Maka, TH|13.900|99.767
Takua Pa, TH|8.870|98.344
Tak, TH|16.870|99.129
Surat Thani, TH|9.140|99.333
Sukhothai, TH|17.008|99.823
Si Satchanalai, TH|17.517|99.760
Sawankhalok, TH|17.316|99.832
San Pa Tong, TH|18.628|98.896
San Kamphaeng, TH|18.745|99.120
Ron Phibun, TH|8.179|99.854
Ratchaburi, TH|13.537|99.817
Ranong, TH|9.966|98.635
Pran Buri, TH|12.385|99.902
Prachuap Khiri Khan, TH|11.821|99.784
Tha Kham, TH|9.111|99.232
Phuket, TH|7.891|98.398
Photharam, TH|13.692|99.850
Phayao, TH|19.192|99.879
Pa Sang, TH|18.526|98.939
Nakhon Si Thammarat, TH|8.433|99.967
Mae Sot, TH|16.717|98.567
Mae Sai, TH|20.434|99.876
Mae Ramat, TH|16.984|98.517
Mae Chan, TH|20.147|99.853
Lat Yao, TH|15.751|99.789
Lang Suan, TH|9.946|99.078
Lamphun, TH|18.581|99.007
Lampang, TH|18.292|99.493
Kui Buri, TH|12.083|99.854
Krabi, TH|8.073|98.911
Khao Yoi, TH|13.240|99.824
Khanu Woralaksaburi, TH|16.062|99.861
Kathu, TH|7.918|98.333
Kanchanaburi, TH|14.004|99.548
Kamphaeng Phet, TH|16.483|99.522
Huai Yot, TH|7.789|99.635
Hua Hin, TH|12.571|99.959
Hang Dong, TH|18.687|98.919
Dok Kham Tai, TH|19.162|99.993
Damnoen Saduak, TH|13.518|99.955
Chumphon, TH|10.496|99.180
Chom Bueng, TH|13.620|99.592
Chiang Rai, TH|19.909|99.832
Chiang Mai, TH|18.790|98.985
Cha-am, TH|12.800|99.967
Bo Phloi, TH|14.325|99.515
Ban Tak, TH|17.043|99.081
Ko Samui, TH|9.536|99.936
Ban Ko Sire, TH|7.887|98.426
Ban Pong, TH|13.816|99.877
Nong Prue, TH|14.608|99.458
Ban Na San, TH|8.800|99.364
Ban Na, TH|17.017|99.733
Ban Kamala, TH|7.955|98.283
Ban I Chang, TH|13.711|99.896
Bang Saphan, TH|11.213|99.512
Bang Phae, TH|13.692|99.930
Nong Kung Si, TH|16.650|103.300
Ban Nong Wua So, TH|17.267|103.225
Ban Mai, TH|7.204|100.545
Ban Khlong Bang Bon, TH|13.636|100.377
Ban Huai Thalaeng, TH|14.983|102.650
Ban Khlong Bang Sao Thong, TH|13.642|100.833
Na Klang, TH|17.307|102.189
Yasothon, TH|15.794|104.145
Yaring, TH|6.866|101.369
Yan Nawa, TH|13.696|100.542
Yala, TH|6.540|101.281
Wiset Chaichan, TH|14.595|100.338
Wichian Buri, TH|15.658|101.106
Warin Chamrap, TH|15.193|104.863
Warichaphum, TH|17.294|103.638
Wang Saphung, TH|17.301|101.769
Wang Noi, TH|14.227|100.716
Wang Nam Yen, TH|13.505|102.181
Uttaradit, TH|17.626|100.094
Uthai Thani, TH|15.379|100.025
Udon Thani, TH|17.416|102.786
Ubon Ratchathani, TH|15.238|104.849
Trat, TH|12.244|102.515
Thon Buri, TH|13.725|100.485
Tha Yang, TH|12.958|99.906
Tha Ruea, TH|14.567|100.726
Thap Khlo, TH|16.160|100.597
Tha Mai, TH|12.622|102.005
Tha Bo, TH|17.850|102.581
Taphan Hin, TH|16.221|100.420
Taling Chan, TH|13.777|100.457
Tak Bai, TH|6.259|102.055
Surin, TH|14.882|103.494
Suphan Buri, TH|14.474|100.122
Su-ngai Kolok, TH|6.030|101.966
Songkhla, TH|7.199|100.595
Si Sa Ket, TH|15.115|104.329
Si Racha, TH|13.173|100.932
Sing Buri, TH|14.888|100.405
Si Maha Phot, TH|13.966|101.514
Seka, TH|17.929|103.955
Sawang Daen Din, TH|17.475|103.458
Satun, TH|6.623|100.067
Sattahip, TH|12.666|100.902
Saraburi, TH|14.533|100.917
Samut Songkhram, TH|13.415|100.003
Samut Sakhon, TH|13.548|100.274
Samut Prakan, TH|13.598|100.597
Sam Phran, TH|13.727|100.215
Samphanthawong, TH|13.737|100.512
Sakon Nakhon, TH|17.161|104.147
Sa Kaeo, TH|13.814|102.072
Sadao, TH|6.639|100.423
Roi Et, TH|16.057|103.653
Rayong, TH|12.681|101.258
Rat Burana, TH|13.682|100.506
Ranot, TH|7.778|100.321
Ra-ngae, TH|6.297|101.728
Prakhon Chai, TH|14.606|103.121
Prachin Buri, TH|14.050|101.369
Prachantakham, TH|14.064|101.516
Pom Prap Sattru Phai, TH|13.758|100.513
Phu Kradueng, TH|16.884|101.885
Phu Khiao, TH|16.377|102.129
Phra Pradaeng, TH|13.659|100.534
Phra Phutthabat, TH|14.726|100.796
Phra Nakhon Si Ayutthaya, TH|14.352|100.577
Phra Khanong, TH|13.702|100.602
Phrae, TH|18.146|100.141
Phon Charoen, TH|18.033|103.167
Phitsanulok, TH|16.825|100.259
Phichit, TH|16.442|100.349
Phibun Mangsahan, TH|15.245|105.229
Phetchabun, TH|16.419|101.161
Phatthalung, TH|7.618|100.078
Phasi Charoen, TH|13.715|100.437
Phan Thong, TH|13.470|101.093
Phanom Sarakham, TH|13.749|101.349
Phanat Nikhom, TH|13.447|101.185
Phak Hai, TH|14.457|100.370
Pattani, TH|6.868|101.250
Pathum Thani, TH|14.013|100.530
Pak Phanang, TH|8.351|100.202
Pak Kret, TH|13.912|100.498
Pak Chong, TH|14.708|101.416
Mueang Nonthaburi, TH|13.861|100.515
Non Sung, TH|15.180|102.257
Nong Phai, TH|15.990|101.062
Nong Khai, TH|17.878|102.742
Nong Khaem, TH|13.706|100.349
Nong Khae, TH|14.340|100.867
Nong Chok, TH|13.856|100.862
Nong Bua Lamphu, TH|17.204|102.441
Narathiwat, TH|6.426|101.823
Nang Rong, TH|14.638|102.791
Nan, TH|18.784|100.779
Nam Som, TH|17.770|102.189
Nakhon Sawan, TH|15.705|100.137
Nakhon Ratchasima, TH|14.971|102.102
Nakhon Phanom, TH|17.411|104.779
Nakhon Pathom, TH|13.820|100.044
Nakhon Nayok, TH|14.205|101.213
Nakhon Luang, TH|14.463|100.609
Mukdahan, TH|16.545|104.724
Makkasan, TH|13.752|100.543
Maha Sarakham, TH|16.185|103.301
Lop Buri, TH|14.798|100.654
Lom Sak, TH|16.780|101.242
Loei, TH|17.491|101.727
Laem Sing, TH|12.482|102.074
Laem Ngop, TH|12.171|102.395
Kut Chap, TH|17.426|102.567
Kuchinarai, TH|16.541|104.050
Bangkok, TH|13.754|100.501
Krathum Baen, TH|13.653|100.260
Klaeng, TH|12.780|101.649
Khon Kaen, TH|16.447|102.833
Khon Buri, TH|14.525|102.246
Khlong Yai, TH|11.777|102.887
Khlong San, TH|13.730|100.509
Khlong Luang, TH|14.065|100.646
Khao Wong, TH|16.700|104.090
Khao Saming, TH|12.354|102.434
Kaset Wisai, TH|15.656|103.584
Kaset Sombun, TH|16.281|101.954
Kantharalak, TH|14.641|104.650
Kamalasai, TH|16.338|103.576
Kalasin, TH|16.433|103.507
Kaeng Khoi, TH|14.586|100.998
Kaeng Khro, TH|16.109|102.258
Kabin Buri, TH|13.951|101.717
Hat Yai, TH|7.008|100.477
Dusit, TH|13.777|100.520
Det Udom, TH|14.906|105.078
Den Chai, TH|17.984|100.052
Dan Khun Thot, TH|15.209|101.771
Chum Phae, TH|16.544|102.099
Chong Nonsi, TH|13.693|100.549
Chon Daen, TH|16.190|100.860
Chon Buri, TH|13.362|100.983
Chok Chai, TH|14.728|102.165
Chanthaburi, TH|12.610|102.104
Chaiyaphum, TH|15.810|102.029
Chai Nat, TH|15.186|100.124
Chai Badan, TH|15.200|101.133
Chachoengsao, TH|13.688|101.072
Buri Ram, TH|14.994|103.104
Bua Yai, TH|15.586|102.426
Betong, TH|5.774|101.072
Ban Tha Kham, TH|13.637|100.441
Ban Selaphum, TH|16.017|103.950
Ban Sang, TH|13.996|101.221
Ban Samae Dam, TH|13.590|100.387
Ban Phra, TH|14.095|101.389
Ban Phe, TH|12.628|101.438
Pattaya, TH|12.933|100.883
Ban Phan Don, TH|17.143|102.973
Ban Phai, TH|16.060|102.731
Ban Phaeo, TH|13.591|100.107
Thambon Na Mueang, TH|14.056|101.372
Na Di, TH|14.116|101.782
Ban Mo, TH|14.616|100.726
Ban Lam Luk Ka, TH|13.977|100.778
Ban Khlong Prawet, TH|13.719|100.681
Ban Khlong Bang Ramat, TH|13.767|100.433
Bang Rakam, TH|16.758|100.117
Bang Rak, TH|13.731|100.524
Bang Racham, TH|14.892|100.317
Bang Pakong, TH|13.543|100.993
Bang Pa-in, TH|14.228|100.576
Bang Mun Nak, TH|16.028|100.379
Bang Len, TH|14.022|100.172
Bang Lamung, TH|13.047|100.929
Bang Kruai, TH|13.805|100.473
Bang Krathum, TH|16.578|100.300
Bangkok Yai, TH|13.723|100.476
Bangkok Noi, TH|13.763|100.478
Bang Khun Thian, TH|13.663|100.434
Bang Khlo, TH|13.699|100.512
Bang Kapi, TH|13.765|100.647
Bang Bua Thong, TH|13.918|100.424
Bang Ban, TH|14.374|100.485
Ban Dung, TH|17.699|103.260
Ban Chang, TH|12.725|101.055
Ban Bueng, TH|13.312|101.113
Ban Talat Bueng, TH|13.071|101.003
Bang Phlat, TH|13.794|100.504
Bang Na, TH|13.667|100.642
Ban Bang Kadi, TH|13.999|100.550
Bang Bo District, TH|13.583|100.817
Ban Bang Bamru, TH|13.783|100.483
Ban Ang Sila, TH|13.340|100.930
Aranyaprathet, TH|13.693|102.501
Amnat Charoen, TH|15.859|104.629
Laem Chabang, TH|13.088|100.884
Amphoe Sikhiu, TH|14.899|101.708
Din Daeng, TH|13.790|100.570
Wichit, TH|7.889|98.385
Bang Sue, TH|13.811|100.531
Khlong Toei, TH|13.710|100.582
Lat Krabang, TH|13.722|100.785
Bang Khae, TH|13.693|100.408
Bang Kho Laem, TH|13.693|100.501
Bueng Kum, TH|13.785|100.670
Chatuchak, TH|13.829|100.559
Chom Thong, TH|13.677|100.484
Huai Khwang, TH|13.777|100.579
Khan Na Yao, TH|13.826|100.677
Lak Si, TH|13.887|100.579
Lat Phrao, TH|13.803|100.607
Pathum Wan, TH|13.737|100.523
Phaya Thai, TH|13.780|100.543
Ratchathewi, TH|13.759|100.534
Sai Mai, TH|13.921|100.646
Saphan Sung, TH|13.770|100.685
Sathon, TH|13.709|100.526
Suan Luang, TH|13.730|100.651
Thawi Watthana, TH|13.783|100.378
Thung Khru, TH|13.628|100.510
Wang Thonglang, TH|13.785|100.612
Watthana, TH|13.730|100.585
Ban Chalong, TH|7.845|98.339
Ban Ratsada, TH|7.910|98.402
Ban Khlong Bang Phran, TH|13.663|100.388
Ban Lak Song, TH|13.689|100.398
Khwaeng Bang Khae, TH|13.692|100.404
Si Mahosot, TH|13.888|101.405
Erawan, TH|17.302|101.954
Ban Aranyik, TH|16.826|100.285
Bang Bon, TH|13.662|100.396
Phra Nakhon, TH|13.765|100.499
Sathorn, TH|13.750|100.517
Bangkok Riverside, TH|13.755|100.517
Huamak, TH|13.758|100.647
Latkrabang, TH|13.728|100.746
Prachin Buri Town, TH|14.055|101.373
Sam Sen Nai, TH|13.777|100.551
Inner Huai Khwang, TH|13.782|100.584
Khetsamsenok, TH|13.793|100.583
Chorakhe Bua, TH|13.839|100.611
Chan Kasem, TH|13.821|100.583
Khwaeng Bang Plat, TH|13.788|100.495
Khlong Sam Wa, TH|13.871|100.737
Bang Bon Nuea, TH|13.653|100.359
Bangbontai, TH|13.647|100.371
Khlong Chan, TH|13.781|100.645
Bang Khae Nuea, TH|13.706|100.389
Bang Phai, TH|13.707|100.387
Tha Raeng, TH|13.868|100.645
Anusawari, TH|13.895|100.614
Bang Kho Laem subdistrict, TH|13.693|100.502
Bang O, TH|13.836|100.460
Bang Yi Khan, TH|13.763|100.490
Bang Sue subdistrict, TH|13.806|100.531
Wong Sawang, TH|13.817|100.516
Ban Chang Lo, TH|13.751|100.477
Bang Khun Si, TH|13.751|100.470
Arun Amarin, TH|13.767|100.483
Wat Tha Phra, TH|13.735|100.476
Khlong Kum, TH|13.788|100.680
Lat Yao, TH|13.847|100.564
Sena Nikhom, TH|13.837|100.577
Chomphon, TH|13.804|100.560
Chatuchak subdistrict, TH|13.827|100.555
Yovon, TJ|38.314|69.038
Hulbuk, TJ|37.805|69.645
Vakhsh, TJ|37.715|68.835
Istaravshan, TJ|39.914|69.003
Shahriston, TJ|39.774|68.809
Bokhtar, TJ|37.837|68.778
Panjakent, TJ|39.495|67.609
Farkhor, TJ|37.492|69.404
Vahdat, TJ|38.556|69.014
Norak, TJ|38.389|69.323
Muchun, TJ|39.881|69.182
Kulob, TJ|37.915|69.785
Kolkhozobod, TJ|37.588|68.659
Khorugh, TJ|37.490|71.553
Ishqoshim, TJ|36.725|71.613
Hisor, TJ|38.525|68.551
Dushanbe, TJ|38.536|68.779
Danghara, TJ|38.096|69.340
Dalyoni Bolo, TJ|39.749|68.996
Chubek, TJ|37.615|69.705
Boshkengash, TJ|38.466|68.805
Zarhalol, TJ|37.465|68.169
Tursunzoda, TJ|38.513|68.232
Istiqlol, TJ|40.570|69.642
Proletar, TJ|40.167|69.502
Khujand, TJ|40.283|69.622
Qayroqqum, TJ|40.266|69.796
Konibodom, TJ|40.294|70.431
Isfara, TJ|40.126|70.625
Buston, TJ|40.234|69.695
Moskovskiy, TJ|37.609|68.581
Suai, TL|-9.313|125.256
Maubara, TL|-8.612|125.206
Maliana, TL|-8.992|125.220
Likisa, TL|-8.588|125.342
Dili, TL|-8.559|125.574
Baukau, TL|-8.476|126.456
Atsabe, TL|-8.925|125.398
Aileu, TL|-8.728|125.566
Lospalos, TL|-8.522|126.998
Venilale, TL|-8.643|126.378
Balkanabat, TM|39.511|54.367
Kaka, TM|37.348|59.614
Gyzylarbat, TM|38.976|56.276
Gaemi, TM|37.907|58.470
Gumdag, TM|39.202|54.587
Goekdepe, TM|38.159|57.961
Bereket, TM|39.245|55.515
Magtymguly, TM|38.436|56.284
Jebel, TM|39.631|54.238
Abadan, TM|38.054|58.197
Ahal, TM|38.220|58.016
Baeherden, TM|38.436|57.432
Ashgabat, TM|37.950|58.383
AEnew, TM|37.888|58.516
Yylanly, TM|41.833|59.650
Gubadag, TM|42.079|59.950
Goerogly, TM|41.650|59.916
Oyrat, TM|41.946|59.909
Tuerkmenbasy, TM|40.022|52.955
Koeneuergenc, TM|42.326|59.153
Boldumsaz, TM|42.128|59.672
Dasoguz, TM|41.836|59.967
Yoloeten, TM|37.299|62.360
Tuerkmengala, TM|37.425|62.338
Tejen, TM|37.383|60.505
Seydi, TM|39.482|62.914
Sayat, TM|38.784|63.880
Sarahs, TM|36.524|61.215
Mary, TM|37.594|61.830
Halac, TM|38.072|64.879
Kerki, TM|37.841|65.206
Magdanly, TM|37.812|66.047
Casgyn, TM|37.797|61.549
Tuerkmenabat, TM|39.073|63.579
Bayramaly, TM|37.619|62.167
Gazojak, TM|41.187|61.404
Zaouiet Sousse, TN|35.786|10.627
Zaghouan, TN|36.403|10.143
Oued Lill, TN|36.834|10.041
Moulares, TN|34.489|8.269
Tunis, TN|36.819|10.166
Tinja, TN|37.160|9.761
Tozeur, TN|33.920|8.134
Tataouine, TN|32.930|10.452
Thala, TN|35.572|8.670
Takelsa, TN|36.783|10.633
Tajerouine, TN|35.892|8.553
Tabursuq, TN|36.457|9.248
Tebourba, TN|36.829|9.839
Teboulbou, TN|33.846|10.114
Teboulba, TN|35.640|10.967
Tabarka, TN|36.954|8.758
Sousse, TN|35.825|10.637
Soliman, TN|36.696|10.492
Sukrah, TN|36.877|10.247
Sbeitla, TN|35.232|9.123
Siliana, TN|36.085|9.371
Sidi Bouzid, TN|35.038|9.485
Sidi Abid, TN|34.700|10.695
Sakiet ez Zit, TN|34.802|10.764
Sakiet ed Daier, TN|34.794|10.806
Skanes, TN|35.775|10.795
Sfax, TN|34.741|10.760
La Sebala du Mornag, TN|36.679|10.292
Rass el Djebel, TN|37.216|10.125
Rades, TN|36.769|10.275
Ksour Essaf, TN|35.418|10.995
Grombalia, TN|36.599|10.500
Korba, TN|36.579|10.859
Kelibia, TN|36.848|11.094
Kebili, TN|33.704|8.969
Ksar Hellal, TN|35.648|10.890
Carthage, TN|36.861|10.332
El Fahs, TN|36.374|9.907
Galaat el Andeless, TN|37.063|10.118
Gafsa, TN|34.425|8.784
Gabes, TN|33.881|10.098
Nefta, TN|33.873|7.878
Nabeul, TN|36.456|10.738
Midoun, TN|33.808|10.992
Maatmeur, TN|35.752|10.691
Mateur, TN|37.040|9.666
Msaken, TN|35.729|10.581
Mareth, TN|33.618|10.285
Megrine, TN|36.769|10.236
Menzel Temime, TN|36.782|10.988
Menzel Jemil, TN|37.236|9.914
Mennzel Bou Zelfa, TN|36.683|10.584
Menzel Bourguiba, TN|37.154|9.786
Menzel Abderhaman, TN|37.237|9.863
Manouba, TN|36.810|10.096
Medjez el Bab, TN|36.650|9.612
Medenine, TN|33.355|10.505
Jendouba, TN|36.501|8.780
Zarzis, TN|33.504|11.112
Djemmal, TN|35.622|10.757
Houmt Souk, TN|33.876|10.857
Hammam Sousse, TN|35.861|10.603
Hammam-Lif, TN|36.729|10.342
La Goulette, TN|36.819|10.306
Ghardimaou, TN|36.448|8.441
Rhennouch, TN|33.941|10.064
Fouchana, TN|36.700|10.168
Feriana, TN|34.945|8.568
Douz, TN|33.466|9.020
Douar Tindja, TN|37.167|9.750
Dar Chabanne, TN|36.468|10.752
Dahmani, TN|35.944|8.828
Ben Gardane, TN|33.138|11.220
Ben Arous, TN|36.755|10.222
Le Bardo, TN|36.811|10.135
Bizerte, TN|37.274|9.874
Beni Khiar, TN|36.469|10.782
Beni Khalled, TN|36.650|10.590
Beja, TN|36.726|9.182
Zouila, TN|35.501|11.061
Zeramedine, TN|35.575|10.735
Sidi Husayn, TN|36.756|10.118
Sahline, TN|35.752|10.711
Chebba, TN|35.237|11.115
Aryanah, TN|36.860|10.193
Ar Rudayyif, TN|34.383|8.155
Ouardenine, TN|35.709|10.674
Kairouan, TN|35.678|10.096
Kasserine, TN|35.168|8.837
El Ksar, TN|34.399|8.804
Gremda, TN|34.791|10.721
Kalaa Srira, TN|35.822|10.557
Kelaa Kebira, TN|35.873|10.537
La Mornaghia, TN|36.759|10.017
Monastir, TN|35.778|10.826
Moknine, TN|35.633|10.900
La Mohammedia, TN|36.674|10.156
Metlaoui, TN|34.321|8.402
Metouia, TN|33.959|9.996
La Marsa, TN|36.878|10.325
El Mgarsa, TN|33.817|10.992
Mahires, TN|34.528|10.501
Mahdia, TN|35.505|11.062
Le Kram, TN|36.836|10.316
Kellabine, TN|34.709|11.215
El Kef, TN|36.174|8.705
Jedeida, TN|36.831|9.924
El Jem, TN|35.300|10.717
Hammamet, TN|36.400|10.617
El Hamma, TN|33.892|9.796
Bekalta, TN|35.617|10.995
El Ain, TN|34.800|10.783
El Alia, TN|37.169|10.035
Akouda, TN|35.869|10.565
Ajim, TN|33.726|10.757
Douane, TN|36.448|10.756
Dar el Haj Taieb, TN|34.784|10.744
Ez Zahra, TN|36.746|10.308
Borj Cedria, TN|36.697|10.387
Ouerdanine, TN|35.690|10.676
Rawad, TN|36.895|10.186
El Mourouj, TN|36.714|10.210
Ezzouhour, TN|35.790|10.583
Den Den, TN|36.808|10.111
Boumhel El Bassatine, TN|36.725|10.235
Bembla et Mnara, TN|35.699|10.795
Chenini Nahal, TN|33.872|10.055
Mnihla, TN|36.848|10.111
Douar Hicher, TN|36.827|10.090
Ettadhamen, TN|36.832|10.110
Nukualofa, TO|-21.137|-175.201
Yumurtalik, TR|36.769|35.789
Yueksekova, TR|37.574|44.287
Yozgat, TR|39.820|34.804
Yesilova, TR|38.156|36.258
Yesilli, TR|37.338|40.817
Erzin, TR|36.953|36.198
Yerkoey, TR|39.638|34.467
Didim, TR|37.385|27.256
Yatagan, TR|37.340|28.143
Yalvac, TR|38.296|31.178
Yahyali, TR|38.102|35.357
Viransehir, TR|37.223|39.755
Varto, TR|39.174|41.454
Van, TR|38.495|43.383
Cimin, TR|39.709|39.700
Usak, TR|38.674|29.406
Urla, TR|38.323|26.764
UErguep, TR|38.630|34.912
Sanliurfa, TR|37.167|38.794
Arsuz, TR|36.413|35.890
Turgutlu, TR|38.495|27.700
Tunceli, TR|39.099|39.544
Torbali, TR|38.182|27.335
Tire, TR|38.089|27.735
Tavsanli, TR|39.542|29.499
Tatvan, TR|38.492|42.283
Tasucu, TR|36.321|33.882
Tarsus, TR|36.918|34.893
Talas, TR|38.691|35.554
Susurluk, TR|39.914|28.158
Suruc, TR|36.976|38.425
Sorgun, TR|39.810|35.186
Soma, TR|39.186|27.609
Solhan, TR|38.965|41.054
Soeke, TR|37.748|27.406
Siverek, TR|37.755|39.317
Sivas, TR|39.748|37.016
Sirnak, TR|37.514|42.454
Simav, TR|39.088|28.978
Silvan, TR|38.137|41.008
Silopi, TR|37.244|42.463
Silifke, TR|36.378|33.934
Siirt, TR|37.929|41.941
Seydisehir, TR|37.419|31.845
Serinyol, TR|36.361|36.214
Serik, TR|36.917|31.105
Sereflikochisar, TR|38.939|33.539
Senirkent, TR|38.104|30.549
Semdinli, TR|37.305|44.574
Selcuk, TR|37.951|27.368
Seferihisar, TR|38.197|26.839
Sarkisla, TR|39.352|36.410
Sarkikaraagac, TR|38.079|31.366
Saraykoey, TR|37.924|28.925
Sandikli, TR|38.465|30.269
Samandag, TR|36.080|35.976
Salihli, TR|38.483|28.148
Reyhanli, TR|36.268|36.567
Polatli, TR|39.577|32.141
Pazarcik, TR|37.487|37.300
Patnos, TR|39.225|42.857
Pasinler, TR|39.980|41.670
Osmaniye, TR|37.074|36.248
Ortakoey, TR|38.737|34.039
Ortaca, TR|36.839|28.765
OEdemis, TR|38.228|27.970
Nusaybin, TR|37.070|41.215
Nizip, TR|37.010|37.794
Nigde, TR|37.966|34.679
Nevsehir, TR|38.625|34.712
Nazilli, TR|37.916|28.322
Mut, TR|36.644|33.439
Mus, TR|38.732|41.485
Mugla, TR|37.218|28.366
Mucur, TR|39.061|34.383
Milas, TR|37.316|27.784
Midyat, TR|37.419|41.339
Mersin, TR|36.812|34.639
Menemen, TR|38.608|27.069
Marmaris, TR|36.855|28.274
Mardin, TR|37.313|40.744
Manisa, TR|38.612|27.426
Manavgat, TR|36.787|31.441
Malazgirt, TR|39.147|42.535
Malatya, TR|38.350|38.317
Mahmutlar, TR|36.495|32.091
Lice, TR|38.458|40.639
Kuetahya, TR|39.424|29.983
Kusadasi, TR|37.860|27.257
Kurtalan, TR|37.925|41.685
Beykonak, TR|36.326|30.303
Kulu, TR|39.095|33.080
Kulp, TR|38.498|41.007
Kula, TR|38.547|28.650
Kuecuekcigli, TR|38.502|27.053
Kozluk, TR|38.191|41.478
Kozan, TR|37.455|35.816
Kovancilar, TR|38.719|39.863
Korkuteli, TR|37.065|30.196
Konya, TR|37.871|32.485
Konakli, TR|36.593|31.895
Konak, TR|38.400|27.100
Kiziltepe, TR|37.188|40.577
Serinhisar, TR|37.581|29.266
Kirsehir, TR|39.146|34.164
Kirkagac, TR|39.106|27.669
Kirikkale, TR|39.845|33.506
Kirikhan, TR|36.499|36.358
Kirecocagi, TR|37.050|35.233
Kilis, TR|36.716|37.115
Keskin, TR|39.673|33.614
Kemer, TR|36.598|30.561
Kemalpasa, TR|38.426|27.417
Kayseri, TR|38.732|35.485
Karsiyaka, TR|38.458|27.114
Karapinar, TR|37.716|33.551
Karaman, TR|37.181|33.215
Agri, TR|39.715|43.040
Karakocan, TR|38.952|40.027
Karacoban, TR|39.344|42.099
Kaman, TR|39.358|33.724
Kahta, TR|37.786|38.624
Kahramanmaras, TR|37.585|36.926
Kadirli, TR|37.374|36.096
Kadinhani, TR|38.240|32.211
Izmir, TR|38.413|27.138
Isparta, TR|37.764|30.552
Iskenderun, TR|36.587|36.173
Incirliova, TR|37.852|27.724
Imamoglu, TR|37.265|35.657
Ilgin, TR|38.279|31.914
Igdir, TR|39.924|44.045
Idil, TR|37.335|41.889
Hizan, TR|38.225|42.418
Hinis, TR|39.358|41.693
Hilvan, TR|37.587|38.955
Hidirbey, TR|36.208|36.128
Hadim, TR|36.988|32.457
Hacilar, TR|38.646|35.449
Gueroymak, TR|38.576|42.016
Goelbasi, TR|39.790|32.809
Goelbasi, TR|37.784|37.637
Goeksun, TR|38.021|36.497
Genc, TR|38.748|40.553
Gemerek, TR|39.183|36.072
Gediz, TR|38.994|29.391
Gazipasa, TR|36.269|32.318
Gaziantep, TR|37.059|37.383
Foca, TR|38.670|26.757
Fethiye, TR|36.640|29.128
Ezine, TR|39.786|26.341
Etlik, TR|39.982|32.825
Eskisehir, TR|39.777|30.521
Erzurum, TR|39.909|41.277
Erzincan, TR|39.739|39.490
Ermenek, TR|36.640|32.892
Ergani, TR|38.269|39.754
Eregli, TR|37.513|34.047
Erdemli, TR|36.605|34.308
Ercis, TR|39.026|43.360
Emirdag, TR|39.020|31.150
Emet, TR|39.343|29.258
Elmali, TR|36.736|29.918
Elmadag, TR|39.921|33.231
Elbistan, TR|38.206|37.198
Elazig, TR|38.674|39.223
Egirdir, TR|37.875|30.850
Edremit, TR|39.596|27.024
Dursunbey, TR|39.586|28.626
Doertyol, TR|36.839|36.230
Dogubayazit, TR|39.547|44.084
Diyarbakir, TR|37.914|40.217
Diyadin, TR|39.541|43.671
Dinar, TR|38.065|30.166
Develi, TR|38.391|35.492
Denizli, TR|37.774|29.087
Demirci, TR|39.046|28.659
Dargecit, TR|37.546|41.717
Darende, TR|38.546|37.506
Cumra, TR|37.573|32.774
Menderes, TR|38.250|27.134
Hakkari, TR|37.574|43.741
Cizre, TR|37.330|42.185
Cine, TR|37.613|28.059
Ceylanpinar, TR|36.847|40.050
Ceyhan, TR|37.025|35.818
Cesme, TR|38.326|26.306
Cermik, TR|38.135|39.445
Cay, TR|38.592|31.029
Cat, TR|39.606|40.968
Kestel, TR|36.509|32.083
Caglayancerit, TR|37.745|37.286
Cigli, TR|38.496|27.070
Burhaniye, TR|39.500|26.973
Burdur, TR|37.720|30.291
Bulanik, TR|39.087|42.272
Bucak, TR|37.459|30.595
Bozyazi, TR|36.108|32.961
Bozueyuek, TR|39.908|30.037
Bozova, TR|37.362|38.527
Bornova, TR|38.479|27.240
Bor, TR|37.891|34.559
Bolvadin, TR|38.711|31.049
Bodrum, TR|37.038|27.429
Bitlis, TR|38.401|42.108
Bismil, TR|37.845|40.659
Birecik, TR|37.026|37.978
Bingoel, TR|38.885|40.494
Bigadic, TR|39.392|28.131
Beysehir, TR|37.677|31.725
Besni, TR|37.693|37.861
Bergama, TR|39.121|27.181
Belen, TR|36.489|36.195
Belek, TR|36.863|31.065
Bayindir, TR|38.217|27.647
Batman, TR|37.887|41.132
Baskil, TR|38.569|38.816
Banaz, TR|38.737|29.752
Balikesir, TR|39.649|27.886
Balatcik, TR|38.516|27.048
Ayvalik, TR|39.319|26.693
Aydin, TR|37.845|27.840
Askale, TR|39.921|40.695
Antalya, TR|36.908|30.696
Antakya, TR|36.207|36.157
Ankara, TR|39.920|32.854
Anamur, TR|36.075|32.837
Aliaga, TR|38.800|26.972
Alasehir, TR|38.351|28.517
Alanya, TR|36.544|32.000
Aksehir, TR|38.358|31.416
Aksaray, TR|38.373|34.025
Akhisar, TR|38.919|27.840
Akdagmadeni, TR|39.660|35.884
Akcapinar, TR|38.947|38.942
Akcakale, TR|36.711|38.947
Ahlat, TR|38.749|42.480
Afyonkarahisar, TR|38.757|30.543
Afsin, TR|38.248|36.914
Adiyaman, TR|37.764|38.276
Adilcevaz, TR|38.799|42.732
Adana, TR|36.986|35.325
Narlica, TR|36.235|36.215
Denizciler, TR|36.641|36.214
Batikent, TR|39.968|32.731
Dalaman, TR|36.766|28.803
Zonguldak, TR|41.451|31.793
Zile, TR|40.303|35.886
Zeytinburnu, TR|40.994|28.904
Zekeriya, TR|41.198|29.030
Yomra, TR|40.953|39.855
Yenisehir, TR|40.264|29.653
Koerfez, TR|40.767|29.783
Yalova, TR|40.655|29.277
Yakuplu, TR|40.989|28.676
Vezirkoeprue, TR|41.144|35.455
Vakfikebir, TR|41.046|39.276
Uzunkoeprue, TR|41.269|26.686
UEskuedar, TR|41.023|29.014
UEnye, TR|41.140|37.289
UEmraniye, TR|41.016|29.125
Turhal, TR|40.388|36.081
Trabzon, TR|41.005|39.727
Tosya, TR|41.015|34.040
Tokat, TR|40.314|36.554
Tirebolu, TR|41.007|38.814
Terme, TR|41.209|36.974
Tepecik, TR|41.029|28.550
Tekkekoey, TR|41.212|36.460
Tekirdag, TR|40.978|27.511
Tasova, TR|40.760|36.322
Taskoeprue, TR|41.510|34.214
Tarabya, TR|41.134|29.046
Susehri, TR|40.160|38.084
Suermene, TR|40.906|40.128
Sungurlu, TR|40.167|34.374
Suluova, TR|40.831|35.648
Sisli, TR|41.060|28.987
Sinop, TR|42.027|35.163
Silivri, TR|41.074|28.246
Sile, TR|41.179|29.611
Sebin Karahisar, TR|40.288|38.424
Sarikamis, TR|40.328|42.587
Sapanca, TR|40.691|30.267
Samsun, TR|41.280|36.336
Safranbolu, TR|41.251|32.694
Rize, TR|41.021|40.522
Osmaneli, TR|40.357|30.014
Osmancik, TR|40.978|34.805
Orhangazi, TR|40.489|29.309
Ordu, TR|40.978|37.890
Oltu, TR|40.539|41.987
Of, TR|40.941|40.259
Niksar, TR|40.592|36.952
Nallihan, TR|40.186|31.352
Mustafakemalpasa, TR|40.038|28.409
Mudanya, TR|40.375|28.884
Mimarsinan, TR|41.015|28.561
Merzifon, TR|40.873|35.463
Maltepe, TR|40.936|29.155
Malkara, TR|40.891|26.902
Lueleburgaz, TR|41.402|27.357
Kumru, TR|40.874|37.264
Kuecuekcekmece, TR|40.991|28.771
Korgan, TR|40.825|37.347
Kocaali, TR|41.053|30.853
Kizilcahamam, TR|40.470|32.651
Kirklareli, TR|41.735|27.225
Kestel, TR|40.198|29.212
Kesan, TR|40.855|26.633
Kelkit, TR|40.127|39.434
Kazan, TR|40.232|32.684
Kaynasli, TR|40.769|31.322
Kavakli, TR|41.093|28.332
Kastamonu, TR|41.378|33.775
Kars, TR|40.598|43.085
Karasu, TR|41.104|30.697
Karasu Mahallesi, TR|41.071|30.785
Karamuersel, TR|40.691|29.616
Karacabey, TR|40.213|28.361
Karabuek, TR|41.205|32.628
Kandira, TR|41.070|30.153
Kagizman, TR|40.157|43.134
Iznik, TR|40.429|29.721
Izmit, TR|40.765|29.929
Istinye, TR|41.110|29.051
Istanbul, TR|41.014|28.950
Iskilip, TR|40.735|34.474
Inegol, TR|40.078|29.513
Horasan, TR|40.039|42.164
Hopa, TR|41.390|41.420
Hendek, TR|40.799|30.748
Hayrabolu, TR|41.213|27.107
Havza, TR|40.971|35.662
Guersu, TR|40.219|29.195
Guerpinar, TR|40.992|28.603
Guergentepe, TR|40.790|37.601
Guemueshane, TR|40.460|39.472
Goeruekle, TR|40.231|28.840
Goerele, TR|41.031|39.003
Goenen, TR|40.105|27.654
Goelcuek, TR|40.715|29.818
Giresun, TR|40.917|38.387
Geyve, TR|40.508|30.293
Gerede, TR|40.801|32.197
Gemlik, TR|40.431|29.160
Gelibolu, TR|40.408|26.672
Gebze, TR|40.803|29.431
Ferizli, TR|40.941|30.486
Fatsa, TR|41.029|37.500
Fatih, TR|41.023|28.941
Esenyurt, TR|41.027|28.677
Esenler, TR|41.044|28.876
Eregli, TR|41.283|31.418
Erdek, TR|40.400|27.793
Erbaa, TR|40.669|36.568
Eminoenue, TR|41.018|28.971
Edirne, TR|41.677|26.556
Duezce, TR|40.839|31.164
Devrek, TR|41.219|31.956
Derince, TR|40.757|29.815
Cubuk, TR|40.239|33.032
Corum, TR|40.549|34.953
Corlu, TR|41.161|27.801
Cerkezkoey, TR|41.286|27.999
Cerkes, TR|40.812|32.894
Cayeli, TR|41.086|40.722
Caycuma, TR|41.426|32.076
Catalca, TR|41.141|28.460
Carsamba, TR|41.199|36.722
Cankiri, TR|40.600|33.615
Canakkale, TR|40.156|26.413
Can, TR|40.033|27.052
Bursa, TR|40.196|29.060
Bulancak, TR|40.938|38.231
Boyabat, TR|41.469|34.767
Bolu, TR|40.736|31.606
Bilecik, TR|40.142|29.979
Biga, TR|40.228|27.242
Beypazari, TR|40.167|31.921
Besikduezue, TR|41.052|39.233
Bayburt, TR|40.256|40.223
Bartin, TR|41.636|32.337
Bandirma, TR|40.352|27.977
Bagcilar, TR|41.039|28.857
Bafra, TR|41.568|35.903
Babaeski, TR|41.428|27.097
Artvin, TR|41.182|41.822
Arsin, TR|40.953|39.927
Arnavutkoey, TR|41.184|28.740
Arhavi, TR|41.351|41.305
Ardesen, TR|41.191|40.979
Ardahan, TR|41.109|42.702
Arakli, TR|40.939|40.058
Amasya, TR|40.653|35.833
Alapli, TR|41.181|31.385
Alaca, TR|40.168|34.843
Akyurt, TR|40.135|33.086
Akyazi, TR|40.685|30.622
Akhisar, TR|40.118|29.466
Akcakoca, TR|41.089|31.124
Akcaabat, TR|41.021|39.571
Adapazari, TR|40.781|30.403
Espiye, TR|40.947|38.703
Merter Keresteciler, TR|41.013|28.886
Guengoeren Merter, TR|41.007|28.888
Turgutreis, TR|37.017|27.267
Sarigerme, TR|36.715|28.704
Atasehir, TR|40.983|29.117
Basaksehir, TR|41.106|28.791
Beylikduezue, TR|40.982|28.640
Bueyuekcekmece, TR|41.021|28.585
Cankaya, TR|39.918|32.863
Yakinca, TR|38.305|38.238
Bahcelievler, TR|41.002|28.860
Sultangazi, TR|41.107|28.868
Sultanbeyli, TR|40.961|29.271
Sancaktepe, TR|41.002|29.232
Karabaglar, TR|38.382|27.132
Incirli, TR|39.984|32.843
Oba, TR|36.550|32.060
Cikcilli, TR|36.554|32.030
Muratpasa, TR|36.892|30.765
Cubuklu, TR|41.104|29.083
Atasehir, TR|38.489|27.061
Bostanli, TR|38.459|27.097
Semikler, TR|38.475|27.096
Evka-UEc, TR|38.471|27.251
Niluefer, TR|40.214|28.916
Merkezefendi, TR|37.805|29.042
Altinsehir, TR|37.741|38.229
Baglar Mahallesi, TR|39.928|44.041
Sahindere, TR|40.142|43.119
Yenisehir, TR|40.583|43.095
Sehitler, TR|40.593|43.087
Tunapuna, TT|10.652|-61.389
Scarborough, TT|11.182|-60.735
Sangre Grande, TT|10.587|-61.130
San Fernando, TT|10.280|-61.468
Rio Claro, TT|10.306|-61.176
Port of Spain, TT|10.667|-61.519
Point Fortin, TT|10.174|-61.684
Paradise, TT|10.653|-61.363
Mon Repos, TT|10.280|-61.446
Marabella, TT|10.306|-61.447
Laventille, TT|10.649|-61.499
Diego Martin, TT|10.721|-61.566
Chaguanas, TT|10.517|-61.417
Arima, TT|10.637|-61.282
Funafuti, TV|-8.524|179.194
Douliu, TW|23.709|120.543
Yongkang, TW|23.024|120.256
Yongjing, TW|23.921|120.546
Yujing, TW|23.125|120.461
Yuanlin, TW|23.957|120.576
Yingge, TW|24.956|121.351
Wufeng, TW|24.064|120.698
Citong, TW|23.758|120.500
Donggang, TW|22.465|120.449
Caotun, TW|23.977|120.688
Toufen, TW|24.688|120.909
Tianwei, TW|23.893|120.524
Tianzhong, TW|23.858|120.586
Danshui, TW|25.172|121.443
Taitung, TW|22.760|121.145
Taipei, TW|25.053|121.526
Taibao, TW|23.459|120.332
Xinying, TW|23.307|120.311
Tainan, TW|22.991|120.213
Taichung, TW|24.147|120.684
Daxi, TW|24.884|121.290
Shulin, TW|24.991|121.422
Shetou, TW|23.898|120.588
Banqiao, TW|25.014|121.467
Sanxia, TW|24.934|121.371
Sanzhi, TW|25.258|121.502
Buzi, TW|24.210|120.573
Budai, TW|23.378|120.162
Puli, TW|23.966|120.970
Pitou, TW|23.895|120.479
Beidou, TW|23.873|120.524
Beigang, TW|23.570|120.302
Bade, TW|24.930|121.284
Neili, TW|24.973|121.261
Neihu, TW|25.081|121.588
Nantou, TW|23.916|120.664
Miaoli, TW|24.564|120.824
Magong, TW|23.565|119.586
Lugu, TW|23.746|120.752
Linnei, TW|23.762|120.619
Fengshan, TW|22.627|120.361
Kaohsiung, TW|22.616|120.313
Yilan, TW|24.757|121.753
Hualien City, TW|23.977|121.604
Xiulin, TW|24.120|121.626
Xingang, TW|23.557|120.346
Hsinchu, TW|24.804|120.969
Jinhu, TW|24.439|118.421
Xiluo, TW|23.799|120.463
Xihu, TW|23.957|120.479
Xizhi, TW|25.066|121.660
Hengchun, TW|22.004|120.744
Xizhou, TW|24.277|120.689
Erlun, TW|23.770|120.413
Erlin, TW|23.901|120.369
Zhudong, TW|24.732|121.091
Zhushan, TW|23.756|120.682
Zhubei, TW|24.838|121.008
Jincheng, TW|24.434|118.317
Keelung, TW|25.131|121.741
Chiayi City, TW|23.479|120.449
Chaozhou, TW|22.550|120.541
Chang-hua, TW|24.073|120.563
Changhua, TW|24.069|120.551
Taoyuan, TW|24.994|121.297
Zhongxing New Village, TW|23.959|120.685
New Taipei City, TW|25.062|121.457
Zanzibar, TZ|-6.164|39.198
Wete, TZ|-5.056|39.729
Vwawa, TZ|-9.108|32.935
Vikindu, TZ|-7.007|39.298
Uyovu, TZ|-3.283|31.526
Uvinza, TZ|-5.104|30.391
Utengule, TZ|-8.900|33.333
Ushirombo, TZ|-3.492|31.964
Usevia, TZ|-7.100|31.233
Usangi, TZ|-3.700|37.667
Usagara, TZ|-2.683|33.000
Usa River, TZ|-3.367|36.850
Urunda, TZ|-8.650|34.300
Urambo, TZ|-5.067|32.050
Tunduma, TZ|-9.300|32.767
Tumbi, TZ|-5.067|32.733
Tukuyu, TZ|-9.250|33.650
Tinde, TZ|-3.883|33.200
Tarime, TZ|-1.350|34.367
Tanga, TZ|-5.069|39.099
Tabora, TZ|-5.016|32.827
Sumbawanga, TZ|-7.967|31.617
Songwa, TZ|-3.517|33.517
Somanda, TZ|-3.367|33.950
Sokoni, TZ|-6.433|39.550
Sirari, TZ|-1.254|34.476
Singida, TZ|-4.816|34.744
Sikonge, TZ|-5.633|32.767
Shirati, TZ|-1.133|33.983
Shinyanga, TZ|-3.664|33.421
Shelui, TZ|-4.367|34.200
Shanwa, TZ|-3.167|33.767
Sepuka, TZ|-4.750|34.533
Sengerema, TZ|-2.667|32.650
Same, TZ|-4.067|37.733
Rulenge, TZ|-2.717|30.633
Rujewa, TZ|-8.700|34.383
Puma, TZ|-5.000|34.733
Old Shinyanga, TZ|-3.550|33.400
Nzega, TZ|-4.217|33.183
Nyamuswa, TZ|-1.900|34.017
Nyalikungu, TZ|-3.183|33.783
Nyakabindi, TZ|-2.633|33.983
Nsunga, TZ|-1.144|31.395
Nshamba, TZ|-1.798|31.551
Njombe, TZ|-9.349|34.772
Nguruka, TZ|-5.109|31.042
Ngudu, TZ|-2.967|33.333
Ngerengere, TZ|-6.750|38.117
Ngara, TZ|-2.512|30.656
Nansio, TZ|-2.133|33.050
Nangwa, TZ|-4.467|35.450
Namanyere, TZ|-7.517|31.050
Mwanza, TZ|-2.517|32.900
Mwadui, TZ|-3.550|33.600
Mvomero, TZ|-6.250|38.667
Musoma, TZ|-1.500|33.800
Muriti, TZ|-1.983|32.917
Mungaa, TZ|-4.967|34.883
Muheza, TZ|-5.167|38.783
Mugumu, TZ|-1.850|34.700
Mtwango, TZ|-9.017|34.800
Mto wa Mbu, TZ|-3.350|35.850
Mtinko, TZ|-4.550|34.850
Msowero, TZ|-6.533|37.200
Mpwapwa, TZ|-6.350|36.483
Mpanda, TZ|-6.344|31.070
Moshi, TZ|-3.350|37.333
Morogoro, TZ|-6.821|37.661
Mlowo, TZ|-9.000|32.983
Mlimba, TZ|-8.800|35.817
Mlangali, TZ|-9.783|34.517
Mlandizi, TZ|-6.700|38.733
Mlalo, TZ|-4.933|38.933
Mkuranga, TZ|-7.118|39.208
Mkoani, TZ|-5.367|39.650
Mwandiga, TZ|-4.830|29.658
Misungwi, TZ|-2.850|33.083
Mikumi, TZ|-7.404|36.983
Mhango, TZ|-3.283|32.850
Mgandu, TZ|-5.950|34.133
Mbulu, TZ|-3.850|35.533
Mbuguni, TZ|-3.567|36.950
Mbeya, TZ|-8.900|33.450
Mazinde, TZ|-4.800|38.217
Matundasi, TZ|-8.450|33.283
Matui, TZ|-4.800|38.250
Matai, TZ|-8.300|31.517
Maswa, TZ|-2.683|33.983
Masumbwe, TZ|-3.633|32.183
Maramba, TZ|-5.050|38.617
Mapinga, TZ|-6.600|39.067
Manyoni, TZ|-5.750|34.833
Mambali, TZ|-4.550|32.683
Malinyi, TZ|-8.933|36.133
Malampaka, TZ|-3.133|33.533
Makuyuni, TZ|-4.733|38.100
Makuyuni, TZ|-3.550|36.100
Makumbako, TZ|-8.850|34.833
Makongolosi, TZ|-8.400|33.150
Mahanje, TZ|-9.933|35.333
Kihangara, TZ|-2.583|33.350
Magugu, TZ|-4.017|35.767
Magomeni, TZ|-6.800|39.250
Magole, TZ|-6.377|37.374
Mafinga, TZ|-7.250|35.067
Mabama, TZ|-5.133|32.533
Lushoto, TZ|-4.783|38.283
Lugoba, TZ|-6.450|38.333
Lubata, TZ|-6.100|37.450
Liwale, TZ|-9.767|37.933
Lembeni, TZ|-3.783|37.617
Lalago, TZ|-3.450|33.950
Laela, TZ|-8.567|32.050
Kyela, TZ|-9.583|33.850
Korogwe, TZ|-5.150|38.483
Kondoa, TZ|-4.900|35.783
Kiwira, TZ|-9.173|33.542
Kishapu, TZ|-3.617|33.867
Kisesa, TZ|-2.550|33.033
Kisesa, TZ|-3.083|34.150
Kirando, TZ|-7.417|30.600
Kiomboi, TZ|-4.267|34.367
Kingori, TZ|-3.283|36.983
Kilwa Masoko, TZ|-8.925|39.513
Kilosa, TZ|-6.833|36.983
Kilindoni, TZ|-7.914|39.662
Kigoma, TZ|-4.877|29.627
Kidodi, TZ|-7.604|37.004
Kidatu, TZ|-7.699|36.957
Kibondo, TZ|-3.586|30.720
Kibiti, TZ|-7.722|38.937
Kibara, TZ|-2.150|33.450
Kibakwe, TZ|-6.717|36.367
Kibaha, TZ|-6.767|38.917
Katumba, TZ|-9.233|33.617
Katoro, TZ|-3.000|31.933
Katesh, TZ|-4.525|35.385
Katerero, TZ|-1.400|31.733
Kasulu, TZ|-4.577|30.102
Kassambya, TZ|-1.200|31.450
Kasamwa, TZ|-2.850|32.433
Kiratu, TZ|-3.333|35.667
Kamachumu, TZ|-1.619|31.620
Kakonko, TZ|-3.283|30.964
Kahama, TZ|-3.833|32.600
Kabanga, TZ|-2.639|30.468
Izazi, TZ|-7.200|35.733
Itigi, TZ|-5.700|34.483
Isaka, TZ|-3.900|32.933
Iringa, TZ|-7.767|35.700
Ipinda, TZ|-9.483|33.900
Ilula, TZ|-7.677|36.037
Ilongero, TZ|-4.667|34.867
Ilembula, TZ|-8.900|34.583
Ikwiriri, TZ|-7.956|38.972
Ikungi, TZ|-5.133|34.767
Igurusi, TZ|-8.850|33.850
Igunga, TZ|-4.283|33.883
Igugunu, TZ|-4.567|34.633
Ifakara, TZ|-8.133|36.683
Hedaru, TZ|-4.500|37.900
Handeni, TZ|-5.433|38.017
Geita, TZ|-2.873|32.233
Geiro, TZ|-6.150|36.867
Galappo, TZ|-4.267|35.850
Dongobesh, TZ|-4.067|35.383
Dodoma, TZ|-6.172|35.739
Dar es Salaam, TZ|-6.823|39.270
Dareda, TZ|-4.217|35.550
Chimala, TZ|-8.856|34.024
Chato, TZ|-2.638|31.767
Chanika, TZ|-5.417|38.017
Chalinze, TZ|-6.638|38.354
Chala, TZ|-7.583|31.267
Chake Chake, TZ|-5.246|39.767
Butiama, TZ|-1.767|33.967
Buseresere, TZ|-3.049|31.885
Bungu, TZ|-7.634|39.058
Bunda, TZ|-2.022|33.871
Bukoba, TZ|-1.332|31.812
Bugarama, TZ|-2.871|30.528
Boma la Ngombe, TZ|-3.333|37.150
Biharamulo, TZ|-2.632|31.309
Basotu, TZ|-4.367|35.083
Bashanet, TZ|-4.233|35.417
Bariadi, TZ|-2.800|33.983
Bagamoyo, TZ|-6.442|38.904
Babati, TZ|-4.217|35.750
Arusha, TZ|-3.367|36.683
Kakunyu, TZ|-1.006|30.941
Tunduru, TZ|-11.067|37.350
Tingi, TZ|-11.300|35.033
Tandahimba, TZ|-10.750|39.633
Songea, TZ|-10.683|35.650
Ruangwa, TZ|-10.067|38.933
Nyangao, TZ|-10.333|39.283
Newala Kisimani, TZ|-10.950|39.283
Newala, TZ|-10.933|39.300
Nanyamba, TZ|-10.683|39.833
Nangomba, TZ|-10.900|38.500
Nanganga, TZ|-10.383|39.150
Nachingwea, TZ|-10.373|38.763
Mtwara, TZ|-10.267|40.183
Mbinga, TZ|-10.933|35.017
Matiri, TZ|-10.750|34.900
Masasi, TZ|-10.717|38.800
Maposeni, TZ|-10.583|35.400
Lukuledi, TZ|-10.567|38.800
Luchingu, TZ|-10.900|39.333
Lindi, TZ|-9.997|39.716
Kitama, TZ|-10.717|39.733
Kigonsera, TZ|-10.800|35.050
Merelani, TZ|-3.562|36.979
Nungwi, TZ|-5.727|39.299
Magu, TZ|-2.591|33.446
Mhalamba, TZ|-2.581|32.010
Mutukula, TZ|-1.001|31.415
Tarakea, TZ|-3.001|37.564
Diobahika, TZ|-3.339|31.523
Dumila, TZ|-6.384|37.343
Kibaigwa, TZ|-6.081|36.647
Madizini, TZ|-6.141|37.636
Mafinga, TZ|-8.300|35.294
Matongo, TZ|-1.468|34.523
Mwandege, TZ|-6.976|39.289
Mwanhuzi, TZ|-3.527|34.315
Ruaha, TZ|-7.657|36.983
Lebedyn, UA|50.582|34.483
Druzhkivka, UA|48.620|37.525
Zvenyhorodka, UA|49.078|30.961
Zuhres, UA|48.014|38.266
Zolotonosha, UA|49.669|32.036
Zolochiv, UA|49.807|24.904
Znamyanka, UA|48.721|32.658
Zhytomyr, UA|50.262|28.679
Zhmerynka, UA|49.035|28.114
Zhovti Vody, UA|48.345|33.497
Zdolbuniv, UA|50.522|26.248
Zaporizhzhya, UA|47.852|35.117
Pivdenne, UA|46.625|31.102
Katerynivka, UA|48.556|39.183
Yevpatoriya, UA|45.201|33.367
Yenakiyeve, UA|48.239|38.204
Yasynuvata, UA|48.127|37.859
Yalta, UA|44.502|34.166
Yahotyn, UA|50.275|31.763
Vyshhorod, UA|50.583|30.486
Vynohradiv, UA|48.141|23.036
Vyhurivshchyna-Troyeshchyna, UA|50.511|30.603
Voznesensk, UA|47.562|31.336
Volochysk, UA|49.536|26.207
Volnovakha, UA|47.601|37.494
Vilnohirsk, UA|48.484|34.017
Vovchansk, UA|50.291|36.941
Volodymyr-Volynskyi, UA|50.850|24.321
Vyshneve, UA|50.388|30.368
Vinnytsya, UA|49.232|28.469
Vynnyky, UA|49.817|24.144
Vilnyansk, UA|47.948|35.440
Verkhnodniprovsk, UA|48.656|34.326
Bahacheve, UA|49.012|31.047
Vasylkiv, UA|50.180|30.312
Uzhhorod, UA|48.624|22.295
Uman, UA|48.750|30.219
Tulchyn, UA|48.674|28.868
Oleshky, UA|46.626|32.724
Truskavets, UA|49.281|23.504
Trostyanets, UA|50.485|34.966
Chystyakove, UA|48.039|38.597
Tokmak, UA|47.256|35.708
Terny, UA|48.145|33.558
Ternivka, UA|48.527|36.071
Ternopil, UA|49.554|25.591
Telychka, UA|50.400|30.567
Siverskodonetsk, UA|48.944|38.488
Svitlovodsk, UA|49.063|33.246
Dovzhansk, UA|48.076|39.647
Svatove, UA|49.409|38.155
Svalyava, UA|48.547|22.987
Sumy, UA|50.917|34.799
Sukhodilsk, UA|48.351|39.726
Sudak, UA|44.849|34.975
Stryi, UA|49.261|23.848
Stebnyk, UA|49.301|23.552
Starokostyantyniv, UA|49.755|27.212
Starobilsk, UA|49.279|38.907
Stara Darnytsya, UA|50.433|30.633
Kadiyivka, UA|48.568|38.644
Sotsmisto, UA|48.737|37.591
Sokal, UA|50.475|24.281
Snizhne, UA|48.023|38.762
Smila, UA|49.233|31.884
Slovyansk, UA|48.850|37.597
Slavuta, UA|50.296|26.866
Skvyra, UA|49.734|29.664
Skadovsk, UA|46.113|32.910
Synelnykove, UA|48.324|35.526
Simferopol, UA|44.957|34.111
Sykhiv, UA|49.794|24.063
Shpola, UA|49.013|31.393
Shostka, UA|51.864|33.473
Shepetivka, UA|50.181|27.065
Shakhtarsk, UA|48.057|38.438
Sevastopol, UA|44.608|33.521
Selydove, UA|48.147|37.302
Sarny, UA|51.339|26.607
Sambir, UA|49.516|23.201
Saky, UA|45.134|33.600
Rubizhne, UA|49.008|38.380
Rozdilna, UA|46.855|30.071
Kurakhove, UA|47.985|37.281
Rovenky, UA|48.083|39.377
Romny, UA|50.740|33.495
Rivne, UA|50.620|26.237
Rakhiv, UA|48.055|24.203
Radomyshl, UA|50.496|29.230
Pyatykhatky, UA|48.408|33.709
Pryluky, UA|50.595|32.384
Popasna, UA|48.632|38.371
Poltava, UA|49.589|34.554
Polonne, UA|50.119|27.509
Polohy, UA|47.479|36.255
Podil, UA|50.469|30.516
Pidhorodnye, UA|48.574|35.097
Voznesenskyi, UA|47.932|37.630
Pisochyn, UA|49.952|36.103
Zlatopil, UA|49.376|36.218
Sokolohirsk, UA|48.628|38.524
Pervomaysk, UA|48.045|30.848
Shakhtarske, UA|48.348|36.396
Pereiaslav, UA|50.067|31.450
Perevalsk, UA|48.439|38.828
Pelahiivka, UA|48.108|38.613
Pavlohrad, UA|48.532|35.869
Ovruch, UA|51.327|28.802
Pokrov, UA|47.654|34.115
Oleksandriya, UA|48.675|33.118
Ihren, UA|48.476|35.158
Odesa, UA|46.486|30.744
Obukhiv, UA|50.116|30.633
Novyi Rozdil, UA|49.471|24.134
Novovolynsk, UA|50.729|24.160
Novoukrayinka, UA|48.317|31.524
Samar, UA|48.629|35.259
Zvyahel, UA|50.591|27.609
Novhorod-Siverskyi, UA|52.007|33.263
Nova Kakhovka, UA|46.760|33.356
Nova Darnytsya, UA|50.424|30.656
Nizhyn, UA|51.048|31.888
Nyzhnodniprovsk, UA|48.475|35.117
Nikopol, UA|47.568|34.391
Netishyn, UA|50.329|26.649
Nadvirna, UA|48.637|24.571
Mykolayiv, UA|46.976|31.993
Mukachevo, UA|48.442|22.718
Mostyska, UA|49.795|23.151
Otamanivka, UA|48.346|39.652
Mohyliv-Podilskyy, UA|48.443|27.800
Myrhorod, UA|49.965|33.609
Merefa, UA|49.821|36.057
Melitopol, UA|46.847|35.382
Masany, UA|51.533|31.231
Mariupol, UA|47.095|37.541
Marhanets, UA|47.631|34.624
Malyn, UA|50.768|29.242
Makiyivka, UA|48.048|37.926
Liubotyn, UA|49.947|35.929
Lviv, UA|49.838|24.023
Lutuhyne, UA|48.404|39.213
Lutsk, UA|50.758|25.350
Luhansk, UA|48.568|39.306
Lubny, UA|50.014|33.000
Lozova, UA|48.891|36.314
Lysychansk, UA|48.912|38.421
Ladyzhyn, UA|48.684|29.236
Kyiv, UA|50.455|30.524
Kupyansk, UA|49.710|37.616
Kryvyy Rih, UA|47.906|33.394
Kryukiv, UA|49.029|33.438
Krolevets, UA|51.552|33.380
Kreminna, UA|49.048|38.216
Kremenets, UA|50.099|25.728
Kremenchuk, UA|49.063|33.405
Khrustalnyi, UA|48.142|38.924
Lyman, UA|48.990|37.808
Yany Kapu, UA|45.955|33.793
Berestyn, UA|49.378|35.445
Sorokyne, UA|48.293|39.733
Pokrovsk, UA|48.280|37.177
Krasyliv, UA|49.654|26.972
Kramatorsk, UA|48.731|37.568
Kivsharivka, UA|49.630|37.678
Kovel, UA|51.215|24.701
Kotsyubynske, UA|50.488|30.330
Podilsk, UA|47.750|29.531
Kostopil, UA|50.877|26.448
Korsun-Shevchenkivskyi, UA|49.418|31.252
Korostyshiv, UA|50.317|29.058
Korosten, UA|50.951|28.639
Korabelna Storona, UA|44.609|33.543
Kostyantynivka, UA|48.527|37.706
Konotop, UA|51.233|33.200
Slobozhanske, UA|49.591|36.522
Kolomyia, UA|48.525|25.037
Khrestivka, UA|48.150|38.359
Holubivka, UA|48.638|38.643
Kropyvnytskyi, UA|48.508|32.266
Kiliya, UA|45.444|29.264
Trudivskyi, UA|47.947|37.558
Khust, UA|48.172|23.298
Khmelnytskyi, UA|49.418|26.979
Khmilnyk, UA|49.558|27.957
Kherson, UA|46.637|32.615
Khartsyzk, UA|48.043|38.140
Kharkiv, UA|49.982|36.255
Khanzhonkove, UA|48.094|38.076
Kerch, UA|45.357|36.475
Kozyatyn, UA|49.716|28.839
Kaniv, UA|49.752|31.470
Kamyanets-Podilskyi, UA|48.679|26.585
Kalush, UA|49.024|24.372
Kalynivka, UA|49.461|28.515
Kakhovka, UA|46.816|33.479
Izyum, UA|49.207|37.277
Iziaslav, UA|50.120|26.825
Izmayil, UA|45.351|28.838
Ivano-Frankivsk, UA|48.923|24.712
Irpin, UA|50.522|30.240
Inhulets, UA|47.730|33.252
Ilovaysk, UA|47.925|38.202
Chornomorsk, UA|46.299|30.655
Horodok, UA|49.172|26.564
Horlivka, UA|48.300|38.017
Hlukhiv, UA|51.680|33.917
Hostomel, UA|50.568|30.265
Horodok, UA|49.785|23.648
Henichesk, UA|46.168|34.809
Haysyn, UA|48.813|29.379
Hadyach, UA|50.369|33.997
Feodosiya, UA|45.032|35.382
Fastiv, UA|50.078|29.920
Enerhodar, UA|47.490|34.662
Dzhankoy, UA|45.713|34.393
Toretsk, UA|48.395|37.848
Dunayivtsi, UA|48.887|26.848
Dubno, UA|50.408|25.762
Drohobych, UA|49.352|23.511
Donetsk, UA|48.023|37.802
Dolyna, UA|48.972|23.966
Dolynska, UA|48.117|32.777
Dokuchayevsk, UA|47.752|37.678
Dobropillya, UA|48.467|37.086
Dnipro, UA|48.467|35.041
Kamyanske, UA|48.517|34.606
Dniprorudne, UA|47.390|35.001
Myrnohrad, UA|48.310|37.265
Derhachi, UA|50.108|36.121
Debaltseve, UA|48.336|38.403
Chuhuyiv, UA|49.835|36.687
Chortkiv, UA|49.017|25.798
Voznesenivka, UA|48.078|39.787
Sheptytskyi, UA|50.394|24.239
Chernivtsi, UA|48.290|25.932
Chernihiv, UA|51.505|31.287
Cherkasy, UA|49.445|32.057
Bucha, UA|50.547|30.209
Bryanka, UA|48.511|38.672
Brovary, UA|50.511|30.791
Brody, UA|50.089|25.146
Boyarka, UA|50.319|30.297
Bortnychi, UA|50.385|30.695
Boryspil, UA|50.351|30.953
Boryslav, UA|49.290|23.429
Bolhrad, UA|45.678|28.618
Bohuslav, UA|49.546|30.874
Bohuniya, UA|50.277|28.610
Bohodukhiv, UA|50.161|35.524
Bilhorod-Dnistrovskyi, UA|46.195|30.348
Bila Tserkva, UA|49.799|30.116
Berezhany, UA|49.446|24.937
Berezan, UA|50.311|31.468
Berehove, UA|48.205|22.645
Berdychiv, UA|49.894|28.582
Berdyansk, UA|46.756|36.788
Bilopillia, UA|51.147|34.311
Bilohirsk, UA|45.057|34.604
Bilohorodka, UA|50.390|30.227
Bilychi, UA|50.465|30.347
Bar, UA|49.074|27.674
Balta, UA|47.936|29.622
Balakliya, UA|49.456|36.844
Balaklava, UA|44.511|33.599
Bakhmach, UA|51.181|32.835
Bakhchysaray, UA|44.755|33.858
Avdiyivka, UA|48.140|37.750
Bakhmut, UA|48.594|37.999
Arshyntseve, UA|45.301|36.427
Armyansk, UA|46.109|33.692
Apostolove, UA|47.660|33.720
Antratsyt, UA|48.116|39.089
Amvrosiyivka, UA|47.791|38.479
Alushta, UA|44.677|34.410
Alchevsk, UA|48.469|38.797
Okhtyrka, UA|50.309|34.895
Horishni Plavni, UA|49.008|33.629
Saltivka, UA|50.022|36.349
Zhuravlivka, UA|50.013|36.272
Pivnichna Saltivka, UA|50.045|36.359
Slavutych, UA|51.523|30.718
Pivdennoukrainsk, UA|47.829|31.175
Varash, UA|51.340|25.855
Svyatopetrivske, UA|50.382|30.323
Novoyavorivsk, UA|49.930|23.574
Obolon, UA|50.513|30.506
Cheremushky, UA|46.433|30.712
Molodizhne, UA|49.150|33.431
Livyi Bereh, UA|48.594|34.560
Demiyivka, UA|50.402|30.516
Borshchahivka, UA|50.432|30.390
Reni, UA|45.454|28.277
Avtozavodskyi, UA|49.098|33.432
Oleksiyivka, UA|50.045|36.193
Knyahynyn, UA|48.936|24.713
Sofiivska Borschahivka, UA|50.409|30.359
Darnytsya Car Repair Plant Microdistrict, UA|50.450|30.676
Holosiyiv, UA|50.344|30.552
Pechersk, UA|50.444|30.523
Svyatoshyn, UA|50.463|30.346
Rakivka, UA|49.024|33.464
Nahirna Chastyna, UA|49.089|33.430
Dniprovskyi, UA|50.454|30.601
Desna, UA|50.522|30.682
Solomyanka, UA|50.428|30.452
Shevchenkivskyi, UA|50.464|30.466
Fortechnyi, UA|48.499|32.254
Podilskyi, UA|48.504|32.280
Novyi Lviv, UA|49.815|24.032
Bohodukhivskyi, UA|47.967|37.863
Yuzivskyi, UA|48.000|37.800
Kalynivskyi, UA|48.007|37.854
Kyivskyi, UA|48.046|37.776
Rutchenkivskyi, UA|47.976|37.697
Bosse, UA|47.955|37.800
Oleksandrivskyi, UA|47.968|37.803
Chumakivskyi, UA|47.957|37.942
Tekstylnyk, UA|47.946|37.698
Podil, UA|49.604|34.594
Kyivskyi, UA|49.609|34.529
Shevchenko, UA|49.565|34.539
Rayon KhTZ, UA|49.943|36.370
Pravyi Bereh, UA|47.115|37.585
Nyvky, UA|50.465|30.406
Pozniaky, UA|50.403|30.624
Darnytsya, UA|50.416|30.695
Berezniaky, UA|50.426|30.602
Voskresenka, UA|50.485|30.603
Stare Misto, UA|50.448|30.526
Lypky, UA|50.443|30.530
Vynohradar, UA|50.514|30.425
Teremky-II, UA|50.381|30.452
Teremky, UA|50.371|30.459
Vidradnyi, UA|50.432|30.422
Oleksandrivska Slobidka, UA|50.418|30.478
Chokolivka, UA|50.424|30.447
Darnytskyi Masyv, UA|50.443|30.628
Livoberezhnyi Masyv, UA|50.455|30.590
Lisovyi Masyv, UA|50.472|30.631
Rayduzhnyi Masyv, UA|50.486|30.586
Vyshhorodskyi Masyv, UA|50.510|30.454
Priorka, UA|50.510|30.458
Mostytskyi Masyv, UA|50.502|30.441
Syrets, UA|50.480|30.445
Kurenivka, UA|50.494|30.471
Tatarka, UA|50.469|30.486
Shulyavka, UA|50.454|30.453
Lukyanivka, UA|50.466|30.476
Mykilska Borshchahivka, UA|50.426|30.374
Kharkivskyi Masyv, UA|50.408|30.660
Pivnichni Osokorky, UA|50.393|30.613
Klov, UA|50.435|30.538
Kybalchych, UA|50.493|30.598
Pivnichno-Brovarskyi Masyv, UA|50.463|30.617
Rusanivka, UA|50.440|30.597
Saperna Slobidka, UA|50.401|30.535
Minskyi Masyv, UA|50.518|30.462
Smolyanskyi, UA|48.014|37.736
Tsentralno-Miskyi, UA|48.062|37.972
Khanzhonkivskyi, UA|48.095|38.042
Hruzkyi, UA|48.065|37.936
Hirnytskyi, UA|48.021|37.969
Berestovskyi, UA|48.044|37.877
Shevchenkivskyi, UA|48.563|39.332
Verhunskyi, UA|48.586|39.372
Vilkhivskyi, UA|48.543|39.282
Kamyanobridskyi, UA|48.587|39.281
Kovpakivskyi, UA|50.925|34.795
Zarichnyi, UA|50.904|34.809
Tsentralno-Miskyi, UA|48.302|38.032
Kindrativskyi, UA|48.303|38.055
Mykytivskyi, UA|48.314|38.004
Tsentralnyi, UA|47.098|37.548
Kalmiuskyi, UA|47.110|37.544
Livoberezhnyi, UA|47.109|37.643
Prymorskyi, UA|47.071|37.500
Desnyanskyi, UA|51.506|31.317
Novozavodskyi, UA|51.489|31.256
Hladkivka, UA|48.036|37.810
Korolyov, UA|50.245|28.700
Rakove, UA|49.396|27.060
Nyzhnya Telychka, UA|50.388|30.575
Sonyachnyi, UA|48.723|37.598
Skhidni Kvartaly, UA|48.566|39.383
Vitryani Hory, UA|50.511|30.437
Karavayevi Dachi, UA|50.430|30.437
Pivdenna Borshchahivka, UA|50.411|30.404
Novobilychi, UA|50.476|30.347
Nova Zabudova, UA|50.428|30.515
Industrialnyi, UA|49.955|36.369
Kyivskyi, UA|50.045|36.289
Nemyshlyanskyi, UA|49.964|36.334
Novobavarskyi, UA|49.951|36.165
Nova Bavariya, UA|49.945|36.150
Osnovyanskyi, UA|49.937|36.241
Saltivskyi, UA|49.999|36.316
Slobidskyi, UA|49.945|36.281
Kholodna Hora, UA|50.004|36.176
Shevchenkivskyi, UA|50.020|36.225
Kosmichnyi, UA|47.784|35.218
Yumbe, UG|3.465|31.247
Wobulenzi, UG|0.728|32.512
Wakiso, UG|0.404|32.459
Tororo, UG|0.693|34.181
Soroti, UG|1.715|33.611
Sironko, UG|1.231|34.248
Rutoma, UG|-0.567|30.383
Rukungiri, UG|-0.841|29.942
Rubanda, UG|-1.188|29.846
Pallisa, UG|1.145|33.709
Pakwach, UG|2.463|31.498
Paidha, UG|2.417|30.986
Nyahuka, UG|0.675|29.993
Nyachera, UG|-0.900|30.417
Ntungamo, UG|-0.883|29.650
Ntungamo, UG|-0.879|30.264
Njeru, UG|0.442|33.179
Ngora, UG|1.431|33.777
Nebbi, UG|2.478|31.089
Namutumba, UG|0.836|33.686
Namayumba, UG|0.529|32.249
Namasuba, UG|0.689|32.421
Nakaloke, UG|1.150|34.150
Mukono, UG|0.353|32.755
Mubende, UG|0.558|31.395
Mpondwe, UG|0.040|29.725
Mpigi, UG|0.225|32.314
Moyo, UG|3.661|31.725
Moroto, UG|2.535|34.667
Mityana, UG|0.417|32.023
Mbarara, UG|-0.605|30.649
Mbale, UG|1.082|34.175
Mayuge, UG|0.460|33.480
Masindi, UG|1.674|31.715
Masaka, UG|-0.334|31.734
Magamaga, UG|0.520|33.347
Mabare, UG|-0.967|30.450
Lyantonde, UG|-0.403|31.157
Lwengo, UG|-0.416|31.408
Lwakyomba, UG|1.117|31.400
Luwero, UG|0.849|32.473
Lukaya, UG|-0.113|31.854
Lugazi, UG|0.368|32.938
Lira, UG|2.250|32.900
Kyenjojo, UG|0.633|30.621
Kyegegwa, UG|0.502|31.041
Kyazanga, UG|-0.383|31.350
Kyarusozi, UG|0.784|30.531
Kyamahungu, UG|-0.451|30.113
Kumi, UG|1.461|33.936
Kotido, UG|2.981|34.133
Koboko, UG|3.414|30.960
Kiziba, UG|0.514|32.351
Kitgum, UG|3.278|32.887
Kisoro, UG|-1.285|29.685
Kireka, UG|0.347|32.649
Kira, UG|0.400|32.633
Kinoni, UG|-0.701|30.494
Kikube, UG|1.356|31.222
Kihihi, UG|-0.750|29.700
Kigumba, UG|1.808|32.005
Kiboga, UG|0.916|31.774
Kazo, UG|-0.074|30.785
Kayunga, UG|0.703|32.889
Katoke, UG|0.758|30.683
Katabi, UG|0.084|32.470
Kasozi, UG|0.020|30.499
Kasese, UG|0.183|30.083
Kasanje, UG|0.153|32.401
Kasangati, UG|0.438|32.602
Kasanda, UG|0.557|31.802
Kasambya, UG|0.433|31.233
Kasaali, UG|-0.617|31.550
Kapchorwa, UG|1.401|34.450
Kanungu, UG|-0.958|29.790
Kamwenge, UG|0.187|30.454
Kamuli, UG|0.947|33.120
Kampala, UG|0.316|32.582
Kalisizo, UG|-0.536|31.621
Kaliro, UG|0.894|33.499
Kakumiro, UG|0.781|31.324
Kakiri, UG|0.420|32.391
Kakira, UG|0.508|33.288
Kajansi, UG|0.215|32.535
Kagadi, UG|0.938|30.809
Kabale, UG|-1.249|29.990
Jinja, UG|0.439|33.203
Iryango, UG|-0.967|30.600
Iganga, UG|0.609|33.469
Ibanda, UG|-0.134|30.496
Hoima, UG|1.433|31.352
Gulu, UG|2.775|32.299
Gombe, UG|0.203|32.088
Fort Portal, UG|0.662|30.275
Entebbe, UG|0.056|32.479
Dokolo, UG|1.898|33.178
Bwizibwera, UG|-0.592|30.629
Buyende, UG|1.152|33.155
Buwenge, UG|0.650|33.171
Butemba, UG|1.159|31.611
Butaleja, UG|0.912|33.951
Busolwe, UG|0.850|33.926
Busia, UG|0.466|34.092
Busesa, UG|0.626|33.600
Busembatia, UG|0.777|33.624
Bundibugyo, UG|0.711|30.065
Bunamwaya, UG|0.253|32.557
Bukuya, UG|0.679|31.820
Bukomero, UG|0.698|32.029
Buikwe, UG|0.338|33.011
Buhimba, UG|1.347|31.308
Buhesi, UG|0.581|30.210
Bugiri, UG|0.571|33.742
Bugembe, UG|0.482|33.241
Budaka, UG|1.004|33.926
Budadiri, UG|1.148|34.326
Bombo, UG|0.574|32.515
Arua, UG|3.020|30.911
Apac, UG|1.976|32.539
Anaka, UG|2.601|31.947
Adjumani, UG|3.378|31.791
Abim, UG|2.702|33.676
Ishaka, UG|-0.543|30.137
Isingiro, UG|-0.869|30.830
Manafwa, UG|0.952|34.270
Opit, UG|2.611|32.476
Buyale, UG|1.934|32.116
Nakivale Refugee Camp, UG|-0.741|30.996
Kisinga, UG|0.077|29.868
Malaba, UG|0.644|34.261
Rwiimi, UG|0.380|30.230
Kyengera, UG|0.295|32.502
Nansana, UG|0.364|32.529
Namavundu, UG|0.364|33.818
Muhorro, UG|0.915|30.751
Butunduzi, UG|0.555|30.855
Kiryandongo Refugee Camp, UG|1.940|32.166
Kyaka II Refugee Camp, UG|0.367|31.108
Kyangwali Refugee Camp, UG|1.188|30.783
Nyamunuka, UG|-0.835|30.092
Rwamwanja Refugee Camp, UG|0.348|30.654
Fort Hunt, VA|38.733|-77.058
Bessemer, AL|33.402|-86.954
Paducah, KY|37.083|-88.600
Birmingham, AL|33.521|-86.802
Cordova, TN|35.156|-89.776
Center Point, AL|33.646|-86.684
Cullman, AL|34.175|-86.844
Daphne, AL|30.604|-87.904
Decatur, AL|34.606|-86.983
Dothan, AL|31.223|-85.390
East Florence, AL|34.810|-87.649
Enterprise, AL|31.315|-85.855
Fairhope, AL|30.523|-87.903
Florence, AL|34.800|-87.677
Foley, AL|30.407|-87.684
Gadsden, AL|34.014|-86.006
Helena, AL|33.296|-86.844
Homewood, AL|33.472|-86.801
Hoover, AL|33.405|-86.811
Hueytown, AL|33.451|-86.997
Huntsville, AL|34.730|-86.586
Madison, AL|34.699|-86.748
Millbrook, AL|32.480|-86.362
Mobile, AL|30.694|-88.043
Montgomery, AL|32.367|-86.300
Mountain Brook, AL|33.501|-86.752
Northport, AL|33.229|-87.577
Opelika, AL|32.645|-85.378
Oxford, AL|33.614|-85.835
Pelham, AL|33.286|-86.810
Phenix City, AL|32.471|-85.001
Prattville, AL|32.464|-86.460
Prichard, AL|30.739|-88.079
Selma, AL|32.407|-87.021
Talladega, AL|33.436|-86.106
Tillmans Corner, AL|30.590|-88.171
Troy, AL|31.809|-85.970
Trussville, AL|33.620|-86.609
Tuscaloosa, AL|33.210|-87.569
Vestavia Hills, AL|33.449|-86.788
Bella Vista, AR|36.481|-94.271
Benton, AR|34.565|-92.587
Bentonville, AR|36.373|-94.209
Bryant, AR|34.596|-92.489
Cabot, AR|34.975|-92.017
Conway, AR|35.089|-92.442
El Dorado, AR|33.208|-92.666
Fayetteville, AR|36.063|-94.157
Fort Smith, AR|35.386|-94.399
Hot Springs, AR|34.504|-93.055
Jacksonville, AR|34.866|-92.110
Jonesboro, AR|35.842|-90.704
Little Rock, AR|34.746|-92.290
Maumelle, AR|34.867|-92.404
North Little Rock, AR|34.770|-92.267
Paragould, AR|36.058|-90.497
Pine Bluff, AR|34.228|-92.003
Rogers, AR|36.332|-94.119
Russellville, AR|35.278|-93.134
Searcy, AR|35.251|-91.736
Siloam Springs, AR|36.188|-94.540
Springdale, AR|36.187|-94.129
Texarkana, AR|33.442|-94.038
Van Buren, AR|35.437|-94.348
West Memphis, AR|35.146|-90.185
Adams Morgan, DC|38.922|-77.042
Brightwood, DC|38.961|-77.027
Capitol Hill, DC|38.889|-77.000
Columbia Heights, DC|38.926|-77.029
Dupont Circle, DC|38.908|-77.044
Foggy Bottom, DC|38.899|-77.053
Mount Pleasant, DC|38.931|-77.041
Park View, DC|38.932|-77.024
Petworth, DC|38.946|-77.025
Pleasant Plains, DC|38.927|-77.023
Shaw, DC|38.912|-77.021
Washington, DC|38.895|-77.036
Bear, DE|39.629|-75.658
Dover, DE|39.158|-75.524
Middletown, DE|39.450|-75.716
Newark, DE|39.684|-75.750
Wilmington, DE|39.746|-75.547
Allapattah, FL|25.815|-80.224
Altamonte Springs, FL|28.661|-81.366
Apopka, FL|28.676|-81.512
Auburndale, FL|28.065|-81.789
Aventura, FL|25.956|-80.139
Bartow, FL|27.896|-81.843
Bayonet Point, FL|28.327|-82.683
Bayshore Gardens, FL|27.425|-82.590
Belle Glade, FL|26.685|-80.668
Bellview, FL|30.462|-87.315
Bloomingdale, FL|27.894|-82.240
Boca Del Mar, FL|26.345|-80.147
Boca Raton, FL|26.359|-80.083
Bonita Springs, FL|26.340|-81.779
Boynton Beach, FL|26.525|-80.066
Bradenton, FL|27.499|-82.575
Brandon, FL|27.938|-82.286
Brent, FL|30.469|-87.236
Brownsville, FL|25.822|-80.241
Buenaventura Lakes, FL|28.336|-81.353
Cantonment, FL|30.609|-87.340
Cape Coral, FL|26.563|-81.950
Carol City, FL|25.941|-80.246
Carrollwood, FL|28.050|-82.493
Carrollwood Village, FL|28.068|-82.521
Casselberry, FL|28.678|-81.328
Citrus Park, FL|28.078|-82.570
Clearwater, FL|27.966|-82.800
Clermont, FL|28.549|-81.773
Cocoa, FL|28.386|-80.742
Coconut Creek, FL|26.252|-80.179
Coconut Grove, FL|25.713|-80.257
Cooper City, FL|26.057|-80.272
Coral Gables, FL|25.721|-80.268
Coral Springs, FL|26.271|-80.271
Coral Terrace, FL|25.746|-80.305
Country Walk, FL|25.634|-80.432
Country Club, FL|25.948|-80.317
Crestview, FL|30.762|-86.571
Cutler, FL|25.615|-80.311
Cutler Ridge, FL|25.581|-80.347
Dania Beach, FL|26.052|-80.144
Davie, FL|26.063|-80.233
Daytona Beach, FL|29.211|-81.023
DeLand, FL|29.028|-81.303
DeBary, FL|28.883|-81.309
Deerfield Beach, FL|26.318|-80.100
Delray Beach, FL|26.461|-80.073
Deltona, FL|28.901|-81.264
Doral, FL|25.820|-80.355
Dunedin, FL|28.020|-82.773
East Lake, FL|28.111|-82.695
East Naples, FL|26.138|-81.766
East Pensacola Heights, FL|30.429|-87.180
Edgewater, FL|28.989|-80.902
Egypt Lake-Leto, FL|28.018|-82.506
Eloise, FL|27.995|-81.738
Ensley, FL|30.519|-87.273
Estero, FL|26.438|-81.807
Eustis, FL|28.853|-81.685
Ferry Pass, FL|30.510|-87.212
Flagami, FL|25.762|-80.316
Fleming Island, FL|30.093|-81.719
Florida Ridge, FL|27.580|-80.387
Fort Lauderdale, FL|26.122|-80.143
Fort Myers, FL|26.622|-81.841
Fort Pierce, FL|27.447|-80.326
Fort Walton Beach, FL|30.421|-86.617
Fountainebleau, FL|25.773|-80.348
Fruit Cove, FL|30.111|-81.642
Gainesville, FL|29.652|-82.325
Glenvar Heights, FL|25.708|-80.326
Golden Gate, FL|26.188|-81.695
Golden Glades, FL|25.912|-80.200
Greenacres City, FL|26.624|-80.125
Haines City, FL|28.114|-81.620
Hallandale Beach, FL|25.981|-80.148
Hialeah, FL|25.858|-80.278
Hialeah Gardens, FL|25.865|-80.325
Holiday, FL|28.188|-82.740
Hollywood, FL|26.011|-80.149
Homestead, FL|25.469|-80.478
Immokalee, FL|26.419|-81.417
Iona, FL|26.520|-81.964
Ives Estates, FL|25.962|-80.177
Jacksonville, FL|30.332|-81.656
Jacksonville Beach, FL|30.295|-81.393
Jasmine Estates, FL|28.293|-82.690
Jupiter, FL|26.934|-80.094
Kendale Lakes, FL|25.708|-80.407
Kendall, FL|25.679|-80.317
Key West, FL|24.555|-81.782
Keystone, FL|28.156|-82.621
Kissimmee, FL|28.305|-81.417
Lake Butler, FL|28.502|-81.541
Lake Magdalene, FL|28.074|-82.472
Lake Mary, FL|28.759|-81.318
Lake Wales, FL|27.901|-81.586
Lake Worth Beach, FL|26.617|-80.072
Lake Worth Corridor, FL|26.616|-80.101
Lakeland, FL|28.039|-81.950
Lakeside, FL|30.130|-81.768
Land O Lakes, FL|28.219|-82.458
Largo, FL|27.910|-82.788
Lauderdale Lakes, FL|26.166|-80.208
Lauderhill, FL|26.140|-80.213
Lealman, FL|27.821|-82.679
Leesburg, FL|28.811|-81.878
Lehigh Acres, FL|26.625|-81.625
Leisure City, FL|25.495|-80.429
Lutz, FL|28.151|-82.461
Lynn Haven, FL|30.245|-85.648
Maitland, FL|28.628|-81.363
Marco Island, FL|25.941|-81.718
Margate, FL|26.245|-80.206
Marion Oaks, FL|29.009|-82.183
Meadow Woods, FL|28.386|-81.366
Melbourne, FL|28.084|-80.608
Merritt Island, FL|28.359|-80.690
Miami, FL|25.774|-80.194
Miami Beach, FL|25.791|-80.130
Miami Gardens, FL|25.942|-80.246
Miami Lakes, FL|25.909|-80.309
Miramar, FL|25.987|-80.232
Myrtle Grove, FL|30.421|-87.307
Naples, FL|26.142|-81.796
Navarre, FL|30.402|-86.864
New Port Richey, FL|28.244|-82.719
New Smyrna Beach, FL|29.026|-80.927
Norland, FL|25.949|-80.212
North Fort Myers, FL|26.667|-81.880
North Lauderdale, FL|26.217|-80.226
North Miami, FL|25.890|-80.187
North Miami Beach, FL|25.933|-80.163
North Port, FL|27.044|-82.236
Oak Ridge, FL|28.471|-81.425
Oakland Park, FL|26.172|-80.132
Ocala, FL|29.187|-82.140
Ocoee, FL|28.569|-81.544
Ojus, FL|25.948|-80.151
Opa-locka, FL|25.902|-80.250
Orlando, FL|28.538|-81.379
Ormond Beach, FL|29.286|-81.056
Oviedo, FL|28.670|-81.208
Pace, FL|30.599|-87.161
Palm Bay, FL|28.034|-80.589
Palm Beach Gardens, FL|26.823|-80.139
Palm City, FL|27.168|-80.266
Palm Coast, FL|29.585|-81.208
Palm Harbor, FL|28.078|-82.764
Palm Springs, FL|26.636|-80.096
Palm Valley, FL|30.177|-81.388
Palmetto Bay, FL|25.622|-80.325
Panama City, FL|30.159|-85.660
Parkland, FL|26.310|-80.237
Pembroke Pines, FL|26.003|-80.224
Pensacola, FL|30.421|-87.217
Pine Hills, FL|28.558|-81.453
Pinecrest, FL|25.667|-80.308
Pinellas Park, FL|27.843|-82.700
Pinewood, FL|25.869|-80.217
Plant City, FL|28.019|-82.115
Plantation, FL|26.134|-80.232
Poinciana, FL|28.140|-81.458
Pompano Beach, FL|26.238|-80.125
Ponte Vedra Beach, FL|30.240|-81.386
Port Charlotte, FL|26.976|-82.091
Port Orange, FL|29.138|-80.996
Port Saint Lucie, FL|27.294|-80.350
Princeton, FL|25.538|-80.409
Punta Gorda, FL|26.930|-82.045
Punta Gorda Isles, FL|26.918|-82.078
Richmond West, FL|25.610|-80.430
Riverview, FL|27.866|-82.326
Riviera Beach, FL|26.775|-80.058
Rockledge, FL|28.351|-80.725
Royal Palm Beach, FL|26.708|-80.231
Ruskin, FL|27.721|-82.433
Safety Harbor, FL|27.991|-82.693
Saint Cloud, FL|28.249|-81.281
St. Petersburg, FL|27.771|-82.679
San Carlos Park, FL|26.467|-81.801
Sanford, FL|28.801|-81.273
Santa Rosa Beach, FL|30.396|-86.229
Sarasota, FL|27.336|-82.531
Sebastian, FL|27.816|-80.471
Seminole, FL|27.840|-82.791
South Bradenton, FL|27.463|-82.582
South Miami Heights, FL|25.598|-80.381
Southchase, FL|28.393|-81.383
Spring Hill, FL|28.477|-82.525
Stuart, FL|27.198|-80.253
Sun City Center, FL|27.718|-82.352
Sunny Isles Beach, FL|25.951|-80.123
Sunrise, FL|26.134|-80.113
Sunset, FL|25.706|-80.352
Sweetwater, FL|25.763|-80.373
Tallahassee, FL|30.438|-84.281
Tamarac, FL|26.213|-80.250
Tamiami, FL|25.759|-80.398
Tampa, FL|27.948|-82.458
Tarpon Springs, FL|28.146|-82.757
Tavares, FL|28.804|-81.726
Temple Terrace, FL|28.035|-82.389
The Crossings, FL|25.671|-80.401
The Hammocks, FL|25.671|-80.445
The Villages, FL|28.934|-81.960
Three Lakes, FL|25.642|-80.398
Titusville, FL|28.612|-80.808
Town n Country, FL|28.011|-82.577
University Park, FL|25.746|-80.368
Valrico, FL|27.938|-82.236
Venice, FL|27.100|-82.454
Vero Beach, FL|27.639|-80.397
Wekiwa Springs, FL|28.699|-81.426
Wellington, FL|26.659|-80.241
Wesley Chapel, FL|28.240|-82.328
Westchase, FL|28.055|-82.610
West Hollywood, FL|26.021|-80.184
West Little River, FL|25.857|-80.237
West Melbourne, FL|28.072|-80.653
West Palm Beach, FL|26.715|-80.053
West Park, FL|25.985|-80.199
West Pensacola, FL|30.427|-87.280
West and East Lealman, FL|27.820|-82.689
Westchester, FL|25.755|-80.327
Weston, FL|26.100|-80.400
Winter Garden, FL|28.565|-81.586
Winter Haven, FL|28.022|-81.733
Winter Park, FL|28.600|-81.339
Winter Springs, FL|28.699|-81.308
Wright, FL|30.456|-86.638
Acworth, GA|34.066|-84.678
Albany, GA|31.579|-84.156
Alpharetta, GA|34.075|-84.294
Americus, GA|32.072|-84.233
Athens, GA|33.961|-83.378
Atlanta, GA|33.749|-84.388
Augusta, GA|33.471|-81.975
Belvedere Park, GA|33.755|-84.267
Brookhaven, GA|33.858|-84.340
Brunswick, GA|31.150|-81.491
Calhoun, GA|34.503|-84.951
Canton, GA|34.237|-84.491
Carrollton, GA|33.580|-85.077
Cartersville, GA|34.165|-84.802
Chamblee, GA|33.892|-84.299
Columbus, GA|32.461|-84.988
Conyers, GA|33.668|-84.018
Dalton, GA|34.770|-84.970
Decatur, GA|33.775|-84.296
Douglasville, GA|33.752|-84.748
Dublin, GA|32.540|-82.904
Duluth, GA|34.003|-84.145
Dunwoody, GA|33.946|-84.335
East Point, GA|33.680|-84.439
Evans, GA|33.534|-82.131
Fayetteville, GA|33.449|-84.455
Forest Park, GA|33.622|-84.369
Gainesville, GA|34.298|-83.824
Griffin, GA|33.247|-84.264
Hinesville, GA|31.847|-81.596
Kennesaw, GA|34.023|-84.615
Kingsland, GA|30.800|-81.690
LaGrange, GA|33.039|-85.031
Lawrenceville, GA|33.956|-83.988
Lithia Springs, GA|33.794|-84.660
Mableton, GA|33.819|-84.582
Macon, GA|32.841|-83.632
Marietta, GA|33.953|-84.550
Martinez, GA|33.517|-82.076
McDonough, GA|33.447|-84.147
Milledgeville, GA|33.080|-83.232
Newnan, GA|33.381|-84.800
Norcross, GA|33.941|-84.214
North Decatur, GA|33.790|-84.306
North Druid Hills, GA|33.817|-84.313
Peachtree City, GA|33.397|-84.596
Peachtree Corners, GA|33.970|-84.222
Perry, GA|32.458|-83.732
Pooler, GA|32.115|-81.247
Redan, GA|33.745|-84.132
Riverdale, GA|33.573|-84.413
Rome, GA|34.257|-85.165
Roswell, GA|34.023|-84.362
St. Marys, GA|30.731|-81.546
Sandy Springs, GA|33.924|-84.379
Savannah, GA|32.084|-81.100
Smyrna, GA|33.884|-84.514
Snellville, GA|33.857|-84.020
Statesboro, GA|32.449|-81.783
Stockbridge, GA|33.544|-84.234
Sugar Hill, GA|34.106|-84.034
Suwanee, GA|34.051|-84.071
Thomasville, GA|30.837|-83.979
Tifton, GA|31.450|-83.508
Tucker, GA|33.855|-84.217
Union City, GA|33.587|-84.542
Valdosta, GA|30.833|-83.280
Warner Robins, GA|32.616|-83.627
Wilmington Island, GA|32.004|-80.974
Winder, GA|33.993|-83.720
Woodstock, GA|34.101|-84.519
Alton, IL|38.891|-90.184
Belleville, IL|38.520|-89.984
Carbondale, IL|37.727|-89.217
Charleston, IL|39.496|-88.176
Collinsville, IL|38.670|-89.985
Decatur, IL|39.840|-88.955
East Saint Louis, IL|38.624|-90.151
Edwardsville, IL|38.811|-89.953
Fairview Heights, IL|38.589|-89.990
Godfrey, IL|38.956|-90.187
Granite City, IL|38.701|-90.149
Jacksonville, IL|39.734|-90.229
Marion, IL|37.731|-88.933
Mattoon, IL|39.483|-88.373
Mount Vernon, IL|38.317|-88.903
OFallon, IL|38.592|-89.911
Quincy, IL|39.936|-91.410
Springfield, IL|39.802|-89.644
Upper Alton, IL|38.911|-90.151
Avon, IN|39.763|-86.400
Bloomington, IN|39.165|-86.526
Broad Ripple, IN|39.867|-86.142
Brownsburg, IN|39.843|-86.398
Carmel, IN|39.978|-86.118
Clarksville, IN|38.297|-85.760
Columbus, IN|39.201|-85.921
Evansville, IN|37.975|-87.556
Fishers, IN|39.956|-86.014
Greenfield, IN|39.785|-85.769
Greenwood, IN|39.614|-86.107
Indianapolis, IN|39.768|-86.158
Jasper, IN|38.391|-86.931
Jeffersonville, IN|38.278|-85.737
Lawrence, IN|39.839|-86.025
New Albany, IN|38.286|-85.824
New Castle, IN|39.929|-85.370
Plainfield, IN|39.704|-86.399
Richmond, IN|39.829|-84.890
Seymour, IN|38.959|-85.890
Shelbyville, IN|39.521|-85.777
Terre Haute, IN|39.467|-87.414
Vincennes, IN|38.677|-87.529
Zionsville, IN|39.951|-86.262
Derby, KS|37.546|-97.269
Emporia, KS|38.404|-96.182
Gardner, KS|38.811|-94.927
Great Bend, KS|38.364|-98.765
Hays, KS|38.879|-99.327
Hutchinson, KS|38.061|-97.930
Junction City, KS|39.029|-96.831
Kansas City, KS|39.114|-94.627
Lawrence, KS|38.972|-95.235
Leavenworth, KS|39.311|-94.922
Leawood, KS|38.967|-94.617
Lenexa, KS|38.954|-94.734
Manhattan, KS|39.184|-96.572
Newton, KS|38.047|-97.345
Olathe, KS|38.881|-94.819
Overland Park, KS|38.982|-94.671
Pittsburg, KS|37.411|-94.705
Prairie Village, KS|38.992|-94.634
Salina, KS|38.840|-97.611
Shawnee, KS|39.042|-94.720
Topeka, KS|39.048|-95.678
Wichita, KS|37.692|-97.338
Ashland, KY|38.478|-82.638
Bowling Green, KY|36.990|-86.444
Burlington, KY|39.028|-84.724
Covington, KY|39.084|-84.509
Danville, KY|37.646|-84.772
Elizabethtown, KY|37.694|-85.859
Erlanger, KY|39.017|-84.601
Fern Creek, KY|38.160|-85.588
Florence, KY|38.999|-84.627
Fort Thomas, KY|39.075|-84.447
Frankfort, KY|38.201|-84.873
Georgetown, KY|38.210|-84.559
Henderson, KY|37.836|-87.590
Highview, KY|38.143|-85.624
Hopkinsville, KY|36.866|-87.491
Independence, KY|38.943|-84.544
Jeffersontown, KY|38.194|-85.564
Lexington, KY|37.989|-84.478
Lexington-Fayette, KY|38.050|-84.459
Louisville, KY|38.254|-85.759
Madisonville, KY|37.328|-87.499
Meads, KY|38.413|-82.709
Murray, KY|36.610|-88.315
Newburg, KY|38.160|-85.660
Newport, KY|39.091|-84.496
Nicholasville, KY|37.881|-84.573
Okolona, KY|38.141|-85.688
Owensboro, KY|37.774|-87.113
Pleasure Ridge Park, KY|38.145|-85.858
Radcliff, KY|37.840|-85.949
Richmond, KY|37.748|-84.295
Saint Matthews, KY|38.253|-85.656
Shelbyville, KY|38.212|-85.224
Shively, KY|38.200|-85.823
Valley Station, KY|38.111|-85.870
Winchester, KY|37.990|-84.180
Alexandria, LA|31.311|-92.445
Baton Rouge, LA|30.443|-91.187
Bayou Cane, LA|29.624|-90.751
Bossier City, LA|32.516|-93.732
Central, LA|30.554|-91.037
Chalmette, LA|29.943|-89.965
Estelle, LA|29.846|-90.107
Gretna, LA|29.915|-90.054
Hammond, LA|30.505|-90.463
Harvey, LA|29.904|-90.077
Houma, LA|29.596|-90.720
Kenner, LA|29.994|-90.242
Lafayette, LA|30.224|-92.020
Lake Charles, LA|30.213|-93.204
Laplace, LA|30.067|-90.481
Marrero, LA|29.899|-90.100
Metairie, LA|29.984|-90.153
Metairie Terrace, LA|29.979|-90.164
Monroe, LA|32.509|-92.119
Natchitoches, LA|31.761|-93.086
New Iberia, LA|30.004|-91.819
New Orleans, LA|29.955|-90.075
Opelousas, LA|30.534|-92.082
Prairieville, LA|30.303|-90.972
Ruston, LA|32.523|-92.638
Shenandoah, LA|30.401|-91.001
Shreveport, LA|32.525|-93.750
Slidell, LA|30.275|-89.781
Sulphur, LA|30.237|-93.377
Terrytown, LA|29.910|-90.033
Zachary, LA|30.649|-91.156
Aberdeen, MD|39.510|-76.164
Adelphi, MD|39.003|-76.972
Annapolis, MD|38.979|-76.492
Arbutus, MD|39.255|-76.700
Arnold, MD|39.032|-76.503
Aspen Hill, MD|39.080|-77.073
Baltimore, MD|39.290|-76.612
Ballenger Creek, MD|39.373|-77.435
Beltsville, MD|39.035|-76.907
Bethesda, MD|38.981|-77.100
Bowie, MD|38.943|-76.730
Calverton, MD|39.058|-76.936
Camp Springs, MD|38.804|-76.907
Carney, MD|39.394|-76.524
Catonsville, MD|39.272|-76.732
Chillum, MD|38.964|-76.991
Cloverly, MD|39.108|-76.998
Clinton, MD|38.765|-76.898
Cockeysville, MD|39.481|-76.644
College Park, MD|38.981|-76.937
Columbia, MD|39.240|-76.839
Crofton, MD|39.002|-76.687
Cumberland, MD|39.653|-78.763
Damascus, MD|39.288|-77.204
Dundalk, MD|39.251|-76.521
East Riverdale, MD|38.958|-76.911
Easton, MD|38.774|-76.076
Edgewood, MD|39.419|-76.294
Eldersburg, MD|39.404|-76.950
Elkton, MD|39.607|-75.833
Elkridge, MD|39.213|-76.714
Ellicott City, MD|39.267|-76.798
Essex, MD|39.309|-76.475
Fairland, MD|39.076|-76.958
Ferndale, MD|39.183|-76.640
Fort Washington, MD|38.707|-77.023
Frederick, MD|39.414|-77.411
Gaithersburg, MD|39.143|-77.201
Germantown, MD|39.173|-77.272
Glassmanor, MD|38.819|-76.999
Glen Burnie, MD|39.163|-76.625
Green Haven, MD|39.140|-76.548
Greenbelt, MD|39.005|-76.876
Gwynn Oak, MD|39.333|-76.693
Hagerstown, MD|39.642|-77.720
Hanover, MD|39.193|-76.724
Hillcrest Heights, MD|38.833|-76.959
Hunt Valley, MD|39.500|-76.641
Hyattsville, MD|38.956|-76.946
Ilchester, MD|39.226|-76.789
Lake Shore, MD|39.107|-76.485
Landover, MD|38.934|-76.897
Langley Park, MD|38.989|-76.981
Laurel, MD|39.099|-76.848
Lochearn, MD|39.341|-76.722
Maryland City, MD|39.092|-76.818
Middle River, MD|39.334|-76.439
Milford Mill, MD|39.348|-76.770
Montgomery Village, MD|39.177|-77.195
North Bel Air, MD|39.540|-76.355
North Bethesda, MD|39.045|-77.119
North Potomac, MD|39.083|-77.265
Odenton, MD|39.084|-76.700
Olney, MD|39.153|-77.067
Owings Mills, MD|39.420|-76.780
Oxon Hill, MD|38.803|-76.990
Parkville, MD|39.377|-76.540
Parole, MD|38.981|-76.545
Pasadena, MD|39.119|-76.571
Perry Hall, MD|39.413|-76.464
Pikesville, MD|39.374|-76.722
Potomac, MD|39.018|-77.209
Randallstown, MD|39.367|-76.795
Redland, MD|39.145|-77.144
Reisterstown, MD|39.470|-76.832
Rockville, MD|39.084|-77.153
Rosedale, MD|39.320|-76.516
Rossville, MD|39.338|-76.480
Saint Charles, MD|38.603|-76.939
Salisbury, MD|38.361|-75.599
Scaggsville, MD|39.145|-76.900
Seabrook, MD|38.974|-76.849
Severn, MD|39.137|-76.698
Severna Park, MD|39.070|-76.545
Silver Spring, MD|38.991|-77.026
South Bel Air, MD|39.533|-76.337
South Gate, MD|39.129|-76.626
South Laurel, MD|39.070|-76.850
Suitland, MD|38.849|-76.924
Takoma Park, MD|38.978|-77.007
Towson, MD|39.401|-76.602
Waldorf, MD|38.625|-76.939
West Elkridge, MD|39.207|-76.727
Westminster, MD|39.575|-76.996
Wheaton, MD|39.040|-77.055
White Oak, MD|39.040|-76.993
Woodlawn, MD|39.323|-76.728
Affton, MO|38.551|-90.333
Arnold, MO|38.433|-90.378
Ballwin, MO|38.595|-90.546
Belton, MO|38.812|-94.532
Blue Springs, MO|39.017|-94.282
Cape Girardeau, MO|37.306|-89.518
Chesterfield, MO|38.663|-90.577
Clayton, MO|38.643|-90.324
Columbia, MO|38.952|-92.334
Concord, MO|38.525|-90.357
Creve Coeur, MO|38.661|-90.423
East Independence, MO|39.096|-94.355
Farmington, MO|37.781|-90.422
Ferguson, MO|38.744|-90.305
Florissant, MO|38.789|-90.323
Gladstone, MO|39.204|-94.555
Grandview, MO|38.886|-94.533
Hannibal, MO|39.708|-91.358
Hazelwood, MO|38.771|-90.371
Independence, MO|39.091|-94.416
Jefferson City, MO|38.577|-92.174
Joplin, MO|37.084|-94.513
Kansas City, MO|39.100|-94.579
Kirkwood, MO|38.583|-90.407
Lees Summit, MO|38.911|-94.382
Lemay, MO|38.533|-90.279
Liberty, MO|39.246|-94.419
Manchester, MO|38.597|-90.509
Maryland Heights, MO|38.713|-90.430
Mehlville, MO|38.508|-90.323
Nixa, MO|37.043|-93.294
OFallon, MO|38.811|-90.700
Oakville, MO|38.470|-90.305
Overland, MO|38.701|-90.362
Ozark, MO|37.021|-93.206
Poplar Bluff, MO|36.757|-90.393
Raymore, MO|38.802|-94.453
Raytown, MO|39.009|-94.464
Republic, MO|37.120|-93.480
Rolla, MO|37.951|-91.771
Saint Charles, MO|38.784|-90.481
Saint Joseph, MO|39.769|-94.847
St. Louis, MO|38.627|-90.198
Saint Peters, MO|38.800|-90.627
Sedalia, MO|38.704|-93.228
Sikeston, MO|36.877|-89.588
Spanish Lake, MO|38.788|-90.216
Springfield, MO|37.215|-93.298
University City, MO|38.656|-90.309
Warrensburg, MO|38.763|-93.736
Webster Groves, MO|38.593|-90.357
Wentzville, MO|38.811|-90.853
Wildwood, MO|38.583|-90.663
Biloxi, MS|30.396|-88.885
Brandon, MS|32.273|-89.986
Clarksdale, MS|34.200|-90.571
Clinton, MS|32.342|-90.322
Columbus, MS|33.496|-88.427
Gautier, MS|30.386|-88.612
Greenville, MS|33.409|-91.060
Greenwood, MS|33.516|-90.180
Gulfport, MS|30.367|-89.093
Hattiesburg, MS|31.327|-89.290
Hernando, MS|34.824|-89.994
Horn Lake, MS|34.955|-90.035
Jackson, MS|32.299|-90.185
Laurel, MS|31.694|-89.131
Long Beach, MS|30.350|-89.153
Madison, MS|32.462|-90.115
Meridian, MS|32.364|-88.704
Natchez, MS|31.560|-91.403
Ocean Springs, MS|30.411|-88.828
Olive Branch, MS|34.962|-89.830
Oxford, MS|34.367|-89.519
Pascagoula, MS|30.366|-88.556
Pearl, MS|32.275|-90.132
Ridgeland, MS|32.428|-90.132
Southaven, MS|34.989|-90.013
Starkville, MS|33.450|-88.820
Tupelo, MS|34.258|-88.705
Vicksburg, MS|32.353|-90.878
West Gulfport, MS|30.404|-89.094
Albemarle, NC|35.350|-80.200
Apex, NC|35.733|-78.850
Asheboro, NC|35.708|-79.814
Asheville, NC|35.601|-82.554
Boone, NC|36.217|-81.675
Burlington, NC|36.096|-79.438
Carrboro, NC|35.910|-79.075
Cary, NC|35.792|-78.781
Chapel Hill, NC|35.913|-79.056
Charlotte, NC|35.227|-80.843
Clayton, NC|35.651|-78.456
Clemmons, NC|36.022|-80.382
Concord, NC|35.409|-80.582
Cornelius, NC|35.487|-80.860
Durham, NC|35.994|-78.899
Eden, NC|36.488|-79.767
Elizabeth City, NC|36.295|-76.251
Fayetteville, NC|35.053|-78.878
Fuquay-Varina, NC|35.584|-78.800
Garner, NC|35.711|-78.614
Gastonia, NC|35.262|-81.187
Goldsboro, NC|35.385|-77.993
Greensboro, NC|36.073|-79.792
Greenville, NC|35.613|-77.366
Havelock, NC|34.879|-76.901
Henderson, NC|36.330|-78.399
Hickory, NC|35.733|-81.341
High Point, NC|35.956|-80.005
Holly Springs, NC|35.651|-78.834
Hope Mills, NC|34.970|-78.945
Huntersville, NC|35.411|-80.843
Indian Trail, NC|35.077|-80.669
Jacksonville, NC|34.754|-77.430
Kannapolis, NC|35.487|-80.622
Kernersville, NC|36.120|-80.074
Kinston, NC|35.263|-77.582
Laurinburg, NC|34.774|-79.463
Leland, NC|34.256|-78.045
Lenoir, NC|35.914|-81.539
Lexington, NC|35.824|-80.253
Lumberton, NC|34.618|-79.010
Matthews, NC|35.117|-80.724
Mint Hill, NC|35.180|-80.647
Monroe, NC|34.985|-80.550
Mooresville, NC|35.585|-80.810
Morganton, NC|35.745|-81.685
Morrisville, NC|35.823|-78.826
New Bern, NC|35.108|-77.044
Pinehurst, NC|35.195|-79.469
Raleigh, NC|35.772|-78.639
Roanoke Rapids, NC|36.462|-77.654
Rocky Mount, NC|35.938|-77.791
Salisbury, NC|35.671|-80.474
Sanford, NC|35.480|-79.180
Shelby, NC|35.292|-81.536
Stallings, NC|35.091|-80.686
Statesville, NC|35.783|-80.887
Thomasville, NC|35.883|-80.082
Wake Forest, NC|35.980|-78.510
West Raleigh, NC|35.787|-78.664
Wilmington, NC|34.236|-77.946
Wilson, NC|35.721|-77.916
Winston-Salem, NC|36.100|-80.244
Atlantic City, NJ|39.364|-74.423
Bayville, NJ|39.909|-74.155
Bridgeton, NJ|39.427|-75.234
Camden, NJ|39.926|-75.120
Cherry Hill, NJ|39.935|-75.031
Glassboro, NJ|39.703|-75.112
Jackson, NJ|39.776|-74.862
Lindenwold, NJ|39.824|-74.998
Maple Shade, NJ|39.953|-74.992
Millville, NJ|39.402|-75.039
Mount Laurel, NJ|39.934|-74.891
Ocean Acres, NJ|39.743|-74.281
Pennsauken, NJ|39.956|-75.058
Pleasantville, NJ|39.390|-74.524
Sewell, NJ|39.767|-75.144
Sicklerville, NJ|39.717|-74.969
South Vineland, NJ|39.446|-75.029
Toms River, NJ|39.954|-74.198
Vincentown, NJ|39.934|-74.748
Vineland, NJ|39.486|-75.026
Williamstown, NJ|39.686|-74.995
Athens, OH|39.329|-82.101
Beavercreek, OH|39.709|-84.063
Centerville, OH|39.628|-84.159
Cincinnati, OH|39.127|-84.514
Columbus, OH|39.961|-82.999
Dayton, OH|39.759|-84.192
Fairborn, OH|39.821|-84.019
Fairfield, OH|39.346|-84.561
Forest Park, OH|39.290|-84.504
Grove City, OH|39.881|-83.093
Hamilton, OH|39.400|-84.561
Huber Heights, OH|39.844|-84.125
Kettering, OH|39.690|-84.169
Lancaster, OH|39.714|-82.599
Lebanon, OH|39.435|-84.203
Mason, OH|39.360|-84.310
Miamisburg, OH|39.643|-84.287
Middletown, OH|39.515|-84.398
Norwood, OH|39.156|-84.460
Oxford, OH|39.507|-84.745
Pataskala, OH|39.996|-82.674
Pickerington, OH|39.884|-82.754
Portsmouth, OH|38.732|-82.998
Reynoldsburg, OH|39.955|-82.812
Riverside, OH|39.780|-84.124
Springboro, OH|39.552|-84.233
Springfield, OH|39.924|-83.809
Trotwood, OH|39.797|-84.311
Upper Arlington, OH|39.995|-83.062
Vandalia, OH|39.891|-84.199
White Oak, OH|39.213|-84.599
Whitehall, OH|39.967|-82.885
Xenia, OH|39.685|-83.930
Zanesville, OH|39.940|-82.013
Ada, OK|34.775|-96.678
Altus, OK|34.638|-99.334
Ardmore, OK|34.174|-97.144
Bartlesville, OK|36.747|-95.981
Bethany, OK|35.519|-97.632
Bixby, OK|35.942|-95.883
Broken Arrow, OK|36.053|-95.791
Chickasha, OK|35.053|-97.936
Claremore, OK|36.313|-95.616
Del City, OK|35.442|-97.441
Duncan, OK|34.502|-97.958
Durant, OK|33.994|-96.371
Edmond, OK|35.653|-97.478
El Reno, OK|35.532|-97.955
Enid, OK|36.396|-97.878
Jenks, OK|36.023|-95.968
Lawton, OK|34.609|-98.390
McAlester, OK|34.933|-95.770
Midwest City, OK|35.450|-97.397
Moore, OK|35.340|-97.487
Muskogee, OK|35.748|-95.370
Mustang, OK|35.384|-97.724
Norman, OK|35.223|-97.439
Oklahoma City, OK|35.468|-97.516
Owasso, OK|36.270|-95.855
Ponca City, OK|36.707|-97.086
Sand Springs, OK|36.140|-96.109
Sapulpa, OK|35.999|-96.114
Shawnee, OK|35.327|-96.925
Stillwater, OK|36.116|-97.058
Tahlequah, OK|35.915|-94.970
Tulsa, OK|36.154|-95.993
Yukon, OK|35.507|-97.763
Chambersburg, PA|39.938|-77.661
Chester, PA|39.848|-75.358
Cobbs Creek, PA|39.948|-75.240
Drexel Hill, PA|39.947|-75.292
Elmwood, PA|39.918|-75.228
Fishtown, PA|39.965|-75.135
Haddington, PA|39.966|-75.238
Hanover, PA|39.801|-76.983
Hartranft, PA|39.985|-75.147
Havertown, PA|39.981|-75.309
Kingsessing, PA|39.937|-75.230
Overbrook, PA|39.989|-75.243
Pennsport, PA|39.928|-75.150
Philadelphia, PA|39.952|-75.164
Point Breeze, PA|39.933|-75.178
Port Richmond, PA|39.993|-75.100
Rittenhouse, PA|39.948|-75.172
Springfield, PA|39.931|-75.320
Strawberry Mansion, PA|39.983|-75.183
University City, PA|39.951|-75.195
West Chester, PA|39.961|-75.608
Wharton, PA|39.927|-75.157
Whitman, PA|39.917|-75.155
York, PA|39.963|-76.728
Aiken, SC|33.560|-81.720
Anderson, SC|34.503|-82.650
Bluffton, SC|32.237|-80.860
Charleston, SC|32.776|-79.933
Clemson, SC|34.683|-82.837
Columbia, SC|34.001|-81.035
Conway, SC|33.836|-79.048
Easley, SC|34.830|-82.602
Florence, SC|34.195|-79.763
Goose Creek, SC|32.981|-80.033
Greenville, SC|34.853|-82.394
Greenwood, SC|34.195|-82.162
Greer, SC|34.939|-82.227
Hanahan, SC|32.919|-80.022
Hilton Head Island, SC|32.194|-80.738
Hilton Head, SC|32.216|-80.753
Lexington, SC|33.982|-81.236
Mauldin, SC|34.779|-82.310
Mount Pleasant, SC|32.794|-79.863
Myrtle Beach, SC|33.689|-78.887
North Augusta, SC|33.502|-81.965
North Charleston, SC|32.855|-79.975
North Myrtle Beach, SC|33.816|-78.680
Rock Hill, SC|34.925|-81.025
Saint Andrews, SC|34.043|-81.101
Seven Oaks, SC|34.049|-81.146
Simpsonville, SC|34.737|-82.254
Socastee, SC|33.684|-78.998
Spartanburg, SC|34.950|-81.932
Summerville, SC|33.019|-80.176
Sumter, SC|33.920|-80.341
Taylors, SC|34.920|-82.296
Wade Hampton, SC|34.904|-82.333
West Columbia, SC|33.993|-81.074
Bartlett, TN|35.205|-89.874
Brentwood, TN|36.033|-86.783
Brentwood Estates, TN|36.025|-86.779
Bristol, TN|36.595|-82.189
Chattanooga, TN|35.046|-85.310
Clarksville, TN|36.530|-87.359
Cleveland, TN|35.160|-84.877
Collierville, TN|35.042|-89.665
Columbia, TN|35.615|-87.035
Cookeville, TN|36.163|-85.502
Dickson, TN|36.077|-87.388
Dyersburg, TN|36.035|-89.386
East Brainerd, TN|34.996|-85.150
East Chattanooga, TN|35.065|-85.249
East Ridge, TN|35.014|-85.252
Ellendale, TN|35.231|-89.826
Farragut, TN|35.885|-84.154
Franklin, TN|35.925|-86.869
Gallatin, TN|36.388|-86.447
Germantown, TN|35.087|-89.810
Goodlettsville, TN|36.323|-86.713
Greeneville, TN|36.163|-82.831
Hendersonville, TN|36.305|-86.620
Hermitage, TN|36.196|-86.623
Jackson, TN|35.615|-88.814
Johnson City, TN|36.313|-82.353
Kingsport, TN|36.548|-82.562
Knoxville, TN|35.961|-83.921
La Vergne, TN|36.016|-86.582
Lebanon, TN|36.208|-86.291
Maryville, TN|35.756|-83.970
Memphis, TN|35.150|-90.049
Morristown, TN|36.214|-83.295
Mount Juliet, TN|36.200|-86.519
Murfreesboro, TN|35.846|-86.390
Nashville, TN|36.166|-86.784
New South Memphis, TN|35.087|-90.057
Oak Ridge, TN|36.010|-84.270
Sevierville, TN|35.868|-83.562
Shelbyville, TN|35.483|-86.460
Smyrna, TN|35.983|-86.519
Spring Hill, TN|35.751|-86.930
Springfield, TN|36.509|-86.885
Tullahoma, TN|35.362|-86.209
Abilene, TX|32.449|-99.733
Addison, TX|32.962|-96.829
Alamo, TX|26.184|-98.123
Aldine, TX|29.932|-95.380
Alice, TX|27.752|-98.070
Alief, TX|29.711|-95.596
Allen, TX|33.103|-96.671
Alton, TX|26.287|-98.313
Alvin, TX|29.424|-95.244
Angleton, TX|29.169|-95.432
Arlington, TX|32.736|-97.108
Atascocita, TX|29.999|-95.177
Austin, TX|30.267|-97.743
Balch Springs, TX|32.729|-96.623
Baytown, TX|29.735|-94.977
Beaumont, TX|30.086|-94.102
Bedford, TX|32.844|-97.143
Bellaire, TX|29.706|-95.459
Belton, TX|31.056|-97.464
Benbrook, TX|32.673|-97.461
Brenham, TX|30.167|-96.398
Brownsville, TX|25.902|-97.497
Brownwood, TX|31.709|-98.991
Brushy Creek, TX|30.514|-97.740
Bryan, TX|30.674|-96.370
Burleson, TX|32.542|-97.321
Canyon Lake, TX|29.875|-98.263
Carrollton, TX|32.954|-96.890
Cedar Hill, TX|32.588|-96.956
Cedar Park, TX|30.505|-97.820
Celina, TX|33.325|-96.784
Channelview, TX|29.776|-95.115
Cibolo, TX|29.562|-98.227
Cinco Ranch, TX|29.739|-95.758
Cleburne, TX|32.348|-97.387
Cloverleaf, TX|29.778|-95.172
College Station, TX|30.628|-96.334
Colleyville, TX|32.881|-97.155
Conroe, TX|30.312|-95.456
Converse, TX|29.518|-98.316
Coppell, TX|32.955|-97.015
Copperas Cove, TX|31.124|-97.903
Corinth, TX|33.154|-97.065
Corpus Christi, TX|27.801|-97.396
Corsicana, TX|32.095|-96.469
Cypress, TX|29.969|-95.697
Dallas, TX|32.783|-96.807
DeSoto, TX|32.590|-96.857
Deer Park, TX|29.705|-95.124
Denison, TX|33.756|-96.537
Denton, TX|33.215|-97.133
Dickinson, TX|29.461|-95.051
Donna, TX|26.170|-98.052
Duncanville, TX|32.652|-96.908
Edinburg, TX|26.302|-98.163
Ennis, TX|32.329|-96.625
Euless, TX|32.837|-97.082
Farmers Branch, TX|32.927|-96.896
Flower Mound, TX|33.015|-97.097
Forney, TX|32.748|-96.472
Fort Worth, TX|32.725|-97.321
Fresno, TX|29.539|-95.447
Friendswood, TX|29.529|-95.201
Frisco, TX|33.151|-96.824
Gainesville, TX|33.626|-97.133
Galveston, TX|29.301|-94.798
Garland, TX|32.913|-96.639
Gatesville, TX|31.435|-97.744
Georgetown, TX|30.633|-97.677
Grand Prairie, TX|32.746|-96.998
Grapevine, TX|32.934|-97.078
Greenville, TX|33.138|-96.111
Groves, TX|29.948|-93.917
Haltom City, TX|32.800|-97.269
Harker Heights, TX|31.084|-97.660
Harlingen, TX|26.191|-97.696
Highland Village, TX|33.092|-97.047
Houston, TX|29.763|-95.363
Humble, TX|29.999|-95.262
Huntsville, TX|30.724|-95.551
Hurst, TX|32.823|-97.171
Hutto, TX|30.543|-97.547
Irving, TX|32.814|-96.949
Jollyville, TX|30.443|-97.775
Katy, TX|29.786|-95.824
Keller, TX|32.935|-97.252
Kerrville, TX|30.047|-99.140
Killeen, TX|31.117|-97.728
Kingsville, TX|27.516|-97.856
Kyle, TX|29.989|-97.877
La Marque, TX|29.369|-94.971
La Porte, TX|29.666|-95.019
Lake Jackson, TX|29.034|-95.434
Lancaster, TX|32.592|-96.756
Laredo, TX|27.506|-99.508
League City, TX|29.507|-95.095
Leander, TX|30.579|-97.853
Lewisville, TX|33.046|-96.994
Little Elm, TX|33.163|-96.938
Live Oak, TX|29.565|-98.336
Longview, TX|32.501|-94.740
Lufkin, TX|31.338|-94.729
Mansfield, TX|32.563|-97.142
Marshall, TX|32.545|-94.367
McAllen, TX|26.203|-98.230
McKinney, TX|33.198|-96.615
Mercedes, TX|26.150|-97.914
Mesquite, TX|32.767|-96.599
Midlothian, TX|32.482|-96.994
Mission, TX|26.216|-98.325
Mission Bend, TX|29.694|-95.665
Missouri City, TX|29.619|-95.538
Mount Pleasant, TX|33.157|-94.968
Murphy, TX|33.015|-96.613
Nacogdoches, TX|31.604|-94.655
Nederland, TX|29.974|-93.992
New Braunfels, TX|29.703|-98.124
New Caney, TX|30.155|-95.211
New Territory, TX|29.594|-95.681
North Richland Hills, TX|32.834|-97.229
Orange, TX|30.093|-93.737
Palestine, TX|31.762|-95.631
Paris, TX|33.661|-95.556
Pasadena, TX|29.691|-95.209
Pearland, TX|29.564|-95.286
Pecan Grove, TX|29.626|-95.732
Pflugerville, TX|30.439|-97.620
Pharr, TX|26.195|-98.184
Plano, TX|33.020|-96.699
Port Arthur, TX|29.885|-93.942
Portland, TX|27.877|-97.324
Prosper, TX|33.236|-96.801
Richardson, TX|32.948|-96.730
Rockwall, TX|32.931|-96.460
Rosenberg, TX|29.557|-95.809
Round Rock, TX|30.508|-97.679
Rowlett, TX|32.903|-96.564
Sachse, TX|32.976|-96.595
Saginaw, TX|32.860|-97.364
San Antonio, TX|29.424|-98.494
San Benito, TX|26.133|-97.631
San Juan, TX|26.189|-98.155
San Marcos, TX|29.883|-97.941
Schertz, TX|29.552|-98.270
Seagoville, TX|32.640|-96.538
Seguin, TX|29.569|-97.965
Sherman, TX|33.636|-96.609
South Houston, TX|29.663|-95.235
Southlake, TX|32.941|-97.134
Spring, TX|30.080|-95.417
Stafford, TX|29.616|-95.558
Stephenville, TX|32.221|-98.202
Sugar Land, TX|29.620|-95.635
Sulphur Springs, TX|33.138|-95.601
Taylor, TX|30.571|-97.409
Temple, TX|31.098|-97.343
Terrell, TX|32.736|-96.275
Texarkana, TX|33.425|-94.048
Texas City, TX|29.384|-94.903
The Colony, TX|33.089|-96.886
The Woodlands, TX|30.158|-95.489
Tyler, TX|32.351|-95.301
Universal City, TX|29.548|-98.291
University of Texas, TX|30.286|-97.739
University Park, TX|32.850|-96.800
Uvalde, TX|29.210|-99.786
Victoria, TX|28.805|-97.004
Waco, TX|31.549|-97.147
Watauga, TX|32.858|-97.255
Waxahachie, TX|32.387|-96.848
Weatherford, TX|32.759|-97.797
Weslaco, TX|26.160|-97.991
West University Place, TX|29.718|-95.434
White Settlement, TX|32.760|-97.458
Wichita Falls, TX|33.914|-98.493
Wylie, TX|33.015|-96.539
Alexandria, VA|38.805|-77.047
Annandale, VA|38.830|-77.196
Arlington, VA|38.881|-77.104
Ashburn, VA|39.044|-77.487
Baileys Crossroads, VA|38.850|-77.130
Blacksburg, VA|37.230|-80.414
Bon Air, VA|37.525|-77.558
Bristol, VA|36.596|-82.188
Buckhall, VA|38.732|-77.431
Burke, VA|38.793|-77.272
Cave Spring, VA|37.228|-80.013
Centreville, VA|38.840|-77.429
Chantilly, VA|38.894|-77.431
Charlottesville, VA|38.029|-78.477
Cherry Hill, VA|38.570|-77.267
Chesapeake, VA|36.819|-76.275
Chester, VA|37.357|-77.442
Christiansburg, VA|37.130|-80.409
Colonial Heights, VA|37.268|-77.407
Culpeper, VA|38.473|-77.997
Dale City, VA|38.637|-77.311
Danville, VA|36.586|-79.395
East Hampton, VA|37.037|-76.332
Fairfax, VA|38.846|-77.306
Franconia, VA|38.782|-77.146
Fredericksburg, VA|38.303|-77.461
Front Royal, VA|38.918|-78.194
Great Falls, VA|38.998|-77.288
Hampton, VA|37.030|-76.345
Harrisonburg, VA|38.450|-78.869
Herndon, VA|38.970|-77.386
Highland Springs, VA|37.546|-77.328
Hopewell, VA|37.304|-77.287
Hybla Valley, VA|38.748|-77.083
Idylwood, VA|38.895|-77.212
Lake Ridge, VA|38.688|-77.298
Laurel, VA|37.643|-77.509
Leesburg, VA|39.116|-77.564
Lincolnia, VA|38.818|-77.143
Linton Hall, VA|38.760|-77.575
Lorton, VA|38.704|-77.228
Lynchburg, VA|37.414|-79.142
Manassas, VA|38.751|-77.475
Manassas Park, VA|38.784|-77.470
McLean, VA|38.934|-77.177
Mechanicsville, VA|37.609|-77.373
Merrifield, VA|38.874|-77.227
Midlothian, VA|37.506|-77.649
Montclair, VA|38.611|-77.340
Newport News, VA|36.980|-76.430
Norfolk, VA|36.847|-76.285
Oakton, VA|38.881|-77.301
Petersburg, VA|37.228|-77.402
Portsmouth, VA|36.835|-76.298
Portsmouth Heights, VA|36.821|-76.369
Radford, VA|37.132|-80.576
Reston, VA|38.969|-77.341
Richmond, VA|37.554|-77.460
Roanoke, VA|37.271|-79.941
Rose Hill, VA|38.789|-77.113
Salem, VA|37.293|-80.055
Short Pump, VA|37.650|-77.612
South Riding, VA|38.921|-77.504
South Suffolk, VA|36.717|-76.590
Springfield, VA|38.789|-77.187
Staunton, VA|38.150|-79.073
Sterling, VA|39.006|-77.429
Sudley, VA|38.793|-77.497
Suffolk, VA|36.728|-76.585
Tuckahoe, VA|37.590|-77.556
Tysons, VA|38.919|-77.231
Vienna, VA|38.901|-77.265
Virginia Beach, VA|36.853|-75.978
Waynesboro, VA|38.068|-78.889
West Lynchburg, VA|37.403|-79.178
West Springfield, VA|38.773|-77.221
Williamsburg, VA|37.271|-76.707
Winchester, VA|39.186|-78.163
Wolf Trap, VA|38.940|-77.286
Woodlawn, VA|38.717|-77.133
Beckley, WV|37.778|-81.188
Charleston, WV|38.350|-81.633
Clarksburg, WV|39.281|-80.345
Fairmont, WV|39.485|-80.143
Huntington, WV|38.419|-82.445
Martinsburg, WV|39.456|-77.964
Morgantown, WV|39.630|-79.956
Parkersburg, WV|39.267|-81.562
Sherwood, AR|34.815|-92.224
Franklin, IN|39.481|-86.055
Chillicothe, OH|39.333|-82.982
Bay City, TX|28.983|-95.969
Alabaster, AL|33.244|-86.816
Albertville, AL|34.268|-86.209
Anniston, AL|33.660|-85.832
Athens, AL|34.802|-86.972
Auburn, AL|32.610|-85.481
Glendale Heights, IL|41.915|-88.065
North Andover, MA|42.699|-71.135
Revere, MA|42.408|-71.012
Danbury, CT|41.395|-73.454
Darien, CT|41.079|-73.469
Inkster, MI|42.294|-83.310
Cleveland Heights, OH|41.520|-81.556
East Hartford, CT|41.782|-72.612
East Haven, CT|41.276|-72.868
East Norwalk, CT|41.106|-73.398
Enfield, CT|41.976|-72.592
Fairfield, CT|41.141|-73.264
Farmington, CT|41.720|-72.832
Glastonbury, CT|41.712|-72.608
Guilford, CT|41.289|-72.682
Hamden, CT|41.396|-72.897
Hartford, CT|41.764|-72.685
Killingly Center, CT|41.839|-71.869
Ledyard, CT|41.440|-72.014
Madison, CT|41.280|-72.598
Manchester, CT|41.776|-72.521
Mansfield City, CT|41.766|-72.234
Meriden, CT|41.538|-72.807
Middletown, CT|41.562|-72.651
Milford, CT|41.222|-73.056
Montville Center, CT|41.479|-72.151
Naugatuck, CT|41.486|-73.051
New Britain, CT|41.661|-72.780
New Canaan, CT|41.147|-73.495
New Haven, CT|41.308|-72.928
New London, CT|41.356|-72.100
Newington, CT|41.698|-72.724
North Haven, CT|41.391|-72.860
North Stamford, CT|41.138|-73.543
Norwalk, CT|41.118|-73.408
Norwich, CT|41.524|-72.076
Plainfield, CT|41.676|-71.915
Plainville, CT|41.675|-72.858
Seymour, CT|41.397|-73.076
Shelton, CT|41.316|-73.093
South Windsor, CT|41.824|-72.621
Southbury, CT|41.481|-73.213
Southington, CT|41.596|-72.878
Stamford, CT|41.053|-73.539
Storrs, CT|41.808|-72.250
Stratford, CT|41.185|-73.133
Torrington, CT|41.801|-73.121
Trumbull, CT|41.243|-73.201
Wallingford, CT|41.457|-72.823
Waterbury, CT|41.558|-73.052
West Hartford, CT|41.762|-72.742
West Haven, CT|41.271|-72.947
West Torrington, CT|41.818|-73.144
Westport, CT|41.141|-73.358
Wethersfield, CT|41.714|-72.653
Willimantic, CT|41.711|-72.208
Wilton, CT|41.195|-73.438
Windham, CT|41.700|-72.157
Windsor, CT|41.853|-72.644
Wolcott, CT|41.602|-72.987
Altoona, IA|41.644|-93.465
Ames, IA|42.035|-93.620
Ankeny, IA|41.730|-93.606
Bettendorf, IA|41.524|-90.516
Burlington, IA|40.808|-91.113
Cedar Falls, IA|42.528|-92.445
Cedar Rapids, IA|42.008|-91.644
Clinton, IA|41.844|-90.189
Clive, IA|41.603|-93.724
Coralville, IA|41.676|-91.580
Council Bluffs, IA|41.262|-95.861
Davenport, IA|41.524|-90.578
Des Moines, IA|41.601|-93.609
Dubuque, IA|42.501|-90.665
Fort Dodge, IA|42.497|-94.168
Indianola, IA|41.358|-93.557
Iowa City, IA|41.661|-91.530
Johnston, IA|41.673|-93.698
Marion, IA|42.034|-91.598
Marshalltown, IA|42.049|-92.908
Mason City, IA|43.154|-93.201
Muscatine, IA|41.424|-91.043
Newton, IA|41.700|-93.048
North Liberty, IA|41.749|-91.598
Ottumwa, IA|41.020|-92.411
Sioux City, IA|42.500|-96.400
Urbandale, IA|41.627|-93.712
Waterloo, IA|42.493|-92.343
Waukee, IA|41.612|-93.885
West Des Moines, IA|41.577|-93.711
Addison, IL|41.932|-87.989
Albany Park, IL|41.968|-87.723
Algonquin, IL|42.166|-88.294
Alsip, IL|41.669|-87.739
Arlington Heights, IL|42.088|-87.981
Ashburn, IL|41.748|-87.711
Aurora, IL|41.761|-88.320
Avondale, IL|41.939|-87.711
Bartlett, IL|41.995|-88.186
Batavia, IL|41.850|-88.313
Bellwood, IL|41.881|-87.883
Belmont Cragin, IL|41.932|-87.769
Belvidere, IL|42.264|-88.844
Bensenville, IL|41.955|-87.940
Berwyn, IL|41.851|-87.794
Bloomingdale, IL|41.958|-88.081
Bloomington, IL|40.484|-88.994
Blue Island, IL|41.657|-87.680
Bolingbrook, IL|41.699|-88.068
Bourbonnais, IL|41.154|-87.888
Bradley, IL|41.142|-87.861
Bridgeport, IL|41.838|-87.651
Bridgeview, IL|41.750|-87.804
Brighton Park, IL|41.819|-87.699
Brookfield, IL|41.824|-87.852
Buffalo Grove, IL|42.151|-87.960
Burbank, IL|41.734|-87.779
Calumet City, IL|41.616|-87.529
Carol Stream, IL|41.913|-88.135
Carpentersville, IL|42.121|-88.258
Cary, IL|42.212|-88.238
Champaign, IL|40.116|-88.243
Chatham, IL|41.741|-87.613
Chicago, IL|41.850|-87.650
Chicago Heights, IL|41.506|-87.636
Chicago Lawn, IL|41.775|-87.696
Cicero, IL|41.846|-87.754
Country Club Hills, IL|41.568|-87.720
Crest Hill, IL|41.555|-88.099
Crystal Lake, IL|42.241|-88.316
Danville, IL|40.124|-87.630
Darien, IL|41.752|-87.974
DeKalb, IL|41.929|-88.750
Deerfield, IL|42.171|-87.845
Des Plaines, IL|42.033|-87.883
Dixon, IL|41.839|-89.480
Dolton, IL|41.639|-87.607
Douglas, IL|41.835|-87.618
Downers Grove, IL|41.809|-88.011
East Garfield Park, IL|41.881|-87.703
East Moline, IL|41.501|-90.444
East Peoria, IL|40.666|-89.580
Edgewater, IL|41.983|-87.664
Elgin, IL|42.037|-88.281
Elk Grove Village, IL|42.004|-87.970
Elmhurst, IL|41.899|-87.940
Elmwood Park, IL|41.921|-87.809
Englewood, IL|41.780|-87.646
Evanston, IL|42.041|-87.690
Evergreen Park, IL|41.721|-87.702
Frankfort, IL|41.496|-87.849
Franklin Park, IL|41.935|-87.866
Freeport, IL|42.297|-89.621
Gage Park, IL|41.795|-87.696
Galesburg, IL|40.948|-90.371
Geneva, IL|41.888|-88.305
Glen Ellyn, IL|41.878|-88.067
Glenview, IL|42.070|-87.788
Goodings Grove, IL|41.629|-87.931
Grand Boulevard, IL|41.814|-87.617
Grayslake, IL|42.344|-88.042
Gurnee, IL|42.370|-87.902
Hanover Park, IL|41.999|-88.145
Harvey, IL|41.610|-87.647
Highland Park, IL|42.182|-87.800
Hinsdale, IL|41.801|-87.937
Hoffman Estates, IL|42.043|-88.080
Homer Glen, IL|41.600|-87.938
Homewood, IL|41.557|-87.666
Huntley, IL|42.168|-88.428
Hyde Park, IL|41.794|-87.594
Irving Park, IL|41.953|-87.736
Joliet, IL|41.525|-88.083
Kankakee, IL|41.120|-87.861
Kenwood, IL|41.809|-87.598
La Grange, IL|41.805|-87.869
Lake Forest, IL|42.259|-87.841
Lake Zurich, IL|42.197|-88.093
Lake in the Hills, IL|42.182|-88.330
Lansing, IL|41.565|-87.539
Lemont, IL|41.674|-88.002
Libertyville, IL|42.283|-87.953
Lincoln Park, IL|41.922|-87.648
Lincoln Square, IL|41.976|-87.689
Lisle, IL|41.801|-88.075
Lockport, IL|41.589|-88.058
Logan Square, IL|41.923|-87.699
Lombard, IL|41.880|-88.008
Loves Park, IL|42.320|-89.058
Lower West Side, IL|41.854|-87.666
Machesney Park, IL|42.347|-89.039
Macomb, IL|40.459|-90.672
Matteson, IL|41.504|-87.713
Maywood, IL|41.879|-87.843
McHenry, IL|42.333|-88.267
McKinley Park, IL|41.832|-87.674
Melrose Park, IL|41.901|-87.857
Mokena, IL|41.526|-87.889
Moline, IL|41.507|-90.515
Montgomery, IL|41.731|-88.346
Morgan Park, IL|41.690|-87.667
Morton, IL|40.613|-89.459
Morton Grove, IL|42.041|-87.783
Mount Greenwood, IL|41.698|-87.709
Mount Prospect, IL|42.066|-87.937
Mundelein, IL|42.263|-88.004
Naperville, IL|41.786|-88.147
Near North Side, IL|41.900|-87.635
Near South Side, IL|41.857|-87.625
New City, IL|41.808|-87.656
New Lenox, IL|41.512|-87.966
Niles, IL|42.019|-87.803
Normal, IL|40.514|-88.991
North Aurora, IL|41.806|-88.327
North Center, IL|41.954|-87.679
North Chicago, IL|42.326|-87.841
North Lawndale, IL|41.860|-87.718
North Peoria, IL|40.718|-89.584
Northbrook, IL|42.128|-87.829
Oak Forest, IL|41.603|-87.744
Oak Lawn, IL|41.711|-87.758
Oak Park, IL|41.885|-87.784
Orland Park, IL|41.630|-87.854
Oswego, IL|41.683|-88.351
Ottawa, IL|41.346|-88.843
Palatine, IL|42.110|-88.034
Palos Hills, IL|41.697|-87.817
Park Forest, IL|41.491|-87.674
Park Ridge, IL|42.011|-87.841
Pekin, IL|40.568|-89.641
Peoria, IL|40.694|-89.589
Plainfield, IL|41.627|-88.204
Portage Park, IL|41.958|-87.765
Prospect Heights, IL|42.095|-87.938
Rock Island, IL|41.509|-90.579
Rockford, IL|42.271|-89.094
Rogers Park, IL|42.009|-87.667
Rolling Meadows, IL|42.084|-88.013
Romeoville, IL|41.648|-88.090
Roselle, IL|41.985|-88.080
Round Lake, IL|42.353|-88.093
Round Lake Beach, IL|42.372|-88.090
St. Charles, IL|41.914|-88.309
Schaumburg, IL|42.033|-88.083
Shorewood, IL|41.520|-88.202
Skokie, IL|42.033|-87.733
South Chicago, IL|41.740|-87.554
South Elgin, IL|41.994|-88.292
South Holland, IL|41.601|-87.607
South Lawndale, IL|41.844|-87.713
South Shore, IL|41.762|-87.578
Sterling, IL|41.789|-89.696
Streamwood, IL|42.026|-88.178
Sycamore, IL|41.989|-88.687
Tinley Park, IL|41.573|-87.784
Uptown, IL|41.966|-87.653
Urbana, IL|40.111|-88.207
Vernon Hills, IL|42.219|-87.980
Villa Park, IL|41.890|-87.989
Wasco, IL|41.938|-88.405
Washington, IL|40.704|-89.407
Waukegan, IL|42.364|-87.845
West Chicago, IL|41.885|-88.204
West Elsdon, IL|41.794|-87.725
West Englewood, IL|41.778|-87.667
West Garfield Park, IL|41.881|-87.729
West Lawn, IL|41.773|-87.722
West Ridge, IL|42.000|-87.693
West Town, IL|41.894|-87.675
Westchester, IL|41.851|-87.882
Westmont, IL|41.796|-87.976
Wheaton, IL|41.866|-88.107
Wheeling, IL|42.139|-87.929
Wilmette, IL|42.072|-87.723
Woodlawn, IL|41.779|-87.599
Woodridge, IL|41.747|-88.050
Woodstock, IL|42.315|-88.449
Yorkville, IL|41.641|-88.447
Zion, IL|42.446|-87.833
Anderson, IN|40.105|-85.680
Crawfordsville, IN|40.041|-86.874
Crown Point, IN|41.417|-87.365
Dyer, IN|41.494|-87.522
East Chicago, IN|41.639|-87.455
Elkhart, IN|41.682|-85.977
Fort Wayne, IN|41.131|-85.129
Frankfort, IN|40.279|-86.511
Gary, IN|41.593|-87.346
Goshen, IN|41.582|-85.834
Granger, IN|41.753|-86.111
Griffith, IN|41.528|-87.424
Hammond, IN|41.583|-87.500
Highland, IN|41.554|-87.452
Hobart, IN|41.532|-87.255
Huntington, IN|40.883|-85.497
Kokomo, IN|40.486|-86.134
Lafayette, IN|40.417|-86.875
Lebanon, IN|40.048|-86.469
Logansport, IN|40.754|-86.357
Marion, IN|40.558|-85.659
Merrillville, IN|41.483|-87.333
Michigan City, IN|41.708|-86.895
Mishawaka, IN|41.662|-86.159
Muncie, IN|40.193|-85.386
Munster, IN|41.564|-87.513
New Haven, IN|41.071|-85.014
Noblesville, IN|40.046|-86.009
Portage, IN|41.576|-87.176
Schererville, IN|41.479|-87.455
South Bend, IN|41.683|-86.250
Valparaiso, IN|41.473|-87.061
West Lafayette, IN|40.426|-86.908
Westfield, IN|40.043|-86.127
Abington, MA|42.105|-70.945
Acton, MA|42.485|-71.433
Agawam, MA|42.070|-72.615
Allston, MA|42.358|-71.126
Amesbury, MA|42.858|-70.930
Amherst, MA|42.367|-72.519
Amherst Center, MA|42.375|-72.519
Arlington, MA|42.415|-71.156
Ashland, MA|42.261|-71.463
Ashmont, MA|42.283|-71.069
Attleboro, MA|41.945|-71.286
Auburn, MA|42.195|-71.836
Back Bay, MA|42.350|-71.087
Barnstable, MA|41.700|-70.299
Belmont, MA|42.396|-71.179
Beverly, MA|42.558|-70.880
Beverly Cove, MA|42.553|-70.854
Billerica, MA|42.558|-71.269
Boston, MA|42.358|-71.060
Brighton, MA|42.350|-71.156
Brockton, MA|42.083|-71.018
Brookline, MA|42.332|-71.121
Burlington, MA|42.505|-71.196
Cambridge, MA|42.375|-71.106
Canton, MA|42.158|-71.145
Charlestown, MA|42.378|-71.062
Chelmsford, MA|42.600|-71.367
Chelsea, MA|42.392|-71.033
Chestnut Hill, MA|42.331|-71.166
Chicopee, MA|42.149|-72.608
Concord, MA|42.460|-71.349
Danvers, MA|42.575|-70.930
Dedham, MA|42.242|-71.166
Dorchester, MA|42.297|-71.075
Dracut, MA|42.670|-71.302
Duxbury, MA|42.042|-70.672
East Boston, MA|42.375|-71.039
East Longmeadow, MA|42.065|-72.513
Easthampton, MA|42.267|-72.669
Easton, MA|42.025|-71.129
Everett, MA|42.408|-71.054
Fairhaven, MA|41.638|-70.904
Fall River, MA|41.701|-71.155
Fitchburg, MA|42.583|-71.802
Framingham, MA|42.279|-71.416
Framingham Center, MA|42.297|-71.437
Franklin, MA|42.083|-71.397
Gardner, MA|42.575|-71.998
Gloucester, MA|42.614|-70.663
Grafton, MA|42.207|-71.686
Greenfield, MA|42.588|-72.600
Hanover, MA|42.113|-70.812
Haverhill, MA|42.776|-71.077
Holden, MA|42.352|-71.863
Holyoke, MA|42.204|-72.616
Hyde Park, MA|42.256|-71.124
Jamaica Plain, MA|42.310|-71.120
Lawrence, MA|42.707|-71.163
Leominster, MA|42.525|-71.760
Lexington, MA|42.447|-71.225
Longmeadow, MA|42.050|-72.583
Lowell, MA|42.633|-71.316
Ludlow, MA|42.160|-72.476
Lynn, MA|42.467|-70.949
Malden, MA|42.425|-71.066
Mansfield, MA|42.033|-71.219
Marblehead, MA|42.500|-70.858
Marlborough, MA|42.346|-71.552
Mattapan, MA|42.272|-71.087
Medford, MA|42.418|-71.106
Melrose, MA|42.458|-71.066
Methuen, MA|42.726|-71.191
Middleborough, MA|41.893|-70.911
Milford, MA|42.140|-71.516
Milton, MA|42.250|-71.066
Natick, MA|42.283|-71.350
Needham, MA|42.283|-71.233
New Bedford, MA|41.635|-70.927
Newburyport, MA|42.813|-70.877
Newton, MA|42.337|-71.209
North Chicopee, MA|42.183|-72.600
Northampton, MA|42.325|-72.641
Norton, MA|41.967|-71.187
Norwood, MA|42.195|-71.200
Orient Heights, MA|42.388|-71.004
Palmer, MA|42.158|-72.329
Peabody, MA|42.528|-70.929
Pittsfield, MA|42.450|-73.245
Quincy, MA|42.253|-71.002
Randolph, MA|42.163|-71.041
Reading, MA|42.526|-71.095
Rockland, MA|42.131|-70.916
Roslindale, MA|42.291|-71.124
Roxbury Crossing, MA|42.331|-71.091
Salem, MA|42.520|-70.896
Saugus, MA|42.465|-71.010
Shrewsbury, MA|42.296|-71.713
Somerset, MA|41.770|-71.129
Somerville, MA|42.388|-71.100
South Boston, MA|42.333|-71.049
South Hadley, MA|42.258|-72.575
South Peabody, MA|42.510|-70.949
Southbridge, MA|42.075|-72.033
Springfield, MA|42.101|-72.590
Stoneham, MA|42.480|-71.100
Stoughton, MA|42.125|-71.102
Sudbury, MA|42.383|-71.416
Swansea, MA|41.748|-71.190
Taunton, MA|41.900|-71.090
Tewksbury, MA|42.611|-71.234
Wakefield, MA|42.506|-71.073
Waltham, MA|42.376|-71.236
Watertown, MA|42.371|-71.183
Wellesley, MA|42.296|-71.293
West Springfield, MA|42.107|-72.620
West Roxbury, MA|42.279|-71.150
Westfield, MA|42.125|-72.750
Westford, MA|42.579|-71.438
Weymouth, MA|42.221|-70.940
Wilmington, MA|42.546|-71.174
Winchester, MA|42.452|-71.137
Winthrop, MA|42.375|-70.983
Woburn, MA|42.479|-71.152
Worcester, MA|42.263|-71.802
Yarmouth, MA|41.706|-70.229
Auburn, ME|44.098|-70.231
Augusta, ME|44.311|-69.779
Bangor, ME|44.799|-68.773
Biddeford, ME|43.493|-70.453
Brunswick, ME|43.915|-69.965
Lewiston, ME|44.100|-70.215
Portland, ME|43.657|-70.259
Saco, ME|43.501|-70.443
Sanford, ME|43.439|-70.774
South Portland, ME|43.641|-70.241
South Portland Gardens, ME|43.639|-70.315
Waterville, ME|44.552|-69.632
West Scarborough, ME|43.570|-70.388
Westbrook, ME|43.677|-70.371
Adrian, MI|41.898|-84.037
Allen Park, MI|42.258|-83.211
Allendale, MI|42.972|-85.954
Ann Arbor, MI|42.278|-83.741
Auburn Hills, MI|42.688|-83.234
Battle Creek, MI|42.317|-85.178
Bay City, MI|43.594|-83.889
Berkley, MI|42.503|-83.184
Birmingham, MI|42.547|-83.211
Burton, MI|42.999|-83.616
Canton, MI|42.309|-83.482
Clinton Township, MI|42.587|-82.920
Dearborn, MI|42.322|-83.176
Dearborn Heights, MI|42.337|-83.273
Detroit, MI|42.331|-83.046
East Lansing, MI|42.737|-84.484
Eastpointe, MI|42.468|-82.955
Farmington Hills, MI|42.485|-83.377
Ferndale, MI|42.461|-83.135
Flint, MI|43.013|-83.687
Forest Hills, MI|42.959|-85.490
Garden City, MI|42.326|-83.331
Grand Rapids, MI|42.963|-85.668
Grandville, MI|42.910|-85.763
Grosse Pointe Woods, MI|42.444|-82.907
Hamtramck, MI|42.393|-83.050
Haslett, MI|42.747|-84.401
Hazel Park, MI|42.463|-83.104
Holland, MI|42.788|-86.109
Holt, MI|42.641|-84.515
Jackson, MI|42.246|-84.401
Jenison, MI|42.907|-85.792
Kalamazoo, MI|42.292|-85.587
Kentwood, MI|42.869|-85.645
Lansing, MI|42.733|-84.556
Lincoln Park, MI|42.251|-83.179
Livonia, MI|42.368|-83.353
Madison Heights, MI|42.486|-83.105
Marquette, MI|46.544|-87.395
Midland, MI|43.616|-84.247
Monroe, MI|41.916|-83.398
Mount Clemens, MI|42.597|-82.878
Mount Pleasant, MI|43.598|-84.768
Muskegon, MI|43.234|-86.248
Norton Shores, MI|43.169|-86.264
Novi, MI|42.481|-83.475
Oak Park, MI|42.459|-83.183
Okemos, MI|42.722|-84.427
Pontiac, MI|42.639|-83.291
Port Huron, MI|42.971|-82.425
Portage, MI|42.201|-85.580
Redford, MI|42.383|-83.297
Rochester Hills, MI|42.658|-83.150
Romulus, MI|42.222|-83.397
Roseville, MI|42.497|-82.937
Royal Oak, MI|42.489|-83.145
Saginaw, MI|43.419|-83.951
Shelby, MI|42.671|-83.033
Southfield, MI|42.473|-83.222
Southgate, MI|42.214|-83.194
Saint Clair Shores, MI|42.497|-82.889
Sterling Heights, MI|42.580|-83.030
Taylor, MI|42.241|-83.270
Traverse City, MI|44.763|-85.621
Trenton, MI|42.139|-83.178
Troy, MI|42.606|-83.150
Walker, MI|43.001|-85.768
Warren, MI|42.490|-83.013
Waterford, MI|42.693|-83.412
Waverly, MI|42.739|-84.621
Wayne, MI|42.281|-83.386
Westland, MI|42.324|-83.400
Wyandotte, MI|42.214|-83.150
Wyoming, MI|42.913|-85.705
Ypsilanti, MI|42.241|-83.613
Albert Lea, MN|43.648|-93.368
Andover, MN|45.233|-93.291
Anoka, MN|45.198|-93.387
Apple Valley, MN|44.732|-93.218
Austin, MN|43.667|-92.975
Blaine, MN|45.161|-93.235
Bloomington, MN|44.841|-93.298
Brooklyn Center, MN|45.076|-93.333
Brooklyn Park, MN|45.094|-93.356
Buffalo, MN|45.172|-93.875
Burnsville, MN|44.768|-93.278
Champlin, MN|45.189|-93.397
Chanhassen, MN|44.862|-93.531
Chaska, MN|44.789|-93.602
Columbia Heights, MN|45.041|-93.263
Coon Rapids, MN|45.120|-93.288
Cottage Grove, MN|44.828|-92.944
Crystal, MN|45.033|-93.360
Duluth, MN|46.783|-92.107
Eagan, MN|44.804|-93.167
Eden Prairie, MN|44.855|-93.471
Edina, MN|44.890|-93.350
Elk River, MN|45.304|-93.567
Faribault, MN|44.295|-93.269
Farmington, MN|44.640|-93.144
Forest Lake, MN|45.279|-92.985
Fridley, MN|45.086|-93.263
Golden Valley, MN|45.010|-93.349
Ham Lake, MN|45.250|-93.250
Hastings, MN|44.743|-92.852
Hibbing, MN|47.427|-92.938
Hopkins, MN|44.925|-93.463
Inver Grove Heights, MN|44.848|-93.043
Lakeville, MN|44.650|-93.243
Lino Lakes, MN|45.160|-93.089
Mankato, MN|44.159|-94.009
Maple Grove, MN|45.072|-93.456
Maplewood, MN|44.953|-92.995
Minneapolis, MN|44.980|-93.264
Minnetonka, MN|44.913|-93.503
Minnetonka Mills, MN|44.941|-93.442
Moorhead, MN|46.874|-96.770
New Brighton, MN|45.066|-93.202
New Hope, MN|45.038|-93.387
Northfield, MN|44.458|-93.162
Oakdale, MN|44.963|-92.965
Otsego, MN|45.274|-93.591
Owatonna, MN|44.084|-93.226
Plymouth, MN|45.011|-93.456
Prior Lake, MN|44.713|-93.423
Ramsey, MN|45.261|-93.450
Red Wing, MN|44.562|-92.534
Richfield, MN|44.883|-93.283
Rochester, MN|44.022|-92.470
Rosemount, MN|44.739|-93.126
Roseville, MN|45.006|-93.157
Saint Cloud, MN|45.561|-94.162
Saint Louis Park, MN|44.948|-93.348
Saint Michael, MN|45.210|-93.665
Saint Paul, MN|44.944|-93.093
Sartell, MN|45.622|-94.207
Savage, MN|44.779|-93.336
Shakopee, MN|44.798|-93.527
Shoreview, MN|45.079|-93.147
South Saint Paul, MN|44.893|-93.035
Stillwater, MN|45.056|-92.806
West Coon Rapids, MN|45.160|-93.350
West Saint Paul, MN|44.916|-93.102
White Bear Lake, MN|45.085|-93.010
Willmar, MN|45.122|-95.043
Winona, MN|44.050|-91.639
Woodbury, MN|44.924|-92.959
Kirksville, MO|40.195|-92.583
Fargo, ND|46.877|-96.790
Grand Forks, ND|47.925|-97.033
Jamestown, ND|46.911|-98.708
West Fargo, ND|46.875|-96.900
Bellevue, NE|41.137|-95.891
Columbus, NE|41.430|-97.368
Fremont, NE|41.433|-96.498
Grand Island, NE|40.925|-98.342
Hastings, NE|40.586|-98.388
Kearney, NE|40.699|-99.081
La Vista, NE|41.184|-96.031
Lincoln, NE|40.800|-96.667
Norfolk, NE|42.028|-97.417
Omaha, NE|41.256|-95.940
Papillion, NE|41.154|-96.042
Bedford, NH|42.946|-71.516
Concord, NH|43.208|-71.538
Derry, NH|42.881|-71.327
Derry Village, NH|42.892|-71.312
Dover, NH|43.198|-70.874
East Concord, NH|43.242|-71.538
Keene, NH|42.934|-72.278
Laconia, NH|43.528|-71.470
Manchester, NH|42.996|-71.455
Merrimack, NH|42.865|-71.493
Nashua, NH|42.765|-71.468
Portsmouth, NH|43.077|-70.758
Rochester, NH|43.305|-70.976
Salem, NH|42.788|-71.201
Asbury Park, NJ|40.220|-74.012
Avenel, NJ|40.580|-74.285
Basking Ridge, NJ|40.706|-74.549
Bayonne, NJ|40.669|-74.114
Belleville, NJ|40.794|-74.150
Bergenfield, NJ|40.928|-73.997
Bloomfield, NJ|40.807|-74.185
Brick, NJ|40.059|-74.137
Carteret, NJ|40.577|-74.228
Cliffside Park, NJ|40.821|-73.988
Clifton, NJ|40.858|-74.164
Colonia, NJ|40.575|-74.302
Cranford, NJ|40.658|-74.300
Denville, NJ|40.892|-74.477
Dover, NJ|40.884|-74.562
Dumont, NJ|40.941|-73.997
East Brunswick, NJ|40.428|-74.416
East Orange, NJ|40.767|-74.205
Edison, NJ|40.519|-74.412
Elizabeth, NJ|40.664|-74.211
Elmwood Park, NJ|40.904|-74.118
Englewood, NJ|40.893|-73.973
Ewing, NJ|40.270|-74.800
Fair Lawn, NJ|40.940|-74.132
Fords, NJ|40.529|-74.316
Fort Lee, NJ|40.851|-73.970
Garfield, NJ|40.881|-74.113
Hackensack, NJ|40.886|-74.043
Harrison, NJ|40.746|-74.156
Hawthorne, NJ|40.949|-74.154
Hillsborough, NJ|40.506|-74.674
Hillside, NJ|40.701|-74.230
Hoboken, NJ|40.744|-74.032
Hopatcong Hills, NJ|40.944|-74.671
Irvington, NJ|40.732|-74.235
Iselin, NJ|40.575|-74.322
Jersey City, NJ|40.728|-74.078
Kearny, NJ|40.768|-74.145
Lakewood, NJ|40.098|-74.218
Linden, NJ|40.622|-74.245
Livingston, NJ|40.796|-74.315
Lodi, NJ|40.882|-74.083
Long Branch, NJ|40.304|-73.992
Lyndhurst, NJ|40.812|-74.124
Madison, NJ|40.760|-74.417
Mahwah, NJ|41.089|-74.144
Maplewood, NJ|40.731|-74.273
Marlboro, NJ|40.315|-74.246
Middletown, NJ|40.394|-74.117
Montclair, NJ|40.826|-74.209
Morristown, NJ|40.797|-74.482
New Brunswick, NJ|40.486|-74.452
New Milford, NJ|40.935|-74.019
Newark, NJ|40.736|-74.172
North Arlington, NJ|40.788|-74.133
North Bergen, NJ|40.804|-74.012
North Plainfield, NJ|40.630|-74.427
Nutley, NJ|40.822|-74.160
Old Bridge, NJ|40.415|-74.365
Orange, NJ|40.771|-74.233
Palisades Park, NJ|40.848|-73.998
Paramus, NJ|40.945|-74.075
Parsippany, NJ|40.858|-74.426
Passaic, NJ|40.857|-74.128
Paterson, NJ|40.917|-74.172
Perth Amboy, NJ|40.507|-74.265
Piscataway, NJ|40.499|-74.399
Plainfield, NJ|40.634|-74.407
Point Pleasant, NJ|40.083|-74.068
Princeton, NJ|40.349|-74.659
Rahway, NJ|40.608|-74.278
Ramsey, NJ|41.057|-74.141
Ridgewood, NJ|40.979|-74.117
Roselle, NJ|40.652|-74.259
Rutherford, NJ|40.826|-74.107
Sayreville, NJ|40.459|-74.361
Sayreville Junction, NJ|40.465|-74.330
Scotch Plains, NJ|40.655|-74.390
Secaucus, NJ|40.790|-74.057
Somerset, NJ|40.498|-74.488
South Old Bridge, NJ|40.408|-74.354
South Orange, NJ|40.749|-74.261
South Plainfield, NJ|40.579|-74.412
South River, NJ|40.446|-74.386
Sparta, NJ|41.033|-74.638
Summit, NJ|40.716|-74.365
Teaneck, NJ|40.898|-74.016
Tinton Falls, NJ|40.304|-74.100
Trenton, NJ|40.217|-74.743
Union, NJ|40.698|-74.263
Union City, NJ|40.780|-74.024
Wayne, NJ|40.925|-74.277
West Milford, NJ|41.131|-74.367
West New York, NJ|40.788|-74.014
West Orange, NJ|40.799|-74.239
Westfield, NJ|40.659|-74.347
Willingboro, NJ|40.028|-74.869
Woodbridge, NJ|40.558|-74.285
Wyckoff, NJ|41.010|-74.173
Albany, NY|42.653|-73.756
Amherst, NY|42.978|-78.800
Amsterdam, NY|42.939|-74.188
Astoria, NY|40.772|-73.930
Auburn, NY|42.932|-76.566
Baldwin, NY|40.656|-73.609
Batavia, NY|42.998|-78.188
Bath Beach, NY|40.605|-74.004
Bay Shore, NY|40.725|-73.245
Baychester, NY|40.869|-73.836
Bayside, NY|40.768|-73.777
Bellmore, NY|40.669|-73.527
Bensonhurst, NY|40.602|-73.994
Bethpage, NY|40.744|-73.482
Binghamton, NY|42.099|-75.918
Borough Park, NY|40.634|-73.997
Brentwood, NY|40.781|-73.246
Brighton, NY|43.148|-77.551
Brighton Beach, NY|40.578|-73.960
The Bronx, NY|40.850|-73.866
Brooklyn, NY|40.650|-73.950
Brooklyn Heights, NY|40.695|-73.994
Brownsville, NY|40.661|-73.920
Buffalo, NY|42.886|-78.878
Bushwick, NY|40.694|-73.919
Cambria Heights, NY|40.695|-73.738
Canarsie, NY|40.644|-73.901
Centereach, NY|40.858|-73.100
Central Islip, NY|40.791|-73.202
Cheektowaga, NY|42.903|-78.755
Chinatown, NY|40.716|-73.996
Cicero, NY|43.176|-76.119
Clay, NY|43.186|-76.172
Clifton Park, NY|42.866|-73.771
Cohoes, NY|42.774|-73.700
College Point, NY|40.788|-73.846
Commack, NY|40.843|-73.293
Coney Island, NY|40.578|-73.994
Copiague, NY|40.681|-73.400
Coram, NY|40.869|-73.001
Corona, NY|40.747|-73.860
Cortland, NY|42.601|-76.180
Cypress Hills, NY|40.677|-73.891
Deer Park, NY|40.762|-73.329
Depew, NY|42.904|-78.692
Dix Hills, NY|40.805|-73.336
Dyker Heights, NY|40.621|-74.010
East Amherst, NY|43.018|-78.697
East Elmhurst, NY|40.761|-73.865
East Flatbush, NY|40.654|-73.930
East Meadow, NY|40.714|-73.559
East Massapequa, NY|40.673|-73.437
East New York, NY|40.667|-73.882
East Northport, NY|40.877|-73.325
East Patchogue, NY|40.767|-72.996
East Setauket, NY|40.941|-73.106
East Tremont, NY|40.845|-73.891
East Village, NY|40.729|-73.987
Eastchester, NY|40.958|-73.809
Eggertsville, NY|42.963|-78.804
Elmhurst, NY|40.736|-73.878
Elmira, NY|42.090|-76.808
Elmont, NY|40.701|-73.713
Emerson Hill, NY|40.609|-74.096
Far Rockaway, NY|40.605|-73.755
Farmingville, NY|40.831|-73.030
Flatbush, NY|40.652|-73.959
Flatlands, NY|40.621|-73.935
Floral Park, NY|40.724|-73.705
Fordham, NY|40.859|-73.898
Forest Hills, NY|40.716|-73.850
Fort Hamilton, NY|40.619|-74.033
Franklin Square, NY|40.707|-73.676
Freeport, NY|40.658|-73.583
Fresh Meadows, NY|40.735|-73.793
Garden City, NY|40.727|-73.634
Glen Cove, NY|40.862|-73.634
Glendale, NY|40.701|-73.887
Glenville, NY|42.929|-74.052
Gloversville, NY|43.053|-74.344
Grand Island, NY|43.033|-78.963
Graniteville, NY|40.625|-74.148
Gravesend, NY|40.598|-73.965
Great Kills, NY|40.554|-74.152
Greenburgh, NY|41.033|-73.843
Greenpoint, NY|40.724|-73.951
Harlem, NY|40.808|-73.945
Harrison, NY|40.969|-73.713
Hauppauge, NY|40.826|-73.203
Hells Kitchen, NY|40.765|-73.991
Hempstead, NY|40.706|-73.619
Henrietta, NY|43.059|-77.612
Hicksville, NY|40.768|-73.525
Hillside, NY|40.708|-73.787
Holbrook, NY|40.812|-73.078
Hollis, NY|40.713|-73.767
Holtsville, NY|40.815|-73.045
Howard Beach, NY|40.658|-73.836
Huntington, NY|40.868|-73.426
Huntington Station, NY|40.853|-73.412
Hunts Point, NY|40.813|-73.884
Irondequoit, NY|43.213|-77.580
Islip, NY|40.730|-73.210
Ithaca, NY|42.441|-76.497
Jackson Heights, NY|40.756|-73.885
Jamaica, NY|40.691|-73.806
Jamestown, NY|42.097|-79.235
Kenmore, NY|42.966|-78.870
Kensington, NY|40.646|-73.971
Kew Gardens, NY|40.714|-73.831
Kings Bridge, NY|40.879|-73.905
Kings Park, NY|40.886|-73.257
Kingston, NY|41.927|-73.997
Kiryas Joel, NY|41.342|-74.168
Lackawanna, NY|42.826|-78.823
Lake Ronkonkoma, NY|40.835|-73.131
Latham, NY|42.747|-73.759
Laurelton, NY|40.670|-73.747
Levittown, NY|40.726|-73.514
Lindenhurst, NY|40.687|-73.373
Lockport, NY|43.171|-78.690
Long Beach, NY|40.588|-73.658
Long Island City, NY|40.745|-73.949
Lynbrook, NY|40.655|-73.672
Mamaroneck, NY|40.949|-73.733
Manhattan, NY|40.783|-73.966
Mariners Harbor, NY|40.637|-74.159
Maspeth, NY|40.723|-73.913
Massapequa, NY|40.681|-73.474
Massapequa Park, NY|40.680|-73.455
Mastic, NY|40.802|-72.841
Medford, NY|40.818|-73.000
Melrose, NY|40.825|-73.910
Melville, NY|40.793|-73.415
Merrick, NY|40.663|-73.552
Middle Village, NY|40.716|-73.881
Middletown, NY|41.446|-74.423
Mineola, NY|40.749|-73.641
Monsey, NY|41.111|-74.068
Morris Heights, NY|40.850|-73.920
Morrisania, NY|40.829|-73.907
Mott Haven, NY|40.809|-73.923
Mount Vernon, NY|40.913|-73.837
Nanuet, NY|41.089|-74.013
New City, NY|41.148|-73.989
New Rochelle, NY|40.911|-73.782
New Springville, NY|40.593|-74.163
New York City, NY|40.714|-74.006
Newburgh, NY|41.503|-74.010
Niagara Falls, NY|43.094|-79.057
North Amityville, NY|40.698|-73.425
North Babylon, NY|40.716|-73.322
North Bay Shore, NY|40.753|-73.260
North Bellmore, NY|40.691|-73.533
North Massapequa, NY|40.701|-73.462
North Tonawanda, NY|43.039|-78.864
North Valley Stream, NY|40.685|-73.702
Oceanside, NY|40.639|-73.640
Ossining, NY|41.163|-73.862
Oswego, NY|43.455|-76.510
Ozone Park, NY|40.677|-73.844
Park Slope, NY|40.670|-73.986
Parkchester, NY|40.839|-73.860
Pearl River, NY|41.059|-74.022
Peekskill, NY|41.290|-73.920
Plainview, NY|40.776|-73.467
Plattsburgh, NY|44.699|-73.453
Port Chester, NY|41.002|-73.666
Port Richmond, NY|40.633|-74.137
Port Washington, NY|40.826|-73.698
Poughkeepsie, NY|41.700|-73.921
Queens Village, NY|40.727|-73.742
Queens, NY|40.681|-73.837
Queensbury, NY|43.377|-73.613
Rego Park, NY|40.726|-73.853
Richmond Hill, NY|40.700|-73.831
Ridgewood, NY|40.700|-73.906
Rochester, NY|43.155|-77.616
Rockville Centre, NY|40.659|-73.641
Rome, NY|43.213|-75.456
Ronkonkoma, NY|40.821|-73.143
Roosevelt, NY|40.679|-73.589
Rosedale, NY|40.662|-73.735
Rossville, NY|40.549|-74.210
Rotterdam, NY|42.787|-73.971
Rye, NY|40.981|-73.684
Saratoga Springs, NY|43.083|-73.785
Sayville, NY|40.736|-73.082
Scarsdale, NY|41.005|-73.785
Schenectady, NY|42.814|-73.940
Seaford, NY|40.666|-73.488
Selden, NY|40.866|-73.036
Sheepshead Bay, NY|40.591|-73.945
Shirley, NY|40.801|-72.868
Smithtown, NY|40.856|-73.201
South Ozone Park, NY|40.670|-73.819
Springfield Gardens, NY|40.663|-73.762
Spring Valley, NY|41.113|-74.044
Staten Island, NY|40.562|-74.140
Sunnyside, NY|40.740|-73.935
Syosset, NY|40.826|-73.502
Syracuse, NY|43.048|-76.147
Terrace Heights, NY|40.721|-73.769
Throgs Neck, NY|40.823|-73.820
Tremont, NY|40.850|-73.906
Troy, NY|42.728|-73.692
Uniondale, NY|40.700|-73.593
Unionport, NY|40.827|-73.850
University Heights, NY|40.860|-73.909
Upper West Side, NY|40.787|-73.975
Utica, NY|43.101|-75.233
Valley Stream, NY|40.664|-73.708
Van Nest, NY|40.848|-73.864
Vestal, NY|42.085|-76.054
Wakefield, NY|40.898|-73.852
Wantagh, NY|40.684|-73.510
Washington Heights, NY|40.850|-73.935
Watertown, NY|43.975|-75.911
West Albany, NY|42.683|-73.778
West Babylon, NY|40.718|-73.354
West Hempstead, NY|40.705|-73.650
West Islip, NY|40.706|-73.306
West Seneca, NY|42.850|-78.800
Westbury, NY|40.756|-73.588
White Plains, NY|41.034|-73.763
Whitestone, NY|40.795|-73.818
Williamsburg, NY|40.714|-73.953
Wilton, NY|43.180|-73.744
Woodhaven, NY|40.689|-73.858
Woodmere, NY|40.632|-73.713
Woodrow, NY|40.541|-74.191
Woodside, NY|40.745|-73.905
Yonkers, NY|40.930|-73.898
Akron, OH|41.081|-81.519
Alliance, OH|40.915|-81.106
Ashland, OH|40.869|-82.318
Ashtabula, OH|41.865|-80.790
Aurora, OH|41.318|-81.345
Austintown, OH|41.102|-80.765
Avon, OH|41.452|-82.035
Avon Center, OH|41.460|-82.020
Avon Lake, OH|41.505|-82.028
Barberton, OH|41.013|-81.605
Bay Village, OH|41.485|-81.922
Berea, OH|41.366|-81.854
Boardman, OH|41.024|-80.663
Bowling Green, OH|41.375|-83.651
Broadview Heights, OH|41.314|-81.685
Brook Park, OH|41.398|-81.805
Brunswick, OH|41.238|-81.842
Canton, OH|40.799|-81.378
Cleveland, OH|41.499|-81.695
Collinwood, OH|41.558|-81.569
Cuyahoga Falls, OH|41.134|-81.485
Defiance, OH|41.284|-84.356
Delaware, OH|40.299|-83.068
Dublin, OH|40.099|-83.114
East Cleveland, OH|41.533|-81.579
Eastlake, OH|41.654|-81.450
Elyria, OH|41.368|-82.108
Euclid, OH|41.593|-81.527
Fairview Park, OH|41.441|-81.864
Findlay, OH|41.044|-83.650
Fremont, OH|41.350|-83.122
Gahanna, OH|40.019|-82.879
Garfield Heights, OH|41.417|-81.606
Glenville, OH|41.533|-81.617
Green, OH|40.946|-81.483
Hilliard, OH|40.033|-83.158
Hough, OH|41.512|-81.637
Hudson, OH|41.240|-81.441
Kent, OH|41.154|-81.358
Lakewood, OH|41.482|-81.798
Lima, OH|40.743|-84.105
Lorain, OH|41.453|-82.182
Mansfield, OH|40.758|-82.515
Maple Heights, OH|41.415|-81.566
Marion, OH|40.589|-83.129
Marysville, OH|40.236|-83.367
Massillon, OH|40.797|-81.522
Mayfield Heights, OH|41.519|-81.458
Medina, OH|41.138|-81.864
Mentor, OH|41.666|-81.340
Middleburg Heights, OH|41.361|-81.813
Mount Vernon, OH|40.393|-82.486
New Philadelphia, OH|40.490|-81.446
Newark, OH|40.058|-82.401
Niles, OH|41.183|-80.765
North Canton, OH|40.876|-81.402
North Olmsted, OH|41.416|-81.923
North Ridgeville, OH|41.389|-82.019
North Royalton, OH|41.314|-81.725
Norwalk, OH|41.243|-82.616
Oregon, OH|41.644|-83.487
Painesville, OH|41.724|-81.246
Parma, OH|41.405|-81.723
Parma Heights, OH|41.390|-81.760
Perrysburg, OH|41.557|-83.627
Piqua, OH|40.145|-84.242
Rocky River, OH|41.476|-81.839
Sandusky, OH|41.449|-82.708
Shaker Heights, OH|41.474|-81.537
Sidney, OH|40.284|-84.156
Solon, OH|41.390|-81.441
South Euclid, OH|41.523|-81.518
Steubenville, OH|40.370|-80.634
Stow, OH|41.160|-81.440
Streetsboro, OH|41.239|-81.346
Strongsville, OH|41.315|-81.836
Sylvania, OH|41.719|-83.713
Tallmadge, OH|41.101|-81.442
Tiffin, OH|41.114|-83.178
Toledo, OH|41.664|-83.555
Troy, OH|40.039|-84.203
Twinsburg, OH|41.313|-81.440
Wadsworth, OH|41.026|-81.730
Warren, OH|41.238|-80.818
Westerville, OH|40.126|-82.929
Westlake, OH|41.455|-81.918
Willoughby, OH|41.640|-81.406
Wooster, OH|40.805|-81.936
Youngstown, OH|41.100|-80.650
Abington, PA|40.121|-75.118
Allentown, PA|40.608|-75.490
Allison Park, PA|40.560|-79.959
Altoona, PA|40.519|-78.395
Back Mountain, PA|41.336|-75.996
Baldwin, PA|40.338|-79.979
Bensalem, PA|40.105|-74.951
Bethel Park, PA|40.328|-80.040
Bethlehem, PA|40.626|-75.370
Bustleton, PA|40.083|-75.032
Carlisle, PA|40.201|-77.189
Easton, PA|40.688|-75.221
Erie, PA|42.129|-80.085
Fox Chase, PA|40.081|-75.080
Frankford, PA|40.014|-75.079
Harrisburg, PA|40.274|-76.884
Hazleton, PA|40.958|-75.975
Hermitage, PA|41.233|-80.449
Holmesburg, PA|40.041|-75.028
Hunting Park, PA|40.017|-75.144
Johnstown, PA|40.327|-78.922
Juniata Park, PA|40.008|-75.109
King of Prussia, PA|40.089|-75.396
Lancaster, PA|40.038|-76.306
Lansdale, PA|40.242|-75.284
Lawndale, PA|40.050|-75.092
Lebanon, PA|40.341|-76.411
Levittown, PA|40.155|-74.829
Limerick, PA|40.231|-75.522
Logan, PA|40.028|-75.152
McKeesport, PA|40.348|-79.864
Monroeville, PA|40.421|-79.788
Mount Lebanon, PA|40.355|-80.049
Murrysville, PA|40.428|-79.698
New Castle, PA|41.004|-80.347
Nicetown-Tioga, PA|40.010|-75.164
Norristown, PA|40.121|-75.340
Olney, PA|40.041|-75.124
Oxford Circle, PA|40.050|-75.072
Parkwood Manor, PA|40.093|-74.968
Penn Hills, PA|40.501|-79.839
Phoenixville, PA|40.130|-75.515
Pittsburgh, PA|40.441|-79.996
Plum, PA|40.500|-79.749
Pottstown, PA|40.245|-75.650
Radnor, PA|40.046|-75.360
Reading, PA|40.336|-75.927
Rhawnhurst, PA|40.062|-75.056
Scranton, PA|41.409|-75.665
Somerton, PA|40.123|-75.015
State College, PA|40.793|-77.860
Tacony, PA|40.031|-75.044
Upper Saint Clair, PA|40.336|-80.083
Wayne, PA|40.044|-75.388
West Mifflin, PA|40.363|-79.866
West Oak Lane, PA|40.069|-75.166
Whitehall Township, PA|40.667|-75.500
Wilkes-Barre, PA|41.246|-75.881
Wilkinsburg, PA|40.442|-79.882
Williamsport, PA|41.241|-77.001
Willow Grove, PA|40.144|-75.116
Wissinoming, PA|40.022|-75.063
Barrington, RI|41.741|-71.309
Bristol, RI|41.677|-71.266
Central Falls, RI|41.891|-71.392
Coventry, RI|41.700|-71.683
Cranston, RI|41.780|-71.437
Cumberland, RI|41.967|-71.433
East Providence, RI|41.814|-71.370
Middletown, RI|41.546|-71.291
Narragansett, RI|41.450|-71.450
Newport, RI|41.490|-71.313
North Kingstown, RI|41.550|-71.466
North Providence, RI|41.850|-71.466
Pawtucket, RI|41.879|-71.383
Portsmouth, RI|41.602|-71.250
Providence, RI|41.824|-71.413
Smithfield, RI|41.922|-71.550
Warwick, RI|41.700|-71.416
West Warwick, RI|41.697|-71.522
Westerly, RI|41.378|-71.827
Woonsocket, RI|42.003|-71.515
Aberdeen, SD|45.465|-98.486
Brookings, SD|44.311|-96.798
Mitchell, SD|43.709|-98.030
Sioux Falls, SD|43.544|-96.728
Watertown, SD|44.899|-97.115
Burlington, VT|44.476|-73.212
Colchester, VT|44.544|-73.148
Rutland, VT|43.611|-72.973
South Burlington, VT|44.467|-73.171
Appleton, WI|44.262|-88.415
Ashwaubenon, WI|44.482|-88.070
Beaver Dam, WI|43.458|-88.837
Bellevue, WI|44.444|-87.920
Beloit, WI|42.508|-89.032
Brookfield, WI|43.061|-88.106
Caledonia, WI|42.808|-87.924
Cudahy, WI|42.960|-87.861
De Pere, WI|44.449|-88.060
Eau Claire, WI|44.811|-91.498
Fitchburg, WI|42.961|-89.470
Fond du Lac, WI|43.775|-88.439
Franklin, WI|42.889|-88.038
Germantown, WI|43.229|-88.110
Green Bay, WI|44.519|-88.020
Greenfield, WI|42.961|-88.013
Howard, WI|44.544|-88.088
Janesville, WI|42.683|-89.019
Kaukauna, WI|44.278|-88.272
Kenosha, WI|42.585|-87.821
La Crosse, WI|43.801|-91.240
Madison, WI|43.073|-89.401
Manitowoc, WI|44.089|-87.658
Marshfield, WI|44.669|-90.172
Menasha, WI|44.202|-88.447
Menomonee Falls, WI|43.179|-88.117
Menomonie, WI|44.876|-91.919
Mequon, WI|43.216|-88.030
Middleton, WI|43.097|-89.504
Milwaukee, WI|43.039|-87.906
Muskego, WI|42.906|-88.139
Neenah, WI|44.186|-88.463
New Berlin, WI|42.976|-88.108
North La Crosse, WI|43.846|-91.248
Oak Creek, WI|42.886|-87.863
Oconomowoc, WI|43.112|-88.499
Onalaska, WI|43.884|-91.235
Oshkosh, WI|44.025|-88.543
Pleasant Prairie, WI|42.553|-87.933
Racine, WI|42.726|-87.783
River Falls, WI|44.861|-92.624
Sheboygan, WI|43.751|-87.715
South Milwaukee, WI|42.911|-87.861
Stevens Point, WI|44.524|-89.575
Sun Prairie, WI|43.184|-89.214
Superior, WI|46.721|-92.104
Watertown, WI|43.195|-88.729
Waukesha, WI|43.012|-88.231
Wausau, WI|44.959|-89.630
Wauwatosa, WI|43.049|-88.008
West Allis, WI|43.017|-88.007
West Bend, WI|43.425|-88.183
Weston, WI|44.891|-89.548
Wisconsin Rapids, WI|44.384|-89.817
Weirton, WV|40.419|-80.590
Weirton Heights, WV|40.408|-80.539
Wheeling, WV|40.064|-80.721
Ansonia, CT|41.346|-73.079
Avon, CT|41.810|-72.831
Bloomfield, CT|41.826|-72.730
Bridgeport, CT|41.179|-73.189
Bristol, CT|41.672|-72.949
Branford, CT|41.280|-72.815
Cheshire, CT|41.499|-72.901
Fillmore, CA|34.399|-118.918
Buckeye, AZ|33.370|-112.584
Bullhead City, AZ|35.148|-114.568
Casa Grande, AZ|32.880|-111.757
Casas Adobes, AZ|32.323|-110.995
Catalina Foothills, AZ|32.298|-110.919
Chandler, AZ|33.306|-111.841
Deer Valley, AZ|33.684|-112.135
Douglas, AZ|31.345|-109.545
Drexel Heights, AZ|32.141|-111.028
El Mirage, AZ|33.613|-112.325
Eloy, AZ|32.756|-111.555
Flagstaff, AZ|35.198|-111.651
Florence, AZ|33.031|-111.387
Flowing Wells, AZ|32.294|-111.010
Fortuna Foothills, AZ|32.658|-114.412
Fountain Hills, AZ|33.612|-111.717
Gilbert, AZ|33.353|-111.789
Glendale, AZ|33.539|-112.186
Goodyear, AZ|33.435|-112.358
Green Valley, AZ|31.854|-110.994
Kingman, AZ|35.189|-114.053
Lake Havasu City, AZ|34.484|-114.322
Marana, AZ|32.437|-111.225
Maricopa, AZ|33.058|-112.048
Maryvale, AZ|33.502|-112.178
Mesa, AZ|33.422|-111.823
Nogales, AZ|31.340|-110.934
Oro Valley, AZ|32.391|-110.966
Payson, AZ|34.231|-111.325
Peoria, AZ|33.581|-112.237
Phoenix, AZ|33.448|-112.074
Prescott, AZ|34.540|-112.469
Prescott Valley, AZ|34.610|-112.316
Queen Creek, AZ|33.249|-111.634
Rio Rico, AZ|31.471|-110.976
Sahuarita, AZ|31.958|-110.956
San Luis, AZ|32.487|-114.782
Scottsdale, AZ|33.509|-111.899
Sierra Vista, AZ|31.555|-110.304
Somerton, AZ|32.596|-114.710
Sun City, AZ|33.598|-112.272
Sun City West, AZ|33.662|-112.341
Surprise, AZ|33.631|-112.333
Tanque Verde, AZ|32.252|-110.737
Tempe, AZ|33.415|-111.909
Tempe Junction, AZ|33.414|-111.943
Tucson, AZ|32.222|-110.926
Yuma, AZ|32.725|-114.624
Adelanto, CA|34.583|-117.409
Agoura, CA|34.143|-118.738
Agoura Hills, CA|34.136|-118.775
Agua Caliente, CA|38.324|-122.488
Alameda, CA|37.771|-122.261
Albany, CA|37.887|-122.298
Alhambra, CA|34.095|-118.127
Aliso Viejo, CA|33.565|-117.727
Altadena, CA|34.190|-118.131
Alum Rock, CA|37.366|-121.827
American Canyon, CA|38.175|-122.261
Anaheim, CA|33.835|-117.915
Antelope, CA|38.708|-121.330
Antioch, CA|38.005|-121.806
Apple Valley, CA|34.501|-117.186
Arcadia, CA|34.140|-118.035
Arroyo Grande, CA|35.119|-120.591
Artesia, CA|33.866|-118.083
Arvin, CA|35.209|-118.828
Ashland, CA|37.695|-122.114
Atascadero, CA|35.489|-120.671
Atwater Village, CA|34.116|-118.256
Atwater, CA|37.348|-120.609
Avocado Heights, CA|34.036|-117.991
Azusa, CA|34.134|-117.908
Bakersfield, CA|35.373|-119.019
Baldwin Park, CA|34.085|-117.961
Banning, CA|33.926|-116.876
Barstow, CA|34.899|-117.023
Barstow Heights, CA|34.870|-117.056
Bay Point, CA|38.029|-121.962
Beaumont, CA|33.929|-116.977
Bell, CA|33.978|-118.187
Bell Gardens, CA|33.965|-118.151
Bellflower, CA|33.882|-118.117
Belmont, CA|37.520|-122.276
Benicia, CA|38.049|-122.159
Berkeley, CA|37.872|-122.273
Beverly Hills, CA|34.074|-118.400
Bloomington, CA|34.070|-117.396
Blythe, CA|33.610|-114.596
Bostonia, CA|32.813|-116.944
Boyle Heights, CA|34.034|-118.205
Brawley, CA|32.979|-115.530
Brea, CA|33.917|-117.900
Brentwood, CA|37.932|-121.696
Brentwood, CA|34.052|-118.474
Buena Park, CA|33.868|-117.998
Burbank, CA|34.181|-118.309
Burlingame, CA|37.584|-122.366
Calabasas, CA|34.158|-118.638
Calexico, CA|32.679|-115.499
Camarillo, CA|34.216|-119.038
Cameron Park, CA|38.669|-120.987
Campbell, CA|37.287|-121.950
Canoga Park, CA|34.201|-118.598
Canyon Country, CA|34.423|-118.472
Carlsbad, CA|33.158|-117.351
Carmichael, CA|38.617|-121.328
Carson, CA|33.831|-118.282
Castaic, CA|34.489|-118.623
Castro Valley, CA|37.694|-122.086
Cathedral City, CA|33.780|-116.465
Ceres, CA|37.595|-120.958
Cerritos, CA|33.858|-118.065
Chatsworth, CA|34.257|-118.601
Chico, CA|39.728|-121.837
Chinatown, CA|37.797|-122.409
Chino, CA|34.012|-117.689
Chino Hills, CA|33.994|-117.759
Chowchilla, CA|37.123|-120.260
Chula Vista, CA|32.640|-117.084
Citrus Heights, CA|38.707|-121.281
Claremont, CA|34.097|-117.720
Clearlake, CA|38.958|-122.626
Clovis, CA|36.825|-119.703
Coachella, CA|33.680|-116.174
Coalinga, CA|36.140|-120.360
Colton, CA|34.074|-117.314
Compton, CA|33.896|-118.220
Concord, CA|37.978|-122.031
Corcoran, CA|36.098|-119.560
Corona, CA|33.875|-117.566
Coronado, CA|32.686|-117.183
Costa Mesa, CA|33.641|-117.919
Covina, CA|34.090|-117.890
Cudahy, CA|33.961|-118.185
Culver City, CA|34.021|-118.396
Cupertino, CA|37.323|-122.032
Cypress, CA|33.817|-118.037
Daly City, CA|37.706|-122.462
Dana Point, CA|33.467|-117.698
Danville, CA|37.822|-122.000
Davis, CA|38.545|-121.741
Delano, CA|35.769|-119.247
Desert Hot Springs, CA|33.962|-116.504
Diamond Bar, CA|34.029|-117.810
Dinuba, CA|36.543|-119.387
Dixon, CA|38.445|-121.823
Downey, CA|33.940|-118.133
Duarte, CA|34.139|-117.977
Dublin, CA|37.702|-121.936
East Rancho Dominguez, CA|33.898|-118.195
East Hemet, CA|33.740|-116.939
East Los Angeles, CA|34.024|-118.172
East Palo Alto, CA|37.469|-122.141
El Cajon, CA|32.795|-116.963
El Centro, CA|32.792|-115.563
El Cerrito, CA|37.916|-122.312
El Dorado Hills, CA|38.686|-121.082
El Monte, CA|34.069|-118.028
El Segundo, CA|33.919|-118.416
Elk Grove, CA|38.409|-121.372
Encinitas, CA|33.037|-117.292
Encino, CA|34.159|-118.501
Escondido, CA|33.119|-117.086
Fair Oaks, CA|38.645|-121.272
Fairfield, CA|38.249|-122.040
Fallbrook, CA|33.376|-117.251
Florin, CA|38.496|-121.409
Folsom, CA|38.678|-121.176
Fontana, CA|34.092|-117.435
Foothill Farms, CA|38.679|-121.351
Foster City, CA|37.559|-122.271
Fountain Valley, CA|33.709|-117.954
Fremont, CA|37.548|-121.989
Fresno, CA|36.748|-119.772
Fullerton, CA|33.870|-117.925
Galt, CA|38.255|-121.300
Garden Grove, CA|33.774|-117.941
Gardena, CA|33.888|-118.309
Gilroy, CA|37.006|-121.568
Glen Avon, CA|34.012|-117.485
Glendale, CA|34.143|-118.255
Glendora, CA|34.136|-117.865
Goleta, CA|34.436|-119.828
Granite Bay, CA|38.763|-121.164
Greenfield, CA|36.321|-121.244
Hacienda Heights, CA|33.993|-117.969
Hanford, CA|36.327|-119.646
Hawthorne, CA|33.916|-118.353
Hayward, CA|37.669|-122.081
Hemet, CA|33.748|-116.973
Hercules, CA|38.017|-122.289
Hermosa Beach, CA|33.862|-118.400
Hesperia, CA|34.426|-117.301
Highland, CA|34.128|-117.209
Hollister, CA|36.852|-121.402
Hollywood, CA|34.098|-118.327
Huntington Beach, CA|33.660|-117.999
Huntington Park, CA|33.982|-118.225
Imperial, CA|32.848|-115.569
Imperial Beach, CA|32.584|-117.113
Indio, CA|33.721|-116.217
Inglewood, CA|33.962|-118.353
Irvine, CA|33.669|-117.823
Isla Vista, CA|34.413|-119.861
Koreatown, CA|34.058|-118.301
La Canada Flintridge, CA|34.199|-118.188
La Habra, CA|33.932|-117.946
La Jolla, CA|32.847|-117.274
La Mesa, CA|32.768|-117.023
La Mirada, CA|33.917|-118.012
La Palma, CA|33.846|-118.047
La Presa, CA|32.708|-116.997
La Puente, CA|34.020|-117.950
La Quinta, CA|33.663|-116.310
La Verne, CA|34.101|-117.768
Ladera Ranch, CA|33.571|-117.636
Lafayette, CA|37.886|-122.118
Laguna, CA|38.421|-121.424
Laguna Beach, CA|33.542|-117.783
Laguna Hills, CA|33.613|-117.713
Laguna Niguel, CA|33.523|-117.708
Laguna Woods, CA|33.610|-117.725
Lake Elsinore, CA|33.668|-117.327
Lake Forest, CA|33.647|-117.689
Lakeside, CA|32.857|-116.922
Lakewood, CA|33.854|-118.134
Lamont, CA|35.260|-118.914
Lancaster, CA|34.698|-118.137
Lathrop, CA|37.823|-121.277
Lawndale, CA|33.887|-118.353
Lemon Grove, CA|32.743|-117.031
Lemoore, CA|36.301|-119.783
Lennox, CA|33.938|-118.353
Lincoln, CA|38.892|-121.293
Linda, CA|39.128|-121.551
Live Oak, CA|36.984|-121.981
Livermore, CA|37.682|-121.768
Lodi, CA|38.130|-121.272
Loma Linda, CA|34.048|-117.261
Lomita, CA|33.792|-118.315
Lompoc, CA|34.639|-120.458
Long Beach, CA|33.767|-118.189
Los Altos, CA|37.385|-122.114
Los Angeles, CA|34.052|-118.244
Los Banos, CA|37.058|-120.850
Los Gatos, CA|37.227|-121.975
Lynwood, CA|33.930|-118.211
Madera, CA|36.961|-120.061
Manhattan Beach, CA|33.885|-118.411
Manteca, CA|37.797|-121.216
Marina, CA|36.684|-121.802
Martinez, CA|38.019|-122.134
Maywood, CA|33.987|-118.185
Mead Valley, CA|33.833|-117.296
Menifee, CA|33.728|-117.146
Menlo Park, CA|37.454|-122.182
Merced, CA|37.302|-120.483
Millbrae, CA|37.599|-122.387
Milpitas, CA|37.428|-121.907
Jurupa Valley, CA|33.993|-117.516
Mira Mesa, CA|32.916|-117.144
Mission District, CA|37.760|-122.419
Mission Viejo, CA|33.600|-117.672
Modesto, CA|37.639|-120.997
Monrovia, CA|34.148|-117.999
Montclair, CA|34.078|-117.690
Montebello, CA|34.009|-118.105
Monterey, CA|36.600|-121.895
Monterey Park, CA|34.063|-118.123
Moorpark, CA|34.286|-118.882
Moraga, CA|37.835|-122.130
Moreno Valley, CA|33.938|-117.231
Morgan Hill, CA|37.130|-121.654
Mountain View, CA|37.386|-122.084
Murrieta, CA|33.554|-117.214
Napa, CA|38.297|-122.286
National City, CA|32.678|-117.099
Newark, CA|37.530|-122.040
Newport Beach, CA|33.619|-117.929
Nipomo, CA|35.043|-120.476
Norco, CA|33.931|-117.549
North Highlands, CA|38.686|-121.372
North Hollywood, CA|34.172|-118.379
Northridge, CA|34.228|-118.537
Norwalk, CA|33.902|-118.082
Novato, CA|38.107|-122.570
Oakdale, CA|37.767|-120.847
Oakland, CA|37.804|-122.271
Oakley, CA|37.997|-121.712
Oceanside, CA|33.196|-117.379
Oildale, CA|35.420|-119.020
Ontario, CA|34.063|-117.651
Orange, CA|33.788|-117.853
Orangevale, CA|38.679|-121.226
Orcutt, CA|34.865|-120.436
Orinda, CA|37.877|-122.180
Oroville, CA|39.514|-121.558
Oxnard, CA|34.197|-119.177
Pacific Palisades, CA|34.048|-118.526
Pacifica, CA|37.614|-122.487
Pacific Grove, CA|36.618|-121.917
Palm Desert, CA|33.723|-116.377
Palm Springs, CA|33.830|-116.545
Palmdale, CA|34.579|-118.116
Palo Alto, CA|37.442|-122.143
Paradise, CA|39.760|-121.622
Paramount, CA|33.889|-118.160
Parlier, CA|36.612|-119.527
Pasadena, CA|34.148|-118.145
Paso Robles, CA|35.627|-120.691
Patterson, CA|37.472|-121.130
Perris, CA|33.783|-117.229
Petaluma, CA|38.232|-122.637
Pico Rivera, CA|33.983|-118.097
Pinole, CA|38.004|-122.299
Pittsburg, CA|38.028|-121.885
Placentia, CA|33.872|-117.870
Pleasant Hill, CA|37.948|-122.061
Pleasanton, CA|37.662|-121.875
Pomona, CA|34.055|-117.752
Port Hueneme, CA|34.148|-119.195
Porterville, CA|36.065|-119.017
Poway, CA|32.963|-117.036
Prunedale, CA|36.776|-121.670
Ramona, CA|33.042|-116.868
Rancho Cordova, CA|38.589|-121.303
Rancho Cucamonga, CA|34.106|-117.593
Rancho Mirage, CA|33.740|-116.413
Rancho Palos Verdes, CA|33.744|-118.387
Rancho Penasquitos, CA|32.959|-117.115
Rancho San Diego, CA|32.747|-116.935
Rancho Santa Margarita, CA|33.641|-117.603
Redlands, CA|34.056|-117.183
Redondo Beach, CA|33.849|-118.388
Redwood City, CA|37.485|-122.236
Reedley, CA|36.596|-119.450
Reseda, CA|34.201|-118.536
Rialto, CA|34.106|-117.370
Richmond, CA|37.936|-122.348
Ridgecrest, CA|35.622|-117.671
Rio Linda, CA|38.691|-121.449
Ripon, CA|37.742|-121.124
Riverbank, CA|37.736|-120.935
Riverside, CA|33.953|-117.396
Rocklin, CA|38.791|-121.236
Rohnert Park, CA|38.340|-122.701
Rosamond, CA|34.864|-118.163
Rosemead, CA|34.081|-118.073
Rosemont, CA|38.552|-121.365
Roseville, CA|38.752|-121.288
Rowland Heights, CA|33.976|-117.905
Rubidoux, CA|33.996|-117.406
Sacramento, CA|38.582|-121.494
Salinas, CA|36.678|-121.656
San Bernardino, CA|34.108|-117.290
San Bruno, CA|37.630|-122.411
San Carlos, CA|37.507|-122.261
San Clemente, CA|33.427|-117.612
San Diego, CA|32.716|-117.165
San Dimas, CA|34.107|-117.807
San Fernando, CA|34.282|-118.439
San Francisco, CA|37.775|-122.419
San Gabriel, CA|34.096|-118.106
San Jacinto, CA|33.784|-116.959
San Jose, CA|37.339|-121.895
San Juan Capistrano, CA|33.502|-117.663
San Leandro, CA|37.725|-122.156
San Lorenzo, CA|37.674|-122.133
San Luis Obispo, CA|35.283|-120.660
San Marcos, CA|33.143|-117.166
San Mateo, CA|37.563|-122.326
San Pablo, CA|37.962|-122.346
San Pedro, CA|33.736|-118.292
San Rafael, CA|37.974|-122.531
San Ramon, CA|37.780|-121.978
Sanger, CA|36.708|-119.556
Santa Ana, CA|33.746|-117.868
Santa Barbara, CA|34.421|-119.698
Santa Clara, CA|37.354|-121.955
Santa Clarita, CA|34.392|-118.543
Santa Cruz, CA|36.974|-122.031
Santa Fe Springs, CA|33.947|-118.085
Santa Maria, CA|34.953|-120.436
Santa Monica, CA|34.019|-118.491
Santa Paula, CA|34.354|-119.059
Santa Rosa, CA|38.440|-122.714
Santee, CA|32.838|-116.974
Saratoga, CA|37.264|-122.023
Sawtelle, CA|34.036|-118.449
Seal Beach, CA|33.741|-118.105
Seaside, CA|36.611|-121.852
Selma, CA|36.571|-119.612
North Hills, CA|34.236|-118.485
Shafter, CA|35.501|-119.272
Sherman Oaks, CA|34.151|-118.449
Simi Valley, CA|34.269|-118.781
Soledad, CA|36.425|-121.326
South El Monte, CA|34.052|-118.047
South Gate, CA|33.955|-118.212
South Lake Tahoe, CA|38.933|-119.984
South Pasadena, CA|34.116|-118.150
South San Francisco, CA|37.655|-122.408
South San Jose Hills, CA|34.013|-117.905
South Whittier, CA|33.950|-118.039
South Yuba City, CA|39.117|-121.639
Spring Valley, CA|32.745|-116.999
Stanton, CA|33.803|-117.993
Stockton, CA|37.958|-121.291
Studio City, CA|34.149|-118.396
Suisun, CA|38.238|-122.040
Sun City, CA|33.709|-117.197
Sunland, CA|34.267|-118.302
Sunnyvale, CA|37.369|-122.036
Sylmar, CA|34.308|-118.449
Temecula, CA|33.494|-117.148
Temple City, CA|34.107|-118.058
Thousand Oaks, CA|34.171|-118.838
Torrance, CA|33.836|-118.341
Tracy, CA|37.740|-121.426
Truckee, CA|39.328|-120.183
Tujunga, CA|34.252|-118.288
Tulare, CA|36.208|-119.347
Turlock, CA|37.495|-120.847
Tustin, CA|33.746|-117.826
North Tustin, CA|33.764|-117.794
Twentynine Palms, CA|34.136|-116.054
Ukiah, CA|39.150|-123.208
Union City, CA|37.596|-122.019
Universal City, CA|34.139|-118.353
Upland, CA|34.098|-117.648
Vacaville, CA|38.357|-121.988
Valencia, CA|34.444|-118.610
Valinda, CA|34.045|-117.944
Vallejo, CA|38.104|-122.257
Van Nuys, CA|34.187|-118.449
Venice, CA|33.991|-118.460
Ventura, CA|34.278|-119.293
Victorville, CA|34.536|-117.291
Vincent, CA|34.501|-118.116
Visalia, CA|36.330|-119.292
Vista, CA|33.200|-117.243
Walnut, CA|34.020|-117.865
Walnut Creek, CA|37.906|-122.065
Walnut Park, CA|33.968|-118.225
Watsonville, CA|36.910|-121.757
West Carson, CA|33.822|-118.293
West Covina, CA|34.069|-117.939
West Hollywood, CA|34.090|-118.362
West Puente Valley, CA|34.052|-117.968
West Sacramento, CA|38.580|-121.530
Westminster, CA|33.759|-118.007
Westmont, CA|33.941|-118.302
Whittier, CA|33.979|-118.033
Wildomar, CA|33.599|-117.280
Willowbrook, CA|33.917|-118.255
Wilmington, CA|33.780|-118.263
Windsor, CA|38.547|-122.816
Winnetka, CA|34.213|-118.572
Winter Gardens, CA|32.831|-116.933
Woodland, CA|38.679|-121.773
Woodland Hills, CA|34.168|-118.606
Yorba Linda, CA|33.889|-117.813
Yuba City, CA|39.140|-121.617
Yucaipa, CA|34.034|-117.043
Yucca Valley, CA|34.114|-116.432
Arvada, CO|39.803|-105.087
Aurora, CO|39.729|-104.832
Brighton, CO|39.985|-104.821
Broomfield, CO|39.921|-105.087
Canon City, CO|38.441|-105.242
Castle Rock, CO|39.372|-104.856
Castlewood, CO|39.585|-104.901
Centennial, CO|39.579|-104.877
Cimarron Hills, CO|38.859|-104.699
Clifton, CO|39.092|-108.449
Colorado Springs, CO|38.834|-104.821
Columbine, CO|39.588|-105.069
Commerce City, CO|39.808|-104.934
Denver, CO|39.739|-104.985
Durango, CO|37.275|-107.880
Englewood, CO|39.648|-104.988
Fountain, CO|38.682|-104.701
Golden, CO|39.756|-105.221
Grand Junction, CO|39.064|-108.551
Greenwood Village, CO|39.617|-104.951
Highlands Ranch, CO|39.554|-104.969
Ken Caryl, CO|39.576|-105.112
Lafayette, CO|39.994|-105.090
Lakewood, CO|39.705|-105.081
Littleton, CO|39.613|-105.017
Louisville, CO|39.978|-105.132
Montrose, CO|38.478|-107.876
Northglenn, CO|39.886|-104.987
Parker, CO|39.519|-104.761
Pueblo, CO|38.254|-104.609
Pueblo West, CO|38.350|-104.723
Sherrelwood, CO|39.838|-105.001
Southglenn, CO|39.587|-104.953
Thornton, CO|39.868|-104.972
Westminster, CO|39.837|-105.037
Wheat Ridge, CO|39.766|-105.077
Dodge City, KS|37.753|-100.017
Garden City, KS|37.972|-100.873
Liberal, KS|37.043|-100.921
Alamogordo, NM|32.900|-105.960
Albuquerque, NM|35.084|-106.651
Carlsbad, NM|32.421|-104.229
Clovis, NM|34.405|-103.205
Farmington, NM|36.728|-108.219
Gallup, NM|35.528|-108.743
Hobbs, NM|32.703|-103.136
Las Cruces, NM|32.312|-106.778
Los Lunas, NM|34.806|-106.733
Rio Rancho, NM|35.233|-106.664
Roswell, NM|33.394|-104.525
Santa Fe, NM|35.687|-105.938
South Valley, NM|35.010|-106.678
Sunland Park, NM|31.797|-106.580
Boulder City, NV|35.979|-114.832
Carson City, NV|39.164|-119.767
Enterprise, NV|36.025|-115.242
Fernley, NV|39.608|-119.252
Henderson, NV|36.040|-114.982
Las Vegas, NV|36.175|-115.137
Mesquite, NV|36.806|-114.067
North Las Vegas, NV|36.199|-115.118
Pahrump, NV|36.208|-115.984
Paradise, NV|36.097|-115.147
Reno, NV|39.530|-119.814
Spanish Springs, NV|39.649|-119.707
Sparks, NV|39.535|-119.753
Spring Valley, NV|36.108|-115.245
Sun Valley, NV|39.596|-119.776
Sunrise Manor, NV|36.211|-115.073
Whitney, NV|36.098|-115.036
Winchester, NV|36.130|-115.119
Amarillo, TX|35.222|-101.831
Big Spring, TX|32.250|-101.479
Del Rio, TX|29.363|-100.897
Dumas, TX|35.866|-101.973
Eagle Pass, TX|28.709|-100.500
El Paso, TX|31.759|-106.487
Hereford, TX|34.815|-102.399
Horizon City, TX|31.693|-106.207
Lubbock, TX|33.578|-101.855
Midland, TX|31.997|-102.078
Odessa, TX|31.846|-102.368
Pampa, TX|35.536|-100.960
Plainview, TX|34.185|-101.707
San Angelo, TX|31.464|-100.437
Socorro, TX|31.655|-106.303
Socorro Mission Number 1 Colonia, TX|31.636|-106.291
West Odessa, TX|31.842|-102.499
Cedar City, UT|37.677|-113.062
Hurricane, UT|37.175|-113.290
Saint George, UT|37.104|-113.584
Washington, UT|37.131|-113.508
Wasco, CA|35.594|-119.341
Alhambra, AZ|33.498|-112.134
Anthem, AZ|33.860|-112.112
Apache Junction, AZ|33.415|-111.550
Avondale, AZ|33.436|-112.350
Ahwatukee Foothills, AZ|33.342|-111.984
Juneau, AK|58.302|-134.420
Arcata, CA|40.867|-124.083
Bayside, CA|40.842|-124.064
Eureka, CA|40.802|-124.164
McKinleyville, CA|40.947|-124.101
Redding, CA|40.587|-122.392
Susanville, CA|40.416|-120.653
Boulder, CO|40.015|-105.271
Erie, CO|40.050|-105.050
Evans, CO|40.376|-104.692
Fort Collins, CO|40.585|-105.084
Greeley, CO|40.423|-104.709
Longmont, CO|40.167|-105.102
Loveland, CO|40.398|-105.075
Windsor, CO|40.477|-104.901
Boise, ID|43.614|-116.203
Caldwell, ID|43.663|-116.687
Coeur dAlene, ID|47.678|-116.780
Conda, ID|42.728|-111.532
Eagle, ID|43.695|-116.354
Idaho Falls, ID|43.467|-112.034
Kuna, ID|43.492|-116.420
Lewiston, ID|46.417|-117.018
Lewiston Orchards, ID|46.380|-116.975
Meridian, ID|43.612|-116.392
Moscow, ID|46.732|-117.000
Nampa, ID|43.541|-116.563
Pocatello, ID|42.871|-112.446
Post Falls, ID|47.718|-116.952
Rexburg, ID|43.826|-111.790
Twin Falls, ID|42.563|-114.461
Billings, MT|45.783|-108.501
Bozeman, MT|45.680|-111.039
Butte, MT|46.004|-112.535
Great Falls, MT|47.500|-111.301
Helena, MT|46.593|-112.036
Kalispell, MT|48.196|-114.313
Missoula, MT|46.872|-113.994
Bismarck, ND|46.808|-100.784
Dickinson, ND|46.879|-102.790
Mandan, ND|46.827|-100.890
Minot, ND|48.233|-101.296
Williston, ND|48.147|-103.618
North Platte, NE|41.124|-100.765
Elko, NV|40.832|-115.763
Albany, OR|44.637|-123.106
Aloha, OR|45.494|-122.867
Altamont, OR|42.207|-121.737
Ashland, OR|42.195|-122.709
Beaverton, OR|45.487|-122.804
Bend, OR|44.058|-121.315
Bethany, OR|45.558|-122.868
Canby, OR|45.263|-122.693
Central Point, OR|42.376|-122.916
Coos Bay, OR|43.367|-124.218
Corvallis, OR|44.565|-123.262
Dallas, OR|44.919|-123.317
Eugene, OR|44.052|-123.087
Forest Grove, OR|45.520|-123.111
Four Corners, OR|44.928|-122.984
Grants Pass, OR|42.439|-123.331
Gresham, OR|45.498|-122.431
Happy Valley, OR|45.447|-122.530
Hayesville, OR|44.986|-122.983
Hermiston, OR|45.840|-119.289
Hillsboro, OR|45.523|-122.990
Keizer, OR|44.990|-123.026
Klamath Falls, OR|42.225|-121.782
Lake Oswego, OR|45.421|-122.671
Lebanon, OR|44.537|-122.907
Lents, OR|45.480|-122.567
McMinnville, OR|45.210|-123.199
Medford, OR|42.327|-122.876
Milwaukie, OR|45.446|-122.639
Newberg, OR|45.300|-122.973
Oak Grove, OR|45.417|-122.640
Oregon City, OR|45.357|-122.607
Pendleton, OR|45.672|-118.789
Portland, OR|45.523|-122.676
Redmond, OR|44.273|-121.174
Roseburg, OR|43.217|-123.342
Salem, OR|44.943|-123.035
Sherwood, OR|45.357|-122.840
Springfield, OR|44.046|-123.022
The Dalles, OR|45.595|-121.179
Tigard, OR|45.431|-122.771
Troutdale, OR|45.539|-122.387
Tualatin, OR|45.384|-122.764
West Linn, OR|45.366|-122.612
Wilsonville, OR|45.300|-122.774
Woodburn, OR|45.144|-122.855
Rapid City, SD|44.081|-103.231
Bountiful, UT|40.889|-111.881
Brigham City, UT|41.510|-112.016
Centerville, UT|40.918|-111.872
Clearfield, UT|41.111|-112.026
Clinton, UT|41.140|-112.050
Cottonwood Heights, UT|40.620|-111.810
Draper, UT|40.525|-111.864
Eagle Mountain, UT|40.314|-112.007
East Millcreek, UT|40.700|-111.810
Farmington, UT|40.980|-111.887
Herriman, UT|40.514|-112.033
Highland, UT|40.425|-111.794
Holladay, UT|40.669|-111.825
Kaysville, UT|41.035|-111.939
Kearns, UT|40.660|-111.996
Layton, UT|41.060|-111.971
Lehi, UT|40.392|-111.851
Logan, UT|41.735|-111.834
Magna, UT|40.709|-112.102
Midvale, UT|40.611|-111.900
Millcreek, UT|40.687|-111.875
Murray, UT|40.667|-111.888
North Ogden, UT|41.307|-111.960
North Salt Lake, UT|40.849|-111.907
Ogden, UT|41.223|-111.974
Orem, UT|40.297|-111.695
Payson, UT|40.044|-111.732
Pleasant Grove, UT|40.364|-111.739
Provo, UT|40.234|-111.659
Riverton, UT|40.522|-111.939
Roy, UT|41.162|-112.026
Salt Lake City, UT|40.761|-111.891
Sandy, UT|40.592|-111.884
Sandy Hills, UT|40.581|-111.851
Saratoga Springs, UT|40.349|-111.905
South Jordan Heights, UT|40.564|-111.949
South Jordan, UT|40.562|-111.930
South Ogden, UT|41.192|-111.971
South Salt Lake, UT|40.719|-111.888
Spanish Fork, UT|40.115|-111.655
Springville, UT|40.165|-111.611
Syracuse, UT|41.089|-112.065
Taylorsville, UT|40.668|-111.939
Tooele, UT|40.531|-112.298
West Jordan, UT|40.610|-111.939
West Valley City, UT|40.692|-112.001
Aberdeen, WA|46.975|-123.816
Anacortes, WA|48.513|-122.613
Arlington, WA|48.199|-122.125
Auburn, WA|47.307|-122.228
Battle Ground, WA|45.781|-122.533
Bellevue, WA|47.610|-122.201
Bellingham, WA|48.760|-122.488
Bonney Lake, WA|47.177|-122.187
Bothell, WA|47.762|-122.205
Bremerton, WA|47.567|-122.633
Burien, WA|47.470|-122.347
Camas, WA|45.587|-122.400
Centralia, WA|46.716|-122.954
Columbia City, WA|47.564|-122.275
Cottage Lake, WA|47.744|-122.077
Covington, WA|47.358|-122.122
Des Moines, WA|47.402|-122.324
Edmonds, WA|47.811|-122.377
Ellensburg, WA|46.997|-120.548
Everett, WA|47.979|-122.202
Fairwood, WA|47.448|-122.157
Federal Way, WA|47.322|-122.313
Five Corners, WA|45.685|-122.575
Frederickson, WA|47.096|-122.359
Graham, WA|47.053|-122.294
Hazel Dell, WA|45.672|-122.663
Issaquah, WA|47.530|-122.033
Kenmore, WA|47.757|-122.244
Kennewick, WA|46.211|-119.137
Kent, WA|47.381|-122.235
Kirkland, WA|47.681|-122.209
Lacey, WA|47.034|-122.823
Lake Stevens, WA|48.015|-122.064
Lakewood, WA|47.172|-122.518
Longview, WA|46.138|-122.938
Lynnwood, WA|47.821|-122.315
Maple Valley, WA|47.393|-122.046
Martha Lake, WA|47.851|-122.239
Marysville, WA|48.052|-122.177
Mercer Island, WA|47.571|-122.222
Mill Creek, WA|47.860|-122.204
Monroe, WA|47.855|-121.971
Moses Lake, WA|47.130|-119.278
Mount Vernon, WA|48.421|-122.334
Mountlake Terrace, WA|47.788|-122.309
Mukilteo, WA|47.945|-122.305
North Creek, WA|47.820|-122.176
Oak Harbor, WA|48.293|-122.643
Olympia, WA|47.045|-122.902
Opportunity, WA|47.650|-117.240
Orchards, WA|45.667|-122.561
Parkland, WA|47.155|-122.434
Pasco, WA|46.240|-119.101
Port Angeles, WA|48.118|-123.431
Pullman, WA|46.731|-117.180
Puyallup, WA|47.185|-122.293
Redmond, WA|47.674|-122.122
Renton, WA|47.483|-122.217
Richland, WA|46.286|-119.284
Salmon Creek, WA|45.711|-122.649
Sammamish, WA|47.642|-122.080
SeaTac, WA|47.448|-122.292
Seattle, WA|47.606|-122.332
Shoreline, WA|47.756|-122.342
Silverdale, WA|47.645|-122.695
South Hill, WA|47.141|-122.270
Spanaway, WA|47.104|-122.435
Spokane, WA|47.660|-117.429
Spokane Valley, WA|47.673|-117.239
Sunnyside, WA|46.324|-120.009
Tacoma, WA|47.253|-122.444
Tukwila, WA|47.474|-122.261
Tumwater, WA|47.007|-122.909
University Place, WA|47.236|-122.550
Vancouver, WA|45.639|-122.661
Walla Walla, WA|46.065|-118.343
Washougal, WA|45.583|-122.353
Wenatchee, WA|47.423|-120.310
West Lake Sammamish, WA|47.578|-122.101
West Lake Stevens, WA|47.993|-122.102
Bainbridge Island, WA|47.626|-122.521
Yakima, WA|46.602|-120.506
Casper, WY|42.867|-106.313
Cheyenne, WY|41.140|-104.820
Gillette, WY|44.291|-105.502
Laramie, WY|41.311|-105.591
Rock Springs, WY|41.587|-109.203
Sheridan, WY|44.797|-106.956
American Fork, UT|40.377|-111.796
Kahului, HI|20.889|-156.473
Kailua, HI|21.402|-157.741
Kaimuki, HI|21.279|-157.801
Kalihi-Palama, HI|21.326|-157.876
Kaneohe, HI|21.400|-157.799
Diamond Head / Kapahulu / Saint Louis Heights, HI|21.277|-157.811
Kihei, HI|20.765|-156.446
Makakilo City, HI|21.347|-158.086
Mililani Town, HI|21.450|-158.015
Moiliili, HI|21.295|-157.830
Niu Valley, HI|21.284|-157.737
Pearl City, HI|21.397|-157.975
Wahiawa, HI|21.503|-158.025
Waikiki, HI|21.285|-157.836
Wailuku, HI|20.891|-156.506
Waipahu, HI|21.387|-158.009
Ewa Beach, HI|21.316|-158.007
Ewa Gentry, HI|21.340|-158.030
Hawaii Kai, HI|21.296|-157.702
Hilo, HI|19.730|-155.091
Honolulu, HI|21.307|-157.858
Eagle River, AK|61.321|-149.568
Fairbanks, AK|64.838|-147.716
Anchorage, AK|61.218|-149.900
Badger, AK|64.800|-147.533
Milton, GA|34.132|-84.301
Johns Creek, GA|34.029|-84.199
Cutler Bay, FL|25.578|-80.338
Manhattan Valley, NY|40.794|-73.965
Morningside Heights, NY|40.810|-73.963
East Harlem, NY|40.795|-73.942
Alafaya, FL|28.564|-81.211
West Village, NY|40.734|-74.009
Little Havana, FL|25.768|-80.233
Millburn, NJ|40.725|-74.304
Briarwood, NY|40.709|-73.815
Stevenson Ranch, CA|34.390|-118.574
Times Square, NY|40.756|-73.986
Fort Bragg, NC|35.139|-79.006
North Brunswick, NJ|40.454|-74.482
Kapolei, HI|21.336|-158.058
East Mount Airy, PA|40.065|-75.188
City of Milford (balance), CT|41.224|-73.062
City of Sammamish, WA|47.604|-122.038
Silver Firs, WA|47.866|-122.155
Vineyard, CA|38.464|-121.347
Gramercy Park, NY|40.737|-73.986
Kew Gardens Hills, NY|40.730|-73.823
Wallingford Center, CT|41.450|-72.819
Braintree, MA|42.204|-71.002
North Attleborough Center, MA|41.973|-71.325
Bel Air North, MD|39.554|-76.373
Bel Air South, MD|39.505|-76.320
Mercerville-Hamilton Square, NJ|40.231|-74.672
Oxon Hill-Glassmanor, MD|38.796|-76.975
Gates-North Gates, NY|43.165|-77.701
Greater Upper Marlboro, MD|38.831|-76.748
West Falls Church, VA|38.865|-77.188
Lanham-Seabrook, MD|38.968|-76.851
Lutherville-Timonium, MD|39.440|-76.611
Setauket-East Setauket, NY|40.931|-73.102
St. Charles, MD|38.607|-76.925
Suitland-Silver Hill, MD|38.847|-76.926
Fort Leonard Wood, MO|37.706|-92.157
Saginaw Township North, MI|43.460|-84.007
West Bloomfield Township, MI|42.569|-83.384
East Lake-Orient Park, FL|27.983|-82.379
Four Corners, FL|28.333|-81.647
Greater Northdale, FL|28.105|-82.526
Candler-McAfee, GA|33.727|-84.272
Sandalfoot Cove, FL|26.339|-80.187
University, FL|28.074|-82.439
Vero Beach South, FL|27.616|-80.413
Kendall West, FL|25.706|-80.439
Palm River-Clair Mel, FL|27.924|-82.379
Arden-Arcade, CA|38.602|-121.379
Bryn Mawr-Skyway, WA|47.494|-122.241
Casa de Oro-Mount Helix, CA|32.764|-116.969
Florence-Graham, CA|33.968|-118.244
Fort Cavazos, TX|31.135|-97.776
Inglewood-Finn Hill, WA|47.720|-122.232
La Crescenta-Montrose, CA|34.232|-118.235
East Hill-Meridian, WA|47.411|-122.174
Picnic Point-North Lynnwood, WA|47.863|-122.295
Security-Widefield, CO|38.747|-104.714
Union Hill-Novelty Hill, WA|47.679|-122.028
Vincent, CA|34.098|-117.924
West Whittier-Los Nietos, CA|33.976|-118.069
Summerlin South, NV|36.117|-115.330
Makakilo, HI|21.352|-158.087
Schofield Barracks, HI|21.498|-158.065
Tri-Cities, WA|46.245|-119.196
San Tan Valley, AZ|33.191|-111.528
Midway, FL|30.406|-87.006
Oakleaf Plantation, FL|30.171|-81.835
East Honolulu, HI|21.289|-157.717
Old Jamestown, MO|38.835|-90.285
Bothell West, WA|47.805|-122.241
Eastmont, WA|47.897|-122.182
Mill Creek East, WA|47.836|-122.188
Enchanted Hills, NM|35.337|-106.593
West Hills, CA|34.197|-118.644
Detroit-Shoreway, OH|41.478|-81.730
Clark-Fulton, OH|41.464|-81.710
The Acreage, FL|26.794|-80.267
Eastvale, CA|33.964|-117.564
Oak Hill, VA|38.926|-77.402
Bridgewater, NJ|40.601|-74.648
Warren Township, NJ|40.608|-74.518
Fairfield Heights, IN|39.829|-86.382
Chicago Loop, IL|41.884|-87.633
Greater Grand Crossing, IL|41.761|-87.615
Auburn Gresham, IL|41.742|-87.653
Financial District, NY|40.708|-74.009
Sunset Park, NY|40.645|-74.012
South Kingstown, RI|41.447|-71.525
Parkside, CA|37.742|-122.486
Noe Valley, CA|37.750|-122.434
Visitacion Valley, CA|37.717|-122.404
La Porte, IN|41.608|-86.714
Randolph, NJ|40.848|-74.581
Mount Pleasant, WI|42.697|-87.856
Northdale, FL|28.094|-82.506
Waterford, CT|41.342|-72.136
Meadowbrook, VA|37.449|-77.474
Lincoln, RI|41.921|-71.435
Fenway/Kenmore, MA|42.345|-71.100
Mission Hill, MA|42.334|-71.108
Johnston, RI|41.822|-71.507
Dixiana, AL|33.740|-86.649
Cranberry Township, PA|40.685|-80.107
Kuliouou - Kalani Iki, HI|21.297|-157.745
Manoa, HI|21.316|-157.804
Makiki / Lower Punchbowl / Tantalus, HI|21.318|-157.831
Kalihi Valley, HI|21.364|-157.843
Center City, PA|39.951|-75.159
Silver Lake, CA|34.087|-118.270
Echo Park, CA|34.078|-118.261
Ala Moana - Kakaako, HI|21.296|-157.857
Joint Base Pearl Harbor Hickam, HI|21.349|-157.947
McCully - Moiliili, HI|21.295|-157.831
Nuuanu - Punchbowl, HI|21.342|-157.829
Liliha - Kapalama, HI|21.337|-157.854
St. Johns, FL|30.081|-81.548
Stonecrest, GA|33.708|-84.135
Cortlandt Manor, NY|41.280|-73.872
Valley Glen, CA|34.186|-118.420
Encanto, AZ|33.479|-112.078
Central City, AZ|33.440|-112.058
Frankford, MD|39.329|-76.545
Bayview-Hunters Point, CA|37.729|-122.381
South Fulton, GA|33.593|-84.673
Woodbridge, CA|33.677|-117.794
Westpark, CA|33.685|-117.814
UC Irvine, CA|33.640|-117.842
El Camino Real, CA|33.697|-117.777
Stonegate, CA|33.705|-117.740
Northwood, CA|33.714|-117.761
Tustin Legacy, CA|33.700|-117.826
Aliamanu / Salt Lakes / Foster Village, HI|21.360|-157.918
Mililani Mauka / Launani Valley, HI|21.479|-157.988
Koolauloa, HI|21.606|-157.927
Makakilo / Kapolei / Honokai Hale, HI|21.337|-158.097
Vermont Square, CA|34.002|-118.299
Mid-City, CA|34.041|-118.361
Lower Moyamensing, PA|39.920|-75.165
Capitol Riverfront, DC|38.878|-77.003
Central 14th Street / Spring Road, DC|38.937|-77.033
Downtown DC, DC|38.894|-77.020
Golden Triangle, DC|38.905|-77.044
H Street NE, DC|38.900|-76.996
Kennedy Street, DC|38.956|-77.018
Mount Vernon Triangle, DC|38.902|-77.017
NoMa, DC|38.904|-77.006
Northwest One, DC|38.904|-77.012
Southwest Waterfront, DC|38.879|-77.018
The Trails of Frisco, TX|33.161|-96.872
Longfellow Community, MN|44.943|-93.226
Airport, HI|21.340|-157.928
Dakota Ridge, CO|39.616|-105.139
Waiau-Pacific Palisades, HI|21.400|-157.954
Ewa Gentry-West Loch, HI|21.353|-158.028
Ewa Beach-Iroquois Point, HI|21.315|-157.991
Kapolei Villages, HI|21.336|-158.067
Makakilo-Makaiwa Hills-Kunia, HI|21.367|-158.073
Mililani Mauka, HI|21.478|-157.995
Wahiawa-Whitmore, HI|21.506|-158.034
Schofield-Wheeler, HI|21.484|-158.047
Eagle Foothills, ID|43.740|-116.388
Young, UY|-32.698|-57.627
Trinidad, UY|-33.517|-56.900
Treinta y Tres, UY|-33.231|-54.386
Tacuarembo, UY|-31.719|-55.979
Santa Lucia, UY|-34.453|-56.391
San Jose de Mayo, UY|-34.339|-56.713
San Carlos, UY|-34.791|-54.918
Salto, UY|-31.388|-57.960
Rocha, UY|-34.480|-54.331
Rivera, UY|-30.905|-55.551
Progreso, UY|-34.667|-56.218
Paysandu, UY|-32.317|-58.081
Paso de Carrasco, UY|-34.860|-56.052
Pando, UY|-34.717|-55.958
Montevideo, UY|-34.903|-56.188
Minas, UY|-34.376|-55.238
Mercedes, UY|-33.252|-58.030
Melo, UY|-32.368|-54.164
Maldonado, UY|-34.898|-54.950
Las Piedras, UY|-34.730|-56.219
La Paz, UY|-34.760|-56.226
Fray Bentos, UY|-33.117|-58.311
Florida, UY|-34.100|-56.215
Durazno, UY|-33.381|-56.523
Dolores, UY|-33.530|-58.217
Delta del Tigre, UY|-34.765|-56.364
Colonia del Sacramento, UY|-34.463|-57.840
Carmelo, UY|-34.000|-58.284
Canelones, UY|-34.524|-56.282
Artigas, UY|-30.404|-56.469
Barros Blancos, UY|-34.752|-56.003
Nukus, UZ|42.459|59.606
Qunghirot, UZ|43.043|58.839
Xojayli Shahri, UZ|42.409|59.445
Oltinko`l, UZ|43.069|58.904
Zomin Shaharchasi, UZ|39.961|68.396
Urgut Shahri, UZ|39.419|67.261
Tirmiz, UZ|37.224|67.278
Shorchi, UZ|37.999|67.787
Shahrisabz, UZ|39.058|66.834
Samarkand, UZ|39.655|66.964
Qarshi, UZ|38.861|65.789
Muborak, UZ|39.255|65.153
Kitob, UZ|39.122|66.886
Kattaqorgon Shahri, UZ|39.905|66.266
Koson, UZ|39.038|65.585
Karakul, UZ|39.533|63.833
Kogon Shahri, UZ|39.727|64.555
Guzor, UZ|38.621|66.252
Juma Shahri, UZ|39.716|66.664
Denov, UZ|38.267|67.899
Chiroqchi, UZ|39.034|66.572
Chelak, UZ|39.920|66.862
Bulungur Shahri, UZ|39.760|67.274
Bukhara, UZ|39.770|64.431
Beshkent, UZ|38.821|65.653
Boysun, UZ|38.208|67.207
Oqtosh, UZ|39.921|65.925
Zafar, UZ|40.983|68.900
Yunusobod, UZ|41.371|69.279
Yaypan, UZ|40.376|70.816
Yangiyul, UZ|41.112|69.047
Yangiyer, UZ|40.275|68.823
Yangirabot, UZ|40.025|65.961
Yangiqo`rg`on, UZ|41.195|71.724
Yangiobod, UZ|41.119|70.094
Vobkent Shahri, UZ|40.000|64.502
Uychi, UZ|41.029|71.850
Urganch, UZ|41.552|60.631
Dashtobod, UZ|40.127|68.494
Uchqurghon Shahri, UZ|41.114|72.079
Uchkuduk, UZ|41.050|62.783
Tuytepa, UZ|41.032|69.363
Torqaorgon, UZ|41.000|71.512
Toshloq, UZ|40.477|71.768
Tashkent, UZ|41.265|69.216
Toshbuloq, UZ|40.916|71.578
Sirdaryo, UZ|40.844|68.662
Shovot, UZ|41.658|60.295
Shahrixon, UZ|40.713|72.057
Shofirkon Shahri, UZ|40.120|64.501
Salor, UZ|41.375|69.352
Rishton, UZ|40.357|71.285
Qoshkopir, UZ|41.533|60.347
Qoqon, UZ|40.529|70.942
Piskent, UZ|40.897|69.351
Poytug, UZ|40.898|72.245
Payshamba Shahri, UZ|40.011|66.231
Parkent, UZ|41.294|69.676
Pop, UZ|40.874|71.109
Paxtakor Shahri, UZ|40.312|67.957
Paxtaobod, UZ|40.929|72.497
Olmaliq, UZ|40.845|69.598
Ohangaron, UZ|40.906|69.638
Nurota, UZ|40.561|65.689
Novyy Turtkul, UZ|41.550|61.017
Navoiy, UZ|40.084|65.379
Namangan, UZ|40.998|71.673
Margilon, UZ|40.472|71.725
Manghit, UZ|42.116|60.060
Asaka, UZ|40.642|72.239
Quvasoy, UZ|40.297|71.980
Qo`rg`ontepa, UZ|40.732|72.762
Kirguli, UZ|40.436|71.767
Qibray, UZ|41.390|69.465
Xonobod, UZ|40.803|72.975
Xojaobod, UZ|40.669|72.560
Xiva, UZ|41.386|60.364
Haqqulobod, UZ|40.917|72.117
Kosonsoy, UZ|41.249|71.547
Jizzax, UZ|40.134|67.830
Iskandar, UZ|41.554|69.701
Qorasuv, UZ|40.728|72.886
Hazorasp, UZ|41.319|61.074
Gurlan, UZ|41.841|60.393
Guliston, UZ|40.495|68.775
Gijduvon Shahri, UZ|40.102|64.682
Gazalkent, UZ|41.558|69.771
Gallaorol Shahri, UZ|40.027|67.588
Gagarin Shahri, UZ|40.665|68.168
Fergana, UZ|40.384|71.784
Jalolquduq, UZ|40.689|72.609
Dostlik Shahri, UZ|40.529|68.032
Druzhba, UZ|41.222|61.307
Dardoq, UZ|40.816|72.832
Chust, UZ|41.003|71.238
Chirchiq, UZ|41.469|69.582
Chinoz, UZ|40.936|68.761
Chinobod, UZ|40.877|71.973
Chilanzar, UZ|41.282|69.181
Sergeli, UZ|41.198|69.222
Chortoq, UZ|41.069|71.824
Bo`ka, UZ|40.811|69.194
Beshariq, UZ|40.436|70.610
Beruniy, UZ|41.691|60.752
Bektemir, UZ|41.210|69.334
Bekobod, UZ|40.221|69.270
Angren, UZ|41.017|70.144
Andijon, UZ|40.783|72.351
Oltiariq, UZ|40.392|71.474
Oyim, UZ|40.820|72.742
Quva, UZ|40.522|72.073
Sultonobod, UZ|40.765|72.976
Vatican City, VA|41.903|12.454
Kingstown, VC|13.155|-61.227
Calliaqua, VC|13.129|-61.192
La Guardia, VE|10.997|-64.018
La Asuncion, VE|11.033|-63.863
Anaco, VE|9.430|-64.464
Alto Barinas, VE|8.593|-70.226
Zaraza, VE|9.350|-65.325
Yumare, VE|10.597|-68.673
Yaritagua, VE|10.081|-69.124
Villa de Cura, VE|10.039|-67.489
Villa Bruzual, VE|9.332|-69.120
Valle de La Pascua, VE|9.216|-66.007
Valera, VE|9.318|-70.604
Valencia, VE|10.162|-68.000
Urena, VE|7.922|-72.444
Urachiche, VE|10.158|-69.008
Upata, VE|8.016|-62.406
Turmero, VE|10.229|-67.474
Tumeremo, VE|7.299|-61.505
Tucupita, VE|9.063|-62.052
Tucupido, VE|9.273|-65.772
Tucani, VE|8.970|-71.273
Tucacas, VE|10.790|-68.326
Trujillo, VE|9.366|-70.437
Tovar, VE|8.330|-71.753
Tinaquillo, VE|9.919|-68.305
Tinaco, VE|9.699|-68.433
Timotes, VE|8.982|-70.739
Tia Juana, VE|10.259|-71.363
Temblador, VE|9.005|-62.645
Tariba, VE|7.821|-72.223
Tabay, VE|8.632|-71.078
Soledad, VE|8.162|-63.565
Socopo, VE|8.231|-70.822
San Timoteo, VE|9.790|-71.071
Santa Teresa del Tuy, VE|10.233|-66.665
Santa Rita, VE|10.536|-71.511
Santa Elena de Uairen, VE|4.602|-61.110
Santa Cruz de Mora, VE|8.399|-71.641
Santa Cruz de Mara, VE|10.793|-71.685
Santa Barbara, VE|7.813|-71.178
Santa Ana, VE|11.068|-63.923
Santa Ana, VE|7.643|-72.276
San Rafael de Onoto, VE|9.678|-68.973
San Rafael, VE|10.962|-71.730
San Mateo, VE|10.213|-67.424
San Juan de los Morros, VE|9.912|-67.354
Colon, VE|8.031|-72.261
San Juan Bautista, VE|11.012|-63.944
San Jose de Barlovento, VE|10.301|-65.991
San Jose de Guanipa, VE|8.887|-64.165
San Joaquin, VE|10.261|-67.793
San Felipe, VE|10.340|-68.743
San Cristobal, VE|7.766|-72.236
San Carlos del Zulia, VE|9.001|-71.927
San Carlos, VE|9.664|-68.587
Sanare, VE|9.752|-69.652
San Antonio del Tachira, VE|7.811|-72.444
San Antonio de Los Altos, VE|10.389|-66.952
Sabaneta, VE|8.752|-69.934
Sabana de Parra, VE|10.121|-69.036
Sabana de Mendoza, VE|9.435|-70.775
Rubio, VE|7.702|-72.356
La Villa del Rosario, VE|10.326|-72.313
Rio Chico, VE|10.319|-65.978
Quibor, VE|9.929|-69.620
Punto Fijo, VE|11.692|-70.199
Punta de Piedras, VE|10.901|-64.097
Punta de Mata, VE|9.691|-63.609
Punta Cardon, VE|11.658|-70.215
Puerto Piritu, VE|10.059|-65.037
Puerto La Cruz, VE|10.214|-64.633
Puerto Cumarebo, VE|11.486|-69.353
Puerto Cabello, VE|10.473|-68.013
Puerto Ayacucho, VE|5.660|-67.583
Pueblo Nuevo, VE|11.948|-69.923
Pueblo Nuevo El Chivo, VE|8.962|-71.608
Porlamar, VE|10.958|-63.870
Piritu, VE|9.371|-69.210
Petare, VE|10.477|-66.808
Pariaguan, VE|8.844|-64.711
Pampatar, VE|11.001|-63.793
Pampanito, VE|9.410|-70.501
Pampan, VE|9.445|-70.476
Palo Negro, VE|10.174|-67.542
Palmira, VE|7.838|-72.228
Ospino, VE|9.296|-69.454
Ocumare del Tuy, VE|10.118|-66.775
Obispos, VE|8.607|-70.105
Nueva Bolivia, VE|9.140|-71.091
Nirgua, VE|10.150|-68.565
Motatan, VE|9.392|-70.591
Moron, VE|10.487|-68.201
Montalban, VE|10.213|-68.327
Miranda, VE|10.151|-68.393
Michelena, VE|7.956|-72.242
Merida, VE|8.579|-71.169
Mene Grande, VE|9.846|-70.927
Mene de Mauroa, VE|10.681|-71.036
Mariara, VE|10.295|-67.718
Maracay, VE|10.250|-67.595
Maracaibo, VE|10.642|-71.611
Mamporal, VE|10.366|-66.134
Maiquetia, VE|10.595|-66.956
Machiques, VE|10.061|-72.552
Los Teques, VE|10.350|-67.043
Los Rastrojos, VE|10.026|-69.242
Los Dos Caminos, VE|10.494|-66.829
La Victoria, VE|10.227|-67.331
La Vela de Coro, VE|11.461|-69.566
Las Vegas, VE|9.537|-68.630
Las Tejerias, VE|10.254|-67.173
La Paragua, VE|6.833|-63.333
Lander, VE|10.183|-66.700
Lagunillas, VE|10.130|-71.259
Lagunillas, VE|8.505|-71.389
La Guaira, VE|10.602|-66.933
La Concepcion, VE|10.619|-71.838
Concepcion, VE|10.412|-71.689
La Azulita, VE|8.714|-71.444
Judibana, VE|11.759|-70.184
Juan Griego, VE|11.082|-63.965
Higuerote, VE|10.483|-66.101
Gueiria, VE|10.577|-62.298
Gueiguee, VE|10.083|-67.778
Guatire, VE|10.474|-66.542
Guasipati, VE|7.477|-61.897
Guarenas, VE|10.470|-66.619
Guanarito, VE|8.696|-69.208
Guanare, VE|9.039|-69.734
Guama, VE|10.266|-68.820
Guacara, VE|10.226|-67.877
Escuque, VE|9.297|-70.672
Encontrados, VE|9.060|-72.235
El Vigia, VE|8.614|-71.657
El Tocuyo, VE|9.787|-69.793
El Tigre, VE|8.889|-64.253
El Sombrero, VE|9.386|-67.058
El Pao, VE|9.639|-68.129
Elorza, VE|7.061|-69.498
Lecherias, VE|10.192|-64.692
El Limon, VE|10.306|-67.632
El Hatillo, VE|10.424|-66.826
El Dorado, VE|6.716|-61.637
El Dividive, VE|9.475|-70.735
Ejido, VE|8.547|-71.241
Duaca, VE|10.286|-69.162
Dabajuro, VE|11.023|-70.678
Cumanacoa, VE|10.251|-63.919
Cumana, VE|10.464|-64.179
Cua, VE|10.162|-66.882
Coro, VE|11.408|-69.678
Coloncito, VE|8.326|-72.087
Cocorote, VE|10.320|-68.783
Clarines, VE|9.940|-65.165
Ciudad Piar, VE|7.452|-63.320
Ciudad Ojeda, VE|10.202|-71.315
Ciudad Guayana, VE|8.351|-62.641
Ciudad Bolivia, VE|8.353|-70.571
Ciudad Bolivar, VE|8.124|-63.547
Chivacoa, VE|10.160|-68.895
Chiquinquira, VE|10.443|-71.647
Charallave, VE|10.242|-66.857
Chaguaramas, VE|9.338|-66.253
Chacao, VE|10.496|-66.854
Tacarigua, VE|10.086|-67.920
Caucagueito, VE|10.487|-66.738
Caucagua, VE|10.283|-66.376
Catia La Mar, VE|10.605|-67.032
Casigua El Cubo, VE|8.746|-72.519
Casanay, VE|10.504|-63.417
Carupano, VE|10.665|-63.254
Carrizal, VE|10.350|-66.986
Carora, VE|10.173|-70.081
Caripito, VE|10.111|-63.100
Cariaco, VE|10.497|-63.553
Caracas, VE|10.488|-66.879
Caraballeda, VE|10.612|-66.852
Cantaura, VE|9.306|-64.358
Camaguan, VE|8.107|-67.607
Calabozo, VE|8.924|-67.429
Caja Seca, VE|9.142|-71.067
Caicara, VE|9.818|-63.613
Caicara del Orinoco, VE|7.635|-66.168
Cagua, VE|10.186|-67.459
Cabudare, VE|10.027|-69.262
Cabimas, VE|10.399|-71.452
Boraure, VE|10.248|-68.770
Boconoito, VE|8.847|-69.980
Bocono, VE|9.254|-70.251
Biruaca, VE|7.845|-67.517
Bejuma, VE|10.174|-68.259
Baruta, VE|10.434|-66.876
Barrancas, VE|8.770|-70.111
Barrancas, VE|8.699|-62.197
Barquisimeto, VE|10.065|-69.357
Barinitas, VE|8.762|-70.412
Barinas, VE|8.621|-70.231
Barcelona, VE|10.138|-64.688
Bailadores, VE|8.253|-71.828
Aroa, VE|10.439|-68.895
Araya, VE|10.580|-64.255
Araure, VE|9.581|-69.239
Aragua de Barcelona, VE|9.456|-64.829
Altagracia de Orituco, VE|9.860|-66.381
Los Puertos de Altagracia, VE|10.715|-71.522
Achaguas, VE|7.779|-68.224
Acarigua, VE|9.555|-69.196
San Josecito, VE|7.661|-72.220
Maturin, VE|9.746|-63.183
La Fria, VE|8.215|-72.249
La Grita, VE|8.133|-71.984
Capacho Nuevo, VE|7.825|-72.308
El Cafetal, VE|10.465|-66.830
La Dolorita, VE|10.488|-66.786
Guasdualito, VE|7.242|-70.732
San Fernando de Apure, VE|7.890|-67.472
Santa Cruz de los Taques, VE|11.823|-70.256
Road Town, VG|18.427|-64.621
Charlotte Amalie, VI|18.342|-64.931
Saint Croix, VI|17.728|-64.747
Yen Vinh, VN|18.667|105.667
Yen Phu, VN|21.033|105.833
Yen Bai, VN|21.723|104.911
Xuan Mai, VN|20.900|105.583
Xuan Loc, VN|10.933|107.233
Xom My Xuan, VN|10.617|107.067
Xom Cai Nuoc, VN|9.800|105.100
Cai GJoi Vam, VN|8.857|104.812
Trang Bom, VN|10.954|107.006
Xa Long Hai, VN|10.387|107.239
Long Dien, VN|10.483|107.217
Vung Tau, VN|10.346|107.084
Vi Thanh, VN|9.784|105.470
Vinh Yen, VN|21.309|105.605
Vinh Tuy, VN|21.000|105.883
Vinh Long, VN|10.254|105.972
Vinh Chau, VN|9.324|105.980
Vinh, VN|18.673|105.692
Viet Yen, VN|21.267|106.133
Viet Tri, VN|21.323|105.402
Thanh Pho Uong Bi, VN|21.034|106.770
Tuy Hoa, VN|13.095|109.321
Tuyen Quang, VN|21.824|105.214
Tu Bong, VN|12.767|109.300
Trung Phung, VN|21.000|105.833
Hong Linh, VN|18.529|105.706
Thi Tran Trung Khanh, VN|22.835|106.525
Tra Vinh, VN|9.947|106.342
Trang Bang, VN|11.030|106.358
Long Bien, VN|21.033|105.900
Tram Chim, VN|10.670|105.565
Tinh Bien, VN|10.596|104.937
Thi Tran Tien Yen, VN|21.331|107.405
Thuong Cat, VN|21.093|105.732
Thu GJuc, VN|10.849|106.772
Thu Dau Mot, VN|10.980|106.652
Thuan Thanh, VN|21.046|106.079
Thot Not, VN|10.272|105.534
Thoi Lai, VN|10.065|105.559
Thoi Binh, VN|9.356|105.099
Thi Tran That Khe, VN|22.255|106.474
Phu Loc, VN|9.428|105.741
Ho Chi Minh City, VN|10.823|106.630
Thanh Liet, VN|20.967|105.817
Thanh Hoa, VN|19.800|105.767
Thai Nguyen, VN|21.594|105.848
Thai Binh, VN|20.450|106.340
Tay Tuu, VN|21.073|105.730
Tay Ninh, VN|11.310|106.098
Tay Ho, VN|21.069|105.811
Tan Chau, VN|10.798|105.239
Tan Binh, VN|10.803|106.660
Tan An, VN|10.536|106.414
Tam Ky, VN|15.574|108.474
Tam Giang, VN|8.800|105.183
Son Tay, VN|21.141|105.507
Son La, VN|21.326|103.919
Song Cau, VN|13.456|109.223
Soc Trang, VN|9.600|105.972
Sam Son, VN|19.733|105.900
Sa Dec, VN|10.291|105.756
Rach Gia, VN|10.012|105.081
Qui Nhon, VN|13.776|109.224
GJong Phu, VN|15.674|108.220
Ba GJon, VN|17.754|106.424
Quan Hau, VN|17.404|106.641
Quang Ngai, VN|15.120|108.792
Pleiku, VN|13.983|108.000
Tu Son, VN|21.100|105.967
Phu Tho, VN|21.400|105.222
Phuoc Hoa, VN|12.100|107.117
Phuoc An, VN|12.713|108.301
Phu My, VN|10.633|107.067
Phu Ly, VN|20.545|105.912
Phu Khuong, VN|11.283|106.133
Phu GJo, VN|21.017|105.767
Phuc Yen, VN|21.237|105.705
Phong Thanh, VN|9.324|105.346
Phong GJien, VN|16.583|107.364
Phong GJien, VN|9.998|105.667
Thi Tran Pho Lu, VN|22.319|104.187
Thi Tran Ba Che, VN|21.272|107.284
Phan Thiet, VN|10.929|108.102
Phan Rang-Thap Cham, VN|11.564|108.989
O Mon, VN|10.110|105.623
Thi Tran Nuoc Hai, VN|22.737|106.152
Ninh Hoa, VN|12.492|109.125
Hoa Lu, VN|20.258|105.980
Nha Trang, VN|12.245|109.194
Nha Be, VN|10.697|106.740
Nghi Son, VN|19.327|105.821
Nghia Lo, VN|21.600|104.517
Nghia GJo, VN|21.050|105.800
Nga Son, VN|20.007|105.970
Thi Tran Ngai Giao, VN|10.647|107.246
Nam GJinh, VN|20.434|106.177
Nam Can, VN|8.759|104.993
Thi Tran Na Duong, VN|21.703|106.956
My Tho, VN|10.360|106.360
My Lai, VN|15.188|108.889
My Khe, VN|15.150|108.900
My Hao, VN|20.917|106.083
Muong Lay, VN|22.000|103.133
Mong Cai, VN|21.525|107.966
Thi Tran Mao Khe, VN|21.059|106.593
Mai Dich, VN|21.033|105.783
Long Xuyen, VN|10.386|105.435
Long Thanh, VN|10.789|106.950
Long My, VN|9.681|105.572
Lieu Giai, VN|21.033|105.817
Lao Cai, VN|22.486|103.971
Lang Son, VN|21.853|106.761
Thi Tran Phuoc Buu, VN|10.535|107.402
Thi Tran Lam Son, VN|19.905|105.406
La Gi, VN|10.660|107.772
Ky Anh, VN|18.062|106.298
Kon Tum, VN|14.355|108.008
Kim Lien, VN|18.883|105.317
Kien An, VN|20.805|106.626
Kien An, VN|10.567|105.367
Khanh Hoa, VN|10.683|105.167
Huong Tra, VN|16.525|107.475
Huong Thuy, VN|16.422|107.640
Hung Yen, VN|20.646|106.051
Hung My, VN|8.900|104.983
Hue, VN|16.462|107.595
Hong Ngu, VN|10.800|105.350
Ha Long, VN|20.950|107.073
Hoi An, VN|15.879|108.335
Hoang Cau, VN|21.017|105.833
Hoa Binh, VN|20.817|105.338
Ha Tinh, VN|18.343|105.906
Ha Tien, VN|10.383|104.488
Hanoi, VN|21.024|105.841
Ham Ninh, VN|10.181|104.048
Haiphong, VN|20.865|106.683
Hai Duong, VN|20.941|106.333
Hai Chau, VN|15.917|108.133
Ha Giang, VN|22.823|104.984
Ha GJong, VN|20.971|105.779
Go Vap, VN|10.817|106.683
Go Cong, VN|10.367|106.667
Gia Rai, VN|9.234|105.458
Gia Nghia, VN|12.004|107.691
GJuc Trong, VN|11.736|108.373
GJuc Pho, VN|14.814|108.959
GJo Son, VN|20.714|106.789
GJong Xoai, VN|11.535|106.883
Thi Tran GJong Trieu, VN|21.082|106.514
GJong Hoi, VN|17.469|106.622
Dong Ha, VN|16.816|107.100
Dien Thanh, VN|18.977|105.600
Dien Bien Phu, VN|21.386|103.023
GJien Ban, VN|15.889|108.254
Dich Vong, VN|21.033|105.800
Di An, VN|10.907|106.769
Thi Tran GJat GJo, VN|10.491|107.270
GJan Phuong, VN|21.089|105.662
Da Nang, VN|16.068|108.221
Thi Tran GJam Ha, VN|21.353|107.597
Da Lat, VN|11.946|108.442
Thi Tran GJai Tu, VN|21.634|105.638
Dai Mo, VN|20.983|105.767
GJai Loc, VN|15.882|108.121
Cu Chi, VN|10.973|106.493
Co To, VN|10.350|105.017
Co GJo, VN|10.094|105.429
Co Loa, VN|21.117|105.867
Co GJo, VN|21.280|105.364
Chu, VN|21.374|106.566
Chon Thanh, VN|11.428|106.635
Cho Lon, VN|10.753|106.659
Chi Linh, VN|21.067|106.317
Chieng Coi, VN|21.300|103.900
Chau Phong, VN|10.717|105.133
Chau GJoc, VN|10.700|105.117
Cat Ba, VN|20.728|107.048
Cao Lanh, VN|10.460|105.633
Cao Bang, VN|22.666|106.258
Can Tho, VN|10.037|105.788
Can Gio, VN|10.411|106.955
Can GJuoc, VN|10.510|106.603
Can Giuoc, VN|10.609|106.671
Cam Ranh, VN|11.921|109.159
Cam Pha Mines, VN|21.017|107.300
Cam Pha, VN|21.010|107.273
Cam Lo, VN|16.808|106.994
Ca Mau, VN|9.177|105.152
Cai Rang, VN|10.001|105.751
Cai Lay, VN|10.400|106.117
Buon Trap, VN|12.485|108.030
Buon Ma Thuot, VN|12.667|108.038
Buon Ho, VN|12.952|108.296
Ea Poc, VN|12.778|108.071
Hoan Lao, VN|17.584|106.534
Binh Thuy, VN|10.074|105.740
Bim Son, VN|20.078|105.860
Bien Hoa, VN|10.945|106.824
Ben Tre, VN|10.241|106.376
Ben Thuy, VN|18.650|105.700
Ben Cat, VN|11.150|106.600
Ba Vi, VN|21.083|105.383
Bao Loc, VN|11.548|107.808
It Ong, VN|21.517|104.027
Thi Tran Thuan Chau, VN|21.438|103.690
Ba Na, VN|15.983|107.983
Bac Quang, VN|22.483|104.867
Bac Ninh, VN|21.186|106.076
Bac Lieu, VN|9.294|105.728
Bach Mai, VN|20.983|105.833
Bac Giang, VN|21.273|106.195
Bac Kan, VN|22.147|105.835
Ap Phuoc Tinh, VN|10.400|107.183
Lai Vung, VN|10.257|105.593
Ap Long Thanh, VN|10.761|105.274
Ap Ho Phong, VN|9.226|105.419
Ap Binh Chau, VN|10.550|107.550
An Trach, VN|9.069|105.396
An Nhon, VN|13.886|109.108
An Khe, VN|13.950|108.650
An Hai, VN|16.067|108.233
Binh Thanh, VN|10.811|106.706
Ba Dinh, VN|21.037|105.827
Mui Ne, VN|10.933|108.283
Tan Uyen, VN|11.084|106.788
Nui Sap, VN|10.265|105.267
Cung Kiem, VN|21.187|106.161
Lai Chau, VN|22.396|103.458
Thi Tran Viet Quang, VN|22.415|104.807
Phu Quoc, VN|10.224|103.972
Binh Minh, VN|10.068|105.822
Thi Tran Van Du, VN|20.152|105.731
Thi Tran Sao Vang, VN|19.889|105.462
Bo, VN|20.673|105.536
Thanh Pho Ba Ria, VN|10.496|107.168
Luong Bang, VN|20.740|106.060
Soc Son, VN|21.258|105.849
Cau Dien, VN|21.039|105.767
Trau Quy, VN|21.020|105.937
Cau Giay, VN|21.032|105.801
Thanh Xuan, VN|20.995|105.800
GJong GJa, VN|21.013|105.825
Hoan Kiem, VN|21.029|105.851
Hai Ba Trung, VN|21.013|105.848
Tay Mo, VN|21.002|105.746
Ban Na Hy, VN|19.564|104.535
Thai Hoa, VN|18.920|104.974
Nghen, VN|18.451|105.780
Thanh Khe, VN|16.071|108.191
Cam Le, VN|16.018|108.204
Son Tra, VN|16.061|108.233
Hoa Cuong, VN|16.043|108.182
Nui Thanh, VN|15.432|108.659
Ly Son, VN|15.372|109.119
A Yun Pa, VN|13.400|108.435
Ea Drang, VN|13.204|108.210
Quang Phu, VN|12.820|108.077
Ea Tling, VN|12.589|107.896
GJinh Van, VN|11.786|108.243
Khanh Hai, VN|11.591|109.041
Phu Quy, VN|10.517|108.933
Long Khanh, VN|10.927|107.248
Hoa Thanh, VN|11.287|106.129
Duong Minh Chau, VN|11.384|106.231
Duyen Hai, VN|9.635|106.492
Vinh Thanh, VN|10.223|105.398
Nga Bay, VN|9.814|105.821
Ap Mot, VN|9.842|105.536
Tran Van Thoi, VN|9.077|104.979
Quan Bon, VN|10.767|106.706
Quan Sau, VN|10.747|106.649
Quan Nam, VN|10.756|106.667
Quan Muoi Mot, VN|10.764|106.644
Quan Muoi, VN|10.768|106.666
Quan Ba, VN|10.775|106.686
Gia Lam, VN|21.020|105.939
Ganh Hao, VN|9.028|105.421
Cua Nam, VN|21.021|105.852
Kien Hai, VN|9.973|104.847
Quan GJuc Thinh, VN|10.310|105.739
Huyen Lam Ha, VN|11.816|108.214
Phu Quoc, VN|10.287|104.010
thi xa Quang Tri, VN|16.751|107.183
Quang Minh, VN|21.189|105.773
Thuan An, VN|10.924|106.714
O Cho Dua, VN|21.021|105.825
Lang Thuong, VN|21.024|105.804
Oc Eo, VN|10.242|105.155
Bac Tu Liem, VN|21.065|105.747
Vinhomes Ocean Park, VN|20.995|105.947
Ecopark, VN|20.962|105.932
Vinhomes Smart City, VN|21.005|105.740
Vinhomes Times City, VN|20.994|105.868
Vinhomes Royal City, VN|21.003|105.815
Thanh pho Song Cong, VN|21.477|105.841
Nga Nam, VN|9.565|105.599
Yen Hoa, VN|21.022|105.791
Linh GJam, VN|20.964|105.831
Bo GJe, VN|21.056|105.867
Hoang Mai, VN|19.268|105.716
Pho Yen, VN|21.420|105.890
Yen Nghia, VN|20.954|105.735
Duong Noi, VN|20.977|105.754
GJinh Cong, VN|20.984|105.827
GJong Ngac, VN|21.081|105.774
Giang Vo, VN|21.031|105.813
Hoang Liet, VN|20.964|105.841
Khuong GJinh, VN|20.984|105.815
Kien Hung, VN|20.958|105.790
Linh Nam, VN|20.980|105.890
Phuc Loi, VN|21.045|105.929
Phu Thuong, VN|21.087|105.807
Tuong Mai, VN|20.989|105.855
Port-Vila, VU|-17.736|168.314
Mata-Utu, WF|-13.282|-176.175
Apia, WS|-13.833|-171.767
Zvecan, XK|42.907|20.840
Vushtrri, XK|42.823|20.968
Vitina, XK|42.321|21.358
Ferizaj, XK|42.371|21.155
Suva Reka, XK|42.359|20.825
Shtime, XK|42.433|21.040
Prizren, XK|42.214|20.740
Pristina, XK|42.673|21.167
Podujeva, XK|42.911|21.193
Peje, XK|42.659|20.288
Orahovac, XK|42.399|20.655
Llazice, XK|42.555|20.763
Leposaviq, XK|43.104|20.803
Mitrovice, XK|42.883|20.867
Kosovo Polje, XK|42.664|21.096
Istok, XK|42.781|20.488
Gjilan, XK|42.460|21.470
Glogovac, XK|42.628|20.894
Dragash, XK|42.026|20.653
Decan, XK|42.540|20.288
Gjakove, XK|42.380|20.431
Zinjibar, YE|13.129|45.381
Zabid, YE|14.195|43.315
Yarim, YE|14.298|44.378
Taiz, YE|13.580|44.021
Sayyan, YE|15.172|44.324
Sanaa, YE|15.355|44.206
Sahar, YE|15.316|44.309
Sadah, YE|16.940|43.764
Marib, YE|15.463|45.326
Lahij, YE|13.057|44.882
Ibb, YE|13.967|44.183
Hajjah, YE|15.694|43.606
Ghayl Ba Wazir, YE|14.776|49.366
Dhi as Sufal, YE|13.834|44.115
Dhamar, YE|14.543|44.405
Bayt al Faqih, YE|14.516|43.324
Bajil, YE|15.059|43.287
Ataq, YE|14.538|46.832
Amran, YE|15.659|43.944
Mocha, YE|13.318|43.250
Mukalla, YE|14.542|49.124
Al Hudaydah, YE|14.798|42.955
Al Hazm, YE|16.164|44.777
Al Bayda, YE|13.985|45.573
Aden, YE|12.780|45.039
Mamoudzou, YT|-12.782|45.229
Dzaoudzi, YT|-12.783|45.257
Koungou, YT|-12.734|45.204
Kaoueni, YT|-12.771|45.224
Mtsapere, YT|-12.786|45.217
Labattoir, YT|-12.777|45.282
Roodepoort, ZA|-26.163|27.872
Zeerust, ZA|-25.537|26.075
Zastron, ZA|-30.302|27.084
Wolmaransstad, ZA|-27.197|25.983
White River, ZA|-25.332|31.012
Emalahleni, ZA|-25.871|29.233
Winburg, ZA|-28.518|27.009
Whittlesea, ZA|-32.176|26.824
Westonaria, ZA|-26.319|27.649
Wesselsbron, ZA|-27.855|26.366
Wembesi, ZA|-29.049|29.782
Welkom, ZA|-27.977|26.735
Warrenton, ZA|-28.114|24.848
Bela Bela, ZA|-24.883|28.283
Vryheid, ZA|-27.770|30.792
Vryburg, ZA|-26.957|24.728
Vredefort, ZA|-27.008|27.365
Vrede, ZA|-27.426|29.166
Volksrust, ZA|-27.365|29.882
Virginia, ZA|-28.104|26.866
Villiers, ZA|-27.030|28.601
Viljoenskroon, ZA|-27.208|26.949
Verena, ZA|-25.483|29.028
Vereeniging, ZA|-26.673|27.926
Ventersdorp, ZA|-26.314|26.822
Vanderbijlpark, ZA|-26.712|27.838
Vaalwater, ZA|-24.296|28.114
Upington, ZA|-28.448|21.256
eMuziwezinto, ZA|-30.310|30.663
Mthatha, ZA|-31.589|28.784
eMkhomazi, ZA|-30.207|30.796
Ulundi, ZA|-28.335|31.416
Kariega, ZA|-33.756|25.401
Ugie, ZA|-31.198|28.234
Tzaneen, ZA|-23.833|30.164
Trichardt, ZA|-26.492|29.229
Tongaat, ZA|-29.574|31.116
Tokoza, ZA|-26.360|28.129
Thulamahashi, ZA|-24.725|31.199
Thohoyandou, ZA|-22.946|30.485
Theunissen, ZA|-28.411|26.701
Thabazimbi, ZA|-24.592|27.412
Thaba Nchu, ZA|-29.209|26.839
Thembisa, ZA|-25.996|28.227
Swellendam, ZA|-34.023|20.442
Stutterheim, ZA|-32.571|27.424
Stilfontein, ZA|-26.845|26.768
KwaDukuza, ZA|-29.328|31.290
Standerton, ZA|-26.934|29.242
Springs, ZA|-26.250|28.400
Soweto, ZA|-26.268|27.858
Soshanguve, ZA|-25.473|28.099
Somerset East, ZA|-32.722|25.588
Siyabuswa, ZA|-25.113|29.045
Shakaskraal, ZA|-29.449|31.215
Senekal, ZA|-28.320|27.621
Secunda, ZA|-26.550|29.167
Scottburgh, ZA|-30.287|30.753
Schweizer-Reneke, ZA|-27.189|25.329
Schoemansdal, ZA|-25.709|31.510
Sasolburg, ZA|-26.814|27.817
Sabie, ZA|-25.100|30.780
Rustenburg, ZA|-25.668|27.242
Riversdale, ZA|-34.093|21.257
Richmond, ZA|-29.872|30.272
Richards Bay, ZA|-28.783|32.038
Reitz, ZA|-27.801|28.427
Randfontein, ZA|-26.184|27.702
Randburg, ZA|-26.094|28.001
Queenstown, ZA|-31.898|26.875
Queensdale, ZA|-31.871|26.979
Pretoria, ZA|-25.745|28.188
Mokopane, ZA|-24.194|29.010
Potchefstroom, ZA|-26.717|27.100
Postmasburg, ZA|-28.334|23.065
Port Shepstone, ZA|-30.741|30.455
Gqeberha, ZA|-33.961|25.615
Port Alfred, ZA|-33.586|26.883
Plettenberg Bay, ZA|-34.053|23.372
Pinetown, ZA|-29.821|30.887
Piet Retief, ZA|-27.007|30.813
Polokwane, ZA|-23.904|29.469
Pietermaritzburg, ZA|-29.617|30.393
Phuthaditjhaba, ZA|-28.524|28.816
Phalaborwa, ZA|-23.943|31.141
Mamafubedu, ZA|-27.666|28.131
Parys, ZA|-26.903|27.457
Pampierstad, ZA|-27.783|24.688
Oudtshoorn, ZA|-33.600|22.200
Ottosdal, ZA|-26.809|26.005
Orkney, ZA|-26.980|26.673
Odendaalsrus, ZA|-27.874|26.691
Modimolle, ZA|-24.700|28.400
Northam, ZA|-24.958|27.265
Nkowakowa, ZA|-23.888|30.287
Nigel, ZA|-26.431|28.477
Newcastle, ZA|-27.758|29.932
New Brighton, ZA|-33.899|25.603
Mbombela, ZA|-25.475|30.969
Mookgophong, ZA|-24.517|28.717
Mtubatuba, ZA|-28.418|32.185
Mpumalanga, ZA|-29.813|30.636
Mpophomeni, ZA|-29.568|30.186
Tlokoeng, ZA|-30.693|28.506
Mossel Bay, ZA|-34.183|22.146
Mooi River, ZA|-29.208|29.995
Montagu, ZA|-33.787|20.121
Mondlo, ZA|-27.983|30.718
Moloto South, ZA|-25.463|28.650
Mmabatho, ZA|-25.850|25.633
Middelburg, ZA|-31.493|25.006
Middelburg, ZA|-25.775|29.465
Mdantsane, ZA|-32.933|27.777
Matsulu, ZA|-25.523|31.357
Marquard, ZA|-28.664|27.430
Margate, ZA|-30.864|30.371
Makwassie, ZA|-27.316|25.995
Mafikeng, ZA|-25.865|25.644
Mabopane, ZA|-25.509|28.064
Lydenburg, ZA|-25.096|30.444
Louis Trichardt, ZA|-23.044|29.903
Lichtenburg, ZA|-26.152|26.160
Leslie, ZA|-26.367|28.919
Leeudoringstad, ZA|-27.237|26.235
Ladysmith, ZA|-28.559|29.779
Lady Frere, ZA|-31.703|27.233
Ladybrand, ZA|-29.194|27.457
Kwaggafontein, ZA|-25.327|28.942
Kutloanong, ZA|-27.833|26.750
Kruisfontein, ZA|-34.003|24.731
Krugersdorp, ZA|-26.086|27.775
Kroonstad, ZA|-27.650|27.235
Kriel, ZA|-26.250|29.260
Koster, ZA|-25.863|26.898
Koppies, ZA|-27.242|27.574
Komatipoort, ZA|-25.433|31.955
Kokstad, ZA|-30.547|29.424
Knysna, ZA|-34.036|23.047
Klerksdorp, ZA|-26.852|26.667
Kinross, ZA|-26.417|29.087
Qonce, ZA|-32.881|27.394
Kimberley, ZA|-28.732|24.762
Johannesburg, ZA|-26.202|28.044
Jeffreys Bay, ZA|-34.045|24.921
Itsoseng, ZA|-26.082|25.881
Humansdorp, ZA|-34.029|24.769
Howick, ZA|-29.478|30.231
Hoopstad, ZA|-27.833|25.908
Hennenman, ZA|-27.977|27.024
Hendrina, ZA|-26.159|29.715
Heilbron, ZA|-27.281|27.971
Heidelberg, ZA|-26.505|28.359
Hartbeespoort, ZA|-25.729|27.870
Hartbeesfontein, ZA|-26.766|26.420
Harrismith, ZA|-28.273|29.129
Hammanskraal, ZA|-25.409|28.287
Groot-Brakrivier, ZA|-34.044|22.226
Greytown, ZA|-29.064|30.593
Grahamstown, ZA|-33.304|26.533
Graaff Reinet, ZA|-32.252|24.531
Gonubie, ZA|-32.944|28.015
Glencoe, ZA|-28.178|30.147
Giyani, ZA|-23.302|30.719
Germiston, ZA|-26.215|28.164
George, ZA|-33.963|22.462
Ga-Rankuwa, ZA|-25.617|27.995
Frankfort, ZA|-27.279|28.497
Fouriesburg, ZA|-28.620|28.210
Fort Beaufort, ZA|-32.775|26.634
Fochville, ZA|-26.489|27.494
Ficksburg, ZA|-28.872|27.875
Evaton, ZA|-26.533|27.850
Estcourt, ZA|-29.013|29.866
eSikhaleni, ZA|-28.871|31.900
Eshowe, ZA|-28.886|31.470
Ermelo, ZA|-26.533|29.983
Empangeni, ZA|-28.762|31.893
eMbalenhle, ZA|-26.533|29.067
Khowa, ZA|-31.333|27.850
Edenvale, ZA|-26.141|28.152
East London, ZA|-33.015|27.912
Dysselsdorp, ZA|-33.576|22.444
Dwarsloop, ZA|-24.795|31.103
Durban, ZA|-29.858|31.029
Dundee, ZA|-28.167|30.234
Duiwelskloof, ZA|-23.693|30.140
Driekoppies, ZA|-25.698|31.564
Driefontein, ZA|-26.965|30.436
Dimbaza, ZA|-32.835|27.217
Despatch, ZA|-33.802|25.463
Deneysville, ZA|-26.891|28.097
Delmas, ZA|-26.147|28.683
De Aar, ZA|-30.650|24.012
Cullinan, ZA|-25.671|28.524
Cradock, ZA|-32.164|25.619
Coligny, ZA|-26.332|26.321
Clydesdale, ZA|-30.298|29.938
Hlohlolwane, ZA|-28.916|27.570
Christiana, ZA|-27.914|25.161
Carolina, ZA|-26.069|30.115
Carletonville, ZA|-26.361|27.398
Calcutta, ZA|-24.983|31.235
Cala, ZA|-31.524|27.695
Butterworth, ZA|-32.331|28.150
Burgersdorp, ZA|-30.998|26.329
Bultfontein, ZA|-28.288|26.150
Bronkhorstspruit, ZA|-25.810|28.742
Brits, ZA|-25.635|27.780
Breyten, ZA|-26.302|29.987
Bredasdorp, ZA|-34.532|20.040
Winnie Mandela, ZA|-28.700|26.458
Brakpan, ZA|-26.237|28.369
Botshabelo, ZA|-29.267|26.726
Bothaville, ZA|-27.389|26.617
Boksburg, ZA|-26.212|28.260
Bloemhof, ZA|-27.647|25.607
Bloemfontein, ZA|-29.121|26.214
Bhisho, ZA|-32.847|27.442
Bethlehem, ZA|-28.231|28.307
Bethal, ZA|-26.458|29.466
Benoni, ZA|-26.188|28.321
Belfast, ZA|-25.690|30.035
Beaufort West, ZA|-32.357|22.583
Barberton, ZA|-25.788|31.053
Ballitoville, ZA|-29.539|31.214
Balfour, ZA|-26.663|28.590
Ashton, ZA|-33.831|20.056
Amandelbult, ZA|-24.818|27.297
Allanridge, ZA|-27.754|26.644
Aliwal North, ZA|-30.694|26.711
Alice, ZA|-32.787|26.834
Hlanganani, ZA|-24.959|31.170
Alexandra, ZA|-26.105|28.099
Alberton, ZA|-26.268|28.122
Acornhoek, ZA|-24.588|31.095
Ekangala, ZA|-25.668|28.730
Somaroboro, ZA|-25.346|28.834
Midrand, ZA|-25.976|28.118
Centurion, ZA|-25.859|28.186
Worcester, ZA|-33.647|19.449
Wellington, ZA|-33.640|19.011
Vredendal, ZA|-31.668|18.501
Vredenburg, ZA|-32.907|17.990
Stellenbosch, ZA|-33.935|18.867
Saldanha, ZA|-33.012|17.944
Robertson, ZA|-33.803|19.885
Paarl, ZA|-33.734|18.975
Muizenberg, ZA|-34.097|18.480
Moorreesburg, ZA|-33.154|18.660
Malmesbury, ZA|-33.461|18.727
Lansdowne, ZA|-33.987|18.497
Kuils River, ZA|-33.942|18.707
Kraaifontein, ZA|-33.848|18.717
Hermanus, ZA|-34.419|19.234
Grabouw, ZA|-34.152|19.015
Gansbaai, ZA|-34.583|19.350
Franschhoek, ZA|-33.911|19.120
Durbanville, ZA|-33.831|18.649
Ceres, ZA|-33.369|19.311
Cape Town, ZA|-33.926|18.423
Caledon, ZA|-34.230|19.427
Atlantis, ZA|-33.567|18.483
Athlone, ZA|-33.967|18.502
Somerset West, ZA|-34.084|18.821
Rondebosch, ZA|-33.963|18.476
Lephalale, ZA|-23.666|27.745
Musina, ZA|-22.349|30.041
Midstream, ZA|-25.918|28.199
Mandeni, ZA|-29.147|31.414
Retreat, ZA|-34.055|18.476
Hartbeestfontein-A, ZA|-25.441|27.511
Marapong, ZA|-23.655|27.625
Diepsloot, ZA|-25.933|28.012
Etwatwa, ZA|-26.125|28.455
Marikana, ZA|-25.699|27.475
Ga-Malakhe, ZA|-30.806|30.335
Ivory Park, ZA|-26.002|28.190
Lukwatini, ZA|-26.055|30.823
Mankweng, ZA|-23.884|29.706
Mkhuhlu, ZA|-24.988|31.238
Kamaqhekeza, ZA|-25.670|31.863
Phola, ZA|-26.002|29.034
Motherwell, ZA|-33.794|25.586
Ntuzuma, ZA|-29.739|30.949
Ncotshane, ZA|-27.342|31.580
Malamulele, ZA|-22.971|30.674
Folweni, ZA|-29.996|30.807
Lebohang, ZA|-26.379|28.921
Ndevana, ZA|-32.908|27.510
Tshiame, ZA|-28.331|28.991
Phomolong, ZA|-28.013|27.082
Bagale, ZA|-26.066|27.648
Frischgewaagd, ZA|-27.390|30.955
Tshitereke, ZA|-22.884|30.494
Praktiseer, ZA|-24.584|30.317
Lebowakgomo, ZA|-24.315|29.501
Empuluzu, ZA|-26.305|30.774
Daggakraal, ZA|-27.132|29.976
Thubelihle, ZA|-26.216|29.292
Tekwane, ZA|-25.478|31.146
Vaalbank, ZA|-25.152|28.856
Redhill, ZA|-26.261|30.825
Letlhabile, ZA|-25.482|27.839
Le Roux, ZA|-33.891|19.103
Nhlazatje, ZA|-26.040|30.793
Fernie, ZA|-26.390|30.787
Mafemani, ZA|-24.789|31.079
Nchelenge, ZM|-9.345|28.734
Nakonde, ZM|-9.342|32.745
Mpulungu, ZM|-8.762|31.114
Mporokoso, ZM|-9.373|30.125
Mbala, ZM|-8.840|31.366
Kawambwa, ZM|-9.791|29.079
Kaputa, ZM|-8.469|29.662
Chiengi, ZM|-8.660|29.161
Zambezi, ZM|-13.543|23.105
Solwezi, ZM|-12.169|26.389
Sinda, ZM|-14.210|31.763
Sinazongwe, ZM|-17.261|27.462
Siavonga, ZM|-16.538|28.709
Sesheke, ZM|-17.476|24.297
Serenje, ZM|-13.233|30.235
Senanga, ZM|-16.117|23.267
Samfya, ZM|-11.365|29.557
Petauke, ZM|-14.241|31.320
Nyimba, ZM|-14.557|30.815
Ndola, ZM|-12.959|28.637
Namwala, ZM|-15.750|26.438
Mwinilunga, ZM|-11.736|24.429
Mumbwa, ZM|-14.983|27.062
Mufulira, ZM|-12.550|28.241
Mpongwe, ZM|-13.509|28.155
Mpika, ZM|-11.834|31.453
Monze, ZM|-16.271|27.477
Mongu, ZM|-15.248|23.127
Mkushi, ZM|-13.620|29.394
Mazabuka, ZM|-15.856|27.748
Manyinga, ZM|-13.416|24.335
Mansa, ZM|-11.200|28.894
Maamba, ZM|-17.367|27.150
Luwingu, ZM|-10.262|29.927
Lusaka, ZM|-15.407|28.287
Lundazi, ZM|-12.293|33.178
Lukulu, ZM|-14.371|23.242
Luanshya, ZM|-13.137|28.417
Livingstone, ZM|-17.842|25.854
Kitwe, ZM|-12.802|28.213
Katete, ZM|-14.050|32.083
Kasempa, ZM|-13.458|25.834
Kasama, ZM|-10.213|31.181
Kapiri Mposhi, ZM|-13.971|28.670
Kaoma, ZM|-14.783|24.800
Kansanshi, ZM|-12.095|26.427
Kalulushi, ZM|-12.842|28.095
Kalomo, ZM|-17.026|26.484
Kalabo, ZM|-14.993|22.679
Kafue, ZM|-15.769|28.181
Kabwe, ZM|-14.447|28.446
Kabompo, ZM|-13.593|24.201
Isoka, ZM|-10.161|32.634
Chongwe, ZM|-15.329|28.682
Choma, ZM|-16.809|26.988
Chisasa, ZM|-12.109|25.496
Chirundu, ZM|-16.036|28.843
Chipata, ZM|-13.633|32.650
Chinsali, ZM|-10.541|32.082
Chingola, ZM|-12.529|27.884
Chililabombwe, ZM|-12.365|27.823
Chavuma, ZM|-13.067|22.683
Chambishi, ZM|-12.632|28.054
Itezhi-Tezhi, ZM|-15.737|26.042
Chilanga Township, ZM|-15.571|28.270
Nampundwe, ZM|-15.508|27.924
Chisankane, ZM|-15.482|28.351
Chunga, ZM|-15.317|28.269
Lusaka West, ZM|-15.319|28.110
Madido, ZM|-15.355|28.374
Manyama, ZM|-12.315|25.849
Mapalo, ZM|-12.937|28.672
Mufumbwe, ZM|-13.137|25.007
Mwansabombwe, ZM|-9.822|28.760
Namalombwe, ZM|-15.391|28.190
Ntandabale, ZM|-15.390|28.422
Palabana, ZM|-15.446|28.534
Zvishavane, ZW|-20.327|30.066
Victoria Falls, ZW|-17.933|25.831
Shurugwi, ZW|-19.670|30.006
Ruwa, ZW|-17.890|31.245
Rusape, ZW|-18.528|32.128
Redcliff, ZW|-19.033|29.783
Norton, ZW|-17.883|30.700
Mvurwi, ZW|-17.033|30.850
Mutare, ZW|-18.971|32.671
Mount Hampden, ZW|-17.742|30.939
Masvingo, ZW|-20.064|30.828
Marondera, ZW|-18.185|31.552
Kwekwe, ZW|-18.928|29.815
Karoi, ZW|-16.810|29.692
Kariba, ZW|-16.517|28.800
Kadoma, ZW|-18.333|29.915
Hwange, ZW|-18.364|26.499
Harare, ZW|-17.828|31.053
Gweru, ZW|-19.450|29.817
Gwanda, ZW|-20.936|29.007
Gokwe, ZW|-18.205|28.935
Chiredzi, ZW|-21.050|31.667
Chipinge, ZW|-20.188|32.624
Chinhoyi, ZW|-17.367|30.200
Chegutu, ZW|-18.130|30.141
Bulawayo, ZW|-20.150|28.583
Bindura, ZW|-17.302|31.331
Beitbridge, ZW|-22.217|30.000
Epworth, ZW|-17.890|31.148
Chitungwiza, ZW|-18.013|31.076
Harare Western Suburbs, ZW|-17.841|30.877$towns$, E'\n') as line) t;
