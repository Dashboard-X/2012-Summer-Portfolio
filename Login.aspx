<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Assignment2.Login" %>
<asp:Content ID="Content" ContentPlaceHolderID="ContentHolder" runat="server">
    <h1>Clerk and Administrator Login</h1>
    <asp:Login ID="aspLogin" runat="server" DestinationPageUrl="~/Home.aspx" />
    </asp:Login>
</asp:Content>