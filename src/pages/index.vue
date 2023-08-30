<!-- eslint-disable vue/multi-word-component-names -->
<template>
  <div class="intro-container" fixed mb-8>
    <img
      :src="hyenaScene"
      alt="NFT Intro Image"
      class="intro-image"
    />
    <div class="light-transition" :style="{ opacity: lightOpacity }"></div>
    <div class="flex items-center justify-center h-sm absolute inset-0 md:h-full">
      <TheButton
        v-if="isDesktop"
        @mouseenter="handleMouseEnter"
        @mouseleave="handleMouseLeave"
        class="enter-button self-end mb-9"
      >
      <RouterLink to="/home">Enter</RouterLink>
      </TheButton>
      <TheButton
        v-else
        class="enter-button self-end mb-8"
        to="/home"
      >
      <RouterLink to="/home">Enter</RouterLink>
      </TheButton>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue';

const hyenaScene = 'src/assets/hyenaIntro.png';
const lightOpacity = ref(0);

const handleMouseEnter = () => {
  lightOpacity.value = 1;
};

const handleMouseLeave = () => {
  lightOpacity.value = 0;
};

const isDesktop = computed(() => window.innerWidth >= 768); 
</script>

<route lang="yaml">
  meta:
    layout: index
</route>

