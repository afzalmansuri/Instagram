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
    [Table("Chats",Schema="dbo")]
    public partial class Chat
    {
		#region ChatId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion ChatId Annotations

        public int ChatId { get; set; }

		#region SenderId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Users","dbo","","SenderId")]
		#endregion SenderId Annotations

        public int SenderId { get; set; }

		#region RecieverId Annotations

        [Range(1,int.MaxValue)]
        [Required]
        [RelationshipTableAttribue("Users","dbo","","RecieverId")]
		#endregion RecieverId Annotations

        public int RecieverId { get; set; }

		#region User Annotations

        [ForeignKey(nameof(SenderId))]
        [InverseProperty(nameof(Instagram.Models.Main.User.Chats))]
		#endregion User Annotations

        public virtual User User { get; set; }

		#region User1 Annotations

        [ForeignKey(nameof(RecieverId))]
        [InverseProperty(nameof(Instagram.Models.Main.User.Chats1))]
		#endregion User1 Annotations

        public virtual User User1 { get; set; }

		#region ChatDetails Annotations

        [InverseProperty("Chat")]
		#endregion ChatDetails Annotations

        public virtual ICollection<ChatDetail> ChatDetails { get; set; }


        public Chat()
        {
			ChatDetails = new HashSet<ChatDetail>();
        }
	}
}