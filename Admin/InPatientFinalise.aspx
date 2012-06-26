<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/General.Master" CodeBehind="InPatientFinalise.aspx.cs"
    Inherits="Assignment2.Admin.InPatientFinalise" %>
<%@ MasterType TypeName="Assignment2.General" %>

<asp:Content ID="Scripts" ContentPlaceHolderID="HeadHolder" runat="server">
</asp:Content>
<asp:Content ID="Content" ContentPlaceHolderID="ContentHolder" runat="server">
    <h1>Finalise In-Patient Booking</h1>

    <table>
        <tr>
            <td>
                Doctor
            </td>
            <td>
                <%# DoctorInfo.Name %>
            </td>
        </tr>
        <tr>
            <td>
                Patients In Care
            </td>
            <td>
                <%# DoctorInfo.PatientsInCare %>
                patients
            </td>
        </tr>
        <tr>
            <td>
                Patient
            </td>
            <td>
                <%# PatientInfo.Name %>
            </td>
        </tr>
    </table>

    <asp:DropDownList ID="LstFreeBeds" runat="server" 
        onselectedindexchanged="LstFreeBeds_SelectedIndexChanged"
        AutoPostBack="True">
    </asp:DropDownList><br />
    <asp:Label runat="server" ID="Label1">Rate Per Day: </asp:Label>
    <asp:Label runat="server" ID="LblBedRate"></asp:Label>
    <br />
    
    <asp:Label runat="server" ID="Label2">Type: </asp:Label>
    <asp:Label runat="server" ID="LblBedType"></asp:Label>
    <br />

    <asp:Button ID="BtnSubmit" runat="server" Text="Submit" 
        onclick="BtnSubmit_Click" />
</asp:Content>
