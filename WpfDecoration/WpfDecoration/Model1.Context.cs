﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WpfDecoration
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class DecorationEntities : DbContext
    {
        public DecorationEntities()
            : base("name=DecorationEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
        public virtual DbSet<заказ_клиента> заказ_клиента { get; set; }
        public virtual DbSet<категория_товара> категория_товара { get; set; }
        public virtual DbSet<пользователи> пользователи { get; set; }
        public virtual DbSet<продукция> продукция { get; set; }
        public virtual DbSet<пункты_выдачи> пункты_выдачи { get; set; }
        public virtual DbSet<роли_пользоваетелей> роли_пользоваетелей { get; set; }
        public virtual DbSet<состав_заказа_клиента> состав_заказа_клиента { get; set; }
        public virtual DbSet<статус_заказа> статус_заказа { get; set; }
    }
}
