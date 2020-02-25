import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vUserPostBase {

//#region postId Prop
        @gridColumn({visible: true, columnIndex:0, allowSorting: true, headerKey: 'postId', keyColumn: true})
        postId : number;
//#endregion postId Prop


//#region postContent Prop
        @gridColumn({visible: true, columnIndex:1, allowSorting: true, headerKey: 'postContent', keyColumn: false})
        postContent : string;
//#endregion postContent Prop


//#region postCaption Prop
        @gridColumn({visible: true, columnIndex:2, allowSorting: true, headerKey: 'postCaption', keyColumn: false})
        postCaption : string;
//#endregion postCaption Prop


//#region taggedUserId Prop
        @gridColumn({visible: true, columnIndex:3, allowSorting: true, headerKey: 'taggedUserId', keyColumn: false})
        taggedUserId : number;
//#endregion taggedUserId Prop


//#region status Prop
        @gridColumn({visible: true, columnIndex:4, allowSorting: true, headerKey: 'status', keyColumn: false})
        status : string;
//#endregion status Prop

}