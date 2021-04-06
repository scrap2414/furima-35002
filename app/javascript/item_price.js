function count (){
  const priceInput  = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;


    const addTaxDom = document.getElementById("add-tax-price");
    tax = inputValue/10
    addTaxDom.innerHTML = Math.floor(tax)

    const addPrice = document.getElementById("profit")
    profit = inputValue - Math.floor(tax)
    addPrice.innerHTML = Math.floor(profit)
  });
}



window.addEventListener('load', count);
