// DataTypes: undefined, null, boolean, string, symbol, number, object

var myName = "Jacket";
myName = "Jackey";
console.log(myName);

let myNickName = "Dichloro";
//Only can be used in a scope where it was declared
myNickName = "Dichlorodiphenyl";
console.log(myNickName);

const randName = "CoolMe";
// This will cause an error
// randName = "CoolYou";
console.log(randName);
