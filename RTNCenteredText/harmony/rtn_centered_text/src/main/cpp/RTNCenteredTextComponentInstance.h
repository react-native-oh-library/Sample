#pragma once

#include "RNOH/arkui/StackNode.h"
#include "RNOH/arkui/TextNode.h"
#include "RNOH/generated/components/BaseRTNCenteredTextComponentInstance.h"

namespace rnoh {
class RTNCenteredTextComponentInstance : public BaseRTNCenteredTextComponentInstance, public TouchEventHandler {
    using super = BaseRTNCenteredTextComponentInstance;

    enum class ActionType { Cancel, Down, Move, Up };

    StackNode m_stackNode;
    TextNode m_textNode;

public:
    RTNCenteredTextComponentInstance(Context context);
    ~RTNCenteredTextComponentInstance() override;

    ArkUINode &getLocalRootArkUINode() { return m_stackNode; };

    void onTouchEvent(ArkUI_UIInputEvent *e) override;

protected:
    void onPropsChanged(SharedConcreteProps const &props) override;
};

} // namespace rnoh
