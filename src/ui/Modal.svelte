<script lang="ts">
    let { children, onClose } = $props();
</script>

<div class="fixed inset-0 bg-[#7777] z-999 backdrop-filter-[blur(4px)]">
    <div class="p-3 bg-[#fff] w-90 md:w-200 m-auto mt-20 rounded-sm">
        <div class="flex justify-end">
            <button class="!bg-[transparent] !text-[#333] !p-1" onclick={onClose}>&times;</button>
        </div>
        <p>
            {@render children()}
        </p>
    </div>
</div>