using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using MiProyectoDapperWeb.Models;
using MiProyectoDapperWeb.Services;
using System.Threading.Tasks;

namespace MiProyectoDapperWeb.Pages
{
    public class RegisterModel : PageModel
    {
        private readonly UserService _userService;

        public RegisterModel(UserService userService)
        {
            _userService = userService;
        }

        [BindProperty]
        public User User { get; set; }

        public void OnGet()
        {
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            await _userService.AddUserAsync(User);

            return RedirectToPage("/Index");
        }
    }
}
