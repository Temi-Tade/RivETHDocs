<script lang="ts">
	import '../../app.css';
	// import DocFooter from '../../ui/DocFooter.svelte';
	import DocNavBar from '../../ui/DocNavBar.svelte';
	import Header from '../../ui/Header.svelte';
	import Info from '../../ui/Info.svelte';

	let { children } = $props();
</script>

<div>
	<Header/>

	<div>
		<div class="md:flex">
			<div class="md:left-0 top-13 bg-[#fff] md:shadow-l-md z-900 bg-gray-200/50">
				<DocNavBar/>
			</div>
		
			<div class="md:overflow-y-auto md:h-[calc(100vh-3rem)] md:pl-5 px-2">
				<Info type="info">
					Latest Releases:
					<span class="block">RivETH: v1.5.0</span>
					<span class="block">Documentation: v1.1.0</span>
				</Info>
				{@render children()}
			</div>
		</div>

		<!-- <DocFooter/> -->
	</div>
</div>
