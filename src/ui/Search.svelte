<script lang="ts">
    let { searchParam, onInput } = $props();
</script>

<div class="p-2">
    <input
        class='w-full bg-[#CCC7] rounded-md border-2 border-[#CCC] focus:shadow-[0_0_0_4px_#12c7]'
        type="search"
        bind:value={searchParam}
        oninput={(e) => onInput((e as any).target.value)}
        placeholder="Search..."
    />
</div>