<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Patients.aspx.cs" Inherits="Assignment2.User.Patients" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHolder" runat="server">
    <h1>Patient Listing</h1>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Search for Patient Name"></asp:Label>
        <asp:TextBox ID="TxtSearchName" runat="server"></asp:TextBox>
        <asp:Button ID="BtnSearchName" runat="server" Text="Search" 
            onclick="BtnSearchName_Click" />
    </p>
    <asp:GridView ID="GridPatients" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" AllowSorting="false" DataSourceID="PatientsDataSource">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" 
                SortExpression="Name" />
            <asp:BoundField DataField="Address" HeaderText="Address" ReadOnly="True" 
                SortExpression="Address" />
            <asp:BoundField DataField="DateOfBirth" HeaderText="DateOfBirth" 
                ReadOnly="True" SortExpression="DateOfBirth" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" ReadOnly="True" 
                SortExpression="Phone" />
            <asp:BoundField DataField="EmergencyContact" HeaderText="EmergencyContact" 
                ReadOnly="True" SortExpression="EmergencyContact" />
            <asp:BoundField DataField="DateOfRegistration" HeaderText="DateOfRegistration" 
                ReadOnly="True" SortExpression="DateOfRegistration" />
        </Columns>
    </asp:GridView>
    <asp:ObjectDataSource ID="PatientsDataSource" runat="server" 
        SelectMethod="getPatients" TypeName="Assignment2.User.PatientsDAL">
        <SelectParameters>
            <asp:ControlParameter ControlID="TxtSearchName" Name="name" PropertyName="Text" 
                Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
</asp:Content>
