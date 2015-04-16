/**
 * Created with IntelliJ IDEA.
 * User: rem
 * Date: 14.04.15
 * Time: 12:56
 * To change this template use File | Settings | File Templates.
 */
package code.panels.PanelInvite {
import code.data.CheckBoxVO;

import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.TextEvent;
import flash.text.TextField;
import flash.ui.Keyboard;
import flash.utils.setTimeout;

public class SearchPanel
{
    private var _inpName:TextField;
    private var _updateHandler:Function;

    private var _currentList:Array;
    private var _sortedList:Array;

    public function get currentList():Array {
        return _currentList;
    }

    public function set currentList(value:Array):void {
        _currentList = value;
    }

    public function get sortedList():Array {
        return _sortedList;
    }

    public function set sortedList(value:Array):void {
        _sortedList = value;
    }

    public function SearchPanel(inpName:TextField, updateHandler:Function)
    {
        _updateHandler = updateHandler;
        _inpName = inpName;

        _inpName.addEventListener(MouseEvent.CLICK, onClickInput);
        _inpName.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
       // _inpName.addEventListener(TextEvent.TEXT_INPUT, onInput);
    }

    private function onKeyDown(event:KeyboardEvent):void
    {
        setTimeout(function():void
        {
            if (event.keyCode == Keyboard.ESCAPE)
            {
                _inpName.text = "Найти друга по имени";
                _sortedList = _currentList;
                _updateHandler();
            }
            else
            {
                sort();
            }

        },100);
    }

    private function sort():void
    {
            var arr:Array = [];
            for each (var checkBox:CheckBoxVO in _currentList)
            {
                if (checkBox.user.name.toLowerCase().indexOf(_inpName.text.toLowerCase())>=0)
                {
                    arr.push(checkBox);
                }
            }

            _sortedList = arr;
            _updateHandler();
    }

    private function onClickInput(event:MouseEvent):void
    {
        _inpName.text = "";
        _sortedList = _currentList;
        _updateHandler();
    }


}
}
