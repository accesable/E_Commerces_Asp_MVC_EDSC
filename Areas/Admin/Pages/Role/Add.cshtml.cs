using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.ComponentModel.DataAnnotations;

namespace E_Commerces.Areas.Admin.Pages.Role
{
    public class AddModel : PageModel
    {
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly ILogger<AddModel> _logger;

        public AddModel(RoleManager<IdentityRole> roleManager, ILogger<AddModel> logger)
        {
            _roleManager = roleManager;
            _logger = logger;
        }

        [TempData] // Using Session
        public string StatusMessage { get; set; }

        public class InputModel
        {
            
            public string ? ID { set; get; }

            [Required(ErrorMessage = "require role name")]
            [Display(Name = "Role's Name")]
            [StringLength(100, ErrorMessage = "{0} from {2} to {1} characters.", MinimumLength = 3)]
            public string Name { set; get; }

        }

        [BindProperty]
        public InputModel Input { set; get; }

        [BindProperty]
        public bool IsUpdate { set; get; }

        // NO default redirection without handler
        public IActionResult OnGet() => NotFound("Not Founded On ");
        public IActionResult OnPost() => NotFound("Not Founded");


        public IActionResult OnPostStartNewRole()
        {
            StatusMessage = "Enter information for creating new role";
            IsUpdate = false;
            ModelState.Clear();
            return Page();
        }

        // Get Role's information which need to be updated
        public async Task<IActionResult> OnPostStartUpdate()
        {
            StatusMessage = null;
            IsUpdate = true;
            if (Input.ID == null)
            {
                StatusMessage = "Error: No Role's data";
                return Page();
            }
            var result = await _roleManager.FindByIdAsync(Input.ID);
            if (result != null)
            {
                Input.Name = result.Name;
                ViewData["Title"] = "Update Role role : " + Input.Name;
                ModelState.Clear();
            }
            else
            {
                StatusMessage = "Error: No Role's ID data  = " + Input.ID;
            }

            return Page();
        }
        // update or add based on IsUpdate()
        public async Task<IActionResult> OnPostAddOrUpdate()
        {

            if (!ModelState.IsValid)
            {
                StatusMessage = null;
                return Page();
            }

            if (IsUpdate)
            {
                // UPDATE
                if (Input.ID == null)
                {
                    ModelState.Clear();
                    StatusMessage = "Error: No Role's data";
                    return Page();
                }
                var result = await _roleManager.FindByIdAsync(Input.ID);
                if (result != null)
                {
                    result.Name = Input.Name;
                    // update Role's Name
                    var roleUpdateRs = await _roleManager.UpdateAsync(result);
                    if (roleUpdateRs.Succeeded)
                    {
                        StatusMessage = "role updated successfully";
                    }
                    else
                    {
                        StatusMessage = "Error: ";
                        foreach (var er in roleUpdateRs.Errors)
                        {
                            StatusMessage += er.Description;
                        }
                    }
                }
                else
                {
                    StatusMessage = "Error: Can not find Role to be updated";
                }

            }
            else
            {
                // CREATE
                var newRole = new IdentityRole(Input.Name);
                // Action for create new Role via _roleManager
                newRole.Id = Guid.NewGuid().ToString();
                _logger.LogInformation("new role created"+ newRole.ToString());
                var rsNewRole = await _roleManager.CreateAsync(newRole);
                if (rsNewRole.Succeeded)
                {
                    StatusMessage = $"new role created: {newRole.Name}";
                    return RedirectToPage("./Index");
                }
                else
                {
                    StatusMessage = "Error: ";
                    foreach (var er in rsNewRole.Errors)
                    {
                        StatusMessage += er.Description;
                    }
                }
            }

            return Page();

        }
    }
}
