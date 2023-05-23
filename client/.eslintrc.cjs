/* eslint-env node */
module.exports = {
  env: {
    browser: true,
    es2021: true,
    node: true,
    'vue/setup-compiler-macros': true,
  },
  globals: {
    defineEmits: true,
    document: true,
    localStorage: true,
    GLOBAL_VAR: true,
    VITE_APP_VERSION: true,
    window: true,
    defineProps: true,
    defineExpose: true,
    service: true,
    message: true,
  },
  extends: [
    'plugin:vue/vue3-essential',
    'eslint:recommended',
    '@vue/eslint-config-typescript',
    '@vue/eslint-config-prettier',
    './.eslintrc-auto-import.json',
  ],
  parserOptions: {
    ecmaVersion: 'latest',
    parser: '@typescript-eslint/parser',
    sourceType: 'module',
  },
  plugins: ['vue', '@typescript-eslint', 'import'],
  rules: {
    'vue/multi-word-component-names': 'off',
    'import/no-unresolved': 'off',
    'import/extensions': 'off',
    'no-unused-expressions': [
      2,
      { allowShortCircuit: true, allowTernary: false },
    ],
    'no-param-reassign': 0,
    'no-return-assign': 0,
    '@typescript-eslint/no-non-null-assertion': 'off',
    'no-empty-function': 'off',
    '@typescript-eslint/no-empty-function': 0,
  },
}
