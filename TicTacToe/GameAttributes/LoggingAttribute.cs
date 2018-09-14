using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using TicTacToe.DataAccess;

namespace TicTacToe.GameAttributes
{
    public class LoggingAttribute : ResultFilterAttribute, IActionFilter,IExceptionFilter
    {
        public void OnActionExecuted(ActionExecutedContext context)
        {
            if(context.Exception==null)
            Logger.Instance.LogException(context.RouteData.Values["action"].ToString(),"success","None","Successfully executed");
        }

        public void OnActionExecuting(ActionExecutingContext context)
        {
            Logger.Instance.LogException(context.RouteData.Values["action"].ToString(), "started", "None", "Process started");
        }

        public void OnException(ExceptionContext context)
        {
            Logger.Instance.LogException(context.RouteData.Values["action"].ToString(), "Exception", context.Exception.Message.ToString(), "Error");
        }
    }
}
