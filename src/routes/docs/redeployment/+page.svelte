<script>
    import { base } from "$app/paths";
	import DocBody from "../../../ui/DocBody.svelte";
	import DocList from "../../../ui/DocList.svelte";
	import DocNavLinks from "../../../ui/DocNavLinks.svelte";
	import DocSubHead from "../../../ui/DocSubHead.svelte";
	import Info from "../../../ui/Info.svelte";

    let activePageId = 5;

    const PAGES = [
        { id: 0, name: "What is RivETH?", href: `${base}/docs` },
        { id: 1, name: "Getting Started", href: `${base}/docs/getting-started` },
        { id: 2, name: "Writing & Compiling", href: `${base}/docs/compiling` },
        { id: 3, name: "Interacting", href: `${base}/docs/interacting` },
        { id: 4, name: "Other Features", href: `${base}/docs/other` },
        { id: 5, name: "Redeploying a contract", href: `${base}/docs/redeployment` },
        { id: 6, name: "Debugging", href: `${base}/docs/debugging` }
    ];

    const OTHER_TIPS = [
        {
            header: "The 'Load' Refresh",
            details: "Made a code change? Just click <strong>Load</strong> in RivETH to refresh the ABI and Bytecode. No need to restart your node or refresh the page."
        },
        {
            header: "Node Persistence",
            details: "RivETH remains connected to the local Hardhat node as long as your terminal session (<code>npx hardhat node</code>) is active."
        }
    ];
</script>

<section>
    <div>
        <DocBody>
            <DocSubHead>Rapid Redeployment</DocSubHead>
            <p>Made a mistake in your logic? The conventional way to update the UI to match your current ABI and Bytecode changes would be to refresh the page, but RivETH was developed with elegance at its core.</p>
            <p>The "Fix-to-Test" loop in RivETH is designed to be as fast as it can be.</p>
                    
            <Info type="info">
                <strong>The Loop:</strong> Update code in VS Code &rarr; compile with <code>make [File]</code> or <code>./compile [File]</code> &rarr; Click <strong>Load</strong> in RivETH &rarr; Click <strong>Deploy</strong>.
            </Info>

            <p>This fetches the latest artifacts and updates the UI accordingly.</p>

            <Info type="warning">
                <strong>Warning:</strong> By default, the Live Server extension triggers a page refresh when you save changes to a file. This has been disabled for <code>.sol</code> files in the <code>.vscode/settings.json</code> file. Do not modify this setting unless you want to lose the ability to rapidly redeploy without refreshing the page.
            </Info>
        
            <DocSubHead>Pro Tips</DocSubHead>
            <DocList items={OTHER_TIPS} />
        </DocBody>
    </div>

    <DocNavLinks
        previousHref={activePageId === 0 ? PAGES[activePageId].href : PAGES[activePageId - 1].href}
        nextHref={activePageId === PAGES.length - 1 ? PAGES[activePageId].href : PAGES[activePageId + 1].href}
        previousTopic={activePageId === 0 ? '' : `(${PAGES[activePageId - 1].name})`}
        nextTopic={activePageId === PAGES.length ? '' : `(${PAGES[activePageId + 1].name})`}
    />
</section>