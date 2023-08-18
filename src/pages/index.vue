<script setup lang="ts">
  /*global useI18n*/
  /*eslint no-undef: "error"*/
  import 'vue3-carousel/dist/carousel.css'
  import { Carousel, Slide, Pagination, Navigation } from 'vue3-carousel'
  import { ref } from 'vue';
  import { computed } from 'vue';

  
  // Importing images
  const nft1 = 'src/assets/hyena1.jpg';
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
  
  const slides = [
    { image: nft1, title: '#Hyena3047', rarity: 'RARE' },
    { image: nft1, title: '#Hyena3048', rarity: 'LEGENDARY' },
    { image: nft1, title: '#Hyena3049', rarity: 'COMMON' }
];

const activeSlide = ref(0); // Will hold the index of the current slide

function updateActiveSlide(index: number) {
  console.log("Current slide index:", index);
  console.log(activeSlide)
  activeSlide.value = index;
}

const rarityClasses = computed(() => {
  switch (slides[activeSlide.value].rarity) {
    case 'LEGENDARY':
      return 'bg-fuchsia-600';
    case 'RARE':
      return 'bg-cyan-500';
    case 'COMMON':
      return 'bg-slate-400';
    default:
      return 'bg-white';
  }
});



  const { t, rt  } = useI18n()  
  
   // Define the salesData
  const salesData = [
    { type: 'WHITELIST', icon: 'i-carbon-event' },
    { type: 'PUBLIC SALE', icon: 'i-carbon-calendar' }
]
</script>

<template>
  <!-- Section 1 -->
  <section id="section01" container px-8 py-8 mt-15 mx-auto md:flex md:justify-between md:items-center> 
    <div class="lg:w-1/2" text-left>
      <h2 mb-4 text-3xl lg:text-5xl xl:text-6xl>{{ t('intro.title') }}</h2>
      <p mb-4 text-sm sm:text-sm lg:text-lg >
         {{ t('intro.desc') }}   
      </p>
      <ul mb-4 >
        <li text-sm sm:text-sm md:text-base lg:text-lg xl:text-xl v-for="item in $tm('intro.list')" :key="item">
          - {{ rt(item) }}
        </li>
      </ul>
      <TheButton mb-4 text-xs sm:text-sm md:text-base lg:text-lg xl:text-xl p-2 sm:p-3 md:p-4 lg:p-5 xl:p-6>
         {{t("intro.button")}}
      </TheButton> 
    </div> 
    <!-- Updated Carousel Styling -->
    <div class="lg:w-1/4">
    <div :key="activeSlide" class="rounded-md border-3 border-white p-4 bg-opacity-40 bg-gradient-to-br from-amber-200 to-pink-600 backdrop-blur-xl">
        <!-- NFT Name Title -->
        <h2 class="text-white mb-4 text-center text-2xl md:text-3xl">{{ slides[activeSlide].title }}</h2>
        
        <!-- Carousel Component -->
        <carousel :autoplay="5000" :wrap-around="false" :items-to-show="1" @slide="updateActiveSlide">
            <slide v-for="(slide, index) in slides" :key="index">
                <img class="w-2/4 mx-auto rounded-md h-auto" :src="slide.image" :alt="'Image ' + slide.title">
            </slide>
            <template #addons>
                <navigation text-white/> 
            </template>
        </carousel>

        <!-- Display the rarity -->
        <div :class="['text-center text-black mt-4 ml-30 border-2 border-white rounded-full px-2 py-2 w-1/3', rarityClasses]">
            {{ slides[activeSlide].rarity }}
        </div>
    </div>
