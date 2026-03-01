<script lang="ts">
    import { browser } from "$app/environment";
	import Header from "../ui/Header.svelte";
	import Landing from "../ui/Landing.svelte";
	import SetUp from "../ui/SetUp.svelte";
	import ContributionGuide from "../ui/ContributionGuide.svelte";
	import ToTopButton from "../ui/ToTopButton.svelte";
	import AboutRivETH from "../ui/AboutRivETH.svelte";

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
    <AboutRivETH/>
    <SetUp/>
    <ContributionGuide/>

    {#if showScrollToTopButton} 
        <ToTopButton/>
    {/if}
</div>

<!-- nav -->