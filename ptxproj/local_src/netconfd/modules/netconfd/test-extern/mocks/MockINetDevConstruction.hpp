// SPDX-License-Identifier: GPL-2.0-or-later
#pragma once

#include <gmock/gmock.h>

#include "INetDevEvents.hpp"

namespace netconf {

class MockINetDevEvents : public INetDevEvents {
 public:

  MOCK_METHOD1(OnNetDevCreated,void(NetDevPtr netdev));
  MOCK_METHOD1(OnNetDevRemoved, void(NetDevPtr netdev));
  MOCK_METHOD1(OnBridgePortsChange, void(NetDevPtr netdev));
  MOCK_METHOD1(OnLinkChange, void(NetDevPtr netdev));
};


}  // namespace netconf
