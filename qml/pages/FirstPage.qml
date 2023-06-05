import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    property string url: "https://i.imgur.com/nAeuX5C.jpeg"

    Column {
        anchors.centerIn: parent
        Rectangle {
            width: 700
            height: 800
            id: container

            Canvas {
                id: canvas
                anchors.fill: parent
                onPaint: {
                    var ctx = getContext("2d");
                    var ar = ctx.createImageData(url)

                    for( var x=0; x < ar.data.length; x=x+4 )
                    {
                        ar.data[x]     = 255 - ar.data[x];
                        ar.data[x+1]   = 255 - ar.data[x+1];
                        ar.data[x+2]   = 255 - ar.data[x+2];

                    }
                    ctx.drawImage(ar, 0, 0);
                }

                Component.onCompleted: {
                    loadImage(url)
                }

                onImageLoaded: {
                    requestPaint()
                }
            }
        }
    }
}
