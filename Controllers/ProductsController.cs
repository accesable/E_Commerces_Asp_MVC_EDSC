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
using Microsoft.AspNetCore.Identity.UI.Services;
using System.Text;

namespace E_Commerces.Controllers
{
    [Authorize]
    public class ProductsController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly ILogger<ProductsController> _logger;
        private readonly UserManager<AppUser> _userManager;
        private readonly IEmailSender _emailSender;

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


        public ProductsController(ApplicationDbContext context, ILogger<ProductsController> logger,UserManager<AppUser> userManager,IEmailSender emailSender)
        {
            _context = context;
            _logger = logger;
            _userManager = userManager;
            _emailSender = emailSender;
        }

        // GET: Products
        [Authorize(Roles = "System Admin")]
        public async Task<IActionResult> Index()
        {
            var applicationDbContext = _context.Products.Include(p => p.Category);
            return View(await applicationDbContext.ToListAsync());
        }
        // GET: Products/Shopping
        [Authorize(Roles = "Customer")]
        public async Task<IActionResult> Shopping(int ? category)
        {
            ViewData["categoryId"] = new SelectList(_context.Categories, "Id", "Name");

            IQueryable<Product> productsQuery = _context.Products.Include(i => i.Images).Include(p => p.Category);

            if (category != null)
            {
                // Filter products by category if category parameter is not null or empty
                productsQuery = productsQuery.Where(p => p.Category.Id == category);
            }

            var products = await productsQuery.ToListAsync();

            return View(products);
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
        [Authorize(Roles = "System Admin")]
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
        [Authorize(Roles = "System Admin")]
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
            ViewData["categoryId"] = new SelectList(_context.Categories, "Id", "Name");
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
            ViewData["categoryId"] = new SelectList(_context.Categories, "Id", "Name");
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
            // Retrieve status message from TempData
            string statusMessage = TempData["StatusMessage"] as string;

            // Pass status message to the view
            ViewData["StatusMessage"] = statusMessage;
            return View(GetCartItems());
        }
        public const decimal VAT_RATE = 0.05m;

        public async Task<IActionResult> CheckOut()
        {
            // Handling checkout

            // Calculate total price for the order
            decimal totalPrice = 0.0m;
            var user = await _userManager.GetUserAsync(User);
            if (string.IsNullOrEmpty(user.Address) || string.IsNullOrEmpty(user.FullName) || string.IsNullOrEmpty(user.PhoneNumber))
            {
                TempData["StatusMessage"] = "Error : Please Update Your Information before Placing An Order";
                return RedirectToAction(nameof(Cart));
            }

            // Create a new Order
            var order = new Order
            {
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
                Status = "Waiting Confirmed",
                CustomerId = user.Id
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
            foreach (var i in order.OrderDetails)
            {
                i.Product = _context.Products.Find(i.ProductId);
            }

            // Add the order to the database
             await _context.Orders.AddAsync(order);
             await _context.SaveChangesAsync();

            // Create a new Invoice
            var invoice = new Invoice
            {
                CreatedAt = DateTime.Now,
                UpdatedAt = DateTime.Now,
                Status = "Not Completed",
                TotalPrice = totalPrice, // Set total price for the order
                VatRate = VAT_RATE, // Example: Assuming VAT rate is 15%
                VatCharge = totalPrice * VAT_RATE, // Calculate VAT charge
                Id = order.Id // Associate the invoice with the order
            };

            invoice.FinalPrice = invoice.TotalPrice - invoice.Promotion + invoice.VatCharge;

            // Add the invoice to the database
            await _context.Invoices.AddAsync(invoice);
            await _context.SaveChangesAsync();

            // Clear the cart
            var htmlContent = GenerateInvoiceHtml(order, invoice);

            await _emailSender.SendEmailAsync(user.Email, $"Your Trending Fashion Order's Invoice {order.Id}",
                htmlContent);
            ClearCart();

            return RedirectToAction("Details", "Orders",new { id = order.Id });
        }
        private string GenerateInvoiceHtml(Order order,Invoice invoice)
        {
            var htmlContent = new StringBuilder();
            htmlContent.AppendLine("<!DOCTYPE html>");
            htmlContent.AppendLine("<html>");
            htmlContent.AppendLine("<head>");
            htmlContent.AppendLine("<title>Invoice</title>");
            htmlContent.AppendLine("<style>");
            // Add CSS styles here
            htmlContent.AppendLine("</style>");
            htmlContent.AppendLine("</head>");
            htmlContent.AppendLine("<body>");
            htmlContent.AppendLine($"<h1>E Commerces Invoice {invoice.Id}</h1>");
            // Add order details to HTML content
            htmlContent.AppendLine("<div>");
            htmlContent.AppendLine($"<h4>Order ID : {order.Id}</h4>");
            htmlContent.AppendLine("<hr />");
            htmlContent.AppendLine($"<p>Created At: {order.CreatedAt}</p>");
            htmlContent.AppendLine($"<p>Updated At: {order.UpdatedAt}</p>");
            htmlContent.AppendLine($"<p>Status: {order.Status}</p>");
            // Add customer info to HTML content
            htmlContent.AppendLine("<h4>Customer Info</h4>");
            htmlContent.AppendLine($"<p>Customer Full Name: {order.Customer.FullName}</p>");
            htmlContent.AppendLine($"<p>Customer Address: {order.Customer.Address}</p>");
            htmlContent.AppendLine($"<p>Customer Phone Number: {order.Customer.PhoneNumber}</p>");
            htmlContent.AppendLine($"<p>Customer Email: {order.Customer.Email}</p>");
            // Add order details to HTML content
            htmlContent.AppendLine("<h4>Order Details</h4>");
            htmlContent.AppendLine("<hr />");
            htmlContent.AppendLine("<table>");
            htmlContent.AppendLine("<thead>");
            htmlContent.AppendLine("<tr><th>Product</th><th>Quantity</th><th>Price</th></tr>");
            htmlContent.AppendLine("</thead>");
            htmlContent.AppendLine("<tbody>");
            foreach (var orderDetail in order.OrderDetails)
            {
                htmlContent.AppendLine("<tr>");
                htmlContent.AppendLine($"<td>{orderDetail.Product.Name}</td>");
                htmlContent.AppendLine($"<td>{orderDetail.Quantity}</td>");
                htmlContent.AppendLine($"<td>{orderDetail.Price}</td>");
                htmlContent.AppendLine("</tr>");
            }
            htmlContent.AppendLine($"<p>Price before VAT charged : {invoice.TotalPrice}</p>");
            htmlContent.AppendLine($"<p>VAT charged ({invoice.VatRate} % per transaction) : {invoice.VatCharge}</p>");
            htmlContent.AppendLine($"<p>Price after VAT charged : {invoice.FinalPrice}</p>");
            htmlContent.AppendLine("</tbody>");
            htmlContent.AppendLine("</table>");
            htmlContent.AppendLine("</div>");
            htmlContent.AppendLine("</body>");
            htmlContent.AppendLine("</html>");

            return htmlContent.ToString();
        }
    }
}
