using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E_Commerces.Models
{
    public class Invoice
    {
        [Key]
        public int Id { get; set; }
        public virtual Order ? Order { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public DateTime UpdatedAt { get; set; } = DateTime.Now;
        [Required]
        public string Status = "Not Completed";
        // Total price before VAT and promotions
        [Required]
        public decimal TotalPrice { get; set; }

        // VAT charge percentage
        [Required]
        public decimal VatRate { get; set; } = new decimal(0.05);

        // Total VAT charge
        [Required]
        public decimal VatCharge { get; set; } 

        // Promotion applied to the total price
        public decimal Promotion { get; set; }

        // Total price after applying promotions and VAT
        public decimal FinalPrice => TotalPrice - Promotion + VatCharge;
        public virtual Payment? Payment { get; set; }
    }
}
