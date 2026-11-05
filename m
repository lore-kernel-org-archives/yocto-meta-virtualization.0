Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28115.1793858433026265064
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 22:00:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=RghTgdQm;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=23292; q=dns/txt;
  s=iport01; t=1793858434; x=1795068034;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=jDOCl2bFVnRrGQJU2Y5OawpmBRBnp9K6SdMct4PY7T4=;
  b=RghTgdQm+TPCvDtsfIJsknPuTyvGGnMCk6t6SPaLnv6Zdigd5asQUnTo
   QSWGPMHap2Hz02fqMqyEi+hx3WfHiAIQaypDp8tVB/6GP7h4+8UCq1aid
   5dcILLFlG5lEsmoPb9Qntcl6RpaqAm9g70IrTWDgfb7Kk7AJF9TC1HjG3
   9B0GqLLiSXeGc+b9oRlxbF9PsmuqYs9ZfcSVAqmrZqqnV0OgoTG5YioIF
   q5gx3yu3sDkK/DwQrE/s6bkWtXG9T8vDHOS2UWtJDFryrBCHh0XF4+TDh
   maob0yX2NJ7BFXstVKpUIsFzSySJtxi8KL+drU+9gvybQgCg3K5HJX1Tx
   A==;
X-CSE-ConnectionGUID: kDPiyeshSgqkwrZ5NfMSRw==
X-CSE-MsgGUID: 6p/HxK5pTzO02Mw3M+zMcg==
X-IPAS-Result: =?us-ascii?q?A0AAAwBsGuxq/5QQJK1aglmCV3VhQkkDlCeCIQOBE50OF?=
 =?us-ascii?q?IFqDwEBAQ9EDQQBAYUFAo4dAiY2Bw4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAxoYAVYcAwECLysjCBEIgwIBgnQDEbw/giyBA?=
 =?us-ascii?q?YR+2zMBCxQBgTiFQIgjXRgBhH0HAR8bG4FygRWCc3aBBYFcAoEnHwGGPSIEg?=
 =?us-ascii?q?iKBDIFaHot1gQUCgVKGcUiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBB?=
 =?us-ascii?q?xsGBYEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJA?=
 =?us-ascii?q?RMaLAqBGjU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsNxUZB?=
 =?us-ascii?q?D5uB5IvghUKUhkHAQ1tEwEHJIEZAioIBAYhBQEPEg0HFZJ0Hh0wkXiBOJ9cC?=
 =?us-ascii?q?iiDeIwklToaM4VbnmaGMAuYfYs3glOVaWiEaYFvCyqBWXAVgyIJShkPWI1WC?=
 =?us-ascii?q?wuDYIdXxms8NQsDLwEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:xPoZ6atlPOfpar/8iLHnxH9A0efnVAZfMUV32f8akzHdYApBsoF/q
 tZmKT+HPqqLNDCheNEkb4W+pktTvZOGmN5qSQNuri4xQXgRgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb9Es11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw+cpPAHBD7
 vwjJykOcQqx2sS45YmBVbw57igjBJGD0II3s3Vky3TdSP0hW52GGvyM7t5D1zB2jcdLdRrcT
 5NGMnw0MlKZPVsWZgd/5JEWxI9EglHzfjBCoU6VooI84nPYy0p6172F3N/9KozbG54IzxfJz
 o7A1zrhRTEKF4GH9SiiqiiJmbTq3jHeU41HQdVU8dYv2jV/3Fc7DRAKXB6loOOll0e6WsBWN
 00T/AIqrLMu7wq6SdLhWAWip3yJtQJaXMBfe9DW8ymEzq7SpgLcDW8eQ3sYMZottdQ9Qnoh0
 Vrhc87VOAGDeYa9ERq1nop4ZxvoUcTJBQfuvRM5cDY=
IronPort-HdrOrdr: A9a23:lQoR8qHXe6ayVvshpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: 9a23:O2cE92CTlQW46gn6EypLzE8FF9slSXLEz2jKERKeB0NScqLAHA==
X-Talos-MUID: 9a23:5t96wAqczT5gur09LyUez296c+d4wPm2NFIqyc8jpJKhdj5VMDjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="889635999"
Received: from alln-l-core-11.cisco.com ([173.36.16.148])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 06:00:31 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-11.cisco.com (Postfix) with ESMTPS id 2E91C18000395
	for <meta-virtualization@lists.yoctoproject.org>; Thu,  5 Nov 2026 06:00:31 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 2EAF2CC1295; Thu,  5 Nov 2026 11:30:29 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 5/5] docker-moby: Fix CVE-2026-92542
