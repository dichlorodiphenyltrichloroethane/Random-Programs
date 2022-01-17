var glendronach = {
    "name": "glendronach",
    "age": "21",
    "abv": 48,
    "region": "Speyside",
};

console.log(glendronach.name);
console.log(glendronach["name"]);

delete glendronach.name;
console.log(glendronach.name);