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
  <nav container px-6 py-1 mx-auto items-center md:flex md:justify-between md:items-center text-xl>
    <div class="flex items-center justify-between">
      <RouterLink class="flex gap-1 text-xl font-bold md:text-2xl" to="/" :title="t('button.home')">
        <!-- Use the logo here -->
        <img :src="logo" w-20 alt="HaHa Hyenas Logo" />
      </RouterLink>

      <button class="md:hidden flex gap-1" @click="toggleMenu" :title="t('button.menu')">
        <div i="carbon-menu" />
      </button>
    </div>  
  
    <div :class="{ 'hidden': !menuOpen.valueOf, 'md:flex': false }" class="flex gap-4 mt-4 items-center md:mt-0">
        <!-- Menu Items-->
      <RouterLink to="/about" nav-link relative hover:text-yellow-300>
        {{ t('nav.about') }}
      </RouterLink>

      <RouterLink to="/collection" nav-link relative hover:text-yellow-300 >
        {{ t('nav.collection') }}
      </RouterLink>

      <RouterLink to="/faq" nav-link relative hover:text-yellow-300>
        {{ t('nav.faq') }}
      </RouterLink>

      <button class="flex gap-1 yell-bg rounded-2xl px-4 py-2 text-black" :title="t('button.wallet')">
        {{ t('button.wallet') }}
      </button>

      <RouterLink class="flex gap-1 " icon-btn to="/" :title="t('button.home')">
        <div i-carbon-logo-instagram text-2xl />
      </RouterLink>

      <RouterLink class="flex gap-1" icon-btn to="/" :title="t('button.home')">
        <div i-carbon-logo-discord text-2xl />
      </RouterLink>  

      <RouterLink class="flex gap-1" icon-btn to="/" :title="t('button.home')">
        <div i-carbon-logo-twitter text-2xl />
      </RouterLink>  

      <button class="flex gap-1" icon-btn :title="t('button.toggle_dark')" @click="toggleDark()">
        <div i="carbon-sun dark:carbon-moon" text-2xl/>
      </button>
    </div>
  </nav>
  <hr border-b-2 border-white op-8/>
</template>