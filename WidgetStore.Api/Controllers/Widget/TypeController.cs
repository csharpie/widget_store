using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using WidgetStore.Api.Models;

namespace WidgetStore.Api.Controllers.Widget
{
    public class TypeController : ApiController
    {
        private static WidgetStoreEntities _db = new WidgetStoreEntities();

        [HttpGet]
        public List<TypeDTO> GetAll()
        {
            var types = new List<TypeDTO>();
            foreach (var type in _db.Types)
            {
                var typ = new TypeDTO()
                {
                    Type = type.Type1
                };

                types.Add(typ);
            }

            return types;
        }
    }
}