Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B150C624D6
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 06:13:28 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1614.1788416000849539226
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 02 Sep 2026 23:13:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YIdtb/Da;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15010; q=dns/txt;
  s=iport01; t=1788416000; x=1789625600;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8U9p3pVD0q/+KsJgHWCmA/GtmoMDE7ssYSvmMIlpfVw=;
  b=YIdtb/DawpomXgKFdROkv2LxF4VqBHJY7TDbOfw0wigZQsnB9yyvztxj
   z201wYL4JMhdwlHYFhm+/FMoaq5cuPdfnGN79eI2wtv4sJf2BZa72rXYj
   4lHQIV1dnJnZYCDdZTr1famCq7rtd/+Yjca68t/KBavOCV3PgkZ24dWhP
   8s/+T1mWO0V+FnGTqZfpKl3lHzq+RtX+jHEgRImXB51TfmmusS9Y7/sdY
   IKNnvhpUIU/UNzYAnZQyZKEIff2CaTCsNid89mTHexwXM7DrtBYU3Tb4H
   MbEUs0qDkS6hoirYnl5QZyYXzotTxnvdCrCo+54j90I+qWwsYX8MV0B5U
   A==;
X-CSE-ConnectionGUID: V0oKeu9NS8CXg4pWf2KTeA==
X-CSE-MsgGUID: rkJ3Xj0lRRGfsB9BbS5cBg==
X-IPAS-Result: =?us-ascii?q?A0ACAADKDplq/4sQJK1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQGBfAQBAQEBAQsBghc/dGFCSQOMb4lYkU2MURSBEANXD?=
 =?us-ascii?q?wEBAQ9EDQQBAYISgnONeQImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDZAZAQIBNQFGLAMBAlojIQmCeQGCdAIBEQa/M4IsgQGCZoEGQ?=
 =?us-ascii?q?VDbMQELFAEFgTMBhT6IIl0YAYR8JxsbgXKBFYNpgQWBXAICgSEjAoZdBIIig?=
 =?us-ascii?q?QyBWh6BN4EejxhIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBH?=
 =?us-ascii?q?YEog0EjGTZ6gQlegSspYAESF4EJgggCglSCBQIBSUMOB0dTCScYCxgNSBEsN?=
 =?us-ascii?q?xUZBD5uB45gH4FjYgkGATElBAoXBwIKASoBLx8CBi8MChkmCwYSBwcCHwZIk?=
 =?us-ascii?q?mAbJ49lgiGBNZ9aCiiDdowilToaM4QEgVeSQJJSC5h9izeCU4h4jHsNGTeEa?=
 =?us-ascii?q?YFoPDmBIHAVgyIJShkPjisECguBFAECgkmEUEOBfsUoJDUBAQkDLwEBBwIHD?=
 =?us-ascii?q?gMLgWiQACyBUgEB?=
IronPort-Data: A9a23:Ip4/SKgPKUlmPKJQEmYtKp2BX161MREKZh0ujC45NGQN5FlHY01je
 htvWWiEaf/bYGH3eth1aYy+8UhU7JPSyIA3QVdvqS8zFCNjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FH1dOOn9SUgvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeCULOZ82QsaDxMuvrY8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUmouFUDHwf0
 8dIAwACMgi8ibiV/L+SH7wEasQLdKEHPasWvnVmiDWcBvE8TNWbGePB5MRT23E7gcUm8fT2P
 pVCL2ExKk2eJUQUaz/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIqPJ4PTHpUPzi50o
 Erc/EaiMhNCMOal5jSe2COGjNSSlgn0Ddd6+LqQs6QCbEeo7mkeFBRTS1qhveSwjk+sUs5eL
 Eo8/is1sbN05UugUt7lRRq6rXWY+BkGVLJt//YS4QWJzO/Qpg2eHGVBFmQHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:qzIU9qHrExqD0FQIpLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:AiD5q2OKFDdtve5DZnFg10MJS+YeIlbtwyvIHEHiKlpkYejA
X-Talos-MUID: =?us-ascii?q?9a23=3AKJJ8tQ9X1S6Kl1oFl8rOiCyQf91rwf+eChgJq68?=
 =?us-ascii?q?ptdKuZAZ6AGqWpjviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,258,1779148800"; 
   d="scan'208";a="825713828"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Sep 2026 06:13:19 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id 911EB180000B0;
	Thu,  3 Sep 2026 06:13:19 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id 2DB31CE1C03; Wed,  2 Sep 2026 23:13:19 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-virtualization][scarthgap][PATCH] grpc-go: Fix CVE-2026-33186
