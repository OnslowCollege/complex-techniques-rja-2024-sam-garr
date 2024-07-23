<h1>Last Card</h1>
<p>Opponent cards</p>
<p>Playing cards</p>
<p>Players cards</p>

<script lang="ts">
    import { cards } from "./cards";

    type State = 'start' | 'playing' | 'player turn' | 'opponent turn' | 'paused' | 'won' | 'lost'

    let state: State = 'start'
    let size = 20
    let grid = createGrid()
    let maxMatches = grid.length / 2 
    let selected: number[] = []
    let matches: string[] = []
    let timerId: number | null = null
    let time = 60

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

    function playerHand(){
        // all cards
        let hand = new Set<string>()
        let handLength: number = 7
        for (let i = 0; i < handLength; i++) {
            const randomIndex = Math.floor(Math.random() * cards.length)
        }
    }

    function createGrid() {
        let cards = new Set<string>()
        let maxSize = size / 2

        while (cards.size < maxSize) {
            const randomIndex = Math.floor(Math.random() * emoji.length)
            cards.add(emoji[randomIndex])
        }

        return shuffle([...cards, ...cards])
    }

    function shuffle<Items>(array: Items[]) {
        return array.sort(() => Math.random() - 0.5 )

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
    console.log(cards)

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