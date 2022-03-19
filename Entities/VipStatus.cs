using System.Runtime.Serialization;

namespace WebApi.Entities;

public enum VipStatus
{
    [EnumMember(Value = "No")]No,
    [EnumMember(Value = "Yes")]Yes,
    [EnumMember(Value = "EAC")]EAC,
    [EnumMember(Value = "Retention")]Retention,
    [EnumMember(Value = "Tranche 01")]Tranche_01,
    [EnumMember(Value = "Tranche 02")]Tranche_02,
    [EnumMember(Value = "Tranche 03")]Tranche_03,
    [EnumMember(Value = "Kickstarter")]Kickstarter,
    [EnumMember(Value = "Employee")]Employee
}