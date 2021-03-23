<template>
  <div>
    <router-view name="header" />
    <router-view v-if="$mq !== 'sm'" name="pageMenu" />
    <router-view />
    <router-view name="footer" />
  </div>
</template>

<style>
  *,
  :after,
  :before {
    box-sizing: border-box;
    margin: 0;
  }
  .link__hover{
    color: #0000ff;
  }
  .link__hover:hover{
    text-decoration-line: underline;
    color: #ffa500;
    cursor: pointer;
  }
  .btn__hover:hover{
    background-color: #ffa500;
  }
  .button__cv{
  height: 50px;
  border: none;
  outline: 0;
  border-radius: 6px;
  cursor: pointer;
  color: #fff;
  background-color: #00b900;
  font-weight: 700;
  }
  .hidden{
    display: none;
  }
  .active__fade__in{
    animation: fadeOut 0.35s;
    animation: fadeIn 0.35s;
  }
  @keyframes fadeIn {
    0% {
      opacity: 0;
    }

    100% {
      opacity: 1;
    }
  }
</style>
