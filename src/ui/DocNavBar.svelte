<script lang="ts">
    import { base } from "$app/paths";
    import { page } from "$app/state";
    import Icon from "@iconify/svelte";
	import Search from "./Search.svelte";

    const PAGES = [
        { id: 0, name: "What is RivETH?", href: `${base}/docs` },
        { id: 1, name: "Getting Started", href: `${base}/docs/getting-started` },
        { id: 2, name: "Writing & Compiling", href: `${base}/docs/compiling` },
        { id: 3, name: "Interacting", href: `${base}/docs/interacting` },
        { id: 4, name: "Other Features", href: `${base}/docs/other` },
        { id: 5, name: "Redeploying a contract", href: `${base}/docs/redeployment` },
        { id: 6, name: "Debugging", href: `${base}/docs/debugging` },
        { id: 7, name: "Cross-contract calls", href: `${base}/docs/cross-contract-calls` },
        { id: 8, name: "RivETHScan", href: `${base}/docs/rivethscan` },
        { id: 9, name: "Injected Providers", href: `${base}/docs/injected-providers` },
        { id: 10, name: "Updating RivETH", href: `${base}/docs/update` },
    ];

    let searchReturnPages: any[] = $state(PAGES);

    const activePageId = $derived(
        PAGES.find(p => p.href === page.url.pathname)?.id ?? 0
    );

    let showNav = $state(false);

    function handleSearchInput(value: string) {
        if (value.trim() === "") {
            searchReturnPages = PAGES;
        } else {
            const lowerValue = value.toLowerCase();
            searchReturnPages = PAGES.filter(p => p.name.toLowerCase().includes(lowerValue));
        }
    }
</script>

<nav class="md:w-70 md:h-[calc(100dvh-3rem)] overflow-y-auto md:pr-4">
    <div class="flex justify-end md:hidden">
        <button
            class="!bg-[transparent] !text-[#333] m-1"
            onclick={() => showNav = !showNav}> <span class={`inline-block md:hidden text-lg font-light`}>
            {#if !showNav }
                <Icon icon='material-symbols:menu' font-size='30px'/>
            {:else}
                <Icon icon='material-symbols:close' font-size='30px'/>
            {/if}
        </span></button>
    </div>

    <div class={`${showNav ? 'h-120 overflow-y-auto' : 'h-0 overflow-hidden'} shadow-md md:h-auto md:shadow-none transition-all duration-300`}>
        <Search searchParam="" onInput={(e:any) =>handleSearchInput(e)}/>
        <ul class="!list-none">
            {#if searchReturnPages.length > 0}
                {#each searchReturnPages as p}
                    <li class="p-1 !my-2 hover:bg-blue-200/50 rounded-tr-md rounded-br-md {activePageId === p.id ? 'shadow-[inset_4px_0_0_0_var(--theme-color)] bg-blue-300/50' : ''}">
                        <a class="!text-[#12c] inline-block w-full !no-underline" href={p.href}>{p.name}</a>
                    </li>
                {/each}
            {:else}
                <p class="text-center text-lg">Oops... No pages found.</p>
            {/if}
        </ul>
    </div>
</nav>
