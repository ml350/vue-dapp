<script setup lang="ts">
/*global*/
/*eslint no-undef: "error"*/ 
  const banner = 'src/assets/banner1.png'
</script> 

<template>
    <div w-full my-11 py-5>
        <img :src="banner" w-full alt="HaHa Hyenas Logo" />
    </div>
    <TheButton> LEARN MORE </TheButton>
</template>