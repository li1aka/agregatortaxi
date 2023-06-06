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
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            
            {
                MainWindow a = new MainWindow();
                a.Show();
                Hide();

                StringBuilder errors = new StringBuilder();
                using (var db = new taxiEntities())
                {
                    var pass = db.Users.AsNoTracking().FirstOrDefault(u => u.login == textBoxLogin.Text && u.password == passBox.Text);
                    var login = db.Users.AsNoTracking().FirstOrDefault(u => u.login == textBoxLogin.Text);
                    if (login == null)
                    {
                        errors.AppendLine("Пользователь не найден ");
                    }

                    if (pass == null)
                    {
                        errors.AppendLine("Неверный пароль");
                    }

                    if (errors.Length > 0)
                        MessageBox.Show(errors.ToString());
                    if (errors.Length == 0)
                    {
                        if (pass.isAdmin == true)
                        {
                            vodWin vod = new vodWin();
                            vod.Show();
                            Close();
                        }
                        else
                        {
                            operWin oper = new operWin();
                            oper.Show();
                            Close();
                        }
                    }
                }
            }
        }
    }
}
