<script>
    export let title = "";
    export let code = "";
    let copied = false;

    async function copyToClipboard() {
        await navigator.clipboard.writeText(code);
        copied = true;
        setTimeout(() => (copied = false), 2000);
    }
</script>

<div class="my-6 rounded-lg bg-[#1e1e1e] overflow-hidden border border-gray-700">
    {#if title}
        <div class="flex justify-between items-center px-4 py-2 bg-[#2d2d2d] border-b border-gray-700">
            <span class="text-xs font-mono text-gray-300">{title}</span>
            <button 
                on:click={copyToClipboard}
                class="text-xs text-gray-400 hover:text-white transition-colors"
            >
                {copied ? "Copied!" : "Copy"}
            </button>
        </div>
    {/if}
    <pre class="p-4 overflow-x-auto"><code class="text-sm text-blue-300 !bg-transparent">{code}</code></pre>
</div>