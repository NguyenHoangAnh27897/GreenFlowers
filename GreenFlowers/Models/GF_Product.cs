//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class GF_Product
    {
        public string ID { get; set; }
        public string ProductName { get; set; }
        public Nullable<int> Price { get; set; }
        public string Description { get; set; }
        public string Avatar { get; set; }
        public string Images { get; set; }
        public Nullable<int> DiscountPrice { get; set; }
        public Nullable<int> IDCategory { get; set; }
        public Nullable<bool> IsHide { get; set; }
        public Nullable<System.DateTime> Created_Date { get; set; }
        public Nullable<int> CustomerView { get; set; }
    }
}
