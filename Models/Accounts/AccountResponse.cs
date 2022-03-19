namespace WebApi.Models.Accounts;

public class AccountResponse
{
    // public int Id { get; set; }
    // public string? Company { get; set; }
    // public string? TaxID { get; set; }
    // public string FirstName { get; set; }
    // public string LastName { get; set; }
    // public string Email { get; set; }
    // public string Role { get; set; }
    // public DateTime Created { get; set; }
    // public DateTime? Updated { get; set; }
    // public bool IsVerified { get; set; }
    public int Id { get; set; }
    public string? Company { get; set; }
    public string? TaxID { get; set; }
    public string? FirstName { get; set; }
    public string? LastName { get; set; }
    public string Email { get; set; }
    public string? Phone { get; set; }
    public string? Address { get; set; }
    public string? City { get; set; }
    public string? State { get; set; }
    public string? PostCodeZip { get; set; }
    public string? Country { get; set; }
    public string? Role { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }
    public bool? IsVip { get; set; }
    public string BillingType { get; set; }
}