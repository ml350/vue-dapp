<script setup lang="ts">
  /*global useI18n, Ref, ref*/
  /*eslint no-undef: "error"*/
  const { t } = useI18n()
  const menuOpen: Ref<boolean> = ref(false);
  const logo = 'src/assets/logo.png' 

    // Scroll to section function
    const scrollToSection = (sectionId: string) => {
    const element = document.getElementById(sectionId);
    if (element) {
      element.scrollIntoView({
        behavior: 'smooth',
        block: 'start',
      });
    }
  };

  // Menu items definition
  const menuItems = [
    { section: "section01", icon: 'i-carbon-carbon-for-ibm-product', label: "nav.about" },
    { section: "section02", icon: 'i-carbon-data-collection', label: "nav.collection" },
    { section: "section05", icon: 'i-carbon-information-square-filled', label: "nav.faq" }
    
  ];

  // Social Media Icons
  const socialItems = [
    { route: '/', icon: 'i-carbon-logo-instagram', label: 'Instagram'},
    { route: '/', icon: 'i-carbon-logo-discord', label: 'Discord'},
    { route: '/', icon: 'i-carbon-logo-twitter', label: 'Twitter'},
  ] 

  // Hamburgesa Menu
  const genericHamburgerLine = `md:hidden h-1 w-6 my-1 rounded-full bg-white transition ease transform duration-300`;
</script>

<template>
  <nav container px-6 py-1 mx-auto items-center md:flex md:justify-between md:items-center text-xl>
    <div flex items-center justify-between>
      <RouterLink flex gap-1 text-xl font-bold md:text-2xl to="/" :title="t('button.home')">
        <img :src="logo" w-15 sm:w-20 alt="HaHa Hyenas Logo" />
      </RouterLink>
      
      <!-- Hamburgesa -->
      <button
         class="md:hidden flex flex-col h-11 w-11 justify-center items-center group"
         @click="menuOpen = !menuOpen"
>
          <div
          :class="`${genericHamburgerLine} ${menuOpen ? 'rotate-45 translate-y-3 opacity-50 group-hover:opacity-100' : 'opacity-50 group-hover:opacity-100'}`"
          />
          <div
            :class="`${genericHamburgerLine} ${menuOpen ? 'opacity-0' : 'opacity-50 group-hover:opacity-100'}`"
          />
          <div
            :class="`${genericHamburgerLine} ${menuOpen ? '-rotate-45 -translate-y-3 opacity-50 group-hover:opacity-100' : 'opacity-50 group-hover:opacity-100'}`"
          />
      </button>
    </div>  

    <div :class="menuOpen ? 'visible block' : 'hidden md:flex'" gap-4 mt-4 py-1 items-center md:mt-0>
      <!-- Menu Items -->
      <ul lg:flex gap-8 py-1 items-center >
        <li v-for="item in menuItems" :key="item.section" text-left py-1 >
          <a href="#" class="relative transition ease-in-out md:hover:text-pink-600 group" @click="scrollToSection(item.section)">
            <div flex gap-1 items-center> 
              <div :class="item.icon"></div>
              {{ t(item.label) }} 
            </div>
            <span class="absolute inset-x-0 bottom-0 h-[2px] bg-pink-600 transform scale-x-0 md:group-hover:scale-x-100 transition-transform ease-in-out duration-300"></span>
          </a>
        </li>
      </ul>

      <TheButton hidden md:flex>{{t('button.wallet')}}</TheButton>

      <!-- Social Icons -->
      <RouterLink v-for="item in socialItems" :key="item.route" :to="item.route" flex md:justify-end gap-1 py-1 >
        <div :class='item.icon' text-2xl md:hover:text-pink-600 > </div>
        <span md:hidden>{{ item.label }}</span>
      </RouterLink>

      <button flex gap-1 py-1 :title="t('button.toggle_dark')" @click="toggleDark()">
        <div i="carbon-sun dark:carbon-moon" class="text-2xl md:hover:text-pink-600"/> 
        <span md:hidden >{{ t('button.toggle_dark') }}</span>
      </button>  
      
      <TheButton md:hidden flex mt-2 pb-4>{{t('button.wallet')}}</TheButton>
    </div>
  </nav>
  <hr class="border-b-1 border-white opacity-40"/>
</template>
