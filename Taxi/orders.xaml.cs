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
    /// Логика взаимодействия для orders.xaml
    /// </summary>
    public partial class orders : Page
    {
        public orders()
        {
            InitializeComponent();
            allOrders.ItemsSource = taxiEntities.GetContext().order.ToList();
        }

        //edit
        private void Order_Click(object sender, RoutedEventArgs e)
        {
            manager.MainFrame.Navigate(new editOrder((sender as Button).DataContext as order));
        }

        private void dellete_Click(object sender, RoutedEventArgs e)
        {
            var hotelsForRemoving = allOrders.SelectedItems.Cast<order>().ToList();

            //уточняем у пользователя точно ли хотим удалить
            if (MessageBox.Show($"Вы точно хотите удалить следующие {hotelsForRemoving.Count()} элементов?", "Внимание",
                MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                //обработка исключений
                try
                {
                    taxiEntities.GetContext().order.RemoveRange(hotelsForRemoving);
                    taxiEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");
                    taxiEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                    allOrders.ItemsSource = taxiEntities.GetContext().order.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void addNew_Click(object sender, RoutedEventArgs e)
        {
            manager.MainFrame.Navigate(new addOrder());
        }
    }
}
