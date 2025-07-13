import * as vscode from 'vscode';
import * as fs from 'fs';
import * as path from 'path';

function copyFolderRecursive(src: string, dest: string) {
	if (!fs.existsSync(dest)) fs.mkdirSync(dest, { recursive: true });

	const entries = fs.readdirSync(src, { withFileTypes: true });

	for (const entry of entries) {
		const srcPath = path.join(src, entry.name);
		const destPath = path.join(dest, entry.name);

		if (entry.isDirectory()) {
			copyFolderRecursive(srcPath, destPath);
		} else {
			fs.copyFileSync(srcPath, destPath);
		}
	}
}

export function activate(context: vscode.ExtensionContext) {
	console.log('🔥 FiveM Resource Generator active');

	const templatesPath = path.join(context.extensionPath, 'templates');
	if (!fs.existsSync(templatesPath)) {
		console.warn('⚠️ No templates folder found.');
		return;
	}

	const templates = fs.readdirSync(templatesPath).filter(entry =>
		fs.statSync(path.join(templatesPath, entry)).isDirectory()
	);

	// Register commands for each template (esx, qbcore, etc)
	for (const template of templates) {
		const commandId = `fivem-resources-generator.create.${template.toLowerCase()}`;
		const command = vscode.commands.registerCommand(commandId, async (uri: vscode.Uri) => {
			const targetPath = uri?.fsPath || vscode.workspace.workspaceFolders?.[0]?.uri.fsPath;
			if (!targetPath) return vscode.window.showErrorMessage('Please select or open a folder.');

			const templatePath = path.join(templatesPath, template);
			try {
				copyFolderRecursive(templatePath, targetPath);
				vscode.window.showInformationMessage(`✅ ${template} resource created in ${targetPath}`);
			} catch (err) {
				vscode.window.showErrorMessage(`❌ Failed to create resource: ${err}`);
			}
		});

		context.subscriptions.push(command);
	}
}

export function deactivate() {}
