export interface CardInfo {
    number: number;
    suit: string;
    name: string;
    image: string;
}

export const cards: CardInfo[] = [];

const suits: string[] = ['clubs', 'diamonds', 'hearts', 'spades'];
const names: string[] = ['ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king'];
const images: string[] = ['./cards/${name}${suit}.png']

let cardNumber = 0
// Generate cards for each suit and name
for (const suit of suits) {
    for (const name of names) {
        for (const image of images) {
            // Number each card a unique number
            cardNumber += 1
            // Create the card object and push it to the array
            cards.push({ number: cardNumber, suit: suit, name: name, image: image });
        }
    }
}
