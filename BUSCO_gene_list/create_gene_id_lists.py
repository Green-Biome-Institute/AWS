import csv

# EUKARYOTA
eukaryota_genes = [
    "1001705at2759",
    "1003258at2759",
    "100698at2759",
    "1010730at2759",
    "1014314at2759",
    "1018517at2759",
    "1019762at2759",
    "1025450at2759",
    "1030907at2759",
    "1032689at2759",
    "1038775at2759",
    "1041560at2759",
    "1049599at2759",
    "1051021at2759",
    "1053181at2759",
    "1057950at2759",
    "1065019at2759",
    "1076134at2759",
    "1079130at2759",
    "1079827at2759",
    "1085752at2759",
    "1087488at2759",
    "1090038at2759",
    "1094121at2759",
    "1096688at2759",
    "1106766at2759",
    "1107630at2759",
    "1108845at2759",
    "1111142at2759",
    "1112002at2759",
    "1115196at2759",
    "1128607at2759",
    "1129824at2759",
    "1138059at2759",
    "1157302at2759",
    "1161199at2759",
    "1173229at2759",
    "1178688at2759",
    "1182451at2759",
    "1193442at2759",
    "1194691at2759",
    "1194797at2759",
    "1197019at2759",
    "1200489at2759",
    "1217666at2759",
    "1220881at2759",
    "1222562at2759",
    "1223488at2759",
    "1228942at2759",
    "1233814at2759",
    "1236198at2759",
    "1247641at2759",
    "1248958at2759",
    "1249159at2759",
    "1251252at2759",
    "1257440at2759",
    "1258856at2759",
    "1259741at2759",
    "1260807at2759",
    "1264469at2759",
    "1266231at2759",
    "1269244at2759",
    "1269649at2759",
    "1275837at2759",
    "1284731at2759",
    "1287094at2759",
    "1287401at2759",
    "1291729at2759",
    "1304061at2759",
    "1309031at2759",
    "1312453at2759",
    "1314980at2759",
    "1322299at2759",
    "1322642at2759",
    "1323575at2759",
    "1324510at2759",
    "1338131at2759",
    "1339553at2759",
    "1342242at2759",
    "1346165at2759",
    "1346432at2759",
    "1348942at2759",
    "1355894at2759",
    "1358374at2759",
    "1364586at2759",
    "1370285at2759",
    "1370304at2759",
    "1377237at2759",
    "1379600at2759",
    "1380409at2759",
    "1382842at2759",
    "1395649at2759",
    "1398309at2759",
    "1404162at2759",
    "1405073at2759",
    "1405146at2759",
    "1407446at2759",
    "1421503at2759",
    "1423847at2759",
    "142542at2759",
    "1426075at2759",
    "1428265at2759",
    "1428854at2759",
    "1430056at2759",
    "1432328at2759",
    "1434266at2759",
    "1440961at2759",
    "1441854at2759",
    "1442062at2759",
    "1445102at2759",
    "1450538at2759",
    "1454155at2759",
    "1455730at2759",
    "1459797at2759",
    "1474000at2759",
    "1479417at2759",
    "1488235at2759",
    "1488436at2759",
    "1490022at2759",
    "1504863at2759",
    "1513531at2759",
    "1525971at2759",
    "1526152at2759",
    "1530008at2759",
    "1538526at2759",
    "1545004at2759",
    "1552706at2759",
    "1558822at2759",
    "156083at2759",
    "1563319at2759",
    "1567796at2759",
    "1575179at2759",
    "1576404at2759",
    "1588798at2759",
    "1593937at2759",
    "160593at2759",
    "1617752at2759",
    "1620056at2759",
    "1623701at2759",
    "1626636at2759",
    "1633672at2759",
    "1645187at2759",
    "166920at2759",
    "176625at2759",
    "179362at2759",
    "245208at2759",
    "257318at2759",
    "261328at2759",
    "261419at2759",
    "270107at2759",
    "271586at2759",
    "290630at2759",
    "293315at2759",
    "296129at2759",
    "299766at2759",
    "306227at2759",
    "320059at2759",
    "324863at2759",
    "325552at2759",
    "330169at2759",
    "331411at2759",
    "341721at2759",
    "345441at2759",
    "355408at2759",
    "369837at2759",
    "375960at2759",
    "383503at2759",
    "388820at2759",
    "390348at2759",
    "392369at2759",
    "39650at2759",
    "396755at2759",
    "418107at2759",
    "426305at2759",
    "450058at2759",
    "453044at2759",
    "457861at2759",
    "464990at2759",
    "491869at2759",
    "513979at2759",
    "543764at2759",
    "549762at2759",
    "551907at2759",
    "570797at2759",
    "582756at2759",
    "598949at2759",
    "604979at2759",
    "621827at2759",
    "625387at2759",
    "655400at2759",
    "664730at2759",
    "671536at2759",
    "671846at2759",
    "673132at2759",
    "674160at2759",
    "674169at2759",
    "679187at2759",
    "679771at2759",
    "687505at2759",
    "692986at2759",
    "708105at2759",
    "719531at2759",
    "720340at2759",
    "721605at2759",
    "722805at2759",
    "734341at2759",
    "734666at2759",
    "736068at2759",
    "751335at2759",
    "759498at2759",
    "761109at2759",
    "768809at2759",
    "774318at2759",
    "777920at2759",
    "779909at2759",
    "801857at2759",
    "814241at2759",
    "817008at2759",
    "834694at2759",
    "836599at2759",
    "83779at2759",
    "844748at2759",
    "855834at2759",
    "858842at2759",
    "865202at2759",
    "866359at2759",
    "869548at2759",
    "878143at2759",
    "87842at2759",
    "887370at2759",
    "891751at2759",
    "898782at2759",
    "901894at2759",
    "905026at2759",
    "911863at2759",
    "917326at2759",
    "918816at2759",
    "919955at2759",
    "923657at2759",
    "924753at2759",
    "931188at2759",
    "937275at2759",
    "937686at2759",
    "939345at2759",
    "944899at2759",
    "946128at2759",
    "956854at2759",
    "97116at2759",
    "973442at2759",
    "974865at2759",
    "975158at2759",
    "975557at2759",
    "976469at2759",
    "981902at2759",
    "996662at2759"
]

