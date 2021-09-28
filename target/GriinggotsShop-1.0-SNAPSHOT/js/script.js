function add_to_cart(pid, pname, price) {

    let cart = localStorage.getItem("cart");
    if (cart === null) {
        let products = [];
        let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
       // console.log("product is added for the first time.");
        showToast("Item is added to your cart");
    } else
    {
        //if item is already present in cart.
        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId === pid);

        if (oldProduct) {
            oldProduct.productQuantity = oldProduct.productQuantity + 1;
            pcart.map((item) => {
                if (item.productId === oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;
                }
            });
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("product quantity is incresed.");
            showToast(oldProduct.productName + "Product Quantity increased, Quantity = "  +oldProduct.productQuantity);
            
        } else
        {
            let product = {productId: pid, productName: pname, productQuantity: 1, productPrice: price};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
                    //console.log("product is added.");
            showToast("Product is added to your cart");
        }
    }
    updateCart();
   
}
 
function updateCart()
{
    let cartString = localStorage.getItem("cart");
    let cart = JSON.parse(cartString);
    if(cart == null || cart == 0){
        console.log("cart is empty");
        $(".cart-items").html("(0)"); 
        $(".cart-body").html("Cart is Empty!");
        $(".checkout-btn").attr('disabled' , true);        
    }
    else{
        console.log(cart);
         $(".cart-items").html(  `( ${cart.length} ) ` );
         
        let table = 
         `<table class=table >
        <thead class='thread-light' >
        <tr>
        <th>Item Nmae</th>
        <th>Price </th>
        <th>Quantity</th>
        <th>Total Price</th>
        <th>Action</th>
        
        </tr>      
        </thead>
        
        `;
       
        let totalPrice=0;
        cart.map((item) => {
            table+=
                    `<tr>
                        <td>${item.productName}</td>
                        <td>${item.productPrice}</td>
                         <td>${item.productQuantity }</td>
                        <td>${item.productQuantity * item.productPrice}</td> 
                        <td><button class="btn "><i  onclick='deleteItemfromCart(${item.productId})' class="fas fa-trash" style="color:red"></i></button</td>
                    </tr>`;
            totalPrice+=item.productPrice * item.productQuantity;
        });
        
        table=table + `
        <tr><td colspan='5' class='text-right m-5' style="font-weight: bold; color:green"> Total Price: <i class="fas fa-rupee-sign"></i> ${totalPrice}  </td></tr>
        </table>`;
        $(".cart-body").html(table);
       $(".checkout-btn").attr('disabled', false); 
    }
}

function deleteItemfromCart(pid){
    
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newcart = cart.filter((item) => item.productId !== pid);
    localStorage.setItem('cart', JSON.stringify(newcart));
    updateCart();
     showToast("item is deleted from your cart! ");
}


$(document).ready(function(){
    updateCart();
});


function showToast(content){
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout ( () =>{
        $("#toast").removeClass("display");
    }, 2000);
}


function goToCheckout( ){
   window.location = "checkout.jsp";
}