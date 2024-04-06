using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E_Commerces.Models
{
    public class Product
    {
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage = "The Name field is required.")]
        [StringLength(128, MinimumLength = 3, ErrorMessage = "The Name field must be at least {2} characters long.")]
        public string? Name { get; set; }
        [Required(ErrorMessage = "The Description field is required.")]
        [DataType(DataType.MultilineText)]
        [Column(TypeName ="TEXT")]
        public string? Description { get; set; }
        [Required(ErrorMessage = "The Price field is required.")]
        [Range(0, double.MaxValue, ErrorMessage = "The Price field must be a non-negative number.")]
        [DisplayName("Original Price")]
        public decimal OriginalPrice { get; set; }
        [Required(ErrorMessage = "The Size field is required.")]
        [StringLength(50, MinimumLength = 3, ErrorMessage = "The Size field must be at least {2} characters long.")]
        public string? Size { get; set; }
        [Required(ErrorMessage = "The Color field is required.")]
        [StringLength(128, MinimumLength = 3, ErrorMessage = "The Color field must be at least {2} characters long.")]
        public string? Color { get; set; }
        [DisplayName("Product's Category")]
        public int categoryId { get; set; }
        [ForeignKey("categoryId")]
        public Category? Category { get; set; }
        public virtual ICollection<Image> ? Images { get; set; } = new List<Image>();

        // Property for multiple files
        [NotMapped]
        public ICollection<IFormFile> Files { get; set; } = new List<IFormFile>();

    }
}
