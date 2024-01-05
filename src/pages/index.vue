<!-- eslint-disable vue/multi-word-component-names -->
<template>
  <div class="intro-container" fixed mb-8>
    <!-- Mobile Version -->
    <section class="md:hidden text-center mt-8">
      <img class="logo w-15 sm:w-20 mx-auto" :src="logo" alt="HaHa Hyenas Logo" />
      <img
        :src="hyenaScene"
        alt="NFT Intro Image"
        class="intro-image mx-auto mb-8"
      />
      <div class="bg-red-950  p-4 h-full flex flex-col justify-between">
        <h2 class="text-2xl text-white sm:text-3xl md:text-4xl mb-2 text-center">
          Welcome to the<br />HaHa Hyenas<br />Comedy Club
        </h2>
        <TheButton self-center md:self-start mt-4>
          <RouterLink to="/home">Enter</RouterLink>
        </TheButton>
      </div>
    </section>

    <!-- Desktop Version -->
    <div class="hidden md:block">
      <div>
        <img
          :src="hyenaScene"
          alt="NFT Intro Image"
          class="intro-image w-full"
        />
        <div
          class="light-transition absolute inset-0"
          :style="{ opacity: lightOpacity }"
        ></div> 
      </div>
      <div class="relative md:bottom-20 lg:bottom-49 text-center lg:mb-20 md:mb-10">
        
        <RouterLink to="/home">
          <TheButton
            v-if="isDesktop"
            @mouseenter="handleMouseEnter"
            @mouseleave="handleMouseLeave"
            class="enter-button">
            Enter
          </TheButton>
        </RouterLink>
        </div>
    </div>
  </div>
</template>

<script setup lang="ts">
  /*global onMounted*/
  /*eslint no-undef: "error"*/
  import { ref } from 'vue';
  import hyenaScene from '~/assets/hyenaIntro.png';
  import logo from '~/assets/logo.png';
  
  const lightOpacity = ref(0);

  const handleMouseEnter = () => {
    lightOpacity.value = 1;
  };

  const handleMouseLeave = () => {
    lightOpacity.value = 0;
  };

  const isDesktop = ref(false);

  onMounted(() => {
    isDesktop.value = window.innerWidth >= 768;
  });
</script>

<route lang="yaml">
  meta:
    layout: index
</route>