Date: Thu,  5 Nov 2026 11:30:06 +0530
Message-Id: <20261105060006.1286469-5-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105060006.1286469-1-deeratho@cisco.com>
References: <20261105060006.1286469-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: alln-l-core-11.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 06:00:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10148
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

Backport the upstream fix that prevents forged VXLAN datagrams from
being marked for encrypted Swarm overlay transport. The fix enables
protection according to len(d.secMap), so its prerequisite is needed
to keep that count accurate: removeEncryption() must not create a
negative-reference entry for an unknown peer. The test follow-up is
included because its iptables cases pin the security-rule ordering,
peer lifecycle, and IPv6 behavior. Only NFT-specific tests are omitted
because Docker 29.3.0 has no NFT overlay backend. Wrynose also needed
NFT guard adaptations after compilation failed on undefined
nftables references.

[1] CVE fix: https://github.com/moby/moby/commit/1150173bb7e8c76866125aafe107eb3135e8e6eb
[2] Prerequisite: https://github.com/moby/moby/commit/526c515664c0bd13ccbc6ebade82b3d47624f211
[3] Test follow-up: https://github.com/moby/moby/commit/8af9fe3a36bab3e039862a2ab1cef1880c9b4d03
[4] Advisory: https://github.com/moby/moby/security/advisories/GHSA-6m9p-4h64-m6vh

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 recipes-containers/docker/docker-moby_git.bb  |   3 +
 .../files/CVE-2026-92542-dependent.patch      |  40 +++
 .../docker/files/CVE-2026-92542_p1.patch      | 163 ++++++++++++
 .../docker/files/CVE-2026-92542_p2.patch      | 246 ++++++++++++++++++
 4 files changed, 452 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2026-92542-dependent.patch
 create mode 100644 recipes-containers/docker/files/CVE-2026-92542_p1.patch
 create mode 100644 recipes-containers/docker/files/CVE-2026-92542_p2.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 26123ab6..1c75550e 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -66,6 +66,9 @@ SRC_URI = "\
         file://CVE-2026-17106.patch;patchdir=src/import \
         file://CVE-2026-17106-regression.patch;patchdir=src/import \
         file://CVE-2026-92543.patch;patchdir=src/import \
+        file://CVE-2026-92542-dependent.patch;patchdir=src/import \
+        file://CVE-2026-92542_p1.patch;patchdir=src/import \
+        file://CVE-2026-92542_p2.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2026-92542-dependent.patch b/recipes-containers/docker/files/CVE-2026-92542-dependent.patch
new file mode 100644
index 00000000..d76909fd
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-92542-dependent.patch
@@ -0,0 +1,40 @@
+From 526c515664c0bd13ccbc6ebade82b3d47624f211 Mon Sep 17 00:00:00 2001
+From: Cory Snider <csnider@mirantis.com>
+Date: Thu, 20 Aug 2026 13:23:47 -0400
+Subject: [PATCH] libn/d/overlay: fix secMap reference underflow
+
+If removeEncryption() is called more times than setupEncryption() for
+some remoteIP, a secMap entry for that address is created with a
+reference count of -1. Make removeEncryption() a no-op for non-encrypted
+addresses so len(d.secMap) is an accurate count of IPsec tunnels we have
+programmed.
+
+CVE: CVE-2026-92542
+Upstream-Status: Backport [https://github.com/moby/moby/commit/526c515664c0bd13ccbc6ebade82b3d47624f211]
+
+Signed-off-by: Cory Snider <csnider@mirantis.com>
+Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
+(cherry picked from commit 02ce193f9f3d7dd2c0197a7fc7dc41eee220c847)
+Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
+(cherry picked from commit 526c515664c0bd13ccbc6ebade82b3d47624f211)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ daemon/libnetwork/drivers/overlay/encryption.go | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/daemon/libnetwork/drivers/overlay/encryption.go b/daemon/libnetwork/drivers/overlay/encryption.go
+index 8c7d672349..0f4f46b2fe 100644
+--- a/daemon/libnetwork/drivers/overlay/encryption.go
++++ b/daemon/libnetwork/drivers/overlay/encryption.go
+@@ -170,7 +170,10 @@ func (d *driver) removeEncryption(remoteIP netip.Addr) error {
+ 	defer d.encrMu.Unlock()
+ 
+ 	var spi []spi
+-	node := d.secMap[remoteIP]
++	node, ok := d.secMap[remoteIP]
++	if !ok {
++		return nil
++	}
+ 	if node.count == 1 {
+ 		delete(d.secMap, remoteIP)
+ 		spi = node.spi
diff --git a/recipes-containers/docker/files/CVE-2026-92542_p1.patch b/recipes-containers/docker/files/CVE-2026-92542_p1.patch
new file mode 100644
index 00000000..5ab56283
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-92542_p1.patch
@@ -0,0 +1,163 @@
+From 92f82db99fd768bc6289eae86131b092cb21c4e8 Mon Sep 17 00:00:00 2001
+From: Cory Snider <csnider@mirantis.com>
+Date: Tue, 11 Aug 2026 12:55:54 -0400
+Subject: [PATCH] libn/d/overlay: don't encrypt forged VXLAN dgrams
+
+The firewall rules which mark VXLAN datagrams for encryption do not
+differentiate between datagrams sent by the kernel and datagrams sent by
+user processes. An unprivileged process in a Swarm node's host network
+namespace can blindly inject arbitrary Ethernet frames into a peer's
+encrypted overlay network simply by sending a forged VXLAN datagram to
+the victim node in cleartext. Processes with CAP_NET_RAW can also use
+setsockopt(SO_MARK) to mark all packets sent over a socket for
+encryption. The forged datagram is encrypted before it is sent over the
+wire -- a confused deputy problem.
+
+Clear the encryption mark from packets we did not mark ourselves that
+would otherwise match our XFRM policy and stop marking packets for
+encryption which are associated with a socket.
+
+CVE: CVE-2026-92542
+Upstream-Status: Backport [https://github.com/moby/moby/commit/1150173bb7e8c76866125aafe107eb3135e8e6eb]
+
+Backport Changes:
+- Omitted the `encryption_nft_linux.go` hunk because Docker 29.3.0 has no
+  NFT overlay-encryption backend.
+- Removed the three `nftables.Enabled()` guards from the retained iptables
+  logic. The Wrynose compile log reports `undefined: nftables` at
+  `encryption.go:139`, `:209`, and `:537`; the iptables-only target needs no
+  backend guard.
+- Keep the spoof-protection rule installed until `clearEncryptionStates()`
+  removes stale XFRM state and policies. Removing protection first could leave
+  stale broad iptables marking rules able to encrypt forged VXLAN datagrams
+  during the key reset.
+
+Signed-off-by: Cory Snider <csnider@mirantis.com>
+Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
+(cherry picked from commit 7661845b294b7dc0dcfda5b755cd99a65ef511b8)
+Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
+(cherry picked from commit 1150173bb7e8c76866125aafe107eb3135e8e6eb)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ .../libnetwork/drivers/overlay/encryption.go  | 80 ++++++++++++++++++-
+ 1 file changed, 78 insertions(+), 2 deletions(-)
+
+diff --git a/daemon/libnetwork/drivers/overlay/encryption.go b/daemon/libnetwork/drivers/overlay/encryption.go
+index 258ae3b92d..5783c9459b 100644
+--- a/daemon/libnetwork/drivers/overlay/encryption.go
++++ b/daemon/libnetwork/drivers/overlay/encryption.go
+@@ -132,6 +132,16 @@ func (d *driver) setupEncryption(remoteIP netip.Addr) error {
+ 	d.mu.Unlock()
+ 	log.G(context.TODO()).Debugf("Programming encryption between %s and %s", localIP, remoteIP)
+ 
++	// Block userspace from marking arbitrary packets for encryption using
++	// the security association we are about to program into the kernel.
++	// We only need to dynamically program this rule in iptables mode.
++	// Install this rule while encrypted overlay peers are configured.
++	if len(d.secMap) == 0 {
++		if err := d.programMangleMarkSpoofProtection(true); err != nil {
++			return err
++		}
++	}
++
+ 	indices := make([]spi, 0, len(d.keys))
+ 
+ 	for i, k := range d.keys {
+@@ -195,6 +205,13 @@ func (d *driver) removeEncryption(remoteIP netip.Addr) error {
+ 			log.G(context.TODO()).Warn(err)
+ 		}
+ 	}
++
++	if len(d.secMap) == 0 {
++		if err := d.programMangleMarkSpoofProtection(false); err != nil {
++			return err
++		}
++	}
++
+ 	return nil
+ }
+ 
+@@ -225,15 +242,69 @@ func (d *driver) programMangle(vni uint32, add bool) error {
+ 		return err
+ 	}
+ 
++	// Clear out stale mangle rules which indiscriminately mark both
++	// authentic and forged VXLAN datagrams for encryption.
++	staleErr := iptable.ProgramRule(iptables.Mangle, chain, iptables.Delete, rule)
++	if staleErr != nil {
++		staleErr = fmt.Errorf("could not clear old mangle rule: %w", staleErr)
++	}
++
++	if !add {
++		a = iptables.Delete
++		action = "remove"
++	}
++
++	// Mark authentic VXLAN packets to be encrypted, skipping forged packets
++	// with the same VNI.
++	//
++	// Only packets sent from this network namespace are evaluated by the
++	// OUTPUT chain so we do not need to explicitly guard against marking
++	// forged packets sent by processes from other network namespaces. We
++	// only need to distinguish authentic packets encapsulated by our VXLAN
++	// links (which are sent from this network namespace) from forged
++	// packets sent by processes in this network namespace. All forged
++	// packets processed by the OUTPUT chain will match --socket-exists. Our
++	// authentic VXLAN packets will not match as they are associated with
++	// foreign sockets from containers' namespaces or with no socket at all
++	// (always the case on Linux v4.18 and earlier, which scrubbed socket
++	// associations when crossing netns boundaries).
++	rule = append([]string{"-m", "owner", "!", "--socket-exists"}, rule...)
++	err = iptable.ProgramRule(iptables.Mangle, chain, a, rule)
++	if err != nil {
++		err = fmt.Errorf("could not %s mangle rule: %w", action, err)
++	}
++	return errors.Join(staleErr, err)
++}
++
++func (d *driver) programMangleMarkSpoofProtection(add bool) error {
++	a := iptables.Append
++	action := "install"
+ 	if !add {
+ 		a = iptables.Delete
+ 		action = "remove"
+ 	}
+ 
+-	if err := iptable.ProgramRule(iptables.Mangle, chain, a, rule); err != nil {
+-		return fmt.Errorf("could not %s mangle rule: %w", action, err)
++	iptable, err := d.transportIPTable()
++	if err != nil {
++		// Fail closed if unsure. Better safe than cleartext.
++		return err
+ 	}
+ 
++	// Block processes in the host netns with CAP_NET_RAW from using
++	// setsockopt(SO_MARK) to encrypt forged packets and neutralize any
++	// exploitable mangle rules earlier in the chain left over from old
++	// daemon versions. We do not need to guard against forged packets from
++	// other network namespaces as any packet marks are scrubbed when the
++	// packet crosses the netns boundary.
++	clearUserspaceMarkRule := []string{
++		"-p", "udp", "--dport", strconv.FormatUint(uint64(overlayutils.VXLANUDPPort()), 10),
++		"-m", "owner", "--socket-exists",
++		"-m", "mark", "--mark", strconv.FormatUint(mark, 10),
++		"-j", "MARK", "--set-mark", "0",
++	}
++	if err := iptable.ProgramRule(iptables.Mangle, "OUTPUT", a, clearUserspaceMarkRule); err != nil {
++		return fmt.Errorf("could not %s mangle local-spoof-protection rule: %w", action, err)
++	}
+ 	return nil
+ }
+ 
+@@ -463,6 +534,11 @@ func (d *driver) setKeys(ctx context.Context, encrData discoverapi.DriverEncrypt
+ 
+ 	// Remove any stale policy, state
+ 	clearEncryptionStates()
++	if len(d.secMap) > 0 {
++		if err := d.programMangleMarkSpoofProtection(false); err != nil {
++			log.G(ctx).WithError(err).Warn("Failed to clear iptables local-spoof-protection rule")
++		}
++	}
+ 	// Accept the encryption keys and clear any stale encryption map
+ 	d.secMap = encrMap{}
+ 	d.keys = keys
diff --git a/recipes-containers/docker/files/CVE-2026-92542_p2.patch b/recipes-containers/docker/files/CVE-2026-92542_p2.patch
new file mode 100644
index 00000000..bc88a022
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-92542_p2.patch
@@ -0,0 +1,246 @@
+From 8af9fe3a36bab3e039862a2ab1cef1880c9b4d03 Mon Sep 17 00:00:00 2001
+From: Cory Snider <csnider@mirantis.com>
+Date: Fri, 21 Aug 2026 10:10:27 -0400
+Subject: [PATCH] libn/d/overlay: test encryption firewall rulesets
+
+Add coverage for the firewall rules which mark VXLAN datagrams for
+encryption. Each test joins a fresh network namespace and programs the
+rules into the kernel, so the rulesets are asserted as the kernel renders
+them rather than as the driver constructs them.
+
+Two orderings are load-bearing for the correctness of the rules, and
+neither was pinned by anything but a comment:
+
+ - In iptables mode the rule which strips the encryption mark from
+   socket-associated datagrams has to be evaluated after every rule which
+   sets that mark, so that it neutralizes the unrestricted rules left
+   behind by daemons predating the mark-spoofing fix. Reverting
+   programMangleMarkSpoofProtection() to insert its rule at the head of
+   the chain rather than appending it fails
+   TestMangleMarkSpoofProtectionOrdering.
+
+ - In nftables mode the socket-exists predicate and the statement which
+   clears the mark have to precede the mark-setting statement in the
+   enc-out chain. The rendered ruleset is asserted against golden files.
+
+The remaining cases cover replacing a legacy rule with the restricted
+one, the install and removal lifecycle for two VNIs, and the selection of
+ip6tables when the Swarm data plane is IPv6.
+
+CVE: CVE-2026-92542
+Upstream-Status: Backport [https://github.com/moby/moby/commit/8af9fe3a36bab3e039862a2ab1cef1880c9b4d03]
+
+Backport Changes:
+- Kept the upstream iptables regression coverage in this patch. Omitted
+  `encryption_nft_linux_test.go` and its two NFT golden files because
+  Docker 29.3.0 has no NFT overlay backend. The retained tests cover
+  legacy-rule replacement, mark-clear ordering, lifecycle, and IPv6.
+
+Signed-off-by: Cory Snider <csnider@mirantis.com>
+Assisted-By: Claude Opus 5
+Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
+(cherry picked from commit fda66a3bc0e742b1f82a6750f6f2f56c6b6adb53)
+Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
+(cherry picked from commit 8af9fe3a36bab3e039862a2ab1cef1880c9b4d03)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ .../drivers/overlay/encryption_linux_test.go  | 187 ++++++++++++++++++
+ 1 file changed, 187 insertions(+)
+ create mode 100644 daemon/libnetwork/drivers/overlay/encryption_linux_test.go
+
+diff --git a/daemon/libnetwork/drivers/overlay/encryption_linux_test.go b/daemon/libnetwork/drivers/overlay/encryption_linux_test.go
+new file mode 100644
+index 0000000000..3b4587b59a
+--- /dev/null
++++ b/daemon/libnetwork/drivers/overlay/encryption_linux_test.go
+@@ -0,0 +1,187 @@
++//go:build linux
++
++package overlay
++
++import (
++	"net/netip"
++	"slices"
++	"strconv"
++	"strings"
++	"testing"
++
++	"github.com/moby/moby/v2/daemon/libnetwork/drivers/overlay/overlayutils"
++	"github.com/moby/moby/v2/daemon/libnetwork/iptables"
++	"github.com/moby/moby/v2/internal/testutil/netnsutils"
++	"gotest.tools/v3/assert"
++	is "gotest.tools/v3/assert/cmp"
++)
++
++// mangleOutputRules returns the rules programmed into the mangle table's OUTPUT
++// chain, in the order they are evaluated. The chain policy line is omitted so
++// that an empty chain yields an empty slice.
++func mangleOutputRules(t *testing.T, iptable *iptables.IPTable) []string {
++	t.Helper()
++	out, err := iptable.Raw("-t", string(iptables.Mangle), "-S", "OUTPUT")
++	assert.NilError(t, err)
++	var rules []string
++	for _, l := range strings.Split(strings.TrimSpace(string(out)), "\n") {
++		if strings.HasPrefix(l, "-A ") {
++			rules = append(rules, l)
++		}
++	}
++	return rules
++}
++
++// indexOfRule returns the index of the first rule containing substr, or -1.
++func indexOfRule(rules []string, substr string) int {
++	return slices.IndexFunc(rules, func(r string) bool {
++		return strings.Contains(r, substr)
++	})
++}
++
++// clearRuleMatch uniquely identifies the mark-stripping rule: it is the only
++// rule which *matches* on the encryption mark. Do not match on
++// "--socket-exists", which also appears in the marking rule as the inverted
++// "! --socket-exists".
++const clearRuleMatch = "-m mark --mark"
++
++// vniBytecode returns the xt_bpf bytecode which matches vni, as rendered into a
++// rule by iptables. It uniquely identifies the marking rule for a VNI.
++func vniBytecode(vni uint32) string {
++	return marshalXTBPF(vniMatchBPF(vni))
++}
++
++// legacyMangleRule returns the marking rule as programmed by daemons predating
++// the fix: it marks any VXLAN datagram with the given VNI for encryption,
++// without discriminating between datagrams sent by the kernel and datagrams
++// forged by a local process.
++func legacyMangleRule(vni uint32) []string {
++	return append(matchVXLAN(overlayutils.VXLANUDPPort(), vni),
++		"-j", "MARK", "--set-mark", strconv.FormatUint(mark, 10))
++}
++
++func seedLegacyMangleRule(t *testing.T, iptable *iptables.IPTable, vni uint32) {
++	t.Helper()
++	args := append([]string{"-t", string(iptables.Mangle), string(iptables.Append), "OUTPUT"},
++		legacyMangleRule(vni)...)
++	assert.NilError(t, iptable.RawCombinedOutput(args...),
++		"failed to seed legacy mangle rule (is xt_bpf available?)")
++}
++
++// TestProgramMangleReplacesLegacyRule asserts that programming the marking rule
++// for a VNI removes the unrestricted rule which a pre-fix daemon would have left
++// behind for the same VNI, rather than leaving both in place.
++func TestProgramMangleReplacesLegacyRule(t *testing.T) {
++	defer netnsutils.SetupTestOSContext(t)()
++
++	d := &driver{advertiseAddress: netip.MustParseAddr("192.0.2.1")}
++	iptable := iptables.GetIptable(iptables.IPv4)
++
++	const vni = 4096
++	seedLegacyMangleRule(t, iptable, vni)
++	assert.Assert(t, is.Len(mangleOutputRules(t, iptable), 1))
++
++	assert.NilError(t, d.programMangle(vni, true))
++
++	rules := mangleOutputRules(t, iptable)
++	assert.Assert(t, is.Len(rules, 1), "expected the legacy rule to be replaced, not duplicated:\n%s",
++		strings.Join(rules, "\n"))
++	assert.Check(t, strings.Contains(rules[0], vniBytecode(vni)), "wrong VNI: %s", rules[0])
++	assert.Check(t, strings.Contains(rules[0], "! --socket-exists"),
++		"marking rule must skip datagrams associated with a socket: %s", rules[0])
++}
++
++// TestMangleMarkSpoofProtectionOrdering asserts that the rule which strips the
++// encryption mark from socket-associated packets is evaluated *after* any rule
++// which sets that mark.
++//
++// Daemons predating this fix appended mangle rules which mark VXLAN datagrams
++// for encryption without discriminating between authentic datagrams and
++// datagrams forged by a local process. Such a rule survives an upgrade for any
++// VNI which is never reprogrammed on the node, so the mark-stripping rule has to
++// be evaluated after it in order to neutralize it. That is why
++// programMangleMarkSpoofProtection appends its rule instead of inserting it at
++// the head of the chain: an inserted rule would run *before* the stale rule and
++// would silently stop neutralizing it.
++func TestMangleMarkSpoofProtectionOrdering(t *testing.T) {
++	defer netnsutils.SetupTestOSContext(t)()
++
++	d := &driver{advertiseAddress: netip.MustParseAddr("192.0.2.1")}
++	iptable := iptables.GetIptable(iptables.IPv4)
++
++	// Seed an unrestricted marking rule for a VNI which the driver never
++	// programs, so nothing removes it.
++	const staleVNI = 4096
++	seedLegacyMangleRule(t, iptable, staleVNI)
++
++	assert.NilError(t, d.programMangleMarkSpoofProtection(true))
++
++	rules := mangleOutputRules(t, iptable)
++	staleIdx := indexOfRule(rules, vniBytecode(staleVNI))
++	clearIdx := indexOfRule(rules, clearRuleMatch)
++	assert.Assert(t, staleIdx >= 0, "stale marking rule not found in:\n%s", strings.Join(rules, "\n"))
++	assert.Assert(t, clearIdx >= 0, "mark-stripping rule not found in:\n%s", strings.Join(rules, "\n"))
++	assert.Check(t, staleIdx < clearIdx,
++		"mark-stripping rule (index %d) must be evaluated after the stale marking rule (index %d):\n%s",
++		clearIdx, staleIdx, strings.Join(rules, "\n"))
++}
++
++// TestProgramMangleLifecycle walks the rules through install and removal for two
++// VNIs, and pins the relative ordering of the marking and mark-stripping rules.
++func TestProgramMangleLifecycle(t *testing.T) {
++	defer netnsutils.SetupTestOSContext(t)()
++
++	d := &driver{advertiseAddress: netip.MustParseAddr("192.0.2.1")}
++	iptable := iptables.GetIptable(iptables.IPv4)
++
++	const vniA, vniB = 4096, 4097
++
++	// First encrypted network on the node: the marking rule is programmed
++	// when the subnet sandbox is set up, ...
++	assert.NilError(t, d.programMangle(vniA, true))
++	// ... and the mark-stripping rule when the first peer is discovered.
++	assert.NilError(t, d.programMangleMarkSpoofProtection(true))
++
++	rules := mangleOutputRules(t, iptable)
++	assert.Assert(t, is.Len(rules, 2), "%s", strings.Join(rules, "\n"))
++	assert.Check(t, is.Equal(indexOfRule(rules, vniBytecode(vniA)), 0), "%s", strings.Join(rules, "\n"))
++	assert.Check(t, is.Equal(indexOfRule(rules, clearRuleMatch), 1), "%s", strings.Join(rules, "\n"))
++
++	// A second encrypted network appends its marking rule after the
++	// mark-stripping rule. That is safe: the marking rule cannot mark a
++	// datagram associated with a socket, so it can never re-mark a datagram
++	// the mark-stripping rule has already cleared.
++	assert.NilError(t, d.programMangle(vniB, true))
++	rules = mangleOutputRules(t, iptable)
++	assert.Assert(t, is.Len(rules, 3), "%s", strings.Join(rules, "\n"))
++	assert.Check(t, indexOfRule(rules, clearRuleMatch) < indexOfRule(rules, vniBytecode(vniB)),
++		"%s", strings.Join(rules, "\n"))
++
++	// Removal leaves the chain as we found it.
++	assert.NilError(t, d.programMangle(vniA, false))
++	assert.NilError(t, d.programMangle(vniB, false))
++	assert.NilError(t, d.programMangleMarkSpoofProtection(false))
++	rules = mangleOutputRules(t, iptable)
++	assert.Check(t, is.Len(rules, 0), "%s", strings.Join(rules, "\n"))
++}
++
++// TestProgramMangleIPv6Transport asserts that the rules are programmed into
++// ip6tables, and not iptables, when the Swarm data plane is IPv6.
++func TestProgramMangleIPv6Transport(t *testing.T) {
++	defer netnsutils.SetupTestOSContext(t)()
++
++	d := &driver{advertiseAddress: netip.MustParseAddr("2001:db8::1")}
++
++	const vni = 4096
++	assert.NilError(t, d.programMangle(vni, true))
++	assert.NilError(t, d.programMangleMarkSpoofProtection(true))
++
++	rules6 := mangleOutputRules(t, iptables.GetIptable(iptables.IPv6))
++	assert.Assert(t, is.Len(rules6, 2), "%s", strings.Join(rules6, "\n"))
++	assert.Check(t, is.Equal(indexOfRule(rules6, vniBytecode(vni)), 0), "%s", strings.Join(rules6, "\n"))
++	assert.Check(t, is.Equal(indexOfRule(rules6, clearRuleMatch), 1), "%s", strings.Join(rules6, "\n"))
++
++	rules4 := mangleOutputRules(t, iptables.GetIptable(iptables.IPv4))
++	assert.Check(t, is.Len(rules4, 0), "IPv4 mangle OUTPUT should be untouched:\n%s",
++		strings.Join(rules4, "\n"))
++}
+-- 
+2.35.6
+
-- 
2.35.6

