<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NavBar.ascx.cs" Inherits="Assignment2.UserControl.NavBar" %>

<div id="NavBar">
<asp:Menu ID="NavBarMenu" runat="server" DataSourceID="SiteMapDataSource" />
<asp:SiteMapDataSource ID="SiteMapDataSource" runat="server" ShowStartingNode="false" />
</div>