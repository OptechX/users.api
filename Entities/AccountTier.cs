using System.Runtime.Serialization;

namespace WebApi.Entities;

public enum AccountTier
{
    [EnumMember(Value = "Basic")]Basic,
    [EnumMember(Value = "Standard")]Standard,
    [EnumMember(Value = "Professional")]Professional,
    [EnumMember(Value = "Business")]Business,
    [EnumMember(Value = "Enterprise")]Enterprise,
    [EnumMember(Value = "Founder")]Founder
}