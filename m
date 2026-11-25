Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38400.1795597246099958209
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 01:00:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=fnxTbex9;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10509; q=dns/txt;
  s=iport01; t=1795597246; x=1796806846;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=IvAtO0krZGpziirCh1wbD+7DK/KMICrgriuHTWe3q2U=;
  b=fnxTbex99+gcAsxwY6RgJ/3ldu9dggf+G6eohAg4T2V+CNuHcTMDd/9Y
   2G6wv9e+BmPgFbu/XJHs2dq7kSf3tylF+a9J/5cA4XKCybH3/RqtCOkyN
   jrBoYbZXQitYYJOyd3Ngwm9iQQzHPK/kTnxcQ0cMKtP4qC0zj4SlxaVQ4
   UgYkvuyfL0HxDUxSU/CGeNZDH5UdUYUcRf2wvq1mAy8s5VUhsujjVH711
   TGgUCAIfXljY1j/fi/M72QnjwZn/2zr9Gy1/6BxDHx72B0cOahUYQb5Az
   vQUoXG0FA1hqgRkvWuHQo7exr6RUTVbEoUmEgjYHtYR5k8U23n9dhuDv7
   A==;
X-CSE-ConnectionGUID: cV3z9kUyTNe8+raAgQJX7w==
X-CSE-MsgGUID: X/ytg0YuQ82oGmFQvIlMgA==
X-IPAS-Result: =?us-ascii?q?A0BNAgBmogZr/9VK/pBaHgE8DAILgWWCV3VhQkkDhFSPU?=
 =?us-ascii?q?4IhA54pgX4PAQEBD0QNBAEBhQUCjiICJjQJDgECBAMCAwEBAQEBAQEBAQEBA?=
 =?us-ascii?q?QoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDIw8BNCIcAwECAwImAgIrIwgQCYMCA?=
 =?us-ascii?q?YJ0AgERuG16gTKBAYR+2zMBCxQBgQouhUKDIAGFBF0YAYR+CB8bG4FygRWDa?=
 =?us-ascii?q?oEFgVwCgSeEFYJIIgSCIoEMgVQejHUCgUmIUkiBAhwDWSwBVRMNCgsHBYFoA?=
 =?us-ascii?q?zUSKhVuMh2BIzsXL1gbBgWBHIEegRKBA12BKyheIYEIgXUCglGCAAIBSUEOB?=
 =?us-ascii?q?0VTCSVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMBwkLwUZJ?=
 =?us-ascii?q?jwbCoEMJx0eGQ4CKQYWIQs0GA1IESw3FRkEPQFuB5QTgh98ASxOEwErVEc8J?=
 =?us-ascii?q?wUIFAgFBwqTHRuSLIE1n1wKKIN5jCSVOhozhVulGAuYfYs3glOVamiEaoFoP?=
 =?us-ascii?q?DmBIHAVgyIJShkPji0BCwuDYM5bIzULAy8BAQcCBwIMAwuBaJAAgR5gAQE?=
IronPort-Data: A9a23:4GmuH6wCXb65TxLN/tZ6t+dhxyrEfRIJ4+MujC+fZmUNrF6WrkUOx
 2MaXz3XM/mNYmvzLdglPIS0/BsGsMfdyNFhSgE//lhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaD9MsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJEoIZp9J+dtmPUdDp
 b8CIRkCVzKz2P3jldpXSsE07igiBMDmJsYb/3pn1zycVKxgSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNk2bC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+Oa3YYaJIozaLSlTtnbft
 37Jp1XkO0FAM/Oa5wOb03aJicaayEsXX6pXTtVU7MVChVCPzykNCQcKSFK/oOuwlk+5XfpbK
 lcI4Ww/qqMu81SxSdvwVAH+p2SL1iPwQPJZHvd/7ESGzbDZpl/DQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:l0PXpq7T5HsTTQuw/gPXwOrXdLJyesId70hD6qkXc20zTiX4rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: 9a23:PPm+YW6ur1PuyWJ0Ddss/3BPCJEmT2zh6nqAYFWxIGlQao3KVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3ArDO9lg8+wfxAi/a4zPxiQamQf/cv8rihUHEQqMV?=
 =?us-ascii?q?cvOaBGxVuGjO4gx3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="62944088"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 09:00:43 +0000
