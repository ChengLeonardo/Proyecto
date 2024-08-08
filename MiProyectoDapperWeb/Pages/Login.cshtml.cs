using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace MiProyectoDapperWeb.Pages
{
    public class LoginModel : PageModel
    {
        [BindProperty]
        public string Email { get; set; }

        [BindProperty]
        public string Contraseña { get; set; }

        [BindProperty]
        public string RepCon { get; set; }

        public void OnGet()
        {
            // Lógica cuando se carga la página
        }

        public IActionResult OnPost()
        {
            // Lógica para manejar el POST del formulario

            // Ejemplo: Validar datos, autenticar usuario, etc.
            if (string.IsNullOrEmpty(Email) || string.IsNullOrEmpty(Contraseña))
            {
                ModelState.AddModelError(string.Empty, "Email y Contraseña son obligatorios.");
                return Page();
            }

            // Aquí puedes agregar la lógica para procesar el inicio de sesión

            // Redirigir a otra página después del inicio de sesión
            return RedirectToPage("/Register"); // O la página a la que quieras redirigir
        }
    }
}



