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
		<div class="md:flex overflow-y-auto h-[calc(100vh-3rem)]">
			<div class="md:left-0 top-13 bg-[#fff] md:shadow-l-md z-900 bg-gray-200/50 pr-3">
				<DocNavBar/>
			</div>
		
			<div class="overflow-y-auto md:pl-5 px-2">
				<Info type="info">
					Latest Releases:
					<p>RivETH: v1.5.0</p>
					<p>Documentation: v1.1.0</p>
				</Info>
				{@render children()}
			</div>
		</div>

		<!-- <DocFooter/> -->
	</div>
</div>
