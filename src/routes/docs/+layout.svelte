<script lang="ts">
	import '../../app.css';
	import DocFooter from '../../ui/DocFooter.svelte';
	import DocNavBar from '../../ui/DocNavBar.svelte';
	import Header from '../../ui/Header.svelte';

	let { children } = $props();
</script>

<Header/>
<div class="md:flex">
	<DocNavBar/>
	{@render children()}
</div>
<DocFooter/>