<script>
    import { base } from "$app/paths";
    import { page } from "$app/state";

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

    const activePageId = $derived(
        PAGES.find(p => p.href === page.url.pathname)?.id ?? 0
    );

    let showNav = $state(false);
</script>

<nav class="md:w-64">
    <div class="flex justify-end md:justify-start">
        <button
            class="!bg-[transparent] !text-[#333] m-1"
            onclick={() => showNav = !showNav}>Navigation <span class={`inline-block md:hidden text-lg font-light ${showNav ? 'rotate-z-0' : 'rotate-z-180'}`}>^</span></button>
    </div>

    <div class={`${showNav ? '' : 'h-0'} overflow-hidden shadow-md md:h-auto md:shadow-none`}>
        <ul class="!list-none">
            {#each PAGES as p}
                <li class="p-1 !my-2 hover:bg-blue-200/50 rounded-tr-md rounded-br-md {activePageId === p.id ? 'shadow-[inset_4px_0_0_0_var(--theme-color)] bg-blue-300/50' : ''}">
                    <a class="!text-[#12c] inline-block w-full !no-underline" href={p.href}>{p.name}</a>
                </li>
            {/each}
        </ul>
    </div>
</nav>
