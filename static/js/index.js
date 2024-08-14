const text = "안녕하세요 이것은 AWS의 RDS와 연동된 django 서비스 입니다.";
const typingEffect = document.getElementById('typing-effect');
let i = 0;

function getRandomDelay() {
  return Math.random() * 100 + 50;
}

function typeWriter() {
  if (i < text.length) {
    typingEffect.innerHTML += text.charAt(i);
    i++;
    setTimeout(typeWriter, getRandomDelay());
  } else {
    setTimeout(eraseText, 1000);
  }
}

function eraseText() {
  if (i > 0) {
    typingEffect.innerHTML = text.substring(0, i-1);
    i--;
    setTimeout(eraseText, getRandomDelay() / 2);
  } else {
    setTimeout(typeWriter, 1000);
  }
}

window.onload = typeWriter;