<<<<<<< HEAD

=======
>>>>>>> origin/Gui-Design
<script lang="ts">
    import { cards } from "./cards";
    import type { CardInfo } from "./cards";

    type State =
        | "start"
        | "playing"
        | "playerTurn"
        | "opponentTurn"
        | "paused"
        | "won"
        | "lost";

<<<<<<< HEAD
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
=======
    let state: State = "start";
    let size = 20;
    let selected: number[] = [];
    let matches: string[] = [];
    let timerId: number | null = null;
    let time = 60;
    let playerCardCount = 0;
    let oppositionCardCount = 0;
    let playerHandCards: number[] = [];
    let playerCards: CardInfo[] = [];
    let oppositionCards: CardInfo[] = [];
    let handLength: number = 7;
    let clicked: CardInfo[] = [];
    let currentCard: CardInfo[] = [];
>>>>>>> origin/Gui-Design

    /* Allow the user to pause the game */
    function pauseGame(e: KeyboardEvent) {
        if (e.key === "Escape") {
            switch (state) {
                case "playing":
                    state = "paused";
                    break;
                case "paused":
                    state = "playing";
                    break;
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
    

    function dealTrial() {
        // Player Cards
        for (let i = 0; i < handLength; i++) {
            const randomCard: CardInfo = getRandomCard(dealPile)
            if (randomCard) {
<<<<<<< HEAD
                // Remove the card from the array
                dealPile = dealPile.filter(card => card !== randomCard);
                playerCards.push(randomCard);
            }
=======
                console.log(randomCard); // Output: a random card from myArray
            } else {
                console.log("Array is empty");
            }

            const index = cards.findIndex(
                (obj) =>
                    obj.number === randomCard.number &&
                    obj.name === randomCard.name,
            );

            if (index !== -1) {
                // Remove the card from the array using splice
                cards.splice(index, 1);
            }
            playerCards.push(randomCard);
>>>>>>> origin/Gui-Design
        }
        playerCardCount = playerCards.length

        // Opposition cards
        for (let i = 0; i < handLength; i++) {
            const randomCard: CardInfo = getRandomCard(dealPile);

            if (randomCard) {
<<<<<<< HEAD
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
=======
                console.log(randomCard); // Output: a random card from myArray
            } else {
                console.log("Array is empty");
            }

            const index = cards.findIndex(
                (obj) =>
                    obj.number === randomCard.number &&
                    obj.name === randomCard.name,
            );

            if (index !== -1) {
                // Remove the card from the array using splice
                cards.splice(index, 1);
            }
            oppositionCards.push(randomCard);
        }
        console.log(oppositionCards);

        oppositionCardCount = oppositionCards.length
        //console.log(cards);
    }

    function handleLastCardClick() {
        if (playerCards.length === 1) {
            console.log("Last Card!")
        }
    }

    function opponentTurn() {
        oppositionCardCount = oppositionCards.length
    }

    function loadCards() {
        playerCards = [];
        for (const index of playerHandCards) {
            const card = cards[index];
            if (card) {
                playerCards.push(card);
            }
>>>>>>> origin/Gui-Design
        }

        // Find cards that can be played based on the current card
        const playableCards = oppositionCards.filter(card => 
            card.suit === currentCard.suit || card.name === currentCard.name
        );

        if (playableCards.length === 0) {
            // If no playable cards, the opponent must draw a card (if applicable)
            console.log('Opponent has no playable cards, must draw a card');
            pickup(oppositionCards)
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
            gameWon(); // End the game if the player has no cards left
            return;
        }

        // Transition back to the player's turn
        state = 'playerTurn';
    }


    function playerTurn() {
        if (
            currentCard.length === 0 ||
            currentCard.suit == clicked.suit ||
            currentCard.name == clicked.name
        ) {
            currentCard = clicked;
            state = "opponentTurn";

            const index = playerCards.findIndex(
                (obj) =>
                    obj.number === currentCard.number &&
                    obj.name === currentCard.name,
            );

            if (index !== -1) {
                // Remove the card from the array using splice
                playerCards.splice(index, 1);
                playerCardCount = playerCards.length;
            }
        }
    }

<<<<<<< HEAD
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


=======
>>>>>>> origin/Gui-Design
    /* Reset game to starting condition */
    function resetGame() {}

    /* When game is won give option to reset */
    function gameWon() {
        state = "won";
        resetGame();
    }

    /* When game is lost give option to reset */
    function gameLost() {
        state = "lost";
        resetGame();
    }

<<<<<<< HEAD
=======
    dealTrial();
>>>>>>> origin/Gui-Design
</script>

<svelte:window on:keydown={pauseGame} />

{#if state === "paused"}
    <h1>Game paused</h1>
{/if}

{#if state === "start"}
    <h1>Last Card</h1>
<<<<<<< HEAD
    <button on:click = {() => {
        dealTrial();
        currentCard = startCard();
        state = 'playerTurn';
    }}>
        <img src="../favicon.png" alt="card">
=======
    <button on:click={() => (state = "playerTurn")}>
        <img src="../start.png" alt="card" />
>>>>>>> origin/Gui-Design
    </button>
{/if}

{#if state === "playerTurn"}
    <div class="cards">
        {#each oppositionCards as oppositionHandCard}
<<<<<<< HEAD
        <button class="card">
        <img src={oppositionHandCard.image} alt={oppositionHandCard.name} loading="lazy" />
        <!-- <img src="/cards/backcard.png" alt="Back of card" /> -->
        </button>
=======
            <button class="card">
                <img src="/cards/backcard.png" alt="Back of card" />
            </button>
>>>>>>> origin/Gui-Design
        {/each}
    </div>
    <div class="card-count">
        <div class="card-counter">{oppositionCardCount}</div>
    </div>
    <div>
        <h1>playerturn</h1>
    </div>
    <div class="center">
<<<<<<< HEAD
        <button on:click = {() => {
            pickup(playerCards);
            state = "opponentTurn";
        }} class="card">
            Pickup card pile
=======
        <button class="card pickup-pile">
            <img src="/cards/backcard.png" alt="Pickup Card Pile" />
>>>>>>> origin/Gui-Design
        </button>
        <button class="card">
            <img src={currentCard.image} alt={currentCard.name} loading="lazy"/>
        </button>
    </div>
    <div class="cards">
        {#each playerCards as playerHandCard}
            <button
                on:click={() => (clicked = playerHandCard)}
                on:click={playerTurn}
                class="card"
            >
                <img
                    src={playerHandCard.image}
                    alt={playerHandCard.name}
                    loading="lazy"
                />
            </button>
        {/each}
    </div>
    <div class="card-count">
    <div class="card-counter player-card-counter">{playerCardCount}</div>
    </div>
    <button 
    on:click={handleLastCardClick}
    class="last-card-button"
    disabled={playerCards.length !== 1} 
    >
        Last Card
    </button>
{/if}

<<<<<<< HEAD
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
=======
{#if state === "opponentTurn"}
    <div class="cards">
        {#each oppositionCards as oppositionHandCard}
            <button
                on:click={() => (clicked = oppositionHandCard)}
                on:click={() => (state = "playerTurn")}
                class="card"
            >
                <img src="/cards/backcard.png" alt="Back of card" />
            </button>
>>>>>>> origin/Gui-Design
        {/each}
    </div>
    <div class="card-count">
        <div class="card-counter">{oppositionCardCount}</div>
    </div>
    <div>
        <h1>opposition turn</h1>
    </div>
    <div class="center">
        <button class="card pickup-pile">
            <img src="/cards/backcard.png" alt="Pickup Card Pile" />
        </button>
        <button class="card">
            <img src={currentCard.image} alt={currentCard.name} loading="lazy"/>
        </button>
    </div>
    <div class="cards">
        {#each playerCards as playerHandCard}
            <button class="card">
                <img
                    src={playerHandCard.image}
                    alt={playerHandCard.name}
                    loading="lazy"
                />
            </button>
        {/each}
    </div>
    <div class="card-count">
    <div class="card-counter player-card-counter">{playerCardCount}</div>
    </div>
    <button 
    on:click={handleLastCardClick}
    class="last-card-button"
    disabled 
    >
        Last Card
    </button>
{/if}

{#if state === "playing"}
    <div class="cards">
        {#each oppositionCards as oppositionHandCard}
            <button
                on:click={() => (clicked = oppositionHandCard)}
                class="card"
            >
                <img src="/cards/backcard.png" alt="Back of card" />
            </button>
        {/each}
    </div>
    <div class="card-count">
        <div class="card-counter">{oppositionCardCount}</div>
    </div>
    <div>
        <h1>{clicked}</h1>
    </div>
    <div class="center">
        <button class="card pickup-pile">
            <img src="/cards/backcard.png" alt="Pickup Card Pile" />
        </button>
        <button class="card">
            <img src={currentCard.image} alt={currentCard.name} />
        </button>
    </div>
    <div class="cards">
        {#each playerCards as playerHandCard}
            <button on:click={() => (clicked = playerHandCard)} class="card">
                <img src={playerHandCard.image} alt={playerHandCard.name} loading="lazy"/>
            </button>
        {/each}
    </div>
    <div class="card-count">
    <div class="card-counter player-card-counter">{playerCardCount}</div>
    </div>
{/if}

<style>

.center {
        margin: auto;
        background-color: hsl(122, 92%, 20%);
    }
    .cards {
        display: flex;
        grid-template-columns: repeat(auto-fill, minmax(170px, 1fr));
        gap: 8px;
    }

    .card {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        font-size: 1rem;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        background: none;
        max-width: 90%;
        max-height: 90%;

        &.selected {
            border: 4px solid var(--border);
        }

        &.flip {
            rotate: y 180deg;
            pointer-events: none;
        }

        & .back {
            position: absolute;
            inset: 0;
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
        display: block;
        max-width: 100%;
        max-height: 100%;   
        object-fit: scale-down;
    }

<<<<<<< HEAD
</style>
=======
    .last-card-button {
        position: fixed;
        bottom: 1rem;
        right: 1rem;    
        padding: 0.5rem 1rem;
        font-size: 0.9rem;
        border: none;
        border-radius: 4px;
        background-color: green;
        color: white;
        cursor: pointer;
        transition: background-color 0.3s ease;
        text-align: center;
        display: inline-block;
    }

    .last-card-button:disabled {
        background-color: grey;
        cursor: not-allowed;
    }

    .last-card-button:not(:disabled):hover {
        background-color: red;
    }


    .card-count {
        display: flex;
        flex-direction: column;
        align-items: left;
        margin: 0;
    }

    .card-counter {
        font-size: 1.2rem;
        padding: 0.5rem;
        background-color: white;
        color: black;
        border: 2px black;
        border-radius: 0.5rem;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        text-align: center;
        width: 100px;
        margin-bottom: 1rem;
    }

        .player-card-counter {
            margin-top: 1rem;
        }
    

</style>
>>>>>>> origin/Gui-Design
