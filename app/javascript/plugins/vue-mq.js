import Vue from 'vue'
import VueMq from 'vue-mq'

export default Vue.use(VueMq, {
  breakpoints: {
    // iPhone 6/7/8 Plus対応
    sm: 415,
    md: 1250,
    lg: Infinity,
  },
  // defaultBreakpoint: 'pc'
})
