<template>
  <div class="layout-footer">
    {{ year }} © Powered by
    <a
      href="https://github.com/jiaxudonggit/MyBlog"
      target="_blank"
    >iBlog</a>
    <span v-if="settings.govRecordInfo" class="record-info">
      |
      {{ settings.govRecordInfo }}
    </span>
    <span v-if="settings.recordInfo" class="record-info">
      |
      <a href="http://beian.miit.gov.cn" target="_blank">{{ settings.recordInfo }}</a>
    </span>
  </div>
</template>

<script lang="ts">
import Vue, { PropOptions } from 'vue';
export default Vue.extend({
  props: {
    showLogin: {
      type: Boolean,
      default: false
    } as PropOptions<boolean>
  },
  data () {
    return {
      year: new Date().getFullYear(),
      settings: this.$store.state.settings
    };
  }
});
</script>

<style scoped>
.layout-footer {
  text-align: center;
  color: #888;
  user-select: none;
  padding: 24px 0;
}

@media (max-width: 576px) {
  .record-info,
  .admin-link {
    display: none;
  }
}
</style>
