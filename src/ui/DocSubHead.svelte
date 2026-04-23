<script lang="ts">
    let { children } = $props();
</script>

<h2 class="text-xl p-2 font-bold">{@render children?.()}</h2>