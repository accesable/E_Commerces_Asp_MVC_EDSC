using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E_Commerces.Models
{
    public class Order
    {
        [Key]
        public int Id { get; set; }
        [Required]
        [DataType(DataType.Date)]
        [DisplayName("Created At")]
        public DateTime CreatedAt { get; set; } = DateTime.Now;
        [Required]
        [DataType(DataType.Date)]
        [DisplayName("Recent Updated At")]
        public DateTime UpdatedAt { get; set;} = DateTime.Now;
        public string Status { get; set; } = "Waiting Confirmed";
        public string ? CustomerId { get; set; }
        [ForeignKey(nameof(CustomerId))]
        public AppUser ?Customer { get; set; }
        public virtual ICollection<OrderDetail> OrderDetails { get; set; } = new List<OrderDetail>();

        public virtual Invoice? Invoice { get; set; }
    }
}
