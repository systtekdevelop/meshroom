import QtQuick 2.2
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Styles 1.3

import "layouts"
import "headers"
import "components"
import "delegates"

TitledPageLayout {

    id: root

    background: DefaultBackground {}
    header: HomeHeader {}
    body: Item {
        anchors.fill: parent
        clip: true
        ColumnLayout {
            anchors.centerIn: parent
            spacing: 0
            CustomText {
                text: "Open"
                textSize: _style.text.size.xlarge
                color: _style.text.color.darker
            }
            RowLayout {
                spacing: 10
                CustomComboBox {
                    id: combo
                    model: _applicationModel.locations
                }
                RowLayout {
                    CustomToolButton {
                        iconSize: _style.icon.size.xlarge
                        iconSource: 'qrc:///images/add_project.svg'
                        onClicked: {
                            if(combo.currentIndex == 0)
                                fileDialog.open();
                            else
                                addProject(combo.currentText);
                        }
                        opacity: 0.8
                    }
                }
            }
        }
    }

    // file dialog
    FileDialog {
        id: fileDialog
        title: "Please choose a project directory"
        folder: "/"
        selectFolder: true
        selectMultiple: false
        sidebarVisible: false
        onAccepted: addProject(fileDialog.fileUrl)
    }

}
