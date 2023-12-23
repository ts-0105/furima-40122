const pay = () => {
  const publicKey = gon.public_key;
  const payjp = Payjp(publicKey); // PAY.JPテスト公開鍵
  //payjpインスタンス作成
  const elements = payjp.elements();
  //payjpからインスタンス作成
  const numberElement = elements.create("cardNumber");
  const expiryElement = elements.create("cardExpiry");
  const cvcElement = elements.create("cardCvc");
  //createメソッドで入力フォームを作成
  numberElement.mount("#number-form");
  expiryElement.mount("#expiry-form");
  cvcElement.mount("#cvc-form");
  //mountメソッドでhtmlのid属性と置き換えた
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    //ここからトークン化
    payjp.createToken(numberElement).then(function (response) {
      if (response.error) {
      } else {
        const token = response.id;
        //ここまでトークン化
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
        //フォームにトークンの値をセット
      }
      numberElement.clear();
      expiryElement.clear();
      cvcElement.clear();
      //カード情報をクリア
      document.getElementById("charge-form").submit();
      //カード情報をサーバーサイドに送信
    });
    e.preventDefault();
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);