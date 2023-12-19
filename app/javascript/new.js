function calculation() {
  const calculate = document.getElementById("item-price");

  calculate.addEventListener("input", function () {
    let input = calculate.value.trim(); // 入力された値を取得し、前後の空白を削除
    if (input === "") {
      input = 0; // もし空の場合、デフォルト値として0を設定する
    } else {
      input = parseFloat(input); // 入力が空でない場合、数値に変換
    }

    let tenPercent = Math.floor(input * 0.1); // 入力された値の10%を計算
    let commission = document.getElementById("add-tax-price");
    commission.innerHTML = tenPercent;

    let profit = document.getElementById("profit");
    profit.innerHTML = input - tenPercent;
  });
}

window.addEventListener("turbo:load", calculation);
window.addEventListener("turbo:render", calculation);
