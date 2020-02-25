using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using Instagram.BoundedContext.SqlContext;
namespace Instagram.Models.Main
{
    [Table("vUserPosts",Schema="dbo")]
    public partial class vUserPost
    {
		#region PostId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion PostId Annotations

        public int PostId { get; set; }


        public string PostContent { get; set; }


        public string PostCaption { get; set; }


        public int TaggedUserId { get; set; }


        public string Status { get; set; }


        public vUserPost()
        {
        }
	}
}