</div>





  </section>

  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />

   <!-- Section 2 (Distribution) -->
  <section id="section02" container px-8 py-8 mx-auto md:flex md:justify-between md:items-center>
    <div class="lg:w-1/2" text-left whitespace-pre-line>
        <h2 mb-4 text-3xl lg:text-5xl xl:text-6xl>{{ t('section02.title') }}</h2>
        <p mb-4 text-sm lg:text-lg>{{ t("section02.desc") }}</p>
    </div>
    <div class="lg:w-1/3">
      <TheButton text-xs sm:text-sm md:text-base lg:text-lg xl:text-xl p-2 sm:p-3 md:p-4 lg:p-5 xl:p-6>{{ t('section02.button') }}</TheButton>
    </div>
  </section>

  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />

  <!-- Section 3 (Roadmap) -->
  <section id="section03" container px-8 py-8 mx-auto md:flex md:justify-between md:items-center>
    <div class="lg:w-1/3" text-left mb-4>
      <img :src="roadmap" alt="Roadmap"/>
    </div>
    <div class="lg:w-1/3" text-left whitespace-pre-line>
      <h2 mb-4 text-3xl lg:text-5xl xl:text:6xl>{{ t('section03.title') }}</h2>
      <p mb-4 text-sm lg:text-lg>{{ t('section03.desc') }}</p>
      <TheButton text-xs sm:text-sm md:text-base lg:text-lg xl:text-xl p-2 sm:p-3 md:p-4 lg:p-5 xl:p-6>
       {{ t('section03.button') }}</TheButton>
    </div>
  </section> 

   <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />
  
  <!-- Section 4 (Mint Schedule) -->
<section id="section04" class="px-8 py-8 flex flex-col md:flex-row md:justify-center md:items-center space-y-8 md:space-y-0 md:space-x-8">
    
      <!-- Title and Button -->
    <div class="flex flex-row items-center justify-between w-full md:w-3/8 p-4 border-l rounded-r-3xl border-t border-b border-r border-white">
        
        <!-- Text Content on the left -->
        <div class="text-left">
            <h2 class="text-3xl sm:text-4xl md:text-7xl mb-2 sm:mb-4">Mint<br><span class="text-2xl sm:text-3xl md:text-6xl text-white">Schedule</span></h2>
        </div>
    
        <!-- Buy Button -->
        <TheButton class="text-xs p-2 sm:p-3 md:p-4 lg:p-5 xl:p-6">Buy</TheButton>
    
    </div>
    

   <!-- Main Parent Div (Whitelist & Public Sale) -->
<div class="w-full lg:w-3/8 space-y-10">
    <!-- Iterating over salesData -->
    <div 
        v-for="sale in salesData" 
        :key="sale.type" 
        class="bg-primary-color gap-4 rounded-3xl p-10 flex flex-col 
        lg:flex-row justify-between items-center space-y-4 lg:space-y-0">

        <!-- Title, Icon, and Date Div -->
        <div>
            <div class="flex items-center mb-2 sm:mb-4">
                <div :class="sale.icon" text-black text-xl mr-4 md:text-2xl></div>
                <h2 class="text-black font-bold text-3xl sm:text-4xl md:text-4xl">{{ sale.type }}</h2>
            </div>
            <div class="date-div bg-black text-white px-2 py-1 mb-4 text-sm lg:text-lg rounded-3xl ">24.Jun.2024</div>
        </div>

        <!-- Countdown, Price, and Mint Div -->
        <div class="flex flex-col gap-4 h-full">
            <p class="p-2 text-white bg-black self-center md:self-end rounded-xl mb-4 text-sm lg:text-lg">Price: 0.1 <i class="mdi mdi-ethereum"></i></p>
            <TheCountdown class="self-center" />
        </div>
    </div>
</div>

</section>

  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />


  <!-- Section 5 (FAQ) -->
  <section id="section05" container px-8 py-8 mx-auto >
    <h2 mb-4 text-3xl lg:text-5xl xl:text-6xl text-left>{{ t('section05.title') }}</h2>
    <TheFAQ></TheFAQ>
  </section>
  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />
</template>

<route lang="yaml">
  meta:
    layout: home
</route>
