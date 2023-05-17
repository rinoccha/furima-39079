function count (){
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener("keyup", () => {
    const priceNumber = itemPrice.value;
    const tax = Math.floor(priceNumber / 10);
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = `${tax}` ;
    const profitTax = Math.floor(priceNumber - tax);
    const profit = document.getElementById("profit");
    profit.innerHTML = `${profitTax}`;
  });
};


window.addEventListener('load', count);