namespace WebApi.Models.Accounts;

using System.ComponentModel.DataAnnotations;

public class RegisterRequest
{
    //[Required]
    public string Company { get; set; }

    //[Required]
    public string FirstName { get; set; }

    //[Required]
    public string LastName { get; set; }

    [Required]
    [EmailAddress]
    public string Email { get; set; }

    [Required]
    [MinLength(8)]
    public string Password { get; set; }

    [Required]
    [Compare("Password")]
    public string ConfirmPassword { get; set; }

    [Required]
    [Range(typeof(bool), "true", "true")]
    public bool AcceptTerms { get; set; }

    [Required]
    public string Country { get; set; }
}