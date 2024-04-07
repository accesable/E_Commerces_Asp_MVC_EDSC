using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace E_Commerces.Areas.Admin.Pages.Role
{
    [Authorize(Roles = "System Admin")]
    public class IndexModel : PageModel
    {
        private readonly RoleManager<IdentityRole> _roleManager;

        public IndexModel(RoleManager<IdentityRole> roleManager)
        {
            this._roleManager = roleManager;
        }
        public List<IdentityRole> roles { get; set; }
        [TempData]
        public string StatusMessage { get; set; } 
        public async Task<IActionResult> OnGet()
        {
            roles = await _roleManager.Roles.ToListAsync();
            return Page();
        }
    }
}
