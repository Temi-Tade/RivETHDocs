<script lang="ts">
    let { type, children } = $props();
</script>

<div class="p-1 my-2">
    <p class={`rounded-md p-2 text-[#fff] ${type === 'warning' ? 'bg-[#ff7700]' : ''} ${type === 'caution' ? 'bg-[#ff0000]' : ''} ${type === 'info' ? 'bg-[#0000ff]' : ''}`}>{@render children?.()}</p>
</div>