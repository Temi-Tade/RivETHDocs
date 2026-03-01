<script lang="ts">
	import '../app.css';
	import { base } from '$app/paths';

	let { children } = $props();
</script>

<svelte:head>
	<link rel="icon" href="{base}/images/RivETH.png" />
</svelte:head>

{@render children()}