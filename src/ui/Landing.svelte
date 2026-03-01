<script lang="ts">
    import type AboutType from "$lib/types/AboutType";
	import { onMount } from "svelte";
	import Nav from "./Nav.svelte";
    import { base } from "$app/paths";

    const ABOUTS: AboutType[] = [
        { id: 0, label: "A local, open-source Ethereum Smart Contract development toolkit that runs right out of the box, in the browser." },
        { id: 1, label: "Quickly prototype, build, deploy and interact with smart contracts in your browser." },
        { id: 2, label: "Install once, use offline." },
        { id: 3, label: "Open source. A tool by developers for developers." },
    ];

    let currentAboutEntryIndex = $state(0);

    onMount(() => {
        setInterval(() => {
            currentAboutEntryIndex += 1;
            if (currentAboutEntryIndex > ABOUTS.length - 1) {
                currentAboutEntryIndex = 0;
            }
        }, 5000);
    });
</script>

<section>
    <div class="h-[94dvh] p-3 flex flex-col justify-center items-center bg-[var(--theme-color)] text-[#fff] relative">
        <div class="absolute top-0">
            <Nav/>
        </div>

        <div>
            <img src="{base}/images/RivETH.png" alt="RivETH" width="100" class="rounded-sm">
        </div>
        <h1 class="text-5xl font-[900] p-1">RivETH</h1>
        <div class="font-[700] italic text-md text-center p-1">
            <p>{ABOUTS[currentAboutEntryIndex].label}</p>
        </div>

        <div class="m-1 p-1">
            <a href="#setup" class="!text-[#fff] !font-bold">Installation and Set up &darr;</a>
            <a href="./docs" class="!text-[#fff] !font-bold">Documentation &rarr;</a>
        </div>
    </div>
</section>