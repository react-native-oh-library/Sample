

#pragma once
#include <napi/native_api.h>
#include "MarqueeViewEventEmitter.h"
#include "RNOH/ArkJS.h"
#include "RNOH/EventEmitRequestHandler.h"

using namespace facebook;
namespace rnoh {

    enum MarqueeViewEventType {
        MARQUEE_VIEW_ON_STOP = 0,
    };

    MarqueeViewEventType getMarqueeViewEventType(ArkJS &arkJs, napi_value eventObject) {
        auto eventType = arkJs.getString(arkJs.getObjectProperty(eventObject, "type"));
        LOG(INFO) << "getMarqueeViewEventType = " + eventType;
        if (eventType == "onStop") {
            return MarqueeViewEventType::MARQUEE_VIEW_ON_STOP;
        } else {
            throw std::runtime_error("Unknown Page event type");
        }
    }

    class MarqueeViewEventEmitRequestHandler : public EventEmitRequestHandler {
        public:
        void handleEvent(EventEmitRequestHandler::Context const &ctx) override {
            if (ctx.eventName != "MarqueeView") {
                return;
            }
            ArkJS arkJs(ctx.env);
            auto eventEmitter = ctx.shadowViewRegistry->getEventEmitter<react::MarqueeViewEventEmitter>(ctx.tag);
            if (eventEmitter == nullptr) {
                return;
            }

            MarqueeViewEventType type = getMarqueeViewEventType(arkJs, ctx.payload);
            switch (type) {
            case MarqueeViewEventType::MARQUEE_VIEW_ON_STOP: {
                bool isStop = (bool)arkJs.getBoolean(arkJs.getObjectProperty(ctx.payload, "isStop"));
                LOG(INFO) << "MarqueeViewEventEmitter OnStop " << isStop;
                
                react::MarqueeViewEventEmitter::OnStop event{isStop};
                eventEmitter->onStop(event);
                break;
            }
            default:
                break;
            }
        };
    };
} // namespace rnoh