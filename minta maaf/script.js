const yesBtn = document.querySelector('.yes');
const noBtn = document.querySelector('.no');
const alertBox = document.getElementById('alertBox');
let scaleValue = 1;
let clickCount = 0;

function showAlert() {
    scaleValue = 1;
    yesBtn.style.transform = 'scale(1)';
    alertBox.classList.add('show');
    setTimeout(() => {
        alertBox.classList.remove('show');
    }, 2500);
}

noBtn.addEventListener('click', () => {
    clickCount++;
    scaleValue += 0.1;
    yesBtn.style.transform = `scale(1.1)`;
    setTimeout(() => {
        yesBtn.style.transform = `scale(1)`;
    }, 300);

    if (clickCount >= 5) {
        noBtn.textContent = 'Maafin 💞';
        noBtn.classList.remove('no');
        noBtn.classList.add('yes');
        noBtn.style.backgroundColor = '#ff4f91';
        noBtn.style.color = 'white';
        noBtn.addEventListener('click', showAlert);
    }
});

yesBtn.addEventListener('click', showAlert);
