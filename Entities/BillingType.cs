using System.Runtime.Serialization;

namespace WebApi.Entities;

public enum BillingType
{
    [EnumMember(Value = "None")]None,
    [EnumMember(Value = "Stripe")]Stripe,
    [EnumMember(Value = "Invoice")]Invoice,
    [EnumMember(Value = "PayPal")]PayPal
}