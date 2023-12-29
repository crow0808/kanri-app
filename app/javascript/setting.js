document.addEventListener('turbo:load', function() {
  const settingsIcon = document.getElementById('settingsIcon');
  const settingsList = document.getElementById('settingsList');

  settingsIcon.addEventListener('click', function() {
    // クリックされたときにhiddenクラスの有無を切り替える
    settingsList.classList.toggle('hidden');
  });
});