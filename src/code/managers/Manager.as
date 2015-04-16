/**
 * Created with IntelliJ IDEA.
 * User: rem
 * Date: 11.04.15
 * Time: 20:40
 * To change this template use File | Settings | File Templates.
 */
package code.managers {
import flash.events.Event;
import flash.events.EventDispatcher;
import flash.external.ExternalInterface;

import code.managers.social.LocalSocialManager;
import code.managers.social.SocialManager;

import code.managers.social.VKSocialManager;

public class Manager
{
    public static var dispatcher:EventDispatcher = new EventDispatcher();
    public static var social:SocialManager;

    private var _flashVars:Object;

    private static var _instance:Manager = null;

    public static function get instance():Manager
    {
        if (_instance == null) _instance = new Manager(new Key());
        return _instance;
    }

    public function Manager(key:Key)
    {

    }

    public function set flashVars(value:Object):void
    {
        _flashVars = value;
    }

    public function get flashVars():Object
    {
        return _flashVars;

    }

    public function initSocial():void
    {
        if (!ExternalInterface.available)
        {
            social = new LocalSocialManager();
        }
        else
        {
            social = new VKSocialManager();
        }
        social.init();
    }

    public function inviteFriends(uid:String, callBack:Function = null):void
    {
        social.inviteFriends(uid,callBack);
    }

    public function postOnWall(uid:String, callBack:Function = null):void
    {
        social.postOnWall(uid,callBack);
    }

    public function getAllFriends(callback:Function):void
    {
        social.getAllFriends(callback);
    }
}
}
class Key{};
