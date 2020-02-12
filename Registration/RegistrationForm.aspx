<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationForm.aspx.cs" Inherits="Registration.RegistrationForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title></title>
 <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.4.1.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#Button3').click(function () {
                var fname = $('#fname').val();
                var lname = $('#lname').val();
                var email = $('#email').val();
                var phno = $('#phno').val();
                if (!fname || !lname ||!email || !phno) {
                    alert("Enter all fields ");
                    return false;
                }
                return true;
            });
        }); 
        </script>
    <script src="validator.js" type="text/javascript"></script>
   
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!-- Text box for firstname,Last name,email,phone number-->
            First Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="fname" runat="server" ></asp:TextBox>
            <asp:Label ID="lblfn" runat="server" Text=" "></asp:Label>
            <br />
            Last Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="lname" runat="server"></asp:TextBox>
            <asp:Label ID="lblln" runat="server" ></asp:Label>
            <br />
            Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="email" runat="server" TextMode="Email"></asp:TextBox>
            <asp:Label ID="lblmail" runat="server" ></asp:Label>
            <br />
            Phone Number
            <asp:TextBox ID="phno" runat="server"></asp:TextBox>
            <asp:Label ID="lblphno" runat="server" ></asp:Label>
            <br />
            <br />
             <!-- Cascading dropdown for country,state,City-->
            <asp:SqlDataSource ID="SqlDataSourceCountry" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="SELECT [CountryID], [CountryName] FROM [tblCountry]"></asp:SqlDataSource>
            Country:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="CountryList" runat="server" DataSourceID="SqlDataSourceCountry" AutoPostBack="true" AppendDataBoundItems="true" DataTextField="CountryName" DataValueField="CountryID" >
                <asp:ListItem Value="0">--Select Country--</asp:ListItem>
            </asp:DropDownList>
        </div>
        <p>
            State:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="StateList" runat="server" DataSourceID="SqlDataSource1State" AutoPostBack="true" AppendDataBoundItems="true" DataTextField="StateName" DataValueField="StateId">
                <asp:ListItem Value="0">--Select State--</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1State" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="SELECT [StateId], [StateName] FROM [tblState] WHERE ([FK_CountryId] = @FK_CountryId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="CountryList" Name="FK_CountryId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </p>
        City:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="CityList" runat="server" DataSourceID="CityDataSource" AutoPostBack="true" DataTextField="CityName" DataValueField="CityId" AppendDataBoundItems="true" >
            <asp:ListItem Value="0">--Select City--</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="CityDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TestConnectionString %>" SelectCommand="SELECT [CityId], [CityName] FROM [tblCity] WHERE ([FK_StateId] = @FK_StateId)">
            <SelectParameters>
                <asp:ControlParameter ControlID="StateList" Name="FK_StateId" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
         <!-- Radio button for gender-->
        Gender :<asp:RadioButton ID="RadioButton1" runat="server" Text="Male" GroupName="Gender"/>
&nbsp;<asp:RadioButton ID="RadioButton2" runat="server" Text="Female" GroupName="Gender"/>
        <br />
        <br />
         <!-- Check box for stream-->
        Stream :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<p style="margin-left: 120px">
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged" >
                 
                <asp:ListItem >Java</asp:ListItem>
                <asp:ListItem>Net</asp:ListItem>
                <asp:ListItem>SDET</asp:ListItem>
                <asp:ListItem>DEP</asp:ListItem>
            </asp:CheckBoxList>
           
        </p>
        <p style="margin-left: 120px">
            &nbsp;</p>
         <!-- Calendar for date of birth-->
        Date of Birth: <div style="margin-left: 160px">
            <asp:Calendar ID="Calendar1" runat="server" ></asp:Calendar>
        </div>
        <p style="margin-left: 240px">
            <asp:Button ID="Button1" runat="server" style="margin-bottom: 0px; height: 26px;" Text="server" Type="submit" OnClick="Button1_Click"/>
            <asp:Button ID="Button2" runat="server" style="width: 56px" Text="js"  OnClientClick="return Validate()"  />
            <asp:Button ID="Button3" runat="server" Height="16px" OnClick="Button3_Click" style="margin-bottom: 0px" Text="Jquery" />
        </p>
    </form>
</body>
</html>