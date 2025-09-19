Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F92CA1013
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 02:34:23 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.6676.1758249255257453154
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 19:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mcJLdxxD;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8287fa098e8so160179285a.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Sep 2025 19:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758249254; x=1758854054; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5bVRfKQY0/aOL0E/ajNJO+Od53Oc5IAOl7Q7X90Wqsg=;
        b=mcJLdxxDQJmZf7/sPmVKOoT7qcC8b5Iixgz4zt0HgiHeljbnEngwon8Axa6tanqV5u
         ki9zIOwdIx0wKRiJOr0ZurhFfnnrzee5TfjitpWPpM9zT49oxDTtH4YqGAycS2C90m2t
         KIxtnsPAfDowAk9OCy9/mEJGmY9luU4dSVpPsqYf8mm87P3/BoxiVry8m+zsb31Wa/cb
         f0TFOR81oHZWuFGqaUa7B7a8CcgeTd4MWSgIXOxhZsb/vVBHQ9PzduzWRV2KZWzp6AG+
         uz7o6XBozBrcwHGo0y+AnauBYF2GAbFhcH+EJKl3EYbX0PUq5jqAg/CWqB/UFqqFnwyb
         Veig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758249254; x=1758854054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5bVRfKQY0/aOL0E/ajNJO+Od53Oc5IAOl7Q7X90Wqsg=;
        b=s8WT0ZEkFlS2GAoV1r70j9LH2srDqlFkuotMEkAzGcakgIJLH6l8W0M7Jb6o7ZcMtP
         3JyurFdvMm9V6G42zCqXTCpQWxtyPKg2MdIWThzaT968W3a4OBoWkTNjqAl3GD7dA+TL
         mfKAdKh37I5sj9CI3SDILOFknDz036yPWicwdaGw49+qFAJkM4yJAgV+MEcR+riEF8uW
         QlLNn2b+1VKhkPRsXMn1DYtSTgl3Wz0UTtzoVcXfq/qFzOdNuMCNVaPO8+rP0tKaj+tj
         3MNklhXKhi2VVO7zbOaJJIqeL1RGY21tBn0J5sT81WmaWhy+Dr0hPY1Nilxs6dHwp4cZ
         qrQA==
X-Gm-Message-State: AOJu0Yz7HfY0XjwVyjv+3a23SbY6tMJ6tI+sL5hubeJfBwIs15iqqK/H
	Cn4T/CZDOqkVVeoU+0Wf5d/Kkmd9ezlGYIjOFVSHlhuTqnFbovGntkQ2
X-Gm-Gg: ASbGncthGWNdEp7g9TaciaJS3Bp0l1KHKYdnilBoWhYPHXxrOa5FJGs+zexvitzSlim
	WHTkNztKbciuYa70gGBU9pCdt/DM/RGns43rlDHnUQzPWpfc+QGgDNHpxY3fxt3UgIieU6hXXIH
	hVcbXLl6vIIZrLmvdqWDJwzMF8WcUTBNOX+cFbOevBGmjvxGnpQSixSYPofrVNPGoXNE/bziYVH
	sCcwcWO8FskKYmJQi+Amn7mKjSTrf+Nj57eAZhKUhOy/9OJcX/XaXyjwWkizdk3qr/6tEGKd8Tf
	fypM71/ArxbwQhcuzSVXHxlmKOv7M1M8sSzHeMDgtrXoXZ0mhDyeLZIZA72rV1J6aK8e7b/xxLb
	b1VcOVsHRWPNpsW5BWNKLZnkWQrEmrxHsdODGrBCMl09DXGqvkSSsp2ZbNlq2ss0c1b9IT+AkUw
	bMEfgrSn0fRCjS5ZakwEdzbdweANBBExlR4dySvUMCuT4KJbYb/qcxJcDaADMs6A==
X-Google-Smtp-Source: AGHT+IEGjTGPwlXk2k4q9CeoQIGe19YEco7mC+9J2q7BSGtxkP6Z54iLKhoSmClCmGR5BUXglT/t1w==
X-Received: by 2002:a05:620a:1902:b0:7e8:9f7:da5d with SMTP id af79cd13be357-83ba29b652cmr209512185a.12.1758249253790;
        Thu, 18 Sep 2025 19:34:13 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8363198ad41sm262749585a.46.2025.09.18.19.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 19:34:13 -0700 (PDT)
Date: Thu, 18 Sep 2025 22:34:11 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
Cc: meta-virtualization@lists.yoctoproject.org, vchavda@cisco.com
Subject: Re: [meta-virtualization] [scarthgap] [PATCH] docker-moby: Fix
 CVE-2025-54410
Message-ID: <aMzBI9uYfIZ2W8qI@gmail.com>
References: <20250908070909.77349-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250908070909.77349-1-deeratho@cisco.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Sep 2025 02:34:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9403

In message: [meta-virtualization] [scarthgap] [PATCH] docker-moby: Fix CVE-2025-54410
on 08/09/2025 Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco) wrote:

