<script lang="ts">
    let { type, children } = $props();
</script>

<div class="border-l-4 p-4 mt-4 rounded-md p-2 text-[#111] {`${type === 'warning' ? 'bg-orange-500/30 border-orange-500' : ''} ${type === 'caution' ? 'bg-red-900/20 border-red-500' : ''} ${type === 'info' ? 'bg-blue-900/20 border-blue-500' : ''}`}">
    <p class="text-sm">{@render children?.()}</p>
</div>

