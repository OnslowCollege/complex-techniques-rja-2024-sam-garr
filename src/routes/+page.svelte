<h1>Last Card</h1>
<p>Opponent cards</p>
<p>Playing cards</p>
<p>Players cards</p>

<script lang="ts">
    type State = 'start' | 'player turn' | 'opponent turn' | 'paused' | 'won' | 'lost'

    let state: State = 'start'

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
    <h1>Matching game</h1>
    <button on:click = {() => state = 'playing'}>Play</button>
{/if}