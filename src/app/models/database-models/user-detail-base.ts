import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class UserDetailBase {

//#region userDetailId Prop
        @prop()
        userDetailId : number;
//#endregion userDetailId Prop


//#region userWebsite Prop
        @maxLength({value:50})
        userWebsite : string;
//#endregion userWebsite Prop


//#region userBio Prop
        @prop()
        userBio : string;
//#endregion userBio Prop


//#region userGender Prop
        @maxLength({value:10})
        userGender : string;
//#endregion userGender Prop


//#region userImage Prop
        @prop()
        userImage : string;
//#endregion userImage Prop


//#region userId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        userId : number;
//#endregion userId Prop



}