<script lang="ts">
    let { children } = $props();
</script>

<h1 class="text-3xl p-2 font-bold">{@render children?.()}</h1>