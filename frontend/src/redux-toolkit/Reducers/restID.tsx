import { Action, State_restID } from "../../../Types/reducer";

const initialState: State_restID = {
    receiverID: 0
};

export default function restIDReducer(state = initialState, action: Action) {
    switch (action.type) {
        case 'ADD_RESTAURANT_ID':
            return { ...state, receiverID: action.payload.id };
        case 'REMOVE_RESTAURANT_ID':
            return { ...state, receiverID: 0 };
        default:
            return state;
    }
}