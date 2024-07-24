<h1>Last Card</h1>

<script lang="ts">
    import { cards } from "./cards";
    import { CardInfo } from "./cards";

    type State = 'start' | 'playing' | 'player turn' | 'opponent turn' | 'paused' | 'won' | 'lost'

    let state: State = 'start'
    let size = 20
    let selected: number[] = []
    let matches: string[] = []
    let timerId: number | null = null
    let time = 60
    let playerHandCards: number[] = []
    let oppositionHandCards: number[] = []
    let playerCards: CardInfo = []

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

    function dealHand(){
        // all cards
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

    function loadCards(){
        console.log(playerHandCards)
        for (let i = 0; i < playerHandCards.length; i++){
            let int: number = playerHandCards[i]
            const foundObject = cards.find(obj => obj.number === int);

            playerCards.push(foundObject)

            // print if it is found
            if (foundObject) {
                console.log('Found object:', foundObject);
            } else {
                console.log('Object with id', int, 'not found');
            }
        }
        console.log(playerCards)
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

    dealHand()
    loadCards()

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
        {#each oppositionHandCards as oppositionHandCard}
        <button class="card">
            <div>{oppositionHandCard}</div>
        </button>
        {/each}
    </div>
    <div class="pickup"></div>
    <div class="cards">
        {#each playerHandCards as playerHandCard}
        <button class="card">
            <div>{playerHandCard}</div>
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