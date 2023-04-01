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

namespace WpfDecoration
{
    /// <summary>
    /// Логика взаимодействия для LoginWindow.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
        }

        private void login_Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var user = Instance.db.пользователи.FirstOrDefault(q => q.логин.Equals(login_TextBox.Text) && q.пароль.Equals(password_TextBox.Password));
                if (user != null)
                {
                    Window newWindow = new MainWindow();
                    newWindow.Show();
                    this.Close();
                }
                else
                {
                    MessageBox.Show("Не правильно.");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
    }
}
