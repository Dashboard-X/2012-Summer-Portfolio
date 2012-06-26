<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="RegisterPatient.aspx.cs" Inherits="Assignment2.User.RegisterPatient" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHolder" runat="server">
    <h1>Register a New Patient</h1>

    <table>
    <tr>
    <td><asp:Label ID="Label1" runat="server" Text="Name"></asp:Label></td>
    <td><asp:TextBox ID="TxtName" runat="server"></asp:TextBox></td><td>
        <asp:RequiredFieldValidator CssClass="ValidatorFieldMissing" 
            ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="*" ControlToValidate="TxtName" />
        </td>
    </tr>    <tr>
    <td><asp:Label ID="Label2" runat="server" Text="Address"></asp:Label></td>
    <td><asp:TextBox ID="TxtAddress" runat="server"></asp:TextBox></td><td>
        <asp:RequiredFieldValidator CssClass="ValidatorFieldMissing" 
                ID="RequiredFieldValidator2" runat="server" 
            ErrorMessage="*" ControlToValidate="TxtAddress" />
            </td>
    </tr>    <tr>
    <td><asp:Label ID="Label5" runat="server" Text="Date of Birth"></asp:Label></td>
    <td><asp:TextBox ID="TxtBirth" runat="server"></asp:TextBox></td><td>
        <asp:RequiredFieldValidator CssClass="ValidatorFieldMissing" 
                ID="RequiredFieldValidator3" runat="server" 
            ErrorMessage="*" ControlToValidate="TxtBirth" />

            <!-- Since this is clinical staff, I expect them to enter the date in ISO8601. For fast
            processing of data (by an experienced user) this is vastly better than using a calendar
            control or dropdowns etc. -->

            <!-- ISO8601 regex expression from http://www.pelagodesign.com/blog/2009/05/20/iso-8601-date-validation-that-doesnt-suck/ -->
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ErrorMessage="Please enter a date in the format YYYY-MM-DD" 
                
                ValidationExpression="^([\+-]?\d{4}(?!\d{2}\b))((-?)((0[1-9]|1[0-2])(\3([12]\d|0[1-9]|3[01]))?|W([0-4]\d|5[0-2])(-?[1-7])?|(00[1-9]|0[1-9]\d|[12]\d{2}|3([0-5]\d|6[1-6])))([T\s]((([01]\d|2[0-3])((:?)[0-5]\d)?|24\:?00)([\.,]\d+(?!:))?)?(\17[0-5]\d([\.,]\d+)?)?([zZ]|([\+-])([01]\d|2[0-3]):?([0-5]\d)?)?)?)?$" 
                CssClass="ValidationControlText" ControlToValidate="TxtBirth"></asp:RegularExpressionValidator>
            </td>
    </tr>    <tr>
    <td><asp:Label ID="Label3" runat="server" Text="Phone"></asp:Label></td>
    <td><asp:TextBox ID="TxtPhone" runat="server">+61</asp:TextBox></td><td>
        <asp:RequiredFieldValidator CssClass="ValidatorFieldMissing" 
                ID="RequiredFieldValidator4" runat="server" 
            ErrorMessage="*" ControlToValidate="TxtPhone" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ErrorMessage="Please enter full phone number including country code" 
                ValidationExpression="^(\+61[0-9]{9,9})|(\+[0-9]{7,17})$" 
                CssClass="ValidationControlText" ControlToValidate="TxtPhone"></asp:RegularExpressionValidator>
            </td>
    </tr>    <tr>
    <td><asp:Label ID="Label4" runat="server" Text="Emergency Contact Name"></asp:Label></td>
    <td><asp:TextBox ID="TxtEmergencyName" runat="server"></asp:TextBox></td><td>
        <asp:RequiredFieldValidator CssClass="ValidatorFieldMissing" 
                ID="RequiredFieldValidator5" runat="server" 
            ErrorMessage="*" ControlToValidate="TxtEmergencyName" />
            </td>
    </tr>    <tr>
    <td><asp:Label ID="Label6" runat="server" Text="Emergency Contact Phone"></asp:Label></td>
    <td><asp:TextBox ID="TxtEmergencyPhone" runat="server">+61</asp:TextBox></td><td>
        <asp:RequiredFieldValidator CssClass="ValidatorFieldMissing" 
                ID="RequiredFieldValidator6" runat="server" 
            ErrorMessage="*" ControlToValidate="TxtEmergencyPhone" />
            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                ErrorMessage="Please enter full phone number including country code" 
                ValidationExpression="^(\+61[0-9]{9,9})|(\+[0-9]{7,17})$" 
                CssClass="ValidationControlText" ControlToValidate="TxtEmergencyPhone"></asp:RegularExpressionValidator>
            </td>
    </tr>
    </table>

    <asp:Button CausesValidation="true" runat="server" ID="BtnSubmit" 
    Text="Register Patient" onclick="BtnSubmit_Click" />
</asp:Content>
