using System.Runtime.Serialization;

namespace WebApi.Entities;

public enum Role
{
    [EnumMember(Value = "Admin")]Admin,
    [EnumMember(Value = "User")]User
}