<script setup lang="ts">
/*global useI18n*/
/*eslint no-undef: "error"*/
defineOptions({
  name: 'IndexPage',
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
  <div>
    <div text-4xl>
      <div i-carbon-3rd-party-connected inline-block />
    </div>
    <p>
      <a rel="noreferrer" href="https://github.com/antfu/vitesse" target="_blank">
        HaHa Hyenas NFT Collection
      </a>
    </p>
    <p>
      <em text-sm opacity-75>{{ t('intro.desc') }}</em>
    </p> 
  </div>
</template>

<route lang="yaml">
  meta:
    layout: home
</route>
