document.addEventListener("DOMContentLoaded", () => {
  const light = document.createElement("div");
  light.classList.add("light-effect");
  document.body.appendChild(light);

  document.addEventListener("mousemove", (e) => {
    const { clientX: x, clientY: y } = e;
    light.style.transform = `translate(${x - window.innerWidth / 2}px, ${y - window.innerHeight / 2}px)`;
  });
});
