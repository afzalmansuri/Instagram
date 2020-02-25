import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class FollowerBase {

//#region followerId Prop
        @prop()
        followerId : number;
//#endregion followerId Prop


//#region followBy Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        followBy : number;
//#endregion followBy Prop


//#region followTo Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        followTo : number;
//#endregion followTo Prop


//#region followDateTime Prop
        @required()
        followDateTime : any;
//#endregion followDateTime Prop







}