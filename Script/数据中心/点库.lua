-- --======================================================================--
-- -- @作者: GGE研究群: 342119466
-- -- @创建时间:   2018-03-03 02:34:19
-- -- @Last Modified time: 2022-12-20 12:42:23
-- --======================================================================--
-- function 引擎.取点(map)
-- 	local nop = {}
-- 	if map == 1501 then
-- 		nop = {[1]={63,55},[2]={24,15},[3]={85,43},[4]={15,53},[5]={139,69},[6]={249,35},[7]={237,67},[8]={225,46},[9]={195,73},[10]={24,19},[11]={236,32},[12]={20,50},[13]={154,76},[14]={149,121},[15]={194,110},[16]={215,13},[17]={38,130},[18]={47,6},[19]={87,56},[20]={57,103},[21]={202,91},[22]={199,108},[23]={47,85},[24]={172,73},[25]={85,123},[26]={206,21},[27]={135,24},[28]={133,64},[29]={61,49},[30]={129,70},[31]={42,86},[32]={80,53},[33]={151,86},[34]={75,36},[35]={58,128},[36]={42,69},[37]={36,7},[38]={135,71},[39]={256,35},[40]={230,21},[41]={184,125},[42]={145,82},[43]={224,47},[44]={49,22},[45]={272,43},[46]={179,132},[47]={235,47},[48]={32,121},[49]={265,68},[50]={198,113},[51]={275,112},[52]={28,49},[53]={213,35},[54]={121,89},[55]={241,125},[56]={119,95},[57]={106,39},[58]={124,11},[59]={249,82},[60]={127,16},[61]={7,101},[62]={203,115},[63]={225,91},[64]={150,20},[65]={154,76},[66]={69,122},[67]={55,36},[68]={180,75},[69]={83,103},[70]={61,127},[71]={242,102},[72]={65,120},[73]={231,40},[74]={225,63},[75]={53,75},[76]={171,78},[77]={202,31},[78]={63,29},[79]={188,115},[80]={219,23},[81]={37,9},[82]={76,3},[83]={80,58},[84]={233,42},[85]={36,52},[86]={53,75},[87]={185,72},[88]={156,119},[89]={112,18},[90]={199,20},[91]={71,52},[92]={55,79},[93]={17,82},[94]={111,96},[95]={142,86},[96]={239,122},[97]={40,72},[98]={86,103},[99]={230,97},[100]={109,125},[101]={199,123},[102]={250,115},[103]={274,104},[104]={203,33},[105]={275,76},[106]={277,103},[107]={9,53},[108]={60,106},[109]={63,26},[110]={245,27},[111]={22,15},[112]={207,100},[113]={177,30},[114]={47,32},[115]={75,132},[116]={196,70},[117]={226,23},[118]={165,122},[119]={22,46},[120]={110,122},[121]={207,16},[122]={25,78},[123]={207,7},[124]={153,117},[125]={128,88},[126]={130,66},[127]={210,23},[128]={43,88},[129]={248,46},[130]={158,77},[131]={184,22},[132]={89,68},[133]={276,69},[134]={44,132},[135]={223,132},[136]={221,38},[137]={277,74},[138]={116,101},[139]={185,66},[140]={99,46},[141]={222,21},[142]={81,104},[143]={183,12},[144]={10,46},[145]={58,58},[146]={249,96},[147]={184,119},[148]={25,80},[149]={17,80},[150]={186,125},[151]={206,23},[152]={230,15},[153]={206,85},[154]={104,71},[155]={221,93},[156]={56,62},[157]={51,74},[158]={39,19},[159]={209,121},[160]={258,123},[161]={54,73},[162]={211,26},[163]={248,28},[164]={206,81},[165]={192,32},[166]={136,62},[167]={144,120},[168]={104,78},[169]={265,59},[170]={166,84},[171]={218,48},[172]={213,119},[173]={99,82},[174]={39,123},[175]={24,15},[176]={91,53},[177]={230,69},[178]={16,118},[179]={17,133},[180]={199,112},[181]={88,124},[182]={45,118},[183]={263,112},[184]={106,91},[185]={74,115},[186]={180,69},[187]={189,34},[188]={94,111},[189]={46,33},[190]={126,102},[191]={241,80},[192]={173,77},[193]={278,110},[194]={216,23},[195]={94,12},[196]={31,19},[197]={139,83},[198]={81,45},[199]={268,37},[200]={242,124},[201]={106,89},[202]={100,17},[203]={229,35},[204]={87,76},[205]={202,37},[206]={190,24},[207]={211,36},[208]={259,127},[209]={13,57},[210]={106,81},[211]={113,75},[212]={189,59},[213]={191,38},[214]={17,93},[215]={219,87},[216]={270,105},[217]={227,33},[218]={82,121},[219]={91,70},[220]={191,110},[221]={59,121},[222]={167,32},[223]={274,111},[224]={217,86},[225]={51,119},[226]={173,33},[227]={91,96},[228]={192,57},[229]={21,107},[230]={4,94},[231]={247,19},[232]={12,38},[233]={122,69},[234]={181,123},[235]={266,103},[236]={62,37},[237]={132,25},[238]={267,78},[239]={170,33},[240]={91,112},[241]={217,49},[242]={191,130},[243]={10,64},[244]={103,119},[245]={26,110},[246]={205,9},[247]={65,24},[248]={146,17},[249]={48,24},[250]={50,7}}
-- 	elseif map == 1208 then
-- 		nop = {[1]={160,59},[2]={171,58},[3]={27,18},[4]={170,27},[5]={18,30},[6]={120,109},[7]={101,81},[8]={61,19},[9]={126,34},[10]={136,73},[11]={98,89},[12]={148,53},[13]={91,22},[14]={57,12},[15]={42,74},[16]={59,106},[17]={11,26},[18]={140,38},[19]={35,92},[20]={9,82},[21]={133,37},[22]={31,25},[23]={55,20},[24]={138,23},[25]={78,76},[26]={128,60},[27]={156,78},[28]={41,37},[29]={13,27},[30]={34,97},[31]={138,33},[32]={100,73},[33]={92,22},[34]={100,61},[35]={122,77},[36]={41,56},[37]={133,74},[38]={40,72},[39]={25,55},[40]={126,56},[41]={175,87},[42]={73,104},[43]={42,46},[44]={153,76},[45]={21,32},[46]={146,61},[47]={79,73},[48]={151,105},[49]={61,10},[50]={143,55},[51]={36,86},[52]={173,33},[53]={174,85},[54]={131,104},[55]={160,91},[56]={61,68},[57]={7,35},[58]={142,69},[59]={168,54},[60]={138,109},[61]={21,22},[62]={117,45},[63]={59,105},[64]={126,49},[65]={41,78},[66]={56,75},[67]={61,7},[68]={65,67},[69]={3,84},[70]={5,79},[71]={68,109},[72]={97,44},[73]={53,55},[74]={64,74},[75]={86,50},[76]={47,38},[77]={143,44},[78]={63,10},[79]={68,5},[80]={122,31},[81]={5,79},[82]={115,100},[83]={165,58},[84]={144,64},[85]={22,91},[86]={88,78},[87]={64,66},[88]={64,6},[89]={128,106},[90]={124,51},[91]={39,89},[92]={40,39},[93]={39,41},[94]={61,12},[95]={84,77},[96]={41,37},[97]={21,39},[98]={120,74},[99]={50,108},[100]={138,64},[101]={31,96},[102]={84,109},[103]={137,26},[104]={29,88},[105]={131,56},[106]={182,92},[107]={23,55},[108]={85,75},[109]={158,56},[110]={74,79},[111]={134,64},[112]={70,57},[113]={21,33},[114]={11,18},[115]={32,87},[116]={84,49},[117]={167,61},[118]={120,80},[119]={150,104},[120]={50,89},[121]={101,15},[122]={135,11},[123]={41,17},[124]={34,21},[125]={29,39},[126]={69,21},[127]={83,45},[128]={107,75},[129]={76,64},[130]={48,79},[131]={86,28},[132]={111,97},[133]={89,26},[134]={69,81},[135]={109,72},[136]={99,43},[137]={177,58},[138]={16,22},[139]={24,47},[140]={89,37},[141]={27,97},[142]={128,10},[143]={47,19},[144]={90,45},[145]={31,94},[146]={99,16},[147]={133,39},[148]={80,49},[149]={105,13},[150]={29,21},[151]={48,62},[152]={51,89},[153]={165,57},[154]={71,81},[155]={6,37},[156]={67,20},[157]={85,29},[158]={18,35},[159]={47,81},[160]={21,48},[161]={43,57},[162]={151,57},[163]={57,91},[164]={143,100},[165]={142,61},[166]={113,73},[167]={104,84},[168]={76,80},[169]={71,84},[170]={28,17},[171]={155,79},[172]={56,56},[173]={104,36},[174]={141,56},[175]={159,84},[176]={125,8},[177]={98,57},[178]={37,49},[179]={48,81},[180]={114,44},[181]={23,55},[182]={17,29},[183]={111,7},[184]={134,26},[185]={135,60},[186]={37,83},[187]={39,53},[188]={114,76},[189]={159,78},[190]={136,26},[191]={154,64},[192]={111,72},[193]={104,84},[194]={98,46},[195]={45,93},[196]={25,50},[197]={128,35},[198]={24,30},[199]={24,93},[200]={16,66},[201]={135,56},[202]={164,27},[203]={169,57},[204]={43,20},[205]={87,29},[206]={140,33},[207]={90,77},[208]={55,66},[209]={100,75},[210]={132,10},[211]={94,54},[212]={33,26},[213]={28,107},[214]={66,65},[215]={23,89},[216]={96,56},[217]={111,28},[218]={80,110},[219]={44,44},[220]={122,60},[221]={28,51},[222]={161,60},[223]={38,85},[224]={142,66},[225]={26,105},[226]={26,22},[227]={132,72},[228]={131,74},[229]={174,27},[230]={17,45},[231]={46,87},[232]={79,47},[233]={151,95},[234]={104,7},[235]={66,98},[236]={97,80},[237]={94,32},[238]={126,67},[239]={62,61},[240]={142,54},[241]={128,43},[242]={69,107},[243]={72,83},[244]={93,68},[245]={148,84},[246]={110,78},[247]={104,33},[248]={67,106},[249]={157,83},[250]={124,107}}
-- 	elseif map == 1091 then
-- 		nop = {[1]={72,84},[2]={132,81},[3]={54,84},[4]={116,147},[5]={87,63},[6]={26,68},[7]={131,137},[8]={168,95},[9]={57,88},[10]={80,59},[11]={106,26},[12]={65,141},[13]={16,115},[14]={177,9},[15]={175,12},[16]={47,86},[17]={106,43},[18]={129,88},[19]={101,154},[20]={166,24},[21]={49,53},[22]={34,155},[23]={16,109},[24]={40,4},[25]={152,34},[26]={118,80},[27]={174,11},[28]={85,62},[29]={68,148},[30]={28,127},[31]={31,153},[32]={79,54},[33]={152,150},[34]={29,116},[35]={109,15},[36]={163,139},[37]={171,71},[38]={111,151},[39]={58,6},[40]={123,87},[41]={24,119},[42]={89,98},[43]={44,76},[44]={153,20},[45]={164,59},[46]={92,85},[47]={79,90},[48]={129,80},[49]={78,133},[50]={128,54},[51]={180,90},[52]={39,75},[53]={180,100},[54]={98,62},[55]={47,39},[56]={63,114},[57]={37,37},[58]={83,46},[59]={13,134},[60]={96,142},[61]={170,131},[62]={136,107},[63]={60,85},[64]={42,83},[65]={173,10},[66]={108,43},[67]={161,21},[68]={44,137},[69]={77,152},[70]={67,17},[71]={34,147},[72]={138,50},[73]={27,38},[74]={42,103},[75]={55,47},[76]={115,65},[77]={23,149},[78]={143,101},[79]={17,68},[80]={71,152},[81]={80,5},[82]={173,63},[83]={163,58},[84]={181,31},[85]={134,147},[86]={72,117},[87]={156,125},[88]={116,55},[89]={79,59},[90]={128,143},[91]={140,40},[92]={169,152},[93]={67,111},[94]={119,66},[95]={78,48},[96]={114,139},[97]={30,42},[98]={154,69},[99]={155,156},[100]={95,88},[101]={94,125},[102]={108,80},[103]={152,113},[104]={116,44},[105]={146,37},[106]={170,67},[107]={54,100},[108]={20,54},[109]={83,123},[110]={123,15},[111]={152,30},[112]={126,55},[113]={30,83},[114]={118,140},[115]={25,133},[116]={70,63},[117]={146,85},[118]={97,92},[119]={152,44},[120]={179,110},[121]={162,23},[122]={31,105},[123]={93,157},[124]={32,127},[125]={49,101},[126]={140,151},[127]={84,157},[128]={102,157},[129]={162,104},[130]={71,74},[131]={88,12},[132]={49,96},[133]={130,54},[134]={85,12},[135]={125,10},[136]={104,28},[137]={164,100},[138]={121,121},[139]={53,87},[140]={95,20},[141]={102,157},[142]={147,122},[143]={101,95},[144]={178,136},[145]={31,72},[146]={96,97},[147]={19,70},[148]={79,59},[149]={96,144},[150]={96,46},[151]={75,25},[152]={117,16},[153]={46,114},[154]={166,100},[155]={175,158},[156]={162,141},[157]={47,112},[158]={131,87},[159]={110,55},[160]={100,113},[161]={159,124},[162]={149,35},[163]={52,93},[164]={170,129},[165]={91,18},[166]={59,120},[167]={95,66},[168]={63,53},[169]={47,42},[170]={59,112},[171]={156,68},[172]={64,5},[173]={131,102},[174]={50,83},[175]={122,75},[176]={92,49},[177]={35,78},[178]={100,119},[179]={97,28},[180]={136,100},[181]={64,61},[182]={137,89},[183]={144,39},[184]={10,141},[185]={50,87},[186]={83,112},[187]={108,83},[188]={17,121},[189]={141,22},[190]={93,18},[191]={114,139},[192]={78,19},[193]={151,13},[194]={141,50},[195]={24,60},[196]={22,30},[197]={22,99},[198]={50,98},[199]={102,156},[200]={106,5},[201]={116,67},[202]={120,105},[203]={154,4},[204]={179,96},[205]={122,76},[206]={162,94},[207]={164,152},[208]={61,149},[209]={65,129},[210]={138,39},[211]={85,62},[212]={27,106},[213]={96,117},[214]={54,74},[215]={181,7},[216]={96,59},[217]={28,79},[218]={11,63},[219]={139,123},[220]={153,65},[221]={164,132},[222]={27,127},[223]={110,116},[224]={102,91},[225]={50,68},[226]={151,28},[227]={65,125},[228]={64,14},[229]={95,112},[230]={140,132},[231]={78,125},[232]={83,156},[233]={57,114},[234]={156,143},[235]={142,112},[236]={48,146},[237]={112,103},[238]={24,74},[239]={43,141},[240]={123,34},[241]={92,120},[242]={134,107},[243]={106,24},[244]={31,74},[245]={138,23},[246]={113,85},[247]={141,37},[248]={134,158},[249]={159,118},[250]={94,17}}
-- 	elseif map == 1193 then
-- 		nop = {[1]={10,100},[2]={107,20},[3]={72,101},[4]={57,106},[5]={93,91},[6]={110,78},[7]={81,92},[8]={63,40},[9]={49,26},[10]={101,17},[11]={145,22},[12]={26,23},[13]={82,15},[14]={23,89},[15]={117,22},[16]={43,32},[17]={54,102},[18]={145,66},[19]={67,22},[20]={74,60},[21]={22,33},[22]={73,71},[23]={17,70},[24]={135,24},[25]={139,56},[26]={143,48},[27]={103,83},[28]={24,32},[29]={44,29},[30]={111,79},[31]={59,49},[32]={135,85},[33]={102,20},[34]={9,106},[35]={113,84},[36]={98,80},[37]={99,14},[38]={26,49},[39]={91,85},[40]={68,62},[41]={78,13},[42]={110,77},[43]={146,102},[44]={61,40},[45]={55,100},[46]={32,47},[47]={99,14},[48]={70,65},[49]={87,92},[50]={134,67},[51]={79,74},[52]={14,70},[53]={56,100},[54]={89,20},[55]={96,15},[56]={150,24},[57]={65,102},[58]={139,69},[59]={44,32},[60]={62,48},[61]={114,21},[62]={58,58},[63]={17,103},[64]={56,65},[65]={65,59},[66]={47,30},[67]={95,37},[68]={127,18},[69]={53,108},[70]={57,33},[71]={139,52},[72]={4,109},[73]={77,90},[74]={108,82},[75]={13,81},[76]={64,105},[77]={94,37},[78]={15,100},[79]={20,34},[80]={54,26},[81]={113,100},[82]={23,50},[83]={122,105},[84]={89,95},[85]={13,43},[86]={114,65},[87]={51,66},[88]={27,24},[89]={83,78},[90]={22,85},[91]={116,93},[92]={64,98},[93]={64,59},[94]={82,87},[95]={143,61},[96]={24,89},[97]={15,82},[98]={86,20},[99]={85,103},[100]={130,70},[101]={8,42},[102]={127,69},[103]={63,94},[104]={124,20},[105]={69,52},[106]={31,26},[107]={117,104},[108]={136,98},[109]={138,65},[110]={50,26},[111]={146,103},[112]={43,22},[113]={108,76},[114]={128,67},[115]={146,103},[116]={97,108},[117]={140,64},[118]={104,79},[119]={122,75},[120]={20,14},[121]={139,80},[122]={6,71},[123]={132,92},[124]={81,90},[125]={30,28},[126]={125,19},[127]={24,35},[128]={112,25},[129]={20,100},[130]={41,72},[131]={27,13},[132]={85,14},[133]={150,61},[134]={149,88},[135]={66,22},[136]={5,43},[137]={119,77},[138]={62,98},[139]={60,44},[140]={129,108},[141]={73,60},[142]={57,40},[143]={52,52},[144]={133,90},[145]={62,96},[146]={44,68},[147]={136,21},[148]={83,93},[149]={140,18},[150]={86,97},[151]={19,44},[152]={108,12},[153]={79,83},[154]={44,25},[155]={150,64},[156]={126,72},[157]={35,30},[158]={120,84},[159]={148,28},[160]={94,23},[161]={16,71},[162]={77,100},[163]={39,30},[164]={17,10},[165]={18,19},[166]={17,19},[167]={25,52},[168]={41,30},[169]={82,44},[170]={84,103},[171]={123,88},[172]={120,61},[173]={130,73},[174]={108,74},[175]={146,85},[176]={62,56},[177]={83,46},[178]={131,17},[179]={125,21},[180]={86,76},[181]={58,36},[182]={15,43},[183]={68,106},[184]={32,19},[185]={111,77},[186]={89,13},[187]={11,69},[188]={144,68},[189]={85,19},[190]={112,17},[191]={64,51},[192]={12,82},[193]={61,60},[194]={110,83},[195]={96,91},[196]={72,73},[197]={75,88},[198]={90,95},[199]={7,108},[200]={111,19},[201]={134,23},[202]={24,85},[203]={9,104},[204]={143,84},[205]={7,101},[206]={73,92},[207]={21,92},[208]={54,45},[209]={48,27},[210]={65,106},[211]={27,15},[212]={68,57},[213]={98,24},[214]={84,99},[215]={67,50},[216]={40,56},[217]={61,47},[218]={138,97},[219]={21,85},[220]={60,44},[221]={136,26},[222]={144,61},[223]={14,14},[224]={60,20},[225]={103,88},[226]={58,104},[227]={96,88},[228]={66,50},[229]={73,15},[230]={72,48},[231]={142,58},[232]={101,14},[233]={133,90},[234]={28,85},[235]={24,49},[236]={121,100},[237]={126,64},[238]={25,21},[239]={74,90},[240]={45,27},[241]={43,20},[242]={21,16},[243]={71,19},[244]={44,25},[245]={55,62},[246]={58,55},[247]={71,97},[248]={111,8},[249]={102,17},[250]={65,22},[251]={94,20},[252]={40,26},[253]={95,19},[254]={95,19},[255]={17,81},[256]={99,21},[257]={104,110},[258]={146,62},[259]={95,87},[260]={70,56},[261]={124,23},[262]={105,16},[263]={130,63},[264]={120,68},[265]={60,57},[266]={140,81},[267]={3,103},[268]={72,48},[269]={141,65},[270]={135,83},[271]={129,69},[272]={27,26},[273]={25,17},[274]={26,30},[275]={145,21},[276]={108,84},[277]={4,102},[278]={35,81},[279]={37,95},[280]={26,29},[281]={42,56},[282]={8,42},[283]={68,66},[284]={19,11},[285]={123,75},[286]={73,52},[287]={58,36},[288]={25,39},[289]={73,12},[290]={60,57},[291]={96,21},[292]={116,20},[293]={22,33},[294]={97,105},[295]={121,107},[296]={124,89},[297]={10,69},[298]={55,58},[299]={111,20},[300]={141,62}}
-- 	elseif map == 1114 then
-- 		nop = {[1]={26,56},[2]={2,30},[3]={12,60},[4]={8,86},[5]={11,65},[6]={65,52},[7]={59,13},[8]={118,31},[9]={31,44},[10]={31,57},[11]={80,46},[12]={20,60},[13]={88,13},[14]={25,70},[15]={32,30},[16]={28,45},[17]={82,82},[18]={15,33},[19]={81,19},[20]={75,56},[21]={40,26},[22]={29,36},[23]={90,45},[24]={6,16},[25]={65,11},[26]={93,40},[27]={2,21},[28]={89,44},[29]={67,10},[30]={104,80},[31]={105,40},[32]={78,49},[33]={110,41},[34]={8,29},[35]={73,83},[36]={77,46},[37]={109,75},[38]={22,57},[39]={94,35},[40]={101,39},[41]={8,29},[42]={20,24},[43]={35,18},[44]={27,43},[45]={18,15},[46]={110,69},[47]={106,70},[48]={29,27},[49]={81,48},[50]={27,58},[51]={21,62},[52]={62,19},[53]={77,7},[54]={10,18},[55]={28,17},[56]={90,13},[57]={37,50},[58]={3,23},[59]={96,34},[60]={60,15},[61]={27,60},[62]={1,26},[63]={72,47},[64]={58,12},[65]={30,49},[66]={6,72},[67]={92,79},[68]={52,86},[69]={17,26},[70]={32,58},[71]={16,69},[72]={29,63},[73]={68,83},[74]={97,39},[75]={17,55},[76]={72,9},[77]={5,28},[78]={53,86},[79]={55,85},[80]={37,38},[81]={113,71},[82]={26,16},[83]={37,47},[84]={73,46},[85]={4,24},[86]={22,62},[87]={25,33},[88]={93,84},[89]={20,26},[90]={36,32},[91]={79,9},[92]={93,41},[93]={33,46},[94]={51,24},[95]={21,58},[96]={37,52},[97]={113,40},[98]={9,19},[99]={20,43},[100]={3,18},[101]={18,66},[102]={63,84},[103]={11,61},[104]={70,50},[105]={118,85},[106]={27,37},[107]={66,49},[108]={44,39},[109]={25,68},[110]={19,66},[111]={74,55},[112]={118,35},[113]={31,59},[114]={65,52},[115]={20,15},[116]={16,30},[117]={23,25},[118]={16,59},[119]={29,33},[120]={34,21},[121]={36,34},[122]={78,56},[123]={118,32},[124]={30,64},[125]={12,28},[126]={28,41},[127]={4,18},[128]={78,48},[129]={14,42},[130]={19,64},[131]={87,82},[132]={29,59},[133]={86,10},[134]={45,86},[135]={20,57},[136]={62,85},[137]={7,71},[138]={26,66},[139]={89,82},[140]={30,31},[141]={70,50},[142]={116,68},[143]={71,55},[144]={92,32},[145]={114,85},[146]={24,63},[147]={20,71},[148]={37,30},[149]={18,53},[150]={110,79},[151]={18,57},[152]={82,10},[153]={63,58},[154]={29,39},[155]={85,81},[156]={85,77},[157]={33,31},[158]={37,49},[159]={25,36},[160]={25,30},[161]={65,86},[162]={82,76},[163]={38,53},[164]={1,28},[165]={117,35},[166]={70,21},[167]={112,74},[168]={20,59},[169]={91,84},[170]={7,69},[171]={5,69},[172]={7,20},[173]={55,86},[174]={25,69},[175]={35,33},[176]={52,25},[177]={42,60},[178]={59,19},[179]={21,67},[180]={89,79},[181]={45,63},[182]={117,38},[183]={103,78},[184]={16,40},[185]={84,19},[186]={42,54},[187]={8,83},[188]={27,33},[189]={4,69},[190]={67,85},[191]={54,84},[192]={92,41},[193]={25,55},[194]={82,52},[195]={65,86},[196]={35,61},[197]={50,23},[198]={73,9},[199]={13,43},[200]={71,49}}
-- 	elseif map == 1174 then
-- 		nop = {[1]={212,41},[2]={36,14},[3]={82,151},[4]={18,59},[5]={144,141},[6]={99,37},[7]={20,154},[8]={165,47},[9]={123,126},[10]={127,61},[11]={204,56},[12]={51,90},[13]={8,126},[14]={201,125},[15]={20,39},[16]={123,56},[17]={101,9},[18]={58,17},[19]={74,39},[20]={84,97},[21]={115,20},[22]={41,101},[23]={43,159},[24]={48,99},[25]={129,11},[26]={38,149},[27]={159,48},[28]={107,134},[29]={59,63},[30]={77,65},[31]={64,136},[32]={118,19},[33]={143,97},[34]={107,62},[35]={44,33},[36]={154,113},[37]={12,155},[38]={87,149},[39]={151,5},[40]={63,88},[41]={67,146},[42]={53,109},[43]={85,41},[44]={131,36},[45]={32,44},[46]={168,93},[47]={73,88},[48]={112,63},[49]={205,128},[50]={168,131},[51]={107,144},[52]={196,66},[53]={146,113},[54]={54,76},[55]={119,106},[56]={139,84},[57]={65,84},[58]={141,48},[59]={196,117},[60]={196,119},[61]={166,50},[62]={191,66},[63]={108,69},[64]={93,111},[65]={78,151},[66]={185,153},[67]={133,158},[68]={191,113},[69]={136,135},[70]={159,159},[71]={118,33},[72]={122,134},[73]={166,72},[74]={109,11},[75]={7,152},[76]={175,21},[77]={161,102},[78]={162,58},[79]={171,11},[80]={162,90},[81]={145,103},[82]={56,102},[83]={71,116},[84]={134,76},[85]={104,29},[86]={83,63},[87]={195,94},[88]={193,148},[89]={112,57},[90]={104,63},[91]={30,71},[92]={78,28},[93]={90,5},[94]={109,4},[95]={82,58},[96]={195,148},[97]={18,94},[98]={68,158},[99]={12,110},[100]={137,71},[101]={14,51},[102]={153,139},[103]={115,47},[104]={107,20},[105]={117,98},[106]={66,27},[107]={95,24},[108]={202,30},[109]={18,46},[110]={8,145},[111]={64,140},[112]={142,108},[113]={50,68},[114]={109,68},[115]={85,99},[116]={98,88},[117]={39,38},[118]={198,6},[119]={182,94},[120]={152,42},[121]={146,143},[122]={141,87},[123]={1,114},[124]={106,31},[125]={203,36},[126]={98,56},[127]={147,72},[128]={212,146},[129]={50,112},[130]={198,159},[131]={156,91},[132]={9,160},[133]={129,48},[134]={79,121},[135]={77,90},[136]={96,63},[137]={115,59},[138]={39,22},[139]={209,151},[140]={73,23},[141]={62,106},[142]={210,152},[143]={146,56},[144]={212,4},[145]={24,84},[146]={29,106},[147]={116,54},[148]={57,34},[149]={98,123},[150]={90,123},[151]={201,115},[152]={72,57},[153]={63,155},[154]={175,21},[155]={172,93},[156]={202,132},[157]={26,92},[158]={1,139},[159]={94,129},[160]={29,122},[161]={117,45},[162]={39,101},[163]={34,121},[164]={183,119},[165]={63,33},[166]={158,128},[167]={158,55},[168]={189,48},[169]={7,92},[170]={36,32},[171]={53,149},[172]={123,73},[173]={71,59},[174]={150,35},[175]={52,3},[176]={30,73},[177]={90,137},[178]={102,82},[179]={142,107},[180]={84,109},[181]={91,141},[182]={36,10},[183]={123,31},[184]={114,11},[185]={101,104},[186]={151,147},[187]={157,41},[188]={209,136},[189]={5,91},[190]={78,74},[191]={59,131},[192]={94,73},[193]={60,52},[194]={133,85},[195]={140,119},[196]={117,94},[197]={40,110},[198]={187,107},[199]={42,84},[200]={66,32}}
-- 	end
-- 	return nop
-- end
-- -----------
