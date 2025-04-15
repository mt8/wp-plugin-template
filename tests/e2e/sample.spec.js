import { test, expect } from '@wordpress/e2e-test-utils-playwright';

test.describe('Sample Test', () => {
	test.beforeAll(async ({ requestUtils }) => {
		await requestUtils.activatePlugin('wp-plugin-template');
	});

	test.afterAll(async ({ requestUtils }) => {
		await requestUtils.deactivatePlugin('wp-plugin-template');
	});

    test('Sample Test', async ({ page, admin }) => {
		await expect(true).toBe(true);
	});
});
