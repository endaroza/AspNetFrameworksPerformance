using System;
using System.Collections.Generic;
using Node.Cs.Lib.Controllers;

namespace NodeCS.Controllers
{
	public class MvcPerformanceController : ControllerBase
	{
		//
		// GET: /MvcPerformance/

		public IEnumerable<IResponse> Index()
		{
			yield return View();
		}

		public IEnumerable<IResponse> HelloWorldCode()
		{
			yield return TextResponse("Hello World. Time is: " + DateTime.Now);
		}

		public IEnumerable<IResponse> HelloWorldJson()
		{
			yield return JsonResponse(new Person());
		}

	}
}