namespace MiProyectoDapperWeb.Models
{
    public class User
    {
        public int IdUsuario { get; set; }
        public string Nombre { get; set; }
        public string Email { get; set; }
        public string Contrasenia { get; set; }
        public string Rol { get; set; }
        public decimal Saldo { get; set; }
        public string Moneda { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime UltimoAcceso { get; set; }
        public string Estado { get; set; }
    }
}
