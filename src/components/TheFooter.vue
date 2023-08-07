<script setup lang="ts">
  /*global useI18n*/
  /*eslint no-undef: "error"*/
  import { availableLocales, loadLanguageAsync } from '~/modules/i18n'

  const { t, locale } = useI18n()
  const logo = 'src/assets/logo.png'
  async function toggleLocales() {
    // change to some real logic
    const locales = availableLocales
    const newLocale = locales[(locales.indexOf(locale.value) + 1) % locales.length]
    await loadLanguageAsync(newLocale)
    locale.value = newLocale
  }
</script>

<template>
  <footer>
    <div container px-6 py-8 mx-auto md:py-8>
      <div sm:flex sm:items-center sm:justify-between>
        <a href="">
          <img :src="logo" w-40 alt="HaHa Hyenas Logo" />
        </a>
        <ul items-center mb-6 text-sm font-medium>
          <li>
            <RouterLink flex flex-wrap  icon-btn to="/whitepaper" :title="t('button.whitepaper')" data-test-id="whitepaper">
              <div i-carbon-dicom-overlay /> Whitepaper
            </RouterLink> 
          </li>
          <li>
            <RouterLink flex flex-wrap icon-btn to="/terms" :title="t('button.terms')" data-test-id="terms">
              <div i-carbon-subnet-acl-rules></div> Terms
            </RouterLink>
          </li>
          <li>
            <a flex flex-wrap icon-btn :title="t('button.toggle_langs')" @click="toggleLocales()">
              <div i-carbon-language /> Languages
            </a>
          </li>
        </ul> 
      </div>
      <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />
      <span block text-sm text-gray-500 sm:text-center dark:text-gray-400>
        © 2023 <a href="https://ovoono.studio" hover:underline>OvoOno Studio</a>. All Rights Reserved.
      </span>
    </div> 
  </footer> 
</template>
