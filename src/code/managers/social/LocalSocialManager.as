/**
 * Created with IntelliJ IDEA.
 * User: rem
 * Date: 11.04.15
 * Time: 21:10
 * To change this template use File | Settings | File Templates.
 */
package code.managers.social {
import code.data.UserVO;
import code.events.GameEvent;

import code.managers.Manager;

public class LocalSocialManager extends SocialManager
{
    public function LocalSocialManager()
    {
        super();
    }

    /**
     * init
     */
    override public function init():void
    {
        Manager.dispatcher.dispatchEvent(new GameEvent(GameEvent.EVENT_SOCIAL_CONNECT));
    }

    /**
     * inviteFriends
     * @param uid
     * @param callBack
     */
    override public function inviteFriends(uid:String, callBack:Function = null):void
    {
        trace("open invite window");
        callBack(true);
    }

    /**
     * postOnWall
     * @param uid
     * @param callBack
     */
    override public function postOnWall(uid:String, callBack:Function = null):void
    {
        trace("open post on wall window");
        callBack(true);
    }

    /**
     * getAllFriends
     * @param callback
     */
    override public function getAllFriends(callback:Function):void
    {
        var friends:Array = [

            new UserVO("24950" , "Светлана" , "Дмитриева" , "http://cs625422.vk.me/v625422950/243f4/awFA3SrAj8k.jpg" , "0"),
            new UserVO( "57258" , "Тимур" , "Манько" , "http://cs606023.vk.me/v606023258/6afc/qGBl0MJJrNA.jpg" , "0"),
            new UserVO( "175424" , "Варвара" , "Сигинасова" , "http://cs625723.vk.me/v625723424/1f245/Mm04O_a_sv4.jpg" , "0"),
            new UserVO( "231419" , "Татьяна" , "Букреева" , "http://cs621118.vk.me/v621118419/7c18/-vpBT_go83U.jpg" , "0"),
            new UserVO( "262024" , "Надежда" , "Смирнова" , "http://cs619723.vk.me/v619723024/f060/AQDvjhk_oFI.jpg" , "1"),
            new UserVO( "296244" , "Елена" , "Яворская" , "http://cs623417.vk.me/v623417244/2645d/9_pRQKlS_fo.jpg" , "0"),
            new UserVO( "315822" , "Иван" , "Гордеенко" , "http://cs621920.vk.me/v621920822/1bfff/iGdZkbwnQHI.jpg" , "0"),
            new UserVO( "319907" , "Сергей" , "Дудоров" , "http://cs625426.vk.me/v625426907/c057/vHCKR2_yl6M.jpg" , "0"),
            new UserVO( "352233" , "Елена" , "Щеглова" , "http://cs625122.vk.me/v625122233/7a45/2Ipvow2v6_E.jpg" , "0"),
            new UserVO( "544292" , "Анна" , "Полудняк" , "http://cs614720.vk.me/v614720292/1c714/TRf1nMyrvSs.jpg" , "0"),
            new UserVO( "652091" , "Александр" , "Часнык" , "http://cs622829.vk.me/v622829091/1fdac/fBtukpVBcNE.jpg" , "0"),
            new UserVO( "666589" , "Слава" , "Бабанин" , "http://cs614920.vk.me/v614920589/1284/3wnbY_xvgIM.jpg" , "0"),
            new UserVO( "726659" , "Андрей" , "Гавриш" , "http://cs425331.vk.me/v425331659/45fe/K0JzmbdC5qc.jpg" , "1"),
            new UserVO( "1461655" , "Дима" , "Лутченко" , "http://cs305515.vk.me/u1461655/d_cf1901a4.jpg" , "0"),
            new UserVO( "1802990" , "Николай" , "Турский" , "http://cs624530.vk.me/v624530990/21d3b/auk8E5TQVdE.jpg" , "0"),
            new UserVO( "1815075" , "Надежда" , "Лосева" , "http://cs322921.vk.me/v322921075/7eaa/uzyEOFmcJHs.jpg" , "0"),
            new UserVO( "1977424" , "Анютка" , "Померанцева" , "http://cs11113.vk.me/u1977424/d_db8ee66e.jpg" , "0"),
            new UserVO( "2032817" , "Роман" , "Мартынчук" , "http://cs622319.vk.me/v622319817/ab75/MvZzVqFb0Ac.jpg" , "0"),
            new UserVO( "2068668" , "Наталия" , "Федорук" , "http://cs617516.vk.me/v617516668/1dd33/dQGr6lqlYE4.jpg" , "0"),
            new UserVO( "2150111" , "Виталий" , "Павлов" , "http://cs9232.vk.me/v9232111/2165/96Dw2VC8Y2E.jpg" , "0"),
            new UserVO( "2394245" , "Анна" , "Климашевская" , "http://cs619816.vk.me/v619816245/9216/jN4WAJFnepc.jpg" , "0"),
            new UserVO( "2467529" , "Елена" , "Шевчук" , "http://cs625826.vk.me/v625826529/26cb9/iLBBe0IV_3E.jpg" , "0"),
            new UserVO( "2575783" , "Дмитрий" , "Щедров" , "http://cs621929.vk.me/v621929783/126d9/_T2fkgxxWMs.jpg" , "0"),
            new UserVO( "2583151" , "Сервер" , "Каракаш" , "http://cs6065.vk.me/v6065151/127ca/iR9Uyo07glU.jpg" , "0"),
            new UserVO( "2822254" , "Инна" , "Глушкова" , "http://cs621331.vk.me/v621331254/186aa/628FDswDmLY.jpg" , "0"),
            new UserVO( "3161956" , "Таня" , "Соколова" , "http://cs625226.vk.me/v625226956/1f456/FNmc1vyOYgo.jpg" , "0"),
            new UserVO( "3375234" , "Дмитрий" , "Макеев" , "http://cs388.vk.me/u3375234/d_b5867577.jpg" , "0"),
            new UserVO( "3529406" , "Галина" , "Юрасова" , "http://cs619831.vk.me/v619831406/112f1/pxES7abpRWk.jpg" , "0"),
            new UserVO( "3553902" , "Данила" , "Степченко" , "http://cs307200.vk.me/v307200902/77c7/oV5Aw-EUTMw.jpg" , "1"),
            new UserVO( "3579806" , "Евгений" , "Владимирович" , "http://cs624226.vk.me/v624226806/1f1fe/tu7Yubnr1bY.jpg" , "0"),
            new UserVO( "3725807" , "Жека" , "Неважно" , "http://cs9904.vk.me/u3725807/d_342ae955.jpg" , "0"),
            new UserVO( "3875168" , "Дарина" , "Дарьина" , "http://cs617429.vk.me/v617429168/18183/j81kTCCAJvI.jpg" , "0"),
            new UserVO( "3897203" , "Евгений" , "Глушков" , "http://cs624525.vk.me/v624525203/ce2f/THGC66OVRIA.jpg" , "0"),
            new UserVO( "3909879" , "Артём" , "Кушнерик" , "http://cs9328.vk.me/u3909879/d_339b04e1.jpg" , "0"),
            new UserVO( "4083248" , "Сергей" , "Зиновьев" , "http://cs618626.vk.me/v618626248/1a299/eCTcmQNBKW4.jpg" , "0"),
            new UserVO( "4230191" , "Алексей" , "Мошкин" , "http://cs622931.vk.me/v622931191/27c65/DfIMOJxhWDk.jpg" , "0"),
            new UserVO( "4263192" , "Вася" , "Салазко" , "http://cs624424.vk.me/v624424192/146b9/8PBCbzE132g.jpg" , "0"),
            new UserVO( "4271132" , "Наташа" , "Остапенко" , "http://cs621319.vk.me/v621319132/1a76f/xVX-tinPIc0.jpg" , "0"),
            new UserVO( "4559389" , "Дмитрий" , "Павленко" , "http://cs622318.vk.me/v622318389/10326/ETwmCS6QAv8.jpg" , "1"),
            new UserVO( "4571695" , "Оля" , "Погорелова" , "http://cs622923.vk.me/v622923695/1e2be/8rXYZvfNVNo.jpg" , "0"),
            new UserVO( "4598033" , "Ольга" , "Александрова" , "http://cs309923.vk.me/v309923033/a5d3/HkbKsLGGB9Q.jpg" , "0"),
            new UserVO( "4603472" , "Алла" , "Демидова" , "http://cs622028.vk.me/v622028472/26821/PYhX3O6VqKc.jpg" , "0"),
            new UserVO( "4638132" , "Максим" , "Кутишенко" , "http://cs622121.vk.me/v622121132/6380/CbeisEPv6B4.jpg" , "0"),
            new UserVO( "4658667" , "Максим" , "Свистович" , "http://vk.com/images/deactivated_100.gif" , "0"),
            new UserVO( "4906342" , "Юлия" , "Турская" , "http://cs619324.vk.me/v619324342/1af94/Ztyu3SXtZG4.jpg" , "0"),
            new UserVO( "5145256" , "Максим" , "Ринг" , "http://cs621331.vk.me/v621331256/1ae72/gJGfRAvTV44.jpg" , "0"),
            new UserVO( "5252319" , "Александр" , "Глушков" , "http://cs620129.vk.me/v620129319/1c846/bYA2z_m1_Pw.jpg" , "0"),
            new UserVO( "5289872" , "Ирина" , "Добрицина" , "http://cs623919.vk.me/v623919872/2a28/fx41e1GcNwI.jpg" , "0"),
            new UserVO( "5643460" , "Борис" , "Струков" , "http://cs1216.vk.me/u5643460/d_1f13d42d.jpg" , "0"),
            new UserVO( "5805543" , "Николай" , "Макаров" , "http://cs625331.vk.me/v625331543/270a5/iDqtMTHBxZA.jpg" , "0"),
            new UserVO( "5810051" , "Наталья" , "Колтакова" , "http://cs625122.vk.me/v625122051/244a4/FB-6KZ45CRM.jpg" , "0"),
            new UserVO( "5944059" , "Анастасия" , "Третьякова" , "http://cs625127.vk.me/v625127059/a774/wx2oDtY3Zl0.jpg" , "0"),
            new UserVO( "6016569" , "Miji" , "Migi" , "http://cs625623.vk.me/v625623569/24160/968iXMgH2AY.jpg" , "0"),
            new UserVO( "6021479" , "Антон" , "Коб" , "http://cs618628.vk.me/v618628479/3ffb/7yoiqxc9o4E.jpg" , "0"),
            new UserVO( "6366677" , "Санёчек" , "Грицюк" , "http://cs616817.vk.me/v616817677/16415/F7dYSF3u8AU.jpg" , "0"),
            new UserVO( "6398827" , "Николай" , "Миронов" , "http://cs7010.vk.me/c7007/v7007827/15e37/e2jQbbSpnrk.jpg" , "0"),
            new UserVO( "6923356" , "Анна" , "Буракова" , "http://cs10499.vk.me/u6923356/d_1fac1298.jpg" , "0"),
            new UserVO( "7104323" , "Ромка" , "Букреев" , "http://cs625822.vk.me/v625822323/27604/cZCH_B6z1TY.jpg" , "0"),
            new UserVO( "7204465" , "Lost" , "Shadow" , "http://cs624421.vk.me/v624421465/2094a/LL6madpsKns.jpg" , "0"),
            new UserVO( "7642487" , "Алексей" , "Пучков" , "http://cs416429.vk.me/v416429487/1aee/KnAggwqf0-I.jpg" , "0"),
            new UserVO( "7810016" , "Андрей" , "Соколов" , "http://vk.com/images/deactivated_100.gif" , "0"),
            new UserVO( "7810212" , "Саша" , "Кутырёв" , "http://cs617727.vk.me/v617727212/1bcd4/GjDWWNdiLkk.jpg" , "0"),
            new UserVO( "7859404" , "Алена" , "Сушенцева" , "http://cs619225.vk.me/v619225404/1d4f7/SZMP4NS--hQ.jpg" , "0"),
            new UserVO( "7868655" , "Светик" , "Климочкина" , "http://cs410817.vk.me/u7868655/d_4ef9c5a9.jpg" , "0"),
            new UserVO( "7915886" , "Сергей" , "Берсенёв" , "http://cs618417.vk.me/v618417886/10903/5mEHCk2MpPU.jpg" , "0"),
            new UserVO( "7982413" , "Анюта" , "Соколова" , "http://cs619119.vk.me/v619119413/f778/1KebE7Uypso.jpg" , "0"),
            new UserVO( "8130962" , "Артем" , "Перепада" , "http://cs623217.vk.me/v623217962/214a8/LQ66W7BpGP0.jpg" , "1"),
            new UserVO( "8306790" , "Наталія" , "Величко" , "http://cs614925.vk.me/v614925790/29cc1/8qj2r95X2SU.jpg" , "0"),
            new UserVO( "8313673" , "Елена" , "Панина" , "http://cs617828.vk.me/v617828673/15471/YBpoqxS7kFA.jpg" , "1"),
            new UserVO( "8381832" , "Павел" , "Дараган" , "http://cs619731.vk.me/v619731832/21d72/4sOllGCHJcY.jpg" , "0"),
            new UserVO( "8382997" , "Мишаня" , "Капцов" , "http://cs622731.vk.me/v622731997/25740/GEDQzHSE-_A.jpg" , "0"),
            new UserVO( "8421014" , "Александр" , "Козлов" , "http://cs10098.vk.me/u8421014/d_d5241c7e.jpg" , "0"),
            new UserVO( "8808602" , "Майя" , "Ерохина" , "http://cs10291.vk.me/u8808602/d_20c19c61.jpg" , "0"),
            new UserVO( "8915405" , "Егор" , "Жаков" , "http://cs322731.vk.me/v322731405/7842/YZEV8m2JE_o.jpg" , "0"),
            new UserVO( "8951489" , "Игорь" , "Попов" , "http://cs616720.vk.me/v616720489/999c/xmE31hoSnO4.jpg" , "0"),
            new UserVO( "9306734" , "Евгений" , "Шаломеев" , "http://cs625527.vk.me/v625527734/23606/Yd1fHiyYkeg.jpg" , "1"),
            new UserVO( "9602927" , "Игорь" , "Гусаков" , "http://cs10986.vk.me/v10986927/f9c/RJ-0xRy_Lro.jpg" , "0"),
            new UserVO( "9706328" , "Антон" , "Шатских" , "http://cs621424.vk.me/v621424328/1c417/Y37Tq9KmalU.jpg" , "0"),
            new UserVO( "10198741" , "Александр" , "Тарасов" , "http://cs622931.vk.me/v622931741/56f1/fzu3STGnCB0.jpg" , "0"),
            new UserVO( "10337953" , "Елена" , "Тарасова" , "http://cs607817.vk.me/v607817953/d1a/zS0hHIdyOzk.jpg" , "0"),
            new UserVO( "10914319" , "Жанна" , "Скретнева" , "http://cs618120.vk.me/v618120319/17a50/_BLCZURCthM.jpg" , "0"),
            new UserVO( "10957331" , "Евгений" , "Третьяков" , "http://cs406727.vk.me/u10957331/d_75ed1776.jpg" , "0"),
            new UserVO( "11036594" , "Гриша" , "Дворянинов" , "http://cs292.vk.me/u11036594/d_8e2f7c88.jpg" , "0"),
            new UserVO( "11679827" , "Светлана" , "Ясельская" , "http://cs624326.vk.me/v624326827/149c2/7gkwtHCMEug.jpg" , "0"),
            new UserVO( "11751734" , "Оксана" , "Брюховец" , "http://cs620117.vk.me/v620117734/54b8/mrfdMLwIQP8.jpg" , "0"),
            new UserVO( "11901888" , "Сергей" , "Харчук" , "http://cs313518.vk.me/v313518888/6d50/Yf3FBRSafWE.jpg" , "0"),
            new UserVO( "11973566" , "Yulia" , "Svishenko" , "http://cs625517.vk.me/v625517566/251a8/7VQjSgrG7_Q.jpg" , "0"),
            new UserVO( "12129651" , "Александр" , "Скочилов" , "http://cs614616.vk.me/v614616651/fdcd/NfRSM0hgb3g.jpg" , "0"),
            new UserVO( "12209719" , "Артем" , "Будянский" , "http://vk.com/images/camera_100.png" , "0"),
            new UserVO( "12418446" , "Мария" , "Вольская" , "http://cs619126.vk.me/v619126446/15c06/kziuc_TsIVc.jpg" , "0"),
            new UserVO( "12744893" , "Геннадий" , "Крепаков" , "http://cs1776.vk.me/u12744893/d_9b336d2c.jpg" , "0"),
            new UserVO( "12756095" , "Константин" , "Тимченко" , "http://cs624517.vk.me/v624517095/2449d/xTTUghRN62g.jpg" , "0"),
            new UserVO( "13215744" , "Andrey" , "Sova" , "http://cs614627.vk.me/v614627744/1412e/m2cvdNGs0-c.jpg" , "0"),
            new UserVO( "13755118" , "Антон" , "Антонов" , "http://cs421616.vk.me/v421616118/51c1/IelkRDcC2as.jpg" , "0"),
            new UserVO( "14741382" , "Вадим" , "Муравьев" , "http://cs305501.vk.me/u14741382/d_f0540f1c.jpg" , "0"),
            new UserVO( "15282655" , "Ольга" , "Полевая" , "http://cs622119.vk.me/v622119655/24dc4/8jfeBYzQRaw.jpg" , "0"),
            new UserVO( "15339409" , "Владимир" , "Сидоренко" , "http://cs624517.vk.me/v624517409/1cbce/u1WihRkxMPw.jpg" , "0"),
            new UserVO( "16105798" , "Дмитрий" , "Диманов" , "http://vk.com/images/deactivated_100.gif" , "0"),
            new UserVO( "19387669" , "Светлана" , "Коротеева" , "http://cs4478.vk.me/u19387669/d_77270535.jpg" , "0"),
            new UserVO( "20028710" , "Антон" , "Новов" , "http://cs311218.vk.me/v311218710/1eb6/1dPr_K8i4OI.jpg" , "0"),
            new UserVO( "22438792" , "Oleg" , "Rybakov" , "http://cs5609.vk.me/u22438792/d_d7ddd98b.jpg" , "0"),
            new UserVO( "22467959" , "Екатерина" , "Зиновьева" , "http://cs625721.vk.me/v625721959/183b0/mDnjGp4OWHo.jpg" , "0"),
            new UserVO( "23382591" , "Анна" , "Цуканова" , "http://cs407631.vk.me/u23382591/d_c796d2e3.jpg" , "0"),
            new UserVO( "24761693" , "Александр" , "Рыбальченко" , "http://cs616522.vk.me/v616522693/15d4d/JHqHUtUxPKg.jpg" , "0"),
            new UserVO( "29281304" , "Александра" , "Миронова" , "http://cs409916.vk.me/v409916304/927/OdcfJSmbmIs.jpg" , "0"),
            new UserVO( "30093939" , "Владислав" , "Падалко" , "http://cs313230.vk.me/v313230939/8d4f/5mP2n69lhB4.jpg" , "0"),
            new UserVO( "30291043" , "Екатерина" , "Александровна" , "http://cs620227.vk.me/v620227043/1d6b4/cHcvfdVBdb4.jpg" , "0"),
            new UserVO( "31419795" , "Роман" , "Троцкий" , "http://cs622125.vk.me/v622125795/2605f/i84TvyiSEaY.jpg" , "0"),
            new UserVO( "31960284" , "Валентина" , "Шолохова" , "http://cs624416.vk.me/v624416284/27cdd/XTaMsW-i9DE.jpg" , "0"),
            new UserVO( "32097591" , "Галина" , "Волокитина" , "http://cs304303.vk.me/v304303591/4d70/x35BYOVpRSs.jpg" , "0"),
            new UserVO( "37942695" , "Юлия" , "Мицак" , "http://cs623727.vk.me/v623727695/26007/41cVjDTofp4.jpg" , "0"),
            new UserVO( "39084659" , "Тамара" , "Грид" , "http://cs607322.vk.me/v607322659/75b0/qiHDF9Cju2Q.jpg" , "0"),
            new UserVO( "43071294" , "Андрей" , "Пискун" , "http://cs625524.vk.me/v625524294/2a3fc/eJuQ_dMNtMM.jpg" , "0"),
            new UserVO( "47389627" , "Лидия" , "Павленко" , "http://cs613522.vk.me/v613522627/1347e/bgsGmsHlgNc.jpg" , "0"),
            new UserVO( "48443191" , "Сергей" , "Оконенко" , "http://cs616618.vk.me/v616618191/d1a/HphAaNMfJF0.jpg" , "0"),
            new UserVO( "50171971" , "Наталья" , "Фадеева" , "http://cs623821.vk.me/v623821971/2c699/kO8hVau3S44.jpg" , "0"),
            new UserVO( "50311804" , "Maxim" , "Alekseev" , "http://cs624317.vk.me/v624317804/1a502/v8uM76ftPDg.jpg" , "0"),
            new UserVO( "50525351" , "Сергей" , "Болибрух" , "http://cs309217.vk.me/v309217351/c2eb/bBOU41xbOFI.jpg" , "0"),
            new UserVO( "53808364" , "Лера" , "Хурма" , "http://cs621321.vk.me/v621321364/f0b3/TWF4ej3Tn9Q.jpg" , "1"),
            new UserVO( "57254319" , "Антон" , "Егоров" , "http://cs317629.vk.me/u57254319/d_e33ed23e.jpg" , "0"),
            new UserVO( "63679808" , "Светлана" , "Морозова" , "http://cs619616.vk.me/v619616808/9208/w8pFdmXEU74.jpg" , "0"),
            new UserVO( "66377766" , "Александр" , "Сигунцов" , "http://vk.com/images/deactivated_100.gif" , "0"),
            new UserVO( "67352387" , "Александр" , "Трощенко" , "http://cs424617.vk.me/v424617387/5193/E20bT3qpCBI.jpg" , "0"),
            new UserVO( "80838329" , "Владимир" , "Устинов" , "http://cs616616.vk.me/v616616329/1c09e/jumoKrlm8MU.jpg" , "0"),
            new UserVO( "94271031" , "Евгений" , "Богданов" , "http://cs7010.vk.me/c621623/v621623031/11f26/fTh_5Lb80iw.jpg" , "1"),
            new UserVO( "137388399" , "Лия" , "Гутман" , "http://cs622229.vk.me/v622229399/250fe/y3sZ7Ug7Muo.jpg" , "0"),
            new UserVO( "137887386" , "Роман" , "Кронус" , "http://cs320717.vk.me/v320717386/8285/XpFUrWoa8IY.jpg" , "0"),
            new UserVO( "148010698" , "Diana" , "Ogui" , "http://cs623121.vk.me/v623121698/19500/8BHOg2EIOMM.jpg" , "0"),
            new UserVO( "150775035" , "Елена" , "Миронова" , "http://cs624820.vk.me/v624820035/23adc/mVoAc5VNcfU.jpg" , "0"),
            new UserVO( "163269734" , "Мартик" , "Мартимян" , "http://cs5565.vk.me/u163269734/d_4b0dbcdb.jpg" , "0"),
            new UserVO( "173262963" , "Владимир" , "Гончаров" , "http://cs11084.vk.me/u173262963/d_03c8a360.jpg" , "0"),
            new UserVO( "180223658" , "Артём" , "Букреев" , "http://cs313617.vk.me/v313617658/b632/ITkZhFV7JnQ.jpg" , "0"),
            new UserVO( "181033807" , "Светлана" , "Богданенко" , "http://cs409120.vk.me/v409120807/695/hCJx5ld9_Nc.jpg" , "1"),
            new UserVO( "203559469" , "Степан" , "Селиванов" , "http://cs7010.vk.me/c7007/v7007469/16c04/SFTBWdJmHFI.jpg" , "1"),
            new UserVO( "205100519" , "Катя" , "Бойко" , "http://cs624721.vk.me/v624721519/271e7/ttf-Ls_76fY.jpg" , "0"),
            new UserVO( "207584233" , "Светлана" , "Крым" , "http://cs322927.vk.me/v322927233/6692/N4pY9A-sFC4.jpg" , "0"),
            new UserVO( "212509831" , "Ольга" , "Шредер" , "http://cs621417.vk.me/v621417831/8d41/p4MCjSPa5Rk.jpg" , "0"),
            new UserVO( "213587595" , "Настя" , "Бойко" , "http://cs408931.vk.me/v408931595/9449/NG4SVAzRBm4.jpg" , "0"),
            new UserVO( "216671695" , "Саня" , "Камянский" , "http://cs623618.vk.me/v623618695/df20/Ll7TQXt-YOo.jpg" , "0"),
            new UserVO( "216722882" , "Ирина" , "Буз" , "http://cs314224.vk.me/v314224882/198e/ycrjNPRB1uE.jpg" , "0"),
            new UserVO( "218763868" , "Олег" , "Бреславец" , "http://cs312722.vk.me/v312722868/2abb/Xf5ZQ_lD3NM.jpg" , "0"),
            new UserVO( "222601527" , "Юлия" , "Топова" , "http://cs617326.vk.me/v617326527/1b65f/5H98mk6FaUQ.jpg" , "0"),
            new UserVO( "249269046" , "Денис" , "Стариков" , "http://cs623218.vk.me/v623218046/28d09/vPZaMGKZN9U.jpg" , "0"),
            new UserVO( "253458128" , "Ксюша" , "Михайлова" , "http://cs624330.vk.me/v624330128/1729c/WbOXoeifPYg.jpg" , "0"),
            new UserVO( "256058814" , "Капцова" , "Ирина" , "http://cs619917.vk.me/v619917814/b034/cOnALj1DejA.jpg" , "0"),
            new UserVO( "259032025" , "Александр" , "Фоменко" , "http://cs620824.vk.me/v620824025/bea2/TLZHuBILAHw.jpg" , "0"),
            new UserVO( "289498319" , "Ирина" , "Букреева" , "http://cs625527.vk.me/v625527319/2844c/yS-sJfeo7sA.jpg" , "0")];

        callback(friends);
    }
}
}
