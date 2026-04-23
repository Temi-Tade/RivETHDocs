<script lang="ts">
    let {previousHref, nextHref, previousTopic, nextTopic} = $props();
</script>

<div class="flex flex-col md:flex-row justify-between align-center px-2 mt-5">
    {#if previousTopic !== ""}
        <a
            class="mb-2 inline-block border-1 text-center"
            href="{previousHref}">Previous {previousTopic}</a>
    {/if}

    {#if nextTopic !== ""}
        <a 
            class="mb-2 inline-block border-1 text-center"
            href="{nextHref}">Next {nextTopic}</a>
    {/if}
</div>