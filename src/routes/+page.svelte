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

    let state: State = "start";
    let size = 20;
    let selected: number[] = [];
    let matches: string[] = [];
    let timerId: number | null = null;
    let time = 60;
    let playerHandCards: number[] = [];
    let playerCards: CardInfo[] = [];
    let oppositionCards: CardInfo[] = [];
    let handLength: number = 7;
    let clicked: CardInfo[] = [];
    let currentCard: CardInfo[] = [];

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
            const randomCard: CardInfo = getRandomCard(cards);
            if (randomCard) {
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
        }

        // Opposition cards
        for (let i = 0; i < handLength; i++) {
            const randomCard: CardInfo = getRandomCard(cards);
            if (randomCard) {
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

        //console.log(cards);
    }

    function handleLastCardClick() {
        if (playerCards.length === 1) {
            console.log("Last Card!")
        }
    }

    function opponentTurn() {}

    function loadCards() {
        playerCards = [];
        for (const index of playerHandCards) {
            const card = cards[index];
            if (card) {
                playerCards.push(card);
            }
        }
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
            }
        }
    }

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

    dealTrial();
</script>

<svelte:window on:keydown={pauseGame} />

{#if state === "paused"}
    <h1>Game paused</h1>
{/if}

{#if state === "start"}
    <h1>Last Card</h1>
    <button on:click={() => (state = "playerTurn")}>
        <img src="../favicon.png" alt="card" />
    </button>
{/if}

{#if state === "playerTurn"}
    <div class="cards">
        {#each oppositionCards as oppositionHandCard}
            <button class="card">
                <img src="/cards/backcard.png" alt="Back of card" />
            </button>
        {/each}
    </div>
    <div>
        <h1>playerturn</h1>
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
    <button 
    on:click={handleLastCardClick}
    class="last-card-button"
    disabled={playerCards.length !== 1} 
    >
    </button>
{/if}

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
        {/each}
    </div>
    <div>
        <h1>opposition turn</h1>
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
            <button class="card">
                <img
                    src={playerHandCard.image}
                    alt={playerHandCard.name}
                    loading="lazy"
                />
            </button>
        {/each}
    </div>
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
                <img src={playerHandCard.image} alt={playerHandCard.name} />
            </button>
        {/each}
    </div>
{/if}

<style>

.center {
        margin: auto;
        background-color: green;
    }
    .cards {
        display: line;
        grid-template-columns: repeat(auto-fill, minmax(170, 1fr));
        gap: 0.1rem;
    }

    .card {
        height: 170px;
        width: 170px;
        font-size: 1rem;
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
        max-width: 100%;
        max-height: 100%;
        object-fit: cover;
    }

    .last-card-button {
        margin-top: 1rem;
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
        width: auto;
        height: auto;
        line-height: 1.5;
    }

    .last-card-button:disabled {
        background-color: grey;
        cursor: not-allowed;
    }

    .last-card-button:not(:disabled):hover {
        background-color: red;
    }

</style>
