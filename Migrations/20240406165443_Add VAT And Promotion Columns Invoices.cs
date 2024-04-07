using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace E_Commerces.Migrations
{
    /// <inheritdoc />
    public partial class AddVATAndPromotionColumnsInvoices : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
/*            migrationBuilder.RenameColumn(
                name: "CreateAt",
                table: "Payment",
                newName: "CreatedAt");*/

            migrationBuilder.AddColumn<decimal>(
                name: "FinalPrice",
                table: "Invoices",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<decimal>(
                name: "Promotion",
                table: "Invoices",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<string>(
                name: "Status",
                table: "Invoices",
                type: "varchar(128)",
                maxLength: 128,
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<decimal>(
                name: "TotalPrice",
                table: "Invoices",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<decimal>(
                name: "VatCharge",
                table: "Invoices",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);

            migrationBuilder.AddColumn<decimal>(
                name: "VatRate",
                table: "Invoices",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "FinalPrice",
                table: "Invoices");

            migrationBuilder.DropColumn(
                name: "Promotion",
                table: "Invoices");

            migrationBuilder.DropColumn(
                name: "Status",
                table: "Invoices");

            migrationBuilder.DropColumn(
                name: "TotalPrice",
                table: "Invoices");

            migrationBuilder.DropColumn(
                name: "VatCharge",
                table: "Invoices");

            migrationBuilder.DropColumn(
                name: "VatRate",
                table: "Invoices");

            migrationBuilder.RenameColumn(
                name: "CreatedAt",
                table: "Payment",
                newName: "CreateAt");
        }
    }
}
