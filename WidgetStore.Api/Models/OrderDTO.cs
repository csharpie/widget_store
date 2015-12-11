using System;

namespace WidgetStore.Api.Models
{
    public class OrderDTO
    {
        public int Id { get; set; }
        public int Quantity { get; set; }
        public string Color { get; set; }
        public DateTime DateBy { get; set; }
        public string Type { get; set; }
        public string UserId { get; set; }
    }
}