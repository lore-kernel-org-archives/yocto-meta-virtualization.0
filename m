Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.3632.1574923900773393676
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 Nov 2019 22:51:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: hongxu.jia@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xAS6pdnq005133
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 27 Nov 2019 22:51:40 -0800 (PST)
Received: from ala-lpggp7.wrs.com (147.11.105.171) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.468.0; Wed, 27 Nov 2019
 22:51:27 -0800
From: "hongxu" <hongxu.jia@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][m-c-s][PATCH] consul: fix compile failure while go upgraded to 1.13
Date: Wed, 27 Nov 2019 22:51:27 -0800
Message-ID: <20191128065127.28275-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

While go was upgraded to 1.13, there is a do_compile failure,
Refer upstream envoyproxy to rename imports throughout

https://github.com/envoyproxy/protoc-gen-validate/pull/161/commits/7428b5f8e7fdabbcc7c9710e23e6f438ba4ff021

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 recipes-connectivity/consul/consul_git.bb     |  1 +
 ...-Migration-Rename-imports-throughout.patch | 82 +++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100644 recipes-connectivity/consul/files/0001-Migration-Rename-imports-throughout.patch

diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
index 566fbc9c..b96499c4 100644
--- a/recipes-connectivity/consul/consul_git.bb
+++ b/recipes-connectivity/consul/consul_git.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://src/github.com/hashicorp/consul/LICENSE;md5=b278a92d2
 GO_IMPORT = "github.com/hashicorp/consul"
 SRCREV = "944cc71026c007e7de9467ec3f38f0ad14464fcc"
 SRC_URI = "git://${GO_IMPORT}.git \
+           file://0001-Migration-Rename-imports-throughout.patch \
            file://consul.service \
           "
 
