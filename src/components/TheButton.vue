<template>
    <div class="button-container relative inline-block">
      <button class="custom-btn relative overflow-hidden text-black py-2 px-8 font-bold rounded-full">
        <div class="content-wrapper relative z-10"> <!-- New wrapper with z-index -->
            <slot></slot> <!-- Allow custom button content -->
        </div>
      </button>
      <div class="hahaha-text absolute left-1/2 transform -translate-x-1/2 font-hand text-white text-2xl flex opacity-0">
        <span>Ha</span>
        <span>Ha</span>
        <span>Ha</span>
      </div>
    </div>
</template>
<style>
@import "../styles/button01.less";
</style>
