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

var count = 0;

/*function checkDOM() {
    return document.getElementsByClassName("event__match")[0] != undefined;
}*/

function isClosed(w) {
    return w.closed();
}

function waiting(expressionFunction, completionFunction, isDone) {
    /*if (waiting.done) {
        waiting.done = false;
        return completionFunction();
    }

    if (waiting.timer) {
        waiting.ready.push(completionFunction);
    } else {
        if (window.addEventListener)
            window.addEventListener('load', function() { isReady(expressionFunction); }, false);
        else if (window.attachEvent)
            window.attachEvent('onload', function() { isReady(expressionFunction); });
        waiting.ready = [completionFunction];
        waiting.timer = setInterval(function() { isReady(expressionFunction); }, 50);
    }*/

     /*if (window.addEventListener)
            window.addEventListener('load', (completionFunction, isDone) => { isReady(expressionFunction, isDone); }, false);
     else if (window.attachEvent)
            window.attachEvent('onload', (completionFunction, isDone) => { isReady(expressionFunction, isDone); });*/
    //waiting.ready = completionFunction;
    console.log('waiting ' + expressionFunction + ' ' + completionFunction);
    setTimeout(() => { isReady(expressionFunction, completionFunction, isDone); }, 50);
}

function isReady(expressionFunction, completionFunction, isDone) {
  // if (waiting.done) return false;
console.log('isReady ' + expressionFunction + ' ' + completionFunction);
   if (expressionFunction()) {
       //console.log('x')
       //console.log(completionFunction)
       //clearInterval(waiting.timer);
       //waiting.timer = null;

       /*for (var i = 0; i < waiting.ready.length; i++)
           waiting.ready[i]();*/

       //waiting.ready();
       completionFunction();

       //waiting.ready = null;
       if(isDone != null)
           isDone.state = true;
   }
    else
        setTimeout(() => { isReady(expressionFunction, completionFunction, isDone); }, 50);
}

function f1() {
    count++;
    console.log(count);
    f();
}

function f() {

    //var id = document.getElementsByClassName("event__match")[0].id.slice(4);
    //GM_openInTab("https://www.flashscore.ru/match/" + id + "/#h2h;overall")

    var id = document.getElementsByClassName("event__match")[0].id.slice(4);
    var openWindow = window.open("https://www.flashscore.ru/match/" + id + "/#h2h;overall");
    console.log("open");
    waiting(() => openWindow.closed, f1, null);

    /*var arrMatch = document.getElementsByClassName("event__match");
    Array.from(arrMatch).forEach(
        function (currentValue) {
            console.log(currentValue);
            var id = currentValue.id.slice(4);
            var openWindow = window.open("https://www.flashscore.ru/match/" + id + "//#h2h;overall");
            waiting(
        }
    );*/

    /*GM.xmlHttpRequest({
        method: "GET",
        url: "https://www.myscore.ru/match/" + id + "/#h2h;overall",
        onload: function(response) {
        console.log(response.responseText);
        }
    });*/
}

var isDoneFunc = {state: false};

waiting(() => document.getElementsByClassName("event__match")[0] != undefined, f, isDoneFunc);
//var func2 = waiting(() => isDoneFunc, func => { waiting(func => func.done, () => { console.log(5); })});
waiting(() => isDoneFunc.state, () => { console.log(5); }, null);
//console.log(5);
//document.getElementsByClassName("menuTop__item")[0].click()

//var id = document.getElementsByClassName("event__match")[0].id.slice(4);
//GM_openInTab("https://www.flashscore.ru/match/" + id + "/#h2h;overall");
//console.log(id)

//glib_show_hidden('tab-h2h-overall','h2h_home',100); // Показывает большее количество матчей
