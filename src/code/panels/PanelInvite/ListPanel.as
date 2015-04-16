/**
 * Created with IntelliJ IDEA.
 * User: rem
 * Date: 14.04.15
 * Time: 13:51
 * To change this template use File | Settings | File Templates.
 */
package code.panels.PanelInvite {
import code.data.CheckBoxVO;
import code.data.ImageLoader;

import flash.display.MovieClip;
import flash.events.MouseEvent;
import flash.text.TextField;

public class ListPanel
{

    private const ITEMS:int = 8;

    //viewing page
    private var _currentPage:int;

    //selected item index
    private var _currentIndex:int;

    private var _search:SearchPanel;
    private var _onClickHandler:Function;
    private var _view:MovieClip;

    public function ListPanel(view:MovieClip, onClickHandler:Function)
    {
        _view = view;
        _onClickHandler = onClickHandler;

        _search = new SearchPanel(view["inpName"], onUpdateSearchHandler);

        _currentPage = 0;
        for (var i:int=0; i < ITEMS; i++)
        {
            var item:MovieClip = (view["item"+i] as MovieClip);
            (item["mcAvatar"] as MovieClip).mouseEnabled = false;
            (item["tfName"] as TextField).mouseEnabled = false;
            (item["mcSelected"] as MovieClip).mouseEnabled = false;
            item["btn"].addEventListener(MouseEvent.CLICK, onClickItem);
            item.visible = false;
        }

        view["btnLeft"].addEventListener(MouseEvent.CLICK, onLeftClick);
        view["btnRight"].addEventListener(MouseEvent.CLICK, onRightClick)
    }

    private function onUpdateSearchHandler():void
    {
        _currentPage = 0;
        updateList();
    }

    private function onClickItem(event:MouseEvent):void
    {
        var mc:MovieClip = event.target.parent;
        _currentIndex = int((mc.name as String).replace("item",""));
        var index:int = _currentIndex+ITEMS*_currentPage;
        var item:CheckBoxVO = ( _search.sortedList[index] as CheckBoxVO);

        if (!item.selected)
            _onClickHandler(item);
    }

    public function updateList():void
    {
        _view["btnLeft"].visible = _view["btnRight"].visible =  _search.sortedList.length >ITEMS;

        for (var i:int=0; i < ITEMS; i++)
        {
            var item:MovieClip = (_view["item"+i] as MovieClip);
            var index:int = i+ITEMS*_currentPage;
            if (index <  _search.sortedList.length)
            {
                var checkBox:CheckBoxVO = ( _search.sortedList[index] as CheckBoxVO);
                (item["tfName"] as TextField).text = checkBox.user.name;
                (item["mcSelected"] as MovieClip).visible = checkBox.selected;

                removeAll(item["mcAvatar"] as MovieClip);
                (item["mcAvatar"] as MovieClip).addChild(new ImageLoader(checkBox.user.ico));
                (item["mcAvatar"] as MovieClip).mouseChildren = false;
                (item["mcAvatar"] as MovieClip).mouseEnabled = false;
            }
            item.visible = index <  _search.sortedList.length;
        }
    }

    private function removeAll(container:MovieClip):void
    {
        for (var k:int = container.numChildren-1; k >=0; k--)
        {
            container.removeChildAt(k);
        }
    }

    private function onRightClick(event:MouseEvent):void
    {
        var maxPage:int = Math.ceil(( _search.sortedList.length-1)/ITEMS)-1;
        _currentPage += 1;
        if (_currentPage > maxPage)
            _currentPage = maxPage;
        else
            updateList();
    }

    private function onLeftClick(event:MouseEvent):void
    {
        _currentPage -= 1;
        if (_currentPage < 0)
            _currentPage = 0;
        else
            updateList();
    }

    public function set init(friends:Array):void
    {
        _search.currentList = friends;
        _search.sortedList = friends;
    }

    public function get currentPage():int {
        return _currentPage;
    }

    public function set currentPage(value:int):void {
        _currentPage = value;
    }

    public function selectCurrent():void {
        (_view["item"+_currentIndex]["mcSelected"] as MovieClip).visible = true;
    }
}
}
