<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calculator.aspx.cs" Inherits="CalculatorWeb.Calculator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script src= "https://code.jquery.com/jquery-1.12.4.min.js"> </script> 
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                 <tr>
                    <td>Geef de nummers wat wilt u brekennen aan a.u.b</td>
                    <td></td>
                </tr>
                <tr>
                    <td>Eerste nummer</td>
                    <td> <asp:TextBox ID="txtFirstInput" onblur="OnLeave();" onkeypress="return AllowOnlyNumbers();" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Tweede nummer</td>
                    <td> <asp:TextBox ID="txtSecondInput" onblur="OnLeave();" onkeypress="return AllowOnlyNumbers();" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td> <asp:Button ID="btnCalculate" runat="server" Text="Breken" OnClick="btnCalculate_Click" /></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblResult" runat="server" Text=""></asp:Label></td>
                    <td></td>
                </tr>
            </table>
        </div>
    </form>
    <script type="text/javascript">  
        $(document).ready(function () {
            $("#btnCalculate").hide()
                $("#btnCalculate").click(function () {
                    var eersteInput = $("#txtFirstInput").val();
                    var tweedeInput = $("#txtSecondInput").val();

                    if (eersteInput == "") {
                        alert("De eerste aangegevene waarde is geen nummer ");
                        return false;
                    }
                    if (tweedeInput == "") {
                        alert("De tweede aangegevene waarde is geen nummer ");
                        return false;
                    }
                });
            });

        function AllowOnlyNumbers()
        {
            var eersteInput = $("#txtFirstInput").val();
            var tweedeInput = $("#txtSecondInput").val();
            if (eersteInput == "" || tweedeInput == "")
                $("#btnCalculate").hide();


            if (event.keyCode >= 48 && event.keyCode <= 57) {
                if (eersteInput !== "" && tweedeInput !== "")
                    $("#btnCalculate").show();
                else
                    $("#btnCalculate").hide();

                return true;
            }
            else {
                $("#btnCalculate").hide();
                alert("De aangegevene waarde is geen nummer ");
                return false;
            }
        }
        function OnLeave() {
            var eersteInput = $("#txtFirstInput").val();
            var tweedeInput = $("#txtSecondInput").val();
            if (eersteInput !== "" && tweedeInput !== "")
                $("#btnCalculate").show();
            else {
                $("#btnCalculate").hide();
                $("#lblResult").val("");
            }
        }

    </script> 
</body>
</html>
