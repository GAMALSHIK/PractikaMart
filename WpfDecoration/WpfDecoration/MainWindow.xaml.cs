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

namespace WpfDecoration
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            Refresh();
        }

        private void add_Button_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Ну тут должно было быть добавление чего-то");
        }

        private void edit_Button_Click(object sender, RoutedEventArgs e)
        {
            if (listView.SelectedItem != null)
                MessageBox.Show("Ну тут должно было быть редактирование чего-то");
        }

        private void delete_Button_Click(object sender, RoutedEventArgs e)
        {
            if (listView.SelectedItems.Count > 0)
            {
                MessageBoxResult result = MessageBox.Show("Удалить элементы?", "Удаление эементов", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if (result.ToString() == "Yes")
                {
                    List<продукция> selectedItems = listView.SelectedItems.Cast<продукция>().ToList();
                    Instance.db.продукция.RemoveRange(selectedItems);
                    Instance.db.SaveChanges();
                    Refresh();
                }
            }
        }

        private void search_TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            listView.ItemsSource = Instance.db.продукция.Where(q => q.наименование.Contains(search_TextBox.Text)).ToList();
        }

        private void refresh_Button_Click(object sender, RoutedEventArgs e)
        {
            Refresh();
        }
        private void Refresh()
        {
            var products = Instance.db.продукция;
            listView.ItemsSource = products.ToList();
        }
    }
}
