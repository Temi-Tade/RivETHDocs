<script lang="ts">
    let showCopySuccess = $state(false);
    let { textToCopy } = $props();

    function handleCopy() {
        navigator.clipboard.writeText(textToCopy)
        .then(() => {
            showCopySuccess = true;
            setTimeout(() => {
                showCopySuccess = false;
            }, 2000)
        })
    }

</script>

<div class="absolute top-1 right-2 w-5 h-5">
    <button
        class="!bg-[transparent] !p-0 md:mx-1"
        onclick={handleCopy}>
        <svg width="20" height="20" viewBox="0 0 10 10">
            {#if !showCopySuccess}
                <rect width="3" height="5" x="2.5" y="2" fill="#ccc" stroke="#ccc"/>
                <rect width="3" height="5" x="4.5" y="4" fill="#fff" stroke="#fff"/>
            {:else} 
                <path d="M2 5 L4 7 L8 3" stroke="green" fill="none" stroke-width="1.125"/>
            {/if}
        </svg>
    </button>
</div>