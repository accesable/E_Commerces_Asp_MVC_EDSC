using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json;

namespace E_Commerces.Models
{
    public class Image
    {
        [Key]
        public int ImageId { get; set; } // Primary key
        [Required]
        public required string ImageUrl { get; set; } // Property to store the URL of the image
        public int ProductId { get; set; } // Foreign key property to associate with the Item

        [ForeignKey("ProductId")] // Foreign key attribute to associate with the Item
        [JsonIgnore]
        public Product? Product { get; set; } // Navigation property back to the Item
    }
}