> From: Deepak Rathore <deeratho@cisco.com>
> 
> Upstream Repository: https://github.com/moby/moby.git
> 
> Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-54410
> Type: Security Fix
> CVE: CVE-2025-54410
> Score: 3.3
> Patch:
> [1] https://github.com/moby/moby/commit/a012739c2cf3
> [2] https://github.com/moby/moby/commit/c761353e7c75
> [3] https://github.com/moby/moby/commit/41f080df250a
> [4] https://github.com/moby/moby/commit/651b2feb2731
> 
> Note:
> - The main fix is implemented in [4], which is part of version 25.0.
> - Commits [1], [2], and [3] are dependent patches also included in v25.0.
> - The FirewalldReload() function, essential for the fix in [4], was
> introduced in [3].
> - Commit [1] adds the iptables.go file, enabling the implementation of
> FirewalldReload() in [3].
> - The TestInternalNwConnectivity() test was first introduced in [2] and
> later updated in [3] to validate the firewall reload behavior.

This isn't answering the right question. scarthgap is on the
25.x series.

Are these fixes not integrated into that stable release ?

A very quick check shows they are:

% git tag --contains a012739c2cf3
v25.0.13

So we should not be doing these as patches, we should be
bumping the version of docker-moby.

Bruce

> 
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> ---
>  recipes-containers/docker/docker-moby_git.bb  |   4 +
>  .../files/CVE-2025-54410-dependent_p1.patch   |  38 ++
>  .../files/CVE-2025-54410-dependent_p2.patch   | 143 ++++++
>  .../files/CVE-2025-54410-dependent_p3.patch   | 451 ++++++++++++++++++
>  .../docker/files/CVE-2025-54410.patch         |  50 ++
>  5 files changed, 686 insertions(+)
>  create mode 100644 recipes-containers/docker/files/CVE-2025-54410-dependent_p1.patch
>  create mode 100644 recipes-containers/docker/files/CVE-2025-54410-dependent_p2.patch
>  create mode 100644 recipes-containers/docker/files/CVE-2025-54410-dependent_p3.patch
>  create mode 100644 recipes-containers/docker/files/CVE-2025-54410.patch
> 
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
> index d274b002..e4791319 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -58,6 +58,10 @@ SRC_URI = "\
>          file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
>          file://CVE-2024-36620.patch;patchdir=src/import \
>          file://CVE-2024-36621.patch;patchdir=src/import \
> +        file://CVE-2025-54410-dependent_p1.patch;patchdir=src/import \
> +        file://CVE-2025-54410-dependent_p2.patch;patchdir=src/import \
> +        file://CVE-2025-54410-dependent_p3.patch;patchdir=src/import \
> +        file://CVE-2025-54410.patch;patchdir=src/import \
>  	"
>  
>  DOCKER_COMMIT = "${SRCREV_moby}"
> diff --git a/recipes-containers/docker/files/CVE-2025-54410-dependent_p1.patch b/recipes-containers/docker/files/CVE-2025-54410-dependent_p1.patch
> new file mode 100644
> index 00000000..f1a7db3d
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2025-54410-dependent_p1.patch
> @@ -0,0 +1,38 @@
> +From 4ff88c2b9d85e162676fd54b773a4a3957b5c622 Mon Sep 17 00:00:00 2001
> +From: Rob Murray <rob.murray@docker.com>
> +Date: Wed, 26 Mar 2025 14:32:15 +0000
> +Subject: [PATCH 1/4] Add test util "FirewalldRunning"
> +
> +CVE: CVE-2025-54410
> +Upstream-Status: Backport [https://github.com/moby/moby/commit/a012739c2cf3]
> +
> +Signed-off-by: Rob Murray <rob.murray@docker.com>
> +(cherry picked from commit b8cacdf324c8309fb0555381889aa867391ba9fb)
> +Signed-off-by: Andrey Epifanov <aepifanov@mirantis.com>
> +(cherry picked from commit a012739c2cf347847d83ea77e30333528602c8a6)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + internal/testutils/networking/iptables.go | 12 ++++++++++++
> + 1 file changed, 12 insertions(+)
> + create mode 100644 internal/testutils/networking/iptables.go
> +
> +diff --git a/internal/testutils/networking/iptables.go b/internal/testutils/networking/iptables.go
> +new file mode 100644
> +index 0000000000..2e6ada8363
> +--- /dev/null
> ++++ b/internal/testutils/networking/iptables.go
> +@@ -0,0 +1,12 @@
> ++package networking
> ++
> ++import (
> ++	"os/exec"
> ++	"strings"
> ++	"testing"
> ++)
> ++
> ++func FirewalldRunning() bool {
> ++	state, err := exec.Command("firewall-cmd", "--state").CombinedOutput()
> ++	return err == nil && strings.TrimSpace(string(state)) == "running"
> ++}
> +--
> +2.44.3
> diff --git a/recipes-containers/docker/files/CVE-2025-54410-dependent_p2.patch b/recipes-containers/docker/files/CVE-2025-54410-dependent_p2.patch
> new file mode 100644
> index 00000000..e376338f
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2025-54410-dependent_p2.patch
> @@ -0,0 +1,143 @@
> +From 11125e7362281772f6d8cebaee3d8a1c07456e31 Mon Sep 17 00:00:00 2001
> +From: Rob Murray <rob.murray@docker.com>
> +Date: Wed, 7 Feb 2024 18:53:27 +0000
> +Subject: [PATCH 2/4] Make 'internal' bridge networks accessible from host
> +
> +Prior to release 25.0.0, the bridge in an internal network was assigned
> +an IP address - making the internal network accessible from the host,
> +giving containers on the network access to anything listening on the
> +bridge's address (or INADDR_ANY on the host).
> +
> +This change restores that behaviour. It does not restore the default
> +route that was configured in the container, because packets sent outside
> +the internal network's subnet have always been dropped. So, a 'connect()'
> +to an address outside the subnet will still fail fast.
> +
> +CVE: CVE-2025-54410
> +Upstream-Status: Backport [https://github.com/moby/moby/commit/c761353e7c75]
> +
> +Signed-off-by: Rob Murray <rob.murray@docker.com>
> +(cherry picked from commit 419f5a637230570ec44c32f889f981f67ce15793)
> +Signed-off-by: Albin Kerouanton <albinker@gmail.com>
> +(cherry picked from commit c761353e7c75e4ffa90b80f3b5df40473d59620a)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + integration/networking/bridge_test.go         | 57 +++++++++++++++++++
> + libnetwork/drivers/bridge/setup_ipv4_linux.go | 10 ++--
> + .../drivers/bridge/setup_verify_linux.go      |  4 +-
> + 3 files changed, 63 insertions(+), 8 deletions(-)
> +
> +diff --git a/integration/networking/bridge_test.go b/integration/networking/bridge_test.go
> +index e3d1fe2a36..8f54234406 100644
> +--- a/integration/networking/bridge_test.go
> ++++ b/integration/networking/bridge_test.go
> +@@ -477,3 +477,60 @@ func TestDefaultBridgeAddresses(t *testing.T) {
> +		})
> +	}
> + }
> ++
> ++// Test that a container on an 'internal' network has IP connectivity with
> ++// the host (on its own subnet, because the n/w bridge has an address on that
> ++// subnet, and it's in the host's namespace).
> ++// Regression test for https://github.com/moby/moby/issues/47329
> ++func TestInternalNwConnectivity(t *testing.T) {
> ++	skip.If(t, testEnv.DaemonInfo.OSType == "windows")
> ++
> ++	ctx := setupTest(t)
> ++
> ++	d := daemon.New(t)
> ++	d.StartWithBusybox(ctx, t, "-D", "--experimental", "--ip6tables")
> ++	defer d.Stop(t)
> ++
> ++	c := d.NewClientT(t)
> ++	defer c.Close()
> ++
> ++	const bridgeName = "intnw"
> ++	const gw4 = "172.30.0.1"
> ++	const gw6 = "fda9:4130:4715::1234"
> ++	network.CreateNoError(ctx, t, c, bridgeName,
> ++		network.WithInternal(),
> ++		network.WithIPv6(),
> ++		network.WithIPAM("172.30.0.0/24", gw4),
> ++		network.WithIPAM("fda9:4130:4715::/64", gw6),
> ++		network.WithDriver("bridge"),
> ++		network.WithOption("com.docker.network.bridge.name", bridgeName),
> ++	)
> ++	defer network.RemoveNoError(ctx, t, c, bridgeName)
> ++
> ++	const ctrName = "intctr"
> ++	id := container.Run(ctx, t, c,
> ++		container.WithName(ctrName),
> ++		container.WithImage("busybox:latest"),
> ++		container.WithCmd("top"),
> ++		container.WithNetworkMode(bridgeName),
> ++	)
> ++	defer c.ContainerRemove(ctx, id, containertypes.RemoveOptions{Force: true})
> ++
> ++	execCtx, cancel := context.WithTimeout(ctx, 20*time.Second)
> ++	defer cancel()
> ++
> ++	res := container.ExecT(execCtx, t, c, id, []string{"ping", "-c1", "-W3", gw4})
> ++	assert.Check(t, is.Equal(res.ExitCode, 0))
> ++	assert.Check(t, is.Equal(res.Stderr(), ""))
> ++	assert.Check(t, is.Contains(res.Stdout(), "1 packets transmitted, 1 packets received"))
> ++
> ++	res = container.ExecT(execCtx, t, c, id, []string{"ping6", "-c1", "-W3", gw6})
> ++	assert.Check(t, is.Equal(res.ExitCode, 0))
> ++	assert.Check(t, is.Equal(res.Stderr(), ""))
> ++	assert.Check(t, is.Contains(res.Stdout(), "1 packets transmitted, 1 packets received"))
> ++
> ++	// Addresses outside the internal subnet must not be accessible.
> ++	res = container.ExecT(execCtx, t, c, id, []string{"ping", "-c1", "-W3", "8.8.8.8"})
> ++	assert.Check(t, is.Equal(res.ExitCode, 1))
> ++	assert.Check(t, is.Contains(res.Stderr(), "Network is unreachable"))
> ++}
> +diff --git a/libnetwork/drivers/bridge/setup_ipv4_linux.go b/libnetwork/drivers/bridge/setup_ipv4_linux.go
> +index 0940745c23..6b925190ce 100644
> +--- a/libnetwork/drivers/bridge/setup_ipv4_linux.go
> ++++ b/libnetwork/drivers/bridge/setup_ipv4_linux.go
> +@@ -32,10 +32,6 @@ func setupBridgeIPv4(config *networkConfiguration, i *bridgeInterface) error {
> +	//             are decoupled, we should assign it only when it's really needed.
> +	i.bridgeIPv4 = config.AddressIPv4
> +
> +-	if config.Internal {
> +-		return nil
> +-	}
> +-
> +	if !config.InhibitIPv4 {
> +		addrv4List, err := i.addresses(netlink.FAMILY_V4)
> +		if err != nil {
> +@@ -57,8 +53,10 @@ func setupBridgeIPv4(config *networkConfiguration, i *bridgeInterface) error {
> +		}
> +	}
> +
> +-	// Store the default gateway
> +-	i.gatewayIPv4 = config.AddressIPv4.IP
> ++	if !config.Internal {
> ++		// Store the default gateway
> ++		i.gatewayIPv4 = config.AddressIPv4.IP
> ++	}
> +
> +	return nil
> + }
> +diff --git a/libnetwork/drivers/bridge/setup_verify_linux.go b/libnetwork/drivers/bridge/setup_verify_linux.go
> +index a39d750346..b7ddbcf814 100644
> +--- a/libnetwork/drivers/bridge/setup_verify_linux.go
> ++++ b/libnetwork/drivers/bridge/setup_verify_linux.go
> +@@ -20,12 +20,12 @@ func setupVerifyAndReconcileIPv4(config *networkConfiguration, i *bridgeInterfac
> +	addrv4, _ := selectIPv4Address(addrsv4, config.AddressIPv4)
> +
> +	// Verify that the bridge has an IPv4 address.
> +-	if !config.Internal && addrv4.IPNet == nil {
> ++	if addrv4.IPNet == nil {
> +		return &ErrNoIPAddr{}
> +	}
> +
> +	// Verify that the bridge IPv4 address matches the requested configuration.
> +-	if config.AddressIPv4 != nil && addrv4.IPNet != nil && !addrv4.IP.Equal(config.AddressIPv4.IP) {
> ++	if config.AddressIPv4 != nil && !addrv4.IP.Equal(config.AddressIPv4.IP) {
> +		return &IPv4AddrNoMatchError{IP: addrv4.IP, CfgIP: config.AddressIPv4.IP}
> +	}
> +
> +--
> +2.44.3
> diff --git a/recipes-containers/docker/files/CVE-2025-54410-dependent_p3.patch b/recipes-containers/docker/files/CVE-2025-54410-dependent_p3.patch
> new file mode 100644
> index 00000000..16d4768f
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2025-54410-dependent_p3.patch
> @@ -0,0 +1,451 @@
> +From 211e9acdef48b1229591724ba83fe4b6ad86c7b6 Mon Sep 17 00:00:00 2001
> +From: Rob Murray <rob.murray@docker.com>
> +Date: Fri, 14 Feb 2025 16:23:49 +0000
> +Subject: [PATCH 3/4] Restore iptables for current networks on firewalld reload
> +
> +Using iptables.OnReloaded to restore individual per-network rules
> +on firewalld reload means rules for deleted networks pop back in
> +to existence (because there was no way to delete the callbacks on
> +network-delete).
> +
> +So, on firewalld reload, walk over current networks and ask them
> +to restore their iptables rules.
> +
> +CVE: CVE-2025-54410
> +Upstream-Status: Backport [https://github.com/moby/moby/commit/41f080df250a]
> +
> +Signed-off-by: Rob Murray <rob.murray@docker.com>
> +(cherry picked from commit a527e5a546526117a0f3d7a33f3fcb8f4cd87c72)
> +
> +Test that firewalld reload doesn't re-create deleted iptables rules
> +
> +Signed-off-by: Rob Murray <rob.murray@docker.com>
> +(cherry picked from commit c3fa7c17794feaf4e27238aa3c6de42c606765fa)
> +
> +Signed-off-by: Andrey Epifanov <aepifanov@mirantis.com>
> +(cherry picked from commit 41f080df250aef805d34628d1719c369e9ff1585)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + integration/network/bridge_test.go            | 65 +++++++++++++++++++
> + integration/networking/bridge_test.go         |  4 ++
> + internal/testutils/networking/iptables.go     | 48 ++++++++++++++
> + .../testutils/networking/iptables_test.go     | 47 ++++++++++++++
> + libnetwork/drivers/bridge/bridge_linux.go     | 65 +++++++++++++++++--
> + libnetwork/drivers/bridge/setup_firewalld.go  | 41 ------------
> + .../drivers/bridge/setup_ip_tables_linux.go   |  3 +
> + libnetwork/iptables/firewalld.go              |  1 +
> + 8 files changed, 227 insertions(+), 47 deletions(-)
> + create mode 100644 internal/testutils/networking/iptables_test.go
> + delete mode 100644 libnetwork/drivers/bridge/setup_firewalld.go
> +
> +diff --git a/integration/network/bridge_test.go b/integration/network/bridge_test.go
> +index b09ff5766c..09b7da9c2b 100644
> +--- a/integration/network/bridge_test.go
> ++++ b/integration/network/bridge_test.go
> +@@ -6,11 +6,17 @@ import (
> +	"testing"
> +	"time"
> +
> ++	containertypes "github.com/docker/docker/api/types/container"
> +	networktypes "github.com/docker/docker/api/types/network"
> +	"github.com/docker/docker/api/types/versions"
> +	ctr "github.com/docker/docker/integration/internal/container"
> +	"github.com/docker/docker/integration/internal/network"
> ++	"github.com/docker/docker/internal/testutils/networking"
> ++	"github.com/docker/docker/libnetwork/drivers/bridge"
> ++	"github.com/docker/docker/testutil/daemon"
> ++	"github.com/docker/go-connections/nat"
> +	"gotest.tools/v3/assert"
> ++	"gotest.tools/v3/icmd"
> +	"gotest.tools/v3/skip"
> + )
> +
> +@@ -43,3 +49,62 @@ func TestCreateWithMultiNetworks(t *testing.T) {
> +	ifacesWithAddress := strings.Count(res.Stdout.String(), "\n")
> +	assert.Equal(t, ifacesWithAddress, 3)
> + }
> ++
> ++// TestFirewalldReloadNoZombies checks that when firewalld is reloaded, rules
> ++// belonging to deleted networks/containers do not reappear.
> ++func TestFirewalldReloadNoZombies(t *testing.T) {
> ++	skip.If(t, testEnv.DaemonInfo.OSType == "windows")
> ++	skip.If(t, !networking.FirewalldRunning(), "firewalld is not running")
> ++	skip.If(t, testEnv.IsRootless, "no firewalld in rootless netns")
> ++
> ++	ctx := setupTest(t)
> ++	d := daemon.New(t)
> ++	d.StartWithBusybox(ctx, t)
> ++	defer d.Stop(t)
> ++	c := d.NewClientT(t)
> ++
> ++	const bridgeName = "br-fwdreload"
> ++	removed := false
> ++	nw := network.CreateNoError(ctx, t, c, "testnet",
> ++		network.WithOption(bridge.BridgeName, bridgeName))
> ++	defer func() {
> ++		if !removed {
> ++			network.RemoveNoError(ctx, t, c, nw)
> ++		}
> ++	}()
> ++
> ++	cid := ctr.Run(ctx, t, c,
> ++		ctr.WithExposedPorts("80/tcp", "81/tcp"),
> ++		ctr.WithPortMap(nat.PortMap{"80/tcp": {{HostPort: "8000"}}}))
> ++	defer func() {
> ++		if !removed {
> ++			ctr.Remove(ctx, t, c, cid, containertypes.RemoveOptions{Force: true})
> ++		}
> ++	}()
> ++
> ++	iptablesSave := icmd.Command("iptables-save")
> ++	resBeforeDel := icmd.RunCmd(iptablesSave)
> ++	assert.NilError(t, resBeforeDel.Error)
> ++	assert.Check(t, strings.Contains(resBeforeDel.Combined(), bridgeName),
> ++		"With container: expected rules for %s in: %s", bridgeName, resBeforeDel.Combined())
> ++
> ++	// Delete the container and its network.
> ++	ctr.Remove(ctx, t, c, cid, containertypes.RemoveOptions{Force: true})
> ++	network.RemoveNoError(ctx, t, c, nw)
> ++	removed = true
> ++
> ++	// Check the network does not appear in iptables rules.
> ++	resAfterDel := icmd.RunCmd(iptablesSave)
> ++	assert.NilError(t, resAfterDel.Error)
> ++	assert.Check(t, !strings.Contains(resAfterDel.Combined(), bridgeName),
> ++		"After deletes: did not expect rules for %s in: %s", bridgeName, resAfterDel.Combined())
> ++
> ++	// firewall-cmd --reload, and wait for the daemon to restore rules.
> ++	networking.FirewalldReload(t, d)
> ++
> ++	// Check that rules for the deleted container/network have not reappeared.
> ++	resAfterReload := icmd.RunCmd(iptablesSave)
> ++	assert.NilError(t, resAfterReload.Error)
> ++	assert.Check(t, !strings.Contains(resAfterReload.Combined(), bridgeName),
> ++		"After deletes: did not expect rules for %s in: %s", bridgeName, resAfterReload.Combined())
> ++}
> +diff --git a/integration/networking/bridge_test.go b/integration/networking/bridge_test.go
> +index 8f54234406..8cdcf02096 100644
> +--- a/integration/networking/bridge_test.go
> ++++ b/integration/networking/bridge_test.go
> +@@ -10,6 +10,7 @@ import (
> +	containertypes "github.com/docker/docker/api/types/container"
> +	"github.com/docker/docker/integration/internal/container"
> +	"github.com/docker/docker/integration/internal/network"
> ++	"github.com/docker/docker/internal/testutils/networking"
> +	"github.com/docker/docker/testutil"
> +	"github.com/docker/docker/testutil/daemon"
> +	"gotest.tools/v3/assert"
> +@@ -160,6 +161,8 @@ func TestBridgeICC(t *testing.T) {
> +				Force: true,
> +			})
> +
> ++			networking.FirewalldReload(t, d)
> ++
> +			pingHost := tc.pingHost
> +			if pingHost == "" {
> +				if tc.linkLocal {
> +@@ -515,6 +518,7 @@ func TestInternalNwConnectivity(t *testing.T) {
> +		container.WithNetworkMode(bridgeName),
> +	)
> +	defer c.ContainerRemove(ctx, id, containertypes.RemoveOptions{Force: true})
> ++	networking.FirewalldReload(t, d)
> +
> +	execCtx, cancel := context.WithTimeout(ctx, 20*time.Second)
> +	defer cancel()
> +diff --git a/internal/testutils/networking/iptables.go b/internal/testutils/networking/iptables.go
> +index 2e6ada8363..2041e507c3 100644
> +--- a/internal/testutils/networking/iptables.go
> ++++ b/internal/testutils/networking/iptables.go
> +@@ -1,12 +1,60 @@
> + package networking
> +
> + import (
> ++	"fmt"
> +	"os/exec"
> ++	"regexp"
> +	"strings"
> +	"testing"
> ++	"time"
> ++
> ++	"github.com/docker/docker/testutil/daemon"
> ++	"golang.org/x/net/context"
> ++	"gotest.tools/v3/assert"
> ++	"gotest.tools/v3/icmd"
> ++	"gotest.tools/v3/poll"
> + )
> +
> + func FirewalldRunning() bool {
> +	state, err := exec.Command("firewall-cmd", "--state").CombinedOutput()
> +	return err == nil && strings.TrimSpace(string(state)) == "running"
> + }
> ++
> ++func extractLogTime(s string) (time.Time, error) {
> ++	// time="2025-07-15T13:46:13.414214418Z" level=info msg=""
> ++	re := regexp.MustCompile(`time="([^"]+)"`)
> ++	matches := re.FindStringSubmatch(s)
> ++	if len(matches) < 2 {
> ++		return time.Time{}, fmt.Errorf("timestamp not found in log line: %s, matches: %+v", s, matches)
> ++	}
> ++
> ++	return time.Parse(time.RFC3339Nano, matches[1])
> ++}
> ++
> ++// FirewalldReload reloads firewalld and waits for the daemon to re-create its rules.
> ++// It's a no-op if firewalld is not running, and the test fails if the reload does
> ++// not complete.
> ++func FirewalldReload(t *testing.T, d *daemon.Daemon) {
> ++	t.Helper()
> ++	if !FirewalldRunning() {
> ++		return
> ++	}
> ++	timeBeforeReload := time.Now()
> ++	res := icmd.RunCommand("firewall-cmd", "--reload")
> ++	assert.NilError(t, res.Error)
> ++
> ++	ctx := context.Background()
> ++	poll.WaitOn(t, d.PollCheckLogs(ctx, func(s string) bool {
> ++		if !strings.Contains(s, "Firewalld reload completed") {
> ++			return false
> ++		}
> ++		lastReload, err := extractLogTime(s)
> ++		if err != nil {
> ++			return false
> ++		}
> ++		if lastReload.After(timeBeforeReload) {
> ++			return true
> ++		}
> ++		return false
> ++	}))
> ++}
> +diff --git a/internal/testutils/networking/iptables_test.go b/internal/testutils/networking/iptables_test.go
> +new file mode 100644
> +index 0000000000..24a7bbb49d
> +--- /dev/null
> ++++ b/internal/testutils/networking/iptables_test.go
> +@@ -0,0 +1,47 @@
> ++package networking
> ++
> ++import (
> ++	"reflect"
> ++	"testing"
> ++	"time"
> ++)
> ++
> ++func Test_getTimeFromLogMsg(t *testing.T) {
> ++	tests := []struct {
> ++		name    string
> ++		s       string
> ++		want    time.Time
> ++		wantErr bool
> ++	}{
> ++		{
> ++			name:    "valid time",
> ++			s:       `time="2025-07-15T13:46:13.414214418Z" level=info msg=""`,
> ++			want:    time.Date(2025, 7, 15, 13, 46, 13, 414214418, time.UTC),
> ++			wantErr: false,
> ++		},
> ++		{
> ++			name:    "invalid format",
> ++			s:       `time="invalid-time-format" level=info msg=""`,
> ++			want:    time.Time{},
> ++			wantErr: true,
> ++		},
> ++		{
> ++			name:    "missing time",
> ++			s:       `level=info msg=""`,
> ++			want:    time.Time{},
> ++			wantErr: true,
> ++		},
> ++	}
> ++	for _, tt := range tests {
> ++		t.Run(tt.name, func(t *testing.T) {
> ++			got, err := extractLogTime(tt.s)
> ++			if (err != nil) != tt.wantErr {
> ++				t.Errorf("getTimeFromLogMsg() error = %v, wantErr %v", err, tt.wantErr)
> ++				return
> ++			}
> ++			if !reflect.DeepEqual(got, tt.want) {
> ++				t.Errorf("getTimeFromLogMsg() got = %v, want %v", got, tt.want)
> ++			}
> ++		})
> ++	}
> ++}
> +diff --git a/libnetwork/drivers/bridge/bridge_linux.go b/libnetwork/drivers/bridge/bridge_linux.go
> +index 005c726f2d..2b313c85bf 100644
> +--- a/libnetwork/drivers/bridge/bridge_linux.go
> ++++ b/libnetwork/drivers/bridge/bridge_linux.go
> +@@ -483,6 +483,8 @@ func (d *driver) configure(option map[string]interface{}) error {
> +	d.config = config
> +	d.Unlock()
> +
> ++	iptables.OnReloaded(d.handleFirewalldReload)
> ++
> +	return d.initStore(option)
> + }
> +
> +@@ -800,12 +802,6 @@ func (d *driver) createNetwork(config *networkConfiguration) (err error) {
> +		// Setup IP6Tables.
> +		{config.EnableIPv6 && d.config.EnableIP6Tables, network.setupIP6Tables},
> +
> +-		// We want to track firewalld configuration so that
> +-		// if it is started/reloaded, the rules can be applied correctly
> +-		{d.config.EnableIPTables, network.setupFirewalld},
> +-		// same for IPv6
> +-		{config.EnableIPv6 && d.config.EnableIP6Tables, network.setupFirewalld6},
> +-
> +		// Setup DefaultGatewayIPv4
> +		{config.DefaultGatewayIPv4 != nil, setupGatewayIPv4},
> +
> +@@ -1297,6 +1293,11 @@ func (d *driver) Leave(nid, eid string) error {
> + }
> +
> + func (d *driver) ProgramExternalConnectivity(nid, eid string, options map[string]interface{}) error {
> ++	// Make sure the network isn't deleted, or the in middle of a firewalld reload, while
> ++	// updating its iptables rules.
> ++	d.configNetwork.Lock()
> ++	defer d.configNetwork.Unlock()
> ++
> +	network, err := d.getNetwork(nid)
> +	if err != nil {
> +		return err
> +@@ -1348,6 +1349,11 @@ func (d *driver) ProgramExternalConnectivity(nid, eid string, options map[string
> + }
> +
> + func (d *driver) RevokeExternalConnectivity(nid, eid string) error {
> ++	// Make sure this function isn't deleting iptables rules while handleFirewalldReloadNw
> ++	// is restoring those same rules.
> ++	d.configNetwork.Lock()
> ++	defer d.configNetwork.Unlock()
> ++
> +	network, err := d.getNetwork(nid)
> +	if err != nil {
> +		return err
> +@@ -1381,6 +1387,53 @@ func (d *driver) RevokeExternalConnectivity(nid, eid string) error {
> +	return nil
> + }
> +
> ++func (d *driver) handleFirewalldReload() {
> ++	if !d.config.EnableIPTables && !d.config.EnableIP6Tables {
> ++		return
> ++	}
> ++
> ++	d.Lock()
> ++	nids := make([]string, 0, len(d.networks))
> ++	for _, nw := range d.networks {
> ++		nids = append(nids, nw.id)
> ++	}
> ++	d.Unlock()
> ++
> ++	for _, nid := range nids {
> ++		d.handleFirewalldReloadNw(nid)
> ++	}
> ++}
> ++
> ++func (d *driver) handleFirewalldReloadNw(nid string) {
> ++	// Make sure the network isn't being deleted, and ProgramExternalConnectivity/RevokeExternalConnectivity
> ++	// aren't modifying iptables rules, while restoring the rules.
> ++	d.configNetwork.Lock()
> ++	defer d.configNetwork.Unlock()
> ++
> ++	nw, err := d.getNetwork(nid)
> ++	if err != nil {
> ++		return
> ++	}
> ++	if d.config.EnableIPTables {
> ++		if err := nw.setupIP4Tables(nw.config, nw.bridge); err != nil {
> ++			log.G(context.TODO()).WithFields(log.Fields{
> ++				"network": nw.id,
> ++				"error":   err,
> ++			}).Warn("Failed to restore IPv4 per-port iptables rules on firewalld reload")
> ++		}
> ++	}
> ++	if d.config.EnableIP6Tables {
> ++		if err := nw.setupIP6Tables(nw.config, nw.bridge); err != nil {
> ++			log.G(context.TODO()).WithFields(log.Fields{
> ++				"network": nw.id,
> ++				"error":   err,
> ++			}).Warn("Failed to restore IPv6 per-port iptables rules on firewalld reload")
> ++		}
> ++	}
> ++	nw.portMapper.ReMapAll()
> ++	log.G(context.TODO()).Info("Restored iptables rules on firewalld reload")
> ++}
> ++
> + func (d *driver) link(network *bridgeNetwork, endpoint *bridgeEndpoint, enable bool) (retErr error) {
> +	cc := endpoint.containerConfig
> +	ec := endpoint.extConnConfig
> +diff --git a/libnetwork/drivers/bridge/setup_firewalld.go b/libnetwork/drivers/bridge/setup_firewalld.go
> +deleted file mode 100644
> +index db7843847c..0000000000
> +--- a/libnetwork/drivers/bridge/setup_firewalld.go
> ++++ /dev/null
> +@@ -1,41 +0,0 @@
> +-//go:build linux
> +-
> +-package bridge
> +-
> +-import (
> +-	"errors"
> +-
> +-	"github.com/docker/docker/libnetwork/iptables"
> +-)
> +-
> +-func (n *bridgeNetwork) setupFirewalld(config *networkConfiguration, i *bridgeInterface) error {
> +-	d := n.driver
> +-	d.Lock()
> +-	driverConfig := d.config
> +-	d.Unlock()
> +-
> +-	// Sanity check.
> +-	if !driverConfig.EnableIPTables {
> +-		return errors.New("no need to register firewalld hooks, iptables is disabled")
> +-	}
> +-
> +-	iptables.OnReloaded(func() { n.setupIP4Tables(config, i) })
> +-	iptables.OnReloaded(n.portMapper.ReMapAll)
> +-	return nil
> +-}
> +-
> +-func (n *bridgeNetwork) setupFirewalld6(config *networkConfiguration, i *bridgeInterface) error {
> +-	d := n.driver
> +-	d.Lock()
> +-	driverConfig := d.config
> +-	d.Unlock()
> +-
> +-	// Sanity check.
> +-	if !driverConfig.EnableIP6Tables {
> +-		return errors.New("no need to register firewalld hooks, ip6tables is disabled")
> +-	}
> +-
> +-	iptables.OnReloaded(func() { n.setupIP6Tables(config, i) })
> +-	iptables.OnReloaded(n.portMapperV6.ReMapAll)
> +-	return nil
> +-}
> +diff --git a/libnetwork/drivers/bridge/setup_ip_tables_linux.go b/libnetwork/drivers/bridge/setup_ip_tables_linux.go
> +index 328c58bced..42039e24ee 100644
> +--- a/libnetwork/drivers/bridge/setup_ip_tables_linux.go
> ++++ b/libnetwork/drivers/bridge/setup_ip_tables_linux.go
> +@@ -130,6 +130,9 @@ func (n *bridgeNetwork) setupIP6Tables(config *networkConfiguration, i *bridgeIn
> +		return errors.New("Cannot program chains, EnableIP6Tables is disabled")
> +	}
> +
> ++	if i.bridgeIPv6 == nil {
> ++		return nil
> ++	}
> +	maskedAddrv6 := &net.IPNet{
> +		IP:   i.bridgeIPv6.IP.Mask(i.bridgeIPv6.Mask),
> +		Mask: i.bridgeIPv6.Mask,
> +diff --git a/libnetwork/iptables/firewalld.go b/libnetwork/iptables/firewalld.go
> +index dc67240da6..d3b76426e5 100644
> +--- a/libnetwork/iptables/firewalld.go
> ++++ b/libnetwork/iptables/firewalld.go
> +@@ -132,6 +132,7 @@ func reloaded() {
> +	for _, pf := range onReloaded {
> +		(*pf)()
> +	}
> ++	log.G(context.TODO()).Info("Firewalld reload completed")
> + }
> +
> + // OnReloaded add callback
> +--
> +2.44.3
> diff --git a/recipes-containers/docker/files/CVE-2025-54410.patch b/recipes-containers/docker/files/CVE-2025-54410.patch
> new file mode 100644
> index 00000000..b1aa211c
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2025-54410.patch
> @@ -0,0 +1,50 @@
> +From a4b2c5a774213eb6594cdece17680e16961c8fcb Mon Sep 17 00:00:00 2001
> +From: Rob Murray <rob.murray@docker.com>
> +Date: Fri, 14 Feb 2025 16:50:43 +0000
> +Subject: [PATCH 4/4] Restore INC iptables rules on firewalld reload
> +
> +CVE: CVE-2025-54410
> +Upstream-Status: Backport [https://github.com/moby/moby/commit/651b2feb2731]
> +
> +Signed-off-by: Rob Murray <rob.murray@docker.com>
> +(cherry picked from commit 651b2feb27316cf907173c2a76cc6eb85f763663)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + integration/networking/bridge_test.go     | 1 +
> + libnetwork/drivers/bridge/bridge_linux.go | 9 +++++++++
> + 2 files changed, 10 insertions(+)
> +
> +diff --git a/integration/networking/bridge_test.go b/integration/networking/bridge_test.go
> +index 8cdcf02096..7c88cd8b43 100644
> +--- a/integration/networking/bridge_test.go
> ++++ b/integration/networking/bridge_test.go
> +@@ -294,6 +294,7 @@ func TestBridgeINC(t *testing.T) {
> +			defer c.ContainerRemove(ctx, id1, containertypes.RemoveOptions{
> +				Force: true,
> +			})
> ++			networking.FirewalldReload(t, d)
> +
> +			ctr1Info := container.Inspect(ctx, t, c, id1)
> +			targetAddr := ctr1Info.NetworkSettings.Networks[bridge1].IPAddress
> +diff --git a/libnetwork/drivers/bridge/bridge_linux.go b/libnetwork/drivers/bridge/bridge_linux.go
> +index 2b313c85bf..a8a12aebe3 100644
> +--- a/libnetwork/drivers/bridge/bridge_linux.go
> ++++ b/libnetwork/drivers/bridge/bridge_linux.go
> +@@ -1431,6 +1431,15 @@ func (d *driver) handleFirewalldReloadNw(nid string) {
> +		}
> +	}
> +	nw.portMapper.ReMapAll()
> ++
> ++	// Restore the inter-network connectivity (INC) rules.
> ++	if err := nw.isolateNetwork(true); err != nil {
> ++		log.G(context.TODO()).WithFields(log.Fields{
> ++			"network": nw.id,
> ++			"error":   err,
> ++		}).Warn("Failed to restore inter-network iptables rules on firewalld reload")
> ++	}
> ++
> +	log.G(context.TODO()).Info("Restored iptables rules on firewalld reload")
> + }
> +
> +--
> +2.44.3
> -- 
> 2.44.3
> 

