package code {

import code.events.GameEvent;
import code.panels.PanelInvite;

import flash.display.Sprite;
import flash.text.TextField;

import code.managers.Manager;

import code.managers.social.VKSocialManager;

[SWF(width="898", height="649", frameRate="45")]
public class Ratatouille extends Sprite
{
    public function Ratatouille()
    {
        var flashVars: Object = stage.loaderInfo.parameters as Object;
        Manager.instance.flashVars = flashVars;
        Manager.dispatcher.addEventListener(GameEvent.EVENT_SOCIAL_CONNECT, onSocialConnect)
        Manager.instance.initSocial();

    }

    /**
     *  getAllFriends
     * @param event
     */
    private function onSocialConnect(event:GameEvent):void
    {
        Manager.instance.getAllFriends(onGetFriends);
    }

    /**
     * open PanelInvite
     * @param allFriends
     */
    private function onGetFriends(allFriends: Array):void
    {
        var mc:PanelInvite = new PanelInvite(allFriends);
        addChild(mc);
    }



}
}
