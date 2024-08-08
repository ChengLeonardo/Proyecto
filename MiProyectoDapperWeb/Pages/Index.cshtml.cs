using Microsoft.AspNetCore.Mvc.RazorPages;
using MiProyectoDapperWeb.Models;
using MiProyectoDapperWeb.Services;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MiProyectoDapperWeb.Pages
{
    public class IndexModel : PageModel
    {
        private readonly UserService _userService;

        public IndexModel(UserService userService)
        {
            _userService = userService;
        }

        public IEnumerable<User> Users { get; set; }

        public async Task OnGetAsync()
        {
            Users = await _userService.GetUsersAsync();
        }
    }
}
