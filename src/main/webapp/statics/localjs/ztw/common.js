//获取请求参数
function paramsMap() {
    var url = window.location.href;
    var obj = {};
    var reg = /[?&][^?&]+=[^?&]+/g;
    var arr = url.match(reg);
    if (arr === null) return obj;
    arr.forEach(function (item) {
        var tempArr = item.substring(1).split('=');
        var key = decodeURIComponent(tempArr[0]);
        var val = decodeURIComponent(tempArr[1]);
        obj[key] = val;
    });
    return obj;
}

//object转换成key-value
function object2kv(obj) {
    return JSON.stringify(obj).replace(/\"/g,"").replace(/:/g,"=").replace(/,/g,"&").replace(/[{|}]/g,"")
}
