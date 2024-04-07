using System.IO;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.ViewEngines;
using Microsoft.AspNetCore.Mvc.ViewFeatures;

public static class ControllerExtensions
{
    public static string RenderViewToString(this Controller controller, string viewName, object model)
    {
        var httpContext = controller.ControllerContext.HttpContext;
        var actionContext = new ActionContext(httpContext, httpContext.GetRouteData(), controller.ControllerContext.ActionDescriptor);

        var viewEngineResult = controller.HttpContext.RequestServices.GetService<ICompositeViewEngine>()
            .FindView(actionContext, viewName, false);

        if (viewEngineResult.Success == false || viewEngineResult.View == null)
        {
            throw new ArgumentNullException($"View '{viewName}' not found.");
        }

        var viewData = new ViewDataDictionary(new EmptyModelMetadataProvider(), new ModelStateDictionary())
        {
            Model = model
        };

        using (var sw = new StringWriter())
        {
            var viewContext = new ViewContext(actionContext, viewEngineResult.View, viewData, new TempDataDictionary(controller.HttpContext, (ITempDataProvider)controller.TempData), sw, new HtmlHelperOptions());
            viewEngineResult.View.RenderAsync(viewContext);
            return sw.ToString();
        }
    }
}
