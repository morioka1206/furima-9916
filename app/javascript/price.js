function price(){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price")
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1);
    inputTax = Math.floor(inputValue * 0.1);
    const salesProfit = document.getElementById("profit")
    salesProfit.innerHTML = Math.floor(inputValue - inputTax);
  })
}

window.addEventListener('load', price);