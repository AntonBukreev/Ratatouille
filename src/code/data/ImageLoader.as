/**
 * Created with IntelliJ IDEA.
 * User: rem
 * Date: 12.04.15
 * Time: 20:59
 * To change this template use File | Settings | File Templates.
 */
package code.data {
import flash.display.Loader;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.net.URLLoader;
import flash.net.URLLoaderDataFormat;
import flash.net.URLRequest;

public class ImageLoader extends Sprite
{
    /**
     * caching images after loading
     */
    private static var _images:Array=[];

    private var _url:String;

    public function ImageLoader(url:String)
    {
        if (_images[_url]!=null)
        {
            addChild(_images[_url]);
        }
        else
        {
            _url = url;
            super();

            if (url.indexOf("deactivated")<0 && url.indexOf("camera")<0)
            {
                var fileRequest:URLRequest = new URLRequest(url);
                try
                {
                    var imgLdr:URLLoader = new URLLoader();
                    imgLdr.dataFormat = URLLoaderDataFormat.BINARY;
                    imgLdr.addEventListener(Event.COMPLETE, onURLLoaderComplete, false, 0, true);
                    imgLdr.load(fileRequest);
                }
                catch (eror:Error)
                {
                    trace("downloading avatar error! ",url)
                }
            }
        }
    }

    protected function onURLLoaderComplete(e:Event):void
    {
        e.target.removeEventListener(Event.COMPLETE, onURLLoaderComplete);
        var ico:Loader = new Loader();
        ico.loadBytes(URLLoader(e.target).data);
        addChild(ico);
        scaleX = scaleY = 0.5;
        _images[_url] = ico;
    }
}
}
