<h1>Last Card</h1>

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
    let clicked: string = ""

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

    //function dealHand(){
        // all cards
        //let hand = new Set<string>()
        //for (let i = 0; i < handLength; i++) {
        //    const randomIndex = Math.floor(Math.random() * cards.length)
        //    playerHandCards.push(randomIndex)
        //}
        //for (let i = 0; i < handLength; i++) {
        //    const randomIndex = Math.floor(Math.random() * cards.length)
        //    oppositionHandCards.push(randomIndex)
        //}
    //}

    function getRandomObject<T>(array: T[]): T | undefined {
        if (array.length === 0) {
            return undefined;
        }
        const randomIndex = Math.floor(Math.random() * array.length);
        return array[randomIndex];
    }

    function dealTrial(){
        // Player Cards
        for (let i = 0; i < handLength; i++) {
            const randomObject: CardInfo = getRandomObject(cards);
            if (randomObject) {
                console.log(randomObject); // Output: a random object from myArray
            } else {
                console.log('Array is empty');
        }
        

            const index = cards.findIndex(obj => obj.number === randomObject.number && obj.name === randomObject.name);

            if (index !== -1) {
                // Remove the object from the array using splice
                cards.splice(index, 1);
            }
            playerCards.push(randomObject)
        }

        // Opposition cards
        for (let i = 0; i < handLength; i++) {
            const randomObject: CardInfo = getRandomObject(cards);
            if (randomObject) {
                console.log(randomObject); // Output: a random object from myArray
            } else {
                console.log('Array is empty');
        }
        

            const index = cards.findIndex(obj => obj.number === randomObject.number && obj.name === randomObject.name);

            if (index !== -1) {
                // Remove the object from the array using splice
                cards.splice(index, 1);
            }
            oppositionCards.push(randomObject)
        }
        console.log(oppositionCards)

        //console.log(cards);
    }

    //function loadCards(){
        //console.log(playerHandCards)
        //for (let i = 7; i < playerHandCards.length; i++){
            //let int: number = playerHandCards[i]
            //const foundObject = cards.find(obj => obj.number === int);

            //const randomObject = getRandomObject(cards);
            //if (randomObject) {
            //    console.log(randomObject); // Output: a random object from myArray
            //} else {
            //    console.log('Array is empty');
            //}

            //playerCards.push(randomObject)

            // print if it is found
            //if (foundObject) {
            //    console.log('Found object:', foundObject);
            //} else {
            //    console.log('Object with id', int, 'not found');
            //}
        //}
        //console.log(playerCards)
    //}


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

    //dealHand()
    //loadCards()
    dealTrial()

</script>

<svelte:window on:keydown={pauseGame}/>

{#if state === 'paused'}
    <h1>Game paused</h1>
{/if}

{#if state === 'start'}
    <h1>Matching game</h1>
    <button on:click = {() => state = 'playerTurn'}>
        <img src="../favicon.png" alt="card">
    </button>
{/if}

{#if state === 'playing'}
    <div class="cards">
        {#each oppositionCards as oppositionHandCard}
        <button on:click = {() => clicked = oppositionHandCard.name + oppositionHandCard.suit} class="card">
            <div>{oppositionHandCard.name}</div>
            <div>{oppositionHandCard.suit}</div>
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
            <div>Playing card pile</div>
        </button>
    </div>
    <div class="cards">
        {#each playerCards as playerHandCard}
        <button on:click = {() => clicked = playerHandCard.name + playerHandCard.suit} class="card">
            <div>{playerHandCard.name}</div>
            <div>{playerHandCard.suit}</div>
        </button>
        {/each}
    </div>
{/if}

{#if state === 'playing'}
    <div class="cards">
        {#each oppositionCards as oppositionHandCard}
        <button on:click = {() => clicked = oppositionHandCard.name + oppositionHandCard.suit} class="card">
            <div>{oppositionHandCard.name}</div>
            <div>{oppositionHandCard.suit}</div>
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
            <div>Playing card pile</div>
        </button>
    </div>
    <div class="cards">
        {#each playerCards as playerHandCard}
        <button on:click = {() => clicked = playerHandCard.name + playerHandCard.suit} class="card">
            <div>{playerHandCard.name}</div>
            <div>{playerHandCard.suit}</div>
        </button>
        {/each}
    </div>
{/if}

{#if state === 'playerTurn'}
    <div class="cards">
        {#each oppositionCards as oppositionHandCard}
        <div class="card">
            <div>{oppositionHandCard.name}</div>
            <div>{oppositionHandCard.suit}</div>
        </div>
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
            <div>Playing card pile</div>
        </button>
    </div>
    <div class="cards">
        {#each playerCards as playerHandCard}
        <button on:click = {() => state = "opponentTurn"} class="card">
            <div>{playerHandCard.name}</div>
            <div>{playerHandCard.suit}</div>
        </button>
        {/each}
    </div>
{/if}

{#if state === 'opponentTurn'}
    <div class="cards">
        {#each oppositionCards as oppositionHandCard}
        <button on:click = {() => state = "playerTurn"} class="card">
            <div>{oppositionHandCard.name}</div>
            <div>{oppositionHandCard.suit}</div>
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
            <div>Playing card pile</div>
        </button>
    </div>
    <div class="cards">
        {#each playerCards as playerHandCard}
        <div class="card">
            <div>{playerHandCard.name}</div>
            <div>{playerHandCard.suit}</div>
        </div>
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

</style>