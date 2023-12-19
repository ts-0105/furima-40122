function calculation() {
  const calculate = document.getElementById("item-price");

  calculate.addEventListener("input", function () {
    let input = parseFloat(calculate.value); // 入力された値を取得
    let tenPercent = Math.floor(input * 0.1); // 入力された値の10%を計算
    let commission = document.getElementById("add-tax-price"); //入力された数値の10%を表示
    commission.innerHTML = tenPercent;
    let profit = document.getElementById("profit"); //入力された数値から10%引いて小数点を繰り上げた数値表示
    profit.innerHTML = input - tenPercent;
  });
}

window.addEventListener("load", calculation);

