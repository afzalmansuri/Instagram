import { prop,propObject,propArray,required,maxLength,range  } from "@rxweb/reactive-form-validators"
import { gridColumn } from "@rxweb/grid"


export class vFollowerBase {

//#region followBy Prop
        @gridColumn({visible: true, columnIndex:1, allowSorting: true, headerKey: 'followBy', keyColumn: true})
        followBy : number;
//#endregion followBy Prop


//#region userName Prop
        @gridColumn({visible: true, columnIndex:2, allowSorting: true, headerKey: 'userName', keyColumn: false})
        userName : string;
//#endregion userName Prop

}