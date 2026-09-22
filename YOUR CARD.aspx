<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Shopping Cart | FarmerMart</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    body { background-color: #f4f7f6; font-family: 'Segoe UI', sans-serif; padding: 40px 0; }
    .cart-container { background: white; border-radius: 15px; max-width: 600px; margin: 0 auto; border: 1px solid #eee; }
    
    /* FIX: Image size ko control karne ke liye */
    .cart-img-fixed { 
        width: 60px !important; 
        height: 60px !important; 
        object-fit: cover; 
        border-radius: 8px; 
    }

    .qty-btn { 
        width: 28px; height: 28px; 
        display: flex; align-items: center; 
        justify-content: center; border-radius: 50%; 
        border: 1px solid #198754; background: white; cursor: pointer; 
        font-weight: bold; color: #198754;
    }
    .qty-btn:hover { background: #198754; color: white; }
    .empty-cart-msg { color: #999; text-align: center; padding: 40px; }
    .text-success-mart { color: #198754; }
  </style>
</head>
<body>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-lg-8">
      <div class="cart-container p-4 shadow-sm">
        <div class="d-flex justify-content-between align-items-center mb-4 border-bottom pb-2">
            <h5 class="fw-bold mb-0 text-success-mart">🛒 Your FarmerMart Cart</h5>
            <a href="ProductList.aspx" class="btn btn-outline-success btn-sm">Add Items</a>
        </div>
        
        <div id="cart-items-wrapper">
            </div>

        <hr>

        <div class="d-flex justify-content-between mb-2">
          <span class="text-muted">Subtotal</span>
          <span id="subtotal-price" class="fw-semibold">₹ 0.00</span>
        </div>
        <div class="d-flex justify-content-between mb-2">
          <span class="text-muted">Delivery</span>
          <span id="shipping-price" class="fw-semibold">₹ 0.00</span>
        </div>
        <div class="d-flex justify-content-between mb-3 border-top pt-2 mt-2">
          <span class="fw-bold">Total Amount</span>
          <span id="total-price" class="fw-bold fs-5 text-success-mart">₹ 0.00</span>
        </div>

        <button class="btn btn-success w-100 py-3 fw-bold mt-2" onclick="checkout()">Place Order</button>
      </div>
    </div>
  </div>
</div>

<script>
    let cart = JSON.parse(localStorage.getItem('my_web_cart')) || [];

    function renderCart() {
        const wrapper = document.getElementById('cart-items-wrapper');
        const subtotalEl = document.getElementById('subtotal-price');
        const shippingEl = document.getElementById('shipping-price');
        const totalEl = document.getElementById('total-price');

        if (cart.length === 0) {
            wrapper.innerHTML = `<div class="empty-cart-msg"><p>Your cart is empty.</p></div>`;
            subtotalEl.innerText = "₹ 0.00";
            shippingEl.innerText = "₹ 0.00";
            totalEl.innerText = "₹ 0.00";
            return;
        }

        wrapper.innerHTML = cart.map(item => `
          <div class="d-flex align-items-center mb-3 border-bottom pb-3">
            <img src="${item.img}" class="cart-img-fixed" />
            <div class="flex-grow-1 ms-3">
              <div class="fw-bold text-truncate" style="max-width: 150px;">${item.name}</div>
              <div class="text-muted small">₹ ${item.price}</div>
            </div>
            <div class="d-flex align-items-center me-3">
              <div class="qty-btn" onclick="updateQty('${item.id}', -1)">-</div>
              <span class="mx-3 fw-bold">${item.qty}</span>
              <div class="qty-btn" onclick="updateQty('${item.id}', 1)">+</div>
            </div>
            <div class="fw-bold text-end" style="width: 80px;">₹ ${(item.price * item.qty).toFixed(2)}</div>
          </div>
        `).join('');

        const subtotal = cart.reduce((sum, item) => sum + (item.price * item.qty), 0);
        const shipping = subtotal > 0 ? 40 : 0;

        subtotalEl.innerText = `₹ ${subtotal.toFixed(2)}`;
        shippingEl.innerText = `₹ ${shipping.toFixed(2)}`;
        totalEl.innerText = `₹ ${(subtotal + shipping).toFixed(2)}`;
    }

    window.updateQty = function (id, change) {
        const item = cart.find(i => i.id === id);
        if (item) {
            item.qty += change;
            if (item.qty <= 0) {
                cart = cart.filter(i => i.id !== id);
            }
        }
        localStorage.setItem('my_web_cart', JSON.stringify(cart));
        renderCart();
    };

    function checkout() {
        if (cart.length === 0) return alert("Cart khali hai!");
        alert("Order Successful! Total: " + document.getElementById('total-price').innerText);
    }

    renderCart();
</script>

</body>
</html>