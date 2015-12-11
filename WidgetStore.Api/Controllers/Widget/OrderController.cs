using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using WidgetStore.Api.Models;
using WidgetStore.Api.Validation.Widget;

namespace WidgetStore.Api.Controllers.Widget
{
    public class OrderController : ApiController
    {
        private static Entities _db = new Entities();

        [HttpGet]
        public List<OrderDTO> GetAll()
        {
            var orders = new List<OrderDTO>();
            foreach (var order in _db.Orders)
            {
                var ord = new OrderDTO()
                {
                    Color = order.Color,
                    Quantity = order.Quantity,
                    Type = order.Type,
                    DateBy = order.DateBy,
                    UserId = order.UserId,
                    Id = order.Id
                };

                orders.Add(ord);
            }

            return orders;
        }

        [HttpPost]
        public dynamic Post([FromBody]JObject jsonString)
        {
            dynamic json = jsonString;
            JObject jmodel = json;

            var order = jmodel.ToObject<Order>();
            var validationErrors = new List<ValidationError>();
            var orderValidation = new OrderValidation(order, validationErrors);

            if (validationErrors.Count > 0)
                return JsonConvert.SerializeObject(validationErrors);

            _db.Orders.Add(order);
            _db.SaveChanges();

            return order;
        }
    }
}