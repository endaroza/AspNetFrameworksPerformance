using Node.Cs.Lib;
using Node.Cs.Lib.Routing;

namespace NodeCs
{
	public class GlobalNodeCs 
	{


		public void RegisterRoutes()
		{
			GlobalVars.RoutingService.AddStaticRoute("~/Content");
			GlobalVars.RoutingService.AddStaticRoute("~/Scripts");
			GlobalVars.RoutingService.AddRoute("~/api/{controller}/{action}/{id}",
				new
				{
					Controller = "Home",
					Action = "Index",
					Id = RoutingParameter.Optional
				});

			GlobalVars.RoutingService.AddRoute("~/{controller}/{action}/{id}",
				new
				{
					Controller = "Home",
					Action = "Index",
					Id = RoutingParameter.Optional
				});
		}

		// ReSharper disable once InconsistentNaming
		public void Application_Start()
		{
			RegisterRoutes();
		}
	}
}