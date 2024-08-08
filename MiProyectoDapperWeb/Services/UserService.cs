using Dapper;
using Microsoft.Extensions.Configuration;
using MySql.Data.MySqlClient;
using MiProyectoDapperWeb.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace MiProyectoDapperWeb.Services
{
    public class UserService
    {
        private readonly IConfiguration _configuration;

        public UserService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task<IEnumerable<User>> GetUsersAsync()
        {
            using var connection = new MySqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            await connection.OpenAsync();
            var sql = "CALL GetUsers();";
            return await connection.QueryAsync<User>(sql);
        }

        public async Task AddUserAsync(User user)
        {
            using var connection = new MySqlConnection(_configuration.GetConnectionString("DefaultConnection"));
            var parameters = new
            {
                p_nombre = user.Nombre,
                p_email = user.Email,
                p_contrasenia = user.Contrasenia,
                p_rol = user.Rol,
                p_saldo = user.Saldo,
                p_moneda = user.Moneda,
                p_estado = user.Estado,
                p_id_usuario = default(int) // Se usará para almacenar el ID generado
            };
            await connection.ExecuteAsync("CALL InsertarUsuario(@p_nombre, @p_email, @p_contrasenia, @p_rol, @p_saldo, @p_moneda, @p_estado, @p_id_usuario)", parameters);
        }
    }
}
