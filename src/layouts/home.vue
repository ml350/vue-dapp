<!-- eslint-disable vue/multi-word-component-names -->
<template>
  <main text="center gray-700 dark:gray-200" px-8 >
    <TheNavbar />
    <TheHeader />
    <RouterView />
    <div mx-auto mt-5 text-center text-sm opacity-50>
      [Home Layout]
    </div>
    <TheFooter />
  </main>
</template>
