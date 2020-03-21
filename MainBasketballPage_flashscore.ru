// ==UserScript==
// @name for MainBasketballPage_flashscore.ru
// @description open tab with results for all matches
// @author YourTinyFenrir
// @license MIT
// @version 1.0
// @include https://www.flashscore.ru/basketball/
// @grant    GM_openInTab
// @grant    GM.xmlHttpRequest
// ==/UserScript==

var arrMatch = document.getElementsByClassName("event__match");
var index = 0;

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
    openMatchWindow(index);

}

function openMatchWindow(index) {

    if (index < arrMatch.length) {
        var id = arrMatch[index].id.slice(4);
        var openWindow = window.open("https://www.flashscore.ru/match/" + id + "/#h2h;overall");
        console.log("open");
        isReady(() => openWindow.closed, goToNextMatch);
    }
    else
        window.close();

}

isReady(() => document.getElementsByClassName("event__match")[0] != undefined, () => { openMatchWindow(index); } );
