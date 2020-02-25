using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using Instagram.BoundedContext.SqlContext;
namespace Instagram.Models.Main
{
    [Table("vFollowers",Schema="dbo")]
    public partial class vFollower
    {
		#region FollowBy Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion FollowBy Annotations

        public int FollowBy { get; set; }


        public string UserName { get; set; }


        public vFollower()
        {
        }
	}
}