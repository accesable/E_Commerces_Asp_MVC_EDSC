using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.ComponentModel.DataAnnotations;

namespace E_Commerces.Areas.Admin.Pages.Role
{
    public class DeleteModel : PageModel
    {
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly ILogger<AddModel> _logger;

        public DeleteModel(RoleManager<IdentityRole> roleManager, ILogger<AddModel> logger)
        {
            _roleManager = roleManager;
            _logger = logger;
        }

        public class InputModel
        {
            [Required]
            public string ID { set; get; }
            
            public string? Name { set; get; }

        }

        [BindProperty]
        public InputModel Input { set; get; }

        [BindProperty]
        public bool isConfirmed { set; get; }

        [TempData] // Using Session
        public string StatusMessage { get; set; }

        public IActionResult OnGet() => NotFound("Not Founded");

        public async Task<IActionResult> OnPost()
        {
            _logger.LogWarning(ModelState.ToString());

            if (!ModelState.IsValid)
            {
                return NotFound("Cannot Delete");
            }

            var role = await _roleManager.FindByIdAsync(Input.ID);
            if (role == null)
            {
                return NotFound("Delete Role Not Founded");
            }

            ModelState.Clear();

            if (isConfirmed)
            {
                //Delete
                await _roleManager.DeleteAsync(role);
                StatusMessage = role.Name + " Deleted" ;

                return RedirectToPage("Index");
            }
            else
            {
                Input.Name = role.Name;
                isConfirmed = true;
            }

            return Page();
        }
    }
}
