using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using RxWeb.Core.Annotations;
using RxWeb.Core.Data.Annotations;
using RxWeb.Core.Sanitizers;
using Instagram.Models.Enums.Main;
using Instagram.BoundedContext.SqlContext;
namespace Instagram.Models.Main
{
    [Table("UserPrivacys",Schema="dbo")]
    public partial class UserPrivacy
    {
		#region UserPrivacyId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion UserPrivacyId Annotations

        public int UserPrivacyId { get; set; }

		#region AccountPrivacyType Annotations

        [Required]
        [MaxLength(20)]
		#endregion AccountPrivacyType Annotations

        public string AccountPrivacyType { get; set; }

		#region StoryShares Annotations

        [InverseProperty("UserPrivacy")]
		#endregion StoryShares Annotations

        public virtual ICollection<StoryShare> StoryShares { get; set; }


        public UserPrivacy()
        {
			StoryShares = new HashSet<StoryShare>();
        }
	}
}