# VIRIDIPLANTAE
viridiplantae_genes = [
    "101241at33090",
    "101701at33090",
    "102307at33090",
    "103267at33090",
    "103382at33090",
    "104218at33090",
    "104557at33090",
    "104821at33090",
    "104867at33090",
    "105044at33090",
    "105782at33090",
    "105867at33090",
    "106769at33090",
    "106886at33090",
    "107107at33090",
    "107413at33090",
    "108705at33090",
    "10924at33090",
    "109586at33090",
    "109823at33090",
    "110222at33090",
    "110225at33090",
    "111210at33090",
    "111213at33090",
    "111249at33090",
    "111924at33090",
    "112238at33090",
    "112325at33090",
    "112461at33090",
    "112542at33090",
    "113024at33090",
    "114996at33090",
    "115240at33090",
    "115992at33090",
    "116411at33090",
    "116516at33090",
    "116585at33090",
    "116623at33090",
    "11664at33090",
    "117191at33090",
    "117247at33090",
    "11800at33090",
    "119439at33090",
    "120031at33090",
    "120338at33090",
    "120455at33090",
    "120589at33090",
    "121281at33090",
    "121303at33090",
    "122367at33090",
    "122422at33090",
    "122831at33090",
    "122958at33090",
    "123838at33090",
    "12439at33090",
    "125550at33090",
    "125747at33090",
    "126138at33090",
    "126427at33090",
    "127059at33090",
    "128774at33090",
    "130268at33090",
    "130279at33090",
    "13039at33090",
    "130637at33090",
    "131556at33090",
    "131874at33090",
    "131914at33090",
    "133112at33090",
    "133622at33090",
    "134078at33090",
    "135419at33090",
    "135892at33090",
    "136118at33090",
    "136267at33090",
    "1363at33090",
    "13643at33090",
    "136579at33090",
    "137018at33090",
    "137771at33090",
    "137787at33090",
    "138499at33090",
    "138782at33090",
    "139062at33090",
    "139450at33090",
    "139497at33090",
    "140683at33090",
    "140876at33090",
    "141370at33090",
    "141861at33090",
    "1419at33090",
    "142077at33090",
    "142382at33090",
    "142433at33090",
    "143102at33090",
    "143347at33090",
    "143963at33090",
    "143978at33090",
    "144144at33090",
    "144680at33090",
    "144716at33090",
    "144765at33090",
    "144990at33090",
    "145061at33090",
    "145734at33090",
    "146354at33090",
    "146469at33090",
    "146772at33090",
    "146921at33090",
    "147083at33090",
    "147262at33090",
    "148236at33090",
    "148539at33090",
    "148839at33090",
    "149782at33090",
    "150470at33090",
    "150559at33090",
    "152317at33090",
    "153820at33090",
    "154870at33090",
    "155102at33090",
    "1557at33090",
    "15682at33090",
    "156843at33090",
    "156887at33090",
    "158492at33090",
    "158957at33090",
    "160064at33090",
    "160610at33090",
    "160680at33090",
    "161054at33090",
    "161066at33090",
    "161269at33090",
    "161309at33090",
    "161559at33090",
    "161966at33090",
    "162794at33090",
    "163097at33090",
    "163701at33090",
    "163833at33090",
    "164019at33090",
    "164280at33090",
    "164556at33090",
    "165103at33090",
    "166645at33090",
    "166660at33090",
    "167076at33090",
    "167217at33090",
    "16726at33090",
    "167325at33090",
    "167809at33090",
    "167850at33090",
    "167932at33090",
    "168269at33090",
    "168270at33090",
    "168563at33090",
    "169007at33090",
    "170939at33090",
    "170945at33090",
    "171195at33090",
    "171627at33090",
    "171708at33090",
    "171767at33090",
    "172000at33090",
    "172535at33090",
    "172666at33090",
    "173119at33090",
    "173143at33090",
    "173477at33090",
    "173581at33090",
    "174202at33090",
    "174213at33090",
    "174767at33090",
    "175583at33090",
    "175792at33090",
    "175963at33090",
    "176016at33090",
    "176328at33090",
    "177296at33090",
    "177720at33090",
    "177964at33090",
    "178386at33090",
    "179975at33090",
    "180408at33090",
    "180466at33090",
    "180674at33090",
    "181108at33090",
    "182493at33090",
    "182513at33090",
    "182936at33090",
    "182952at33090",
    "183313at33090",
    "183396at33090",
    "183719at33090",
    "183931at33090",
    "184066at33090",
    "184405at33090",
    "18455at33090",
    "184776at33090",
    "185172at33090",
    "185214at33090",
    "1855at33090",
    "185696at33090",
    "185941at33090",
    "186340at33090",
    "187462at33090",
    "187866at33090",
    "187914at33090",
    "18801at33090",
    "188180at33090",
    "188436at33090",
    "188583at33090",
    "188938at33090",
    "189891at33090",
    "190390at33090",
    "191125at33090",
    "191396at33090",
    "191581at33090",
    "192090at33090",
    "192376at33090",
    "192456at33090",
    "192750at33090",
    "193351at33090",
    "193437at33090",
    "193683at33090",
    "193777at33090",
    "193982at33090",
    "194002at33090",
    "194293at33090",
    "194372at33090",
    "194467at33090",
    "195185at33090",
    "195354at33090",
    "195527at33090",
    "195843at33090",
    "196198at33090",
    "196248at33090",
    "196324at33090",
    "196325at33090",
    "196410at33090",
    "196443at33090",
    "196490at33090",
    "196512at33090",
    "196850at33090",
    "196873at33090",
    "196991at33090",
    "197780at33090",
    "197838at33090",
    "198012at33090",
    "198570at33090",
    "199163at33090",
    "199618at33090",
    "199795at33090",
    "200316at33090",
    "200488at33090",
    "200499at33090",
    "200687at33090",
    "201861at33090",
    "202025at33090",
    "203023at33090",
    "203383at33090",
    "203818at33090",
    "204117at33090",
    "204880at33090",
    "205308at33090",
    "206164at33090",
    "206170at33090",
    "207179at33090",
    "207898at33090",
    "208706at33090",
    "208707at33090",
    "208849at33090",
    "209015at33090",
    "209301at33090",
    "209302at33090",
    "209516at33090",
    "210493at33090",
    "210551at33090",
    "210557at33090",
    "210851at33090",
    "21163at33090",
    "211645at33090",
    "212331at33090",
    "212845at33090",
    "213827at33090",
    "213828at33090",
    "214313at33090",
    "215062at33090",
    "215487at33090",
    "215817at33090",
    "216228at33090",
    "216601at33090",
    "217014at33090",
    "21751at33090",
    "217521at33090",
    "21857at33090",
    "218947at33090",
    "219128at33090",
    "219839at33090",
    "220165at33090",
    "220316at33090",
    "220587at33090",
    "220589at33090",
    "220981at33090",
    "22109at33090",
    "223902at33090",
    "225336at33090",
    "22618at33090",
    "227848at33090",
    "228201at33090",
    "22958at33090",
    "229764at33090",
    "229778at33090",
    "229782at33090",
    "230103at33090",
    "231151at33090",
    "231707at33090",
    "233744at33090",
    "234046at33090",
    "23444at33090",
    "238204at33090",
    "238385at33090",
    "23853at33090",
    "24838at33090",
    "24at33090",
    "25435at33090",
    "255at33090",
    "26868at33090",
    "27237at33090",
    "27607at33090",
    "28920at33090",
    "2at33090",
    "31155at33090",
    "31855at33090",
    "32730at33090",
    "32923at33090",
    "33264at33090",
    "34517at33090",
    "35499at33090",
    "35887at33090",
    "36284at33090",
    "37663at33090",
    "37699at33090",
    "383at33090",
    "39913at33090",
    "4004at33090",
    "4034at33090",
    "40630at33090",
    "41146at33090",
    "4115at33090",
    "41244at33090",
    "42407at33090",
    "43683at33090",
    "43957at33090",
    "44063at33090",
    "44526at33090",
    "46307at33090",
    "48027at33090",
    "48290at33090",
    "48645at33090",
    "49092at33090",
    "50512at33090",
    "50528at33090",
    "51214at33090",
    "51262at33090",
    "52348at33090",
    "52435at33090",
    "52795at33090",
    "5305at33090",
    "53416at33090",
    "53527at33090",
    "55448at33090",
    "57004at33090",
    "58672at33090",
    "5927at33090",
    "5at33090",
    "60262at33090",
    "62262at33090",
    "63411at33090",
    "63853at33090",
    "64272at33090",
    "6512at33090",
    "65263at33090",
    "67132at33090",
    "67389at33090",
    "68169at33090",
    "6843at33090",
    "68537at33090",
    "68957at33090",
    "69073at33090",
    "69137at33090",
    "69505at33090",
    "69614at33090",
    "70613at33090",
    "71620at33090",
    "72992at33090",
    "7366at33090",
    "74230at33090",
    "74580at33090",
    "74742at33090",
    "75785at33090",
    "76026at33090",
    "76849at33090",
    "79950at33090",
    "8072at33090",
    "83749at33090",
    "84114at33090",
    "84264at33090",
    "87347at33090",
    "87734at33090",
    "88295at33090",
    "88687at33090",
    "88771at33090",
    "89796at33090",
    "90240at33090",
    "90301at33090",
    "9044at33090",
    "9058at33090",
    "90872at33090",
    "92418at33090",
    "92579at33090",
    "95807at33090",
    "96953at33090",
    "97593at33090",
    "9849at33090"
]

euk_sorted = sorted(eukaryota_genes, key=lambda x: int(x.split("at")[0]))
vir_sorted = sorted(viridiplantae_genes, key=lambda x: int(x.split("at")[0]))

output_filename = "viridiplantae_ids"
with open(output_filename, "w", newline="", encoding="utf8") as csv_file:
    csv_writer = csv.writer(csv_file)
    for gene in euk_sorted:
        csv_writer.writerow([gene.strip('"')])

output_filename = "eukaryota_ids"
with open(output_filename, "w", newline="", encoding="utf8") as csv_file:
    csv_writer = csv.writer(csv_file)
    for gene in vir_sorted:
        csv_writer.writerow([gene.strip('"')])