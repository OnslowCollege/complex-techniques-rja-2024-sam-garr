<h1>Last Card</h1>

<script lang="ts">
    import { cards } from "./cards";
    import type { CardInfo } from "./cards";

    type State = 'start' | 'playing' | 'player turn' | 'opponent turn' | 'paused' | 'won' | 'lost'

    let state: State = 'start'
    let size = 20
    let selected: number[] = []
    let matches: string[] = []
    let timerId: number | null = null
    let time = 60
    let playerHandCards: number[] = []
    let oppositionHandCards: number[] = []
    let playerCards: CardInfo[] = []

    /* Allow the user to pause the game */
    function pauseGame(e: KeyboardEvent) {
        if (e.key === 'Escape' ) {
            switch (state) {
                case 'playing': 
                    state = 'paused'
                    break
                case 'paused':
                    state = 'playing'
                    break
            }
        }
    }

    function dealHand() {
        let hand = new Set<string>()
        let handLength: number = 7
        for (let i = 0; i < handLength; i++) {
            const randomIndex = Math.floor(Math.random() * cards.length)
            playerHandCards.push(randomIndex)
        }
        for (let i = 0; i < handLength; i++) {
            const randomIndex = Math.floor(Math.random() * cards.length)
            oppositionHandCards.push(randomIndex)
        }
    }

    function getRandomCard(): CardInfo | undefined {
        if (cards.length === 0) {
            return undefined;
        }
        const randomIndex = Math.floor(Math.random() * cards.length);
        return cards[randomIndex];
    }

    function dealTrial(){
        const randomCard = getRandomCard();
        if (randomCard) {
            console.log(randomCard); // Output: a random card from Array
            const index = cards.findIndex(obj => obj.number === randomCard.number && obj.name === randomCard.name);
        
        if (index !== -1) {
            // Remove the card from the array using splice
            cards.splice(index, 1);
        }
        } else {
            console.log('Array is empty');
        }

        //console.log(cards);
    }

    function loadCards() {
        playerCards = [];
        for (const index of playerHandCards) {
            const card = cards[index];
            if (card) {
                playerCards.push({
                    ...card, 
                image: getImagePath(card.name, card.suit)});
            }
        }
    }



    const cardImages = import.meta.glob('/cards/*.png', {eager: true}) as Record<string, {default: string}>;

    function getImagePath(name: string, suit: string): string {
        const path = `/cards/${name}${suit}.png`;
        if (cardImages[path]) {
        console.log('Requested Path:', path);
        return cardImages[path].default;
        }
        return '/cards/*.png';
    }


    /* Reset game to starting condition */
    function resetGame() {
    }


    /* When game is won give option to reset */
    function gameWon() {
        state = 'won'
        resetGame()
    }


    /* When game is lost give option to reset */
    function gameLost() {
        state = 'lost'
        resetGame()
    }

    // Load hand and cards
    dealHand();
    loadCards();
    dealTrial();

</script>

<svelte:window on:keydown={pauseGame}/>

{#if state === 'paused'}
    <h1>Game paused</h1>
{/if}

{#if state === 'start'}
    <h1>Matching game</h1>
    <button on:click = {() => state = 'playing'}>
        <img src="../favicon.png" alt="card">
    </button>
{/if}

{#if state === 'playing'}
    <div class="cards">
        {#each oppositionHandCards as card}
        <button class="card">
            <img src="/cards/backcard.png" alt="Back of card" />
        </button>
        {/each}
    </div>
    <div class="pickup"></div>
    <div class="cards">
        {#each playerCards as card}
        <button class="card">
            <img src={getImagePath(card.name, card.suit)} alt={card.name} />
        </button>
        {/each}
    </div>
{/if}


<style>
    .cards {
        display: grid;
        grid-template-columns: repeat(7, 1fr);
        gap: 0.4rem;
    }

    .card {
        height: 140px;
        width: 140px;
        font-size: 1rem;
        background-color: var(--bg-2);
        transition: rotate 0.3s ease-out;
        transform-style: preserve-3d;

        &.selected {
            border: 4px solid var(--border);
        }


        &.flip {
            rotate: y 180deg;
            pointer-events: none;
        }

        & .back {
            position: absolute;
            inset:0 ;
            display: grid;
            place-content: center;
            backface-visibility: hidden;
            rotate: y 180deg;
        }

        & .match {
            transition: opacity 0.3s ease-out;
            opacity: 0.4;
        }
    }

    .card img {
        max-width: 100%;
        max-height: 100%;
        object-fit: cover;
    }

    .pickup {
        height: 140px;
        width: 140px;
        font-size: 4rem;
        background-color: var(--bg-2);
        transition: rotate 0.3s ease-out;
        transform-style: preserve-3d;

        &.selected {
            border: 4px solid var(--border);
        }

        &.flip {
            rotate: y 180deg;
            pointer-events: none;
        }

        & .back {
            position: absolute;
            inset:0 ;
            display: grid;
            place-content: center;
            backface-visibility: hidden;
            rotate: y 180deg;
        }

        & .match {
            transition: opacity 0.3s ease-out;
            opacity: 0.4;
        }
    }

    .matches {
        display: flex;
        gap: 1rem;
        margin-block: 2rem;
        font-size: 3rem;
    }

    .timer {
        transition: color 0.3s ease;
    }

    .pulse {
        color: var(--pulse);
        animation: pulse 1s infinite ease;
    }

    @keyframes pulse {
        to {
            scale: 1.4;
        }
    }
</style>