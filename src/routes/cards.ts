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

const objects: CardInfo[] = [];

const suits: Array<'club' | 'diamond' | 'heart' | 'spade'> = ['club', 'diamond', 'heart', 'spade'];
const names: string[] = ['ace', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king'];

// Generate cards for each suit
for (const suit of suits) {
    for (let i = 0; i < names.length; i++) {
        let cardName = names[i];
        let cardNumber = i + 1; // Number is index + 1 (1-13)

        // Create the card object and push it to the array
        objects.push({ number: cardNumber, suit: suit, name: cardName });
    }
}

console.log(objects);