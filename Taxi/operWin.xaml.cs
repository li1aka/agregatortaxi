using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Excel = Microsoft.Office.Interop.Excel;

namespace Taxi
{
    /// <summary>
    /// Логика взаимодействия для operWin.xaml
    /// </summary>
    public partial class operWin : Window
    {
        public operWin()
        {
            InitializeComponent();
            MainFrame.Navigate(new orders());
            manager.MainFrame = MainFrame;
        }

        private void aboutVod_Click(object sender, RoutedEventArgs e)
        {
            manager.MainFrame.Navigate(new accauntVoditel());
        }

        private void ordersViw_Click(object sender, RoutedEventArgs e)
        {
            manager.MainFrame.Navigate(new orders());
        }

        private void exit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow min = new MainWindow();
            min.Show();
            Close();
        }

        private void BtnReport_Click(object sender, RoutedEventArgs e)
        {
            var application = new Excel.Application();

            Excel.Workbook workbook = application.Workbooks.Add(Type.Missing);

            int startRowIndex = 1;
            //for (int i = 0; i < allContracts.Count(); i++)
            // {
            Excel.Worksheet worksheet = application.Worksheets.Item[1];
            worksheet.Cells[1].ColumnWidth = 25;
            worksheet.Cells[3].ColumnWidth = 30;
            worksheet.Cells[4].ColumnWidth = 15;
            worksheet.Cells[5].ColumnWidth = 15;
            worksheet.Cells[6].ColumnWidth = 15;
            worksheet.Cells[7].ColumnWidth = 25;

            worksheet.Cells[1][1] = "Откуда";
            worksheet.Cells[2][1] = "Куда";
            worksheet.Cells[3][1] = "Доп. услуги";
            worksheet.Cells[4][1] = "Класс авто";
            worksheet.Cells[5][1] = "Стоимость";

            worksheet.Cells[1][2] = "Москва";
            worksheet.Cells[2][2] = "Воркута";
            worksheet.Cells[3][2] = "Молчаливый водитель";
            worksheet.Cells[4][2] = "Бизнес";
            worksheet.Cells[5][2] = "1000";

            startRowIndex++;

            // }

            application.Visible = true;
        }
    }
}
