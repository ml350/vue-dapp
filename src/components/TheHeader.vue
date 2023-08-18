<script setup lang="ts">
  /*global useI18n*/
  /*eslint no-undef: "error"*/ 
  const banner = 'src/assets/banner1.png'
  const { t } = useI18n()

  function scrollToSection(id) {
    const element = document.querySelector(id);
    if (element) {
      element.scrollIntoView({ behavior: 'smooth' });
    }
  }
</script> 

<template>
  <div relative mb-20 mt-20 flex flex-col items-center justify-center py-5 mt-5>
    <div text-white p-4>
      <h1 class="text-3xl sm:text-3xl md:text-4xl lg:text-5xl xl:text-6xl mb-3">{{ t('welcome.heading') }}</h1>
      <p class="text-xs sm:text-sm md:text-base lg:text-lg xl:text-xl mb-20 lg:mb-10">{{ t('welcome.paragraph') }}</p>
    </div>

    <img :src="banner" w-full md:w-300 lg:mb-0 alt="HaHa Hyenas Logo" />
  </div>
  
  <!-- Button Learn More outside the banner -->
  <div>
    <TheButton @click="() => scrollToSection('#section01')" mb-20 text-xs sm:text-sm md:text-base lg:text-lg xl:text-xl p-2 sm:p-3 md:p-4 lg:p-5 xl:p-6>{{ t('button.learn') }}</TheButton>
  </div>
</template>
