
const fs = require('fs');

function parsePass(pass) {
    const row = pass.substring(0,7);
    const col = pass.substring(7);
    const row_binary = row.replace(/F/g, "0").replace(/B/g, "1");
    const col_binary = col.replace(/L/g, "0").replace(/R/g, "1");
    const seat = (parseStringToNumber(row_binary) * 8) + parseStringToNumber(col_binary);
    if (seat > highestSeat) {
        highestSeat = seat;
    }
    return seat;
}

function parseStringToNumber(input) {
    return parseInt( input.split('').join(''), 2 );
}

let highestSeat = 0;
const allSeats = fs.readFileSync('input.txt').toString().split("\n")
    .map(parsePass)
    .sort((a,b)=>a-b);
const totalSeats = allSeats.length;

let missingSeat;
let i = 0;
let curr;
let next;

for (; i < totalSeats - 2; i++) {
    curr = allSeats[i];
    next = allSeats[i+1];
    if (next !== curr + 1) {
        missingSeat = curr + 1;
        break;
    }
}

console.log("(PART 1) Highest seat number: " + highestSeat);
console.log("(PART 2) Your seat: " + missingSeat);