Received: from sjc-ads-2449.cisco.com (sjc-ads-2449.cisco.com [171.70.63.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id 75C2218000236
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 09:00:43 +0000 (GMT)
Received: by sjc-ads-2449.cisco.com (Postfix, from userid 1795984)
	id 25DF4CC12A7; Wed, 25 Nov 2026 01:00:42 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 2/3] docker-moby: fix CVE-2026-115538
Date: Wed, 25 Nov 2026 01:00:32 -0800
Message-Id: <20261125090033.2807645-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125090033.2807645-1-deeratho@cisco.com>
References: <20261125090033.2807645-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2449.cisco.com [171.70.63.137];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.63.137, sjc-ads-2449.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 09:00:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10181
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

Backport the upstream overlay firewall restoration fix for
CVE-2026-115538. The fix reinstalls iptables rules for encrypted overlay
networks after firewalld flushes them. The source uses an earlier overlay
driver layout, so this backport uses its existing iptables helpers. The
upstream fix and public advisory are referenced in [1] and [2].

[1] https://github.com/moby/moby/commit/f006a6abcf0558072802d0e0d5f8121fc4d96a10
[2] https://github.com/moby/moby/security/advisories/GHSA-6jhp-7446-hf7f

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 recipes-containers/docker/docker-moby_git.bb  |   1 +
 .../docker/files/CVE-2026-115538.patch        | 236 ++++++++++++++++++
 2 files changed, 237 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2026-115538.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 4c47a137..3b1eb025 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -66,6 +66,7 @@ SRC_URI = "\
         file://CVE-2026-92542_p2.patch;patchdir=src/import \
         file://CVE-2026-17106_p1.patch;patchdir=src/import \
         file://CVE-2026-17106_p2.patch;patchdir=src/import \
+        file://CVE-2026-115538.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2026-115538.patch b/recipes-containers/docker/files/CVE-2026-115538.patch
new file mode 100644
index 00000000..5a018de9
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-115538.patch
@@ -0,0 +1,236 @@
+From 9389f9b1bc843deabeb59b238be2665af57d654d Mon Sep 17 00:00:00 2001
+From: Cory Snider <csnider@mirantis.com>
+Date: Mon, 16 Nov 2026 00:49:13 -0800
+Subject: [PATCH] libn/d/overlay: reapply rules on firewalld reload
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With the iptables firewall backend, the overlay driver programs iptables
+rules which mark VXLAN datagrams of encrypted networks for encryption,
+drop cleartext VXLAN datagrams received for those networks, and strip
+the encryption mark from datagrams marked by local processes. A
+firewalld reload can flush these rules. The node then sends the
+network's VXLAN datagrams in cleartext and accepts forged cleartext
+datagrams for it until the last local endpoint of the network leaves and
+another joins, or the daemon restarts.
+
+On firewalld reload, restore all rules which were previously programmed
+by the overlay driver.
+
+CVE: CVE-2026-115538
+Upstream-Status: Backport [https://github.com/moby/moby/commit/f006a6abcf0558072802d0e0d5f8121fc4d96a10]
+
+Backport Changes:
+- Register rule restoration in the existing overlay configure path and
+  restore rules through the existing iptables helpers. The source does not
+  have upstream's nftables overlay-encryption implementation or the newer
+  driver/network-namespace refactor, so those unrelated changes are not
+  carried.
+- Keep the upstream firewalld integration test. Omit the upstream
+  encryption_linux_test.go changes because they require the newer driver
+  setup API; the integration test covers rule restoration.
+
+Signed-off-by: Cory Snider <csnider@mirantis.com>
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ .../libnetwork/drivers/overlay/encryption.go  | 53 ++++++++++++++
+ daemon/libnetwork/drivers/overlay/overlay.go  |  8 +-
+ integration/service/network_linux_test.go     | 77 +++++++++++++++++++++
+ 3 files changed, 137 insertions(+), 1 deletion(-)
+
+diff --git a/daemon/libnetwork/drivers/overlay/encryption.go b/daemon/libnetwork/drivers/overlay/encryption.go
+index 7bfdb852..95082a23 100644
+--- a/daemon/libnetwork/drivers/overlay/encryption.go
++++ b/daemon/libnetwork/drivers/overlay/encryption.go
+@@ -10,8 +10,10 @@ import (
+ 	"errors"
+ 	"fmt"
+ 	"hash/fnv"
++	"maps"
+ 	"net"
+ 	"net/netip"
++	"slices"
+ 	"strconv"
+ 	"syscall"
+ 
+@@ -351,6 +353,57 @@ func (d *driver) programInput(vni uint32, add bool) error {
+ 	return nil
+ }
+ 
++// restoreOverlayEncryptionFirewall restores the iptables rules for encryption,
++// which a firewalld reload may have deleted.
++func (d *driver) restoreOverlayEncryptionFirewall(ctx context.Context) {
++	d.encrMu.Lock()
++	if len(d.secMap) > 0 {
++		if err := d.programMangleMarkSpoofProtection(true); err != nil {
++			log.G(ctx).WithError(err).Error("Failed to restore iptables local-spoof-protection rule on firewalld reload")
++		}
++	}
++	d.encrMu.Unlock()
++
++	d.mu.Lock()
++	nids := slices.Collect(maps.Keys(d.networks))
++	d.mu.Unlock()
++
++	for _, nid := range nids {
++		d.restoreNetworkEncryptionFirewall(ctx, nid)
++	}
++}
++
++func (d *driver) restoreNetworkEncryptionFirewall(ctx context.Context, nid string) {
++	n, unlock, err := d.lockNetwork(nid)
++	if err != nil {
++		// Network deleted since the reload started, not an error.
++		return
++	}
++	defer unlock()
++
++	if !n.secure {
++		return
++	}
++
++	for _, s := range n.subnets {
++		if !s.sboxInit {
++			continue
++		}
++		// Do not roll back the mangle rule if the input rule cannot be restored.
++		// The network is still in use, and encrypting outgoing traffic is better
++		// than sending it in cleartext.
++		mangleErr := d.programMangle(s.vni, true)
++		inputErr := d.programInput(s.vni, true)
++		if err := errors.Join(mangleErr, inputErr); err != nil {
++			log.G(ctx).WithFields(log.Fields{
++				"network_id": n.id,
++				"vni":        s.vni,
++				"error":      err,
++			}).Error("Failed to restore iptables rules for encrypted overlay network on firewalld reload")
++		}
++	}
++}
++
+ func programSA(localIP, remoteIP net.IP, spi spi, k *key, dir int, add bool) (fSA *netlink.XfrmState, rSA *netlink.XfrmState, lastErr error) {
+ 	var (
+ 		action      = "Removing"
+diff --git a/daemon/libnetwork/drivers/overlay/overlay.go b/daemon/libnetwork/drivers/overlay/overlay.go
+index 770ded74..ffcbcbc9 100644
+--- a/daemon/libnetwork/drivers/overlay/overlay.go
++++ b/daemon/libnetwork/drivers/overlay/overlay.go
+@@ -13,6 +13,7 @@ import (
+ 
+ 	"github.com/moby/moby/v2/daemon/libnetwork/discoverapi"
+ 	"github.com/moby/moby/v2/daemon/libnetwork/driverapi"
++	"github.com/moby/moby/v2/daemon/libnetwork/iptables"
+ 	"github.com/moby/moby/v2/daemon/libnetwork/scope"
+ )
+ 
+@@ -68,7 +69,12 @@ func Register(r driverapi.Registerer) error {
+ 
+ func (d *driver) configure() error {
+ 	// Apply OS specific kernel configs if needed
+-	d.initOS.Do(applyOStweaks)
++	d.initOS.Do(func() {
++		applyOStweaks()
++		iptables.OnReloaded(func() {
++			d.restoreOverlayEncryptionFirewall(context.TODO())
++		})
++	})
+ 
+ 	return nil
+ }
+diff --git a/integration/service/network_linux_test.go b/integration/service/network_linux_test.go
+index 0e4f32e3..023c2211 100644
+--- a/integration/service/network_linux_test.go
++++ b/integration/service/network_linux_test.go
+@@ -3,6 +3,7 @@ package service
+ import (
+ 	stdnet "net"
+ 	"net/netip"
++	"slices"
+ 	"strings"
+ 	"testing"
+ 	"time"
+@@ -9,2 +10,3 @@ import (
+ 
++	"github.com/google/go-cmp/cmp"
+ 	"github.com/google/go-cmp/cmp/cmpopts"
+@@ -334,3 +336,78 @@ func TestRestoreIngressRulesOnFirewalldReload(t *testing.T) {
+ 	// It takes a while before this works ...
+ 	poll.WaitOn(t, checkHTTP, poll.WithTimeout(30*time.Second))
+ }
++
++// TestRestoreEncryptedOverlayRulesOnFirewalldReload checks that the iptables
++// rules for an encrypted overlay network are restored after a firewalld reload
++// deletes them.
++func TestRestoreEncryptedOverlayRulesOnFirewalldReload(t *testing.T) {
++	skip.If(t, testEnv.IsRemoteDaemon)
++	skip.If(t, testEnv.IsRootless, "rootless mode doesn't support Swarm-mode")
++	skip.If(t, testEnv.FirewallBackendDriver() != "iptables+firewalld", "test is for the iptables backend with firewalld")
++	skip.If(t, !networking.FirewalldRunning(), "Need firewalld to test restoration of encrypted overlay rules")
++	ctx := setupTest(t)
++
++	d := swarm.NewSwarm(ctx, t, testEnv, daemon.WithSwarmIptables(true))
++	defer d.Stop(t)
++	c := d.NewClientT(t)
++	defer c.Close()
++
++	type ruleset struct{ MangleOutput, FilterInput []string }
++	// The order of the rules does not matter as each rule in a chain
++	// matches a disjoint set of packets.
++	chainRules := func(table, chain string) []string {
++		t.Helper()
++		res := icmd.RunCommand("iptables", "-t", table, "-S", chain)
++		res.Assert(t, icmd.Success)
++		rules := strings.Split(strings.TrimSpace(res.Stdout()), "\n")
++		slices.Sort(rules)
++		return rules
++	}
++	dump := func() ruleset {
++		t.Helper()
++		return ruleset{
++			MangleOutput: chainRules("mangle", "OUTPUT"),
++			FilterInput:  chainRules("filter", "INPUT"),
++		}
++	}
++
++	// firewalld deletes the chain on reload if, and only if, the reload
++	// deletes Docker's iptables rules.
++	const markerChain = "TEST-FIREWALLD-RELOAD-MARKER"
++	t.Cleanup(func() { icmd.RunCommand("iptables", "-X", markerChain) })
++	reload := func() {
++		t.Helper()
++		icmd.RunCommand("iptables", "-N", markerChain).Assert(t, icmd.Success)
++		networking.FirewalldReload(t, d)
++		if icmd.RunCommand("iptables", "-S", markerChain).ExitCode == 0 {
++			t.Skip("firewalld reload does not delete iptables rules")
++		}
++	}
++
++	// Reload once before setting up the network to clear out any rules
++	// left behind by other daemons, which this daemon would not restore.
++	reload()
++	noNetwork := dump()
++
++	const netName = "test-enc-overlay-on-firewalld-reload"
++	net.CreateNoError(ctx, t, c, netName,
++		net.WithDriver("overlay"),
++		net.WithAttachable(),
++		net.WithOption("encrypted", ""),
++	)
++	defer func() {
++		_, err := c.NetworkRemove(ctx, netName, client.NetworkRemoveOptions{})
++		assert.NilError(t, err)
++	}()
++
++	// The rules are installed when the first endpoint joins the network.
++	ctrID := container.Run(ctx, t, c, container.WithNetworkMode(netName))
++	defer c.ContainerRemove(ctx, ctrID, client.ContainerRemoveOptions{Force: true})
++
++	want := dump()
++	assert.Assert(t, !cmp.Equal(want, noNetwork), "TEST BUG! No rules were installed for the encrypted network")
++
++	reload()
++	assert.Check(t, is.DeepEqual(dump(), want),
++		"the rules must be restored correctly after a firewalld reload")
++}
-- 
2.35.6

