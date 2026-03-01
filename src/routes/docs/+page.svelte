<script>
    import {browser} from "$app/environment";
	import DocBody from "../../ui/DocBody.svelte";
	import DocHeader from "../../ui/DocHeader.svelte";
	import DocList from "../../ui/DocList.svelte";
	import DocNavLinks from "../../ui/DocNavLinks.svelte";
	import DocSubHead from "../../ui/DocSubHead.svelte";
	import Info from "../../ui/Info.svelte";
    import {base} from "$app/paths";
	import DocImage from "../../ui/DocImage.svelte";

    let activePageId = 0;

    const PAGES = [
        {
            id: 0,
            name: "what-is-riveth",
            href: browser ? (window.location.href.endsWith("/docs") ? "" : "/docs") : undefined
        },
        {
            id: 1,
            name: "Getting Started",
            href: `${base}/docs/getting-started`
        },

    ];

    const FACTS = [
        {
            header: "Dev-First Workflow",
            details: "Write solidity in a code editor of your choice, run your node in the terminal and interact with it right insode the browser. Write code in editor -> Compile in terminal -> Interact in browser"
        },
        {
            header: "Simple and Fast",
            details: "Built with classic HTML, CSS and JavaScript served on your device, RivETH takes a 'bare-metal' approach to interacting with smart contracts, no need to worry about network latency, you just serve the frontend with a Live Server."
        },
        {
            header: "Smart Compilation and Deployment",
            details: "Compile Smart Contracts with a simple command in the terminal. RivETH grabs the ABI and bytecode of a compiled contract directly from its project files, it automatically sets up your contract's constructor and deploys it with just the click of a button."
        },
        {
            header: "Local Blockchain Node",
            details: "RivETH uses hardhat as its local blockchain node, it automatically sets up all 20 default accounts with funds, you can switch between account easily from a dropdown menu."
        },
        {
            header: "Supports cross-contract calls",
            details: "Cross-contract calls can be made across multiple RivETH tabs."
        },
        {
            header: "Install once, use offline",
            details: "Install with one command, set up dependencies with <code>npm install</code>, and use offline."
        }
    ]

</script>

<section>
    <DocHeader>What is RivETH?</DocHeader>

    <div>
        <DocBody>
            <p><strong>RivETH</strong> is a lightweight Ethereum Smart Contract development toolkit that runs locally and in the browser.</p>
            <DocSubHead>What makes it cool?</DocSubHead>
            <DocList
                items={FACTS}
            />

            <p class="mt-5">No need to rewrite different commands to interact with smart contracts, they are all a button click away. You can fully focus on writing badass smart contracts while RivETH does all the heavy lifiting.</p>
            <Info type="warning">
                While RivETH provides a good framework for quick prototyping and development-level smart contracts, production-grade contracts should be tested with advanced development tools like Foundry.
            </Info>
            <DocNavLinks
                previousHref={activePageId === 0 ? PAGES[activePageId].href : PAGES[activePageId - 1].href}
                nextHref={activePageId === PAGES.length ? PAGES[activePageId].href : PAGES[activePageId + 1].href}
                previousTopic={activePageId === 0 ? '' : `(${PAGES[activePageId - 1].name})`}
                nextTopic={activePageId === PAGES.length ? '' : `(${PAGES[activePageId + 1].name})`}
            />
        </DocBody>
    </div>
</section>