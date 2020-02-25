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
    [Table("UserDetails",Schema="dbo")]
    public partial class UserDetail
    {
		#region UserDetailId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion UserDetailId Annotations

        public int UserDetailId { get; set; }

		#region UserWebsite Annotations

        [MaxLength(50)]
		#endregion UserWebsite Annotations

        public string UserWebsite { get; set; }


        public string UserBio { get; set; }

		#region UserGender Annotations

        [MaxLength(10)]
		#endregion UserGender Annotations

        public string UserGender { get; set; }


        public string UserImage { get; set; }

		#region UserId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Users","dbo","","UserId")]
		#endregion UserId Annotations

        public int UserId { get; set; }

		#region User Annotations

        [ForeignKey(nameof(UserId))]
        [InverseProperty(nameof(Instagram.Models.Main.User.UserDetails))]
		#endregion User Annotations

        public virtual User User { get; set; }


        public UserDetail()
        {
        }
	}
}