import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class PostShareBase {

//#region postShareId Prop
        @prop()
        postShareId : number;
//#endregion postShareId Prop


//#region shareBy Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        shareBy : number;
//#endregion shareBy Prop


//#region shareTo Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        shareTo : number;
//#endregion shareTo Prop


//#region postId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        postId : number;
//#endregion postId Prop


//#region shareDateTime Prop
        @required()
        shareDateTime : any;
//#endregion shareDateTime Prop







}