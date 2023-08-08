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
  <section id="section01" container py-8 mx-auto md:flex md:justify-between md:items-center> 
    <div class="w-1/2" text-left>
      <h2>{{ t('intro.title') }}</h2>
      <p>
         {{ t('intro.desc') }}   
      </p>
      <ul>
        <li v-for="item in $tm('intro.list')" :key="item">
          - {{ rt(item) }}
        </li>
      </ul>
    </div> 
    <div class="w-1/2" >
      <carousel :autoplay="2000" :wrap-around="true" :items-to-show="1">
        <slide v-for="(slide, index) in slides" :key="index">
          <img :src="slide" alt="NFT Slider">
        </slide>

        <template #addons>
          <navigation />
          <pagination />
        </template>
      </carousel>
    </div> 
  </section>
</template>

<route lang="yaml">
  meta:
    layout: home
</route>
