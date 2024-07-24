export interface CardInfo {
    number: number;
    suit: string;
    name: string;
}

export const cards: CardInfo[] = [];

const suits: string[] = ['club', 'diamond', 'heart', 'spade'];
const names: string[] = ['ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king'];

let cardNumber = 0
// Generate cards for each suit and name
for (const suit of suits) {
    for (const name of names) {
        // Number each card a unique number
        cardNumber += 1 
        // Create the card object and push it to the array
        cards.push({ number: cardNumber, suit: suit, name: name });
    }
}
