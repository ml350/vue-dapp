<script setup lang="ts">
    /*global ref*/
    /*eslint no-undef: "error"*/
    import VueCountdown from '@chenfengyuan/vue-countdown';

    const now = new Date();
    const newYear = new Date(now.getFullYear() + 1, 0, 1);
    const time = ref<number>(newYear.getTime() - now.getTime());
</script>

<template>
  <vue-countdown :time="time" :interval="100" v-slot="{ days, hours, minutes, seconds, milliseconds }">
    New Year Countdown：{{ days }} days, {{ hours }} hours, {{ minutes }} minutes, {{ seconds }}.{{ Math.floor(milliseconds / 100) }} seconds.
  </vue-countdown>
</template>