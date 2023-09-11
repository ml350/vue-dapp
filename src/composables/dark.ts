// these APIs are auto-imported from @vueuse/core
export const isDark = useDark()

// Set default to dark mode if no preference is stored yet
if (typeof localStorage !== 'undefined' && !localStorage.getItem('dark')) {
    isDark.value = true
  }

export const toggleDark = useToggle(isDark)
export const preferredDark = usePreferredDark()