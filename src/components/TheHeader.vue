<script setup lang="ts">
  /*global  useI18n*/
  /*eslint no-undef: "error"*/ 
  const banner = 'src/assets/banner1.png'
  const { t } = useI18n()
</script> 

<template>
  <div relative w-full mb-11 py-5>
      <img :src="banner" class="w-full" alt="HaHa Hyenas Logo" />
      
      <!-- The overlay div -->
      <div absolute inset-0 bg-black opacity-50></div>
      
      <!-- Content div inside the overlay -->
      <div absolute inset-0 flex flex-col items-center justify-center text-white p-4>
          <h1 lg:text-6xl mb-3>{{ t('welcome.heading') }}</h1>
          <p mb-8>{{ t('welcome.paragraph') }}</p>
          <TheButton mt-4>{{ t('button.learn')}}</TheButton>
      </div>
  </div>
</template>