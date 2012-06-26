<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="DischargeInPatient.aspx.cs" Inherits="Assignment2.Admin.DischargeInPatient" %>
<%@ MasterType TypeName="Assignment2.General" %>

<%@ Register TagPrefix="etier" Namespace="Etier" Assembly="CreditCardValidator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadHolder" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentHolder" runat="server">
    <h1>
    <asp:Label ID="LblTitle" runat="server" Text="Discharging Patient"></asp:Label>
    </h1>
<table>
    <tr>
        <td>Patient Name:</td>
        <td><%# DischargeDetails.PatientName %></td>
    </tr>    <tr>
        <td>Doctor Name:</td>
        <td><%# DischargeDetails.DoctorName %></td>
    </tr>    <tr>
        <td>Bed:</td>
        <td><%# DischargeDetails.BedName %></td>
    </tr>    <tr>
        <td>Rate Per Day:</td>
        <td><%# DischargeDetails.RatePerDayText %></td>
    </tr>    <tr>
        <td>Stay Duration:</td>
        <td><%# DischargeDetails.StayDuration %>  days</td>
    </tr>    <tr>
        <td><asp:Label ID="DischargeLabel" runat="server"></asp:Label></td>
        <td><asp:Label ID="DischargeDate" runat="server"></asp:Label></td>
    </tr>    <tr>
        <td>Billing Address: </td>
        <td><asp:TextBox runat="server" ID="TxtAddress" 
                Text="<%# DischargeDetails.Address %>" Width="225px"/><asp:Label ID="LblAddress" runat="server" Visible="false"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ErrorMessage="*" ControlToValidate="TxtAddress" Display="Dynamic"></asp:RequiredFieldValidator>
        </td>
    </tr>      
    <tr>
        <td><asp:Label ID="LblTotal" runat="server" Text="AMOUNT DUE:"></asp:Label></td>
        <td><strong><%# DischargeDetails.AmountDueText %></strong></td>
    </tr>
</table>
    <br />

    <!-- http://www.ihwy.com/labs/jquery-validate-credit-card-extension.aspx -->
    Card Number:
    <asp:TextBox ID="TxtCardNumber" runat="server" CssClass="ccEntry"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ErrorMessage="*" ControlToValidate="TxtCardNumber" Display="Dynamic"></asp:RequiredFieldValidator>
    <etier:CreditCardValidator ID="CreditCardValidator1" runat="server" 
        ControlToValidate="TxtCardNumber" 
        ErrorMessage="That is not a valid credit card number." 
        AcceptedCardTypes="All">
    </etier:CreditCardValidator>
    <br />
    Expires: <asp:TextBox ID="TxtMonthExpiry" runat="server" Width="30px" /> / 
    <asp:TextBox ID="TxtYearExpiry" runat="server"  Width="60px" />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TxtMonthExpiry" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="TxtYearExpiry" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RangeValidator1" runat="server" 
        ControlToValidate="TxtMonthExpiry" Display="Dynamic" 
        ErrorMessage="Please check again." MaximumValue="12" MinimumValue="1" 
        Type="Integer"></asp:RangeValidator>
    <asp:RangeValidator ID="YearValidator" runat="server" 
        ControlToValidate="TxtYearExpiry" ErrorMessage="Please check again." 
        OnLoad="YearValidator_Load" Type="Integer"></asp:RangeValidator>
    <br />
    <br />
    <asp:Label ID="LblError" runat="server"></asp:Label>
    <br />
    <asp:Button ID="BtnSubmit" runat="server" Text="Submit" 
        onclick="BtnSubmit_Click" />
    <br />
    <br />
</asp:Content>
