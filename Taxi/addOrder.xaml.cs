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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Taxi
{
    /// <summary>
    /// Логика взаимодействия для addOrder.xaml
    /// </summary>
    public partial class addOrder : Page
    {
        private order _cur = new order();
        public addOrder()
        {
            InitializeComponent();

            DataContext = _cur;

            dopService.ItemsSource = taxiEntities.GetContext().service.ToList();
            classCars.ItemsSource = taxiEntities.GetContext().classCar.ToList();

            
        }

        private void cancel_Click(object sender, RoutedEventArgs e)
        {
            manager.MainFrame.GoBack();
        }

        private void save_Click(object sender, RoutedEventArgs e)
        {
            taxiEntities.GetContext().order.Add(_cur);



            //обработка исключений
            try
            {
                taxiEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена!");
                manager.MainFrame.Navigate(new orders());
                taxiEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                taxiEntities.GetContext().order.ToList();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
