/**
 * Created with IntelliJ IDEA.
 * User: rem
 * Date: 12.04.15
 * Time: 0:28
 * To change this template use File | Settings | File Templates.
 */
package code.panels {
import code.data.CheckBoxVO;
import code.data.ImageLoader;
import code.data.UserVO;
import code.managers.Manager;
import code.panels.PanelInvite.ListPanel;
import code.panels.PanelInvite.SearchPanel;

import flash.display.MovieClip;
import flash.display.SimpleButton;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.TextEvent;
import flash.text.TextField;
import flash.ui.Keyboard;
import flash.utils.setTimeout;

public class PanelInvite extends InvitePopup
{
    private var _friendsOffLine:Array=[];
    private var _friendsOnLine:Array=[];

    private const FRAME_OFFLINE:int = 2;
    private const FRAME_ONLINE:int = 1;

    private var _list:ListPanel;
    private var _currentItem:CheckBoxVO;

    public function PanelInvite(friends:Array)
    {
        for each(var friend:UserVO in friends)
        {
            if (friend.online)
            {
                _friendsOnLine.push(new CheckBoxVO(friend));
            }
            else
            {
                _friendsOffLine.push(new CheckBoxVO(friend));
            }
        }
        super();

        initList();
        initTabs();
        showTab(_friendsOnLine);
    }

    private function initTabs():void
    {
        (this.mcTabs["btnTab0"] as SimpleButton).addEventListener(MouseEvent.CLICK, onClickTabOnline);
        (this.mcTabs["btnTab1"] as SimpleButton).addEventListener(MouseEvent.CLICK, onClickTabOffline);
    }

    private function onClickTabOnline(event:MouseEvent):void
    {
        mcList["inpName"].text = "Найти друга по имени";
        this.mcTabs.gotoAndStop(FRAME_ONLINE);
        showTab(_friendsOnLine);
        initTabs();
    }

    private function onClickTabOffline(event:MouseEvent):void
    {
        mcList["inpName"].text = "Найти друга по имени";
        this.mcTabs.gotoAndStop(FRAME_OFFLINE);

        showTab(_friendsOffLine);
        initTabs();
    }

    private function showTab(friends:Array):void
    {
        _list.currentPage = 0;
        _list.init = friends;
        _list.updateList();
    }

    public function initList():void
    {
        _list = new ListPanel(this.mcList, onClickItem);
    }

    private function onClickItem(item:CheckBoxVO):void
    {
        _currentItem = item;
        if (mcTabs.currentFrame == FRAME_ONLINE)
        {
            Manager.instance.inviteFriends(item.user.uid, onRequestComplete);
        }
        else
        {
            Manager.instance.postOnWall(item.user.uid, onRequestComplete);
        }
    }

    private function onRequestComplete(value:Boolean):void
    {
       if (value)
       {
           _list.selectCurrent();
           _currentItem.selected = true;
       }
    }

    public function destroy():void
    {

    }
}
}
