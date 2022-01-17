function switchFunc(val) {
    var res = "";
    switch(val) {
        case "vodka":
            res = "Belvedere";
            break;
        case "Gin":
            res = "Tanqueray";
            break;
        default:
            res = "Glendronach";
            break;
    }
    return res
}

console.log(switchFunc("Gin"));