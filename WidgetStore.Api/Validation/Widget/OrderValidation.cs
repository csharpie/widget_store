using System;
using System.Collections.Generic;
using System.Linq;
using WidgetStore.Api.Models;

namespace WidgetStore.Api.Validation.Widget
{
    public class OrderValidation
    {
        // Make sure Color and Type are in Database tables. Make sure DateBy is at least 1 week in the future.

        private WidgetStoreEntities _db = new WidgetStoreEntities();

        public OrderValidation(Order order, List<ValidationError> validationErrors)
        {
            ValidateQuantity(order.Quantity, validationErrors);
            ValidateColor(order.Color, validationErrors);
            ValidateType(order.Type, validationErrors);
            ValidateDateByAtLeastOneWeekFromToday(order.DateBy, validationErrors);
        }

        public void ValidateQuantity(int quantity, List<ValidationError> validationErrors)
        {
            if (quantity <= 0)
            {
                var ve = new ValidationError();
                ve.Message = "Quantity must be greater than 0.";

                validationErrors.Add(ve);
            }
        }

        public void ValidateColor(string color, List<ValidationError> validationErrors)
        {
            var colorFound = _db.Colors
                .Where(t => t.Color1 == color)
                .FirstOrDefault();

            if (colorFound == null)
            {
                var ve = new ValidationError();
                ve.Message = "Color was not found. Select a new widget color.";

                validationErrors.Add(ve);
            }
        }

        public void ValidateType(string type, List<ValidationError> validationErrors)
        {
           var typeFound = _db.Types
                .Where(t => t.Type1 == type)
                .FirstOrDefault();

            if (typeFound == null)
            {
                var ve = new ValidationError();
                ve.Message = "Type was not found. Select a new widget type.";

                validationErrors.Add(ve);
            }

        }

        public void ValidateDateByAtLeastOneWeekFromToday(DateTime dateBy, List<ValidationError> validationErrors)
        {
            if (dateBy < DateTime.Now.AddDays(7))
            {
                var ve = new ValidationError();
                ve.Message = "Date By must be at least one week from today.";

                validationErrors.Add(ve);
            }
        }
    }
}