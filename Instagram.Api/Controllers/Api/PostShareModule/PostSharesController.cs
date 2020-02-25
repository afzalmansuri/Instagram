using Microsoft.AspNetCore.Mvc;
using System.Linq;
using Instagram.Domain.PostShareModule;
using Instagram.Models.Main;
using RxWeb.Core.AspNetCore;
using RxWeb.Core.Security.Authorization;

namespace Instagram.Api.Controllers.PostShareModule
{
    [ApiController]
    [Route("api/[controller]")]
	
	public class PostSharesController : BaseDomainController<PostShare,PostShare>

    {
        public PostSharesController(IPostShareDomain domain):base(domain) {}

    }
}
