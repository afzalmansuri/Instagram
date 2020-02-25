import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class StoryBase {

//#region storyId Prop
        @prop()
        storyId : number;
//#endregion storyId Prop


//#region userId Prop
        @range({minimumNumber:1,maximumNumber:2147483647})
        @required()
        userId : number;
//#endregion userId Prop


//#region storyType Prop
        @required()
        @maxLength({value:20})
        storyType : string;
//#endregion storyType Prop


//#region storyContent Prop
        @required()
        storyContent : string;
//#endregion storyContent Prop


//#region storyDateTime Prop
        @required()
        storyDateTime : any;
//#endregion storyDateTime Prop


//#region storyStatus Prop
        @required()
        storyStatus : boolean;
//#endregion storyStatus Prop











}