using System.Runtime.Serialization;

namespace WebApi.Entities;

public enum Country
{
    [EnumMember(Value = "Not Selected")]Not_Selected,
    [EnumMember(Value = "Australia")]Australia,
    [EnumMember(Value = "Canada")]Canada,
    [EnumMember(Value = "Croatia")]Croatia,
    [EnumMember(Value = "France")]France,
    [EnumMember(Value = "Hong Kong")]Hong_Kong,
    [EnumMember(Value = "Macau")]Macau,
    [EnumMember(Value = "New Zealand")]New_Zealand,
    [EnumMember(Value = "Singapore")]Singapore,
    [EnumMember(Value = "Ukraine")]Ukraine,
    [EnumMember(Value = "United Arab Emitates")]United_Arab_Emirates,
    [EnumMember(Value = "United Kingdom")]United_Kingdom,
    [EnumMember(Value = "United States")]United_States_of_America
}
