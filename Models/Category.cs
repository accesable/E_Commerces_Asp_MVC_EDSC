using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace E_Commerces.Models
{
    public class Category
    {
        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage = "The Name field is required.")]
        [StringLength(128, MinimumLength = 3, ErrorMessage = "The Name field must be at least {2} characters long.")]
        public string? Name { get; set; }
        [Required(ErrorMessage = "The Description field is required.")]
        [DataType(DataType.MultilineText)]
        [Column(TypeName = "TEXT")]
        public string? Description { get; set; }
        public virtual ICollection<Product> ? products { get; set; }
    }
}
