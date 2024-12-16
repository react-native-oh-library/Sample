#include "RTNCenteredTextComponentInstance.h"
#include <RNOH/arkui/ArkUINodeRegistry.h>
#include <RNOH/arkui/TouchEventDispatcher.h>
#include <string>

namespace rnoh {

RTNCenteredTextComponentInstance::RTNCenteredTextComponentInstance(Context context) : super(std::move(context)) {
    m_stackNode.insertChild(m_textNode, 0);
    ArkUINodeRegistry::getInstance().registerTouchHandler(&m_textNode, this);
    NativeNodeApi::getInstance()->registerNodeEvent(m_textNode.getArkUINodeHandle(), NODE_TOUCH_EVENT, NODE_TOUCH_EVENT,
                                                    0);
};

RTNCenteredTextComponentInstance::~RTNCenteredTextComponentInstance() {
    NativeNodeApi::getInstance()->unregisterNodeEvent(m_textNode.getArkUINodeHandle(), NODE_TOUCH_EVENT);
    ArkUINodeRegistry::getInstance().unregisterTouchHandler(&m_textNode);
}

void RTNCenteredTextComponentInstance::onPropsChanged(SharedConcreteProps const &props) {
    super::onPropsChanged(props);
    m_textNode.setTextContent(props->text);
    m_textNode.setFontSize(30.0);
    m_textNode.setTextAlign(ARKUI_TEXT_ALIGNMENT_CENTER);
    if (props->rawProps.count("color") != 0 && !props->rawProps["color"].isNull()) {
        uint32_t color = std::stoul(props->rawProps["color"].asString(), nullptr, 16);
        m_textNode.setFontColor(color);
    }
};

void RTNCenteredTextComponentInstance::onTouchEvent(ArkUI_UIInputEvent *e) {
    auto action = OH_ArkUI_UIInputEvent_GetAction(e);
    auto actionType = static_cast<ActionType>(action);
    if (actionType == ActionType::Down) {
        m_eventEmitter->onTextTouch({.type = 0});
        return;
    }
    if (actionType == ActionType::Up) {
        m_eventEmitter->onTextTouch({.type = 1});
        return;
    }
    if (actionType == ActionType::Move) {
        m_eventEmitter->onTextTouch({.type = 2});
        return;
    }
}

} // namespace rnoh
