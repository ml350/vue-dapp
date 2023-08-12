<script setup lang="ts">
  /*global useI18n*/
  /*eslint no-undef: "error"*/
  import 'vue3-carousel/dist/carousel.css'
  import { Carousel, Slide, Pagination, Navigation } from 'vue3-carousel' 
  
  // Importing images
  const nft1 = 'src/assets/hyena1.jpg';
  const hyenaTsp = 'src/assets/hyenaTsp.png';
  const roadmap = 'src/assets/roadmap.png'

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
      <TheButton>
        <i class="i-carbon-logo-twitter text-black text-2xl inline-block mr-2 align-middle"></i> {{t("intro.button")}}
      </TheButton>

    </div> 
    <!-- Updated Carousel Styling -->
    <div class="w-1/3 border-4 border-pink-600 p-4 rounded-lg hover:shadow-lg transition-shadow">
      <carousel :autoplay="5000" :wrap-around="false" :items-to-show="1">
        <slide v-for="(slide, index) in slides" :key="index">
          <img class="rounded-md" :src="slide" alt="NFT Slider">
        </slide>

        <template #addons>
          <navigation text-white/> 
        </template>
      </carousel>
    </div> 
  </section>

  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />

   <!-- Section 2 (Distribution) -->
  <section id="section02" container py-8 mx-auto md:flex md:justify-between md:items-center>
    <div class="w-1/2" text-left whitespace-pre-line>
        <h2>{{ t('section02.title') }}</h2>
        <p>{{ t("section02.desc") }}</p>
    </div>
    <div class="w-1/3">
      <TheButton>{{ t('section02.button') }}</TheButton>
    </div>
  </section>

  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />

  <!-- Section 3 (Roadmap) -->
  <section id="section03" container py-8 mx-auto md:flex md:justify-between md:items-center>
    <div class="w-1/3" text-left>
      <img :src="roadmap" alt="Roadmap"/>
    </div>
    <div class="w-1/3" text-left whitespace-pre-line>
      <h2>{{ t('section03.title') }}</h2>
      <p>{{ t('section03.desc') }}</p>
      <TheButton mt-10>
      <i class="i-carbon-logo-discord text-black text-2xl inline-block mr-2 align-middle"></i>
       {{ t('section03.button') }}</TheButton>
    </div>
    
  </section> 
   <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />

  
   <!-- Section 4 (Mint Schedule) -->
   <section id="section04" py-8 gap-30 md:flex md:justify-center md:items-center>
    <!-- Main Parent Div (Whitelist & Public Sale) -->
    <div class="w-3/8 space-y-10">
      
      <!-- Whitelist div -->
      <div class="bg-primary-color gap-4 rounded-bl-lg rounded-tr-lg p-10 flex justify-between items-center">
        <!-- Title and Date Div -->
        <div>
          <h2 class="text-black font-bold">WHITELIST</h2>
          <div class="date-div bg-black text-white px-2 py-1">24.Jun.2024</div>
        </div>

          <!-- Countdown, Price, and Mint Div -->
        <div class="flex flex-col gap-4 justify-between h-full">
            <p class="text-white bg-black self-end">Price: 0.1 ETH</p>
            <TheCountdown initial="0" class="self-center" />
            <TheButton class="self-end mt-2">Mint</TheButton>
        </div>
      </div>

      <!-- Public Sale div -->
      <div class="bg-primary-color rounded-bl-lg rounded-tr-lg p-10 flex justify-between items-center">
        <!-- Title and Date Div -->
        <div>
          <h2 text-black font-bold>PUBLIC SALE</h2>
          <div class="date-div bg-black text-white px-2 py-1">24.Jun.2024</div>
        </div>

        <!-- Countdown, Price, and Mint Div -->
        <div class="flex flex-col gap-4 justify-between">
          <p class="text-white bg-black self-end p-1">Price: 0.1 ETH</p>
          <TheCountdown class="align-middle" />
          <TheButton class="self-end mt-2">Mint</TheButton>
        </div>
      </div>
    </div>
    
    <!-- Title and Image (Right) -->
    <div class="w-3/8 relative text-left pl-8 border-l rounded-l-lg border-t border-b border-r border-white p-4">
      <h2 class="text-7xl">Mint</h2>
      <h2 class="text-6xl text-white">Schedule</h2>
      <img :src="hyenaTsp" alt="Hyena Tsp" class="absolute bottom-0 right-0 w-40">
    </div>
  </section>
  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />


  <!-- Section 5 (FAQ) -->
  <section id="section05" container py-8 mx-auto >
    <h2 text-left mb-5>FAQ</h2>
    <TheFAQ></TheFAQ>
  </section>
  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />
</template>

<route lang="yaml">
  meta:
    layout: home
</route>
