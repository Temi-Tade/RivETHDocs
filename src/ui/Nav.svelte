<script lang="ts">
    import type Section from "$lib/types/Section.ts";

    const SECTIONS: Section[] = [
        { id: 0, href: "#about", label: "About RivETH" },
        { id: 1, href: "#setup", label: "Set up and Installation" },
        { id: 2, href: "#contribute", label: "Contribution Guide" },
    ];

    let currentSectionIndex = $state(0);
    let showNav = $state(false);
</script>

<div>
    <div>
        <div class="flex items-center justify-left mt-2">
            <p class="mr-2">On this page</p>
            <button 
                class="!bg-[#fff] !text-[#333] flex items-center"
                onclick={() => {
                showNav = !showNav;
            }}>
                {SECTIONS[currentSectionIndex].label}&nbsp;
                <svg width="10" height="10" viewBox="0 0 10 10">
                    {#if !showNav}
                        <path d="M0 0 L5 10 L10 0 Z" fill="#333" stroke="#333" stroke-width="1" stroke-linecap="round"/>
                    {:else}
                        <path d="M0 10 L5 0 L10 10 Z" fill="#333" stroke="#333" stroke-width="1" stroke-linecap="round"/>
                    {/if}
                </svg>
            </button>
        </div>

        {#if showNav}
            <div class="shadow-lg rounded-md border-1 bg-[#fff]">
                {#each SECTIONS as section (section.id)}
                    <p>
                        <a
                            class="inline-block !text-[#333]"
                            href="{section.href}"
                            onclick={() => {
                                currentSectionIndex = section.id;
                                showNav = false;
                            }}>{section.label}</a>
                    </p>
                {/each}
                </div>
        {/if}
    </div>
</div>