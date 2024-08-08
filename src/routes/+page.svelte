
<script lang="ts">
    import { cards } from "./cards";
    import type { CardInfo } from "./cards";

    type State = 'start' | 'playing' | 'playerTurn' | 'opponentTurn' | 'paused' | 'won' | 'lost'

    let state: State = 'start'
    let size = 20
    let selected: number[] = []
    let matches: string[] = []
    let timerId: number | null = null
    let time = 60
    let playerHandCards: number[] = []
    let playerCards: CardInfo[] = []
    let oppositionCards: CardInfo[] = []
    let handLength: number = 7
    let clicked: CardInfo[] = []
    let currentCard: CardInfo[] = []
    let dealPile: CardInfo[] = cards

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


    function getRandomCard<T>(array: T[]): T | undefined {
        if (array.length === 0) {
            return undefined;
        }
        const randomIndex = Math.floor(Math.random() * array.length);
        return array[randomIndex];
    }
    

    function dealTrial(){
        // Player Cards
        for (let i = 0; i < handLength; i++) {
            const randomCard: CardInfo = getRandomCard(dealPile)
            if (randomCard) {
                // Remove the card from the array
                dealPile = dealPile.filter(card => card !== randomCard);
                playerCards.push(randomCard);
            }
        }

        // Opposition cards
        for (let i = 0; i < handLength; i++) {
            const randomCard: CardInfo = getRandomCard(dealPile);

            if (randomCard) {
                // Remove the card from the array
                dealPile = dealPile.filter(card => card !== randomCard);
                oppositionCards.push(randomCard);
            }
        }
    }

    function opponentTurn() {
        // Check if the opponent has any cards left
        if (oppositionCards.length === 0) {
            console.log('Opponent has no cards left');
            gameWon(); // End the game if the opponent has no cards left
            return;
        }

        // Find cards that can be played based on the current card
        const playableCards = oppositionCards.filter(card => 
            card.suit === currentCard.suit || card.name === currentCard.name
        );

        if (playableCards.length === 0) {
            // If no playable cards, the opponent must draw a card (if applicable)
            console.log('Opponent has no playable cards, must draw a card');
            // If there is a draw pile, implement logic to draw a card and add to opponent's hand
            // For simplicity, we'll skip drawing a card in this example
            state = 'playerTurn'; // End the opponent's turn if they have no playable cards
            return;
        }

        // Select a random card from the playable cards
        const randomIndex = Math.floor(Math.random() * playableCards.length);
        const cardToPlay = playableCards[randomIndex];

        // Update the current card with the card played by the opponent
        currentCard = cardToPlay;

        // Remove the card from the opponent's hand
        const cardIndex = oppositionCards.findIndex(card => 
            card.number === cardToPlay.number && card.name === cardToPlay.name
        );
        if (cardIndex !== -1) {
            oppositionCards.splice(cardIndex, 1);
        }

        console.log('Opponent played:', cardToPlay);

        // Check for win/loss conditions (e.g., if the player has no cards left)
        if (playerCards.length === 0) {
            gameLost(); // End the game if the player has no cards left
            return;
        }

        // Transition back to the player's turn
        state = 'playerTurn';
    }


    function playerTurn() {
        if (currentCard.length === 0 || currentCard.suit == clicked.suit || currentCard.name == clicked.name) {
            currentCard = clicked
            state = 'opponentTurn'

            const index = playerCards.findIndex(obj => obj.number === currentCard.number && obj.name === currentCard.name);

            if (index !== -1) {
                // Remove the card from the array using splice
                playerCards.splice(index, 1);
            }
        }
    }

    function pickup(competitor) {

        const randomCard: CardInfo = getRandomCard(dealPile)

        if (randomCard) {
            // Remove the card from the array
            dealPile = dealPile.filter(card => card !== randomCard);
            competitor.push(randomCard);
        }
    }

    function startCard() {
        const randomCard: CardInfo = getRandomCard(dealPile)

        if (randomCard) {
            // Remove the card from the array
            dealPile = dealPile.filter(card => card !== randomCard);
            return randomCard
        }
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

</script>

<svelte:window on:keydown={pauseGame}/>

{#if state === 'paused'}
    <h1>Game paused</h1>
{/if}

{#if state === 'start'}
    <h1>Last Card</h1>
    <button on:click = {() => {
        dealTrial();
        currentCard = startCard();
        state = 'playerTurn';
    }}>
        <img src="../favicon.png" alt="card">
    </button>
{/if}

{#if state === 'playerTurn'}
    <div class="cards">
        {#each oppositionCards as oppositionHandCard}
        <button class="card">
        <img src={oppositionHandCard.image} alt={oppositionHandCard.name} loading="lazy" />
        <!-- <img src="/cards/backcard.png" alt="Back of card" /> -->
        </button>
        {/each}
    
    </div>
    <div>
        <h1>playerturn</h1>
    </div>
    <div class="center">
        <button on:click = {() => {
            pickup(playerCards);
            state = "opponentTurn";
        }} class="card">
            Pickup card pile
        </button>
        <button class="card">
            <img src={currentCard.image} alt={currentCard.name} />
        </button>
    </div>
    <div class="cards">
        {#each playerCards as playerHandCard}
        <button on:click = {() => clicked = playerHandCard} on:click = {playerTurn} class="card">
        <img src={playerHandCard.image} alt={playerHandCard.name} loading="lazy" />
        </button>
        {/each}
    </div>
{/if}

{#if state === 'opponentTurn'}

    {setTimeout(() => {
        opponentTurn();
    }, 2000)}
    
    <div class="cards">
        {#each oppositionCards as oppositionHandCard}
        <button class="card">
        <img src={oppositionHandCard.image} alt={oppositionHandCard.name} loading="lazy" />
        <!-- <img src="/cards/backcard.png" alt="Back of card" /> -->
        </button>
        {/each}
    
    </div>
    <div>
        <h1>opposition turn</h1>
    </div>
    <div class="center">
        <button class="card">
            <div>Pickup card pile</div>
        </button>
        <button class="card">
            <img src={currentCard.image} alt={currentCard.name} />
        </button>
    </div>
    <div class="cards">
        {#each playerCards as playerHandCard}
        <button class="card">
        <img src={playerHandCard.image} alt={playerHandCard.name} loading="lazy" />
        </button>
        {/each}
    </div>
{/if}

{#if state === 'playing'}
    <div class="cards">
        {#each oppositionCards as oppositionHandCard}
        <button on:click = {() => clicked = oppositionHandCard} class="card">
        <img src="/cards/backcard.png" alt="Back of card" />
        </button>
        {/each}
    
    </div>
    <div>
        <h1>{clicked}</h1>
    </div>
    <div class="center">
        <button class="card">
            <div>Pickup card pile</div>
        </button>
        <button class="card">
            <img src={currentCard.image} alt={currentCard.name} />
        </button>
    </div>
    <div class="cards">
        {#each playerCards as playerHandCard}
        <button on:click = {() => clicked = playerHandCard} class="card">
            <img src={playerHandCard.image} alt={playerHandCard.name} />
        </button>
        {/each}
    </div>
{/if}

<style>

    .center {
        margin: auto;
    }
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

</style>