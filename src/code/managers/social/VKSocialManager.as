/**
 * Created with IntelliJ IDEA.
 * User: rem
 * Date: 11.04.15
 * Time: 18:17
 * To change this template use File | Settings | File Templates.
 */
package code.managers.social {
import code.data.UserVO;
import code.managers.*;

import code.events.GameEvent;

import flash.events.Event;

import vk.APIConnection;
import vk.events.CustomEvent;

public class VKSocialManager extends SocialManager
{

    private var _connected:Boolean = false;
    private var _apiConnection:APIConnection;
    private var _onGetUsersCallBack:Function;
    private var _postingCallback:Function;
    private var _requestCallback:Function;


    public function VKSocialManager()
    {
        super();
    }

    /**
     * init
     */
    override public function init():void
    {
        trace("init social");

        _apiConnection = new APIConnection(Manager.instance.flashVars);
        _apiConnection.addEventListener(CustomEvent.CONN_INIT, onConnectionInit);
        _apiConnection.addEventListener("onRequestSuccess", onRequestSuccess);
        _apiConnection.addEventListener("onRequestCancel", onRequestCancel);
        _apiConnection.addEventListener("onRequestFail", onRequestFail);
    }

    private function onConnectionInit(event:Event):void
    {
        _apiConnection.removeEventListener(CustomEvent.CONN_INIT, onConnectionInit);
        _connected = true;

        Manager.dispatcher.dispatchEvent(new GameEvent(GameEvent.EVENT_SOCIAL_CONNECT));
    }

    /**
     * getAllFriends
     * @param callback
     */
    override public function getAllFriends(callback:Function):void
    {
        _onGetUsersCallBack = callback
        _apiConnection.api("friends.get", {}, onGetFriends);
    }

    private function onGetFriends(data:Array):void
    {
        var uids:String = data.toString();
        _apiConnection.api("users.get", {uids:uids, fields:"uid,first_name,last_name,photo_medium,online"}, onUsersGetSuccess, onUsersGetError);
    }

    private function onUsersGetError(result:Object):void
    {
        getAllFriends(_onGetUsersCallBack);
    }

    private function onUsersGetSuccess(result:Object):void
    {
        if (!result) return;

        var friends:Array = [];
        for each (var user:Object in result as Array)
        {
            friends.push(new UserVO(user.uid, user.first_name, user.last_name, user.photo_medium, user.online));
        }
        _onGetUsersCallBack(friends);
    }

    /**
     * inviteFriends
     * @param uid
     * @param callBack
     */
    override public function inviteFriends(uid:String, callBack:Function = null):void
    {
        _requestCallback = callBack;
        if (_connected)
            _apiConnection.callMethod("showRequestBox",uid, "Присоединяйся к игре!");
    }

    private function onRequestSuccess(event:Event):void
    {
        if (_requestCallback!=null)
            _requestCallback(true);
        _requestCallback = null;
    }
    private function onRequestCancel(event:Event):void
    {
        if (_requestCallback!=null)
            _requestCallback(false);
        _requestCallback = null;
    }
    private function onRequestFail(event:Event):void
    {
        if (_requestCallback!=null)
            _requestCallback(false);
        _requestCallback = null;
    }

    /**
     * postOnWall
     * @param uid
     * @param callBack
     */
    override public function postOnWall(uid:String, callBack:Function = null):void
    {
        _postingCallback = callBack;
        var link:String = "http://vk.com/app4868281";
        _apiConnection.api('wall.post', { owner_id: uid, message:"Присоединяйся к игре!", attachments:link + "," + "photo-91910564_357963602" }, wallPostSuccess, wallPostFail);
    }

    private function wallPostSuccess(data:Object):void
    {
        if (_postingCallback != null) _postingCallback(true);
        _postingCallback = null;
    }

    private function wallPostFail(data:Object):void
    {
        if (_postingCallback != null) _postingCallback(false);
        _postingCallback = null;
    }
}
}
