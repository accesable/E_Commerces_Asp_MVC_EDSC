using MailKit.Net.Smtp;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.Extensions.Options;
using MimeKit;

namespace E_Commerces.Mail
{
    public class MailSettings
    {
        public string? Mail { get; set; }
        public string? DisplayName { get; set; }
        public string ?Password { get; set; }
        public string ?Host { get; set; }
        public int Port { get; set; }
    }
    public class SendMailService : IEmailSender
    {
        private readonly MailSettings _settings;
        private readonly ILogger<SendMailService> _logger;

        public SendMailService(IOptions<MailSettings> _mailSettings,ILogger<SendMailService> _log)
        {
            _settings = _mailSettings.Value;
            _logger = _log;
            _logger.LogInformation("Mail Services Initialized");
        }
        public async Task SendEmailAsync(string email, string subject, string htmlMessage)
        {
            var message = new MimeMessage();
            message.Sender = new MailboxAddress(_settings.DisplayName, _settings.Mail);
            message.From.Add(new MailboxAddress (_settings.DisplayName,_settings.Mail));
            message.To.Add(MailboxAddress.Parse(email));
            message.Subject = subject;

            var builder = new BodyBuilder();
            builder.HtmlBody = htmlMessage;
            message.Body = builder.ToMessageBody();

            using var smtp = new SmtpClient();
            try
            {
                smtp.Connect(_settings.Host, _settings.Port, MailKit.Security.SecureSocketOptions.StartTls);
                smtp.Authenticate(_settings.Mail, _settings.Password);
                await smtp.SendAsync(message);
            }
            catch (Exception ex)
            {
                // Mail Send is failure then save at mailsave folder
                System.IO.Directory.CreateDirectory("mailssave");
                var emailsavefile = string.Format(@"mailssave/{0}.eml", Guid.NewGuid());
                await message.WriteToAsync(emailsavefile);

                _logger.LogInformation("Email Sending Error Saving Mail At - " + emailsavefile);
                _logger.LogError(ex.Message);
            }
            smtp.Disconnect(true);

            _logger.LogInformation("send mail to: " + email);
        }
    }
}
