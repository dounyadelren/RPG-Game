import { createApp } from "vue";
import { createPinia } from "pinia";
import piniaPersist from "pinia-plugin-persist";
import { globalCookiesConfig } from "vue3-cookies";

import App from "./App.vue";
import router from "./router";

import "./assets/styles/index.scss";
import 'element-plus/theme-chalk/src/message.scss'

globalCookiesConfig({
  expireTimes: "30d",
  path: "/",
  domain: "",
  secure: true,
  sameSite: "None",
});

const app = createApp(App);

const pinia = createPinia();
pinia.use(piniaPersist);

app.use(pinia);
app.use(router);

app.mount("#app");
