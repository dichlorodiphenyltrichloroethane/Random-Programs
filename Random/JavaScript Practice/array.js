var spirit = ["Vodka", "Gin", "Tequila", "Rum"];
console.log(spirit);
var mixAry = ["Vodka", 40];
console.log(mixAry);
mixAry.push("hi");
console.log(mixAry);
//pop() Removes the last element
console.log(mixAry.pop());
console.log(mixAry);
//shift() removes the 1st element
console.log(mixAry.shift());
console.log(mixAry);
//unshift() adds an element to the start of the array
mixAry.unshift("New");
console.log(mixAry);

console.log(JSON.stringify(3));
console.log("Mix array:", JSON.stringify(mixAry));