diff --git a/recipes-connectivity/consul/files/0001-Migration-Rename-imports-throughout.patch b/recipes-connectivity/consul/files/0001-Migration-Rename-imports-throughout.patch
new file mode 100644
index 00000000..906107da
--- /dev/null
+++ b/recipes-connectivity/consul/files/0001-Migration-Rename-imports-throughout.patch
@@ -0,0 +1,82 @@
+From a9353f184d6cf6ae7ef1b5676720f5bee0882ec3 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Wed, 27 Nov 2019 22:38:25 -0800
+Subject: [PATCH] Migration: Rename imports throughout
+
+rename lyft -> envoyproxy
+
+Since upstream envoyproxy update it [https://github.com/envoyproxy/protoc-gen-validate/pull/161/commits/7428b5f8e7fdabbcc7c9710e23e6f438ba4ff021]
+Upstream-Status: Pending
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ .../envoy/api/v2/cluster/circuit_breaker.pb.go                | 2 +-
+ .../go-control-plane/envoy/api/v2/route/route.pb.go           | 4 ++--
+ .../envoyproxy/protoc-gen-validate/validate/validate.pb.go    | 2 +-
+ .../envoyproxy/protoc-gen-validate/validate/validate.proto    | 2 +-
+ 4 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/vendor/github.com/envoyproxy/go-control-plane/envoy/api/v2/cluster/circuit_breaker.pb.go b/vendor/github.com/envoyproxy/go-control-plane/envoy/api/v2/cluster/circuit_breaker.pb.go
+index 30a138eba..7dfcc91e2 100644
+--- a/src/github.com/hashicorp/consul/vendor/github.com/envoyproxy/go-control-plane/envoy/api/v2/cluster/circuit_breaker.pb.go
++++ b/src/github.com/hashicorp/consul/vendor/github.com/envoyproxy/go-control-plane/envoy/api/v2/cluster/circuit_breaker.pb.go
+@@ -87,7 +87,7 @@ type CircuitBreakers_Thresholds struct {
+ 	// The :ref:`RoutingPriority<envoy_api_enum_core.RoutingPriority>`
+ 	// the specified CircuitBreaker settings apply to.
+ 	// [#comment:TODO(htuch): add (validate.rules).enum.defined_only = true once
+-	// https://github.com/lyft/protoc-gen-validate/issues/42 is resolved.]
++	// https://github.com/envoyproxy/protoc-gen-validate/issues/42 is resolved.]
+ 	Priority core.RoutingPriority `protobuf:"varint,1,opt,name=priority,proto3,enum=envoy.api.v2.core.RoutingPriority" json:"priority,omitempty"`
+ 	// The maximum number of connections that Envoy will make to the upstream
+ 	// cluster. If not specified, the default is 1024.
+diff --git a/vendor/github.com/envoyproxy/go-control-plane/envoy/api/v2/route/route.pb.go b/vendor/github.com/envoyproxy/go-control-plane/envoy/api/v2/route/route.pb.go
+index cce788c7d..ec69f4769 100644
+--- a/src/github.com/hashicorp/consul/vendor/github.com/envoyproxy/go-control-plane/envoy/api/v2/route/route.pb.go
++++ b/src/github.com/hashicorp/consul/vendor/github.com/envoyproxy/go-control-plane/envoy/api/v2/route/route.pb.go
+@@ -1513,7 +1513,7 @@ type RouteAction struct {
+ 	RequestMirrorPolicy *RouteAction_RequestMirrorPolicy `protobuf:"bytes,10,opt,name=request_mirror_policy,json=requestMirrorPolicy,proto3" json:"request_mirror_policy,omitempty"`
+ 	// Optionally specifies the :ref:`routing priority <arch_overview_http_routing_priority>`.
+ 	// [#comment:TODO(htuch): add (validate.rules).enum.defined_only = true once
+-	// https://github.com/lyft/protoc-gen-validate/issues/42 is resolved.]
++	// https://github.com/envoyproxy/protoc-gen-validate/issues/42 is resolved.]
+ 	Priority core.RoutingPriority `protobuf:"varint,11,opt,name=priority,proto3,enum=envoy.api.v2.core.RoutingPriority" json:"priority,omitempty"`
+ 	// Specifies a set of rate limit configurations that could be applied to the
+ 	// route.
+@@ -3475,7 +3475,7 @@ type VirtualCluster struct {
+ 	// Optionally specifies the HTTP method to match on. For example GET, PUT,
+ 	// etc.
+ 	// [#comment:TODO(htuch): add (validate.rules).enum.defined_only = true once
+-	// https://github.com/lyft/protoc-gen-validate/issues/42 is resolved.]
++	// https://github.com/envoyproxy/protoc-gen-validate/issues/42 is resolved.]
+ 	Method               core.RequestMethod `protobuf:"varint,3,opt,name=method,proto3,enum=envoy.api.v2.core.RequestMethod" json:"method,omitempty"`
+ 	XXX_NoUnkeyedLiteral struct{}           `json:"-"`
+ 	XXX_unrecognized     []byte             `json:"-"`
+diff --git a/vendor/github.com/envoyproxy/protoc-gen-validate/validate/validate.pb.go b/vendor/github.com/envoyproxy/protoc-gen-validate/validate/validate.pb.go
+index ef5938c83..9a1a4c08d 100644
+--- a/src/github.com/hashicorp/consul/vendor/github.com/envoyproxy/protoc-gen-validate/validate/validate.pb.go
++++ b/src/github.com/hashicorp/consul/vendor/github.com/envoyproxy/protoc-gen-validate/validate/validate.pb.go
+@@ -1,7 +1,7 @@
+ // Code generated by protoc-gen-go. DO NOT EDIT.
+ // source: validate/validate.proto
+ 
+-package validate // import "github.com/lyft/protoc-gen-validate/validate"
++package validate // import "github.com/envoyproxy/protoc-gen-validate/validate"
+ 
+ import proto "github.com/golang/protobuf/proto"
+ import fmt "fmt"
+diff --git a/vendor/github.com/envoyproxy/protoc-gen-validate/validate/validate.proto b/vendor/github.com/envoyproxy/protoc-gen-validate/validate/validate.proto
+index 1c5e04a16..05cce2cbd 100644
+--- a/src/github.com/hashicorp/consul/vendor/github.com/envoyproxy/protoc-gen-validate/validate/validate.proto
++++ b/src/github.com/hashicorp/consul/vendor/github.com/envoyproxy/protoc-gen-validate/validate/validate.proto
+@@ -1,7 +1,7 @@
+ syntax = "proto2";
+ package validate;
+ 
+-option go_package = "github.com/lyft/protoc-gen-validate/validate";
++option go_package = "github.com/envoyproxy/protoc-gen-validate/validate";
+ option java_package = "com.lyft.pgv.validate";
+ 
+ import "google/protobuf/descriptor.proto";
+-- 
+2.21.0
+
-- 
2.21.0

