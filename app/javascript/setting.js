document.addEventListener('turbo:load', function() {
  const settingsIcon = document.getElementById('settingsIcon');
  const settingsList = document.getElementById('settingsList');

  settingsIcon.addEventListener('click', function(e) {
    // クリックされたときにhiddenクラスの有無を切り替える
    settingsList.classList.toggle('hidden');
  });

  // ドキュメント全体に対するクリックイベントリスナー
  document.addEventListener('click', function(e) {
    // クリックされた場所が設定アイコン自体または設定リスト内の場合は何もしない
    if (e.target === settingsIcon || settingsList.contains(e.target)) {
      return;
    }
    // 設定リストが表示されている場合のみ非表示にする
    if (!settingsList.classList.contains('hidden')) {
      settingsList.classList.add('hidden');
    }
  });
});