<script setup lang="ts">
    /*global*/
    /*eslint no-undef: "error"*/ 
    import { ref } from 'vue'

    const banner = 'src/assets/faq.png'

    const faqList = ref([
        { id: 1, question: "What is HaHa Hyenas NFT Collection?", answer: "This is an accordion.", show: false },
        { id: 2, question: "Who is the creator of the project", answer: "Click on the question to see the answer.", show: false },
        { id: 3, question: "How do I become a part of the project?", answer: "Click on the question to see the answer.", show: false },
        { id: 4, question: "What will the mind funds be used for?", answer: "Click on the question to see the answer.", show: false },
        { id: 5, question: "What is total supply of the project?", answer: "Click on the question to see the answer.", show: false },
        { id: 6, question: "How many different traits are there?", answer: "Click on the question to see the answer.", show: false }
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
            <div class="bg-primary-color lg:w-7/8" px-12 py-6 rounded-3xl>
                <div v-for="item in faqList" :key="item.id" class="bg-dark-background" mx-auto rounded-2xl mb-4 >
                    <button @click="toggle(item.id)" flex justify-between gap-2 items-center text-2xl pl-10 w-full p-2 text-white>
                        {{ item.question }}
                        <div :class="item.show ?  'i-carbon-close-filled' : 'i-carbon-add-alt'"></div>
                    </button>
                    <transition name="slide-fade">
                        <div v-if="item.show" p-2 rounded-b-lg bg-black pl-10 text-xl text-left text-white >
                            {{ item.answer }}
                        </div>
                    </transition>
                </div>
            </div> 
        </div>
        
        <!-- Image (40%) -->
        <div class="lg:w-2/8">
            <img :src="banner" alt="HaHa Hyenas Logo" class="w-full mx-auto h-auto">
        </div>
    </div> 
</template>