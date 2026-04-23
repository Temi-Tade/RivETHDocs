<script>
    import {base} from "$app/paths";
    import DocBody from "../../../ui/DocBody.svelte";
    import DocSubHead from "../../../ui/DocSubHead.svelte";
    import Info from "../../../ui/Info.svelte";
    import CodeSnippet from "../../../ui/CodeSnippet.svelte";
	import DocNavLinks from "../../../ui/DocNavLinks.svelte";

    let activePageId = 10;

    const PAGES = [
        { id: 0, name: "What is RivETH?", href: `${base}/docs` },
        { id: 1, name: "Getting Started", href: `${base}/docs/getting-started` },
        { id: 2, name: "Writing & Compiling", href: `${base}/docs/compiling` },
        { id: 3, name: "Interacting", href: `${base}/docs/interacting` },
        { id: 4, name: "Other Features", href: `${base}/docs/other` },
        { id: 5, name: "Redeploying a contract", href: `${base}/docs/redeployment` },
        { id: 6, name: "Debugging", href: `${base}/docs/debugging` },
        { id: 7, name: "Cross-contract calls", href: `${base}/docs/cross-contract-calls` },
        { id: 8, name: "RivETHScan", href: `${base}/docs/rivethscan` },
        { id: 9, name: "Injected Providers", href: `${base}/docs/injected-providers` },
        { id: 10, name: "Updating RivETH", href: `${base}/docs/update` },
    ];

    const updateCommand = `./UpdateRivETH`;
</script>

<section>
    <div>
        <DocBody>
            <DocSubHead>Updating RivETH</DocSubHead>
            <p>
                RivETH is constantly evolving. Staying on the latest release ensures you have access to the newest features (like <strong>RivETHScan</strong> or <strong>Injected Providers</strong>), the latest security patches, and critical bug fixes.
            </p>

            <Info type="warning">
                <strong>Internet Connection Required:</strong> You must be online to check for and download updates from the official RivETH repository.
            </Info>

            <DocSubHead>1. Running the Update Script</DocSubHead>
            <p>Updating is designed to be a "one-click" experience. Open your terminal, navigate to your local RivETH directory, and execute the update script:</p>
            
            <CodeSnippet title="Terminal" code={updateCommand} />

            <DocSubHead>2. What happens during an update?</DocSubHead>
            <p>When you run the script, RivETH performs the following actions automatically:</p>
            <ul class="list-disc ml-6 space-y-2 mb-4">
                <li><strong>Version Check:</strong> Compares your local version against the latest release in the official repository.</li>
                <li><strong>Fetch & Pull:</strong> Downloads new assets, UI components, and logic updates.</li>
                <li><strong>Dependency Sync:</strong> Updates internal libraries if necessary to ensure compatibility with newer versions of Solidity or Hardhat.</li>
            </ul>

            <DocSubHead>3. Post-Update Workflow</DocSubHead>
            <p>Once the script finishes, you don't need to re-install anything. Simply restart your dashboard or refresh your browser tab to begin using the latest version.</p>

            <Info type="info">
                <strong>Check the Release Notes:</strong> Every major update comes with a release note. If you've just updated to a version like <strong>v1.5.0</strong>, check the GitHub's<a href="https://github.com/Temi-Tade/RivETH/releases">releases</a>for a summary of what's new so you can immediately leverage the new tools in your workflow.
            </Info>

            <div class="mt-4 p-2 rounded-lg">
                <p class="text-sm text-center">
                    Encountered an issue during update? Check the <a href="https://github.com/Temi-Tade/RivETH" class="text-blue-400 underline">GitHub repo</a> for contribution guidelines or to report a bug.
                </p>
            </div>

            <div class="mt-5">
                <p>You have reached the end of the official RivETH documentation, stay in the loop with the latest releases by giving the<a href="https://github.com/Temi-Tade/RivETH">repo</a>a star on GitHub. RivETH is open source, check out the repo for contribution guidelines.</p>
                <p>You can also improve this documentation by contributing to it<a href="https://github.com/Temi-Tade/RivETHKit">here.</a></p>
            </div>
        </DocBody>

        <DocNavLinks
            previousHref={activePageId === 0 ? PAGES[activePageId].href : PAGES[activePageId - 1].href}
            nextHref={activePageId === PAGES.length - 1 ? PAGES[activePageId].href : PAGES[activePageId + 1].href}
            previousTopic={activePageId === 0 ? '' : `(${PAGES[activePageId - 1].name})`}
            nextTopic={activePageId === PAGES.length ? `(${PAGES[activePageId + 1].name})` : ''}
        />
    </div>
</section>