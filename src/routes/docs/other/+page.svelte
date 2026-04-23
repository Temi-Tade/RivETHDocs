<script>
    import DocBody from "../../../ui/DocBody.svelte";
    import DocHeader from "../../../ui/DocHeader.svelte";
    import DocList from "../../../ui/DocList.svelte";
    import DocNavLinks from "../../../ui/DocNavLinks.svelte";
    import DocSubHead from "../../../ui/DocSubHead.svelte";
    // import Info from "../../../ui/Info.svelte";
    import { base } from "$app/paths";
	import DocImage from "../../../ui/DocImage.svelte";

    let activePageId = 4;

    const PAGES = [
        { id: 0, name: "What is RivETH?", href: `${base}/docs` },
        { id: 1, name: "Getting Started", href: `${base}/docs/getting-started` },
        { id: 2, name: "Writing & Compiling", href: `${base}/docs/compiling` },
        { id: 3, name: "Interacting", href: `${base}/docs/interacting` },
        { id: 4, name: "Other Features", href: `${base}/docs/other` },
        { id: 5, name: "Redeploying a contract", href: `${base}/docs/redeployment` }
    ];

    const OTHER_FEATURES = [
        {header: "Redeploying a Contract"},
        {header: "Multi-Tab Orchestration"},
        {header: "Debugging with Hardhat"},
        {header: "Transaction Analysis with RivETHScan"},
        {header: "Using Injected Providers (Browser Wallets)"}
    ];
</script>

<section>
    <DocHeader>Other Features</DocHeader>
    <div>
        <DocBody>
            <p>Master the full power of RivETH by utilizing features like multi-tab orchestration and the rapid redeployment loop among others to speed up and optimize your workflow.</p>

            <p>In the next sections, these features will be expandedd upon, you will come across some Solidity code snippets, you can refer to the official documentation or use AI to understand complex concepts, if any. The next sections only explains how to use RivETH features in your smart contract development workflow and assumes you have some solidity knowledge.</p>

            <DocSubHead>The features that would be covered include:</DocSubHead>
            <DocList items={OTHER_FEATURES}/>

            <DocNavLinks
                previousHref={activePageId === 0 ? PAGES[activePageId].href : PAGES[activePageId - 1].href}
                nextHref={activePageId === PAGES.length - 1 ? PAGES[activePageId].href : PAGES[activePageId + 1].href}
                previousTopic={activePageId === 0 ? '' : `(${PAGES[activePageId - 1].name})`}
                nextTopic={activePageId === PAGES.length ? '' : `(${PAGES[activePageId + 1].name})`}
            />
        </DocBody>
    </div>
</section>
