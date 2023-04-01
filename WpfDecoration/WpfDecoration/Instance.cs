using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfDecoration
{
    internal class Instance
    {
        private static DecorationEntities _db;
        public static DecorationEntities db
        {
            get
            {
                if(_db == null)
                    _db = new DecorationEntities();
                return _db;
            }
        }
    }
}
