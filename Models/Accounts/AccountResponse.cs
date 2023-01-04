using System;

namespace WebApi.Models.Accounts;

public class AccountResponse
{
    public int Id { get; set; }
    public string UUID { get; set; }
    public string Company { get; set; }
    public string TaxID { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Email { get; set; }
    public string Phone { get; set; }
    public string Address { get; set; }
    public string City { get; set; }
    public string State { get; set; }
    public string PostCodeZip { get; set; }
    public string Country { get; set; }
    public string UserIcon { get; set; }
    public DateTime Created { get; set; }
    public int ServiceLevelResponseMinutes { get; set; }
    public string EnterpriseAgreement { get; set; }
    public string MSEnterpriseAgreementNumber { get; set; }
    public string BillingType { get; set; }
    public string AccountTier { get; set; }
    public int ImagesRemaining { get; set; }
    public int AppLockerStorageAvailable { get; set; }
    public int AppLockerStorageUsed { get; set; }
    public bool AccountNotifications { get; set; }
}