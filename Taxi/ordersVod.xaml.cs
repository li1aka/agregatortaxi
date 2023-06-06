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
    /// Логика взаимодействия для ordersVod.xaml
    /// </summary>
    public partial class ordersVod : Page
    {
        public order _price = new order();
        public ordersVod()
        {
            InitializeComponent();
            listOrders.ItemsSource = taxiEntities.GetContext().order.ToList();

            
        }

        

        private void winOrder_Click(object sender, RoutedEventArgs e)
        {

            MessageBox.Show($"Вы заработали себе на покушоц");

            var hotelsForRemoving = listOrders.SelectedItems.Cast<order>().ToList();

            try
            {
                taxiEntities.GetContext().order.RemoveRange(hotelsForRemoving);
                taxiEntities.GetContext().SaveChanges();
                
                taxiEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                listOrders.ItemsSource = taxiEntities.GetContext().order.ToList();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }

        }
        
    }
}
