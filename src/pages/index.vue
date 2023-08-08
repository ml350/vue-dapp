<script setup lang="ts">
  /*global useI18n*/
  /*eslint no-undef: "error"*/
  import 'vue3-carousel/dist/carousel.css'
  import { Carousel, Slide, Pagination, Navigation } from 'vue3-carousel' 
  
  defineOptions({
    name: 'IndexPage',
    components: {
      Carousel,
      Slide,
      Pagination,
      Navigation,
    },
  }) 
  
  // const user = useUserStore()
  // const name = ref(user.savedName)

  // const router = useRouter()
  // function go() {
  //   if (name.value)
  //     router.push(`/hi/${encodeURIComponent(name.value)}`)
  // } 

  const { t } = useI18n()
</script>

<template>
  <div container py-8 mx-auto md:flex md:justify-between md:items-center> 
    <div text-left>
      <h2 text-xl>{{ t('intro.title') }}</h2>
      <p>
         {{ t('intro.desc') }} 
      </p>
    </div> 
    <div>
      <carousel :items-to-show="1.5">
        <slide v-for="slide in 6" :key="slide">
          {{ slide }}
        </slide>

        <template #addons>
          <navigation />
          <pagination />
        </template>
      </carousel>
    </div> 
  </div>
</template>

<route lang="yaml">
  meta:
    layout: home
</route>
