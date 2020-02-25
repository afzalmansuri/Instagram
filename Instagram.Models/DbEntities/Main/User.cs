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
    [Table("Users",Schema="dbo")]
    public partial class User
    {
		#region UserId Annotations

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [System.ComponentModel.DataAnnotations.Key]
		#endregion UserId Annotations

        public int UserId { get; set; }

		#region ApplicationLocaleId Annotations

        [Range(1, int.MaxValue)]
        [Required]
		#endregion ApplicationLocaleId Annotations

        public int ApplicationLocaleId { get; set; }

		#region ApplicationTimeZoneId Annotations

        [Range(1, int.MaxValue)]
        [Required]
		#endregion ApplicationTimeZoneId Annotations

        public int ApplicationTimeZoneId { get; set; }

		#region LanguageCode Annotations

        [Required]
        [MaxLength(3)]
		#endregion LanguageCode Annotations

        public string LanguageCode { get; set; }

		#region UserName Annotations

        [Required]
        [MaxLength(50)]
		#endregion UserName Annotations

        public string UserName { get; set; }

		#region Password Annotations

        [Required]
        [MaxLength(132)]
		#endregion Password Annotations

        public byte[] Password { get; set; }

		#region Salt Annotations

        [Required]
        [MaxLength(140)]
		#endregion Salt Annotations

        public byte[] Salt { get; set; }

		#region LoginBlocked Annotations

        [Required]
		#endregion LoginBlocked Annotations

        public bool LoginBlocked { get; set; }

		#region StatusId Annotations

        [Range(1, int.MaxValue)]
        [Required]
		#endregion StatusId Annotations

        public Status StatusId { get; set; }

		#region ApplicationUserTokens Annotations

        [InverseProperty("User")]
		#endregion ApplicationUserTokens Annotations

        public virtual ICollection<ApplicationUserToken> ApplicationUserTokens { get; set; }

		#region UserRoles Annotations

        [InverseProperty("User")]
		#endregion UserRoles Annotations

        public virtual ICollection<UserRole> UserRoles { get; set; }

		#region Followers Annotations

        [InverseProperty("User")]
		#endregion Followers Annotations

        public virtual ICollection<Follower> Followers { get; set; }

		#region Followers1 Annotations

        [InverseProperty("User1")]
		#endregion Followers1 Annotations

        public virtual ICollection<Follower> Followers1 { get; set; }

		#region UserDetails Annotations

        [InverseProperty("User")]
		#endregion UserDetails Annotations

        public virtual ICollection<UserDetail> UserDetails { get; set; }

		#region Posts Annotations

        [InverseProperty("User")]
		#endregion Posts Annotations

        public virtual ICollection<Post> Posts { get; set; }

		#region PostTags Annotations

        [InverseProperty("User")]
		#endregion PostTags Annotations

        public virtual ICollection<PostTag> PostTags { get; set; }

		#region Chats Annotations

        [InverseProperty("User")]
		#endregion Chats Annotations

        public virtual ICollection<Chat> Chats { get; set; }

		#region Chats1 Annotations

        [InverseProperty("User1")]
		#endregion Chats1 Annotations

        public virtual ICollection<Chat> Chats1 { get; set; }

		#region PostComments Annotations

        [InverseProperty("User")]
		#endregion PostComments Annotations

        public virtual ICollection<PostComment> PostComments { get; set; }

		#region PostLikes Annotations

        [InverseProperty("User")]
		#endregion PostLikes Annotations

        public virtual ICollection<PostLike> PostLikes { get; set; }

		#region PostShares Annotations

        [InverseProperty("User")]
		#endregion PostShares Annotations

        public virtual ICollection<PostShare> PostShares { get; set; }

		#region PostShares1 Annotations

        [InverseProperty("User1")]
		#endregion PostShares1 Annotations

        public virtual ICollection<PostShare> PostShares1 { get; set; }

		#region Stories Annotations

        [InverseProperty("User")]
		#endregion Stories Annotations

        public virtual ICollection<Story> Stories { get; set; }

		#region StoryComments Annotations

        [InverseProperty("User")]
		#endregion StoryComments Annotations

        public virtual ICollection<StoryComment> StoryComments { get; set; }

		#region StoryShares Annotations

        [InverseProperty("User")]
		#endregion StoryShares Annotations

        public virtual ICollection<StoryShare> StoryShares { get; set; }

		#region StoryShares1 Annotations

        [InverseProperty("User1")]
		#endregion StoryShares1 Annotations

        public virtual ICollection<StoryShare> StoryShares1 { get; set; }

		#region StoryTags Annotations

        [InverseProperty("User")]
		#endregion StoryTags Annotations

        public virtual ICollection<StoryTag> StoryTags { get; set; }


        public User()
        {
			ApplicationUserTokens = new HashSet<ApplicationUserToken>();
			UserRoles = new HashSet<UserRole>();
			Followers = new HashSet<Follower>();
			Followers1 = new HashSet<Follower>();
			UserDetails = new HashSet<UserDetail>();
			Posts = new HashSet<Post>();
			PostTags = new HashSet<PostTag>();
			Chats = new HashSet<Chat>();
			Chats1 = new HashSet<Chat>();
			PostComments = new HashSet<PostComment>();
			PostLikes = new HashSet<PostLike>();
			PostShares = new HashSet<PostShare>();
			PostShares1 = new HashSet<PostShare>();
			Stories = new HashSet<Story>();
			StoryComments = new HashSet<StoryComment>();
			StoryShares = new HashSet<StoryShare>();
			StoryShares1 = new HashSet<StoryShare>();
			StoryTags = new HashSet<StoryTag>();
        }
	}
}