using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CalculatorWeb
{
    public partial class Calculator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //btnCalculate.Visible = false;
            //IsInputValide();
        }
        private bool IsInputValide()
        {
            int parsedValue;
            if (string.IsNullOrEmpty(txtFirstInput.Text) || (!int.TryParse(txtFirstInput.Text, out parsedValue)))
            {
                lblResult.Text = "Eerste nummer is niet correct aangegeven";
                return false;
            }
            if (string.IsNullOrEmpty(txtSecondInput.Text) || (!int.TryParse(txtSecondInput.Text, out parsedValue)))
            {
                lblResult.Text = "Tweede nummer is niet correct aangegeven";
                return false;
            }
            btnCalculate.Visible = true;
            return true;
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            if (IsInputValide())
            {

                HttpClient hc = new HttpClient();
                hc.BaseAddress = new Uri("http://localhost:50679/api/");

                var calculatorApi = hc.GetAsync(string.Format("Calculator/{0}/{1}", txtFirstInput.Text, txtSecondInput.Text));
                calculatorApi.Wait();

                var response = calculatorApi.Result;
                if (response.IsSuccessStatusCode)
                    lblResult.Text = response.Content.ReadAsStringAsync().Result;
                else
                    lblResult.Text = "Er was een probleem bij berekening";
            }
        }
    }
}