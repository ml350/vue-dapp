<script setup lang="ts">
  /*global useI18n, computed, isDark*/
  /*eslint no-undef: "error"*/
  import { availableLocales, loadLanguageAsync } from '~/modules/i18n'

  const { t, locale } = useI18n()
  import Logo from '~/assets/logo.png' 
  import darkLogo from '~/assets/logo2.png' 
  import hyena from '~/assets/hyenaTsp.png'
  const logo = computed(() => (isDark.value ? Logo : darkLogo))
  
  async function toggleLocales() {
    // change to some real logic
    const locales = availableLocales
    const newLocale = locales[(locales.indexOf(locale.value) + 1) % locales.length]
    await loadLanguageAsync(newLocale)
    locale.value = newLocale
  }

  // Footer Links Array
  const footerLinks = [
    { id: 2, route: '/terms', titleKey: 'button.terms', icon: 'i-carbon-subnet-acl-rules', label: 'Terms' },
    { id: 1, route: '/whitepaper', titleKey: 'button.whitepaper', icon: 'i-carbon-dicom-overlay', label: 'Whitepaper' },
    { id: 3, action: toggleLocales, titleKey: 'button.toggle_langs', icon: 'i-carbon-language', label: 'Languages' }
  ]

   // Computed property to filter out the "Languages" link
   const filteredLinks = computed(() => {
    return footerLinks.filter(link => link.label !== 'Languages');
  });

  // Social Media Icons
  const socialItems = [
    { route: '/', icon: 'i-carbon-logo-instagram'},
    { route: '/', icon: 'i-carbon-logo-discord'},
    { route: '/', icon: 'i-carbon-logo-twitter'},
]
  
</script>

<template>
  <footer>
    <div container mb-8 px-8 py-8 mx-auto md:py-8>
      <div flex lg:flex items-center justify-between>
        <div class="lg:w-1/3">
          <a href="/">
            <img class="logo" :src="logo" w-20 lg:w-30 alt="HaHa Hyenas Logo" />
          </a>
          
          <h3 my-3 text-red-600 text-sm md:text-xl text-left>{{ t('footer.title') }}</h3>
        </div>

        <div class="md:w-1/3 hidden sm:block">
            <img :src="hyena" w-50 mx-auto alt="Hyenas Transparent NFT"/>
        </div>

        <div class="lg:w-1/3">
          <ul items-center text-sm font-medium>
            <!-- Social Icons -->
            <div flex justify-end gap-2>
              <RouterLink v-for="item in socialItems" :key="item.route" :to="item.route" flex-row gap-1>
                <div :class='item.icon' text-sm md:text-2xl hover:text-red-600 > </div>
              </RouterLink>
            </div>
            <h3 my-3 text-red-600 text-sm md:text-xl text-right>{{ t('footer.title2') }}</h3>

            <li v-for="link in filteredLinks" :key="link.id">
              <RouterLink v-if="link.route" text-xs lg:text-xl justify-end gap-2 mb-1 hover:text-red-600 flex flex-wrap :to="link.route" :title="t(link.titleKey)">
                <div :class="link.icon" hover:text-red-600 /> {{ link.label }}
              </RouterLink>
              <a v-else flex flex-wrap justify-end text-xs lg:text-xl hover:text-red-600 :title="t(link.titleKey)" @click="link.action">
                <div :class="link.icon" /> {{ link.label }}
              </a>
            </li>
          </ul> 
        </div>
        
        </div>
      <hr mb-2 border-gray-200 sm:mx-auto dark:border-gray-700/>
      <span block text-sm text-gray-500 sm:text-center dark:text-gray-400>
        ©2023 <a href="https://ovoono.studio" hover:underline>OvoOno Studio</a>. {{ t('footer.rights') }}.
      </span>
    </div> 
  </footer> 
</template>
