<script lang="ts">
	import Icon from "@iconify/svelte";

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

<div class="w-5 h-5 inline-block" title="Copy to clipboard">
    <button
        class="!bg-[transparent] !p-0 md:mx-1"
        onclick={handleCopy}>
        <svg width="20" height="20" viewBox="0 0 10 10">
            {#if !showCopySuccess}
                <Icon icon='ph:copy' font-size='10px' class='text-[#333]'/>
            {:else} 
                <path d="M2 5 L4 7 L8 3" stroke="green" fill="none" stroke-width="1.125"/>
            {/if}
        </svg>
    </button>
</div>