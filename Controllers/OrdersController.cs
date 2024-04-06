using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using E_Commerces.Data;
using E_Commerces.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace E_Commerces.Controllers
{
    [Authorize]
    public class OrdersController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<AppUser> _userManager;

        public OrdersController(ApplicationDbContext context,UserManager<AppUser> userManager)
        {
            _context = context;
            _userManager = userManager;
        }

        // GET: Orders
        public async Task<IActionResult> Index()
        {
            // Check if the current user is an admin
            if (User.IsInRole("System Admin"))
            {
                var allOrders = await _context.Orders.Include(o => o.Customer).ToListAsync();
                return View(allOrders);
            }
            else if (User.IsInRole("Customer"))
            {
                // Get the currently logged-in user
                var currentUser = await _userManager.GetUserAsync(User);

                // Retrieve orders associated with the current customer
                var customerOrders = await _context.Orders
                    .Where(o => o.CustomerId == currentUser.Id)
                    .Include(o => o.Customer)
                    .ToListAsync();

                return View(customerOrders);
            }

            // If the user role is neither Admin nor Customer, return an error view or handle as needed
            return RedirectToPage("./Identity/Account/AccessDenied");
        }

        // GET: Orders/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var order = await _context.Orders
                .Include(d => d.OrderDetails).ThenInclude(od => od.Product)
                .Include(o => o.Customer)
                .Include(i => i.Invoice)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (order == null)
            {
                return NotFound();
            }

            ViewBag.FormattedCreatedAt = order.CreatedAt.ToString("yyyy-MM-dd HH:mm");
            ViewBag.FormattedUpdatedAt = order.UpdatedAt.ToString("yyyy-MM-dd HH:mm");


            return View(order);
        }

        // GET: Orders/Create
        public IActionResult Create()
        {
            ViewData["CustomerId"] = new SelectList(_context.Users, "Id", "Id");
            return View();
        }

        // POST: Orders/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("Id,CreatedAt,UpdatedAt,Status,CustomerId")] Order order)
        {
            if (ModelState.IsValid)
            {
                _context.Add(order);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CustomerId"] = new SelectList(_context.Users, "Id", "Id", order.CustomerId);
            return View(order);
        }

        // GET: Orders/Edit/5
        [Authorize(Roles ="System Admin")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var order = await _context.Orders
                            .Include(d => d.OrderDetails).ThenInclude(od => od.Product)
                            .Include(o => o.Customer)
                            .FirstOrDefaultAsync(m => m.Id == id);
            if (order == null)
            {
                return NotFound();
            }
            // Define your list of status options
            var statusOptions = new List<SelectListItem>
            {
                new SelectListItem { Text = "Waiting Confirmed", Value = "Waiting Confirmed" },
                new SelectListItem { Text = "Packaging", Value = "Packaging" },
                new SelectListItem { Text = "Delivering", Value = "Delivering" },
                new SelectListItem { Text = "Evaluating", Value = "Evaluating" }
            };

            // Assign the list to ViewData
            ViewData["Status"] = new SelectList(statusOptions, "Value", "Text");


            /*            ViewData["CustomerId"] = new SelectList(_context.Users, "Id", "Id", order.CustomerId);
            */

            return View(order);
        }

        // POST: Orders/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("Id,Status")] Order order)
        {
            if (id != order.Id)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(order);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!OrderExists(order.Id))
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
            // Define your list of status options
            var statusOptions = new List<SelectListItem>
            {
                new SelectListItem { Text = "Confirmed", Value = "Confirmed" },
                new SelectListItem { Text = "Packaging", Value = "Packaging" },
                new SelectListItem { Text = "Delivering", Value = "Delivering" },
                new SelectListItem { Text = "Evaluating", Value = "Evaluating" }
            };

            // Assign the list to ViewData
            ViewData["Status"] = new SelectList(statusOptions, "Value", "Text");
            return View(order);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> EditByStatus(int id, [Bind("Status")] Order order)
        {
            var updateOrder = await _context.Orders.FindAsync(id);
            if (updateOrder == null)
            {
                return NotFound("Order Not Found");
            }
            updateOrder.Status = order.Status;
            await _context.SaveChangesAsync();

   
            // Define your list of status options
            var statusOptions = new List<SelectListItem>
            {
                new SelectListItem { Text = "Confirmed", Value = "Confirmed" },
                new SelectListItem { Text = "Packaging", Value = "Packaging" },
                new SelectListItem { Text = "Delivering", Value = "Delivering" },
                new SelectListItem { Text = "Evaluating", Value = "Evaluating" }
            };

            // Assign the list to ViewData
            ViewData["Status"] = new SelectList(statusOptions, "Value", "Text");
            return RedirectToAction(nameof(Index));
        }

        // GET: Orders/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var order = await _context.Orders
                .Include(o => o.Customer)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (order == null)
            {
                return NotFound();
            }

            return View(order);
        }

        // POST: Orders/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var order = await _context.Orders.FindAsync(id);
            if (order != null)
            {
                _context.Orders.Remove(order);
            }

            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool OrderExists(int id)
        {
            return _context.Orders.Any(e => e.Id == id);
        }
    }
}
