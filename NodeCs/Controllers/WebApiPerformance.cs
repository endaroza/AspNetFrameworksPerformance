using System.Collections.Generic;
using System.Diagnostics;
using System;
using System.Net;
using System.Text;
using System.Web.UI.WebControls;
using Node.Cs.Lib.Attributes;
using Node.Cs.Lib.Controllers;

namespace NodeCS.Controllers
{
	public class WebApiPerformanceController : ApiControllerBase
	{
		[HttpGet]
		public IEnumerable<IResponse> HelloWorldCode()
		{
			string output = "Hello cruel World. " + DateTime.Now.ToString();
			yield return TextResponse(output, "text/plain", Encoding.UTF8);
		}

		[HttpGet]
		public IEnumerable<IResponse> WorkingSet()
		{
			yield return TextResponse( "Node.Cs - Working set is: " + Process.GetCurrentProcess().WorkingSet.ToString("n0") + " bytes");
		}

		[HttpGet]
		public IEnumerable<IResponse> HelloWorldJson()
		{
			yield return JsonResponse(new Person());
		}

		[HttpGet]
		public IEnumerable<IResponse> HelloWorldJsonTypedResult()
		{
			yield return JsonResponse(new Person());
		}

		[HttpGet]
		public IEnumerable<IResponse> HelloWorldJsonCreateResponse()
		{
			yield return JsonResponse(new Person());
		}

		[HttpGet]
		public IEnumerable<IResponse> HelloWorldJsonManualResponse()
		{
			yield return JsonResponse(new Person());
		}

		[HttpGet]
		public IEnumerable<IResponse> HelloWorldXml()
		{
			var res = new XmlResponse();
			res.Initialize(new Person(), "application/xml", Encoding.UTF8);

			yield return res;
		}
	}
}

