import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class PostLikeBase {

//#region postLikeId Prop
        @prop()
        postLikeId : number;
//#endregion postLikeId Prop


//#region postId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        postId : number;
//#endregion postId Prop


//#region likedById Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        likedById : number;
//#endregion likedById Prop


//#region likeDateTime Prop
        @required()
        likeDateTime : any;
//#endregion likeDateTime Prop





}