using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using MiProyectoDapperWeb.Services;

var builder = WebApplication.CreateBuilder(args);

// Agrega servicios al contenedor.
builder.Services.AddRazorPages(); // Habilita Razor Pages
builder.Services.AddSingleton<UserService>();

var app = builder.Build();

// Configura el pipeline de solicitudes HTTP.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseRouting();
app.UseAuthorization();

// Mapea Razor Pages
app.MapRazorPages();

// Configura la ruta para Login
app.MapGet("/", async context =>
{
    context.Response.Redirect("/Register"); // Redirige a la página de Registro
});

app.Run();
