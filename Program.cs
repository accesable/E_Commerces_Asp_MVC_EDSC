using E_Commerces.Data;
using E_Commerces.Mail;
using E_Commerces.Models;
using Microsoft.AspNetCore.Authentication.Google;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.FileProviders;
using System.Configuration;

var builder = WebApplication.CreateBuilder(args);


var connectionString = builder.Configuration.GetConnectionString("DefaultConnection") ?? throw new ArgumentNullException("No Connection String");
var mailSettings = builder.Configuration.GetSection("MailSettings");
builder.Services.Configure<MailSettings>(mailSettings);
builder.Services.AddTransient<IEmailSender, SendMailService>(); 
// Add services to the container.
builder.Services.AddRazorPages();
builder.Services.AddControllersWithViews().AddRazorRuntimeCompilation();
builder.Services.AddDistributedMemoryCache();
builder.Services.AddSession(config =>
{
    config.Cookie.Name = "E_Commerce_Enterprise_System";
    config.IdleTimeout = new TimeSpan(0,30,0);
});
builder.Services.AddDbContext<ApplicationDbContext>(
    options =>
    {
        options.UseMySQL(connectionString);
    });

builder.Services.AddIdentity<AppUser,IdentityRole>().AddEntityFrameworkStores<ApplicationDbContext>().AddDefaultTokenProviders().AddDefaultUI();
builder.Services.Configure<IdentityOptions>(options => {
    options.Password.RequireDigit = false; 
    options.Password.RequireLowercase = false; 
    options.Password.RequireNonAlphanumeric = false; 
    options.Password.RequireUppercase = false; 
    options.Password.RequiredLength = 3; 
    options.Password.RequiredUniqueChars = 1; 

    options.Lockout.DefaultLockoutTimeSpan = TimeSpan.FromMinutes(5); 
    options.Lockout.MaxFailedAccessAttempts = 5; 
    options.Lockout.AllowedForNewUsers = true;

    options.User.AllowedUserNameCharacters = 
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._@+";
    options.User.RequireUniqueEmail = true;  

    options.SignIn.RequireConfirmedEmail = true;            
    options.SignIn.RequireConfirmedPhoneNumber = false;     

});
builder.Services.AddAuthentication().AddGoogle(
    GoogleOptions =>
    {
        // Read Authentication:Google data from appsettings.json
        IConfigurationSection googleAuthNSection = builder.Configuration.GetSection("Authentication:Google") ?? throw new ArgumentNullException("No Google Authentication ClientId and SecreteId"); ;

        // Configure ClientID and ClientSecret for logging into API google
        GoogleOptions.ClientId = googleAuthNSection["ClientId"] ;
        GoogleOptions.ClientSecret = googleAuthNSection["ClientSecret"];
        // configure Url callback to Google (by default is /signin-google)
        GoogleOptions.CallbackPath = "/google-login";
    });
var app = builder.Build();



// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseStaticFiles(new StaticFileOptions
{
    FileProvider = new PhysicalFileProvider(
           Path.Combine(builder.Environment.ContentRootPath, "ImageStaticFiles")),
    RequestPath = "/ImageStaticFiles"
});
app.UseSession();
app.UseRouting();
app.MapRazorPages();
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();
app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
