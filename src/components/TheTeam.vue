<template>
  <section>
    <div class="py-8 px-4 mx-auto max-w-screen-xl lg:py-16 lg:px-6"> 
      <div class="grid gap-8 mb-6 lg:mb-16 md:grid-cols-2">
        <div v-for="member in team" :key="member.name" class="items-center bg-gray-50 rounded-lg shadow sm:flex dark:bg-gray-800 dark:border-gray-700">
          <div class="p-5 flex flex-col items-center">
            <a :href="member.link">
              <img class="w-full rounded-full mb-4" :src="member.image" :alt="member.name">
            </a>
            <h3 class="text-xl font-bold tracking-tight text-gray-900 dark:text-white">
              <a :href="member.link">{{ member.name }}</a>
            </h3>
            <span class="text-gray-500  dark:text-gray-400">{{ member.role }}</span>
          </div>
          <div class="p-5"> 
            <p class="mt-3 text-left mb-4 font-light text-gray-500 dark:text-gray-400 hover:text-white">{{ member.bio }}</p>
            <ul class="flex space-x-4 sm:mt-0">
              <!-- Add social media links here if needed -->
            </ul>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script setup>
  import hyenaImage from "~/assets/hyena3.jpg";
  
  const team = [
    {
      name: "Wiz",
      role: "Founder",
      bio: 'Hello “My Names James” my family own and run an events venue here in Derbyshire UK. My background is sales and marketing and in the last few years I have been exploring crypto.',
      image: hyenaImage,
      link: "#"
    },
    {
      name: "Greg",
      role: "Co-Founder",
      bio: "Hi, I’m Greg Brown Co-Founder of HaHa Hyenas, I have worked over a year building the infrastructure, team, and vision for this project and cant wait for you all to see it.",
      image: hyenaImage,
      link: "#"
    },
    {
      name: "Ian",
      role: "Comedian",
      bio: "Hello, I am Ian I made my comedy debut in 2017 after launching the popular YouTube and TikTok channel, 7 Day Summary. During that time, I was responsible for writing over 50 weekly jokes.",
      image: hyenaImage,
      link: "#"
    },
    {
      name: "Imzi",
      role: "Artist",
      bio: "Originally from Central Asia I graduated from the Institute of Art and Design here in Uzbekistan as a sculptor. I become the chief artist for the Assai Design Studio and developed my style and love for digital art.",
      image: hyenaImage,
      link: "#"
    }
  ];
</script>
  