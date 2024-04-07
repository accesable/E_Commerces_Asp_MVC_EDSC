using DinkToPdf;
using DinkToPdf.Contracts;
using Microsoft.AspNetCore.Mvc;
using E_Commerces.Models; // Make sure to import your model namespace
using E_Commerces.Data;
using Microsoft.EntityFrameworkCore;
using E_Commerces.Helpers;
using System.Text;

public class PdfExportController : Controller
{
    private readonly IConverter _pdfConverter;
    private readonly ApplicationDbContext _context; // Assuming ApplicationDbContext is your DbContext

    public PdfExportController(IConverter pdfConverter, ApplicationDbContext context)
    {
        _pdfConverter = pdfConverter;
        _context = context;
    }

    public IActionResult ExportInvoiceToPdf(int id)
    {
        // Retrieve the order details from the database
        var order = _context.Orders
            .Include(o => o.OrderDetails).ThenInclude(p=>p.Product)
            .Include(o => o.Customer)
            .Include(o => o.Invoice)
            .FirstOrDefault(o => o.Id == id);

        // Check if the order exists
        if (order == null)
        {
            return NotFound();
        }

        // Generate HTML content for the invoice
        var htmlContent = GenerateInvoiceHtml(order);

        // Convert HTML content to PDF
        var doc = new HtmlToPdfDocument()
        {
            GlobalSettings = {
            ColorMode = ColorMode.Color,
            PaperSize = PaperKind.A4,
        },
            Objects = {
            new ObjectSettings
            {
                HtmlContent = htmlContent,
                WebSettings =
                {
                    DefaultEncoding = "utf-8"
                }
                
            }
        }
        };

        byte[] pdfBytes = _pdfConverter.Convert(doc);

        // Return the PDF file
        return File(pdfBytes, "application/pdf", $"invoice_{order.Id}.pdf");
    }
    private string GenerateInvoiceHtml(Order order)
    {
        var htmlContent = new StringBuilder();
        htmlContent.AppendLine("<!DOCTYPE html>");
        htmlContent.AppendLine("<html>");
        htmlContent.AppendLine("<head>");
        htmlContent.AppendLine("<title>Invoice</title>");
        htmlContent.AppendLine("<style>");
        // Add CSS styles here
        htmlContent.AppendLine("</style>");
        htmlContent.AppendLine("</head>");
        htmlContent.AppendLine("<body>");
        htmlContent.AppendLine($"<h1>E Commerces Invoices {order.Invoice.Id}</h1>");
        // Add order details to HTML content
        htmlContent.AppendLine("<div>");
        htmlContent.AppendLine($"<h4>Order ID : {order.Id}</h4>");
        htmlContent.AppendLine("<hr />");
        htmlContent.AppendLine($"<p>Created At: {order.CreatedAt}</p>");
        htmlContent.AppendLine($"<p>Updated At: {order.UpdatedAt}</p>");
        htmlContent.AppendLine($"<p>Status: {order.Status}</p>");
        // Add customer info to HTML content
        htmlContent.AppendLine("<h4>Customer Info</h4>");
        htmlContent.AppendLine($"<p>Customer Full Name: {order.Customer.FullName}</p>");
        htmlContent.AppendLine($"<p>Customer Address: {order.Customer.Address}</p>");
        htmlContent.AppendLine($"<p>Customer Phone Number: {order.Customer.PhoneNumber}</p>");
        htmlContent.AppendLine($"<p>Customer Email: {order.Customer.Email}</p>");
        // Add order details to HTML content
        htmlContent.AppendLine("<h4>Order Details</h4>");
        htmlContent.AppendLine("<hr />");
        htmlContent.AppendLine("<table>");
        htmlContent.AppendLine("<thead>");
        htmlContent.AppendLine("<tr><th>Product</th><th>Quantity</th><th>Price</th></tr>");
        htmlContent.AppendLine("</thead>");
        htmlContent.AppendLine("<tbody>");
        foreach (var orderDetail in order.OrderDetails)
        {
            htmlContent.AppendLine("<tr>");
            htmlContent.AppendLine($"<td>{orderDetail.Product.Name}</td>");
            htmlContent.AppendLine($"<td>{orderDetail.Quantity}</td>");
            htmlContent.AppendLine($"<td>{orderDetail.Price}</td>");
            htmlContent.AppendLine("</tr>");
        }
        htmlContent.AppendLine($"<p>Price before VAT charged : {order.Invoice.TotalPrice}</p>");
        htmlContent.AppendLine($"<p>VAT charged ({order.Invoice.VatRate} % per transaction) : {order.Invoice.VatCharge}</p>");
        htmlContent.AppendLine($"<p>Price after VAT charged : {order.Invoice.FinalPrice}</p>");
        htmlContent.AppendLine("</tbody>");
        htmlContent.AppendLine("</table>");
        htmlContent.AppendLine("</div>");
        htmlContent.AppendLine("</body>");
        htmlContent.AppendLine("</html>");

        return htmlContent.ToString();
    }

}
