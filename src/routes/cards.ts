interface CardInfo {
    number: number;
    suit: string;
    name: string;
}

// Example array of objects
//const objects: CardInfo[] = [
//    { number: 1, suit: 'club', name: 'jack'},
//    { number: 2, suit: 'club', name: 'two' }
//];

export const objects: CardInfo[] = [];

const suits: string[] = ['club', 'diamond', 'heart', 'spade'];
const names: string[] = ['ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king'];

let cardNumber = 0
// Generate cards for each suit
for (const suit of suits) {
    for (const name of names) {
        // Create the card object and push it to the array
        cardNumber += 1 
        objects.push({ number: cardNumber, suit: suit, name: name });
    }
}

console.log(objects);