<!-- eslint-disable vue/multi-word-component-names -->
<script setup lang="ts">
  /*global useI18n, computed, isDark*/
  /*eslint no-undef: "error"*/
  import { ref } from 'vue'; 
  import roadmap from '~/assets/roadmap.png'
  import hyenasnew from '~/assets/4hyenass.png'
  import darkRoadmap from '~/assets/darkRoadmap.png' 
  const { t, rt  } = useI18n() 
  const Roadmap = computed(() => (isDark.value ? roadmap : darkRoadmap))
  const section04Data = {
    wldate: '2024-04-01',
    weprice: '0.02 ETH',
    pbdate: '2024-04-01',
    pbprice: '0.02 ETH'
  };

  // Define the salesData
  const salesData = [
    { type: 'WHITELIST', icon: 'i-carbon-event', date: section04Data.wldate, price: section04Data.weprice },
    { type: 'PUBLIC SALE', icon: 'i-carbon-calendar', date: section04Data.pbdate, price: section04Data.pbprice }
  ] 

  // Lighten the Specs like a bulb
  const hoveredIcon = ref<number | null>(null);

  import { onMounted } from 'vue';

  onMounted(() => {
    const sections = document.querySelectorAll('.fade-in-section');

    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          entry.target.classList.add('fade-in');
          entry.target.classList.remove('fade-out');
        } else {
          entry.target.classList.remove('fade-in');
          entry.target.classList.add('fade-out');
        }
      });
    });

    sections.forEach((section) => {
      observer.observe(section);
    });
  });
</script>

<template>
  <!-- Section 1 -->
  <section id="section01" class="fade-in-section" container px-8 py-8 mt-15 mx-auto md:px-20 md:flex md:justify-between md:items-center> 
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
    <div class="lg:w-3/8 md:w-1/2 w-1/1">
      <TheCarousel />
    </div>
  </section>
  
  <section class="fade-in-section">
    <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />
    <img :src="hyenasnew" class="lg:w-xxl"/>
    <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />
  </section>


  <!-- Section 2 (Distribution) -->
  <section id="section02" class="fade-in-section" container px-8 py-8 mx-auto md:px-20 > 
    <h2 mb-4 text-3xl lg:text-5xl xl:text-6xl>{{ t('section02.title') }}</h2>
    <div whitespace-pre-line md:flex md:justify-center md:items-center gap-5>
        <!-- Using v-html to render HTML content -->
        <p class="dis" bg-stone-900 text-white p-4 mb-4 text-sm lg:text-lg>{{t("section02.desc")}}</p>
        <p class="dis" bg-stone-900 text-white p-4 mb-4 text-sm lg:text-lg>{{t("section02.desc2")}}</p>
    </div>
    <!-- <div class="lg:w-1/4">
      <TheButton text-xs sm:text-sm md:text-base lg:text-lg xl:text-xl p-2 sm:p-3 md:p-4 lg:p-5 xl:p-6>{{ t('section02.button') }}</TheButton>
    </div> -->
  </section>

  <!-- Section 03 (Roadmap) -->
  <section id="section03" class="fade-in-section" container px-8 py-8 mx-auto md:px-20 flex flex-col md:flex-row justify-center items-center space-y-4 md:space-y-0 md:space-x-4>
    <div class="lg:w-1/3" text-left mb-4>
      <img class="roadmap" :src="Roadmap" alt="Roadmap"/>
    </div>
    <div class="lg:w-1/3 text-left whitespace-pre-line my-4">
      <h2 mb-4 text-3xl lg:text-6xl xl:text-6xl>{{ t('section03.title') }}</h2>
      <p class="dis" bg-stone-900 text-white p-4 mb-4 text-sm lg:text-lg>{{ t('section03.desc') }}</p>
      <TheButton text-xs sm:text-sm md:text-base lg:text-lg>
        {{ t('section03.button') }}
      </TheButton>
    </div>
  </section>

  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />
  
  <!-- Section 4 (Mint Schedule) -->
  <section id="section04" class="fade-in-section" container px-8 py-8 mx-auto md:px-20> 
    <!-- Title and Button -->
    <div class="mintSchedule mx-auto text-white flex flex-row justify-center w-full lg:w-3/8 p-4"> 
      <!-- Text Content on the left -->
      <div class="text-left">
          <h2 class="text-3xl sm:text-4xl md:text-5xl mb-0 sm:mb-4">Mint <span class="schedule mx-2 mr-4 text-2xl sm:text-3xl md:text-5xl text-white">Schedule</span></h2>
      </div>
      <!-- Buy Button -->
      <TheButton text-xs sm:text-sm md:text-base lg:text-lg xl:text-xl>Mint</TheButton>
    </div>

    <p text-center text-white >{{ t('section04.para') }}</p>
    <!-- Main Parent Div (Whitelist & Public Sale) -->  
    <div class="w-full md:w-full" px-8 py-8 flex flex-col md:flex-row md:justify-center md:items-center space-y-8 md:space-y-0 md:space-x-8>  
        <!-- Iterating over salesData -->
        <div 
            v-for="sale in salesData" 
            :key="sale.type" 
            class="salesType bg-stone-950 gap-4 p-10 flex flex-col 
            lg:flex-row justify-between space-y-4 lg:space-y-0">

            <!-- Title, Icon, and Date Div -->
            <div> 
              <div class="date-div p-2 bg-stone-900 text-white self-center lg:self-end rounded-xl mb-4 text-sm lg:text-lg">Date: {{sale.date}}</div>
              <div class="flex items-center md:mt-8 sm:mb-4">
                  <div :class="sale.icon" text-white text-xl mr-4 md:text-2xl></div>
                  <h2 class="text-stroke-white-600 font-bold text-2xl sm:text-4xl md:text-4xl saleText">{{ sale.type }}</h2>
              </div>
            </div>

            <!-- Countdown, Price, and Mint Div -->
            <div class="flex flex-col gap-4 h-full">
              <p class="salePrice p-2 bg-stone-900 hover:bg-emerald hover:text-black text-white self-center lg:self-end rounded-xl mb-4 text-sm lg:text-lg">
                Price:{{sale.price}}
              </p> 
              <TheCountdown class="counter text-white self-center" />
            </div>
        </div> 
    </div>  
  </section> 

  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />

  <section id="section05" class="fade-in-section" items-center container px-8 py-8 md:px-20 mx-auto >
    <h2 mb-4 text-3xl text-center lg:text-5xl xl:text-6xl>{{ t('section05.title') }}</h2>
    <TheTeam></TheTeam>
  </section>   
  
  <hr my-6 border-gray-200 sm:mx-auto dark:border-gray-700 lg:my-8 />

  <!-- Section 6 (FAQ) -->
  <section id="section06" class="fade-in-section" items-center container px-8 py-8 md:px-20 mx-auto >
    <h2 mb-4 text-3xl lg:text-5xl xl:text-6xl text-left>{{ t('section06.title') }}</h2>
    <TheFAQ></TheFAQ>
  </section> 
</template>

<route lang="yaml">
  meta:
    layout: home
</route>
