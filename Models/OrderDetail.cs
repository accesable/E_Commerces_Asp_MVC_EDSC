using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E_Commerces.Models
{
    public class OrderDetail
    {
        [Key]
        public int Id { get; set; }
        public int ProductId { get; set; }
        [ForeignKey(nameof(ProductId))]
        public virtual Product ? Product { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; } = 0;
        public int OrderId { get; set; }
        public Order ? Order { get; set; }
    }
}
