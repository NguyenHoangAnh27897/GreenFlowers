﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace GreenFlowers.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class GreenFlowersEntities : DbContext
    {
        public GreenFlowersEntities()
            : base("name=GreenFlowersEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<GF_Blog> GF_Blog { get; set; }
        public virtual DbSet<GF_Category> GF_Category { get; set; }
        public virtual DbSet<GF_Order> GF_Order { get; set; }
        public virtual DbSet<GF_Product> GF_Product { get; set; }
        public virtual DbSet<GF_Record> GF_Record { get; set; }
    }
}
