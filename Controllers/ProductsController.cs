using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using E_Commerces.Data;
using E_Commerces.Models;
using Newtonsoft.Json;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;

namespace E_Commerces.Controllers
{
    [Authorize(Roles ="Customer")]
    public class ProductsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly ILogger<ProductsController> _logger;
        private readonly UserManager<AppUser> _userManager;

        // Key for cart value
        public const string CARTKEY = "cart";

        List<CartItem> GetCartItems()
        {
            var session = HttpContext.Session;
            string jsoncart = session.GetString(CARTKEY);
            if (jsoncart != null)
            {
                return JsonConvert.DeserializeObject<List<CartItem>>(jsoncart);
            }
            return new List<CartItem>();
        }
        // Clear Cart out of Session
        void ClearCart()
        {
            var session = HttpContext.Session;
            session.Remove(CARTKEY);
        }

        // Save cart into Session   
        void SaveCartSession(List<CartItem> ls)
        {
            var session = HttpContext.Session;
            string jsoncart = JsonConvert.SerializeObject(ls);
            session.SetString(CARTKEY, jsoncart);
        }


        public ProductsController(ApplicationDbContext context, ILogger<ProductsController> logger,UserManager<AppUser> userManager)
        {
            _context = context;
            _logger = logger;
            _userManager = userManager;
        }

        // GET: Products
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Products.Include(p => p.Category);
            return View(await applicationDbContext.ToListAsync());
        }
        // GET: Products/Shopping
        public async Task<IActionResult> Shopping()
        {
            var applicationDbContext = _context.Products.Include(i=>i.Images).Include(p => p.Category);
            return View(await applicationDbContext.ToListAsync());
        }
        // GET: Products/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p=> p.Images)
                .Include(p => p.Category)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // GET: Products/Create
        public IActionResult Create()
        {
            ViewData["categoryId"] = new SelectList(_context.Categories, "Id", "Name");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,Name,Description,OriginalPrice,Size,Color,categoryId,Files")] Product product)
        {
            if (ModelState.IsValid)
            {
                _context.Add(product);
                foreach (var file in product.Files)
                {
                    if (file.Length > 0)
                    {
                        // Generate a unique file name to prevent file name conflicts
                        var fileName = Path.GetRandomFileName() + Path.GetExtension(file.FileName);

                        // Define the path to save the file; adjust the path as per your requirement
                        var filePath = Path.Combine(Directory.GetCurrentDirectory(), "ImageStaticFiles/Products", fileName);

                        using (var stream = new FileStream(filePath, FileMode.Create))
                        {
                            await file.CopyToAsync(stream);
                        }

                        // Assuming you save the file in wwwroot/images and want to access it via a relative URL
                        var imageUrl = $"Products/{fileName}";

                        // Create a new Image object and add it to the Images collection of the insertedItem
                        product.Images.Add(new Image { ImageUrl = imageUrl });
                    }
                }
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            
            ViewData["categoryId"] = new SelectList(_context.Categories, "Id", "Name");
            return View(product);
        }

        // GET: Products/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products.FindAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            ViewData["categoryId"] = new SelectList(_context.Categories, "Id", "Description", product.categoryId);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Name,Description,OriginalPrice,Size,Color,categoryId")] Product product)
        {
            if (id != product.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(product);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!ProductExists(product.Id))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["categoryId"] = new SelectList(_context.Categories, "Id", "Description", product.categoryId);
            return View(product);
        }

        // GET: Products/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var product = await _context.Products
                .Include(p => p.Category)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (product == null)
            {
                return NotFound();
            }

            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var product = await _context.Products.FindAsync(id);
            if (product != null)
            {
                _context.Products.Remove(product);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool ProductExists(int id)
        {
            return _context.Products.Any(e => e.Id == id);
        }

        // Cart Functionality
        /// add into cart
        [Route("addcart/{productid:int}", Name = "addcart")]
        public IActionResult AddToCart([FromRoute] int productid)
        {

            var product = _context.Products
                            .Include(i=>i.Images)
                            .Where(p => p.Id == productid)
                            .FirstOrDefault();
            if (product == null)
                return NotFound("Product Is Not Founded");

            // Handling adding item to cart
            var cart = GetCartItems();
            var cartitem = cart.Find(p => p.product.Id == productid);
            if (cartitem != null)
            {
                // If Existed add one to quantity
                cartitem.quantity++;
            }
            else
            {
                //  Add New Item to Cart
                cart.Add(new CartItem() { quantity = 1, product = product });
            }

            // Saved to Session
            SaveCartSession(cart);
            // Redirect to show Cart
            return RedirectToAction(nameof(Cart));

        }
        /// Update
        [Route("/updatecart", Name = "updatecart")]
        [HttpPost]
        public IActionResult UpdateCart([FromForm] int productid, [FromForm] int quantity)
        {
            // update Cart on Quantity
            var cart = GetCartItems();
            var cartitem = cart.Find(p => p.product.Id == productid);
            if (cartitem != null)
            {
                // if existed incremented by 1
                cartitem.quantity = quantity;
            }
            SaveCartSession(cart);
            // No Page response using ajax to call this controller 
            return Ok();
        }
        //Remove item out of cart
        [Route("/removecart/{productid:int}", Name = "removecart")]
        public IActionResult RemoveCart([FromRoute] int productid)
        {
            var cart = GetCartItems();
            var cartitem = cart.Find(p => p.product.Id == productid);
            if (cartitem != null)
            {
                cart.Remove(cartitem);
            }

            SaveCartSession(cart);
            return RedirectToAction(nameof(Cart));
        }

        // Display shopping Cart Items
        [Route("/cart", Name = "cart")]
        public IActionResult Cart()
        {
            return View(GetCartItems());
        }

        public IActionResult CheckOut()
        {
            // Handling checkout

            // Calculate total price for the order
            decimal totalPrice = 0.0m;

            // Create a new Order
            var order = new Order
            {
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
                Status = "Waiting Confirmed",
                CustomerId = _userManager.GetUserId(User)
            };

            // Add order details from cart items
            foreach (var item in GetCartItems())
            {
                order.OrderDetails.Add(new OrderDetail
                {
                    Quantity = item.quantity,
                    Price = item.product.OriginalPrice,
                    ProductId = item.product.Id,
                });
                totalPrice += item.product.OriginalPrice * item.quantity;
            }

            // Add the order to the database
            _context.Orders.Add(order);
            _context.SaveChanges();

            // Create a new Invoice
            var invoice = new Invoice
            {
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
                Status = "Not Completed",
                TotalPrice = totalPrice, // Set total price for the order
                VatRate = 0.15m, // Example: Assuming VAT rate is 15%
                VatCharge = totalPrice * 0.15m, // Calculate VAT charge
                Id = order.Id // Associate the invoice with the order
            };

            // Add the invoice to the database
            _context.Invoices.Add(invoice);
            _context.SaveChanges();

            // Clear the cart
            ClearCart();

            return RedirectToAction("Index", "Orders");
        }
    }
}
