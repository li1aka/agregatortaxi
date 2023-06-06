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

namespace Taxi
{
    /// <summary>
    /// Логика взаимодействия для vodWin.xaml
    /// </summary>
    public partial class vodWin : Window
    {
        public vodWin()
        {
            InitializeComponent();
            MainFrame.Navigate(new ordersVod());
            manager.MainFrame = MainFrame;
        }

        private void accauntVod_Click(object sender, RoutedEventArgs e)
        {
            manager.MainFrame.Navigate(new accauntVoditel());
        }

        private void infoCar_Click(object sender, RoutedEventArgs e)
        {
            manager.MainFrame.Navigate(new carVoditel());
        }

        private void orders_Click(object sender, RoutedEventArgs e)
        {
            manager.MainFrame.Navigate(new ordersVod());
        }

        private void exit_Click(object sender, RoutedEventArgs e)
        {
            MainWindow man = new MainWindow();
            man.Show();
            Close();
        }
    }
}
