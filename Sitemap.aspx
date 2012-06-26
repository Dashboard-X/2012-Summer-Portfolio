<%@ Page Title="" Language="C#" MasterPageFile="~/General.Master" AutoEventWireup="true" CodeBehind="Sitemap.aspx.cs" Inherits="Assignment2.Sitemap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentHolder" runat="server">
    <h1>Sitemap</h1>
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapData">
    </asp:TreeView>
    <asp:SiteMapDataSource ID="SiteMapData" runat="server" ShowStartingNode="false" />
</asp:Content>
