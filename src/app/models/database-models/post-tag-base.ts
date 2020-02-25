import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class PostTagBase {

//#region postTagId Prop
        @prop()
        postTagId : number;
//#endregion postTagId Prop


//#region postId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        postId : number;
//#endregion postId Prop


//#region taggedUserId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        taggedUserId : number;
//#endregion taggedUserId Prop


//#region tagStatus Prop
        @required()
        tagStatus : boolean;
//#endregion tagStatus Prop


//#region tagDateTime Prop
        @required()
        tagDateTime : any;
//#endregion tagDateTime Prop





}