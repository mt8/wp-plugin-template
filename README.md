# WordPress Plugin Template - Linting and Testing Guide

This document outlines the linting and testing mechanisms set up in this WordPress plugin template project.

## Linting

### PHP Linting

The project uses PHP_CodeSniffer (PHPCS) for PHP code linting with WordPress Coding Standards.

#### Configuration

- **Configuration File**: `phpcs.xml.dist`
- **Standard**: WordPress Coding Standards
- **Excluded Rules**:
  - `WordPress.Files.FileName.NotHyphenatedLowercase` - Allows non-hyphenated filenames
  - `WordPress.Files.FileName.InvalidClassFileName` - Allows class filenames that don't match class names
  - `WordPress.WP.I18n.MissingTranslatorsComment` - Allows missing translator comments
  - `WordPress.WP.I18n.NoHtmlWrappedStrings` - Allows non-HTML wrapped strings
  - `Generic.CodeAnalysis.UnusedFunctionParameter.Found` - Allows unused function parameters
  - `Generic.CodeAnalysis.UnusedFunctionParameter.FoundAfterLastUsed` - Allows unused function parameters after last used
  - `Generic.Commenting.DocComment.MissingShort` - Allows missing short descriptions in doc comments
  - `Squiz.Commenting.FunctionComment.ParamCommentFullStop` - Allows param comments without full stops
  - `Squiz.Commenting.InlineComment.InvalidEndChar` - Allows inline comments with invalid end characters
  - `Squiz.Commenting.FunctionCommentThrowTag.Missing` - Allows missing throw tags in function comments

#### Excluded Directories

- `vendor/`
- `node_modules/`
- `tests/`

#### Commands

- **Lint PHP**: `npm run lint:php` - Runs PHPCS to check code against standards
- **Format PHP**: `npm run format:php` - Runs PHPCBF to automatically fix code style issues


## Testing

### PHP Unit Testing

The project uses PHPUnit for PHP unit testing.

#### Configuration

- **Configuration File**: `phpunit.xml.dist`
- **Bootstrap File**: `tests/php/bootstrap.php`
- **Test Directory**: `tests/php/`
- **Test Files Pattern**: Files with prefix `test-` and suffix `.php`

#### Dependencies

- **PHPUnit Polyfills**: Uses Yoast PHPUnit Polyfills for compatibility across different PHPUnit versions

#### Test Structure

- Tests extend `WP_UnitTestCase` class
- Test methods are prefixed with `test_`

#### Commands

- **Run PHP Tests**: `npm run test:phpunit` - Runs PHPUnit tests with testdox and verbose output

### End-to-End (E2E) Testing

The project uses Playwright for end-to-end testing.

#### Configuration

- **Configuration File**: `playwright.config.js`
- **Base Configuration**: Extends `@wordpress/scripts/config/playwright.config.js`
- **Test Directory**: `tests/e2e/`

#### Dependencies

- **WordPress E2E Test Utils**: Uses `@wordpress/e2e-test-utils-playwright` for WordPress-specific testing utilities

#### Test Structure

- Tests use the `test` and `expect` functions from `@wordpress/e2e-test-utils-playwright`
- Tests typically include:
  - `beforeAll` hook to activate the plugin
  - `afterAll` hook to deactivate the plugin
  - Test cases with assertions

#### Commands

- **Run E2E Tests**: `npm run test:e2e` - Runs Playwright tests
- **Debug E2E Tests**: `npm run test:e2e:debug` - Runs Playwright tests in debug mode

### Combined Testing

- **Run All Tests**: `npm run test` - Runs both PHPUnit and E2E tests

## WordPress Environment

The project uses `@wordpress/env` for setting up a local WordPress environment.

#### Configuration

- **Configuration File**: `.wp-env.json`
- **WordPress Core**: Uses default WordPress core
- **Plugins**: Includes the current directory as a plugin

#### Commands

- **Composer in WordPress Environment**: `npm run composer` - Runs Composer in the WordPress environment
- **Composer in Test Environment**: `npm run composer:test` - Runs Composer in the test environment
