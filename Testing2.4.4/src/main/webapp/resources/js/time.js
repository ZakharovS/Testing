$("#time").ready(function () {
    var date = new Date();
    var hours = date.getHours();
    if (hours < 10) {
        hours = "0" + hours;
    }
    var minutes = date.getMinutes();
    if (minutes < 10) {
        minutes = "0" + minutes;
    }
    var seconds = date.getSeconds();
    if (seconds < 10) {
        seconds = "0" + seconds;
    }

    var time = hours + ':' + minutes + ':' + seconds;

    document.getElementsByName('time')[0].innerHTML = time;

    window.setTimeout(arguments.callee, 1000);
});