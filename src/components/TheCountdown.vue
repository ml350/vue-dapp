<script setup lang="ts">
    /*global ref*/
    /*eslint no-undef: "error"*/
    import VueCountdown from '@chenfengyuan/vue-countdown';

    const now = new Date();
    const newYear = new Date(now.getFullYear() + 1, 0, 1);
    const time = ref<number>(newYear.getTime() - now.getTime());
</script>

<template>
  <ClientOnly>
    <vue-countdown mb-4 text-xl lg:text-2xl xl:text-2xl text-black font-bold :time="time" :interval="100" v-slot="{ days, hours, minutes, seconds, }">
      <div class="flex flex-row justify-center items-center text-center space-x-4 ">
        <!-- Days -->
        <div class="flex flex-col items-center">
          <span class="counterSpan text-black font-bold">{{ days }}</span>
          <span>Days</span>
        </div>

        <!-- Hours -->
        <div class="flex flex-col items-center">
          <span class="counterSpan text-black font-bold">{{ hours }}</span>
          <span>Hours</span>
        </div>

        <!-- Minutes -->
        <div class="flex flex-col items-center">
          <span class="counterSpan text-black font-bold">{{ minutes }}</span>
          <span>Min</span>
        </div>

        <!-- Seconds -->
        <div class="flex flex-col items-center">
          <span class="counterSpan text-black font-bold">{{ seconds }}</span>
          <span>Sec</span>
        </div>
      </div>
    </vue-countdown>
  </ClientOnly>
</template>
