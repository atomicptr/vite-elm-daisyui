import { Elm } from "./elm/Main.elm";

const KEY_COUNT = "count";

const initialCount = JSON.parse(localStorage.getItem(KEY_COUNT) ?? "0");

const app = Elm.Main.init({
    flags: {
        initialCount,
    },
});

app.ports?.updateCounter?.subscribe((count) => {
    localStorage.setItem(KEY_COUNT, JSON.stringify(count));
});
