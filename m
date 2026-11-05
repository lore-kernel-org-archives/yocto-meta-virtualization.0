Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28299.1793858431524286831
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 22:00:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PSn4yOOI;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8765; q=dns/txt;
  s=iport01; t=1793858431; x=1795068031;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=z2dPS3Ym1GFvYWz1Lgr5YWJWLB1bwoqwH6b1bDb1EVk=;
  b=PSn4yOOI1EQ/6KgcPjMYRVlwrRjK3UYCoojZUWv8vpJnBudyhRQNafDC
   iELOPvLShjXw+rB/pLk2ycwq9P4AX7ud0/RYiRoHqfli/tf51VJNRP5ij
   6BwDZIYg2pcZXwig3fa0hTP9b6N5lAztAzNHY8/R7VqavzlmLKX9zel60
   j8R/x5XsmC3w83QS/cnjR+2idpNWNay0s3JAWE/SfC0zrMDDrXyh4PwTG
   N/L6Ir9TCfh3lWuCas0rGyIFvv95narApjuONKNXwbIEy0opBex4XOmuR
   P4dmnKMDbYyo0LSJD7w79x/e+oxwKO6TEtLWJFqkLBO80/nF5zGMuWT/E
   w==;
X-CSE-ConnectionGUID: vmGnnx9BQYSh7G/1Mh6xxQ==
X-CSE-MsgGUID: /RX/mb+2TZO1z7ULdT8clw==
X-IPAS-Result: =?us-ascii?q?A0AaAABsGuxq/5UQJK1aHAEBAQEBAQcBARIBAQQEAQFMg?=
 =?us-ascii?q?TAHAQELAYJWdWFCSQOMb4c4giEDgROdDoF+DwEBAQ9EDQQBAYUFAk8VjTkCJ?=
 =?us-ascii?q?jQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDM?=
 =?us-ascii?q?gFWHAMBAi8rIwgRCIMCAYJ0AxG8P4IsgQGEftszAQsUAYE4AYU/iCNdGAGEf?=
 =?us-ascii?q?ScbG4FygRWCc3aBBUsBgRACiAQiBIIigQyBWh5ljBUCgVKGcUiBHgNZLAFVE?=
 =?us-ascii?q?w0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgR6BEoEHXYErKF4hgQiBdgKCU?=
 =?us-ascii?q?YIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBGjU8CSY/FQxkCxoFYQgCDQxyO?=
 =?us-ascii?q?RAwHiQvBRwmQBsKGBgNSBEsNxUZBD5uB5Ivgh9rBwF6EwEqAReBbAUfBZMuE?=
 =?us-ascii?q?ZAWgh6BOJ9cCiiDeIwklToaM4VbpRYLmH2LN4JTllGEaYFoPIFZcBU7gmcJS?=
 =?us-ascii?q?hkPjjmDa4I2zAw8NQsDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:dW+K0ape2xPPDGsi+BhsP32RhqpeBmJIZBIvgKrLsJaIsI4StFCzt
 garIBmGP66JamqhLY91bojnoENQ7ZeGyNI2SAZs/C0zRX8SpePIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOWn9T8jhfngqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYgDNNwJcaDpOtfva8E835pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0vhyLmdI5
 a0yEQE2bk+swLuTwOyrWtA506zPLOGzVG8eknhkyTecCbMtRorOBvyQo9RZxzw3wMtJGJ4yZ
 eJANmEpN0qGOkMJYwtGYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUozbHZ0FxhvC+
 Aoq+Uy+OCFdMdbckwa31Su+2dLrkR+rU4YNQejQGvlCxQf7KnYoIBgbSVL+v/ijllO3X9NNI
 lAV/SwGqakp6FftX972QxqgunmGsxUAHd1KHIUHBBqlw67Q5UOdQ2MDVDMEMYZgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:z8VJBa9UoA5ZGFDRTNxuk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:KfbSP2NeA5sZfe5DRixI8kgES+ocQ0bdk1iXemq4V3Z5cejA
X-Talos-MUID: =?us-ascii?q?9a23=3Aq8ucbA4FnPt+ztXgsHdp5VG3xowv2ZTpDUpOy6k?=
 =?us-ascii?q?0nJCWahFUNwvNhzCoF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="890080526"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 06:00:30 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 39D6C18000868
	for <meta-virtualization@lists.yoctoproject.org>; Thu,  5 Nov 2026 06:00:30 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 34BABCC1633; Thu,  5 Nov 2026 11:30:28 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 4/5] docker-moby: Fix CVE-2026-92543
