using Microsoft.Extensions.Configuration;
using System.ComponentModel.DataAnnotations;
using Stripe;

namespace WebApi.Models.Accounts;

public class SignUpRequest
{
    public string Company;
    public string TaxID;
    public string FirstName;
    public string LastName;
    public string Phone;
    public string Address;
    public string City;
    public string State;
    public string PostCodeZip;
    public string AccountTier;
    public string VipStatus;
    public int ServiceLevelResponseMinutes;
    public string UserIcon;
    public Guid EnterpriseAgreement;
    public Guid UUID;
    public string BillingType;
    public int ImagesRemaining;
    public int AppLockerStorageAvailable;
    public int AppLockerStorageUsed;
    public string MSEnterpriseAgreementNumber;
    public string StripeCustomerId;
    public string StripePaymentId;
    public bool AccountNotifications;

    public SignUpRequest()
    {
        // stripe create user account
        var config = new ConfigurationBuilder()
            .SetBasePath(Directory.GetCurrentDirectory())
            .AddJsonFile("appsettings.json").Build();
        StripeConfiguration.ApiKey = config["AppSettings:StripeSecretKey"];
        var options = new CustomerCreateOptions();
        var service = new CustomerService();
        var stripeCust = service.Create(options);

        this.UUID = Guid.NewGuid();
        this.UserIcon = string.Empty;
        this.AccountTier = "Basic";
        this.Company = string.Empty;
        this.TaxID = string.Empty;
        this.FirstName = string.Empty;
        this.LastName = string.Empty;
        this.Phone = string.Empty;
        this.Address = string.Empty;
        this.City = string.Empty;
        this.State = string.Empty;
        this.PostCodeZip = string.Empty;
        this.VipStatus = "No";
        this.ServiceLevelResponseMinutes = 4320;
        this.EnterpriseAgreement = Guid.Parse("00000000-0000-0000-0000-000000000000");
        this.BillingType = "None";
        this.ImagesRemaining = 0;
        this.AppLockerStorageAvailable = 0;
        this.AccountNotifications = true;
        this.StripeCustomerId = stripeCust.Id.ToString();
    }

    [Required]
    [EmailAddress]
    public string Email { get; set; }

    [Required]
    [MinLength(8)]
    public string Password { get; set; }

    [Required]
    [MinLength(8)]
    [Compare("Password")]
    public string ConfirmPassword { get; set; }

    [Required]
    [Range(typeof(bool), "true", "true")]
    public bool AcceptTerms { get; set; }

    [Required]
    public string Country { get; set; }
}