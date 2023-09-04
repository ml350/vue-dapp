<script setup lang="ts">
    /*global computed, isDark*/
    /*eslint no-undef: "error"*/  
    import { ref } from 'vue'
    import Banner from '~/assets/faq.png'
    import darkBanner from '~/assets/faqDark.png'
    const banner = computed(() => (isDark.value ? Banner : darkBanner ))

    const faqList = ref([
        { id: 1, question: "What is HaHa Hyenas?",
         answer: "HaHa Hyenas is a collection of 5,555 unique and randomly generated NFTs living on the Ethereum Blockchain. Each NFT acts as your membership to a community of like minded comedians and comedy fans and is filled with utility to be used within the HaHa Hyena ecosystem.",
          show: false },
        { id: 2, question: "Why should I buy a HaHa Hyena?",
         answer: " Besides the fantastic art each unique Hyena comes with tons of utility. This NFT works as your membership to a metaverse comedy club and discord that gives you access to informational channels, writing groups, virtual open mics, virtual comedy shows in our metaverse club and so much more. Please see our roadmap for all of the utility we offer as well as keep an eye on the ⁠📢announcements channel for new and upcoming utilities!",
          show: false },
        { id: 3, question: "Who is behind HaHa Hyenas?",
         answer: "HaHa Hyenas was created by 2 comedians who saw an opportunity to blend together comedy and web3 technology to create lasting value in the form of a NFT project. Our team will be doxxed, which means you know exactly who is behind the project and you can check it out on our team section of our website.",
          show: false },
        { id: 4, question: "What will mint funds be used for?",
         answer: "Mint funds will be used to facilitate the utility of the project as well as a portion of the mint funds will go to the main team who invested all of their time and money to create the project. We believe our transparency of where our funds go and to whom should give a sense of security to our holders. If you have any questions just ask!",
          show: false },
        { id: 5, question: "What is the supply of HaHa Hyenas?",
         answer: "There are 5,555 HaHa Hyenas including 25 unique 1 of 1 legendary Hyenas!",
          show: false },
        { id: 6, question: "How do you join the HaHa Hyenas Project?",
         answer: "Just minting a HaHa Hyena or buying one off of the secondary market is all you need to enjoy all the benefits of the project. Once you hold our NFT as well as verify your holdings on Discord you will gain access to all the information and utility our project holds. For information on how to verify your NFT please access the discord channel and visit the FAQ page on our discord", 
         show: false },
        { id: 7, question: "How many different traits are there??",
         answer: "There are over 200 different and unique comedy and web3 inspired traits in our collection, plus 25 pieces of 1 of 1 Legendary Hyenas. This will insure a large variety of different combinations for each of the 5,555 unique HaHa Hyenas.", 
         show: false }
    ])

    const toggle = (id: number) => {
        faqList.value = faqList.value.map(item => {
            if (item.id === id) {
                item.show = !item.show;
            } else {
                item.show = false;
            }
            return item;
        })
    }
</script>

<template>
    <div class="lg:flex gap-8">
      <!-- FAQ Accordion (60%) -->
      <div class="lg:w-3/5">
        <div class="faqBg bg-primary-color lg:w-7/8" px-4 py-6 rounded-3xl md:px-10>
          <div v-for="item in faqList" :key="item.id" class="bg-dark-background mx-auto rounded-2xl mb-4">
            <button
              @click="toggle(item.id)"
              flex
              justify-between
              gap-2
              items-center
              pl-10
              w-full
              p-2
              text-white
              text-xs lg:text-xl xl:text-2xl
            >
              {{ item.question }}
              <div :class="item.show ? 'i-carbon-close-filled' : 'i-carbon-add-alt'"></div>
            </button>
            
            <transition>
              <div :class="item.show ? 'faq-answer-container open' : 'faq-answer-container'">
                <div class="faq-answer p-4 rounded-b-lg pl-10 text-xs lg:text-xl text-left text-white">
                  {{ item.answer }}
                </div>
              </div>
            </transition>
          </div>
        </div>
      </div>
  
      <!-- Image (40%) -->
      <div class="lg:block lg:w-2/8 md:w-2/8 hidden">
        <img :src="banner" alt="HaHa Hyenas Logo" class="faqImg w-full mx-auto h-auto">
        <p mt-4> Join our Discord for more information! </p>
        <!-- Discord Button -->
        <TheButton class="text-2xl p-2 sm:p-3 md:p-4 lg:p-5 xl:p-6">Discord</TheButton>
      </div>
    </div>
  </template>
  
<style>
  .faq-answer-container {
    overflow: hidden;
    transition: max-height 0.5s ease-in-out;
    max-height: 0;
  }

  .faq-answer-container.open {
      max-height: 1000px; /* This should be greater than the actual height */
  }

  #section01 {
    .carousel__slide {
        display: block;
      }
  }
</style>