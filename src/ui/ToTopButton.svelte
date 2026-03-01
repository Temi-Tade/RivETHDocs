<script lang="ts">
    import { browser } from "$app/environment";

    function scrollToTop() {
        if (browser) {
            window.scrollTo({ top: 0 });
        }
    }
</script>

<div class="fixed w-15 h-15 bottom-5 right-5 bg">
    <button 
        class="grid place-items-center w-[100%] h-[100%] !rounded-[50%] text-4xl shadow-md"
        onclick={scrollToTop}
        aria-label="Back To Top">
            <svg width="10" height="10" viewBox="0 0 10 10">
                <path d="M0 10 L5 0 L10 10 Z" fill="#fff" stroke="#fff" stroke-width="1" stroke-linecap="round"/>
            </svg>
    </button>
</div>