import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class PostBase {

//#region postId Prop
        @prop()
        postId : number;
//#endregion postId Prop


//#region userId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        userId : number;
//#endregion userId Prop


//#region postType Prop
        @required()
        postType : string;
//#endregion postType Prop


//#region postContent Prop
        @required()
        postContent : string;
//#endregion postContent Prop


//#region postCaption Prop
        @prop()
        postCaption : string;
//#endregion postCaption Prop


//#region postDateTime Prop
        @required()
        postDateTime : any;
//#endregion postDateTime Prop


//#region status Prop
        @required()
        @maxLength({value:10})
        status : string;
//#endregion status Prop











}