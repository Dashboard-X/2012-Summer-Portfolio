<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="VisitDetails.aspx.cs" Inherits="Assignment2.User.VisitDetails" %>
<%@ MasterType TypeName="Assignment2.General" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHolder" runat="server">
    <h1>Visit Details</h1>

    <asp:Panel runat="server" ID="PnlNoVisitFound">
        Could not find a treatment record for that visit. <asp:Button runat="server" 
            ID="BtnCreateTreatment" Text="Create" onclick="BtnCreateTreatment_Click" Visible="false" />
    </asp:Panel>

    <asp:Panel runat="server" ID="PnlFoundTreatment" Visible="false">
        <table width="80%">
            <tr><td>Symptoms:</td><td><asp:TextBox ID="TxtSymptoms" runat="server" 
                    Height="150px" TextMode="MultiLine" Width="100%"></asp:TextBox></td></tr>
            <tr><td>Diagnosis:</td><td><asp:TextBox ID="TxtDiagnosis" runat="server" 
                    Height="150px" TextMode="MultiLine" Width="100%"></asp:TextBox></td></tr>
            <tr><td>Treatment:</td><td><asp:TextBox ID="TxtTreatment" runat="server" 
                    Height="150px" TextMode="MultiLine" Width="100%"></asp:TextBox></td></tr>
        </table>
        <asp:Button ID="BtnSubmit" runat="server" onclick="BtnSubmit_Click" 
            Text="Submit Changes" />
        <br />
    </asp:Panel>

    <a href="javascript:history.go(-1)"> [Go to Previous Page]</a>

 </asp:Content>
