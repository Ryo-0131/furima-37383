window.addEventListener('load', () => {
    const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
      // 記入価格の表示
      const inputValue = priceInput.value;
      // 販売手数料 (10%)の計算
      const addTaxDom = document.getElementById("add-tax-price");
      addTaxDom.innerHTML = Math.floor(inputValue * 0.1 );
      // 販売利益の計算
      const addPofitDom = document.getElementById("profit");
      addPofitDom.innerHTML = Math.floor(inputValue - addTaxDom.innerHTML)
    })
  });