Date: Wed,  2 Sep 2026 23:11:55 -0700
Message-Id: <20260903061155.3709114-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 03 Sep 2026 06:13:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10075

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the equivalent master fix from [1].
The nearest fixed-tag commit is [2], which is included in v1.79.3.
The advisory in [3] documents the CVE and fixed version but does not
cite either commit. Commit [1] is used because it contains the same
CVE-relevant strict path checking change without the unrelated
test-data changes from [2].

Backport Changes:
- Updated do_install to exclude Quilt patch-management (.pc) files from the
  installed Go source files.

[1] https://github.com/grpc/grpc-go/commit/58bbf8ab36838ce1454da092ac0dad350b0162ea
[2] https://github.com/grpc/grpc-go/commit/72186f163e75a065c39e6f7df9b6dea07fbdeff5
[3] https://github.com/grpc/grpc-go/security/advisories/GHSA-p77j-4mvh-x3m3

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../go/grpc-go/CVE-2026-33186.patch           | 346 ++++++++++++++++++
 recipes-devtools/go/grpc-go_git.bb            |   6 +-
 2 files changed, 350 insertions(+), 2 deletions(-)
 create mode 100644 recipes-devtools/go/grpc-go/CVE-2026-33186.patch

diff --git a/recipes-devtools/go/grpc-go/CVE-2026-33186.patch b/recipes-devtools/go/grpc-go/CVE-2026-33186.patch
new file mode 100644
index 0000000..4ee3d83
--- /dev/null
+++ b/recipes-devtools/go/grpc-go/CVE-2026-33186.patch
@@ -0,0 +1,346 @@
+From cc6152a20c72326c091e73fde27628be1324e3e7 Mon Sep 17 00:00:00 2001
+From: Easwar Swaminathan <easwars@google.com>
+Date: Mon, 22 Jun 2026 22:36:59 -0700
+Subject: [PATCH] grpc: enforce strict path checking for incoming requests on
+ the server (#8985)
+
+RELEASE NOTES:
+* server: fix an authorization bypass where malformed :path headers
+(missing the leading slash) could bypass path-based restricted "deny"
+rules in interceptors like `grpc/authz`. Any request with a
+non-canonical path is now immediately rejected with an `Unimplemented`
+error.
+
+CVE: CVE-2026-33186
+Upstream-Status: Backport [https://github.com/grpc/grpc-go/commit/58bbf8ab36838ce1454da092ac0dad350b0162ea]
+
+Backport Changes:
+- Adapted handleMalformedMethodName for grpc-go v1.59.0 transport APIs.
+  Upstream uses transport.ServerStream and calls stream.WriteStatus(...),
+  while v1.59.0 handleStream receives *transport.Stream and writes status
+  through transport.ServerTransport. The backport passes the server transport
+  into handleMalformedMethodName and uses t.WriteStatus(stream, ...).
+- Adapted channelz logging for grpc-go v1.59.0 Server fields.
+  Upstream logs with s.channelz, but v1.59.0 stores the server channelz
+  identifier as s.channelzID. The backport uses s.channelzID for the new
+  warning logs and malformed-method status-write failure log.
+- Replaced the newer testutils.SetEnvConfig helper used by upstream.
+  grpc-go v1.59.0 does not provide that helper, so the backport omits the
+  upstream google.golang.org/grpc/internal/testutils import and uses local
+  save/restore for envconfig.DisableStrictPathChecking in the regression test.
+
+(cherry picked from commit 58bbf8ab36838ce1454da092ac0dad350b0162ea)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ internal/envconfig/envconfig.go |  16 +++
+ server.go                       |  57 ++++++++---
+ test/malformed_method_test.go   | 178 ++++++++++++++++++++++++++++++++
+ 3 files changed, 235 insertions(+), 16 deletions(-)
+ create mode 100644 test/malformed_method_test.go
+
+diff --git a/internal/envconfig/envconfig.go b/internal/envconfig/envconfig.go
+index 3cf10ddf..6d579e55 100644
+--- a/internal/envconfig/envconfig.go
++++ b/internal/envconfig/envconfig.go
+@@ -46,6 +46,22 @@ var (
+ 	// ALTSMaxConcurrentHandshakes is the maximum number of concurrent ALTS
+ 	// handshakes that can be performed.
+ 	ALTSMaxConcurrentHandshakes = uint64FromEnv("GRPC_ALTS_MAX_CONCURRENT_HANDSHAKES", 100, 1, 100)
++
++	// DisableStrictPathChecking indicates whether strict path checking is
++	// disabled. This feature can be disabled by setting the environment
++	// variable GRPC_GO_EXPERIMENTAL_DISABLE_STRICT_PATH_CHECKING to "true".
++	//
++	// When strict path checking is enabled, gRPC will reject requests with
++	// paths that do not conform to the gRPC over HTTP/2 specification found at
++	// https://github.com/grpc/grpc/blob/master/doc/PROTOCOL-HTTP2.md.
++	//
++	// When disabled, gRPC will allow paths that do not contain a leading slash.
++	// Enabling strict path checking is recommended for security reasons, as it
++	// prevents potential path traversal vulnerabilities.
++	//
++	// A future release will remove this environment variable, enabling strict
++	// path checking behavior unconditionally.
++	DisableStrictPathChecking = boolFromEnv("GRPC_GO_EXPERIMENTAL_DISABLE_STRICT_PATH_CHECKING", false)
+ )
+ 
+ func boolFromEnv(envVar string, def bool) bool {
+diff --git a/server.go b/server.go
+index 8f60d421..75e58eb4 100644
+--- a/server.go
++++ b/server.go
+@@ -43,6 +43,7 @@ import (
+ 	"google.golang.org/grpc/internal"
+ 	"google.golang.org/grpc/internal/binarylog"
+ 	"google.golang.org/grpc/internal/channelz"
++	"google.golang.org/grpc/internal/envconfig"
+ 	"google.golang.org/grpc/internal/grpcsync"
+ 	"google.golang.org/grpc/internal/grpcutil"
+ 	"google.golang.org/grpc/internal/transport"
+@@ -140,6 +141,8 @@ type Server struct {
+ 	czData     *channelzData
+ 
+ 	serverWorkerChannel chan func()
++
++	strictPathCheckingLogEmitted atomic.Bool
+ }
+ 
+ type serverOptions struct {
+@@ -1687,6 +1690,24 @@ func (s *Server) processStreamingRPC(ctx context.Context, t transport.ServerTran
+ 	return t.WriteStatus(ss.s, statusOK)
+ }
+ 
++func (s *Server) handleMalformedMethodName(t transport.ServerTransport, stream *transport.Stream, ti *traceInfo) {
++	if ti != nil {
++		ti.tr.LazyLog(&fmtStringer{"Malformed method name %q", []any{stream.Method()}}, true)
++		ti.tr.SetError()
++	}
++	errDesc := fmt.Sprintf("malformed method name: %q", stream.Method())
++	if err := t.WriteStatus(stream, status.New(codes.Unimplemented, errDesc)); err != nil {
++		if ti != nil {
++			ti.tr.LazyLog(&fmtStringer{"%v", []any{err}}, true)
++			ti.tr.SetError()
++		}
++		channelz.Warningf(logger, s.channelzID, "grpc: Server.handleStream failed to write status: %v", err)
++	}
++	if ti != nil {
++		ti.tr.Finish()
++	}
++}
++
+ func (s *Server) handleStream(t transport.ServerTransport, stream *transport.Stream) {
+ 	ctx := stream.Context()
+ 	var ti *traceInfo
+@@ -1706,26 +1727,30 @@ func (s *Server) handleStream(t transport.ServerTransport, stream *transport.Str
+ 	}
+ 
+ 	sm := stream.Method()
+-	if sm != "" && sm[0] == '/' {
++	if sm == "" {
++		s.handleMalformedMethodName(t, stream, ti)
++		return
++	}
++	if sm[0] != '/' {
++		// TODO(easwars): Add a link to the CVE in the below log messages once
++		// published.
++		if envconfig.DisableStrictPathChecking {
++			if old := s.strictPathCheckingLogEmitted.Swap(true); !old {
++				channelz.Warningf(logger, s.channelzID, "grpc: Server.handleStream received malformed method name %q. Allowing it because the environment variable GRPC_GO_EXPERIMENTAL_DISABLE_STRICT_PATH_CHECKING is set to true, but this option will be removed in a future release.", sm)
++			}
++		} else {
++			if old := s.strictPathCheckingLogEmitted.Swap(true); !old {
++				channelz.Warningf(logger, s.channelzID, "grpc: Server.handleStream rejected malformed method name %q. To temporarily allow such requests, set the environment variable GRPC_GO_EXPERIMENTAL_DISABLE_STRICT_PATH_CHECKING to true. Note that this is not recommended as it may allow requests to bypass security policies.", sm)
++			}
++			s.handleMalformedMethodName(t, stream, ti)
++			return
++		}
++	} else {
+ 		sm = sm[1:]
+ 	}
+ 	pos := strings.LastIndex(sm, "/")
+ 	if pos == -1 {
+-		if ti != nil {
+-			ti.tr.LazyLog(&fmtStringer{"Malformed method name %q", []any{sm}}, true)
+-			ti.tr.SetError()
+-		}
+-		errDesc := fmt.Sprintf("malformed method name: %q", stream.Method())
+-		if err := t.WriteStatus(stream, status.New(codes.Unimplemented, errDesc)); err != nil {
+-			if ti != nil {
+-				ti.tr.LazyLog(&fmtStringer{"%v", []any{err}}, true)
+-				ti.tr.SetError()
+-			}
+-			channelz.Warningf(logger, s.channelzID, "grpc: Server.handleStream failed to write status: %v", err)
+-		}
+-		if ti != nil {
+-			ti.tr.Finish()
+-		}
++		s.handleMalformedMethodName(t, stream, ti)
+ 		return
+ 	}
+ 	service := sm[:pos]
+diff --git a/test/malformed_method_test.go b/test/malformed_method_test.go
+new file mode 100644
+index 00000000..25a09ccb
+--- /dev/null
++++ b/test/malformed_method_test.go
+@@ -0,0 +1,178 @@
++/*
++ *
++ * Copyright 2026 gRPC authors.
++ *
++ * Licensed under the Apache License, Version 2.0 (the "License");
++ * you may not use this file except in compliance with the License.
++ * You may obtain a copy of the License at
++ *
++ *     http://www.apache.org/licenses/LICENSE-2.0
++ *
++ * Unless required by applicable law or agreed to in writing, software
++ * distributed under the License is distributed on an "AS IS" BASIS,
++ * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++ * See the License for the specific language governing permissions and
++ * limitations under the License.
++ *
++ */
++
++package test
++
++import (
++	"bytes"
++	"context"
++	"net"
++	"testing"
++
++	"golang.org/x/net/http2"
++	"golang.org/x/net/http2/hpack"
++	"google.golang.org/grpc/internal/envconfig"
++	"google.golang.org/grpc/internal/stubserver"
++
++	testpb "google.golang.org/grpc/interop/grpc_testing"
++)
++
++// TestMalformedMethodPath tests that the server responds with Unimplemented
++// when the method path is malformed. This verifies that the server does not
++// route requests with a malformed method path to the application handler.
++func (s) TestMalformedMethodPath(t *testing.T) {
++	tests := []struct {
++		name       string
++		path       string
++		envVar     bool
++		wantStatus string // string representation of codes.Code
++	}{
++		{
++			name:       "missing_leading_slash_disableStrictPathChecking_false",
++			path:       "grpc.testing.TestService/UnaryCall",
++			wantStatus: "12", // Unimplemented
++		},
++		{
++			name:       "empty_path_disableStrictPathChecking_false",
++			path:       "",
++			wantStatus: "12", // Unimplemented
++		},
++		{
++			name:       "just_slash_disableStrictPathChecking_false",
++			path:       "/",
++			wantStatus: "12", // Unimplemented
++		},
++		{
++			name:       "missing_leading_slash_disableStrictPathChecking_true",
++			path:       "grpc.testing.TestService/UnaryCall",
++			envVar:     true,
++			wantStatus: "0", // OK
++		},
++		{
++			name:       "empty_path_disableStrictPathChecking_true",
++			path:       "",
++			envVar:     true,
++			wantStatus: "12", // Unimplemented
++		},
++		{
++			name:       "just_slash_disableStrictPathChecking_true",
++			path:       "/",
++			envVar:     true,
++			wantStatus: "12", // Unimplemented
++		},
++	}
++
++	for _, tc := range tests {
++		t.Run(tc.name, func(t *testing.T) {
++			ctx, cancel := context.WithTimeout(context.Background(), defaultTestTimeout)
++			defer cancel()
++
++			origDisableStrictPathChecking := envconfig.DisableStrictPathChecking
++			envconfig.DisableStrictPathChecking = tc.envVar
++			defer func() { envconfig.DisableStrictPathChecking = origDisableStrictPathChecking }()
++
++			ss := &stubserver.StubServer{
++				UnaryCallF: func(context.Context, *testpb.SimpleRequest) (*testpb.SimpleResponse, error) {
++					return &testpb.SimpleResponse{Payload: &testpb.Payload{Body: []byte("pwned")}}, nil
++				},
++			}
++			if err := ss.Start(nil); err != nil {
++				t.Fatalf("Error starting endpoint server: %v", err)
++			}
++			defer ss.Stop()
++
++			// Open a raw TCP connection to the server and speak HTTP/2 directly.
++			tcpConn, err := net.Dial("tcp", ss.Address)
++			if err != nil {
++				t.Fatalf("Failed to dial tcp: %v", err)
++			}
++			defer tcpConn.Close()
++
++			// Write the HTTP/2 connection preface and the initial settings frame.
++			if _, err := tcpConn.Write([]byte("PRI * HTTP/2.0\r\n\r\nSM\r\n\r\n")); err != nil {
++				t.Fatalf("Failed to write preface: %v", err)
++			}
++			framer := http2.NewFramer(tcpConn, tcpConn)
++			if err := framer.WriteSettings(); err != nil {
++				t.Fatalf("Failed to write settings: %v", err)
++			}
++
++			// Encode and write the HEADERS frame.
++			var headerBuf bytes.Buffer
++			enc := hpack.NewEncoder(&headerBuf)
++			writeHeader := func(name, value string) {
++				enc.WriteField(hpack.HeaderField{Name: name, Value: value})
++			}
++			writeHeader(":method", "POST")
++			writeHeader(":scheme", "http")
++			writeHeader(":authority", ss.Address)
++			writeHeader(":path", tc.path)
++			writeHeader("content-type", "application/grpc")
++			writeHeader("te", "trailers")
++			if err := framer.WriteHeaders(http2.HeadersFrameParam{
++				StreamID:      1,
++				BlockFragment: headerBuf.Bytes(),
++				EndStream:     false,
++				EndHeaders:    true,
++			}); err != nil {
++				t.Fatalf("Failed to write headers: %v", err)
++			}
++
++			// Send a small gRPC-encoded data frame (0 length).
++			if err := framer.WriteData(1, true, []byte{0, 0, 0, 0, 0}); err != nil {
++				t.Fatalf("Failed to write data: %v", err)
++			}
++
++			// Read responses and look for grpc-status.
++			gotStatus := ""
++			dec := hpack.NewDecoder(4096, func(f hpack.HeaderField) {
++				if f.Name == "grpc-status" {
++					gotStatus = f.Value
++				}
++			})
++			done := make(chan struct{})
++			go func() {
++				defer close(done)
++				for {
++					frame, err := framer.ReadFrame()
++					if err != nil {
++						return
++					}
++					if headers, ok := frame.(*http2.HeadersFrame); ok {
++						if _, err := dec.Write(headers.HeaderBlockFragment()); err != nil {
++							return
++						}
++						if headers.StreamEnded() {
++							return
++						}
++					}
++				}
++			}()
++
++			select {
++			case <-done:
++			case <-ctx.Done():
++				t.Fatalf("Timed out waiting for response")
++			}
++
++			if gotStatus != tc.wantStatus {
++				t.Errorf("Got grpc-status %v, want %v", gotStatus, tc.wantStatus)
++			}
++		})
++	}
++}
+-- 
+2.35.6
diff --git a/recipes-devtools/go/grpc-go_git.bb b/recipes-devtools/go/grpc-go_git.bb
index fdfc230..ec37890 100644
--- a/recipes-devtools/go/grpc-go_git.bb
+++ b/recipes-devtools/go/grpc-go_git.bb
@@ -7,7 +7,9 @@ LIC_FILES_CHKSUM = "file://src/${PKG_NAME}/LICENSE;md5=3b83ef96387f14655fc854ddc
 SRCNAME = "grpc-go"
 
 PKG_NAME = "google.golang.org/grpc"
-SRC_URI = "git://github.com/grpc/${SRCNAME}.git;destsuffix=git/src/${PKG_NAME};branch=v1.59.x;protocol=https"
+SRC_URI = "git://github.com/grpc/${SRCNAME}.git;destsuffix=git/src/${PKG_NAME};branch=v1.59.x;protocol=https \
+           file://CVE-2026-33186.patch;patchdir=src/${PKG_NAME} \
+           "
 
 SRCREV = "7765221f4bf6104973db7946d56936cf838cad46"
 PV = "1.59.0+git"
@@ -20,7 +22,7 @@ do_compile() {
 
 do_install() {
 	install -d ${D}${prefix}/local/go/src/${PKG_NAME}
-	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go"); do
+	for j in $(cd ${S} && find src/${PKG_NAME} -name "*.go" ! -path "*/.pc/*"); do
 	    if [ ! -d ${D}${prefix}/local/go/$(dirname $j) ]; then
 	        mkdir -p ${D}${prefix}/local/go/$(dirname $j)
 	    fi
-- 
2.35.6


