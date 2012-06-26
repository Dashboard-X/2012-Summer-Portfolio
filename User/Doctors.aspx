<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Doctors.aspx.cs" Inherits="Assignment2.User.Doctors" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHolder" runat="server">
    <asp:ObjectDataSource ID="DoctorsDataSource" runat="server" 
        SelectMethod="getDoctors" TypeName="Assignment2.DoctorsDAL"></asp:ObjectDataSource>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="DoctorsDataSource" 
        DataKeyNames="Id">
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>

        <ItemTemplate>
            <div class="DoctorPanel">
            <h2><asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' /></h2>
            Address:
            <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
            <br />
            Phone:
            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
            <br />
            </div>
        </ItemTemplate>

        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" 
                style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
            </div>
        </LayoutTemplate>
    </asp:ListView>
</asp:Content>
