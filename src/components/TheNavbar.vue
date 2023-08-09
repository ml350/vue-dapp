<script setup lang="ts">
/*global useI18n, ref*/
/*eslint no-undef: "error"*/
const { t } = useI18n()
const menuOpen = ref(false)
const logo = 'src/assets/logo.png'

const toggleMenu = () => {
  menuOpen.value = !menuOpen.value
}
</script>

<template>
  <nav container px-6 py-8 mx-auto md:flex md:justify-between md:items-center text-xl>
    <div class="flex items-center justify-between">
      <RouterLink class="flex gap-1 text-xl font-bold md:text-2xl" to="/" :title="t('button.home')">
        <!-- Use the logo here -->
        <img :src="logo" w-40 alt="HaHa Hyenas Logo" />
      </RouterLink>

      <button class="md:hidden flex gap-1" @click="toggleMenu" :title="t('button.menu')">
        <div i="carbon-menu" />
      </button>
    </div>  
    <!-- Menu Items-->
    <div flex flex-col mt-4 md:mt-0 md:flex-row md:items-center gap-4 md:gap-8>
      <RouterLink to="/about" nav-link relative hover:text-yellow-300>
        About
      </RouterLink>
      <RouterLink to="/collection" nav-link relative hover:text-yellow-300 >
        Collection
      </RouterLink>
      <RouterLink to="/faq" nav-link relative hover:text-yellow-300>
        FAQs
      </RouterLink>
    </div>

    <div :class="{ 'hidden': !menuOpen.valueOf, 'md:flex': false }" class="flex gap-4 mt-4 md:mt-0">
      <button class="flex gap-1" icon-btn :title="t('button.wallet')">
        {{ t('button.wallet') }}
      </button>

      <RouterLink class="flex gap-1" icon-btn to="/" :title="t('button.home')">
        <div i-carbon-logo-instagram />
      </RouterLink>

      <RouterLink class="flex gap-1" icon-btn to="/" :title="t('button.home')">
        <div i-carbon-logo-discord />
      </RouterLink>  

      <RouterLink class="flex gap-1" icon-btn to="/" :title="t('button.home')">
        <div i-carbon-logo-twitter />
      </RouterLink>  

      <button class="flex gap-1" icon-btn :title="t('button.toggle_dark')" @click="toggleDark()">
        <div i="carbon-sun dark:carbon-moon" />
      </button>
    </div>
  </nav>
</template>