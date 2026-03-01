<script>
    import { base } from "$app/paths";
    import { page } from "$app/state";

    const PAGES = [
        { id: 0, name: "What is RivETH?", href: `${base}/docs` },
        { id: 1, name: "Getting Started", href: `${base}/docs/getting-started` },
        { id: 2, name: "Writing & Compiling", href: `${base}/docs/compiling` },
        { id: 3, name: "Interacting", href: `${base}/docs/interacting` },
        { id: 4, name: "Advanced Features", href: `${base}/docs/advanced` }
    ];

    const activePageId = $derived(
        PAGES.find(p => p.href === page.url.pathname)?.id ?? 0
    );

    let showNav = $state(false);
</script>

<nav class="sticky top-13 bg-[#fff] md:w-120 md:shadow-l-md z-999">
    <div class="flex justify-end md:justify-start">
        <button
            class="!bg-[transparent] !text-[#333] m-1"
            onclick={() => showNav = !showNav}>Navigation <span class={`inline-block md:hidden text-lg font-light ${showNav ? 'rotate-z-0' : 'rotate-z-180'}`}>^</span></button>
    </div>

    <div class={`${showNav ? '' : 'h-0'} overflow-hidden shadow-md md:h-full`}>
        <ul class="!list-none">
            {#each PAGES as p}
                <li class="p-1 !my-2 {activePageId === p.id ? 'border-l-[10px] border-[var(--theme-color)]' : ''}">
                    <a class="inline-block w-full !no-underline" href={p.href}>{p.name}</a>
                </li>
            {/each}
        </ul>
    </div>
</nav>