Date: Thu,  5 Nov 2026 11:30:05 +0530
Message-Id: <20261105060006.1286469-4-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105060006.1286469-1-deeratho@cisco.com>
References: <20261105060006.1286469-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 06:00:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10147
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream Docker 29.x backport for
CVE-2026-92543. The upstream fix commit is referenced in [1], and the
public CVE advisory is referenced in [2].

Require every DNS-resolved registry address to match an insecure CIDR
before treating the registry as insecure. This prevents a mixed loopback
and non-loopback DNS response from disabling TLS.

[1] https://github.com/moby/moby/commit/fa42933fd5c2eda65cedbdf84657e77fa860530b
[2] https://github.com/moby/moby/security/advisories/GHSA-7cfq-22r6-qp73

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 recipes-containers/docker/docker-moby_git.bb  |   1 +
 .../docker/files/CVE-2026-92543.patch         | 163 ++++++++++++++++++
 2 files changed, 164 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2026-92543.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 9c5e807c..26123ab6 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -65,6 +65,7 @@ SRC_URI = "\
         file://CVE-2026-17106-dependent_p3.patch;patchdir=src/import \
         file://CVE-2026-17106.patch;patchdir=src/import \
         file://CVE-2026-17106-regression.patch;patchdir=src/import \
+        file://CVE-2026-92543.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2026-92543.patch b/recipes-containers/docker/files/CVE-2026-92543.patch
new file mode 100644
index 00000000..0c82ddc4
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-92543.patch
@@ -0,0 +1,163 @@
+From 49dfd3f63ba224eda8961a0297062d12ba7b1111 Mon Sep 17 00:00:00 2001
+From: Sebastiaan van Stijn <github@gone.nl>
+Date: Mon, 7 Sep 2026 20:55:25 +0200
+Subject: [PATCH] daemon/pkg/registry: require all resolved addresses to be
+ insecure
+
+Only consider a registry insecure through CIDR matching when all of its
+resolved IP addresses match a configured insecure subnet.
+
+This prevents a registry that resolves to both loopback and non-loopback
+addresses from falling back to insecure requests.
+
+CVE: CVE-2026-92543
+Upstream-Status: Backport [https://github.com/moby/moby/commit/fa42933fd5c2eda65cedbdf84657e77fa860530b]
+
+Backport Changes:
+- Adapted `registry_test.go` for the target's older positional test table
+  and existing address fixtures. The three security cases are retained;
+  upstream's 26 added test lines become 11 branch-compatible additions.
+
+Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
+(cherry picked from commit db9f143dae0692f11ee7a2d32cdc9066049a673b)
+Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
+(cherry picked from commit fa42933fd5c2eda65cedbdf84657e77fa860530b)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ daemon/pkg/registry/config.go        | 66 +++++++++++++++-------------
+ daemon/pkg/registry/registry_test.go | 11 +++++
+ 2 files changed, 46 insertions(+), 31 deletions(-)
+
+diff --git a/daemon/pkg/registry/config.go b/daemon/pkg/registry/config.go
+index 4e230bd1be..a0909b670e 100644
+--- a/daemon/pkg/registry/config.go
++++ b/daemon/pkg/registry/config.go
+@@ -196,17 +196,18 @@ func (config *serviceConfig) loadInsecureRegistries(registries []string) error {
+ 	return nil
+ }
+ 
+-// isSecureIndex returns false if the provided indexName is part of the list of insecure registries
++// isSecureIndex returns false if the provided indexName is part of the list of insecure registries.
+ // Insecure registries accept HTTP and/or accept HTTPS with certificates from unknown CAs.
+ //
+ // The list of insecure registries can contain an element with CIDR notation to specify a whole subnet.
+-// If the subnet contains one of the IPs of the registry specified by indexName, the latter is considered
+-// insecure.
++// If all IP addresses of the registry specified by indexName are contained in one or more of those
++// subnets, the registry is considered insecure. If any resolved IP address is not contained in an
++// insecure subnet, the registry is considered secure.
+ //
+ // indexName should be a URL.Host (`host:port` or `host`) where the `host` part can be either a domain name
+-// or an IP address. If it is a domain name, then it will be resolved in order to check if the IP is contained
+-// in a subnet. If the resolving is not successful, isSecureIndex will only try to match hostname to any element
+-// of insecureRegistries.
++// or an IP address. If it is a domain name, then it will be resolved in order to check its IP addresses
++// against the configured subnets. If resolution is not successful, isSecureIndex will only try to match
++// the hostname to an element of insecureRegistries.
+ func (config *serviceConfig) isSecureIndex(indexName string) bool {
+ 	// Check for configured index, first.  This is needed in case isSecureIndex
+ 	// is called from anything besides newIndexInfo, in order to honor per-index configurations.
+@@ -220,45 +221,48 @@ func (config *serviceConfig) isSecureIndex(indexName string) bool {
+ // for mocking in unit tests.
+ var lookupIP = net.LookupIP
+ 
+-// isCIDRMatch returns true if urlHost matches an element of cidrs. urlHost is a URL.Host ("host:port" or "host")
+-// where the `host` part can be either a domain name or an IP address. If it is a domain name, then it will be
+-// resolved to IP addresses for matching. If resolution fails, false is returned.
++// isCIDRMatch returns true if all IP addresses for urlHost match an element of
++// cidrs. urlHost is a URL.Host ("host:port" or "host"), where the host part can
++// be either a domain name or an IP address. Domain names are resolved before
++// matching. If resolution fails, or no addresses are returned, false is returned.
+ func isCIDRMatch(cidrs []netip.Prefix, urlHost string) bool {
+ 	if len(cidrs) == 0 {
+ 		return false
+ 	}
+ 
+-	host, _, err := net.SplitHostPort(urlHost)
+-	if err != nil {
+-		// Assume urlHost is a host without port and go on.
+-		host = urlHost
++	host := urlHost
++	if h, _, err := net.SplitHostPort(urlHost); err == nil {
++		// urlHost includes a port; use only the host for matching.
++		host = h
+ 	}
+ 
+-	addresses := make(map[netip.Addr]struct{})
+ 	if ip, err := netip.ParseAddr(host); err == nil {
+-		// Host is an IP-address.
+-		addresses[ip] = struct{}{}
+-	} else {
+-		// Try to resolve the host's IP-address.
+-		ips, err := lookupIP(host)
+-		if err != nil {
+-			// We failed to resolve the host; assume there's no match.
++		// host is an IP-address.
++		return matchesCIDR(cidrs, ip)
++	}
++
++	// Try to resolve the host's IP-address.
++	ips, err := lookupIP(host)
++	if err != nil || len(ips) == 0 {
++		// We failed to resolve the host; assume there's no match.
++		return false
++	}
++	for _, ip := range ips {
++		addr, ok := netip.AddrFromSlice(ip)
++		if !ok || !matchesCIDR(cidrs, addr) {
+ 			return false
+ 		}
+-		for _, ip := range ips {
+-			addr, _ := netip.AddrFromSlice(ip)
+-			addresses[addr] = struct{}{}
+-		}
+ 	}
++	return true
++}
+ 
+-	for addr := range addresses {
+-		for _, ipnet := range cidrs {
+-			if ipnet.Contains(addr.Unmap()) {
+-				return true
+-			}
++func matchesCIDR(cidrs []netip.Prefix, addr netip.Addr) bool {
++	addr = addr.Unmap()
++	for _, prefix := range cidrs {
++		if prefix.Contains(addr) {
++			return true
+ 		}
+ 	}
+-
+ 	return false
+ }
+ 
+diff --git a/daemon/pkg/registry/registry_test.go b/daemon/pkg/registry/registry_test.go
+index 9ad2d78ae7..7ab3ec6125 100644
+--- a/daemon/pkg/registry/registry_test.go
++++ b/daemon/pkg/registry/registry_test.go
+@@ -21,6 +21,14 @@ func overrideLookupIP(t *testing.T) {
+ 			"localhost":   {net.ParseIP("127.0.0.1"), net.ParseIP("::1")},
+ 			"example.com": {net.ParseIP("42.42.42.42")},
+ 			"other.com":   {net.ParseIP("43.43.43.43")},
++			"loopback.example": {
++				net.ParseIP("127.0.0.2"),
++				net.ParseIP("::1"),
++			},
++			"mixed.example": {
++				net.ParseIP("127.0.0.1"),
++				net.ParseIP("192.0.2.1"),
++			},
+ 		}
+ 		if addrs, ok := mockHosts[host]; ok {
+ 			return addrs, nil
+@@ -100,6 +108,9 @@ func TestIsSecureIndex(t *testing.T) {
+ 		{"invalid.example.com", []string{"invalid.example.com"}, false},
+ 		{"invalid.example.com:5000", []string{"invalid.example.com"}, true},
+ 		{"invalid.example.com:5000", []string{"invalid.example.com:5000"}, false},
++		{"loopback.example", []string{"127.0.0.0/8", "::1/128"}, false},
++		{"mixed.example", []string{"127.0.0.0/8", "192.0.2.0/24"}, false},
++		{"mixed.example", []string{"127.0.0.0/8"}, true},
+ 	}
+ 	for _, tc := range tests {
+ 		config, err := newServiceConfig(ServiceOptions{
+
-- 
2.35.6

