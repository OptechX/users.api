using System;
using System.Collections.Generic;

namespace WebApi.Entities;

public class Account
{
    public int Id { get; set; }
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
    public Country Country { get; set; }
    public string UserIcon { get; set; }
    public string PasswordHash { get; set; }
    public bool AcceptTerms { get; set; }
    public Role Role { get; set; }
    public string VerificationToken { get; set; }
    public DateTime? Verified { get; set; }
    public bool IsVerified => Verified.HasValue || PasswordReset.HasValue;
    public string ResetToken { get; set; }
    public DateTime? ResetTokenExpires { get; set; }
    public DateTime? PasswordReset { get; set; }
    public DateTime Created { get; set; }
    public DateTime? Updated { get; set; }
    public List<RefreshToken> RefreshTokens { get; set; }
    public VipStatus VipStatus { get; set; }
    public int ServiceLevelResponseMinutes { get; set; }
    public Guid EnterpriseAgreement { get; set; }
    public string MSEnterpriseAgreementNumber { get; set; }
    public string StripeCustomerId { get; set; }
    public string StripePaymentId { get; set; }
    public BillingType BillingType { get; set; }
    public AccountTier AccountTier { get; set; }
    public int ImagesRemaining { get; set; }
    public int AppLockerStorageAvailable { get; set; }
    public int AppLockerStorageUsed { get; set; }
    public Guid UUID { get; set; }
    public bool AccountNotifications { get; set; }

    public bool OwnsToken(string token) 
    {
        return this.RefreshTokens?.Find(x => x.Token == token) != null;
    }
}