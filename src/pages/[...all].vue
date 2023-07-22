<!-- eslint-disable vue/multi-word-component-names -->
<script setup lang="ts">
/*global useI18n*/
/*eslint no-undef: "error"*/
const { t } = useI18n()
</script>

<template>
  <div>
    {{ t('not-found') }}
  </div>
</template>

<route lang="yaml">
meta:
  layout: 404
</route>
