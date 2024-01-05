<script setup lang="ts">
    /*global */
    /*eslint no-undef: "error"*/
    import 'vue3-carousel/dist/carousel.css'
    import { Carousel, Slide, Pagination, Navigation } from 'vue3-carousel'
    import { ref, watch } from 'vue';  

    // Importing images
    import nft1 from '~/assets/hyena1.jpg';
    import nft2 from '~/assets/hyena2.jpg';
    import nft3 from '~/assets/hyena3.jpg';
    import nft4 from '~/assets/hyena4.jpg';

    const slides = [
        { image: nft1, title: '#Hyena3047', rarity: 'RARE', bg: 'bg-cyan-500'},
        { image: nft2, title: '#Hyena3033', rarity: 'LEGENDARY', bg: 'bg-fuchsia-600' },
        { image: nft3, title: '#Hyena3036', rarity: 'COMMON', bg: 'bg-slate-400' },
        { image: nft4, title: '#Hyena3088', rarity: 'COMMON', bg: 'bg-slate-400' }
    ];

    const activeSlide = ref(0); // Will hold the index of the current slide

    function updateActiveSlide(index: number) { 
        console.log("Emitted slide index:", index);
        activeSlide.value = index; 
    }   

    watch(activeSlide, (newValue, oldValue) => {
        console.log("ActiveSlide changed from:", oldValue, "to:", newValue);
    });

    defineOptions({
        name: 'IndexPage',
        components: {
            Carousel,
            Slide,
            Pagination,
            Navigation,
        },
    })  
</script>

<template>
    <div class="rounded-md border-3 border-white p-4 bg-opacity-40 bg-gradient-to-br from-white-900 to-red-600 backdrop-blur-xl"> 
        <!-- Carousel Component -->
        <carousel :wrap-around="false" :items-to-show="1" @slide="updateActiveSlide" >
            <slide v-for="(slide, index) in slides" :key="index">
                <!-- NFT Name Title -->
                <!-- <h3 class="text-white mb-4 text-center text-2xl md:text-3xl">{{ slide.title }}</h3> -->
                <img class="mx-auto rounded-md h-auto" :src="slide.image" :alt="'Image ' + slide.title">
                <!-- Display the rarity -->
                <div :class="['text-center text-black text-sm mt-4 mx-auto cursor-pointer rounded-full px-2 py-2 w-1/2', slide.bg, 'border-2 border-gradient']">
                    {{ slide.rarity }}
                </div>

            </slide>
            <template #addons>
                <navigation text-white/> 
            </template>
        </carousel> 
    </div>
</template>