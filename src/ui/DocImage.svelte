<script>
    let {src, caption} = $props();
</script>

<div class="my-5">
    <figure>
        <img src="{src}" alt="{src.replace(".png", "")}" class="md:w-150 w-200 m-auto rounded-sm" loading="lazy">
        <figcaption class="text-center">{caption}</figcaption>
    </figure>
</div>