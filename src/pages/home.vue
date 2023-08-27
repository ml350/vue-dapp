<script setup lang="ts">
  /*global useI18n*/
  /*eslint no-undef: "error"*/
  import 'vue3-carousel/dist/carousel.css'
  import { Carousel, Slide, Pagination, Navigation } from 'vue3-carousel'
  import { ref } from 'vue';
  import { computed } from 'vue';
 
  // Importing images
  const nft1 = 'src/assets/hyena1.jpg';
  const nft2 = 'src/assets/hyena2.jpg';
  const nft3 = 'src/assets/hyena3.jpg';
  const nft4 = 'src/assets/hyena4.jpg';
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
    { image: nft2, title: '#Hyena3033', rarity: 'LEGENDARY' },
    { image: nft3, title: '#Hyena3036', rarity: 'COMMON' },
    { image: nft4, title: '#Hyena3088', rarity: 'COMMON' }
  ];

  const activeSlide = ref(0); // Will hold the index of the current slide

  function updateActiveSlide(index: number) {
    console.log("Current slide index:", index);
    console.log(activeSlide)
    activeSlide.value = index;
  }

  const rarityClasses = computed(() => {
    console.log('Computing rarity class for slide:', activeSlide.value, 'with rarity:', slides[activeSlide.value].rarity); 
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

  const section04Data = {
    wldate: 'TBA',
    weprice: '.07',
    pbdate: 'TBA',
    pbprice: '.08'
  };

  // Define the salesData
  const salesData = [
    { type: 'WHITELIST', icon: 'i-carbon-event', date: section04Data.wldate, price: section04Data.weprice },
    { type: 'PUBLIC SALE', icon: 'i-carbon-calendar', date: section04Data.pbdate, price: section04Data.pbprice }
  ]

  // Function to replace custom tags with HTML tags
  // const formatDescription = (text: string): string => {
  //   let formattedText = text;
  //   formattedText = formattedText.replace(/\[b\](.*?)\[\/b\]/g, '<strong>$1</strong>');
  //   formattedText = formattedText.replace(/\[i\](.*?)\[\/i\]/g, '<em>$1</em>');
  //   formattedText = formattedText.replace(/\[u\](.*?)\[\/u\]/g, '<u>$1</u>');
  //   return formattedText;
  // }

  // const formattedDesc = formatDescription(t("section02.desc"));

  //Lighten the Specs like a bulb
  const hoveredIcon = ref<number | null>(null);
</script>

<template>
  <!-- Section 1 -->
  <section id="section01" container px-8 py-8 mt-15 mx-auto md:px-20 md:flex md:justify-between md:items-center> 
    <div class="md:w-1/2" relative z-50 text-left>
      <h2 mb-4 text-3xl lg:text-6xl xl:text-6xl>{{ t('intro.title') }}</h2>
      <p mb-4 text-base sm:text-sm lg:text-lg >
         {{ t('intro.desc') }}   
      </p>
      <ul 
          @mouseleave="hoveredIcon = null" 
          class="...">
          <li 
              class="flex items-center mb-4 text-sm sm:text-sm lg:text-base xl:text-base" 
              v-for="(item, index) in $tm('intro.list')" 
              :key="item"
              @mouseover="hoveredIcon = index">
            <div 
                :class="[
                  'i-carbon-fire icon-sequence px-4',
                  hoveredIcon === index ? 'text-pink-600' : 'text-default-color'
                ]">
            </div>
            {{ rt(item) }}
          </li>
      </ul>
      <TheButton mb-4 text-xs sm:text-sm md:text-base lg:text-lg xl:text-xl sm:p-3 md:p-4 lg:p-5 xl:p-6>
         {{t("intro.button")}}
      </TheButton> 
    </div> 
    <!-- Updated Carousel Styling -->
    <div class="lg:w-3/8 md:w-1/3">
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
          <div :class="['text-center text-black text-sm mt-4 mx-auto cursor-pointer border-2 border-white rounded-full px-2 py-2 w-1/2', rarityClasses]">
              {{ slides[activeSlide].rarity }}
          </div>
      </div>
    </div>
  </section>

  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />

  <!-- Section 2 (Distribution) -->
  <section id="section02" container px-8 py-8 mx-auto md:px-20 md:flex md:justify-between md:items-center>
    <div class="lg:w-3/4" text-left whitespace-pre-line>
        <h2 mb-4 text-3xl lg:text-5xl xl:text-6xl>{{ t('section02.title') }}</h2>
        <!-- Using v-html to render HTML content -->
        <p mb-4 text-sm lg:text-lg>{{t("section02.desc")}}</p>
        <p mb-4 text-sm lg:text-lg>{{t("section02.desc2")}}</p>
    </div>
    <div class="lg:w-1/4">
      <TheButton text-xs sm:text-sm md:text-base lg:text-lg xl:text-xl p-2 sm:p-3 md:p-4 lg:p-5 xl:p-6>{{ t('section02.button') }}</TheButton>
    </div>
  </section>

  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />

  <!-- Section 3 (Roadmap) -->
  <section id="section03" container px-8 py-8 mx-auto md:px-20 md:flex md:justify-between md:items-center>
    <div class="lg:w-1/3" text-left mb-4>
      <img :src="roadmap" alt="Roadmap"/>
    </div>
    <div class="lg:w-1/3" text-left whitespace-pre-line>
      <h2 mb-4 text-3xl lg:text-5xl xl:text:6xl>{{ t('section03.title') }}</h2>
      <p mb-4 text-sm lg:text-lg>{{ t('section03.desc') }}</p>
      <TheButton text-xs sm:text-sm md:text-base lg:text-lg xl:text-xl>
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
          <TheButton class="text-2xl p-2 sm:p-3 md:p-4 lg:p-5 xl:p-6">Mint Now</TheButton>
      </div>
      
      <!-- Main Parent Div (Whitelist & Public Sale) -->
      <div class="w-full lg:w-3/8 space-y-10">
        <!-- Iterating over salesData -->
        <div 
            v-for="sale in salesData" 
            :key="sale.type" 
            class="bg-primary-color gap-4 rounded-3xl p-10 flex flex-col 
            lg:flex-row justify-between space-y-4 lg:space-y-0">

            <!-- Title, Icon, and Date Div -->
            <div>
                <div class="flex items-center mb-2 sm:mb-4">
                    <div :class="sale.icon" text-black text-xl mr-4 md:text-2xl></div>
                    <h2 class="text-black font-bold text-3xl sm:text-4xl md:text-4xl">{{ sale.type }}</h2>
                </div>
                <div class="date-div bg-black text-white px-2 py-1 mb-4 text-sm lg:text-lg rounded-3xl ">{{sale.date}}</div>
            </div>

            <!-- Countdown, Price, and Mint Div -->
            <div class="flex flex-col gap-4 h-full">
              <p class="p-2 text-white bg-black self-center md:self-end rounded-xl mb-4 text-sm lg:text-lg">
                {{sale.price}} ETH
              </p> 
              <TheCountdown class="self-center" />
            </div>
        </div>
    </div>
  </section>
  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />

  <!-- Section 5 (FAQ) -->
  <section id="section05" container px-8 py-8 md:px-20 mx-auto >
    <h2 mb-4 text-3xl lg:text-5xl xl:text-6xl text-left>{{ t('section05.title') }}</h2>
    <TheFAQ></TheFAQ>
  </section>
  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />
</template>

<route lang="yaml">
  meta:
    layout: home
</route>
