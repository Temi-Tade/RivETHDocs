<script lang="ts">
    let { items } = $props();
</script>

<div>
    <ul>
        {#each items as item}
            <li>
                <h3 class="text-lg inline-block font-bold">{item.header}</h3>
                <p>{@html item.details}</p>
            </li>
        {/each}
    </ul>
</div>