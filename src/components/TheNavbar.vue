<script setup lang="ts">
/*global useI18n, ref*/
/*eslint no-undef: "error"*/
const { t } = useI18n()
const menuOpen = ref(false)
const logo = 'src/assets/logo.png'

const toggleMenu = () => {
  menuOpen.value = !menuOpen.value
}

// Menu items definition
const menuItems = [
  { route: "/about", label: "nav.about" },
  { route: "/collection", label: "nav.collection" },
  { route: "/faq", label: "nav.faq" }
]

</script>

<template>
  <nav class="container px-6 py-1 mx-auto items-center md:flex md:justify-between md:items-center text-xl">
    <div class="flex items-center justify-between">
      <RouterLink class="flex gap-1 text-xl font-bold md:text-2xl" to="/" :title="t('button.home')">
        <img :src="logo" class="w-20" alt="HaHa Hyenas Logo" />
      </RouterLink>

      <button class="md:hidden flex gap-1" @click="toggleMenu" :title="t('button.menu')">
        <div i="carbon-menu" />
      </button>
    </div>  

    <div :class="{ 'hidden': !menuOpen.valueOf, 'md:flex': false }" class="flex gap-4 mt-4 items-center md:mt-0">
        <!-- Menu Items -->
        <RouterLink v-for="item in menuItems" :key="item.route" 
                    :to="item.route"
                    class="relative hover:text-pink-600 group">
          {{ t(item.label) }}
          <span class="absolute inset-x-0 bottom-0 h-[2px] bg-pink-600 transform scale-x-0 group-hover:scale-x-100 transition-transform ease-in-out duration-300"></span>
        </RouterLink>

        <TheButton>Connect Wallet</TheButton>

        <RouterLink class="flex gap-1 " to="/" :title="t('button.home')">
          <div i-carbon-logo-instagram class="text-2xl hover:text-pink-600"/>
        </RouterLink>

        <RouterLink class="flex gap-1" to="/" :title="t('button.home')">
          <div i-carbon-logo-discord class="text-2xl hover:text-pink-600" />
        </RouterLink>  

        <RouterLink class="flex gap-1" to="/" :title="t('button.home')">
          <div i-carbon-logo-twitter class="text-2xl hover:text-pink-600" />
        </RouterLink>  

        <button class="flex gap-1" :title="t('button.toggle_dark')" @click="toggleDark()">
          <div i="carbon-sun dark:carbon-moon" class="text-2xl hover:text-pink-600"/>
        </button>
    </div>
  </nav>
  <hr class="border-b-1 border-white opacity-40"/>
</template>
