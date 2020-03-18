// ==UserScript==
// @name for MatchBasketballPages_flashscore.ru
// @description save data about basketball matches
// @author YourTinyFenrir
// @license MIT
// @version 1.0
// @include https://www.flashscore.ru/match/*
// ==/UserScript==

function f() {
    /*var date = new Date();
    var curDate = null;
    do { curDate = new Date(); }
    while (curDate-date < 1500);*/

    /*window.glib_show_hidden('tab-h2h-overall','h2h_home', 1000);
    window.glib_show_hidden('tab-h2h-overall','h2h_away', 1000);
    window.glib_show_hidden('tab-h2h-overall','h2h_mutual', 1000);*/

    var win = document.getElementsByClassName("head_to_head h2h_home")[1].tBodies.item(0).rows[0].onclick();

    /*document.getElementsByClassName("head_to_head h2h_away")[1].tBodies.item(0).rows[0].onclick();
    document.getElementsByClassName("head_to_head h2h_mutual")[1].tBodies.item(0).rows[0].onclick();*/

    window.close();
}

//waiting(f);

 var date = new Date();
    var curDate = null;
    do { curDate = new Date(); }
    while (curDate-date < 5000);

window.close();

