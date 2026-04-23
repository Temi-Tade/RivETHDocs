<script lang="ts">
    import { browser } from "$app/environment";
	import Header from "../ui/Header.svelte";
	import Landing from "../ui/Landing.svelte";
	import ToTopButton from "../ui/ToTopButton.svelte";

    let showScrollToTopButton: boolean = $state(false);

    if (browser) {
        window.onscroll = function() {
            if (window.scrollY > 100) {
                showScrollToTopButton = true;
            } else { 
                showScrollToTopButton = false;
            }
        }
    }
</script>

<div>
    <Header/>
    <Landing/>

    {#if showScrollToTopButton} 
        <ToTopButton/>
    {/if}
</div>

<!-- nav -->