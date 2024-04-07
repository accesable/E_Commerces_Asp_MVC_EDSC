using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using E_Commerces.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using Microsoft.EntityFrameworkCore;
using E_Commerces.Models;
using Microsoft.AspNetCore.Authorization;

namespace E_Commerces.Areas.Admin.Pages.Role
{
    [Authorize(Roles = "System Admin")]
    public class UserModel : PageModel
    {

        private readonly UserManager<AppUser> _userManager;



        public UserModel(
                          UserManager<AppUser> userManager)
        {
            _userManager = userManager;
        }

        public List<UserWithRoles> users;

        public class UserWithRoles : AppUser
        {
            public string ? RoleNames { get; set; }
        }

        [TempData] 
        public string StatusMessage { get; set; }

        public const int ITEMS_PER_PAGE = 15;
        [BindProperty(SupportsGet = true,Name ="p")]
        public int currentPage { get; set; }
        public int countPages { get; set; }
        public int totalUsers { get; set; }

        public string? listroles { get; set; }

        public IActionResult OnPost() => NotFound("No post");

        public async Task<IActionResult> OnGet()
        {

            /*users = await _userManager.Users.OrderBy(users => users.UserName).ToListAsync();*/
            var qr = _userManager.Users.OrderBy(u => u.UserName);

            totalUsers = await qr.CountAsync();
            countPages = (int)Math.Ceiling((double)totalUsers/ITEMS_PER_PAGE);

            if(currentPage < 1)
                currentPage = 1;
            if(currentPage > countPages) currentPage = countPages;

            var qr1 = qr.Skip((currentPage - 1) * ITEMS_PER_PAGE)
                        .Take(ITEMS_PER_PAGE)
                        .Select(u=> new UserWithRoles() {
                            Id = u.Id,
                            UserName = u.UserName,
                        });

            users = await qr1.ToListAsync();

            foreach(var user in users)
            {
                var roles = await _userManager.GetRolesAsync(user);
                user.RoleNames = string.Join(",", roles);
            }


            return Page();
        }
    }
}