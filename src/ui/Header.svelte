<script>
    import { base } from "$app/paths";
    import Icon from "@iconify/svelte";
</script>

<header class="p-2 shadow-sm sticky top-0 bg-[#fff] h-[3rem] z-999">
    <div class="flex items-center justify-between">
        <div class="flex items-center justify-between">
            <img src="{base}/images/RivETH.png" alt="RivETH" width="25" loading="lazy" class="rounded-sm">
            <h1 class="text-3xl text-bold"><a class="!text-[#333] !no-underline" href="{base}/">RivETH</a></h1>
        </div>

        <div>
            <a class="!text-[var(--theme-color)]" href="https://github.com/Temi-Tade/RivETH">
                <Icon icon="mdi:github" width="30" class="inline" style="color: #123"/>
            </a>
        </div>
    </div>
</header>