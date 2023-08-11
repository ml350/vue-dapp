<script setup lang="ts">
  /*global useI18n*/
  /*eslint no-undef: "error"*/
  import 'vue3-carousel/dist/carousel.css'
  import { Carousel, Slide, Pagination, Navigation } from 'vue3-carousel' 
  
  // Importing images
  const nft1 = 'src/assets/hyena1.jpg';

  defineOptions({
    name: 'IndexPage',
    components: {
      Carousel,
      Slide,
      Pagination,
      Navigation,
    },
  })  
  
  const slides = [nft1, nft1, nft1];
  const { t, rt  } = useI18n()   
</script>

<template>
      <!-- Section 1 -->
  <section id="section01" container py-8 mx-auto md:flex md:justify-between md:items-center> 
    <div class="w-1/2" text-left>
      <h2>{{ t('intro.title') }}</h2>
      <p>
         {{ t('intro.desc') }}   
      </p>
      <ul class="mb-10">
        <li v-for="item in $tm('intro.list')" :key="item">
          - {{ rt(item) }}
        </li>
      </ul>
      <TheButton>BUY</TheButton>
    </div> 
       <!-- Updated Carousel Styling -->
       <div class="w-1/3 border-4 border-pink-600 p-4 rounded-lg hover:shadow-lg transition-shadow">
      <carousel :autoplay="2000" :wrap-around="false" :items-to-show="1">
        <slide v-for="(slide, index) in slides" :key="index">
          <img class="rounded-md" :src="slide" alt="NFT Slider">
        </slide>

        <template #addons>
          <navigation />
          <pagination />
        </template>
      </carousel>
    </div> 
    
  </section>
  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />
   <!-- Section 2 -->
  <section id="section02" container py-8 mx-auto md:flex md:justify-between md:items-center>
    <div class="w-1/2" text-left whitespace-pre-line>
        <h2>{{ t('section02.title') }}</h2>
        <p>{{ t("section02.desc") }}</p>
    </div>
    <div class="w-1/3">
      <TheButton>Mint Now</TheButton>
    </div>
    
  </section>
  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />
</template>

<route lang="yaml">
  meta:
    layout: home
</route>
