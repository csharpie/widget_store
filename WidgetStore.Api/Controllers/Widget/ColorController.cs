using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using WidgetStore.Api.Models;

namespace WidgetStore.Api.Controllers.Widget
{
    public class ColorController : ApiController
    {
        private static Entities _db = new Entities();

        [HttpGet]
        public List<ColorDTO> GetAll()
        {
            var colors = new List<ColorDTO>();
            foreach (var color in _db.Colors)
            {
                var colr = new ColorDTO()
                {
                    Color = color.Color1
                };

                colors.Add(colr);
            }

            return colors;
        }
    }
}