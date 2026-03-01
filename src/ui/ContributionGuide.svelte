<script lang="ts">
	import Modal from "./Modal.svelte";

    let showModal = $state(false);
    let modalText = $state("");
</script>

<section id="contribute">
    <div class="p-2">
        <h2 class="text-xl font-bold">Contribution Guide</h2>
        <div>
            <p>RivETH is open source, you can help improve it by contributing. To contribute:</p>
            <ul class="p-2">
                <li>Create a fork of the main repo.</li>
                <li>Clone your forked repo.</li>
                <li>Create an issue with the specific bug fix/change/feature you want to make/add and wait for it to be assigned to you.</li>
                <li>Work on your bug fix/change/feature and push your changes to the forked repo.</li>
                <li>Create a pull request with the bug fix/change/feature you worked on.</li>
                <li>Your PR will be reviewed and then merged if deemed fit.</li>
            </ul>

            <div class="p-2">
                <p>You can also contribute by:</p>
                <ul class="p-2">
                    <li>Giving the <a href="https://github.com/Temi-Tade/RivETH">repo</a> a ⭐️ on GitHub</li>
                    <li>Spreading the word on social media.</li>
                    <li><button class="!bg-[transparent] !text-[var(--theme-color)] underline !p-0"
                            onclick={() => {
                            showModal = true;
                            modalText = `
                                <p class='text-center mb-1'>Send donations to:</p>
                                <p class='text-center'><code class='break-all text-lg'>0x49Df3350fafa751212cCa8AB631cEa6e6ACB2ce6</code></p>
                                <p class='text-center mt-1'>Thank you for yout support.</p>
                            
                            `
                        }}>Donating</button> to RivETH</li>
                </ul>
            </div>
        </div>
    </div>

    {#if showModal}
        <Modal onClose={() => showModal = false}>
            {@html modalText}
        </Modal>
    {/if}
</section>