// ==UserScript==
// @name for MatchBasketballPages_flashscore.ru
// @description save data about basketball matches
// @author YourTinyFenrir
// @license MIT
// @version 1.0
// @include https://www.flashscore.ru/match/*
// ==/UserScript==

var index = 0;
var numOfMatches = 10;
var numOfHomeMatches = document.getElementsByClassName("head_to_head h2h_home")[1].tBodies.item(0).rows.length;
var numOfAwayMatches = document.getElementsByClassName("head_to_head h2h_away")[1].tBodies.item(0).rows.length;
var numOfMutualMatches = document.getElementsByClassName("head_to_head h2h_mutual")[1].tBodies.item(0).rows.length;

function isReady(expressionFunction, completionFunction) {

   console.log('isReady ' + expressionFunction + ' ' + completionFunction);
   if (expressionFunction())
       completionFunction();
   else
       setTimeout(() => { isReady(expressionFunction, completionFunction); }, 50);

}

function goToNextMatch() {

    index++;
    console.log(index);
    openPastMatchesWindow(index);

}

function saveData(arr, src) {

    for (var i = 0; i < src.length; ++i)
        arr[i] = src[i].innerText;

}

function collectData() {

    var homeArray = new Array();
    var awayArray = new Array();

    var homeSource = document.getElementsByClassName("odd")[0].cells;
    saveData(homeArray, homeSource);

    var awaySource = document.getElementsByClassName("even")[0].cells;
    saveData(awayArray, awaySource);

    window.close();

}

function openPastMatchesWindow(index) {

    if (index < numOfMatches) {
        window.glib_show_hidden('tab-h2h-overall','h2h_home', 1000);
        window.glib_show_hidden('tab-h2h-overall','h2h_away', 1000);
        window.glib_show_hidden('tab-h2h-overall','h2h_mutual', 1000);

        var openHomeWindow = document.getElementsByClassName("head_to_head h2h_home")[1].tBodies.item(0).rows[index].onclick();
        isReady(() => openWindow.closed, () => { } );

        var openAwayWindow = document.getElementsByClassName("head_to_head h2h_away")[1].tBodies.item(0).rows[index].onclick();
        isReady(() => openWindow.closed, goToNextMatch);
    }
    else {
        var mutualArray = new Array();

        for (var i = 0; i < numOfMatches; ++i)
            mutualArray[i] = document.getElementsByClassName("head_to_head h2h_mutual")[1].tBodies.item(0).rows[i].cells[4].innerText;

        console.log("Match script is finished");
        window.close();
    }

}

if (numOfHomeMatches <= numOfMatches && numOfAwayMatches <= numOfMatches && numOfMutualMatches <= numOfMatches) {
    isReady(() => document.getElementsByClassName("info-status mstat")[0].innerText != undefined, () => { } );
    if (document.getElementsByClassName("info-status mstat")[0].innerText != "") // match is finished
        isReady(() => document.getElementsByClassName("parts-first horizontal")[0] != undefined, () => { collectData(); } );
    else
        isReady(() => document.getElementsByClassName("head_to_head h2h_home")[1] != undefined, () => { openPastMatchesWindow(index); } );
}
else
    console.log("Not enough matches to analyze");

/*var date = new Date();
var curDate = null;
do { curDate = new Date(); }
while (curDate-date < 3000);*/
