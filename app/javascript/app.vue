<template>
  <div>
    <router-view name="header" />
    <router-view />
    <router-view name="footer" />
  </div>
</template>

<style>
  .link__hover{
    color: #0000ff;
  }
  .link__hover:hover{
    text-decoration-line: underline;
    color: #ffa500;
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
</style>
